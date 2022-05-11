package poseidon
import spinal.core._
import spinal.lib._

// Blackbox used to instantiate Xilinx Multiplier IP
case class MulIPConfig(
    inputWidth: Int,
    outputWidth: Int,
    isCE: Boolean,
    isSCLR: Boolean,
    pipeStages: Int,
    moduleName: String
)

object MultiplierIP {
  def apply(
      g: MulIPConfig,
      inputA: UInt,
      inputB: UInt,
      enable: Bool = null
  ): UInt = {
    require(!(g.isCE && (enable == null)))
    val multiplierInst = MultiplierIP(g).setDefinitionName(g.moduleName)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    if (g.isCE) { multiplierInst.io.enable := enable }
    multiplierInst.io.outputP
  }
}

case class MultiplierIP(g: MulIPConfig) extends BlackBox {
  val io = new Bundle {
    val clk = in Bool ()
    val reset = if (g.isCE) in(Bool()) else null
    val enable = if (g.isSCLR) in(Bool()) else null
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputP = out UInt (g.outputWidth bits)
  }

  // map clock and reset signal
  if (g.isSCLR) {
    mapClockDomain(clock = io.clk, reset = io.reset)
  } else {
    mapClockDomain(clock = io.clk)
  }

  //Remove io_ prefix
  noIoPrefix()

  //Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.clk.setName("CLK")
    if (g.isSCLR) io.reset.setName("SCLR")
    if (g.isCE) io.enable.setName("CE")
    io.inputA.setName("A")
    io.inputB.setName("B")
    io.outputP.setName("P")
  }

  //Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}

// SimMultiplier with same behavior as MultiplierIP Used For Simulation
object SimMultiplierIP {
  def apply(
      g: MulIPConfig,
      inputA: UInt,
      inputB: UInt,
      enable: Bool = null
  ): UInt = {
    require(!(g.isCE && (enable == null)))
    val multiplierInst = SimMultiplierIP(g)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    if (g.isCE) { multiplierInst.io.enable := enable }
    multiplierInst.io.outputP
  }
}

case class SimMultiplierIP(g: MulIPConfig) extends Component {
  val io = new Bundle {
    val enable = if (g.isCE) in Bool () else null
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputP = out UInt (g.outputWidth bits)
  }

  val mulRes = (io.inputA * io.inputB).resize(g.outputWidth)
  val stages =
    History(mulRes, g.pipeStages + 1, io.enable, U(0, g.outputWidth bits))
  io.outputP := stages.last
}

// Wrap Xilinx Multiplier IP With SpinalHDL Flow Interface
object MultiplierIPFlow {
  def apply(
      g: MulIPConfig,
      isSim: Boolean,
      input: Flow[operands]
  ): Flow[results] = {
    val mulInst = MultiplierIPFlow(g, isSim)
    mulInst.io.input << input
    mulInst.io.output
  }
}

case class MultiplierIPFlow(g: MulIPConfig, isSim: Boolean) extends Component {

  val io = new Bundle {
    val input = slave Flow (operands(g.inputWidth))
    val output = master Flow (results(g.outputWidth))
  }

  val mulRes = if (isSim) {
    SimMultiplierIP(g, io.input.op1, io.input.op2)
  } else {
    MultiplierIP(g, io.input.op1, io.input.op2)
  }

  val initValue = if (isSim) False else null
  val validPipe = Delay(io.input.valid, g.pipeStages, init = initValue)
  io.output.valid := validPipe
  io.output.res := mulRes
}

// Wrap Xilinx multiplier IP with Stream interface
object MultiplierIPStream {
  def apply(
      g: MulIPConfig,
      isSim: Boolean,
      input: Stream[operands]
  ): Stream[results] = {
    val multiplierInst = MultiplierIPStream(g, isSim)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class MultiplierIPStream(g: MulIPConfig, isSim: Boolean)
    extends Component {
  require(g.isCE == true)
  val io = new Bundle {
    val input = slave Stream (operands(g.inputWidth))
    val output = master Stream (results(g.outputWidth))
  }

  val validPipe =
    History(io.input.valid, g.pipeStages + 1, io.input.ready, False)
  io.output.valid := validPipe.last
  io.input.ready := !io.output.valid | io.output.ready

  if (isSim) {
    io.output.res := SimMultiplierIP(
      g,
      io.input.op1,
      io.input.op2,
      io.input.ready
    )
  } else {
    io.output.res := MultiplierIP(g, io.input.op1, io.input.op2, io.input.ready)
  }
}

// generate wide multiplier based on Xilinx IP

case class MulInputContext(input: operands) extends Bundle {
  val xVec = input.op1.subdivideIn(2 slices, false)
  val yVec = input.op2.subdivideIn(2 slices, false)
  val xSum = xVec(0) +^ xVec(1)
  val ySum = yVec(0) +^ yVec(1)
}

case class MulOutputContext(width: Int) extends Bundle {
  val x1y1 = UInt(2 * width bits)
  val x0y0 = UInt(2 * width bits)
  val mixed = UInt(2 * width + 1 bits)
}

// generate wide multiplier with Stream Interface from Multiplier IP
object MultiplierStreamGenerator {
  def apply(
      genWidth: Int,
      ipConfig: MulIPConfig,
      isSim: Boolean,
      input: Stream[operands]
  ): Stream[results] = {
    if (ipConfig.inputWidth == genWidth) {
      MultiplierIPStream(ipConfig, isSim, input)
    } else {
      val nextWidth = (genWidth + 1) / 2
      val mulInput = input.translateWith(MulInputContext(input)).stage()
      val mulInputForked = StreamFork(mulInput, 3, true)

      val mulInput0 = mulInputForked(0).translateWith(
        operands(
          nextWidth + 1,
          mulInput.xVec(1).resized,
          mulInput.yVec(1).resized
        )
      )
      val mulRes0 =
        MultiplierStreamGenerator(nextWidth + 1, ipConfig, isSim, mulInput0)

      val mulInput1 = mulInputForked(1).translateWith(
        operands(
          nextWidth + 1,
          mulInput.xVec(0).resized,
          mulInput.yVec(0).resized
        )
      )
      val mulRes1 =
        MultiplierStreamGenerator(nextWidth + 1, ipConfig, isSim, mulInput1)

      val mulInput2 = mulInputForked(2).translateWith(
        operands(nextWidth + 1, mulInput.xSum.resized, mulInput.ySum.resized)
      )
      val mulRes2 =
        MultiplierStreamGenerator(nextWidth + 1, ipConfig, isSim, mulInput2)

      val tempOutput = StreamJoin
        .arg(mulRes0, mulRes1, mulRes2)
        .translateWith {
          val payload = MulOutputContext(nextWidth)
          payload.x1y1 := mulRes0.res.resized
          payload.x0y0 := mulRes1.res.resized
          payload.mixed := (mulRes2.res - mulRes0.res - mulRes1.res).resized
          payload
        }
        .stage()

      tempOutput
        .translateWith {
          val payload = results(2 * genWidth)
          payload.res := ((tempOutput.x1y1 << (2 * nextWidth)) + tempOutput.x0y0 + (tempOutput.mixed << nextWidth)).resized
          payload
        }
        .stage()

    }
  }
}

// generate wide multiplier with Flow Interface From Multiplier IP
object MultiplierFlowGenerator {
  def apply(
      genWidth: Int,
      ipConfig: MulIPConfig,
      isSim: Boolean,
      input: Flow[operands]
  ): (Flow[results], Int) = {

    if (ipConfig.inputWidth == genWidth) {
      (MultiplierIPFlow(ipConfig, isSim, input), ipConfig.pipeStages)
    } else {
      val nextWidth = (genWidth + 1) / 2
      val mulInput = input.translateWith(MulInputContext(input)).stage()

      val mulInput0 = mulInput.translateWith {
        operands(
          nextWidth + 1,
          mulInput.xVec(1).resized,
          mulInput.yVec(1).resized
        )
      }
      val (mulRes0, latency0) =
        MultiplierFlowGenerator(nextWidth + 1, ipConfig, isSim, mulInput0)

      val mulInput1 = mulInput.translateWith {
        operands(
          nextWidth + 1,
          mulInput.xVec(0).resized,
          mulInput.yVec(0).resized
        )
      }
      val (mulRes1, latency1) =
        MultiplierFlowGenerator(nextWidth + 1, ipConfig, isSim, mulInput1)

      val mulInput2 = mulInput.translateWith {
        operands(nextWidth + 1, mulInput.xSum.resized, mulInput.ySum.resized)
      }
      val (mulRes2, latency2) =
        MultiplierFlowGenerator(nextWidth + 1, ipConfig, isSim, mulInput2)

      val mulOutput = Flow(MulOutputContext(nextWidth))
      mulOutput.valid := mulRes0.valid & mulRes1.valid & mulRes2.valid
      mulOutput.x1y1 := mulRes0.res.resized
      mulOutput.x0y0 := mulRes1.res.resized
      mulOutput.mixed := (mulRes2.res - mulRes0.res - mulRes1.res).resized

      val tempOutput = mulOutput.stage()

      val output = tempOutput.translateWith {
        val payload = results(2 * genWidth)
        payload.res := ((tempOutput.x1y1 << (2 * nextWidth)) + tempOutput.x0y0 + (tempOutput.mixed << nextWidth)).resized
        payload
      }

      require((latency0 == latency1) && (latency1 == latency2))
      (output.stage(), latency0 + 3)
    }
  }
}

// object MultiplierGenerator{
//   def apply(genWidth:Int, ipConfig:MulIPConfig, isSim:Boolean, input:Stream[operands]):Stream[results]={
//     if(ipConfig.inputWidth == genWidth)
//     {
//       MultiplierIPStream(ipConfig, isSim, input)
//     }
//     else
//     {
//       val inputs = new Bundle{
//         val x0 = input.op1(genWidth/2-1 downto 0)
//         val x1 = input.op1(genWidth-1 downto genWidth/2)
//         val y0 = input.op2(genWidth/2-1 downto 0)
//         val y1 = input.op2(genWidth-1 downto genWidth/2)
//       }
//       val inputsForked = StreamFork(input, 3, true)

//       val mulInput0 = inputsForked(0).translateWith{
//         val payload = operands(genWidth/2)
//         payload.op1 := inputs.x1
//         payload.op2 := inputs.y1
//         payload
//       }
//       val mul0 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput0)

//       val mulInput1 = inputsForked(1).translateWith{
//         val payload = operands(genWidth/2 + 1)
//         payload.op1 := inputs.x0 +^ inputs.x1
//         payload.op2 := inputs.y0 +^ inputs.y1
//         payload
//       }
//       val mul1 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput1)

//       val mulInput2 = inputsForked(2).translateWith{
//         val payload = operands(genWidth/2)
//         payload.op1 := inputs.x0
//         payload.op2 := inputs.y1
//         payload
//       }
//       val mul2 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput2)

//       val mulInput3 = inputsForked(3).translateWith{
//         val payload = operands(genWidth/2)
//         payload.op1 := inputs.x0
//         payload.op2 := inputs.y0
//         payload
//       }
//       val mul3 = MultiplierGenerator(genWidth/2, ipConfig, isSim, mulInput3)

//       StreamJoin.arg(mul0, mul1, mul2, mul3).translateWith{
//         val payload = results(genWidth*2)
//         val tempRes = (mul0.res << genWidth) + ((mul1.res +^ mul2.res)<<(genWidth/2))
//         payload.res := tempRes + mul3.res
//         payload
//       }.stage()
//     }
//   }
// }

object MultiplierStream {
  def apply(
      width: Int,
      isSim: Boolean,
      ipConfig: MulIPConfig,
      input: Stream[operands]
  ): Stream[results] = {
    val mulInst = MultiplierStream(width, isSim, ipConfig)
    mulInst.io.input << input
    mulInst.io.output
  }
}

case class MultiplierStream(width: Int, isSim: Boolean, ipConfig: MulIPConfig)
    extends Component {
  val io = new Bundle {
    val input = slave Stream (operands(width))
    val output = master Stream (results(2 * width))
  }
  io.output << MultiplierStreamGenerator(width, ipConfig, isSim, io.input)
}

object MultiplierFlow {
  def latency(genWidth:Int, ipConfig:MulIPConfig):Int = {
    if(genWidth == ipConfig.inputWidth) {
      ipConfig.pipeStages
    } else{
      val nextWidth = (genWidth + 1)/2
      latency(nextWidth + 1, ipConfig) + 3
    }
  }

  def apply(
      width: Int,
      isSim: Boolean,
      ipConfig: MulIPConfig,
      input: Flow[operands]
  ): (Flow[results], Int) = {
    val mulInst = MultiplierFlow(width, isSim, ipConfig)
    mulInst.io.input << input
    (mulInst.io.output, mulInst.latency)
  }
}

case class MultiplierFlow(width: Int, isSim: Boolean, ipConfig: MulIPConfig)
    extends Component {
  val io = new Bundle {
    val input = slave Flow (operands(width))
    val output = master Flow (results(2 * width))
  }
  val (output, latency) =
    MultiplierFlowGenerator(width, ipConfig, isSim, io.input)
  io.output << output
}

//
object SimMultiplierIPVerilog {
  def main(args: Array[String]): Unit = {
    val ipConfig = MulIPConfig(
      inputWidth = 64,
      outputWidth = 128,
      isCE = true,
      isSCLR = true,
      pipeStages = 18,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(SimMultiplierIP(ipConfig))
  }
}

object MultiplierIPFlowVerilog {
  def main(args: Array[String]): Unit = {
    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MultiplierIPFlow(mulIPConfig, true))
  }
}

object MultiplierIPStreamVerilog {
  def main(args: Array[String]): Unit = {
    val ipConfig = MulIPConfig(
      inputWidth = 64,
      outputWidth = 128,
      isCE = true,
      isSCLR = true,
      pipeStages = 18,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MultiplierIPStream(ipConfig, true))
  }
}

object MultiplierStreamVerilog {
  def main(args: Array[String]): Unit = {
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
    ).generate(MultiplierStream(255, true, ipConfig))
  }
}

object MultiplierFlowVerilog {
  def main(args: Array[String]): Unit = {
    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MultiplierFlow(255, true, mulIPConfig))
  }
}
