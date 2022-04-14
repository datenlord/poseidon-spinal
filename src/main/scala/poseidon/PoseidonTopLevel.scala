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
    isSim: Boolean, // indicate whether the generated codes are used for simulation
    constantMemType: Boolean = true, // indicate round constants' memory type
    // true:distributed memory false:block memory
    transmitterQueue: Int = 10, // the depth of queue in AXI4Transmitter
    flowQueue: Int = 20 // the depth of flow queue
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
    loopInst.io.input << input
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
  val threadOutput = PoseidonThread(g, serializerOutput.toFlow)
  //
  val (threadOutBuffer, occupancy) =
    threadOutput.queueWithOccupancy(g.flowQueue)
  val demuxInst = LoopbackDeMux(g)

  demuxInst.io.input << threadOutBuffer
  loopback << demuxInst.io.output0.s2mPipe().m2sPipe()
  io.output << demuxInst.io.output1.stage() //add a stage of register
}

class PoseidonTopLevel(config: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave(AXI4Stream(config.data_width))
    val output = master(AXI4Stream(config.data_width))
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

  // val loopInputs = Vec(Stream(MDSContext(config)), config.loop_num)
  // val select = OHToUInt(OHMasking.first(loopInputs.map(_.ready)))
  // (loopInputs lazyZip StreamDispatcherSequential(initialInput, config.loop_num))
  //   .foreach(_ <-< _)

  // val loopOutputs =
  //   for (i <- 0 until config.loop_num) yield PoseidonLoop(config, loopInputs(i))

  // val transmitterInput = StreamArbiterFactory.lowerFirst.on(loopOutputs)

  val initialInput = AXI4StreamReceiver(config, io.input)
  val loopOutput = PoseidonLoop(config, initialInput)

  io.output.connectFrom(AXI4StreamTransmitter(config, loopOutput.stage()))
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
      id_width = 8,
      isSim = false,
      constantMemType = false,
      transmitterQueue = 10,
      flowQueue = 20
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonTopLevel(config))
  }
}
