package poseidon

import spinal.core._
import spinal.lib._

case class MDSContext(g:PoseidonGenerics) extends Bundle{
  val round_index   = UInt(log2Up(g.round_max) bits)
  val state_size    = UInt(log2Up(g.t_max) bits)
  val state_id      = UInt(g.id_width bits)
  val state_elements = Vec(UInt(g.data_width bits), g.t_max)
}

case class MDSMulContext(g:PoseidonGenerics) extends Bundle{
  val round_index   = UInt(log2Up(g.round_max) bits)
  val state_size    = UInt(log2Up(g.t_max) bits)
  val state_id      = UInt(g.id_width bits)
}

object MDSMatrixMultiplier{
  def apply(g:PoseidonGenerics, input:Stream[Context]):Stream[MDSContext] ={
    val MDSMultiplierInst = new MDSMatrixMultiplier(g)
    MDSMultiplierInst.io.input << input
    MDSMultiplierInst.io.output
  }
}


case class MDSMatrixMultiplier(g:PoseidonGenerics) extends Component {

  val io = new Bundle{
    val input = slave Stream(new Context(g))
    val output = master Stream(MDSContext(g))
  }

  // mds_matrix_rom
  val mdsMatrix_t3  = new MDSMatrix(t = 3,data_width = g.data_width)
  val mdsMatrix_t5  = new MDSMatrix(t = 5,data_width = g.data_width)
  val mdsMatrix_t9  = new MDSMatrix(t = 9,data_width = g.data_width)
  val mdsMatrix_t12 = new MDSMatrix(t = 12, data_width = g.data_width)
  mdsMatrix_t3.io.address_port  := io.input.state_index.resized
  mdsMatrix_t5.io.address_port  := io.input.state_index.resized
  mdsMatrix_t9.io.address_port  := io.input.state_index.resized
  mdsMatrix_t12.io.address_port := io.input.state_index.resized

  val mulOp2s = Vec(UInt(g.data_width bits), g.t_max)
  switch(io.input.state_size){
    is(3){
      mulOp2s.assignFromBits( B(0,(g.t_max-3)*g.data_width bits) ## mdsMatrix_t3.io.data_ports.asBits)
    }
    is(5){
      when(io.input.state_index===5){
        mulOp2s.assignFromBits( B(0, g.t_max*g.data_width bits) )
      }otherwise{
        mulOp2s.assignFromBits(B(0,(g.t_max-5)*g.data_width bits) ## mdsMatrix_t5.io.data_ports.asBits)
      }
    }
    is(9){
      mulOp2s.assignFromBits(B(0,(g.t_max-9)*g.data_width bits) ## mdsMatrix_t9.io.data_ports.asBits)
    }
    is(12){
      mulOp2s.assignFromBits(mdsMatrix_t12.io.data_ports.asBits)
    }
    default{
      mulOp2s.assignFromBits(B(0,g.t_max*g.data_width bits))
    }
  }

  val mulOp1s = StreamFork(io.input.translateWith(io.input.state_element),g.t_max,true)
  val modMultipliers = for (i <- 0 until g.t_max) yield ModMultiplier()

  for(i <- 0 until g.t_max){
    modMultipliers(i).io.cmd.arbitrationFrom(mulOp1s(i))
    modMultipliers(i).io.cmd.op1 := mulOp1s(i).payload
    modMultipliers(i).io.cmd.op2 := mulOp2s(i)
  }


  val mulContext = Reg(MDSMulContext(g))
  mulContext.state_size.init(0)
  mulContext.state_id.init(0)
  mulContext.round_index.init(0)
  when(io.input.fire){
    mulContext.assignSomeByName(io.input.payload)
  }


  val mulResJoined = StreamJoin(modMultipliers.map(_.io.rsp))
  io.output << mulResJoined.translateWith{
    val res = MDSContext(g)
    res.assignSomeByName(mulContext)
    res.state_elements.assignFromBits(modMultipliers.map(_.io.rsp.res).asBits())
    res
  }.stage()

}


case class MDSMatrixMultiplier_full(g:PoseidonGenerics) extends Component {

  val io = new Bundle{
    val input = slave Stream(Vec(UInt(g.data_width bits),g.t_max))
    val output   = master Stream(Vec(UInt(g.data_width bits),g.t_max))
  }

  val mulRes = Vec(Stream(MDSContext(g)), g.t_max)
  val addRes = Vec(Vec(UInt(g.data_width bits),g.t_max),g.t_max-1)
  val forkedInputs = StreamFork(io.input,g.t_max,true)

  for (i <- 0 until g.t_max) {
    val mdsMultiplier = MDSMatrixMultiplier(g)
    mdsMultiplier.io.input.arbitrationFrom(forkedInputs(i))
    mdsMultiplier.io.input.state_element := io.input.payload(i)
    mdsMultiplier.io.input.state_index := i
    mdsMultiplier.io.input.state_size := 12
    mdsMultiplier.io.input.state_id := 0
    mdsMultiplier.io.input.round_index := 0

    mdsMultiplier.io.output >> mulRes(i)

  }

  for (i <- 0 until g.t_max){
    val modAdder = ModAdder()
    modAdder.io.op1_i := mulRes(0).state_elements(i)
    modAdder.io.op2_i := mulRes(1).state_elements(i)
    addRes(0)(i) := modAdder.io.res_o
  }

  for(i <- 1 until g.t_max-1; j <- 0 until g.t_max) {
    val modAdder = ModAdder()
    modAdder.io.op1_i := addRes(i-1)(j)
    modAdder.io.op2_i := mulRes(i+1).state_elements(j)
    addRes(i)(j) := modAdder.io.res_o
  }

  io.output << StreamJoin(mulRes).translateWith(addRes(g.t_max-2))
}

object MDSMatrixMultiplierVerilog{
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(t_max = 12,round_max = 65,thread_num = 5,data_width = 255,id_width=4)
    SpinalConfig(
      mode=Verilog,
      targetDirectory="./src/main/verilog/mdsMatrixMultiplier"
      ).generate(new MDSMatrixMultiplier(config)).printPruned()
  }
}

object MDSMatrixMultiplier_fullVerilog{

  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(t_max = 12,round_max = 65,thread_num = 5,data_width = 255,id_width=4)
    SpinalConfig(
      mode=Verilog,
      targetDirectory="./src/main/verilog/mdsMatrixMultiplier_full"
    ).generate(MDSMatrixMultiplier_full(config))
  }
}
