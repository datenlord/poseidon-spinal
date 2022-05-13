package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object PoseidonSerializer {
  def apply(g: PoseidonGenerics, input: Stream[MDSContext]): (Stream[Context], Bool) = {
    val serializer = PoseidonSerializer(g)
    serializer.io.parallelInput << input
    (serializer.io.serialOutput, serializer.io.isDelayEmpty)
  }
}

case class PoseidonSerializer(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val parallelInput = slave Stream (MDSContext(g))
    val serialOutput = master Stream (new Context(g))
    val isDelayEmpty = out Bool()
  }

  val serializer = new StateMachine {
    val input = io.parallelInput
    val output = Stream(new Context(g))

    val tempOutput = Reg(MDSContext(g))
    val indexCount = Counter(log2Up(g.sizeMax) bits)

    // define states of FSM
    val IDLE = new State with EntryPoint
    val BUSY = new State
    
    // set default value to output signals
    input.ready := False
    output.valid := False
    output.payload.assignSomeByName(tempOutput)
    output.stateElement := tempOutput.stateElements(indexCount)
    output.stateIndex := indexCount

    IDLE
      .whenIsActive {
        output.arbitrationFrom(input)
        output.payload.assignSomeByName(input.payload)
        output.stateElement := input.stateElements(0)
        when(input.fire){
          tempOutput.assignSomeByName(input.payload)
          indexCount.increment()
          goto(BUSY)
        }
      }

    BUSY
      .whenIsActive {
        output.valid := True
        when(output.fire){
          indexCount.increment()
          when(indexCount === tempOutput.stateSize-1){
            goto(IDLE)
            indexCount.clear()
          }
        }
      }
    
  }


  // Stream Arbiter
  val arbiterCounter = Reg( UInt(log2Up(g.sizeMax) bits) ) init(0)
  val stateSize = Reg( UInt(log2Up(g.sizeMax) bits) ) init(0)
  val countEnable = arbiterCounter + 1 < stateSize
  
  val delayInput0 = serializer.output.asFlow
  val delayOutput0 = FlowDelay(delayInput0.throwWhen(delayInput0.stateIndex < g.peNum), 1)
  io.isDelayEmpty := delayOutput0.valid
  val delayOutput1 = FlowDelay(delayOutput0, g.mdsOperandLatency - 1)

  val arbiterInput0 = delayOutput1.toStream
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
