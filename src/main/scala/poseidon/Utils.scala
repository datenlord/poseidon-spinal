package poseidon
import spinal.core._
import spinal.lib._

// Stream Fifo Implemented through Xilinx AXI-Stream Data Fifo IP 
case class FifoIPConfig(byteWidth:Int, depth:Int, name:String){
  val width = byteWidth * 8
}

object AXISDataFifoIP{
  def apply(g:FifoIPConfig, input:Stream[Bits]):Stream[Bits]={
    val fifoInst = AXISDataFifoIP(g).setDefinitionName(g.name)
    fifoInst.io.input << input
    fifoInst.io.output
  }
}

case class AXISDataFifoIP( g:FifoIPConfig ) extends BlackBox{
  val io = new Bundle{
    val input = slave Stream(Bits(g.width bits))
    val output = master Stream(Bits(g.width bits))
    val clk = in Bool()
    val resetn = in Bool()
  }


  mapCurrentClockDomain(clock = io.clk, reset = io.resetn, resetActiveLevel= LOW)

  // Remove io_ prefix
  noIoPrefix()

  // Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.input.valid.setName("s_axis_tvalid")
    io.input.ready.setName("s_axis_tready")
    io.input.payload.setName("s_axis_tdata")

    io.output.valid.setName("m_axis_tvalid")
    io.output.ready.setName("m_axis_tready")
    io.output.payload.setName("m_axis_tdata")

    io.clk.setName("s_axis_aclk")
    io.resetn.setName("s_axis_aresetn")
  }

  // Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}


object BundleFifo{
  def apply[T<:Bundle](input:Stream[T], ipConfig:FifoIPConfig, isSim:Boolean):Stream[T] = {
    val fifoInst = BundleFifo(cloneOf(input.payload), ipConfig, isSim)
    fifoInst.io.push << input
    fifoInst.io.pop
  }
}

case class BundleFifo[T <: Bundle](dataType:HardType[T], ip:FifoIPConfig, isSim:Boolean) extends Component{
  val io = new Bundle{
    val push = slave Stream(dataType())
    val pop = master Stream(dataType())
  }

  val inputWidth = dataType.getBitsWidth
  val fifoWidth = ip.width
  val slicesCount = inputWidth / fifoWidth + (if(inputWidth % fifoWidth==0) 0 else 1)
  if(slicesCount > 1){
    val slicesVec = for(i <- 0 until slicesCount)
      yield io.push.payload.asBits((inputWidth-1 min (i+1)*fifoWidth) downto i*fifoWidth).resize(fifoWidth)

    val inputForked = StreamFork(io.push.toEvent(), slicesCount)
    val fifoInputs = Vec(Stream(Bits(fifoWidth bits)), slicesCount)
    for(i <- 0 until slicesCount){
      fifoInputs(i).arbitrationFrom(inputForked(i))
      fifoInputs(i).payload := slicesVec(i)
    }
    
    val fifoOutputs = if(isSim){
      fifoInputs.map( _.queue(ip.depth) )
    } else {
      fifoInputs.map(AXISDataFifoIP(ip,_))
    }
    io.pop.arbitrationFrom(StreamJoin(fifoOutputs))
    io.pop.payload.assignFromBits(fifoOutputs.map(_.payload).asBits().resized)

  } else{
    val fifoInput = io.push.translateWith(io.push.payload.asBits.resize(fifoWidth))
    val fifoOutput = if(isSim){
      fifoInput.queue(ip.depth)
    }
    else{
      AXISDataFifoIP(ip, fifoInput)
    }

    io.pop.arbitrationFrom(fifoOutput)
    io.pop.payload.assignFromBits(fifoOutput.payload.asBits.resized)
  }

  
}

// 
object FlowDelay{
  
  def apply[T <: Data](input:Flow[T], cycleCount:Int):Flow[T]={
    val validDelayed = Delay(input.valid, cycleCount, init=False)
    val payloadDelayed = Delay(input.payload, cycleCount)
    val inputDelayed = Flow(cloneOf(input.payload))
    inputDelayed.valid := validDelayed
    inputDelayed.payload := payloadDelayed
    inputDelayed
  }

}

object BundleFifoVerilog{
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 5,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    val clockDomainConfig = ClockDomainConfig(
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog",
      defaultConfigForClockDomains = clockDomainConfig
    ).generate(BundleFifo(Context(poseidonConfig), XilinxIPConfig.fifo, true))
  }
}