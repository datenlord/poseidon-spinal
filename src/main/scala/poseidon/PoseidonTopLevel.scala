package poseidon

import spinal.core._
import spinal.lib._
//import spinal.lib.fsm._

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

object PoseidonParam {
  val fullRound: Int = 8 // the number of full rounds in Poseidon
  val halfRoundf: Int = 4 // half of the number of full rounds
  val sizeRange: Array[Int] = Array(3, 5, 9, 12)
  val partialRoundMap: Map[Int, Int] = Map(
    3 -> 55,
    5 -> 56,
    9 -> 57,
    12 -> 57
  )
  val modulus = BigInt(
    "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
    radix = 16
  )
  val compensation = BigInt(
    "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
    radix = 16
  )
  val modInverse = BigInt(
    "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
    radix = 16
  )
}

case class PoseidonGenerics(
    sizeMax: Int, // maximum size of internal state
    roundp: Int, // maximum number of partial rounds
    roundf: Int, // maxium number of full rounds
    dataWidth: Int, // width of state element
    idWidth: Int, // width of state id
    isSim: Boolean, // indicate whether the generated codes are used for simulation
    loopNum: Int = 1, // the number of PoseidonLoop
    constantMemType: Boolean = true, // indicate round constants' memory type
    // true:distributed memory false:block memory
    transmitterQueue: Int = 10, // the depth of queue in AXI4Transmitter
    flowQueue: Int = 20 // the depth of flow queue
)

class BasicContext(g: PoseidonGenerics) extends Bundle {
  val isFull = Bool()
  val fullRound = UInt(log2Up(g.roundf) bits)
  val partialRound = UInt(log2Up(g.roundp) bits)
  val stateIndex = UInt(log2Up(g.sizeMax) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateID = UInt(g.idWidth bits)
  val stateElements = Vec(UInt(g.dataWidth bits), g.sizeMax - 1)
}

class Context(g: PoseidonGenerics) extends BasicContext(g) {
  val stateElement = UInt(g.dataWidth bits)
}

case class LoopbackDeMux(g: PoseidonGenerics) extends Component {
  val io = new Bundle {
    val input = slave Stream (MDSContext(g))
    val output0 = master Stream (MDSContext(g))
    val output1 = master Stream (TransmitterContext(g))
  }
  val input = io.input

  val select = input.fullRound === (PoseidonParam.fullRound - 1)
  val inputDemuxed = StreamDemux(input, select.asUInt, 2)

  io.output0 << inputDemuxed(0).translateWith {
    val next = MDSContext(g)
    next.assignSomeByName(input.payload)
    next.partialRound.allowOverride
    next.fullRound.allowOverride
    next.isFull.allowOverride

    val isLastPartial = PoseidonParam.sizeRange
      .map(size =>
        (input.stateSize === size) & (input.partialRound === (PoseidonParam
          .partialRoundMap(size) - 1))
      )
      .toSeq
    next.isFull := (input.fullRound < (PoseidonParam.halfRoundf - 1)) | isLastPartial
      .asBits()
      .orR
    next.fullRound := input.fullRound + next.isFull.asUInt
    next.partialRound := input.partialRound + (!next.isFull).asUInt
    next
  }

  io.output1 << inputDemuxed(1).translateWith {
    val payload = TransmitterContext(g)
    payload.stateElement := inputDemuxed(1).stateElements(1)
    payload.stateID := inputDemuxed(1).stateID
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

  val adderIPConfig1 = AdderIPConfig(
    inputWidth = 255,
    outputWidth = 256,
    latency = 8,
    moduleName = "c_addsub_1"
  )

  // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
  val modAdderConfig = ModAdderConfig(
    dataWidth = g.dataWidth,
    modulus = PoseidonParam.modulus,
    compensation = PoseidonParam.compensation,
    isSim = g.isSim
  )

  val loopbackBuffer = Stream(MDSContext(g))

  val dataMuxed =
    StreamArbiterFactory.lowerFirst.onArgs(loopbackBuffer, io.input)
  //serialize the parallel data from loopInput or loopback
  val serializerOutput = PoseidonSerializer(g, dataMuxed) // 1 stage

  //add pre round constants
  // val preRoundConstStage = new Area{ // 2 stages
  //   val input = serializerOutput.toFlow
  //   val preRoundConst = PreRoundConstantMem(g, input.stateSize, input.stateIndex)
  //   val adderInput = input.translateWith(operands(input.stateElement, preRoundConst))
  //   val adderRes = ModAdderPipedFlow(g.dataWidth, adderInput)
  //   val addContextDelayed = Delay(input.payload, ModAdderPipedFlow.latency)
  //   val output = adderRes.translateWith(addContextDelayed)
  //   when(addContextDelayed.fullRound===0){
  //     output.stateElement := adderRes.res
  //   }
  // }

  val preRoundConstStage = new Area { // 2 stages
    val input = serializerOutput.toFlow
    val preRoundConst =
      PreRoundConstantMem(g, input.stateSize, input.stateIndex)
    val adderInput =
      input.translateWith(operands(input.stateElement, preRoundConst))

    val adderInst = ModularAdderFlow(modAdderConfig, adderIPConfig1)
    adderInst.io.input << adderInput
    val addContextDelayed = Delay(input.payload, adderInst.totalLatency)
    val output = adderInst.io.output.translateWith(addContextDelayed)
    when(addContextDelayed.fullRound === 0) {
      output.stateElement := adderInst.io.output.res
    }
  }

  val threadOutput = PoseidonThread(g, preRoundConstStage.output)

  val demuxInst = LoopbackDeMux(g)
  demuxInst.io.input << threadOutput.toStream
  val loopback = demuxInst.io.output0.s2mPipe().m2sPipe()
  io.output << demuxInst.io.output1.stage() //add a stage of register

  val fifoIPConfig = FifoIPConfig(
    byteWidth = 193,
    depth = 256,
    isSim = g.isSim,
    name = "axis_data_fifo_0"
  )
  loopbackBuffer << BundleFifo(loopback, fifoIPConfig)
}

class PoseidonTopLevel(config: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave(AXI4Stream(config.dataWidth))
    val output = master(AXI4Stream(config.dataWidth))
  }

  val initialInput = AXI4StreamReceiver(config, io.input)
  val loopOutput = PoseidonLoop(config, initialInput)

  io.output.connectFrom(AXI4StreamTransmitter(config, loopOutput.stage()))
}

object LoopbackDeMuxVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundp = 57,
      roundf = 8,
      dataWidth = 255,
      idWidth = 8,
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
      sizeMax = 12,
      roundp = 57,
      roundf = 8,
      dataWidth = 255,
      idWidth = 8,
      isSim = true,
      loopNum = 1,
      constantMemType = true,
      transmitterQueue = 8,
      flowQueue = 20
    )

    val clockDomainConfig = ClockDomainConfig(
      resetKind = SYNC,
      resetActiveLevel = LOW
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/",
      defaultConfigForClockDomains = clockDomainConfig
    ).generate(new PoseidonTopLevel(config))
  }
}
