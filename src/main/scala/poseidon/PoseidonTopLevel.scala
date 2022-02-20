package poseidon

import spinal.core._
import spinal.lib._

case class AXI4Stream(data_width: Int) extends Bundle with IMasterSlave {
  val valid = Bool()
  val ready = Bool()
  val last = Bool()
  val payload = UInt(data_width bits)

  override def asMaster(): Unit = {
    out(valid, last, payload)
    in(ready)
  }

  def fire(): Bool = {
    this.valid & this.ready
  }

  def connectFrom(that: AXI4Stream): Unit = {
    this.valid := that.valid
    this.last := that.last
    this.payload := that.payload
    that.ready := this.ready
  }

}

case class PoseidonGenerics(
    t_max: Int,
    round_max: Int,
    loop_num: Int,
    data_width: Int,
    id_width: Int,
    isSim: Boolean // indicate whether the generated codes are used for simulation
)

class BasicContext(g: PoseidonGenerics) extends Bundle {
  val round_index = UInt(log2Up(g.round_max) bits)
  val state_index = UInt(log2Up(g.t_max) bits)
  val state_size = UInt(log2Up(g.t_max) bits)
  val state_id = UInt(g.id_width bits)
}

class Context(g: PoseidonGenerics) extends BasicContext(g) {
  val state_element = UInt(g.data_width bits)
}

case class LoopbackDeMux(g: PoseidonGenerics) extends Component {
  val io = new Bundle {
    val input = slave Stream (MDSContext(g))
    val output0 = master Stream (MDSContext(g))
    val output1 = master Stream (TransmitterContext(g))
  }
  val input = io.input

  val select = False
  val inputDemuxed = StreamDemux(input, select.asUInt, 2)
  switch(input.state_size) {
    is(3) {
      select := input.round_index === 62
    }
    is(5) {
      select := input.round_index === 63
    }
    is(9) {
      select := input.round_index === 64
    }
    is(12) {
      select := input.round_index === 64
    }
  }

  io.output0 << inputDemuxed(0).translateWith {
    val payload = MDSContext(g)
    payload.assignSomeByName(inputDemuxed(0).payload)
    payload.round_index.allowOverride
    payload.round_index := inputDemuxed(0).round_index + 1
    payload
  }

  io.output1 << inputDemuxed(1).translateWith {
    val payload = TransmitterContext(g)
    payload.state_element := inputDemuxed(1).state_elements(1)
    payload.state_id := inputDemuxed(1).state_id
    payload
  }
}

object PoseidonLoop {
  def apply(
      g: PoseidonGenerics,
      input: Stream[MDSContext]
  ): Stream[TransmitterContext] = {
    val loopInst = PoseidonLoop(g)
    loopInst.io.input <-< input
    loopInst.io.output
  }
}

case class PoseidonLoop(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Stream (MDSContext(g))
    val output = master Stream (TransmitterContext(g))
  }

  val loopback = Stream(MDSContext(g))
  // serialize the parallel data from loopInput or loopback

  val dataMuxed = StreamArbiterFactory.lowerFirst.onArgs(loopback, io.input)
  //
  val serializerOutput = PoseidonSerializer(g, dataMuxed)
  //
  val threadOutput = PoseidonThread(g, serializerOutput)
  //
  val demuxInst = LoopbackDeMux(g)
  demuxInst.io.input << threadOutput
  loopback << demuxInst.io.output0.queue(5)
  io.output << demuxInst.io.output1
}

class PoseidonTopLevel(config: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave(AXI4Stream(config.data_width))
    val output = master(AXI4Stream(config.data_width))
    //val output = master Stream(TransmitterContext(config))
  }

  ///////////////////////////////////
  // val receiverOutput = AXI4StreamReceiver(config, io.input)
  // val loopBacks = Vec(Stream(MDSContext(config)), config.loop_num)
  // val loopbackMuxed = StreamArbiterFactory.lowerFirst.on(loopBacks)

  // val initialInput = StreamArbiterFactory.lowerFirst.onArgs(loopbackMuxed, receiverOutput)

  // val loopInputs = Vec( Stream(MDSContext(config)), config.loop_num)
  // val select = OHToUInt(OHMasking.first(loopInputs.map(_.ready)))
  // (loopInputs lazyZip StreamDemux(initialInput, select, config.loop_num)).foreach(_<-/<_)

  // val loopOutputs = for(i <- 0 until config.loop_num) yield PoseidonLoop(config, loopInputs(i), loopBacks(i))

  // val transmitterInput = StreamArbiterFactory.lowerFirst.on(loopOutputs)
  // //io.output.connectFrom( AXI4StreamTransmitter(config, 8, transmitterInput) )
  // io.output << transmitterInput

  ////////////////////////////////
  val initialInput = AXI4StreamReceiver(config, io.input)

  val loopInputs = Vec(Stream(MDSContext(config)), config.loop_num)
  val select = OHToUInt(OHMasking.first(loopInputs.map(_.ready)))
  (loopInputs lazyZip StreamDemux(initialInput, select, config.loop_num))
    .foreach(_ <-/< _)

  val loopOutputs =
    for (i <- 0 until config.loop_num) yield PoseidonLoop(config, loopInputs(i))

  val transmitterInput = StreamArbiterFactory.lowerFirst.on(loopOutputs)
  io.output.connectFrom(AXI4StreamTransmitter(config, 8, transmitterInput))
  //io.output << transmitterInput

  // val receiverData = AXI4StreamReceiver(config, io.input) // 2
  // val loopbackData = Stream(MDSContext(config))
  // val dataMuxed = StreamArbiterFactory.lowerFirst.onArgs(loopbackData, receiverData)

  // // serialize the parallel data from receiver or loopback
  // val serializerOutput = PoseidonSerializer(config, dataMuxed) // 1

  // //
  // val threadOutput = PoseidonThread(config, serializerOutput) // 1+4

  // val dataDemuxed = LoopbackDeMux(config)
  // dataDemuxed.io.input << threadOutput

  // loopbackData << dataDemuxed.io.output0.queue(8)
  // io.output.connectFrom(AXI4StreamTransmitter(config, 12, dataDemuxed.io.output1))

  // val DataDeMux = new Area{
  //   val input = threadOutput

  //   val select = False
  //   val inputDemuxed = StreamDemux(input, select.asUInt, 2)
  //   switch(input.state_size){
  //     is(3){
  //       select := input.round_index === 62
  //     }
  //     is(5){
  //       select := input.round_index === 63
  //     }
  //     is(9){
  //       select := input.round_index === 64
  //     }
  //     is(12){
  //       select := input.round_index === 64
  //     }
  //   }

  //   val output0 = inputDemuxed(0).translateWith{
  //     val payload = MDSContext(config)
  //     payload.assignSomeByName(inputDemuxed(0).payload)
  //     payload.round_index.allowOverride
  //     payload.round_index := inputDemuxed(0).round_index + 1
  //     payload
  //   }

  //   val output1 = inputDemuxed(1).translateWith{
  //     val payload = TransmitterContext(config)
  //     payload.state_element := inputDemuxed(1).state_elements(1)
  //     payload.state_id := inputDemuxed(1).state_id
  //     payload
  //   }
  // }

  // loopbackData << DataDeMux.output0.queue(8)
  // io.output.connectFrom(AXI4StreamTransmitter(config, 12, DataDeMux.output1))
}

object LoopbackDeMuxVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 3,
      data_width = 255,
      id_width = 7,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(LoopbackDeMux(config))
  }
}

object PoseidonTopLevelVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 3,
      data_width = 255,
      id_width = 7,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonTopLevel(config))
  }
}
