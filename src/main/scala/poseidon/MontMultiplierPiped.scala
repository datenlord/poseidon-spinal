package poseidon

import spinal.core._
import spinal.lib._

// configuration class of the one-bit full adder array
case class AdderArrayConfig(modulus: BigInt, rowNum: Int, dataWidth: Int)
case class OneBitFullAdderArray(g: AdderArrayConfig) extends BlackBox {
  //addGeneric(name = "MODULUS",g.modulus)
  addGeneric(name = "ROW_NUM", g.rowNum)
  addGeneric(name = "DATA_WIDTH", g.dataWidth)

  val io = new Bundle {
    val input = new Bundle {
      val xTemp = in UInt (g.rowNum bits)
      val yTemp = in UInt (g.dataWidth bits)
      val yAddM = in UInt (g.dataWidth + 1 bits)
      val sum = in UInt (g.dataWidth + 1 bits)
      val carry = in UInt (g.dataWidth + 1 bits)
    }
    val output = new Bundle {
      val sum = out UInt (g.dataWidth + 1 bits)
      val carry = out UInt (g.dataWidth + 1 bits)
    }
  }

  noIoPrefix()
  //rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.input.xTemp.setName("x_temp_i")
    io.input.yTemp.setName("y_temp_i")
    io.input.yAddM.setName("y_add_m_i")
    io.input.sum.setName("sum_i")
    io.input.carry.setName("carry_i")
    io.output.sum.setName("sum_o")
    io.output.carry.setName("carry_o")
  }
  // Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}

object OneBitFullAdderArray {
  def apply(
      g: AdderArrayConfig,
      input: MultiplierContext,
      carry: UInt,
      sum: UInt
  ): Unit = {
    val arrayInst = OneBitFullAdderArray(g)
    arrayInst.io.input.xTemp := input.xTemp.resized
    arrayInst.io.input.yTemp := input.yTemp
    arrayInst.io.input.yAddM := input.yAddM
    arrayInst.io.input.sum := input.sum
    arrayInst.io.input.carry := input.carry

    carry := arrayInst.io.output.carry
    sum := arrayInst.io.output.sum
  }
}

// configuration class of the Montgomery Multiplier
case class MontMultiplierConfig(
    modulus: BigInt,
    compensation: BigInt,
    dataWidth: Int,
    rWidth: Int,
    radix: Int
)

case class MultiplierContext(g: MontMultiplierConfig) extends Bundle {
  val xTemp = UInt(g.rWidth bits)
  val yTemp = UInt(g.dataWidth bits)
  val yAddM = UInt(g.dataWidth + 1 bits)
  val sum = UInt(g.dataWidth + 1 bits)
  val carry = UInt(g.dataWidth + 1 bits)
}

object MontMultiplierPiped {
  def apply(
      g: MontMultiplierConfig,
      input: Stream[operands]
  ): Stream[results] = {
    val multiplierInst = MontMultiplierPiped(g)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class MontMultiplierPiped(g: MontMultiplierConfig) extends Component {

  val io = new Bundle {
    val input = slave Stream (operands(g.dataWidth))
    val output = master Stream (results(g.dataWidth))
  }

  val preComputation = new Area {
    val initialContext = MultiplierContext(g)
    initialContext.xTemp := io.input.op1.resized
    initialContext.yTemp := io.input.op2
    initialContext.yAddM := io.input.op2 +^ U(g.modulus)
    initialContext.sum := 0
    initialContext.carry := 0
    val output = io.input.translateWith(initialContext).m2sPipe().s2mPipe()
  }

  val adderPipeline = new Area {
    val input = preComputation.output

    val tempRes = Vec(Stream(MultiplierContext(g)), g.rWidth / g.radix + 1)
    tempRes(0) << input

    for (i <- 0 until g.rWidth / g.radix) {
      val temp = MultiplierContext(g)
      temp.xTemp := tempRes(i).xTemp |>> g.radix
      temp.yTemp := tempRes(i).yTemp
      temp.yAddM := tempRes(i).yAddM
      val arrayConfig = AdderArrayConfig(g.modulus, g.radix, g.dataWidth)
      OneBitFullAdderArray(
        arrayConfig,
        tempRes(i).payload,
        temp.carry,
        temp.sum
      )
      tempRes(i + 1) << tempRes(i).translateWith(temp).m2sPipe()
    }
    val output = tempRes(g.rWidth / g.radix).s2mPipe()
  }

  val resCombination = new Area {
    val input = adderPipeline.output
    val output = Stream(results(g.dataWidth))
    val sumAddCarry = (input.sum |>> 1) + input.carry
    val tempRes =
      sumAddCarry.resize(g.dataWidth) +^ U(g.compensation, g.dataWidth bits)
    when(tempRes.msb | sumAddCarry.msb) {
      output.res := tempRes.resized
    } otherwise {
      output.res := sumAddCarry.resized
    }
    output.arbitrationFrom(input)
  }

  io.output << resCombination.output.stage()
}

// MontMultiplierPipedSim has the same function with MontMultiplierPiped
// MontMultiplierPipedSim is used for faster simulation

case class OneBitFullAdderArraySim(g: AdderArrayConfig) extends BlackBox {
  //addGeneric(name = "MODULUS",g.modulus)
  addGeneric(name = "ROW_NUM", g.rowNum)
  addGeneric(name = "DATA_WIDTH", g.dataWidth)

  val io = new Bundle {
    val input = new Bundle {
      val xTemp = in UInt (g.rowNum bits)
      val yTemp = in UInt (g.dataWidth bits)
      val yAddM = in UInt (g.dataWidth + 1 bits)
      val adderRes = in UInt (g.dataWidth + 1 bits)
    }
    val output = new Bundle {
      val adderRes = out UInt (g.dataWidth + 1 bits)
    }
  }

  noIoPrefix()
  //rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.input.xTemp.setName("x_temp_i")
    io.input.yTemp.setName("y_temp_i")
    io.input.yAddM.setName("y_add_m_i")
    io.input.adderRes.setName("adder_res_i")
    io.output.adderRes.setName("adder_res_o")
  }
  addPrePopTask(() => renameIO())
}

object OneBitFullAdderArraySim {
  def apply(g: AdderArrayConfig, input: MultiplierContextSim): UInt = {
    val arrayInst = OneBitFullAdderArraySim(g)
    arrayInst.io.input.xTemp := input.xTemp.resized
    arrayInst.io.input.yTemp := input.yTemp
    arrayInst.io.input.yAddM := input.yAddM
    arrayInst.io.input.adderRes := input.adderRes
    arrayInst.io.output.adderRes
  }
}

object MontMultiplierPipedSim {
  def apply(
      g: MontMultiplierConfig,
      input: Stream[operands]
  ): Stream[results] = {
    val multiplierInst = MontMultiplierPipedSim(g)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class MultiplierContextSim(g: MontMultiplierConfig) extends Bundle {
  val xTemp = UInt(g.rWidth bits)
  val yTemp = UInt(g.dataWidth bits)
  val yAddM = UInt(g.dataWidth + 1 bits)
  val adderRes = UInt(g.dataWidth + 1 bits)
}

case class MontMultiplierPipedSim(g: MontMultiplierConfig) extends Component {

  val io = new Bundle {
    val input = slave Stream (operands(g.dataWidth))
    val output = master Stream (results(g.dataWidth))
  }

  val preComputation = new Area {
    val initialContext = MultiplierContextSim(g)
    initialContext.xTemp := io.input.op1.resized
    initialContext.yTemp := io.input.op2
    initialContext.yAddM := io.input.op2 +^ U(g.modulus)
    initialContext.adderRes := 0
    val output = io.input.translateWith(initialContext).m2sPipe().s2mPipe()
  }

  val adderPipeline = new Area {
    val input = preComputation.output

    val tempRes = Vec(Stream(MultiplierContextSim(g)), g.rWidth / g.radix + 1)
    tempRes(0) << input

    for (i <- 0 until g.rWidth / g.radix) {
      val temp = MultiplierContextSim(g)
      temp.xTemp := tempRes(i).xTemp |>> g.radix
      temp.yTemp := tempRes(i).yTemp
      temp.yAddM := tempRes(i).yAddM
      val arrayConfig = AdderArrayConfig(g.modulus, g.radix, g.dataWidth)
      temp.adderRes := OneBitFullAdderArraySim(arrayConfig, tempRes(i).payload)
      tempRes(i + 1) << tempRes(i).translateWith(temp).m2sPipe()
    }
    val output = tempRes(g.rWidth / g.radix).s2mPipe()
  }

  val resCombination = new Area {
    val input = adderPipeline.output
    val output = Stream(results(g.dataWidth))
    val tempRes =
      input.adderRes.resize(g.dataWidth) +^ U(g.compensation, g.dataWidth bits)
    when(tempRes.msb | input.adderRes.msb) {
      output.res := tempRes.resized
    } otherwise {
      output.res := input.adderRes.resized
    }
    output.arbitrationFrom(input)
  }
  io.output << resCombination.output.stage()
}

object MontMultiplierPipedSim2 {
  def apply(
      g: MontMultiplierConfig,
      input: Stream[operands]
  ): Stream[results] = {
    val multiplierInst = MontMultiplierPipedSim2(g)
    multiplierInst.io.input << input
    multiplierInst.io.output
  }
}

case class MultiplierContextSim2(dataWidth: Int) extends Bundle {
  val res = UInt(dataWidth bits)
}

case class MontMultiplierPipedSim2(g: MontMultiplierConfig) extends Component {

  val io = new Bundle {
    val input = slave Stream (operands(g.dataWidth))
    val output = master Stream (results(g.dataWidth))
  }

  val preComputation = new Area {
    val initialContext = MultiplierContextSim2(g.dataWidth)
    val temp0 = (io.input.op1 * io.input.op2).resize(g.rWidth)
    val inverse = BigInt(
      "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
      16
    )
    val temp1 = (temp0 * U(inverse, g.dataWidth bits)).resize(g.rWidth)
    val temp2 = (io.input.op1 * io.input.op2 +^ temp1 * g.modulus)
    initialContext.res := ((temp2 |>> g.rWidth) % g.modulus).resized
    val output = io.input.translateWith(initialContext).s2mPipe().m2sPipe()
  }

  val adderPipeline = new Area {
    val input = preComputation.output

    val tempRes =
      Vec(Stream(MultiplierContextSim2(g.dataWidth)), g.rWidth / g.radix + 1)
    tempRes(0) << input

    for (i <- 0 until g.rWidth / g.radix) {
      val temp = MultiplierContextSim2(g.dataWidth)
      temp.res := tempRes(i).res
      tempRes(i + 1) << tempRes(i).translateWith(temp).m2sPipe()
    }

    val output = tempRes(g.rWidth / g.radix).s2mPipe()
  }

  val resCombination = new Area {
    val input = adderPipeline.output
    val output = Stream(results(g.dataWidth))
    output.arbitrationFrom(input)
    output.res := input.res
  }
  io.output << resCombination.output.stage()
}


object MontMultiplierPipedVerilog {
  def main(args: Array[String]): Unit = {

    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      radix = 16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      radix = 16
    )

    val config = MontMultiplierConfig(modulus, compensation, 255, 255, 5)
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new MontMultiplierPiped(config))
  }
}

object MontMultiplierPipedSimVerilog {
  def main(args: Array[String]): Unit = {
    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      radix = 16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      radix = 16
    )
    val config = MontMultiplierConfig(modulus, compensation, 255, 256, 4)
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontMultiplierPipedSim(config))
  }
}

object MontMultiplierPipedSim2Verilog {
  def main(args: Array[String]): Unit = {
    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      radix = 16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      radix = 16
    )
    val config = MontMultiplierConfig(modulus, compensation, 255, 256, 4)
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontMultiplierPipedSim2(config))
  }
}
