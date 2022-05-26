package poseidon

import spinal.core._
import spinal.lib._

// implement Montgomery Multiplier based on normal multipliers

case class MontMultConfig(
    dataWidth: Int, // the width of data
    rWidth: Int, // width of R, R=pow(2,rWidth)
    modulus: BigInt,
    modInverse: BigInt,
    compensation: BigInt,
    isSim: Boolean
)

object MontgomeryMultFlow {
  def apply(
      g: MontMultConfig,
      ipConfig: MulIPConfig,
      input: Flow[operands]
  ): (Flow[results], Int) = {
    val multInst = MontgomeryMultFlow(g, ipConfig)
    multInst.io.input << input
    (multInst.io.output, multInst.totalLatency)
  }
}

case class MontgomeryMultFlow(g: MontMultConfig, ipConfig: MulIPConfig)
    extends Component {

  val io = new Bundle {
    val input = slave Flow (operands(g.dataWidth))
    val output = master Flow (results(g.dataWidth))
  }

  val (mulRes0, latency0) =
    MultiplierFlow(g.dataWidth, g.isSim, ipConfig, io.input)

  val mulInput1 = mulRes0.translateWith {
    val payload = operands(g.rWidth)
    payload.op1 := mulRes0.res(g.rWidth - 1 downto 0)
    payload.op2 := U(g.modInverse, g.rWidth bits)
    payload
  }
  val (mulRes1, latency1) =
    MultiplierFlow(g.rWidth, g.isSim, ipConfig, mulInput1)

  val mulInput2 = mulRes1.translateWith {
    val payload = operands(g.rWidth)
    payload.op1 := mulRes1.res(g.rWidth - 1 downto 0)
    payload.op2 := U(g.modulus, g.rWidth bits)
    payload
  }
  val (mulRes2, latency2) =
    MultiplierFlow(g.rWidth, g.isSim, ipConfig, mulInput2)

  val mulRes0Delayed = Delay(mulRes0.res, latency1 + latency2)

  val halfAddRes = new Bundle {
    val carry = Bool
    val op1 = UInt(g.rWidth bits)
    val op2 = UInt(2 * g.dataWidth - g.rWidth bits)
  }

  halfAddRes.carry := (mulRes2.res(g.rWidth - 1 downto 0) +^ mulRes0Delayed(
    g.rWidth - 1 downto 0
  )).msb
  halfAddRes.op1 := mulRes2.res(2 * g.rWidth - 1 downto g.rWidth)
  halfAddRes.op2 := mulRes0Delayed(2 * g.dataWidth - 1 downto g.rWidth)

  val halfAdderOutput = mulRes2.translateWith(halfAddRes).stage()

  val adderOutput = halfAdderOutput
    .translateWith {
      val payload = results(g.dataWidth + 1)
      payload.res := halfAdderOutput.op1 + halfAdderOutput.op2 + halfAdderOutput.carry.asUInt
      payload
    }
    .stage()

  // TODO: cut critical path
  val tempOutput = adderOutput
    .translateWith {
      val payload = operands(g.dataWidth + 1)
      payload.op1 := adderOutput.res
      payload.op2 := adderOutput
        .res(g.dataWidth - 1 downto 0) +^ U(g.compensation, g.dataWidth bits)
      payload
    }
    .stage()

  io.output << tempOutput
    .translateWith {
      val payload = results(g.dataWidth)
      payload.res := Mux(
        tempOutput.op1.msb | tempOutput.op2.msb,
        tempOutput.op2,
        tempOutput.op1
      ).resized
      payload
    }
    .stage()

  val totalLatency = latency0 + latency1 + latency2 + 2 + 2
}

object MontgomeryMultFlowVerilog {
  def main(args: Array[String]): Unit = {

    val montConfig =
      MontMultConfig(
        255,
        256,
        PoseidonParam.modulus,
        PoseidonParam.modInverse,
        PoseidonParam.compensation,
        false
      )

    val ipConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontgomeryMultFlow(montConfig, ipConfig))
  }
}
