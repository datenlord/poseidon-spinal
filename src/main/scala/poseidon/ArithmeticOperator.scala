package poseidon

import spinal.core._
import spinal.lib._

case class ModAdder() extends BlackBox {
  val io = new Bundle {
    val op1_i = in UInt (255 bits)
    val op2_i = in UInt (255 bits)
    val res_o = out UInt (255 bits)
  }
  noIoPrefix()
}

// standard io interface used in arithmetic operation Component 
object operands{
  def apply(dataWidth:Int, op1:UInt, op2:UInt):operands = {
    val inst = operands(dataWidth)
    inst.op1 := op1
    inst.op2 := op2
    inst
  }
}
case class operands(dataWidth: Int) extends Bundle {
  val op1 = UInt(dataWidth bits)
  val op2 = UInt(dataWidth bits)
}

object results{
  def apply(dataWidth:Int, res:UInt):results = {
    val inst = results(dataWidth)
    inst.res := res
    inst
  }
}

case class results(dataWidth: Int) extends Bundle {
  val res = UInt(dataWidth bits)
}

case class ModMultiplier() extends BlackBox {
  val io = new Bundle {
    val clk = in Bool ()
    val rst = in Bool ()
    val cmd = slave Stream (operands(255))
    val rsp = master Stream (results(255))
  }
  noIoPrefix()
  // Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.cmd.valid.setName("op_valid_i")
    io.cmd.ready.setName("op_ready_o")
    io.cmd.op1.setName("op1_i")
    io.cmd.op2.setName("op2_i")
    io.rsp.valid.setName("res_valid_o")
    io.rsp.ready.setName("res_ready_i")
    io.rsp.res.setName("res_o")
  }

  // Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())

  mapCurrentClockDomain(clock = io.clk, reset = io.rst)

}
