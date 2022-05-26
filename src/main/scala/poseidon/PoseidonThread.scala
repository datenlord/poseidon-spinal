package poseidon

import spinal.core._
import spinal.lib._

case class BasicContextCase(g: PoseidonGenerics) extends BasicContext(g) {}
case class ContextCase(g: PoseidonGenerics) extends Context(g) {}

object PoseidonThread {
  def apply(g: PoseidonGenerics, input: Flow[Context]): Flow[MDSContext] = {
    val threadInst = new PoseidonThread(g)
    threadInst.io.input << input
    threadInst.io.output
  }
}

class PoseidonThread(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Flow (new Context(g))
    val output = master Flow (MDSContext(g))
  }

  // set configuration parameters of Xilinx Multiplier IP implemented through LUTs
  val mulIPConfig1 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    pipeStages = 6,
    moduleName = "mult_gen_0"
  )

  // set configuration parameters of Xilinx Multiplier IP implemented through DSP slices
  val mulIPConfig2 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    pipeStages = 6,
    moduleName = "mult_gen_1"
  )

  // set configuration parameters of MontgomeryMult implemented through Xilinx Multiplier IP
  val montMultConfig = MontMultConfig(
    dataWidth = g.dataWidth,
    rWidth = g.dataWidth + 1,
    modulus = PoseidonParam.modulus,
    modInverse = PoseidonParam.modInverse,
    compensation = PoseidonParam.compensation,
    isSim = g.isSim
  )

  // set configuration parameters of Xilinx Adder IP implemented through LUT
  val adderIPConfig0 = AdderIPConfig(
    inputWidth = 255,
    outputWidth = 256,
    latency = 16,
    moduleName = "c_addsub_0"
  )

  // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
  val modAdderConfig = ModAdderConfig(
    dataWidth = g.dataWidth,
    modulus = PoseidonParam.modulus,
    compensation = PoseidonParam.compensation,
    isSim = g.isSim
  )

  // SBox5 Stage // 47 * 3 = 141 stages
  val SBox5Stage = new Area {
    val input = io.input

    // the first Montgomery Multiplier
    val mulInput0 =
      input.translateWith(operands(input.stateElement, input.stateElement))
    val montMultiplier0 = MontgomeryMultFlow(montMultConfig, mulIPConfig1)
    montMultiplier0.io.input << mulInput0
    val mulRes0 = montMultiplier0.io.output

    // the second Montgomery Multiplier
    val mulInput1 = mulRes0.translateWith(operands(mulRes0.res, mulRes0.res))
    val montMultiplier1 = MontgomeryMultFlow(montMultConfig, mulIPConfig1)
    montMultiplier1.io.input << mulInput1
    val mulRes1 = montMultiplier1.io.output
    val tempContext1 = Delay(
      input.payload,
      montMultiplier0.totalLatency + montMultiplier1.totalLatency
    )

    // the third Montgomery Multiplier
    val mulInput2 = mulRes1.translateWith {
      operands(mulRes1.res, tempContext1.stateElement)
    }
    val montMultiplier2 = MontgomeryMultFlow(montMultConfig, mulIPConfig2)
    montMultiplier2.io.input << mulInput2
    val mulRes2 = montMultiplier2.io.output

    val mul2Context = BasicContextCase(g)
    mul2Context.assignSomeByName(tempContext1)
    val tempContext2 = Delay(mul2Context, montMultiplier2.totalLatency)

    val output = mulRes2.translateWith {
      val payload = new ContextCase(g)
      payload.assignSomeByName(tempContext2)
      payload.stateElement := mulRes2.res
      payload
    }
  }

  val AddRoundConstantStage = new Area { // 33 stages
    val input = SBox5Stage.output

    //TODO: Synchronous memory read

    // get adder operands
    val adderOperands = operands(g.dataWidth)
    adderOperands.op1 := input.stateElement
    val constantMemory = RoundConstantMem(g)
    constantMemory.io.addr.assignSomeByName(input.payload)
    adderOperands.op2 := constantMemory.io.data

    val modAdder = ModularAdderFlow(modAdderConfig, adderIPConfig0)
    modAdder.io.input << input.translateWith(adderOperands)
    val adderContext = BasicContextCase(g)
    adderContext.assignSomeByName(input.payload)
    val adderContextDelayed = Delay(adderContext, modAdder.totalLatency)

    val output = modAdder.io.output.translateWith {
      val payload = ContextCase(g)
      payload.assignSomeByName(adderContextDelayed)
      payload.stateElement := modAdder.io.output.res
      payload
    }
  }

  // MDS Mixing
  val mdsMulOutput = // 49 stages
    MDSMatrixMultiplier(
      g,
      montMultConfig,
      mulIPConfig2,
      AddRoundConstantStage.output.stage()
    )
  // MDS Addition
  io.output << MDSMatrixAdders(g, mdsMulOutput) //partial_3 9 stages

}

object PoseidonThreadVerilog {
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
    ).generate(new PoseidonThread(config))
  }
}
