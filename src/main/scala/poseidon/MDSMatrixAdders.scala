package poseidon
import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

// object MDSContextInitValue {
//   def apply(g: PoseidonGenerics): MDSContext = {
//     val initValue = MDSContext(g)
//     initValue.state_elements.foreach(_ := 0)
//     initValue.state_size := 0
//     initValue.state_id := 0
//     initValue.roundIndex := 0
//     initValue
//   }
// }

object MDSMatrixAdders {
  def apply(
      g: PoseidonGenerics,
      input: Flow[MDSContext]
  ): Flow[MDSContext] = {
    val matrixAddersInst = new MDSMatrixAdders(g)
    matrixAddersInst.io.input << input
    matrixAddersInst.io.output
  }
}

class MDSMatrixAdders(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Flow (MDSContext(g))
    val output = master Flow (MDSContext(g))
  }

  def ModAdderVec(op1s: Vec[UInt], op2s: Vec[UInt], results: Vec[UInt]) =
    new Area {
      for ((op1, op2, res) <- (op1s lazyZip op2s lazyZip results)) {
        val adder = ModAdder()
        adder.io.op1_i := op1
        adder.io.op2_i := op2
        res := adder.io.res_o
      }
    }

  object AccumulatorState extends SpinalEnum {
    val IDLE, ADDING, DONE = newElement()
  }

  // registers holding intermediate results
  val tempRes = Reg(MDSContext(g))
  // tempRes.state_size init (0)
  // tempRes.state_elements.foreach(_ init (0))
  // tempRes.state_id init (0)
  // tempRes.roundIndex init (0)
  val modAdderRes = cloneOf(MDSContext(g).stateElements)
  val modAdderVec =
    ModAdderVec(tempRes.stateElements, io.input.stateElements, modAdderRes)

  //
  val countNum = tempRes.stateSize

  // implement the state machine logic
  val fsm = new StateMachine {

    val counter = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)
    io.output.payload.assignSomeByName(tempRes)
    io.output.valid := False

    val IDLE: State = new State with EntryPoint {
      whenIsActive {
        when(io.input.valid) {
          tempRes.assignSomeByName(io.input.payload)
          goto(ADDING)
          counter := counter + 1
        }
      }
    }

    val ADDING: State = new State {
      whenIsActive {
        when(io.input.valid) {
          tempRes.stateElements.assignFrom(modAdderRes)
          when(counter + 1 === countNum) {
            goto(DONE)
          } otherwise {
            counter := counter + 1
          }
        }
      }
      onExit(counter := 0)
    }

    val DONE: State = new State {
      whenIsActive {
        io.output.valid := True
        when(io.input.valid) {
          tempRes.assignSomeByName(io.input.payload)
          goto(ADDING)
          counter := counter + 1
        } otherwise {
          goto(IDLE)
        }
      }
    }
  }
}

object MDSMatrixAddersVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 5,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new MDSMatrixAdders(config))
  }
}
