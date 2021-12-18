package poseidon

import spinal.core._
import spinal.lib._

case class ModAdder() extends BlackBox{
  val io = new Bundle {
    val op1_i = in  UInt (255 bits)
    val op2_i = in  UInt (255 bits)
    val res_o = out UInt (255 bits)
  }
  noIoPrefix()
}

case class operands(data_width:Int) extends Bundle{
  val op1 = UInt(data_width bits)
  val op2 = UInt(data_width bits)
}
case class results(data_width:Int) extends Bundle{
  val res = UInt(data_width bits)
}

case class ModMultiplier() extends BlackBox{
  val io = new Bundle{
    val clk = in Bool()
    val rst = in Bool()
    val cmd = slave Stream(operands(255))
    val rsp = master Stream(results(255))
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