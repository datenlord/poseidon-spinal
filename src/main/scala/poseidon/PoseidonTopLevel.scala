package poseidon

import spinal.core._
import spinal.lib._

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

  val maxRoundIndex: Map[Int, Int] = Map(
    3 -> 62,
    5 -> 63,
    9 -> 64,
    12 -> 64
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
    latency = 6,
    moduleName = "mult_gen_0"
  )

  val mul1 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    latency = 6,
    moduleName = "mult_gen_1"
  )

  val fifo = FifoIPConfig(
    byteWidth = 35, 
    depth = 128,
    name = "axis_data_fifo_0"
  )
  
  val fifo1 = FifoIPConfig(
    byteWidth = 34, 
    depth = 16,
    name = "axis_data_fifo_1"
  )

  val fifo2 = FifoIPConfig(
    byteWidth = 33,
    depth = 128,
    name = "axis_data_fifo_2"
  )

}

case class AXI4Stream(dataWidth: Int) extends Bundle {
  val tlast = Bool()
  val tdata = UInt(dataWidth bits)
}

case class BasicContext(g: PoseidonGenerics) extends Bundle {
  val roundIndex = UInt(log2Up(g.roundMax) bits)
  val stateIndex = UInt(log2Up(g.sizeMax) bits)
  val stateSize  = UInt(log2Up(g.sizeMax) bits)
  val stateId = UInt(g.idWidth bits)
}

case class Context(g: PoseidonGenerics) extends Bundle{
  val roundIndex   = UInt(log2Up(g.roundMax) bits)
  val stateIndex   = UInt(log2Up(g.sizeMax) bits)
  val stateSize    = UInt(log2Up(g.sizeMax) bits)
  val stateId      = UInt(g.idWidth bits)
  val stateElement = UInt( g.dataWidth bits)
}



object PoseidonDispatcher{
  def apply(g:PoseidonGenerics, portCount:Int, input:Stream[Context]):Vec[Stream[Context]]={
    val dispatcher = PoseidonDispatcher(g, portCount)
    dispatcher.io.input << input
    dispatcher.io.outputs
  }
}

case class PoseidonDispatcher(g:PoseidonGenerics, portCount:Int) extends Component{

  val io = new Bundle{
    val input = slave Stream(Context(g))
    val outputs = Vec(master Stream(Context(g)), portCount)
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
    val input  = slave  Stream(AXI4Stream(config.dataWidth))
    val output = master Stream(AXI4Stream(config.dataWidth))
  }

  val initialInput = AXI4StreamReceiver(config, io.input)
  val loopInputs = PoseidonDispatcher(config, config.loopNum, initialInput)
  val loopOutputs = loopInputs.map(PoseidonLoop(config, _))
  val loopOutput = StreamArbiterFactory.lowerFirst.on(loopOutputs).stage()

  val transmitterInput = loopOutput.translateWith{
    val payload = TransmitterContext(config)
    payload.assignSomeByName(loopOutput.payload)
    payload
  }
  
  io.output << AXI4StreamTransmitter(config, transmitterInput)
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
      isSim = false,
      constantMemType = true,
      transmitterQueue = 128,
      flowQueue = 30
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

