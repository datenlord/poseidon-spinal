package poseidon
import spinal.core._
import spinal.lib._


// modulus:
// 63 :  0 18446744069414584000
// 127: 64 6034159408538082000
// 191:128 3691218898639771600
// 256:192 8353516859464449000

// modulus_inverse:18446744069414584000
// 63 :  0 18446744069414584000
// 127: 64 6033235805885849000
// 191:128 1737030558577650700
// 256:192 4414718065938213000



// Blackbox used to instantiate Xilinx Multiplier IP 
case class MulIPConfig(inputWidth:Int,
                       outputWidth:Int,
                       isCE:Boolean,
                       isSCLR:Boolean,
                       pipeStages:Int,
                       moduleName:String)

object MultiplierIP{
  def apply(g: MulIPConfig, inputA:UInt, inputB:UInt, enable:Bool):UInt = {
    val multiplierInst = MultiplierIP(g).setDefinitionName(g.moduleName)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    multiplierInst.io.enable := enable
    multiplierInst.io.outputP
  }
}
case class MultiplierIP(g:MulIPConfig) extends BlackBox {

  val io = new Bundle{
    val clk = in Bool()
    val reset  = if(g.isCE)   in(Bool()) else null
    val enable = if(g.isSCLR) in(Bool()) else null
    val inputA, inputB = in UInt(g.inputWidth bits)
    val outputP = out UInt(g.outputWidth bits)
  }

  // map clock and reset signal
  mapClockDomain(clock = io.clk, reset = io.reset)

  //Remove io_ prefix
  noIoPrefix()

  //Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.clk.setName("CLK")
    if(g.isSCLR) io.reset.setName("SCLR")
    if(g.isCE) io.enable.setName("CE")
    io.inputA.setName("A")
    io.inputB.setName("B")
    io.outputP.setName("P")
  }

  //Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}


// Multiplier with same behavior as Xilinx IP used for simulation
object  SimMultiplierIP {
  def apply(g:MulIPConfig,inputA:UInt, inputB:UInt, enable:Bool):UInt = {
    val multiplierInst = SimMultiplierIP(g)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    multiplierInst.io.enable := enable
    multiplierInst.io.outputP
  }
}


case class SimMultiplierIP(g:MulIPConfig) extends Component{
  val io = new Bundle{
    val enable = in Bool()
    val inputA, inputB = in UInt(g.inputWidth bits)
    val outputP = out UInt(g.outputWidth bits)
  }

  val mulRes = (io.inputA * io.inputB).resize(g.outputWidth)
  val stages = History(mulRes, g.pipeStages+1, io.enable, U(0,g.outputWidth bits))
  io.outputP := stages.last
}

// Wrap Xilinx multiplier IP with Stream interface
object MultiplierIPStream{
  def apply(g:MulIPConfig, isSim:Boolean, input:Stream[operands]):Stream[results] = {
    val multiplierInst = MultiplierIPStream(g, isSim)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class MultiplierIPStream(g:MulIPConfig, isSim:Boolean) extends Component{
  require(g.isCE == true)
  val io = new Bundle{
    val input = slave Stream(operands(g.inputWidth))
    val output = master Stream(results(g.outputWidth))
  }

  val validPipe = History(io.input.valid, g.pipeStages+1, io.input.ready, False)
  io.output.valid := validPipe.last
  io.input.ready := !io.output.valid | io.output.ready


  if(isSim){
    io.output.res := SimMultiplierIP(g, io.input.op1, io.input.op2, io.input.ready)
  } else {
    io.output.res := MultiplierIP(g, io.input.op1, io.input.op2, io.input.ready)
  }

}

// generate wide multiplier based on Xilinx IP
object MultiplierGenerator{
  def apply(genWidth:Int, ipConfig:MulIPConfig, isSim:Boolean, input:Stream[operands]):Stream[results]={
    if(ipConfig.inputWidth == genWidth)
    {
      MultiplierIPStream(ipConfig, isSim, input)
    }
    else
    {
      val inputs = new Bundle{
        val x0 = input.op1(genWidth/2-1 downto 0)
        val x1 = input.op1(genWidth-1 downto genWidth/2)
        val y0 = input.op2(genWidth/2-1 downto 0)
        val y1 = input.op2(genWidth-1 downto genWidth/2)
      }
      val inputsForked = StreamFork(input, 4, true)

      val mulInput0 = inputsForked(0).translateWith{
        val payload = operands(genWidth/2)
        payload.op1 := inputs.x1
        payload.op2 := inputs.y1
        payload
      }
      val mul0 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput0)

      val mulInput1 = inputsForked(1).translateWith{
        val payload = operands(genWidth/2)
        payload.op1 := inputs.x1
        payload.op2 := inputs.y0
        payload
      }
      val mul1 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput1)

      val mulInput2 = inputsForked(2).translateWith{
        val payload = operands(genWidth/2)
        payload.op1 := inputs.x0
        payload.op2 := inputs.y1
        payload
      }
      val mul2 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput2)

      val mulInput3 = inputsForked(3).translateWith{
        val payload = operands(genWidth/2)
        payload.op1 := inputs.x0
        payload.op2 := inputs.y0
        payload
      }
      val mul3 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput3)

      StreamJoin.arg(mul0, mul1, mul2, mul3).translateWith{
        val payload = results(genWidth*2)
        val tempRes = (mul0.res << genWidth) + ((mul1.res +^ mul2.res)<<(genWidth/2))
        payload.res := tempRes + mul3.res
        payload
      }.stage()
    }
  }
}


object Multiplier{
  def apply(width:Int, isSim:Boolean, ipConfig:MulIPConfig, input:Stream[operands]):Stream[results] ={
    val mulInst = Multiplier(width, isSim, ipConfig)
    mulInst.io.input << input
    mulInst.io.output
  }
}

case class Multiplier(width:Int, isSim:Boolean, ipConfig:MulIPConfig) extends Component{
  val io = new Bundle{
    val input = slave Stream(operands(width))
    val output = master Stream(results(2*width))
  }
  io.output << MultiplierGenerator(width, ipConfig, isSim, io.input)
}


object SimMultiplierIPVerilog{
  def main(args: Array[String]): Unit = {
    val ipConfig = MulIPConfig(
        inputWidth = 64,
        outputWidth = 128,
        isCE=true,
        isSCLR=true,
        pipeStages = 18,
        moduleName = "mul_gen_0")

    SpinalConfig(
        mode = Verilog,
        targetDirectory = "./src/main/verilog"
    ).generate(SimMultiplierIP(ipConfig))
  }
}

object MultiplierIPStreamVerilog{
  def main(args: Array[String]): Unit = {
    val ipConfig = MulIPConfig(
        inputWidth = 64,
        outputWidth = 128,
        isCE = true,
        isSCLR = true,
        pipeStages = 18,
        moduleName = "mul_gen_0")

    SpinalConfig(
        mode = Verilog,
        targetDirectory = "./src/main/verilog"
    ).generate(MultiplierIPStream(ipConfig, true))
  }
}

object MultiplierVerilog{
  def main(args: Array[String]): Unit = {
    val ipConfig = MulIPConfig(
        inputWidth = 64,
        outputWidth = 128,
        isCE = true,
        isSCLR = true,
        pipeStages = 18,
        moduleName = "mult_gen_0")
    
    SpinalConfig(
        mode = Verilog,
        targetDirectory = "./src/main/verilog"
    ).generate(Multiplier(256, true, ipConfig))
  }
}