package poseidon

import spinal.core._
import spinal.lib._

class PoseidonThread(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Stream (new Context(g))
    val output = master Stream (MDSContext(g))
  }

  val AddRoundConstantStage = new Area {
    val input = io.input
    val output = Stream(new Context(g))

    // round constants rom
    val config_t3 = RoundConstantsConfig(
      t = 3,
      round_num = 63,
      ports_num = 1,
      data_width = 255
    )
    val config_t5 = RoundConstantsConfig(
      t = 5,
      round_num = 64,
      ports_num = 1,
      data_width = 255
    )
    val config_t9 = RoundConstantsConfig(
      t = 9,
      round_num = 65,
      ports_num = 1,
      data_width = 255
    )
    val config_t12 = RoundConstantsConfig(
      t = 12,
      round_num = 65,
      ports_num = 1,
      data_width = 255
    )
    val roundConstants_t3 = new RoundConstants(config_t3)
    val roundConstants_t5 = new RoundConstants(config_t5)
    val roundConstants_t9 = new RoundConstants(config_t9)
    val roundConstants_t12 = new RoundConstants(config_t12)

    roundConstants_t3.io.read_ports(0).t_index := input.state_index.resized
    roundConstants_t5.io.read_ports(0).t_index := input.state_index.resized
    roundConstants_t9.io.read_ports(0).t_index := input.state_index.resized
    roundConstants_t12.io.read_ports(0).t_index := input.state_index.resized

    roundConstants_t3.io.read_ports(0).round_index := input.round_index.resized
    roundConstants_t5.io.read_ports(0).round_index := input.round_index.resized
    roundConstants_t9.io.read_ports(0).round_index := input.round_index.resized
    roundConstants_t12.io.read_ports(0).round_index := input.round_index.resized

    // ModAdder Instance
    val modAdder = ModAdder()
    modAdder.io.op1_i := input.state_element
    switch(input.state_size) {
      is(3) {
        modAdder.io.op2_i := roundConstants_t3.io.read_ports(0).data
      }
      is(5) {
        when(input.state_index === 5) {
          modAdder.io.op2_i := 0
        } otherwise {
          modAdder.io.op2_i := roundConstants_t5.io.read_ports(0).data
        }
      }
      is(9) {
        modAdder.io.op2_i := roundConstants_t9.io.read_ports(0).data
      }
      is(12) {
        modAdder.io.op2_i := roundConstants_t12.io.read_ports(0).data
      }
      default { modAdder.io.op2_i := 0 }
    }

    output.arbitrationFrom(input)
    output.payload.assignSomeByName(input.payload)
    output.state_element.allowOverride
    output.state_element := modAdder.io.res_o
  }

  val SBox5Stage = new Area {

    val input = AddRoundConstantStage.output.m2sPipe().s2mPipe()

    val SBoxNum = 3
    val SBox5Insts = for (i <- 0 until SBoxNum) yield new SBox5(g)
    val (demux_input, fifo_input) = StreamFork2(input, true)

    val DemuxSelect = OHToUInt(
      OHMasking.first(SBox5Insts.map(_.io.input.ready))
    )
    val SBox5InstsInputs = StreamDemux(demux_input, DemuxSelect, SBoxNum)
    (SBox5Insts.map(_.io.input), SBox5InstsInputs).zipped.foreach(_ << _)

    val select_fifo =
      fifo_input.translateWith(DemuxSelect).queueLowLatency(size = 20)
    val mux_output = StreamMux(select_fifo.payload, SBox5Insts.map(_.io.output))
    val output =
      StreamJoin.arg(mux_output, select_fifo).translateWith(mux_output.payload)
  }

  val MDSMixStage = new Area {
    val input = SBox5Stage.output.m2sPipe().s2mPipe()

    val MultiplierNum = 3
    val matrixMultiplierInsts =
      for (i <- 0 until MultiplierNum) yield new MDSMatrixMultiplier(g)

    val (demux_input, fifo_input) = StreamFork2(input, true)
    val DemuxSelect = OHToUInt(
      OHMasking.first(matrixMultiplierInsts.map(_.io.input.ready))
    )
    val MultiplierInputs = StreamDemux(demux_input, DemuxSelect, MultiplierNum)
    (matrixMultiplierInsts.map(_.io.input), MultiplierInputs).zipped
      .foreach(_ << _)

    val select_fifo =
      fifo_input.translateWith(DemuxSelect).queueLowLatency(size = 9)
    val mux_output =
      StreamMux(select_fifo.payload, matrixMultiplierInsts.map(_.io.output))
    val output =
      StreamJoin.arg(mux_output, select_fifo).translateWith(mux_output.payload)
  }
  MDSMixStage.output >> io.output
}

object PoseidonThreadVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      thread_num = 3,
      data_width = 255,
      id_width = 6
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonThread(config))
  }
}
