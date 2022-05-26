package poseidon
import spinal.core._
import spinal.lib._

// Blackbox used to instantiate Xilinx Multiplier IP
case class MulIPConfig(
    inputWidth: Int,
    outputWidth: Int,
    pipeStages: Int,
    moduleName: String
)

object MultiplierIP {
  def apply(
      g: MulIPConfig,
      inputA: UInt,
      inputB: UInt
  ): UInt = {
    val multiplierInst = MultiplierIP(g).setDefinitionName(g.moduleName)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    multiplierInst.io.outputP
  }
}

case class MultiplierIP(g: MulIPConfig) extends BlackBox {
  val io = new Bundle {
    val clk = in Bool ()
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputP = out UInt (g.outputWidth bits)
  }

  // map clock and reset signal
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
  def apply(
      g: MulIPConfig,
      inputA: UInt,
      inputB: UInt
  ): UInt = {
    val multiplierInst = SimMultiplierIP(g)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    multiplierInst.io.outputP
  }
}

case class SimMultiplierIP(g: MulIPConfig) extends Component {
  val io = new Bundle {
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputP = out UInt (g.outputWidth bits)
  }

  val mulRes = (io.inputA * io.inputB).resize(g.outputWidth)
  val stages = History(mulRes, g.pipeStages + 1)
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

  val validPipe = Delay(io.input.valid, g.pipeStages, init = True)
  io.output.valid := validPipe
  io.output.res := mulRes
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

object MultiplierFlow {
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
      pipeStages = 6,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MultiplierIPFlow(mulIPConfig, true))
  }
}

object MultiplierFlowVerilog {
  def main(args: Array[String]): Unit = {
    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      pipeStages = 6,
      moduleName = "mul_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MultiplierFlow(255, true, mulIPConfig))
  }
}
