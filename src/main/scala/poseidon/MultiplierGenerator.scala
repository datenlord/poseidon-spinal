package poseidon
import spinal.core._
import spinal.lib._

import scala.language.postfixOps

// Blackbox used to instantiate Xilinx Multiplier IP
case class MulIPConfig(
    inputWidth: Int,
    outputWidth: Int,
    latency: Int,
    moduleName: String
)

object MultiplierIP {
  def apply(
      g: MulIPConfig,
      inputA: UInt,
      inputB: UInt,
  ): UInt = {
    val width = inputA.getWidth
    val multiplierInst = MultiplierIP(g).setDefinitionName(g.moduleName)
    multiplierInst.io.inputA := inputA.resized
    multiplierInst.io.inputB := inputB.resized
    multiplierInst.io.outputP.resize(2*width)
  }
}

case class MultiplierIP(g: MulIPConfig) extends BlackBox {
  val io = new Bundle {
    val clk = in Bool ()
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputP = out UInt (g.outputWidth bits)
  }

  mapClockDomain(clock = io.clk)

  //Remove io_ prefix
  noIoPrefix()

  //Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.clk.setName("CLK")
    io.inputA.setName("A")
    io.inputB.setName("B")
    io.outputP.setName("P")
  }

  //Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}

// SimMultiplier with same behavior as MultiplierIP Used For Simulation
object SimMultiplierIP {
  def apply(g: MulIPConfig, inputA: UInt, inputB: UInt): UInt = {
    val width = inputA.getWidth
    val multiplierInst = SimMultiplierIP(g)
    multiplierInst.io.inputA := inputA.resized
    multiplierInst.io.inputB := inputB.resized
    multiplierInst.io.outputP.resize(2 * width)
  }
}

case class SimMultiplierIP(g: MulIPConfig) extends Component {
  val io = new Bundle {
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputP = out UInt (g.outputWidth bits)
  }

  val mulRes = (io.inputA * io.inputB).resize(g.outputWidth)
  io.outputP := Delay(mulRes, g.latency)
}

// Wrap Xilinx Multiplier IP With SpinalHDL Flow Interface
object MultiplierIPFlow {
  def apply(g: MulIPConfig,isSim: Boolean,input: Flow[operands]): Flow[results] = {
    val mulInst = MultiplierIPFlow(g, isSim)
    mulInst.io.input :=  input
    mulInst.io.output
  }
}

case class MultiplierIPFlow(g: MulIPConfig, isSim: Boolean) extends Component {

  val io = new Bundle {
    val input = slave (Flow(operands(g.inputWidth)))
    val output = master (Flow(results(g.outputWidth)))
  }

  val mulRes = if (isSim) {
    SimMultiplierIP(g, io.input.op1, io.input.op2)
  } else {
    MultiplierIP(g, io.input.op1, io.input.op2)
  }
  io.output.res := mulRes
  io.output.valid := Delay(io.input.valid, g.latency, init=False)
}

object KaratsubaBigMultiplier{
  def apply(width:Int, 
            ip:MulIPConfig, 
            isSim:Boolean, 
            input:Flow[operands]):Flow[results]={
    val mulInst = KaratsubaBigMultiplier(width, ip, isSim)
    mulInst.io.input := input
    mulInst.io.output
  }

  def latency(width:Int, ip:MulIPConfig):Int = {
    if(width <= ip.inputWidth){
      ip.latency
    }else{
      if(width < 255){
        latency((width+1)/2, ip) + 3
      }else{
        latency((width+1)/2, ip) + 9
      }
      
    }
  }

}


case class KaratsubaBigMultiplier(width:Int, ipConfig:MulIPConfig, isSim:Boolean) extends Component{
  val io = new Bundle{
    val input = slave Flow(operands(width))
    val output = master Flow(results(2*width))
  }

  def subDivided2(op1:UInt, op2:UInt):UInt={
    val width = if(op1.getWidth > op2.getWidth) op1.getWidth else op2.getWidth
    val op1Divided = op1.resize(width).subdivideIn(2 slices, strict=false)
    val op2Divided = op2.resize(width).subdivideIn(2 slices, strict=false)

    val resTemp1 = RegNext(op1Divided(0) -^ op2Divided(0))
    val (op1Temp1, op2Temp1) = (RegNext(op1Divided(1)), RegNext(op2Divided(1)))

    val resTemp2 = RegNext(op1Temp1 - op2Temp1 - resTemp1.msb.asUInt)
    resTemp2 @@ RegNext(resTemp1.resize(op1Divided(0).getWidth))
  }

  def addDivided2(op1:UInt, op2:UInt):UInt={
    val width = if(op1.getWidth > op2.getWidth) op1.getWidth else op2.getWidth
    val op1Divided = op1.resize(width).subdivideIn(2 slices, strict=false)
    val op2Divided = op2.resize(width).subdivideIn(2 slices, strict=false)

    val resTemp1 = RegNext(op1Divided(0) +^ op2Divided(0))
    val (op1Temp1, op2Temp1) = (RegNext(op1Divided(1)), RegNext(op2Divided(1)))

    val resTemp2 = RegNext(op1Temp1 + op2Temp1 + resTemp1.msb.asUInt)
    resTemp2 @@ RegNext(resTemp1.resize(op1Divided(0).getWidth))
  }

  def subProcess(x1y1:UInt, x0y0:UInt, sum:UInt):(UInt, UInt, UInt)={ // 4 stages
    val width = sum.getWidth
    if(width < 255){
      (RegNext(x1y1), RegNext(x0y0), RegNext(sum-x1y1-x0y0))
    } else{
      val sumTemp = subDivided2(sum, x0y0)
      val (x1y1Temp, x0y0Temp) = (Delay(x1y1, 2), Delay(x0y0, 2))
      (Delay(x1y1Temp,2), Delay(x0y0Temp,2), subDivided2(sumTemp, x1y1Temp))
    }
  }

  def addProcess(x1y1:UInt, x0y0:UInt, sum:UInt, split:Int): UInt={ // 4 stages
    val width = sum.getWidth
    if(width < 255){
        RegNext((x1y1 << 2*split) + (sum << split) + x0y0)
    } else{
      // addition 1
      val (x0y0High, x0y0Low) = x0y0.splitAt(split)
      val sumTemp1 = addDivided2(sum, x0y0High.asUInt)
      val x1y1Temp1 = Delay(x1y1, 2)

      // addition 2
      val (sumHigh,sumLow) = sumTemp1.splitAt(split)
      val sumTemp2 = addDivided2(x1y1Temp1, sumHigh.asUInt)
      (sumTemp2 ## Delay(sumLow,2) ## Delay(x0y0Low, 4)).asUInt
    }
    
  }

  def recursiveTask(x:UInt, y:UInt, level:Int):UInt={
    val width = x.getWidth
    if(width <= ipConfig.inputWidth){
      if(isSim) {
        SimMultiplierIP(ipConfig, x, y)
      }else{
        MultiplierIP(ipConfig, x, y)
      }
    } else{
      val split = (width + 1)/2
      val (xHighBits, xLowBits) = x.splitAt(split)
      val (yHighBits, yLowBits) = y.splitAt(split)
      val (xHigh, xLow) = (xHighBits.asUInt, xLowBits.asUInt)
      val (yHigh, yLow) = (yHighBits.asUInt, yLowBits.asUInt)

      val (x1,x0,y1,y0) = (RegNext(xHigh), RegNext(xLow), RegNext(yHigh), RegNext(yLow))
      val (x1Plusx0, y1Plusy0) = (RegNext(xHigh +^ xLow), RegNext(yHigh +^ yLow))

      val x1y1 = recursiveTask(x1, y1, level+1)
      val x0y0 = recursiveTask(x0, y0, level+1)
      val sum = recursiveTask(x1Plusx0, y1Plusy0, level+1)

      x1y1.setName(s"level_${level}_x1y1", weak=true)
      x0y0.setName(s"level_${level}_x0y0", weak=true)
      sum.setName(s"level_${level}_sum", weak=true)

      val (x1y1d0, x0y0d0, sumd0) = subProcess(x1y1, x0y0, sum)

      x1y1d0.setName(s"level_${level}_x1y1d0",weak=true)
      x0y0d0.setName(s"level_${level}_x0y0d0", weak=true)
      sumd0.setName(s"level_${level}_sumd0", weak=true)

      val sumd1 = addProcess(x1y1d0, x0y0d0, sumd0, split)

      sumd1.setName(s"level_${level}_sumd1", weak=true)
      sumd1
    }
  }

  io.output.res := recursiveTask(io.input.op1, io.input.op2, 0)
  val latency = KaratsubaBigMultiplier.latency(width, ipConfig)
  println(s"Multiplier Latency: $latency ")
  io.output.valid := Delay(io.input.valid, latency, init=False)

}

object KaratsubaBigMultiplierVerilog{
  def main(args: Array[String]): Unit = {
    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      latency = 6,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(KaratsubaBigMultiplier(256, mulIPConfig, true))
  }
}

