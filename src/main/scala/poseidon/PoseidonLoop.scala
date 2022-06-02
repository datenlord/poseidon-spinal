package poseidon

import spinal.core._
import spinal.lib._

case class LoopbackDeMux(g: PoseidonGenerics) extends Component {
  val io = new Bundle {
    val input = slave Stream (Context(g))
    val output0 = master Stream (Context(g))
    val output1 = master Stream (Context(g))
  }

  import PoseidonParam._
  val input = io.input
  val done = sizeRange.map(
    size => (input.stateSize === size) & (input.roundIndex === maxRoundIndex(size)) 
  )
  val select = done.reduce(_||_)
  val inputDemuxed = StreamDemux(input, select.asUInt, 2)

  io.output0 << inputDemuxed(0).translateWith{
    val payload = Context(g)
    payload.assignSomeByName(inputDemuxed(0).payload)
    payload.roundIndex.allowOverride
    payload.roundIndex := inputDemuxed(0).roundIndex + 1
    payload
  }.s2mPipe().m2sPipe()

  val take = (inputDemuxed(1).stateIndex === 1)
  io.output1 << inputDemuxed(1).takeWhen(take).s2mPipe().m2sPipe()
}

object PoseidonLoop {
  def apply(g: PoseidonGenerics, input: Stream[Context]): Stream[Context] = {
    val loopInst = PoseidonLoop(g)
    loopInst.io.input << input
    loopInst.io.output
  }
}

case class PoseidonLoop(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input  = slave Stream (Context(g))
    val output = master Stream (Context(g))
  }

  //
  val dataMux = new Area{
    val input = io.input
    val loopback = Stream(Context(g))

    val loopbackHalt = Reg(Bool()) init(False)
    val inputCounter = Counter(0 until (g.mdsOperandLatency+g.peNum), inc=input.fire)
    val haltClear0 = (input.stateIndex === (input.stateSize-1)) & (input.stateSize < g.peNum)
    val haltClear1 = (input.stateSize > g.peNum) & inputCounter.willOverflow
    when(input.fire){
      loopbackHalt := True
      when(haltClear0||haltClear1){
        loopbackHalt := False
      }
    } otherwise{
      loopbackHalt := False
    }
    val loopbackMusked = loopback.haltWhen(loopbackHalt & input.valid)
    val output = StreamArbiterFactory.lowerFirst.onArgs(loopbackMusked, io.input)
  }

  //
  val threadInputControl = new Area{
    val input = dataMux.output
    val arbiterCounter = Reg( UInt(log2Up(g.sizeMax) bits) ) init(0)
    val stateSize = Reg( UInt(log2Up(g.sizeMax) bits) ) init(0)
    val countEnable = arbiterCounter + 1 < stateSize


    val bufferInput = input.toFlowFire.throwWhen(input.stateIndex < g.peNum)
    val bufferOutput = FlowDelay(bufferInput, g.mdsOperandLatency)

    val inputHalt = RegNext(arbiterCounter + 2 < stateSize) init(False)
    val arbiterInput1 = input.haltWhen(inputHalt)
    //val arbiterInput1 = input.haltWhen(countEnable)
    val arbiterInput0 = bufferOutput.toStream
  
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
    val output = arbiterOutput.toFlow.stage()
  }

  //
  val threadOutput = PoseidonThread(g, threadInputControl.output)
  val threadBuffer = BundleFifo(threadOutput.toStream, XilinxIPConfig.fifo, g.isSim)
  
  //
  val demuxInst = LoopbackDeMux(g)
  demuxInst.io.input << threadBuffer
  dataMux.loopback  << demuxInst.io.output0
  io.output << demuxInst.io.output1
}
