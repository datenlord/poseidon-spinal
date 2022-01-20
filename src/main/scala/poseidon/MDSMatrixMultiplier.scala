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

object MDSMatrixMultiplier{
  def apply(g:PoseidonGenerics, mulConfig:MontMultiplierConfig, input:Stream[ContextCase]):Stream[MDSContext] ={
    val MDSMultiplierInst = new MDSMatrixMultiplier(g, mulConfig)
    MDSMultiplierInst.io.input << input
    MDSMultiplierInst.io.output
  }
}

case class MDSMatrixMultiplier(g: PoseidonGenerics, mulConfig:MontMultiplierConfig) extends Component {

  val io = new Bundle {
    val input = slave Stream (ContextCase(g))
    val output = master Stream (MDSContext(g))
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


  val inputForked = StreamFork(io.input, 2, true)

  val mulOp1s = StreamFork(inputForked(0).translateWith(io.input.state_element),g.t_max,true)
  val montMultipliers:IndexedSeq[MontMultiplierPiped] = IndexedSeq.fill(g.t_max)(MontMultiplierPiped(mulConfig))

  for(i <- 0 until g.t_max){
    montMultipliers(i).io.input.arbitrationFrom(mulOp1s(i))
    montMultipliers(i).io.input.op1 := mulOp1s(i).payload
    montMultipliers(i).io.input.op2 := mulOp2s(i)
  }


  val mulContext = inputForked(1).translateWith{
    val payload = MDSMulContext(g)
    payload.assignSomeByName(io.input.payload)
    payload
  }.queue(5)


  val mulResJoined = StreamJoin(montMultipliers.map(_.io.output))
  io.output << StreamJoin.arg(mulResJoined, mulContext).translateWith{
    val payload = MDSContext(g)
    payload.assignSomeByName(mulContext.payload)
    payload.state_elements.assignFromBits(montMultipliers.map(_.io.output.res).asBits())
    payload
  }.stage()

}



object MDSMatrixMultiplierVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      thread_num = 5,
      data_width = 255,
      id_width = 4
    )
    
    val modulus = BigInt("73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001", radix = 16)
    val compensation = BigInt("c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",radix = 16)
    val mulConfig = MontMultiplierConfig(modulus,compensation,255)
    
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new MDSMatrixMultiplier(config,mulConfig)).printPruned()
  }
}
