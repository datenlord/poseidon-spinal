package poseidon
import spinal.core._
import spinal.lib._

case class AdderIPConfig(
    inputWidth: Int,
    outputWidth: Int,
    isCLK: Boolean = true,
    isSCLR: Boolean = false,
    isCE: Boolean = false,
    isCin: Boolean = false,
    isCout: Boolean = false,
    latency: Int,
    moduleName: String
)

object AdderIP {
  def apply(
      g: AdderIPConfig,
      inputA: UInt,
      inputB: UInt,
      ena: Bool = null,
      cin: Bool = null,
      cout: Bool = null
  ): UInt = {
    require(!(g.isCE && (ena == null)))
    require(!(g.isCin && (cin == null)))
    require(!(g.isCout && (cout == null)))
    val multiplierInst = AdderIP(g).setDefinitionName(g.moduleName)
    multiplierInst.io.inputA := inputA
    multiplierInst.io.inputB := inputB
    if (g.isCE) multiplierInst.io.ena := ena
    if (g.isCin) multiplierInst.io.inputC := cin
    if (g.isCout) cout := multiplierInst.io.outputC
    multiplierInst.io.outputS
  }
}

case class AdderIP(g: AdderIPConfig) extends BlackBox {
  val io = new Bundle {
    val clk = if (g.isCLK) (in Bool ()) else null
    val rst = if (g.isSCLR) (in Bool ()) else null
    val ena = if (g.isCE) (in Bool ()) else null
    val inputC = if (g.isCin) (in Bool ()) else null
    val inputA, inputB = in UInt (g.inputWidth bits)
    val outputC = if (g.isCout) (out Bool ()) else null
    val outputS = out UInt (g.outputWidth bits)
  }

  // map clock and reset signal
  mapClockDomain(clock = io.clk, reset = io.rst)

  //Remove io_ prefix
  noIoPrefix()

  //Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    if (g.isCLK) io.clk.setName("CLK")
    if (g.isSCLR) io.rst.setName("SCLR")
    if (g.isCE) io.ena.setName("CE")
    if (g.isCin) io.inputC.setName("C_IN")
    if (g.isCout) io.outputC.setName("C_OUT")
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
      inputB: UInt,
      ena: Bool = null,
      cin: Bool = null,
      cout: Bool = null
  ): UInt = {
    require(!(g.isCE && (ena == null)))
    require(!(g.isCin && (cin == null)))
    require(!(g.isCout && (cout == null)))

    val adderInst = SimAdderIP(g)
    adderInst.io.inputA := inputA
    adderInst.io.inputB := inputB
    if (g.isCE) adderInst.io.ena := ena
    if (g.isCin) adderInst.io.inputC := cin
    if (g.isCout) cout := adderInst.io.outputC
    adderInst.io.outputS
  }
}

case class SimAdderIP(g: AdderIPConfig) extends Component {
  val io = new Bundle {
    val inputA, inputB = in UInt (g.inputWidth bits)
    val ena = if (g.isCE) (in Bool ()) else null
    val inputC = if (g.isCin) (in Bool ()) else null
    val outputC = if (g.isCout) (out Bool ()) else null
    val outputS = out UInt (g.outputWidth bits)

  }

  val adderRes = if (g.isCin) {
    io.inputA +^ io.inputB +^ io.inputC.asUInt
  } else {
    io.inputA +^ io.inputB
  }
  val initValue = if (g.isSCLR) U(0, widthOf(adderRes) bits) else null
  val stages = History(adderRes, g.latency + 1, io.ena, initValue)
  io.outputS := stages.last.resize(g.outputWidth)
  if (g.isCout) io.outputC := stages.last.msb
}

// wrap Xilinx Adder IP with Stream interface
object AdderIPStream {
  def apply(
      g: AdderIPConfig,
      isSim: Boolean,
      input: Stream[operands]
  ): Stream[results] = {
    require(g.isCE == true)
    require(g.isCin == false)
    require(g.isCout == false)

    val multiplierInst = AdderIPStream(g, isSim)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class AdderIPStream(g: AdderIPConfig, isSim: Boolean) extends Component {

  val io = new Bundle {
    val input = slave Stream (operands(g.inputWidth))
    val output = master Stream (results(g.outputWidth))
  }
  require(g.isCE == true)
  require(g.isCin == false)
  require(g.isCout == false)

  val initValue = if (g.isSCLR) False else null
  val validPipe =
    History(io.input.valid, g.latency + 1, io.input.ready, initValue)
  io.output.valid := validPipe.last
  io.input.ready := !io.output.valid | io.output.ready

  val adderRes = if (isSim) {
    SimAdderIP(g, io.input.op1, io.input.op2, ena = io.input.ready)
  } else {
    AdderIP(g, io.input.op1, io.input.op2, ena = io.input.ready)
  }

  io.output.res := adderRes
}

// wrap Xilinx Adder IP with Flow interface
object AdderIPFlow {
  def apply(
      g: AdderIPConfig,
      isSim: Boolean,
      input: Flow[operands]
  ): Flow[results] = {
    require(g.isCin == false)
    require(g.isCout == false)

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
  require(g.isCin == false)
  require(g.isCout == false)

  val initValue = if (g.isSCLR | isSim) False else null
  val validDelayed = Delay(io.input.valid, g.latency, init = initValue)
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

  def latency(ipConfig:AdderIPConfig):Int = {
    2*ipConfig.latency + 1
  }

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

case class ModularAdderFlow(config: ModAdderConfig, ipConfig: AdderIPConfig) extends Component {

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

  val latency = ipConfig.latency * 2 + 1
}

object AdderIPStreamVerilog {
  def main(args: Array[String]): Unit = {
    val config = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      isCLK = true,
      isCE = true,
      isSCLR = true,
      isCin = false,
      isCout = false,
      latency = 6,
      moduleName = "adder0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(AdderIPStream(config, false))
  }
}

object AdderIPFlowVerilog {
  def main(args: Array[String]): Unit = {
    val config = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      isCLK = true,
      isCE = false,
      isSCLR = false,
      isCin = false,
      isCout = false,
      latency = 6,
      moduleName = "adder0"
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(AdderIPFlow(config, false))
  }
}

object SimAdderIPVerilog {
  def main(args: Array[String]): Unit = {
    val config = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      isCLK = true,
      isCE = false,
      isSCLR = false,
      isCin = false,
      isCout = false,
      latency = 6,
      moduleName = "adder"
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(SimAdderIP(config))
  }
}

object ModularAdderFlowVerilog {
  def main(args: Array[String]): Unit = {
    val ipConfig = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      isCLK = true,
      isCE = false,
      isSCLR = true,
      isCin = false,
      isCout = false,
      latency = 6,
      moduleName = "adder0"
    )
    val modulus = BigInt(
      "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
      16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      radix = 16
    )
    val config = ModAdderConfig(255, modulus, compensation, true)
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(ModularAdderFlow(config, ipConfig))
  }
}
