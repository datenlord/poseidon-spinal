package poseidon
import spinal.core._
import spinal.lib._

case class AdderIPConfig(
    inputWidth: Int,
    outputWidth: Int,
    latency: Int,
    moduleName: String
)

object AdderIP {
  def apply(
      g: AdderIPConfig,
      inputA: UInt,
      inputB: UInt
  ): UInt = {
    val multiplierInst = AdderIP(g).setDefinitionName(g.moduleName)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    multiplierInst.io.outputS
  }
}

case class AdderIP(g: AdderIPConfig) extends BlackBox {
  val io = new Bundle {
    val clk = in Bool ()
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputS = out UInt (g.outputWidth bits)
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
    io.outputS.setName("S")
  }

  //Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}

// SimAdderIP with same behavior as Xilinx Adder IP used For Simulation
object SimAdderIP {
  def apply(
      g: AdderIPConfig,
      inputA: UInt,
      inputB: UInt
  ): UInt = {
    val adderInst = SimAdderIP(g)
    adderInst.io.inputA := inputA
    adderInst.io.inputB := inputB
    adderInst.io.outputS
  }
}

case class SimAdderIP(g: AdderIPConfig) extends Component {
  val io = new Bundle {
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputS = out UInt (g.outputWidth bits)
  }

  val adderRes = io.inputA +^ io.inputB
  val stages = History(adderRes, g.latency + 1)
  io.outputS := stages.last.resize(g.outputWidth)
}

// wrap Xilinx Adder IP with Flow interface
object AdderIPFlow {
  def apply(
      g: AdderIPConfig,
      isSim: Boolean,
      input: Flow[operands]
  ): Flow[results] = {
    val multiplierInst = AdderIPFlow(g, isSim)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class AdderIPFlow(g: AdderIPConfig, isSim: Boolean) extends Component {

  val io = new Bundle {
    val input = slave Flow (operands(g.inputWidth))
    val output = master Flow (results(g.outputWidth))
  }

  val validDelayed = Delay(io.input.valid, g.latency, init = False)
  io.output.valid := validDelayed

  val adderRes = if (isSim) {
    SimAdderIP(g, io.input.op1, io.input.op2)
  } else {
    AdderIP(g, io.input.op1, io.input.op2)
  }

  io.output.res := adderRes
}

case class ModAdderConfig(
    dataWidth: Int,
    modulus: BigInt,
    compensation: BigInt,
    isSim: Boolean
)

object ModularAdderFlow {
  def apply(
      config: ModAdderConfig,
      ipConfig: AdderIPConfig,
      input: Flow[operands]
  ): Flow[results] = {
    val modAdderInst = ModularAdderFlow(config, ipConfig)
    modAdderInst.io.input << input
    modAdderInst.io.output
  }
}

case class ModularAdderFlow(config: ModAdderConfig, ipConfig: AdderIPConfig)
    extends Component {

  val io = new Bundle {
    val input = slave Flow (operands(config.dataWidth))
    val output = master Flow (results(config.dataWidth))
  }

  require(config.dataWidth == ipConfig.inputWidth)
  require(config.dataWidth + 1 == ipConfig.outputWidth)

  val adderRes1 = AdderIPFlow(ipConfig, config.isSim, io.input)

  val adderInput2 = adderRes1.translateWith {
    operands(
      ipConfig.inputWidth,
      adderRes1.res.resized,
      U(config.compensation, ipConfig.inputWidth bits)
    )
  }

  val adderRes2 = AdderIPFlow(ipConfig, config.isSim, adderInput2)
  val res1Delayed = Delay(adderRes1.res, ipConfig.latency)

  io.output << adderRes2
    .translateWith {
      val payload = results(config.dataWidth)
      payload.res := Mux(
        adderRes2.res.msb | res1Delayed.msb,
        adderRes2.res,
        res1Delayed
      ).resized
      payload
    }
    .stage()

  val totalLatency = ipConfig.latency * 2 + 1
}

object AdderIPFlowVerilog {
  def main(args: Array[String]): Unit = {
    val config = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      latency = 5,
      moduleName = "adder0"
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(AdderIPFlow(config, false))
  }
}

object ModularAdderFlowVerilog {
  def main(args: Array[String]): Unit = {
    val ipConfig = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      latency = 6,
      moduleName = "adder0"
    )
    val config = ModAdderConfig(
      255,
      PoseidonParam.modulus,
      PoseidonParam.compensation,
      true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(ModularAdderFlow(config, ipConfig))
  }
}
