package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object PoseidonSerializer {
  def apply(g: PoseidonGenerics, input: Stream[MDSContext]): Stream[Context] = {
    val serializerInst = PoseidonSerializer(g)
    serializerInst.io.input << input
    serializerInst.io.output
  }
}

case class PoseidonSerializer(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Stream (MDSContext(g))
    val output = master Stream (new Context(g))
  }

  val buffer = Reg(MDSContext(g))
  buffer.isFull init (False)
  buffer.fullRound init (0)
  buffer.partialRound init (0)
  buffer.stateSize init (0)
  buffer.stateID init (0)
  buffer.stateElements.foreach(_ init (0))

  val fsm = new StateMachine {
    val counter = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)

    val IDLE = new State with EntryPoint
    val FULL = new State
    val PARTIAL = new State
    val LAST = new State

    // set default value
    io.input.ready := False

    io.output.valid := False
    io.output.isFull := buffer.isFull
    io.output.fullRound := buffer.fullRound
    io.output.partialRound := buffer.partialRound
    io.output.stateIndex := counter
    io.output.stateSize := buffer.stateSize
    io.output.stateID := buffer.stateID
    io.output.stateElement := buffer.stateElements(counter)
    io.output.stateElements.foreach(_ := 0)

    IDLE
      .whenIsActive {
        io.input.ready := True
        when(io.input.fire) {
          buffer := io.input.payload
          when(io.input.isFull) {
            goto(FULL)
          } otherwise {
            when(io.input.stateSize < 9) {
              goto(LAST)
            } otherwise {
              goto(PARTIAL)
            }
          }
        }
      }

    FULL
      .whenIsActive {
        io.output.valid := True
        when(io.output.fire) {
          counter := counter + 1
          when(counter === buffer.stateSize - 2) { goto(LAST) }
        }
      }

    PARTIAL
      .whenIsActive {
        io.output.valid := True
        for (i <- 0 until g.sizeMax - 1)
          io.output.stateElements(i) := buffer.stateElements(i + 1)
        when(io.output.fire) {
          counter := counter + 1
          goto(LAST)
        }
      }

    LAST
      .whenIsActive {
        io.output.valid := True

        when(!buffer.isFull) {
          io.output.stateElement := buffer.stateElements(0)
          for (i <- 0 until g.sizeMax - 1)
            io.output.stateElements(i) := buffer.stateElements(i + 1)
        }

        when(io.output.fire) {
          io.input.ready := True

          when(io.input.fire) {
            buffer := io.input.payload
            when(io.input.isFull) {
              goto(FULL)
            } otherwise {
              when(io.input.stateSize > 5)(goto(PARTIAL))
            }
          } otherwise (goto(IDLE))
        }
      }
      .onExit(counter := 0)
  }
}

object PoseidonSerializerVerilog {
  def main(args: Array[String]): Unit = {

    val config = PoseidonGenerics(
      sizeMax = 12,
      roundp = 57,
      roundf = 8,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(PoseidonSerializer(config))
  }
}
