package poseidon

import spinal.core._
import spinal.lib._


case class AXI4Stream(data_width:Int) extends Bundle with IMasterSlave{
  val valid = Bool()
  val ready = Bool()
  val last  = Bool()
  val payload  = UInt(data_width bits)
  
  override def asMaster(): Unit = {
    out(valid,last,payload)
    in(ready)
  }
  
  def fire():Bool={
    return this.valid & this.ready
  }

  def connectFrom(that:AXI4Stream): Unit ={
    this.valid   := that.valid
    this.last    := that.last
    this.payload := that.payload
    that.ready   := this.ready
  }

}


case class PoseidonGenerics(t_max:Int, round_max:Int, thread_num:Int, data_width:Int,id_width:Int)
class BasicContext(g:PoseidonGenerics) extends Bundle{
  val round_index   = UInt(log2Up(g.round_max) bits)
  val state_index   = UInt(log2Up(g.t_max) bits)
  val state_size    = UInt(log2Up(g.t_max) bits)
  val state_id      = UInt(g.id_width bits)
}
class Context(g:PoseidonGenerics) extends BasicContext(g) {
  val state_element = UInt(g.data_width bits)
}


class DataLoopbackBuffer(g:PoseidonGenerics) extends Component {
  val io = new Bundle{
    val input = slave Stream(MDSContext(g))
    val outputs = Vec(master Stream(new Context(g)), g.thread_num)
    val residue = out UInt(log2Up(g.t_max) bits)
  }

  val buffer0 = Vec( Stream(new Context(g)), g.thread_num )
  val buffer1 = Vec( Stream(new Context(g)), g.thread_num )
  val buffer2 = Vec( Stream(new Context(g)), g.thread_num )
  val buffer3 = Vec( Stream(new Context(g)), g.thread_num )

  val inputs = Vec(Stream(new Context(g)),g.t_max)
  for (i <- 0 until g.t_max){
    inputs(i).valid := io.input.valid
    inputs(i).payload.assignSomeByName(io.input.payload)
    inputs(i).state_index := i
    inputs(i).state_element := io.input.state_elements(i)
  }
  
  io.input.ready := inputs.map(_.ready).asBits().andR

  for(i <- 0 until g.thread_num){
    buffer0(i) << inputs(i).stage()

    buffer1(i) << StreamArbiterFactory.lowerFirst.onArgs(buffer0(i),inputs(i+3).throwWhen(io.input.state_size<5 )).stage()
    buffer2(i) << StreamArbiterFactory.lowerFirst.onArgs(buffer1(i),inputs(i+6).throwWhen(io.input.state_size<9 )).stage()
    buffer3(i) << StreamArbiterFactory.lowerFirst.onArgs(buffer2(i),inputs(i+9).throwWhen(io.input.state_size<12)).stage()
  }

  // io.residue := g.t_max
  // when(buffer0.map(_.valid).andR){
  //   io.residue := 9
  // } elsewhen(buffer1.map(_.valid).andR){
  //   io.residue := 6
  // } elsewhen(buffer2.map(_.valid).andR){
  //   io.residue := 3
  // } elsewhen(buffer3.map(_.valid).andR){
  //   io.residue := 0
  // }
  // (io.outputs, buffer3).zipped.foreach(_<<_)
  val buffers = Vec(Vec(Stream(new Context(g)),g.thread_num),4)
  (buffers(0),buffer3).zipped.foreach(_<-<_)
  for(i<- 1 until 4) (buffers(i),buffers(i-1)).zipped.foreach(_<-<_)

  io.residue := g.t_max
  when(buffers(0).map(_.valid).andR){
    io.residue := 9
  } 
  when(buffers(1).map(_.valid).andR){
    io.residue := 6
  } 
  when(buffers(2).map(_.valid).andR){
    io.residue := 3
  } 
  when(buffers(3).map(_.valid).andR){
    io.residue := 0
  }

  (io.outputs, buffers(3)).zipped.foreach(_<<_)
}


class PoseidonTopLevel(config:PoseidonGenerics) extends Component {
  val io = new Bundle{
    val input = slave (AXI4Stream(config.data_width))
    val output = master (AXI4Stream(config.data_width))
  }

  val receiver = new AXI4StreamReceiver(config)
  receiver.io.input.connectFrom(io.input)

  val DataMux = new Area{

    val inputs0 = Vec(Stream(new Context(config)), config.thread_num)
    val inputs1_temp = Vec(Stream(new Context(config)), config.thread_num)
    (inputs1_temp, receiver.io.outputs).zipped.foreach(_<-/<_)
    val residue = UInt(log2Up(config.t_max) bits)
    val inputs1 = inputs1_temp.map(_.continueWhen((inputs1_temp(0).state_size-inputs1_temp(0).state_index)<=residue))

    val outputs = Vec(Stream(new Context(config)), config.thread_num)
    for(i <- 0 until config.thread_num){
      outputs(i) << StreamArbiterFactory.lowerFirst.onArgs(inputs0(i),inputs1(i))
    }
  }

  val DataProcess = new Area{
    val inputs = DataMux.outputs
    val output = Stream(MDSContext(config))
    val matrixAdder = new MDSMatrixAdders(config)
    matrixAdder.io.output >> output
    for(i <- 0 until config.thread_num){
      val thread = new PoseidonThread(config)
      thread.io.input << inputs(i)
      thread.io.output >> matrixAdder.io.inputs(i)
    }
  }

  val DataDeMux = new Area{
    val input = DataProcess.output
    val output0 = Stream(TransmitterContext(config))
    val output1 = Stream(MDSContext(config))

    val select = Bits(2 bits)
    output0.valid := input.valid & select(0)
    output1.valid := input.valid & select(1)
    input.ready := (output0.ready & select(0)) | (output1.ready & select(1))
    output0.state_id := input.state_id
    output0.state_element := input.state_elements(1)

    output1.payload.assignSomeByName(input.payload)
    output1.round_index.allowOverride
    output1.round_index := input.round_index + 1

    switch(input.state_size){
      is(3){
        select(0) := input.round_index === 62
        select(1) := input.round_index < 62
      }
      is(5){
        select(0) := input.round_index === 63
        select(1) := input.round_index < 63
      }
      is(9){
        select(0) := input.round_index === 64
        select(1) := input.round_index < 64
      }
      is(12){
        select(0) := input.round_index === 64
        select(1) := input.round_index < 64
      }
      default{
        select := 0
      }
    }
  }

  val loopbackBuffer = new DataLoopbackBuffer(config)
  loopbackBuffer.io.input << DataDeMux.output1
  (DataMux.inputs0, loopbackBuffer.io.outputs).zipped.foreach(_<<_)
  DataMux.residue := loopbackBuffer.io.residue

  val transmitter = new AXI4StreamTransmitter(config, buffer_depth = 6)
  transmitter.io.input << DataDeMux.output0
  io.output.connectFrom(transmitter.io.output)

}

object PoseidonTopLevelVerilog{
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(t_max = 12,round_max = 65,thread_num = 3,data_width = 255,id_width=7)
    
    SpinalConfig(
      mode=Verilog,
      targetDirectory="./src/main/verilog/PoseidonTopLevel"
      ).generate(new PoseidonTopLevel(config))
  }
}


object DataLoopbackBufferVerilog{
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(t_max = 12,round_max = 65,thread_num = 3,data_width = 255,id_width=4)
    SpinalConfig(
      mode=Verilog,
      targetDirectory="./src/main/verilog"
      ).generate(new DataLoopbackBuffer(config)).printPruned()
  }
}
