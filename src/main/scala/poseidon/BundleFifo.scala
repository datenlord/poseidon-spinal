package poseidon
import spinal.core._
import spinal.lib._

case class FifoIPConfig(byteWidth:Int, depth:Int, isSim:Boolean){
  val width = byteWidth * 8
}
object AXISDataFifoIP{
  def apply(g:FifoIPConfig, input:Stream[Bits]):Stream[Bits]={
    val fifoInst = AXISDataFifoIP(g)
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
  // Map clock domain
  mapClockDomain(clock = io.clk, reset = io.resetn)

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

    io.clk.setName("s_axis_aresetn")
    io.resetn.setName("s_axis_aclk")
  }

  // Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())
}

object BundleFifo{
  def apply[T<:Bundle](input:Stream[T], ipConfig:FifoIPConfig):Stream[T] = {
    val fifoInst = BundleFifo(cloneOf(input.payload), ipConfig)
    fifoInst.io.push << input
    fifoInst.io.pop
  }
}

case class BundleFifo[T <: Bundle](dataType:HardType[T], ip:FifoIPConfig) extends Component{
  val io = new Bundle{
    val push = slave Stream(dataType())
    val pop = master Stream(dataType())
  }
  val inputWidth = dataType.getBitsWidth
  val fifoWidth = ip.width
  if(ip.isSim){
    io.pop << io.push.queue(ip.depth)
  } else{
    val slicesCount = inputWidth / fifoWidth + (if(inputWidth % fifoWidth==0) 0 else 1)
    val slicesVec = for(i <- 0 until slicesCount)
      yield io.push.payload.asBits((inputWidth-1 min (i+1)*fifoWidth) downto i*fifoWidth).resize(fifoWidth)

    val inputForked = StreamFork(io.push.toEvent(), slicesCount)
    val fifoInputs = Vec(Stream(Bits(fifoWidth bits)), slicesCount)
    for(i <- 0 until slicesCount){
        fifoInputs(i).arbitrationFrom(inputForked(i))
        fifoInputs(i).payload := slicesVec(i)
    }

    val fifoOutputs = fifoInputs.map(AXISDataFifoIP(ip,_))
    io.pop.arbitrationFrom(StreamJoin(fifoOutputs))
    io.pop.payload.assignFromBits(fifoOutputs.map(_.payload).asBits().resized)
  }
}

object BundleFifoVerilog{
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      sizeMax = 12,
      roundp = 57,
      roundf = 8,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    val ipConfig = FifoIPConfig( byteWidth = 193, depth = 256, isSim = false)
    val clockDomainConfig = ClockDomainConfig(
      resetKind = SYNC,
      resetActiveLevel = LOW
    )

    SpinalConfig(
        mode = Verilog,
        targetDirectory = "./src/main/verilog",
        defaultConfigForClockDomains = clockDomainConfig
    ).generate(BundleFifo(MDSContext(poseidonConfig), ipConfig))
  }
}
