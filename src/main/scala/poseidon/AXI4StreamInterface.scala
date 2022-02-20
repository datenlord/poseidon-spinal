package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object AXI4StreamReceiver{
  def apply(g:PoseidonGenerics, input:AXI4Stream):Stream[MDSContext]={
    val receiver = new AXI4StreamReceiver(g)
    receiver.io.input.connectFrom(input)
    receiver.io.output
  }
}

class AXI4StreamReceiver(g:PoseidonGenerics) extends Component{

  val io = new Bundle{
    val input  = slave ( AXI4Stream(g.data_width) )
    val output = master Stream(MDSContext(g))
  }

  // deserialize the serial input from AXIStream Bus to get stateSize
  val receiver = new Area{
    val output = Stream(MDSContext(g))

    val sizeCounter = Reg(UInt(log2Up(g.t_max) bits)) init(0)
    val idCounter = Reg(UInt(g.id_width bits)) init(0)
    val buffer = Vec(Reg(UInt(g.data_width bits)), g.t_max)
    buffer.foreach(_ init(0))

    val receiverFSM = new StateMachine{
      io.input.ready := False
      output.valid := False
      output.state_id := 0
      output.state_size := 0
      output.state_elements.foreach(_:=0)
      output.round_index := 0

      val BUSY = new State with EntryPoint
      val DONE = new State

      BUSY
        .whenIsActive{
          io.input.ready := True
          when(io.input.fire()){
            buffer(sizeCounter) := io.input.payload
            sizeCounter := sizeCounter + 1
            when(io.input.last){ goto(DONE) }
          }
        }

      DONE
        .whenIsActive{
          output.valid := True
          output.state_size := sizeCounter
          output.state_id := idCounter
          (output.state_elements lazyZip buffer).foreach(_:=_)

          when(output.fire){
            io.input.ready := True
            buffer.foreach(_:=0)
            idCounter := idCounter + 1
            sizeCounter := 0
            goto(BUSY)
            when(io.input.fire()){
              buffer(0) := io.input.payload
              sizeCounter := 1
            }
          }
        }
    }
  }

  io.output << receiver.output.stage()
}

case class TransmitterContext(g: PoseidonGenerics) extends Bundle {
  val state_id = UInt(g.id_width bits)
  val state_element = UInt(g.data_width bits)
}

object AXI4StreamTransmitter{
  def apply(g:PoseidonGenerics,
            buffer_depth:Int,
            input:Stream[TransmitterContext]
           ):AXI4Stream = {
    val transmitterInst = new AXI4StreamTransmitter(g, buffer_depth)
    transmitterInst.io.input << input
    transmitterInst.io.output
  }
}

class AXI4StreamTransmitter(g: PoseidonGenerics, buffer_depth: Int) extends Component {

  val io = new Bundle {
    val input = slave Stream (TransmitterContext(g))
    val output = master(AXI4Stream(g.data_width))
  }

  val idCounter = Reg(UInt(g.id_width bits)) init (0)
  when(io.output.fire()) {
    idCounter := idCounter + 1
  }
  val input_demux = Vec(Stream(TransmitterContext(g)), buffer_depth)
  val demux_select = OHToUInt(OHMasking.first(input_demux.map(_.ready)))

  input_demux
    .lazyZip(StreamDemux(io.input, demux_select, buffer_depth))
    .foreach(_ << _)

  val buffer = input_demux.map(_.stage())
  val select = OHToUInt(
    buffer
      .map(_.valid)
      .lazyZip(buffer.map(_.state_id))
      .map(_ & _ === idCounter)
      
  )
  val buffer_out = StreamMux(select, buffer)

  io.output.valid := buffer_out.valid && buffer_out.state_id === idCounter
  io.output.last := True
  io.output.payload := buffer_out.state_element
  buffer_out.ready := io.output.ready && buffer_out.state_id === idCounter
}

object AXI4StreamReceiverVerilog {

  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 3,
      data_width = 255,
      id_width = 5,
      isSim = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new AXI4StreamReceiver(config))
  }
}

object AXI4StreamTransmitterVerilog {

  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 3,
      data_width = 255,
      id_width = 5,
      isSim = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new AXI4StreamTransmitter(config, 5))
  }
}

