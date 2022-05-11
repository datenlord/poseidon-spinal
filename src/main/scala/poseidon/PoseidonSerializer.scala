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

  val serializer = new StateMachine {
    val input = io.parallelInput
    val output = Stream(new Context(g))

    val tempOutput = Reg(MDSContext(g))

    val indexCount = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)
    val lastIndex = tempOutput.stateSize - 2

    val IDLE = new State with EntryPoint
    val BUSY = new State
    val LAST = new State

    // set default value
    input.ready := False
    output.valid := False
    output.payload.assignSomeByName(tempOutput)
    output.stateElement := 0
    output.stateIndex := 0

    IDLE
      .whenIsActive {
        input.ready := True
        when(input.fire) {
          tempOutput.assignSomeByName(input.payload)
          goto(BUSY)
        }
      }

    BUSY
      .whenIsActive {
        output.valid := True
        output.stateElement := tempOutput.stateElements(indexCount)
        output.stateIndex := indexCount
        when(output.fire) {
          indexCount := indexCount + 1
          when(indexCount === lastIndex) { goto(LAST) }
        }
      }

    LAST
      .whenIsActive {
        output.valid := True
        output.stateElement := tempOutput.stateElements(indexCount)
        output.stateIndex := indexCount

        when(output.fire) {
          input.ready := True
          when(input.fire) {
            tempOutput.assignSomeByName(input.payload)
            goto(BUSY)
          } otherwise (goto(IDLE))
        }
      }
      .onExit(indexCount := 0)
  }


  // Stream Arbiter
  val arbiterCounter = Reg( UInt(log2Up(g.sizeMax) bits) ) init(0)
  val stateSize = Reg( UInt(log2Up(g.sizeMax) bits) ) init(0)
  val countEnable = arbiterCounter + 1 < stateSize
  
  val delayFree = serializer.output.stateIndex < g.peNum
  val delayInput = serializer.output.asFlow.throwWhen(delayFree)
  val arbiterInput0 = FlowDelay(delayInput, g.mdsOperandLatency).toStream
  val arbiterInput1 = serializer.output.haltWhen(countEnable)
  
  when(countEnable){
    arbiterCounter := arbiterCounter + 1
  } otherwise{
    arbiterCounter := 0
    stateSize := 0
    when(arbiterInput0.valid){
      stateSize := arbiterInput0.stateSize
    }
  }
  
  val arbiterOutput = StreamArbiterFactory.lowerFirst.onArgs(arbiterInput0, arbiterInput1)
  io.serialOutput << arbiterOutput.stage()
}

object PoseidonSerializerVerilog {
  def main(args: Array[String]): Unit = {

    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 3,
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
