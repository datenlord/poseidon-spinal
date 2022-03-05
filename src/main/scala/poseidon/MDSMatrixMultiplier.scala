package poseidon

import spinal.core._
import spinal.lib._

case class MDSContext(g: PoseidonGenerics) extends Bundle {
  val round_index = UInt(log2Up(g.round_max) bits)
  val state_size = UInt(log2Up(g.t_max) bits)
  val state_id = UInt(g.id_width bits)
  val state_elements = Vec(UInt(g.data_width bits), g.t_max)
}

case class MDSMulContext(g: PoseidonGenerics) extends Bundle {
  val round_index = UInt(log2Up(g.round_max) bits)
  val state_size = UInt(log2Up(g.t_max) bits)
  val state_id = UInt(g.id_width bits)
}

object MDSMatrixMultiplier {
  def apply(
      g: PoseidonGenerics,
      mulConfig: MontMultiplierConfig,
      input: Stream[ContextCase]
  ): Stream[MDSContext] = {
    val MDSMultiplierInst = new MDSMatrixMultiplier(g, mulConfig)
    MDSMultiplierInst.io.input << input
    MDSMultiplierInst.io.output
  }
}

case class MDSMatrixMultiplier(
    g: PoseidonGenerics,
    mulConfig: MontMultiplierConfig
) extends Component {

  val io = new Bundle {
    val input = slave Stream (ContextCase(g))
    val output = master Stream (MDSContext(g))
  }

  // mds_matrix_rom
  val mdsMatrix_t3 =
    MDSMatrix(t = 3, dataWidth = g.data_width, io.input.state_index.resized)
  val mdsMatrix_t5 =
    MDSMatrix(t = 5, dataWidth = g.data_width, io.input.state_index.resized)
  val mdsMatrix_t9 =
    MDSMatrix(t = 9, dataWidth = g.data_width, io.input.state_index.resized)
  val mdsMatrix_t12 =
    MDSMatrix(t = 12, dataWidth = g.data_width, io.input.state_index.resized)
  // mdsMatrix_t3.io.address_port  := io.input.state_index.resized
  // mdsMatrix_t5.io.address_port  := io.input.state_index.resized
  // mdsMatrix_t9.io.address_port  := io.input.state_index.resized
  // mdsMatrix_t12.io.address_port := io.input.state_index.resized

  val mulOp2s = Vec(UInt(g.data_width bits), g.t_max)
  switch(io.input.state_size) {
    is(3) {
      mulOp2s.assignFromBits(
        B(0, (g.t_max - 3) * g.data_width bits) ## mdsMatrix_t3.asBits
      )
    }
    is(5) {
      when(io.input.state_index === 5) {
        mulOp2s.assignFromBits(B(0, g.t_max * g.data_width bits))
      } otherwise {
        mulOp2s.assignFromBits(
          B(0, (g.t_max - 5) * g.data_width bits) ## mdsMatrix_t5.asBits
        )
      }
    }
    is(9) {
      mulOp2s.assignFromBits(
        B(0, (g.t_max - 9) * g.data_width bits) ## mdsMatrix_t9.asBits
      )
    }
    is(12) {
      mulOp2s.assignFromBits(mdsMatrix_t12.asBits)
    }
    default {
      mulOp2s.assignFromBits(B(0, g.t_max * g.data_width bits))
    }
  }

  val inputForked = StreamFork(io.input, 2, true)

  val mulOp1s = StreamFork(
    inputForked(0).translateWith(io.input.state_element),
    g.t_max,
    true
  )

  val mulInputs =
    for (i <- 0 until g.t_max)
      yield mulOp1s(i).translateWith {
        val payload = operands(g.data_width)
        payload.op1 := mulOp1s(i).payload
        payload.op2 := mulOp2s(i)
        payload
      }

  val mulOutputs =
    if (g.isSim) {
      mulInputs.map(MontMultiplierPipedSim(mulConfig, _))
    } else {
      mulInputs.map(MontMultiplierPiped(mulConfig, _))
    }

  val mulContext = inputForked(1)
    .translateWith {
      val payload = MDSMulContext(g)
      payload.assignSomeByName(io.input.payload)
      payload
    }
    .queue(8)

  val mulResJoined = StreamJoin(mulOutputs)
  io.output << StreamJoin
    .arg(mulResJoined, mulContext)
    .translateWith {
      val payload = MDSContext(g)
      payload.assignSomeByName(mulContext.payload)
      payload.state_elements.assignFromBits(mulOutputs.map(_.res).asBits())
      payload
    }
    .stage()

}

object MDSMatrixMultiplierVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 5,
      data_width = 255,
      id_width = 4,
      isSim = true
    )

    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      radix = 16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      radix = 16
    )
    val mulConfig = MontMultiplierConfig(modulus, compensation, 255)

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new MDSMatrixMultiplier(config, mulConfig)).printPruned()
  }
}
