package poseidon

import spinal.core._
import spinal.lib._

// implement Montgomery Multiplier based on normal multipliers

case class MontMultConfig(
    mulWidth:Int,
    modWidth:Int,
    modulus:BigInt,
    modInverse:BigInt,
    compensation:BigInt,
    isSim:Boolean
)

object MontgomeryMult{
  def apply(g:MontMultConfig, ipConfig:MulIPConfig, input:Stream[operands]):Stream[results] = {
    val multInst = MontgomeryMult(g, ipConfig)
    multInst.io.input << input
    multInst.io.output
  }
}

case class MontgomeryMult(g:MontMultConfig, ipConfig:MulIPConfig) extends Component{

  val io = new Bundle{
    val input = slave Stream(operands(g.modWidth))
    val output = master Stream(results(g.modWidth))
  }

  val mulInput0 = io.input.translateWith{
    operands(g.mulWidth, io.input.op1.resized, io.input.op2.resized)
  }

  val mulRes0 = Multiplier(g.mulWidth, g.isSim, ipConfig, mulInput0)
  val mulRes0Forked = StreamFork(mulRes0, 2, true)

  val mulRes0Queued = mulRes0Forked(1).queue(40)

  val mulInput1 = mulRes0Forked(0).translateWith{
    val payload = operands(g.mulWidth)
    payload.op1 := mulRes0Forked(0).res(g.modWidth-1 downto 0).resized
    payload.op2 := U(g.modInverse, g.mulWidth bits)
    payload
  }
  val mulRes1 = Multiplier(g.mulWidth, g.isSim, ipConfig, mulInput1)

  val mulInput2 = mulRes1.translateWith{
    val payload = operands(g.mulWidth)
    payload.op1 := mulRes1.res(g.modWidth-1 downto 0).resized
    payload.op2 := U(g.modulus, g.mulWidth bits)
    payload
  }
  val mulRes2 = Multiplier(g.mulWidth, g.isSim, ipConfig, mulInput2)

  val adderOutput0 = StreamJoin.arg(mulRes2, mulRes0Queued).translateWith{
    val payload = results(g.modWidth + 1)
    payload.res := (mulRes2.res + mulRes0Queued.res)(g.modWidth*2 downto g.modWidth)
    payload
  }.stage()

  io.output << adderOutput0.translateWith{
    val payload = results(g.modWidth)
    val adderRes0 = adderOutput0.res
    val adderRes1 = adderOutput0.res(g.modWidth-1 downto 0) +^ U(g.compensation, g.modWidth bits)
    payload.res := Mux(adderRes1.msb|adderRes0.msb, adderRes1,adderRes0).resized
    payload
  }.stage()

}


object MontgomeryMultVerilog{
  def main(args: Array[String]): Unit = {
    val modulus    = BigInt("73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",16)
    val modInverse = BigInt("3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",16)
    val compensation = BigInt("c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",16)
    val montConfig = MontMultConfig(256, 255, modulus, modInverse, compensation, false)

    val ipConfig = MulIPConfig(
      inputWidth = 64,
      outputWidth = 128,
      isCE = true,
      isSCLR = true,
      pipeStages = 18,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontgomeryMult(montConfig, ipConfig))
  }
}

