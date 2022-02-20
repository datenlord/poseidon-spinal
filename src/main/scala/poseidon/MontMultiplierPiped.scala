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
    dataWidth: Int
)

case class MultiplierContext(dataWidth: Int) extends Bundle {
  val xTemp = UInt(dataWidth bits)
  val yTemp = UInt(dataWidth bits)
  val yAddM = UInt(dataWidth + 1 bits)
  val sum = UInt(dataWidth + 1 bits)
  val carry = UInt(dataWidth + 1 bits)
  val counter = UInt(log2Up(51) bits)
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
    val initialContext = MultiplierContext(g.dataWidth)
    initialContext.xTemp := io.input.op1
    initialContext.yTemp := io.input.op2
    initialContext.yAddM := io.input.op2 +^ U(g.modulus)
    initialContext.sum := 0
    initialContext.carry := 0
    initialContext.counter := 0
    val output = io.input.translateWith(initialContext).stage()
  }

  val adderPipeline = new Area {
    val input = preComputation.output
    val loopback = Stream(MultiplierContext(g.dataWidth))

    val tempRes = Vec(Stream(MultiplierContext(g.dataWidth)), 4)
    tempRes(0) << StreamArbiterFactory.lowerFirst.onArgs(loopback, input)

    for (i <- 0 until 3) {
      val temp = MultiplierContext(g.dataWidth)
      temp.xTemp := tempRes(i).xTemp |>> 5
      temp.yTemp := tempRes(i).yTemp
      temp.yAddM := tempRes(i).yAddM
      temp.counter := tempRes(i).counter + 1
      val arrayConfig = AdderArrayConfig(g.modulus, 5, g.dataWidth)
      OneBitFullAdderArray(
        arrayConfig,
        tempRes(i).payload,
        temp.carry,
        temp.sum
      )
      tempRes(i + 1) << tempRes(i).translateWith(temp).stage()
    }
    val select = tempRes(3).valid && (tempRes(3).counter === 51)
    val twoStreams = StreamDemux(tempRes(3), select.asUInt, 2)
    val output = twoStreams(1)
    loopback </< twoStreams(0)
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

case class MultiplierContextSim(dataWidth: Int) extends Bundle {
  val xTemp = UInt(dataWidth bits)
  val yTemp = UInt(dataWidth bits)
  val yAddM = UInt(dataWidth + 1 bits)
  val adderRes = UInt(dataWidth + 1 bits)
  val counter = UInt(log2Up(51) bits)
}

case class MontMultiplierPipedSim(g: MontMultiplierConfig) extends Component {

  val io = new Bundle {
    val input = slave Stream (operands(g.dataWidth))
    val output = master Stream (results(g.dataWidth))
  }

  val preComputation = new Area {
    val initialContext = MultiplierContextSim(g.dataWidth)
    initialContext.xTemp := io.input.op1
    initialContext.yTemp := io.input.op2
    initialContext.yAddM := io.input.op2 +^ U(g.modulus)
    initialContext.adderRes := 0
    initialContext.counter := 0
    val output = io.input.translateWith(initialContext).stage()
  }

  val adderPipeline = new Area {
    val input = preComputation.output
    val loopback = Stream(MultiplierContextSim(g.dataWidth))

    val tempRes = Vec(Stream(MultiplierContextSim(g.dataWidth)), 4)
    tempRes(0) << StreamArbiterFactory.lowerFirst.onArgs(loopback, input)

    for (i <- 0 until 3) {
      val temp = MultiplierContextSim(g.dataWidth)
      temp.xTemp := tempRes(i).xTemp |>> 5
      temp.yTemp := tempRes(i).yTemp
      temp.yAddM := tempRes(i).yAddM
      temp.counter := tempRes(i).counter + 1
      val arrayConfig = AdderArrayConfig(g.modulus, 5, g.dataWidth)
      temp.adderRes := OneBitFullAdderArraySim(arrayConfig, tempRes(i).payload)
      tempRes(i + 1) << tempRes(i).translateWith(temp).stage()
    }
    val select = tempRes(3).valid && (tempRes(3).counter === 51)
    val twoStreams = StreamDemux(tempRes(3), select.asUInt, 2)
    val output = twoStreams(1)
    loopback </< twoStreams(0)
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

// case class MultiplierContext(dataWidth:Int,xWidth:Int) extends Bundle{
//   val xTemp = if(xWidth>0) UInt(xWidth bits) else null
//   val yTemp = if(xWidth>0) UInt(dataWidth bits) else null
//   val yAddM = if(xWidth>0) UInt(dataWidth+1 bits) else null
//   val sum   = UInt(dataWidth+1 bits)
//   val carry = UInt(dataWidth+1 bits)
// }

// case class MontMultiplierPiped(g:MontMultiplierConfig) extends Component {

//   val io = new Bundle{
//     val input  = slave  Stream(operands(g.dataWidth))
//     val output = master Stream(results(g.dataWidth))
//   }

//   val preComputation = new Area{
//     val input= MultiplierContext(g.dataWidth,g.dataWidth)
//     input.xTemp := io.input.op1
//     input.yTemp := io.input.op2
//     input.yAddM := io.input.op2 +^ U(g.modulus)
//     input.sum   := 0
//     input.carry := 0
//     val output = Stream(MultiplierContext(g.dataWidth, g.dataWidth-3))
//     output.xTemp := (input.xTemp |>> 3).resized
//     output.yTemp := input.yTemp
//     output.yAddM := input.yTemp +^ U(g.modulus)

//     val arrayConfig = AdderArrayConfig(g.modulus,3,g.dataWidth)
//     OneBitFullAdderArray(arrayConfig,input,output.carry,output.sum)

//     output.arbitrationFrom(io.input)
//   }

//   val adderPipeline = new Area {
//     val tempRes = for(i <- 0 to 10) yield Stream(MultiplierContext(g.dataWidth,g.dataWidth-3-i*7))
//     tempRes(0) << preComputation.output.stage()
//     for (i <- 0 until 10){
//       val xWidth = g.dataWidth - 3 - (i+1)*7
//       val temp = MultiplierContext(g.dataWidth,xWidth)
//       if(xWidth > 0){
//         temp.xTemp := (tempRes(i).xTemp |>> 3).resized
//         temp.yTemp := tempRes(i).yTemp
//         temp.yAddM := tempRes(i).yAddM
//       }
//       val arrayConfig = AdderArrayConfig(g.modulus, 7, g.dataWidth)
//       OneBitFullAdderArray(arrayConfig,tempRes(i).payload,temp.carry,temp.sum)
//       tempRes(i+1) << tempRes(i).translateWith(temp).stage()
//     }
//     val output = tempRes(10)
//   }

//   val resCombination = new Area{
//     val input = adderPipeline.output
//     val output = Stream(results(g.dataWidth))
//     val sumAddCarry = (input.sum|>>1) + input.carry
//     val tempRes = sumAddCarry.resize(g.dataWidth) +^ U(g.compensation,g.dataWidth bits)
//     when(tempRes.msb|sumAddCarry.msb){
//       output.res := tempRes.resized
//     } otherwise{
//       output.res := sumAddCarry.resized
//     }
//     output.arbitrationFrom(input)
//   }
//   io.output << resCombination.output.stage()
// }

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
    val config = MontMultiplierConfig(modulus, compensation, 255)
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
    val config = MontMultiplierConfig(modulus, compensation, 255)
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(MontMultiplierPipedSim(config))
  }
}
