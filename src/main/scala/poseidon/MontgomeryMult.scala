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

object MontgomeryMultStream {
  def apply(
      g: MontMultConfig,
      ipConfig: MulIPConfig,
      input: Stream[operands]
  ): Stream[results] = {
    val multInst = MontgomeryMultStream(g, ipConfig)
    multInst.io.input << input
    multInst.io.output
  }
}

case class MontgomeryMultStream(g: MontMultConfig, ipConfig: MulIPConfig)
    extends Component {

  val io = new Bundle {
    val input = slave Stream (operands(g.dataWidth))
    val output = master Stream (results(g.dataWidth))
  }

  val mulInput0 = io.input.translateWith {
    operands(g.dataWidth, io.input.op1, io.input.op2)
  }

  val mulRes0 = MultiplierStream(g.dataWidth, g.isSim, ipConfig, mulInput0)
  val mulRes0Forked = StreamFork(mulRes0, 2, true)

  val mulRes0Queued = mulRes0Forked(1).queue(35)

  val mulInput1 = mulRes0Forked(0).translateWith {
    val payload = operands(g.rWidth)
    payload.op1 := mulRes0Forked(0).res(g.rWidth - 1 downto 0)
    payload.op2 := U(g.modInverse, g.rWidth bits)
    payload
  }
  val mulRes1 = MultiplierStream(g.rWidth, g.isSim, ipConfig, mulInput1)

  val mulInput2 = mulRes1.translateWith {
    val payload = operands(g.rWidth)
    payload.op1 := mulRes1.res(g.rWidth - 1 downto 0)
    payload.op2 := U(g.modulus, g.rWidth bits)
    payload
  }
  val mulRes2 = MultiplierStream(g.rWidth, g.isSim, ipConfig, mulInput2)

  val adderOutput0 = StreamJoin
    .arg(mulRes2, mulRes0Queued)
    .translateWith {
      val payload = results(g.dataWidth + 1)
      payload.res := (mulRes2.res + mulRes0Queued.res)(
        g.dataWidth + g.rWidth downto g.rWidth
      )
      payload
    }
    .stage()

  io.output << adderOutput0
    .translateWith {
      val payload = results(g.dataWidth)
      val adderRes0 = adderOutput0.res
      val adderRes1 = adderOutput0
        .res(g.dataWidth - 1 downto 0) +^ U(g.compensation, g.dataWidth bits)
      payload.res := Mux(
        adderRes1.msb | adderRes0.msb,
        adderRes1,
        adderRes0
      ).resized
      payload
    }
    .stage()
}

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

  // TODO: cut critical path
  val halfAddRes = new Bundle{
    val carry = Bool
    val op1 = UInt(g.rWidth bits)
    val op2 = UInt(2*g.dataWidth - g.rWidth bits)
  }

  halfAddRes.carry := (mulRes2.res(g.rWidth-1 downto 0) +^ mulRes0Delayed(g.rWidth-1 downto 0)).msb
  halfAddRes.op1 := mulRes2.res(2*g.rWidth-1 downto g.rWidth)
  halfAddRes.op2 := mulRes0Delayed(2*g.dataWidth-1 downto g.rWidth)

  val halfAdderOutput = mulRes2.translateWith(halfAddRes).stage()

  val adderOutput = halfAdderOutput.translateWith{
    val payload = results(g.dataWidth + 1)
    payload.res := halfAdderOutput.op1 + halfAdderOutput.op2 + halfAdderOutput.carry.asUInt
    payload
  }.stage()


  // val adderOutput0 = mulRes2 
  //   .translateWith {
  //     val payload = results(g.dataWidth + 1)
  //     payload.res := (mulRes2.res + mulRes0Delayed)(
  //       g.dataWidth + g.rWidth downto g.rWidth
  //     )
  //     payload
  //   }
  //   .stage()

  // TODO: cut critical path
  val tempOutput = adderOutput.translateWith{
    val payload = operands(g.dataWidth + 1)
    payload.op1 := adderOutput.res
    payload.op2 := adderOutput.res(g.dataWidth-1 downto 0) +^ U(g.compensation, g.dataWidth bits)
    payload
  }.stage()

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

object MontgomeryMultStreamVerilog {
  def main(args: Array[String]): Unit = {
    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      16
    )
    val modInverse = BigInt(
      "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
      16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      16
    )
    val montConfig =
      MontMultConfig(255, 256, modulus, modInverse, compensation, true)

    val ipConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = true,
      isSCLR = true,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontgomeryMultStream(montConfig, ipConfig))
  }
}

object MontgomeryMultFlowVerilog {
  def main(args: Array[String]): Unit = {
    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      16
    )
    val modInverse = BigInt(
      "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
      16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      16
    )
    val montConfig =
      MontMultConfig(255, 256, modulus, modInverse, compensation, false)

    val ipConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontgomeryMultFlow(montConfig, ipConfig))
  }
}
