package poseidon
import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

object MDSContextInitValue {
  def apply(g: PoseidonGenerics): MDSContext = {
    val initValue = MDSContext(g)
    initValue.state_elements.foreach(_ := 0)
    initValue.state_size := 0
    initValue.state_id := 0
    initValue.round_index := 0
    initValue
  }
}

object MDSMatrixAdders{
  def apply(g:PoseidonGenerics, input:Stream[MDSContext]):Stream[MDSContext]={
    val matrixAddersInst = new MDSMatrixAdders(g)
    matrixAddersInst.io.input << input
    matrixAddersInst.io.output
  }
}

class MDSMatrixAdders(g:PoseidonGenerics) extends Component{

  val io = new Bundle{
    val input  = slave  Stream(MDSContext(g))
    val output = master Stream(MDSContext(g))
  }


  def ModAdderVec(op1s:Vec[UInt],op2s:Vec[UInt],results:Vec[UInt]) = new Area{
    for ((op1,op2,res) <- (op1s lazyZip op2s lazyZip results)){
      val adder = ModAdder()
      adder.io.op1_i := op1
      adder.io.op2_i := op2
      res := adder.io.res_o
    }
  }

  object AccumulatorState extends SpinalEnum{
    val IDLE, ADDING, DONE = newElement()
  }

  // registers holding intermediate results
  val tempRes = Reg(MDSContext(g))
  tempRes.state_size init(0)
  tempRes.state_elements.foreach(_ init(0))
  tempRes.state_id init(0)
  tempRes.round_index init(0)
  val modAdderRes = cloneOf(MDSContext(g).state_elements)
  val modAdderVec = ModAdderVec(tempRes.state_elements,io.input.state_elements,modAdderRes)

  //
  val countNum = Mux(tempRes.state_size===5, tempRes.state_size+1, tempRes.state_size)
  // implement the state machine logic
  val fsm = new StateMachine{

    val counter = Reg(UInt(log2Up(g.t_max) bits)) init(0)
    io.output.payload.assignSomeByName(tempRes)
    io.output.valid := False
    io.input.ready := False

    val IDLE:State = new State with EntryPoint{
      whenIsActive{
        io.input.ready := True
        when(io.input.fire){
          tempRes.assignSomeByName(io.input.payload)
          goto(ADDING)
          counter := counter + 1
        }
      }
    }

    val ADDING:State = new State{
      whenIsActive{
        io.input.ready := True
        when(io.input.fire){
          tempRes.state_elements.assignFrom(modAdderRes)
          when(counter + 1 === countNum){
            goto(DONE)
          }otherwise{
            counter := counter + 1
          }
        }
      }
      onExit(counter := 0)
    }

    val DONE:State = new State{
      whenIsActive{
        io.output.valid := True
        when(io.output.fire){
          io.input.ready := True
          when(io.input.fire){
            tempRes.assignSomeByName(io.input.payload)
            goto(ADDING)
            counter := counter + 1
          }otherwise{
            goto(IDLE)
          }
        }
      }
    }
  }
}

object MDSMatrixAddersVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 5,
      data_width = 255,
      id_width = 4,
      isSim = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new MDSMatrixAdders(config))
  }
}
