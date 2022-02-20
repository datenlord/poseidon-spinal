package poseidon

import spinal.core._
import spinal.lib._

case class BasicContextCase(g: PoseidonGenerics) extends BasicContext(g) {}
case class ContextCase(g: PoseidonGenerics) extends Context(g) {}

object PoseidonThread {
  def apply(g: PoseidonGenerics, input: Stream[Context]): Stream[MDSContext] = {
    val threadInst = new PoseidonThread(g)
    threadInst.io.input << input
    threadInst.io.output
  }
}

class PoseidonThread(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Stream (new Context(g))
    val output = master Stream (MDSContext(g))
  }

  // define the configuration class of Montgomery multiplier
  val modulus = BigInt(
    "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
    radix = 16
  )
  val compensation = BigInt(
    "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
    radix = 16
  )
  val mulConfig = MontMultiplierConfig(modulus, compensation, 255)

  val AddRoundConstantStage = new Area {
    val input = io.input
    val output = Stream(new Context(g))

    // round constants rom
    // val config_t3  = RoundConstantsConfig(t = 3,round_num = 63,ports_num = 1,data_width = 255)
    // val config_t5  = RoundConstantsConfig(t = 5,round_num = 64,ports_num = 1,data_width = 255)
    // val config_t9  = RoundConstantsConfig(t = 9,round_num = 65,ports_num = 1,data_width = 255)
    // val config_t12 = RoundConstantsConfig(t = 12,round_num = 65,ports_num = 1,data_width = 255)
    val roundConstants_t3 = RoundConstantsT3()
    val roundConstants_t5 = RoundConstantsT5()
    val roundConstants_t9 = RoundConstantsT9()
    val roundConstants_t12 = RoundConstantsT12()

    roundConstants_t3.io.readPorts(0).tIndex := input.state_index.resized
    roundConstants_t5.io.readPorts(0).tIndex := input.state_index.resized
    roundConstants_t9.io.readPorts(0).tIndex := input.state_index.resized
    roundConstants_t12.io.readPorts(0).tIndex := input.state_index.resized

    roundConstants_t3.io.readPorts(0).roundIndex := input.round_index.resized
    roundConstants_t5.io.readPorts(0).roundIndex := input.round_index.resized
    roundConstants_t9.io.readPorts(0).roundIndex := input.round_index.resized
    roundConstants_t12.io.readPorts(0).roundIndex := input.round_index.resized

    // ModAdder Instance
    val modAdder = ModAdder()
    modAdder.io.op1_i := input.state_element
    switch(input.state_size) {
      is(3) {
        modAdder.io.op2_i := roundConstants_t3.io.readPorts(0).data
      }
      is(5) {
        when(input.state_index === 5) {
          modAdder.io.op2_i := 0
        } otherwise {
          modAdder.io.op2_i := roundConstants_t5.io.readPorts(0).data
        }
      }
      is(9) {
        modAdder.io.op2_i := roundConstants_t9.io.readPorts(0).data
      }
      is(12) {
        modAdder.io.op2_i := roundConstants_t12.io.readPorts(0).data
      }
      default { modAdder.io.op2_i := 0 }
    }

    output.arbitrationFrom(input)
    output.payload.assignSomeByName(input.payload)
    output.state_element.allowOverride
    output.state_element := modAdder.io.res_o
  }

  // SBox5 Stage
  val SBox5Stage = new Area {

    val input = AddRoundConstantStage.output.s2mPipe().m2sPipe()
    val inputForked = StreamFork(input, 2, true)

    // the first Montgomery Multiplier
    val mulInput0 = inputForked(0).translateWith {
      val payload = operands(g.data_width)
      payload.op1 := input.state_element
      payload.op2 := input.state_element
      payload
    }

    val mulRes0 =
      if (g.isSim) {
        MontMultiplierPipedSim(mulConfig, mulInput0)
      } else {
        MontMultiplierPiped(mulConfig, mulInput0)
      }

    // the second Montgomery Multiplier
    val mulInput1 = mulRes0.translateWith {
      val payload = operands(g.data_width)
      payload.op1 := mulRes0.res
      payload.op2 := mulRes0.res
      payload
    }

    val mulRes1 =
      if (g.isSim) {
        MontMultiplierPipedSim(mulConfig, mulInput1)
      } else {
        MontMultiplierPiped(mulConfig, mulInput1)
      }

    val tempContext1 = inputForked(1).queue(10)

    val tempOutput = StreamJoin(mulRes1, tempContext1)

    // the third Montgomery Multiplier
    val tempOutputForked = StreamFork(tempOutput, 2, true)
    val mulInput2 = tempOutputForked(0).translateWith {
      val payload = operands(g.data_width)
      payload.op1 := tempOutput.payload._1.res
      payload.op2 := tempOutput.payload._2.state_element
      payload
    }

    // when the code is used for simulation
    // MontMultiplierPipedSim is implemented for faster simulation
    val mulRes2 =
      if (g.isSim) {
        MontMultiplierPipedSim(mulConfig, mulInput2)
      } else {
        MontMultiplierPiped(mulConfig, mulInput2)
      }

    val tempContext2 = tempOutputForked(1)
      .translateWith {
        val payload = ContextCase(g)
        payload.assignSomeByName(tempOutputForked(1)._2)
        payload
      }
      .queue(6)

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

    val output = StreamJoin.arg(mulRes2, tempContext2).translateWith {
      val payload = new ContextCase(g)
      payload.assignSomeByName(tempContext2.payload)
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
    MDSMatrixMultiplier(g, mulConfig, SBox5Stage.output.stage())
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
      id_width = 6,
      isSim = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonThread(config))
  }
}
