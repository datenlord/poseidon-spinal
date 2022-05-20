package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object PoseidonSerializer {
  def apply(g: PoseidonGenerics, input: Stream[MDSContext]):Stream[Context] = {
    val serializer = PoseidonSerializer(g)
    serializer.io.parallelInput << input
    serializer.io.serialOutput
  }
}

case class PoseidonSerializer(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val parallelInput = slave Stream (MDSContext(g))
    val serialOutput = master Stream (Context(g))
  }

  val serializer = new StateMachine {
    val input = io.parallelInput
    val output = Stream(Context(g))

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
  
  val delayInput = serializer.output.asFlow
  val delayOutput = FlowDelay(delayInput.throwWhen(delayInput.stateIndex < g.peNum), g.mdsOperandLatency)


  val arbiterInput0 = delayOutput.toStream
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

object PoseidonDeserializer{
  def apply(g:PoseidonGenerics, input:Stream[Context]):Stream[MDSContext]={
    val inst = PoseidonDeserializer(g)
    inst.io.input << input
    inst.io.output
  }
}
case class PoseidonDeserializer(g:PoseidonGenerics) extends Component{

  val io = new Bundle{
    val input  = slave Stream(Context(g))
    val output = master Stream(MDSContext(g))
  }

  val MDSOutputFSM = new StateMachine {
    val input = io.input
    val output = Stream(MDSContext(g))

    val counter = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)
    val tempOutput = Reg(MDSContext(g))
    output.payload.assignSomeByName(tempOutput)
    output.valid := False
    input.ready := False

    val IDLE = new State with EntryPoint
    val BUSY, DONE = new State
    
    IDLE
      .whenIsActive{
        input.ready := True
        when(input.fire){
          tempOutput.assignSomeByName(input.payload)
          tempOutput.stateElements(counter) := input.stateElement
          counter := counter + 1
          goto(BUSY)
        }
      }

    BUSY
      .whenIsActive{
        input.ready := True
        when(input.fire){
          tempOutput.stateElements(counter) := input.stateElement
          counter := counter + 1
          when(counter === tempOutput.stateSize-1){
            goto(DONE)
          }
        }
      }.onExit(counter:=0)

    DONE
      .whenIsActive{
        output.valid := True
        when(output.fire){
          input.ready := True
          when(input.fire){
            tempOutput.assignSomeByName(input.payload)
            tempOutput.stateElements(counter) := input.stateElement
            counter := counter + 1
            goto(BUSY)
          } otherwise{
            goto(IDLE)
          }
        }
      }
  }

  io.output << MDSOutputFSM.output.s2mPipe().m2sPipe()

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

object PoseidonDeserializerVerilog{
  def main(args: Array[String]): Unit = {

    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 3,
      dataWidth = 255,
      idWidth = 5,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(PoseidonDeserializer(config))
  }
}