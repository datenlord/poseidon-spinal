package poseidon

import spinal.core._
import spinal.lib._

object AXI4StreamReceiver {
  def apply(g: PoseidonGenerics, input: Stream[AXI4Stream]): Stream[Context] = {
    val receiver = new AXI4StreamReceiver(g)
    receiver.io.input << input
    receiver.io.output
  }
}

case class ReceiverContext(g:PoseidonGenerics) extends Bundle{
  val stateElement = UInt(g.dataWidth bits)
  val stateIndex   = UInt(log2Up(g.sizeMax) bits)
  val stateId      = UInt(g.idWidth bits)
}

case class AXI4StreamReceiver(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input  = slave  Stream (AXI4Stream(g.dataWidth))
    val output = master Stream (Context(g))
  }

  val idCount = Counter(g.idWidth bits, inc = io.input.fire & io.input.tlast)
  val indexCount = Counter(log2Up(g.sizeMax) bits)
  when(io.input.fire){
    when(io.input.tlast){
      indexCount.clear()
    }otherwise{
      indexCount.increment()
    }
  }

  val inputForked = StreamFork(io.input, 2, true)
  val bufferInput = inputForked(0).translateWith{
    val payload = ReceiverContext(g)
    payload.stateElement := inputForked(0).tdata
    payload.stateIndex := indexCount.value
    payload.stateId := idCount.value
    payload
  }

  val sizeInput = inputForked(1).translateWith((indexCount.value + 1)).takeWhen(io.input.tlast)

  //val bufferOutput = bufferInput.queue(2 * g.sizeMax)
  val bufferOutput = BundleFifo(bufferInput, XilinxIPConfig.fifo1, g.isSim)
  val sizeCounter = sizeInput.m2sPipe()
  val sizeHold = sizeCounter.forkSerial(bufferOutput.stateIndex===sizeCounter.payload-1)

  val tempOutput =  StreamJoin(bufferOutput, sizeHold).translateWith{
    val payload = Context(g)
    payload.assignSomeByName(bufferOutput.payload)
    payload.stateSize := sizeHold.payload
    payload.roundIndex := 0
    payload
  }
  io.output << tempOutput.s2mPipe().m2sPipe()
}

object AXI4StreamTransmitter{
  def apply(g:PoseidonGenerics, input:Stream[TransmitterContext]):Stream[AXI4Stream]={
    val transmitter = AXI4StreamTransmitter(g)
    transmitter.io.input << input
    transmitter.io.output
  }
}

case class TransmitterContext(g: PoseidonGenerics) extends Bundle{
  val stateId = UInt(g.idWidth bits)
  val stateElement = UInt(g.dataWidth bits)
}

case class AXI4StreamTransmitter(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input  = slave Stream (TransmitterContext(g)  )
    val output = master Stream(AXI4Stream(g.dataWidth))
  }

  val idCount = Counter(g.idWidth bits, inc=io.output.fire)
  val demuxSelect = io.input.stateId === idCount.value
  val inputDemuxed = StreamDemux(io.input, demuxSelect.asUInt, 2)

  //val bufferOutput = inputDemuxed(0).queue(g.transmitterQueue)
  val bufferOutput = BundleFifo(inputDemuxed(0), XilinxIPConfig.fifo2, g.isSim)

  val arbiterInput0 = inputDemuxed(1).translateWith{
    val payload = AXI4Stream(g.dataWidth)
    payload.tdata := inputDemuxed(1).stateElement
    payload.tlast := True
    payload
  }

  val arbiterInput1 = bufferOutput.translateWith{
    val payload = AXI4Stream(g.dataWidth)
    payload.tdata := bufferOutput.stateElement
    payload.tlast := True
    payload
  }.haltWhen(bufferOutput.stateId =/= idCount.value)

  val tempOutput = StreamArbiterFactory.lowerFirst.onArgs(arbiterInput0,arbiterInput1)
  io.output << tempOutput.s2mPipe().m2sPipe()

}


// case class ReceiverContext(g:PoseidonGenerics) extends Bundle{
//   val stateElements = Vec(UInt(g.dataWidth bits), g.sizeMax)
//   val stateSize    = UInt(log2Up(g.sizeMax) bits)
// }

// case class AXI4StreamReceiver(g: PoseidonGenerics) extends Component {

//   val io = new Bundle {
//     val input  = slave  Stream (AXI4Stream(g.dataWidth))
//     val output = master Stream (Context(g))
//   }
  
//   val receiverFSM = new StateMachine {
//     val input = io.input
//     val output = Stream(ReceiverContext(g))

//     val tempOutput = Reg(ReceiverContext(g))
//     tempOutput.stateSize init(0)

//     // set default value to output ports
//     input.ready := False
//     output.valid := False
//     output.payload.assignSomeByName(tempOutput)

//     val BUSY = new State with EntryPoint
//     val DONE = new State

//     BUSY
//       .whenIsActive {
//         io.input.ready := True
//         when(io.input.fire){
//           tempOutput.stateElements(tempOutput.stateSize) := io.input.tdata
//           tempOutput.stateSize := tempOutput.stateSize + 1
//           when(io.input.tlast) { goto(DONE) }
//         }
//       }

//     DONE
//       .whenIsActive {
//         output.valid := True

//         when(output.fire) {
//           io.input.ready := True
//           tempOutput.stateSize := 0
//           when(io.input.fire) {
//             tempOutput.stateElements(0):=io.input.tdata
//             tempOutput.stateSize := 1
//           }
//           goto(BUSY)
//         }
//       }
//   }

//   val transmitterFSM = new StateMachine{
//     val input = receiverFSM.output.stage()
//     val output = Stream(Context(g))

//     val tempOutput = Reg(ReceiverContext(g))
//     val indexCount = Reg(UInt(log2Up(g.sizeMax) bits)) init(0)
//     val idCount = Reg(UInt(g.idWidth bits)) init(0)

//     input.ready := False
//     output.valid := False
//     output.stateElement := tempOutput.stateElements(indexCount)
//     output.stateSize := tempOutput.stateSize
//     output.roundIndex := 0
//     output.stateIndex := indexCount
//     output.stateId := idCount

//     val IDLE = new State with EntryPoint
//     val BUSY, DONE = new State

//     IDLE
//       .whenIsActive{
//         input.ready := True
//         when(input.fire){
//           tempOutput.assignSomeByName(input.payload)
//           goto(BUSY)
//         }
//       }
    
//     BUSY
//       .whenIsActive{
//         output.valid := True
//         when(output.fire){
//           indexCount := indexCount + 1
//           when(indexCount === tempOutput.stateSize - 2){
//             goto(DONE)
//           }
//         }
//       }
    
//     DONE
//       .whenIsActive{
//         output.valid := True
//         when(output.fire){
//           input.ready := True
//           idCount := idCount + 1
//           indexCount := 0
//           when(input.fire){
//             tempOutput.assignSomeByName(input.payload)
//             goto(BUSY)
//           } otherwise{
//             goto(IDLE)
//           }
//         }
//       }
//   }

//   io.output << transmitterFSM.output.s2mPipe().m2sPipe()
// }


object AXI4StreamReceiverVerilog {

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
    ).generate(AXI4StreamReceiver(config))
  }
}

object AXI4StreamTransmitterVerilog {
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
    ).generate(AXI4StreamTransmitter(config))
  }
}
