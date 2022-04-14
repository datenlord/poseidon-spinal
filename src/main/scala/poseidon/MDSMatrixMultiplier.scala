package poseidon

import spinal.core._
import spinal.lib._

case class MDSContext(g: PoseidonGenerics) extends Bundle {
  val isFull = Bool()
  val fullRound = UInt(log2Up(g.roundf) bits)
  val partialRound = UInt(log2Up(g.roundp) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateID = UInt(g.idWidth bits)
  val stateElements = Vec(UInt(g.dataWidth bits), g.sizeMax)
}

case class MDSMulContext(g: PoseidonGenerics) extends Bundle {
  val isFull = Bool()
  val fullRound = UInt(log2Up(g.roundf) bits)
  val partialRound = UInt(log2Up(g.roundp) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateID = UInt(g.idWidth bits)
  val stateElements = Vec(UInt(g.dataWidth bits), g.sizeMax - 1)
}

object MDSMatrixMultiplier {
  def apply(
      g: PoseidonGenerics,
      mulConfig: MontMultConfig,
      ipConfig: MulIPConfig,
      input: Flow[ContextCase]
  ): Flow[MDSContext] = {
    val MDSMultiplierInst = MDSMatrixMultiplier(g, mulConfig, ipConfig)
    MDSMultiplierInst.io.input << input
    MDSMultiplierInst.io.output
  }
}

case class MDSMatrixMultiplier( // 49 stages
    g: PoseidonGenerics,
    mulConfig: MontMultConfig,
    ipConfig: MulIPConfig
) extends Component {

  val io = new Bundle {
    val input = slave Flow (ContextCase(g))
    val output = master Flow (MDSContext(g))
  }

  val adderIPConfig = AdderIPConfig(
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

  val constants = MDSConstantMem(g)
  constants.io.addr.assignSomeByName(io.input.payload)
  val mulInputs = for (i <- 0 until g.sizeMax) yield {
    io.input.translateWith(
      operands(io.input.stateElement, constants.io.data(i))
    )
  }

  when(!io.input.isFull) {
    when(io.input.stateSize === 3) {
      for (i <- 3 until 5) mulInputs(i).op1 := io.input.stateElements(i - 3)
    } elsewhen (io.input.stateSize === 5) {
      for (i <- 5 until 9) mulInputs(i).op1 := io.input.stateElements(i - 5)
    } elsewhen (io.input.stateIndex === 1) {
      for (i <- 1 until g.sizeMax)
        mulInputs(i).op1 := io.input.stateElements(i - 1)
    }

  }

  // modular multipliers: 47 stages
  val mulOutputs = mulInputs.map(MontgomeryMultFlow(mulConfig, ipConfig, _))

  val mulContext = MDSMulContext(g)
  mulContext.assignSomeByName(io.input.payload)
  when(
    !io.input.isFull && io.input.stateSize > 5 && io.input.stateIndex === 1
  ) {
    mulContext.stateElements.assignFromBits(
      B(0, (g.sizeMax - 1) * g.dataWidth bits)
    )
  }
  val mulContextDelayed = Delay(mulContext, mulOutputs(0)._2)

  // modular adders: 2 stages
  val adderOutputs =
    for (i <- 1 until g.sizeMax)
      yield ModAdderPiped(
        modAdderConfig,
        adderIPConfig,
        mulOutputs(i)._1.res,
        mulContextDelayed.stateElements(i - 1)
      )

  val mulOutput0 = Flow(results(g.dataWidth))
  mulOutput0.valid := mulOutputs.map(_._1.valid).asBits().andR
  mulOutput0.res := mulOutputs(0)._1.res
  val mulOutput0Delayed = Delay(mulOutput0, adderOutputs(0)._2)
  val addContext = MDSAddContext(g)
  addContext.assignSomeByName(mulContextDelayed)
  val addContextDelayed = Delay(addContext, adderOutputs(0)._2)

  io.output := mulOutput0Delayed.translateWith {
    val payload = MDSContext(g)
    payload.assignSomeByName(addContextDelayed)
    payload.stateElements.assignFromBits(
      adderOutputs.map(_._1).asBits() ## mulOutput0Delayed.res
    )
    payload
  }
}

object MDSMatrixMultiplierVerilog {
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      sizeMax = 12,
      roundp = 57,
      roundf = 8,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    val montMultConfig = MontMultConfig(
      255,
      256,
      PoseidonParam.modulus,
      PoseidonParam.modInverse,
      PoseidonParam.compensation,
      true
    )

    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MDSMatrixMultiplier(poseidonConfig, montMultConfig, mulIPConfig))
  }
}
