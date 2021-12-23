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

class MDSMatrixAdders(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val inputs = Vec(slave Stream (MDSContext(g)), 3)
    val output = master Stream (MDSContext(g))
  }

  def ModAdderVec(op1s: Vec[UInt], op2s: Vec[UInt], result: Vec[UInt]) =
    new Area {
      for ((op1, op2, res) <- (op1s, op2s, result).zipped) {
        val adder = ModAdder()
        adder.io.op1_i := op1
        adder.io.op2_i := op2
        res := adder.io.res_o
      }
    }

  val threadAdders = new Area {
    val inputs = io.inputs
    val tempRes = Stream(MDSContext(g))
    tempRes.arbitrationFrom(StreamJoin(inputs))
    tempRes.payload.assignSomeByName(inputs(0).payload)
    tempRes.state_elements.allowOverride
    val modAdderVec1 = ModAdderVec(
      inputs(0).state_elements,
      inputs(1).state_elements,
      tempRes.state_elements
    )

    val tempOp1s = tempRes.stage()
    val tempOp2s = RegNextWhen(inputs(2).state_elements, tempRes.fire)
    tempOp2s.foreach(_ init (0))

    val output = Stream(MDSContext(g))
    output.arbitrationFrom(tempOp1s)
    output.payload.assignSomeByName(tempOp1s.payload)
    output.state_elements.allowOverride
    val modAdderVec2 =
      ModAdderVec(tempOp1s.state_elements, tempOp2s, output.state_elements)
  }

  val threadAccumulator = new Area {
    val input = threadAdders.output.stage()
    val output = Stream(MDSContext(g))

    val tempRes = Reg(MDSContext(g))
    tempRes.state_size init (0)
    tempRes.state_elements.foreach(_ init (0))
    tempRes.state_id init (0)
    tempRes.round_index init (0)
    val modAdderRes = cloneOf(MDSContext(g).state_elements)
    val modAdderVec =
      ModAdderVec(tempRes.state_elements, input.state_elements, modAdderRes)

    val fsm = new StateMachine {
      val counter = Reg(UInt(log2Up(g.t_max) bits)) init (0)
      output.payload.assignSomeByName(tempRes)
      output.valid := False
      input.ready := False

      val IDLE: State = new State with EntryPoint {
        whenIsActive {
          input.ready := True
          when(input.fire) {
            tempRes.assignSomeByName(input.payload)
            when(input.state_size === 3) {
              goto(DONE)
            } otherwise {
              goto(ADDING)
              counter := counter + 3
            }
          }
        }
      }

      val ADDING: State = new State {
        whenIsActive {
          input.ready := True
          when(input.fire) {
            tempRes.state_elements.assignFrom(modAdderRes)
            when(counter + 3 >= tempRes.state_size) {
              goto(DONE)
            } otherwise {
              counter := counter + 3
            }
          }
        }
        onExit(counter := 0)
      }

      val DONE: State = new State {
        whenIsActive {
          output.valid := True
          when(output.fire) {
            input.ready := True
            when(input.fire) {
              tempRes.assignSomeByName(input.payload)
              when(input.state_size > 3) {
                goto(ADDING)
                counter := counter + 3
              }
            } otherwise {
              goto(IDLE)
            }
          }
        }
      }
    }
  }
  io.output << threadAccumulator.output
}

object MDSMatrixAddersVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      thread_num = 5,
      data_width = 255,
      id_width = 4
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new MDSMatrixAdders(config))
  }
}
