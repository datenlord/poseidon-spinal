package poseidon

import spinal.core._
import spinal.lib._

case class SBoxContext(g: PoseidonGenerics) extends Context(g){
  val initial_state = UInt(g.data_width bits)
}

case class SBoxMulContext(g:PoseidonGenerics) extends BasicContext(g){
  val initial_state = UInt(g.data_width bits)
}

case class SBox5(g:PoseidonGenerics) extends Component{
  val io = new Bundle{
    val input = slave(Stream(new Context(g)))
    val output = master(Stream(new Context(g)))
  }

  val mul_stage0 = new Area {
    val mulContext = Reg(SBoxMulContext(g)) 
    mulContext.state_index.init(0)
    mulContext.round_index.init(0)
    mulContext.state_size.init(0)
    mulContext.initial_state.init(0)
    val output = Stream(SBoxContext(g))

    val multiplier0 = ModMultiplier()
    multiplier0.io.cmd.arbitrationFrom(io.input)
    multiplier0.io.cmd.op1 := io.input.state_element
    multiplier0.io.cmd.op2 := io.input.state_element
    
    when(multiplier0.io.cmd.fire){
      mulContext.assignSomeByName(io.input.payload)
      mulContext.initial_state := io.input.state_element
    }

    output.arbitrationFrom(multiplier0.io.rsp)
    output.payload.assignSomeByName(mulContext)
    output.state_element := multiplier0.io.rsp.res

  }

  val mul_stage1 = new Area {
    val input = mul_stage0.output.stage()
    val mulContext = Reg(SBoxMulContext(g))
    mulContext.state_index.init(0)
    mulContext.round_index.init(0)
    mulContext.state_size.init(0)
    mulContext.initial_state.init(0)
    val output = Stream(SBoxContext(g))

    val multiplier1 = ModMultiplier()
    multiplier1.io.cmd.arbitrationFrom(input)
    multiplier1.io.cmd.op1 := input.state_element
    multiplier1.io.cmd.op2 := input.state_element
    when(multiplier1.io.cmd.fire){
      mulContext.assignSomeByName(input.payload)
    }

    output.arbitrationFrom(multiplier1.io.rsp)
    output.payload.assignSomeByName(mulContext)
    output.state_element := multiplier1.io.rsp.res
  }

  val mul_stage2 = new Area{
    val input = mul_stage1.output.stage()
    val mulContext = Reg(SBoxMulContext(g))
    mulContext.state_index.init(0)
    mulContext.round_index.init(0)
    mulContext.state_size.init(0)
    mulContext.initial_state.init(0)
    val output = Stream(new Context(g))

    val multiplier2 = ModMultiplier()
    multiplier2.io.cmd.arbitrationFrom(input)
    multiplier2.io.cmd.op1 := input.initial_state
    multiplier2.io.cmd.op2 := input.state_element
    when(multiplier2.io.cmd.fire){
      mulContext.assignSomeByName(input.payload)
    }

    output.arbitrationFrom(multiplier2.io.rsp)
    output.payload.assignSomeByName(mulContext)
    
    val is_partial_round = Bool()
    switch(mulContext.state_size){
      is(3){
        is_partial_round := (mulContext.round_index >= 4) && (mulContext.round_index<59)
      }
      is(5){
        is_partial_round := (mulContext.round_index >= 4) && (mulContext.round_index <60)
      }
      is(9){
        is_partial_round := (mulContext.round_index >= 4) && (mulContext.round_index <61)
      }
      is(12){
        is_partial_round := (mulContext.round_index >= 4) && (mulContext.round_index <61)
      }
      default{
        is_partial_round := False
      }
    }
    val is_pass_sbox5 = (is_partial_round) && (mulContext.state_index =/= 0)
    output.state_element := is_pass_sbox5 ? mulContext.initial_state|multiplier2.io.rsp.res
  }
  mul_stage2.output >-> io.output
  
}

object SBox5Verilog{
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(t_max = 12,round_max = 65,thread_num = 5,data_width = 255,id_width=4)
    SpinalConfig(
      mode=Verilog,
      targetDirectory="./src/main/verilog"
      ).generate(SBox5(config)).printPruned()
  }
}







