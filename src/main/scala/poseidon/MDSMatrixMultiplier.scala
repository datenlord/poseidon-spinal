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
      mulConfig: MontMultConfig,
      ipConfig: MulIPConfig,
      input: Flow[ContextCase]
  ): Flow[MDSContext] = {
    val MDSMultiplierInst = new MDSMatrixMultiplier(g, mulConfig, ipConfig)
    MDSMultiplierInst.io.input << input
    MDSMultiplierInst.io.output
  }
}

case class MDSMatrixMultiplier(
    g: PoseidonGenerics,
    mulConfig: MontMultConfig,
    ipConfig: MulIPConfig
) extends Component {

  val io = new Bundle {
    val input = slave Flow (ContextCase(g))
    val output = master Flow (MDSContext(g))
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

  val mdsConstants = Vec(UInt(g.data_width bits), g.t_max)
  switch(io.input.state_size) {
    is(3) {
      mdsConstants.assignFromBits(
        B(0, (g.t_max - 3) * g.data_width bits) ## mdsMatrix_t3.asBits
      )
    }
    is(5) {
      when(io.input.state_index === 5) {
        mdsConstants.assignFromBits(B(0, g.t_max * g.data_width bits))
      } otherwise {
        mdsConstants.assignFromBits(
          B(0, (g.t_max - 5) * g.data_width bits) ## mdsMatrix_t5.asBits
        )
      }
    }
    is(9) {
      mdsConstants.assignFromBits(
        B(0, (g.t_max - 9) * g.data_width bits) ## mdsMatrix_t9.asBits
      )
    }
    is(12) {
      mdsConstants.assignFromBits(mdsMatrix_t12.asBits)
    }
    default {
      mdsConstants.assignFromBits(B(0, g.t_max * g.data_width bits))
    }
  }

  val mulInputs = for (i <- 0 until g.t_max) yield io.input.translateWith {
    operands(g.data_width, io.input.state_element, mdsConstants(i))
  }

  //val mulOutputs = mulInputs.map(MontgomeryMultStream(mulConfig, ipConfig, _))
  val mulOutputs = mulInputs.map(MontgomeryMultFlow(mulConfig, ipConfig, _))

  val mulContext = MDSMulContext(g)
  mulContext.assignSomeByName(io.input.payload)
  val mulContextDelayed = Delay(mulContext, mulOutputs(0)._2)

  // val mulResJoined = StreamJoin(mulOutputs)

  io.output.valid := mulOutputs.map(_._1.valid).asBits().andR
  io.output.payload.assignSomeByName(mulContextDelayed)
  io.output.payload.state_elements
    .assignFromBits(mulOutputs.map(_._1.res).asBits())
}

object MDSMatrixMultiplierVerilog {
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 5,
      data_width = 255,
      id_width = 8,
      isSim = true
    )

    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      16
    )
    val modInverse = BigInt(
      "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
      16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      16
    )
    val montMultConfig =
      MontMultConfig(255, 256, modulus, modInverse, compensation, true)

    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MDSMatrixMultiplier(poseidonConfig, montMultConfig, mulIPConfig))
  }
}
