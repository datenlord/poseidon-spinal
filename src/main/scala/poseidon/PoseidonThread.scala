package poseidon

import spinal.core._
import spinal.lib._

case class BasicContextCase(g: PoseidonGenerics) extends BasicContext(g) {}
case class ContextCase(g: PoseidonGenerics) extends Context(g) {}

object PoseidonThread {
  def apply(g: PoseidonGenerics, input: Flow[Context]): Flow[MDSContext] = {
    val threadInst = new PoseidonThread(g)
    threadInst.io.input << input
    threadInst.io.output
  }
}

class PoseidonThread(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Flow (new Context(g))
    val output = master Flow (MDSContext(g))
  }

  // define constants used in Montgomery Multiplier
  val modulus = BigInt(
    "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
    radix = 16
  )
  val modInverse = BigInt(
    "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
    radix = 16
  )
  val compensation = BigInt(
    "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
    radix = 16
  )

  // set configuration parameters of Xilinx Multiplier IP implemented through LUTs
  val mulIPConfig1 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    isCE = false,
    isSCLR = false,
    pipeStages = 6,
    moduleName = "mult_gen_0"
  )

  // set configuration parameters of Xilinx Multiplier IP implemented through DSP slices
  val mulIPConfig2 = MulIPConfig(
    inputWidth = 34,
    outputWidth = 68,
    isCE = false,
    isSCLR = false,
    pipeStages = 6,
    moduleName = "mult_gen_1"
  )

  // set configuration parameters of MontgomeryMult implemented through Xilinx Multiplier IP
  val montMultConfig = MontMultConfig(
    dataWidth = g.data_width,
    rWidth = g.data_width + 1,
    modulus = modulus,
    modInverse = modInverse,
    compensation = compensation,
    isSim = g.isSim
  )

  // set configuration parameters of Xilinx Adder IP implemented through LUT
  val adderIPConfig = AdderIPConfig(
    inputWidth = 255,
    outputWidth = 256,
    latency = 16,
    moduleName = "c_addsub_0"
  )
  // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
  val modAdderConfig = ModAdderConfig(
    dataWidth = g.data_width,
    modulus = modulus,
    compensation = compensation,
    isSim = g.isSim
  )

  val AddRoundConstantStage = new Area {
    val input = io.input

    // round constants rom
    val configT3 = RoundConstantsConfig(
      t = 3,
      roundNum = 63,
      portsNum = 1,
      dataWidth = 255,
      memType = g.constantMemType
    )
    val configT5 = RoundConstantsConfig(
      t = 5,
      roundNum = 64,
      portsNum = 1,
      dataWidth = 255,
      memType = g.constantMemType
    )
    val configT9 = RoundConstantsConfig(
      t = 9,
      roundNum = 65,
      portsNum = 1,
      dataWidth = 255,
      memType = g.constantMemType
    )
    val configT12 = RoundConstantsConfig(
      t = 12,
      roundNum = 65,
      portsNum = 1,
      dataWidth = 255,
      memType = g.constantMemType
    )
    val roundConstantsT3 = RoundConstants(configT3)
    val roundConstantsT5 = RoundConstants(configT5)
    val roundConstantsT9 = RoundConstants(configT9)
    val roundConstantsT12 = RoundConstants(configT12)

    roundConstantsT3.io.readPorts(0).tIndex := input.state_index.resized
    roundConstantsT5.io.readPorts(0).tIndex := input.state_index.resized
    roundConstantsT9.io.readPorts(0).tIndex := input.state_index.resized
    roundConstantsT12.io.readPorts(0).tIndex := input.state_index.resized

    roundConstantsT3.io.readPorts(0).roundIndex := input.round_index.resized
    roundConstantsT5.io.readPorts(0).roundIndex := input.round_index.resized
    roundConstantsT9.io.readPorts(0).roundIndex := input.round_index.resized
    roundConstantsT12.io.readPorts(0).roundIndex := input.round_index.resized

    //TODO: Synchronous memory read
    val tempInput = if (g.constantMemType) input else input.stage()

    // ModAdder Instance
    val adderOperands = operands(g.data_width)
    adderOperands.op1 := tempInput.state_element

    switch(input.state_size) {
      is(3) {
        adderOperands.op2 := roundConstantsT3.io.readPorts(0).data
      }
      is(5) {
        when(input.state_index === 5) {
          adderOperands.op2 := 0
        } otherwise {
          adderOperands.op2 := roundConstantsT5.io.readPorts(0).data
        }
      }
      is(9) {
        adderOperands.op2 := roundConstantsT9.io.readPorts(0).data
      }
      is(12) {
        adderOperands.op2 := roundConstantsT12.io.readPorts(0).data
      }
      default { adderOperands.op2 := 0 }
    }

    val modAdder = ModularAdderFlow(modAdderConfig, adderIPConfig)
    modAdder.io.input << input.translateWith(adderOperands)
    val adderContext = BasicContextCase(g)
    adderContext.assignSomeByName(input.payload)
    val adderContextDelayed = Delay(adderContext, modAdder.totalLatency)

    val output = modAdder.io.output.translateWith {
      val payload = ContextCase(g)
      payload.assignSomeByName(adderContextDelayed)
      payload.state_element := modAdder.io.output.res
      payload
    }
  }

  // SBox5 Stage
  val SBox5Stage = new Area {

    val input = AddRoundConstantStage.output.stage()

    // the first Montgomery Multiplier
    val mulInput0 = input.translateWith(
      operands(g.data_width, input.state_element, input.state_element)
    )
    val montMultiplier0 = MontgomeryMultFlow(montMultConfig, mulIPConfig1)
    montMultiplier0.io.input << mulInput0
    val mulRes0 = montMultiplier0.io.output

    // the second Montgomery Multiplier
    val mulInput1 =
      mulRes0.translateWith(operands(g.data_width, mulRes0.res, mulRes0.res))
    val montMultiplier1 = MontgomeryMultFlow(montMultConfig, mulIPConfig1)
    montMultiplier1.io.input << mulInput1
    val mulRes1 = montMultiplier1.io.output

    val tempContext1 = Delay(
      input.payload,
      montMultiplier0.totalLatency + montMultiplier1.totalLatency
    )

    // the third Montgomery Multiplier
    val mulInput2 = mulRes1.translateWith {
      operands(g.data_width, mulRes1.res, tempContext1.state_element)
    }
    val montMultiplier2 = MontgomeryMultFlow(montMultConfig, mulIPConfig2)
    montMultiplier2.io.input << mulInput2
    val mulRes2 = montMultiplier2.io.output

    val tempContext2 = Delay(tempContext1, montMultiplier2.totalLatency)

    // decide whether SBox5 is bypassed
    val partialRound = False
    switch(tempContext2.state_size) {
      is(3) {
        partialRound := (tempContext2.round_index >= 4) && (tempContext2.round_index < 59)
      }
      is(5) {
        partialRound := (tempContext2.round_index >= 4) && (tempContext2.round_index < 60)
      }
      is(9) {
        partialRound := (tempContext2.round_index >= 4) && (tempContext2.round_index < 61)
      }
      is(12) {
        partialRound := (tempContext2.round_index >= 4) && (tempContext2.round_index < 61)
      }
    }
    val bypassSBox5 = (partialRound) && (tempContext2.state_index =/= 0)

    val output = mulRes2.translateWith {
      val payload = new ContextCase(g)
      payload.assignSomeByName(tempContext2)
      payload.state_element.allowOverride
      payload.state_element := Mux(
        bypassSBox5,
        tempContext2.state_element,
        mulRes2.res
      )
      payload
    }
  }

  // MDS Mixing
  // MDS Multiplication
  val mdsMulOutput =
    MDSMatrixMultiplier(
      g,
      montMultConfig,
      mulIPConfig2,
      SBox5Stage.output.stage()
    )
  // MDS Addition
  io.output << MDSMatrixAdders(g, mdsMulOutput)

}

object PoseidonThreadVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 3,
      data_width = 255,
      id_width = 8,
      isSim = true,
      constantMemType = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonThread(config))
  }
}
