package poseidon

import spinal.core._
import spinal.lib._

object ModAdderPipedFlow {
  val latency = 2
  def apply(width: Int, input: Flow[operands]): Flow[results] = {
    val adderInst = ModAdderPipedFlow(width, PoseidonParam.compensation)
    adderInst.io.input << input
    adderInst.io.output
  }
}

case class ModAdderPipedFlow(dataWidth: Int, compensation: BigInt)
    extends Component {

  val io = new Bundle {
    val input = slave Flow (operands(dataWidth))
    val output = master Flow (results(dataWidth))
  }

  val temp = io.input
    .translateWith(
      results(io.input.op1 +^ io.input.op2)
    )
    .stage()

  io.output << temp
    .translateWith {
      val tempRes =
        temp.res.resize(dataWidth) +^ U(compensation, dataWidth bits)
      val res =
        Mux(tempRes.msb | temp.res.msb, tempRes, temp.res).resize(dataWidth)
      results(res)
    }
    .stage()
}

object ModAdderPiped {
  def apply(
      g: ModAdderConfig,
      ip: AdderIPConfig,
      op1: UInt,
      op2: UInt
  ): (UInt, Int) = {
    val adderInst = ModAdderPiped(g, ip)
    adderInst.io.op1 := op1
    adderInst.io.op2 := op2
    (adderInst.io.res, adderInst.latency)
  }
}

case class ModAdderPiped(g: ModAdderConfig, ipConfig: AdderIPConfig)
    extends Component {

  val io = new Bundle {
    val op1, op2 = in UInt (g.dataWidth bits)
    val res = out UInt (g.dataWidth bits)
  }

  require(g.dataWidth.equals(ipConfig.inputWidth))
  require(ipConfig.outputWidth.equals(g.dataWidth + 1))

  val adderRes1 = if (g.isSim) {
    SimAdderIP(ipConfig, io.op1, io.op2)
  } else {
    AdderIP(ipConfig, io.op1, io.op2)
  }

  val adderRes2 = if (g.isSim) {
    SimAdderIP(
      ipConfig,
      adderRes1.resize(g.dataWidth),
      U(g.compensation, g.dataWidth bits)
    )
  } else {
    AdderIP(
      ipConfig,
      adderRes1.resize(g.dataWidth),
      U(g.compensation, g.dataWidth bits)
    )
  }
  val adderRes1Delayed = Delay(adderRes1, ipConfig.latency)

  io.res := Mux(
    adderRes1Delayed.msb | adderRes2.msb,
    adderRes2,
    adderRes1Delayed
  ).resize(g.dataWidth)
  val latency = 2 * ipConfig.latency
}

// SpinalHDL provide reduceBalanceTree that can implement adder tree 
// def reduceBalancedTree(op: (T, T) => T): T
// operands.reduceBalancedTree(_+_)

// adderTree implemented through recursion of scala
object AdderTreeGenerator {
  def apply( g: ModAdderConfig, ip: AdderIPConfig, input: Vec[UInt])
  : (UInt, Int) = {
    val opNum: Int = input.length
    if (opNum == 2) {
      val output = ModAdderPiped(g, ip, input(0), input(1))
      (output._1, output._2)
    } else {
      val adderOutputs = for (i <- 0 until opNum / 2)
          yield ModAdderPiped(g, ip, input(2 * i), input(2 * i + 1))
      if ((opNum % 2) == 0) {
        val next = Vec(UInt(g.dataWidth bits), opNum / 2)
        next.assignFromBits(adderOutputs.map(_._1).asBits())
        val (nextOutput, latency) = AdderTreeGenerator(g, ip, next)
        (nextOutput, latency + adderOutputs(0)._2)

      } else {
        val next = Vec(UInt(g.dataWidth bits), opNum / 2 + 1)
        val temp = Delay(input(opNum - 1), adderOutputs(0)._2)
        next.assignFromBits(temp.asBits ## adderOutputs.map(_._1).asBits())
        val (nextOutput, latency) = AdderTreeGenerator(g, ip, next)
        (nextOutput, latency + adderOutputs(0)._2)
      }
    }
  }
}

case class AdderTree(g: ModAdderConfig, ip: AdderIPConfig, opNum: Int)
    extends Component {
  val io = new Bundle {
    val input = slave Flow (Vec(UInt(g.dataWidth bits), opNum))
    val output = master Flow (UInt(g.dataWidth bits))
  }

  val (res, latency) = AdderTreeGenerator(g, ip, io.input.payload)
  println(latency)
  io.output.valid := Delay(io.input.valid, latency, init = False)
  io.output.payload := res
}

object ModAdderPipedFlowVerilog {
  def main(args: Array[String]): Unit = {
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(ModAdderPipedFlow(255, PoseidonParam.compensation))
  }
}

object ModAdderPipedVerilog {
  def main(args: Array[String]): Unit = {
    val adderIPConfig = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      latency = 8,
      moduleName = "c_addsub_1"
    )

    val modAdderConfig = ModAdderConfig(
      dataWidth = 255,
      modulus = PoseidonParam.modulus,
      compensation = PoseidonParam.compensation,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(ModAdderPiped(modAdderConfig, adderIPConfig))
  }
}

object AdderTreeVerilog {
  def main(args: Array[String]): Unit = {

    val adderIPConfig = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      latency = 8,
      moduleName = "c_addsub_1"
    )

    // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
    val modAdderConfig = ModAdderConfig(
      dataWidth = 255,
      modulus = PoseidonParam.modulus,
      compensation = PoseidonParam.compensation,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(AdderTree(modAdderConfig, adderIPConfig, 12))
  }
}
