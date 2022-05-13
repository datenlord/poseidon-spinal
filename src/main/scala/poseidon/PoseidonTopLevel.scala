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

object PoseidonParam {
  val fullRound: Int = 8  // the number of full rounds in Poseidon
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
    16
  )
  val compensation = BigInt(
    "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
    16
  )
  val modInverse = BigInt(
    "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
    16
  )
}

case class PoseidonGenerics
(
  sizeMax: Int,   // maximum size of internal state
  roundMax: Int,  // maximum number of rounds
  loopNum: Int,   // maximum number of PoseidonLoops
  dataWidth: Int, // the width of state element
  idWidth: Int,   // the width of ID
  isSim: Boolean, // indicate whether the generated codes are used for simulation
  constantMemType: Boolean = true, // indicate round constants' memory type 
                                   // true:block memory false:distributed memory
  peNum:Int = 6, // the number of PEs in MDSMatrixMultiplier
  mdsOperandLatency:Int = 66, // total latency of operand in MDSMixing
  transmitterQueue: Int = 10, // the depth of queue in AXI4Transmitter
  flowQueue: Int = 30 // the depth of flow queue
)

object XilinxIPConfig{
  val adder0 = AdderIPConfig(
    inputWidth = 255,
    outputWidth = 256,
    latency = 5,
    moduleName = "c_addsub_0"
  )

  val mul0 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    isCE = false,
    isSCLR = false,
    pipeStages = 6,
    moduleName = "mult_gen_0"
  )

  val mul1 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    isCE = false,
    isSCLR = false,
    pipeStages = 6,
    moduleName = "mult_gen_1"
  )

  val fifo = FifoIPConfig(
    byteWidth = 77, 
    depth = 64,
    name = "axis_data_fifo_0"
  )

}


class BasicContext(g: PoseidonGenerics) extends Bundle {
  val roundIndex = UInt(log2Up(g.roundMax) bits)
  val stateIndex = UInt(log2Up(g.sizeMax) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateId = UInt(g.idWidth bits) // TODO: Remove stateId from Context
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
  val select = False
  val inputDemuxed = StreamDemux(input, select.asUInt, 2)
  switch(input.stateSize) {
    is(3) {
      select := input.roundIndex === 62
    }
    is(5) {
      select := input.roundIndex === 63
    }
    is(9) {
      select := input.roundIndex === 64
    }
    is(12) {
      select := input.roundIndex === 64
    }
  }

  io.output0 << inputDemuxed(0).translateWith {
    val payload = MDSContext(g)
    payload.assignSomeByName(inputDemuxed(0).payload)
    payload.roundIndex.allowOverride
    payload.roundIndex := inputDemuxed(0).roundIndex + 1
    payload
  }

  io.output1 << inputDemuxed(1).translateWith {
    val payload = TransmitterContext(g)
    payload.state_element := inputDemuxed(1).stateElements(1)
    payload.state_id := inputDemuxed(1).stateId
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

  val (serializerOutput, isDelayEmpty) = PoseidonSerializer(g, dataMuxed)
  //
  val threadOutput = PoseidonThread(g, serializerOutput.toFlow)
  
  val demuxInst = LoopbackDeMux(g)

  demuxInst.io.input << threadOutput.toStream
  loopback << BundleFifo(demuxInst.io.output0, XilinxIPConfig.fifo, g.isSim)
  io.output << demuxInst.io.output1.stage() //add a stage of register
}

object PoseidonDispatcher{
  def apply(g:PoseidonGenerics, portCount:Int, input:Stream[MDSContext]):Vec[Stream[MDSContext]]={
    val dispatcher = PoseidonDispatcher(g, portCount)
    dispatcher.io.input << input
    dispatcher.io.outputs
  }
}

case class PoseidonDispatcher(g:PoseidonGenerics, portCount:Int) extends Component{
  val io = new Bundle{
    val input = slave Stream(MDSContext(g))
    val outputs = Vec(master Stream(MDSContext(g)), portCount)
  }

  io.input.ready := io.outputs.map(_.ready).reduce(_||_)
  for(i <- 0 until portCount){
    io.outputs(i).payload := io.input.payload
    if(i==0){
      io.outputs(i).valid := io.input.valid
    }else{
      val validMask = (0 until i).map(io.outputs(_).ready).reduce(_||_)
      io.outputs(i).valid := io.input.valid & (!validMask)
    }
  }
}

class PoseidonTopLevel(config: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave(AXI4Stream(config.dataWidth))
    val output = master(AXI4Stream(config.dataWidth))
  }
  

  // val initialInput = AXI4StreamReceiver(config, io.input)
  // val loopOutput = PoseidonLoop(config, initialInput)

  val initialInput = AXI4StreamReceiver(config, io.input)
  val loopInputs = PoseidonDispatcher(config, config.loopNum, initialInput)
  val loopOutputs = loopInputs.map(PoseidonLoop(config, _))
  val loopOutput = StreamArbiterFactory.lowerFirst.on(loopOutputs)


  io.output.connectFrom(AXI4StreamTransmitter(config, loopOutput.stage()))
}

object LoopbackDeMuxVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 3,
      dataWidth = 255,
      idWidth = 7,
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
      roundMax = 65,
      loopNum = 2,
      dataWidth = 255,
      idWidth = 8,
      isSim = true,
      constantMemType = true,
      transmitterQueue = 25,
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
