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
    val input  = slave Flow (new Context(g))
    val output = master Flow (MDSContext(g))
  }

  // set configuration parameters of MontgomeryMult implemented through Xilinx Multiplier IP
  val mulConfig = MontMultConfig(
    dataWidth = g.dataWidth,
    rWidth = g.dataWidth + 1,
    modulus = PoseidonParam.modulus,
    modInverse = PoseidonParam.modInverse,
    compensation = PoseidonParam.compensation,
    isSim = g.isSim
  )

  // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
  val addConfig = ModAdderConfig(
    dataWidth = g.dataWidth,
    modulus = PoseidonParam.modulus,
    compensation = PoseidonParam.compensation,
    isSim = g.isSim
  )

  val AddRoundConstantStage = new Area { // 3 + 11 stages
    val input = io.input
    val constantAddr = RoundConstantMemAddr(g)
    constantAddr.assignSomeByName(input.payload)
    val constant = RoundConstant(g, constantAddr)
    val inputDelayed = FlowDelay(input, RoundConstant.latency(g))

    val addInput = inputDelayed.translateWith{
      operands(g.dataWidth, inputDelayed.stateElement, constant)
    }
    val addOutput = ModularAdderFlow(addConfig, XilinxIPConfig.adder0, addInput)
    val addContext = BasicContextCase(g)
    addContext.assignSomeByName(inputDelayed.payload)
    val addContextDelayed = Delay(addContext, ModularAdderFlow.latency(XilinxIPConfig.adder0))

    val output = addOutput.translateWith {
      val payload = ContextCase(g)
      payload.assignSomeByName(addContextDelayed)
      payload.stateElement := addOutput.res
      payload
    }
  }

  // SBox5 Stage
  val SBox5Stage = new Area { // 47*3 + 1

    val input = AddRoundConstantStage.output

    // the first Montgomery Multiplier
    val mulInput0 = input.translateWith(
      operands(g.dataWidth, input.stateElement, input.stateElement)
    )
    val mulOutput0 = MontgomeryMultFlow(mulConfig, XilinxIPConfig.mul0, mulInput0)

    // the second Montgomery Multiplier
    val mulInput1 = mulOutput0.translateWith(operands(g.dataWidth, mulOutput0.res, mulOutput0.res))
    val mulOutput1 = MontgomeryMultFlow(mulConfig, XilinxIPConfig.mul0, mulInput1)

    val mulContext1 = Delay(
      input.payload,
      2 * MontgomeryMultFlow.latency(mulConfig, XilinxIPConfig.mul0)
    )

    // the third Montgomery Multiplier
    val mulInput2 = mulOutput1.translateWith {
      operands(g.dataWidth, mulOutput1.res, mulContext1.stateElement)
    }
    val mulOutput2 = MontgomeryMultFlow(mulConfig, XilinxIPConfig.mul1, mulInput2)

    val mulContext2 = Delay(
      mulContext1,
      MontgomeryMultFlow.latency(mulConfig, XilinxIPConfig.mul1)
    )
  

    // decide whether SBox5 is bypassed
    import PoseidonParam._
    val upperBound = sizeRange.map(
      size => (mulContext2.stateSize===size)&(mulContext2.roundIndex < partialRoundMap(size)+halfRoundf)
    )
    val lowerBound = mulContext2.roundIndex >= 4
    val partialRound = lowerBound && upperBound.reduce(_||_)
    val bypassSBox5 = (partialRound) && (mulContext2.stateIndex =/= 0)

    val output = mulOutput2.translateWith {
      val payload = new ContextCase(g)
      payload.assignSomeByName(mulContext2)
      payload.stateElement.allowOverride
      payload.stateElement := Mux(bypassSBox5,mulContext2.stateElement,mulOutput2.res)
      payload
    }.stage()
  }

  // MDS Mixing
  val modArith = ModArithmetic(mulConfig, XilinxIPConfig.mul1, addConfig, XilinxIPConfig.adder0)
  io.output := MDSMixing(g, modArith, SBox5Stage.output) // 5 + 47 + 11*6 stages

}

object PoseidonThreadVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 3,
      dataWidth = 255,
      idWidth = 8,
      isSim = true,
      constantMemType = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonThread(config))
  }
}
