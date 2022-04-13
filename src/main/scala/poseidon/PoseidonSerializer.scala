package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object PoseidonSerializer {
  def apply(g: PoseidonGenerics, input: Stream[MDSContext]): Stream[Context] = {
    val serializerInst = PoseidonSerializer(g)
    serializerInst.io.parallelInput << input
    serializerInst.io.serialOutput
  }
}

case class PoseidonSerializer(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val parallelInput = slave Stream (MDSContext(g))
    val serialOutput = master Stream (new Context(g))
  }

  val stateSize = Reg(UInt(log2Up(g.t_max) bits)) init (0)
  val lastElementIndex = Mux(
    stateSize === 5,
    stateSize,
    stateSize - 1
  ) // when size is 5, resize to 6
  val roundIndex = Reg(UInt(log2Up(g.round_max) bits)) init (0)
  val stateID = Reg(UInt(g.id_width bits)) init (0)
  val buffer = Vec(Reg(UInt(g.data_width bits)), g.t_max)
  buffer.foreach(_ init (0))

  val fsm = new StateMachine {
    val counter = Reg(UInt(log2Up(g.t_max) bits)) init (0)

    val IDLE = new State with EntryPoint
    val BUSY = new State
    val LAST = new State

    // set default value
    io.parallelInput.ready := False

    io.serialOutput.valid := False
    io.serialOutput.state_id := 0
    io.serialOutput.state_size := 0
    io.serialOutput.state_element := 0
    io.serialOutput.state_index := 0
    io.serialOutput.round_index := 0

    IDLE
      .whenIsActive {
        io.parallelInput.ready := True
        when(io.parallelInput.fire) {
          (buffer lazyZip io.parallelInput.state_elements).foreach(_ := _)
          stateID := io.parallelInput.state_id
          stateSize := io.parallelInput.state_size
          roundIndex := io.parallelInput.round_index
          goto(BUSY)
        }
      }

    BUSY
      .whenIsActive {
        io.serialOutput.valid := True
        io.serialOutput.state_element := buffer(counter)
        io.serialOutput.state_index := counter
        io.serialOutput.state_size := stateSize
        io.serialOutput.round_index := roundIndex
        io.serialOutput.state_id := stateID
        when(io.serialOutput.fire) {
          counter := counter + 1
          when(counter === lastElementIndex - 1) { goto(LAST) }
        }
      }

    LAST
      .whenIsActive {
        io.serialOutput.valid := True
        io.serialOutput.state_element := buffer(counter)
        io.serialOutput.state_index := counter
        io.serialOutput.state_size := stateSize
        io.serialOutput.round_index := roundIndex
        io.serialOutput.state_id := stateID

        when(io.serialOutput.fire) {
          io.parallelInput.ready := True
          when(io.parallelInput.fire) {
            (buffer lazyZip io.parallelInput.state_elements).foreach(_ := _)
            stateID := io.parallelInput.state_id
            stateSize := io.parallelInput.state_size
            roundIndex := io.parallelInput.round_index
            goto(BUSY)
          } otherwise (goto(IDLE))
        }
      }
      .onExit(counter := 0)
  }
}

object PoseidonSerializerVerilog {
  def main(args: Array[String]): Unit = {

    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      loop_num = 3,
      data_width = 255,
      id_width = 5,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(PoseidonSerializer(config))
  }
}
