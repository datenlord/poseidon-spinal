package poseidon

import spinal.core._
import spinal.lib._ 

case class BasicContextCase(g:PoseidonGenerics) extends BasicContext(g){}
case class ContextCase(g:PoseidonGenerics) extends Context(g){}

class PoseidonThread(g: PoseidonGenerics) extends Component {
  
  val io = new Bundle{
    val input = slave Stream(new Context(g))
    val output = master Stream(MDSContext(g))
  }

  // define the configuration class of Montgomery multiplier
  val modulus = BigInt("73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001", radix = 16)
  val compensation = BigInt("c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",radix = 16)
  val mulConfig = MontMultiplierConfig(modulus,compensation,255)


  val AddRoundConstantStage = new Area{
    val input = io.input
    val output = Stream(new Context(g))

    // round constants rom
    val config_t3  = RoundConstantsConfig(t = 3,round_num = 63,ports_num = 1,data_width = 255)
    val config_t5  = RoundConstantsConfig(t = 5,round_num = 64,ports_num = 1,data_width = 255)
    val config_t9  = RoundConstantsConfig(t = 9,round_num = 65,ports_num = 1,data_width = 255)
    val config_t12 = RoundConstantsConfig(t = 12,round_num = 65,ports_num = 1,data_width = 255)
    val roundConstants_t3 = new RoundConstants(config_t3)
    val roundConstants_t5 = new RoundConstants(config_t5)
    val roundConstants_t9 = new RoundConstants(config_t9)
    val roundConstants_t12 = new RoundConstants(config_t12)

    roundConstants_t3.io.read_ports(0).t_index := input.state_index.resized
    roundConstants_t5.io.read_ports(0).t_index := input.state_index.resized
    roundConstants_t9.io.read_ports(0).t_index := input.state_index.resized
    roundConstants_t12.io.read_ports(0).t_index := input.state_index.resized

    roundConstants_t3.io.read_ports(0).round_index := input.round_index.resized
    roundConstants_t5.io.read_ports(0).round_index := input.round_index.resized
    roundConstants_t9.io.read_ports(0).round_index := input.round_index.resized
    roundConstants_t12.io.read_ports(0).round_index := input.round_index.resized

    // ModAdder Instance
    val modAdder = ModAdder()
    modAdder.io.op1_i := input.state_element
    switch(input.state_size){
      is(3) {
        modAdder.io.op2_i := roundConstants_t3.io.read_ports(0).data
      }
      is(5){
        when(input.state_index === 5){
          modAdder.io.op2_i := 0
        }otherwise{
          modAdder.io.op2_i := roundConstants_t5.io.read_ports(0).data
        }
      }
      is(9){
        modAdder.io.op2_i := roundConstants_t9.io.read_ports(0).data
      }
      is(12){
        modAdder.io.op2_i := roundConstants_t12.io.read_ports(0).data
      }
      default{ modAdder.io.op2_i := 0 }
    }

    output.arbitrationFrom(input)
    output.payload.assignSomeByName(input.payload)
    output.state_element.allowOverride
    output.state_element := modAdder.io.res_o
  }

  val SBox5Stage = new Area {

    val input = AddRoundConstantStage.output.s2mPipe().m2sPipe()
    val inputForked = StreamFork(input, 2, true)
    // the first Montgomery Multiplier
    val mulInput0 = inputForked(0).translateWith{
      val payload = operands(g.data_width)
      payload.op1 := input.state_element
      payload.op2 := input.state_element
      payload
    }

    val mulRes0 = MontMultiplierPiped(mulConfig, mulInput0)

    // the second Montgomery Multiplier
    val mulInput1 = mulRes0.translateWith{
      val payload = operands(g.data_width)
      payload.op1 := mulRes0.res
      payload.op2 := mulRes0.res
      payload
    }
    val mulRes1 = MontMultiplierPiped(mulConfig, mulInput1)

    val tempContext0 = inputForked(1).queue(10)
    val tempRes0 = StreamJoin(mulRes1,tempContext0)

    // the third Montgomery Multiplier
    val tempResForked = StreamFork(tempRes0, 2, true)
    val mulInput2 = tempResForked(0).translateWith{
      val payload = operands(g.data_width)
      payload.op1 := tempRes0.payload._1.res
      payload.op2 := tempRes0.payload._2.state_element
      payload
    }
    val mulRes2 = MontMultiplierPiped(mulConfig, mulInput2)


    val tempContext1 = tempResForked(1).translateWith{
      val payload = BasicContextCase(g)
      payload.assignSomeByName(tempResForked(1)._2)
      payload
    }.queue(4)

    val output = StreamJoin.arg(mulRes2, tempContext1).translateWith{
      val payload = new ContextCase(g)
      payload.assignSomeByName(tempContext1.payload)
      payload.state_element := mulRes2.res
      payload
    }
  }

  io.output << MDSMatrixMultiplier(g, mulConfig, SBox5Stage.output.stage())
}

object PoseidonThreadVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      thread_num = 3,
      data_width = 255,
      id_width = 6
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(new PoseidonThread(config))
  }
}
