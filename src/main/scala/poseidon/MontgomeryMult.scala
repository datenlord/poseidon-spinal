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

  def latency(mulConfig:MontMultConfig, ipConfig:MulIPConfig):Int = {
    val mulLatency0 = KaratsubaBigMultiplier.latency(mulConfig.dataWidth, ipConfig)
    val mulLatency1 = KaratsubaBigMultiplier.latency(mulConfig.rWidth, ipConfig)
    val mulLatency2 = KaratsubaBigMultiplier.latency(mulConfig.rWidth, ipConfig)
    mulLatency0 + mulLatency1 + mulLatency2 + 4 + 2 + 1
  }

  def apply(
      g: MontMultConfig,
      ipConfig: MulIPConfig,
      input: Flow[operands]
  ): Flow[results] = {
    val multInst = MontgomeryMultFlow(g, ipConfig)
    multInst.io.input << input
    multInst.io.output
  }
}

case class MontgomeryMultFlow(g: MontMultConfig, ipConfig: MulIPConfig)
    extends Component {

  val io = new Bundle {
    val input = slave Flow (operands(g.dataWidth))
    val output = master Flow (results(g.dataWidth))
  }

  val mulRes0 = KaratsubaBigMultiplier(g.dataWidth, ipConfig, g.isSim, io.input)
  val mulLatency0 = KaratsubaBigMultiplier.latency(g.dataWidth, ipConfig)

  val mulInput1 = mulRes0.translateWith {
    val payload = operands(g.rWidth)
    payload.op1 := mulRes0.res(g.rWidth - 1 downto 0)
    payload.op2 := U(g.modInverse, g.rWidth bits)
    payload
  }
  val mulRes1 = KaratsubaBigMultiplier(g.rWidth, ipConfig, g.isSim, mulInput1)
  val mulLatency1 = KaratsubaBigMultiplier.latency(g.rWidth, ipConfig)

  val mulInput2 = mulRes1.translateWith {
    val payload = operands(g.rWidth)
    payload.op1 := mulRes1.res(g.rWidth - 1 downto 0)
    payload.op2 := U(g.modulus, g.rWidth bits)
    payload
  }
  val mulRes2 = KaratsubaBigMultiplier(g.rWidth, ipConfig, g.isSim, mulInput2)
  val mulLatency2 = KaratsubaBigMultiplier.latency(g.rWidth, ipConfig)

  val mulRes0Delayed = Delay(mulRes0.res, mulLatency1+mulLatency2)

  //
  def addDivided2(op1:UInt, op2:UInt, carry:Bool, divisor:Int):(UInt,Int)={
    val width = if(op1.getWidth > op2.getWidth) op1.getWidth else op2.getWidth
    val halfWidth = (width + 1)/2
    val op1Divided = op1.resize(width).subdivideIn(2 slices, strict=false)
    val op2Divided = op2.resize(width).subdivideIn(2 slices, strict=false)

    val (addLow, latency1) = if(divisor==2){
      (RegNext(op1Divided(0) +^ op2Divided(0) + carry.asUInt), 1)
    } else{
      addDivided2(op1Divided(0), op2Divided(0), carry, divisor/2)
    }

    val op1Delay = Delay(op1Divided(1), latency1)
    val op2Delay = Delay(op2Divided(1), latency1)
    val (addHigh, latency2) = if(divisor==2){
      (RegNext(op1Delay +^ op2Delay + addLow.msb.asUInt), 1)
    } else{
      addDivided2(op1Delay, op2Delay, addLow.msb, divisor/2)
    }

    val addLowDelay = Delay(addLow.resize(halfWidth), latency2)
    (addHigh @@ addLowDelay, latency1+latency2)
  }
  //
  val (addRes0, addLatency0) = addDivided2(mulRes2.res, mulRes0Delayed, False, 4)

  val addOp1 = (addRes0>>g.rWidth).resize(g.dataWidth)
  val addOp2 = (U(g.compensation, g.dataWidth bits))
  val (addRes1, addLatency1) = addDivided2(addOp1, addOp2, False, 2)

  val addRes0Delayed = Delay((addRes0>>g.rWidth).resize(g.dataWidth+1), addLatency1)
  val validDelayed = Delay(mulRes2.valid, addLatency0+addLatency1, init=False)

  println(s"add Latency 0: $addLatency0")
  println(s"add Latency 1: $addLatency1")

  val tempOutput = Flow(results(g.dataWidth))
  tempOutput.valid := validDelayed
  tempOutput.res := Mux(addRes0Delayed.msb||addRes1.msb, addRes1, addRes0Delayed).resized
  io.output << tempOutput.stage()

  val latency= mulLatency0 + mulLatency1 + mulLatency2 + addLatency0 + addLatency1 + 1
}


object MontgomeryMultFlowVerilog {
  def main(args: Array[String]): Unit = {
    val montConfig =
      MontMultConfig(
        255, 256, 
        PoseidonParam.modulus, 
        PoseidonParam.modInverse, 
        PoseidonParam.compensation, 
        true
      )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontgomeryMultFlow(montConfig, XilinxIPConfig.mul0))

    print(MontgomeryMultFlow.latency(montConfig, XilinxIPConfig.mul0))
  }
}


