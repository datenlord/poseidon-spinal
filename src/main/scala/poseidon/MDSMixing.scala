package poseidon

import spinal.core._
import spinal.lib._

case class MDSContext(g:PoseidonGenerics) extends Bundle{
  val stateElements = Vec(UInt(g.dataWidth bits), g.sizeMax)
  val stateSize    = UInt(log2Up(g.sizeMax) bits)
  val roundIndex   = UInt(log2Up(g.roundMax) bits)
}

case class PEContext(g:PoseidonGenerics) extends Bundle {
  val peCounter    = UInt(log2Up(g.sizeMax) bits)
  val stateElement = UInt(g.dataWidth bits)
  val stateSize    = UInt(log2Up(g.sizeMax) bits)
  val stateIndex   = UInt(log2Up(g.sizeMax) bits)
  val roundIndex   = UInt(log2Up(g.roundMax) bits)
  val stateId      = UInt(g.idWidth bits)
}

case class PEOperand(g:PoseidonGenerics) extends Bundle{
  val stateElement = UInt(g.dataWidth bits)
  val stateSize    = UInt(log2Up(g.sizeMax) bits)
  val stateIndex   = UInt(log2Up(g.sizeMax) bits)
}

// Signals Connections Between two PEs
case class PEConnection(g:PoseidonGenerics) extends Bundle with IMasterSlave{
  val context = Flow(PEContext(g))
  val operand = Flow(PEOperand(g))

  override def asMaster(): Unit = {
    master(context, operand)
  }
}


case class MDSAdderContext(g:PoseidonGenerics) extends Bundle{
  val peCounter    = UInt(log2Up(g.sizeMax)  bits)
  val stateSize    = UInt(log2Up(g.sizeMax)  bits)
  val stateIndex   = UInt(log2Up(g.sizeMax)  bits)
  val roundIndex   = UInt(log2Up(g.roundMax) bits)
  val stateId      = UInt(g.idWidth bits)
}


case class ModArithmetic(
  mulConfig: MontMultConfig,
  mulIP: MulIPConfig,
  addConfig: ModAdderConfig,
  addIP:AdderIPConfig
  )


object ProcessingEngine{

  def latencyToAdder(modArith: ModArithmetic):Int = {
    val memLatency = PEConstantMem.latency
    val mulLatency = MontgomeryMultFlow.latency(modArith.mulConfig, modArith.mulIP)
    memLatency + mulLatency + 2
  }

  def operandLatency(modArith: ModArithmetic):Int = {
    ModularAdderFlow.latency(modArith.addIP) - 1
  }

  def apply(
    peTag:Int, 
    g:PoseidonGenerics, 
    modArith:ModArithmetic, 
    input:PEConnection):PEConnection = 
  {
    val peInst = ProcessingEngine(peTag, g, modArith)
    peInst.io.input := input
    peInst.io.output
  }
}


// the processing engine of systolic array in MDSMixing
case class ProcessingEngine(peTag:Int, g:PoseidonGenerics, modArith:ModArithmetic) extends Component{
  val io = new Bundle{
    val input  = slave (PEConnection(g))
    val output = master(PEConnection(g))
  }

  val stateNum = g.sizeMax/g.peNum + (if(g.sizeMax % g.peNum==0) 0 else 1)
  val stateIndexRange = (0 until stateNum).map(g.peNum*_+ peTag)

  //
  val operandLogic = new Area{
    val stateIndexHits = stateIndexRange.map(_ === io.input.operand.stateIndex)
    val input = io.input.operand.takeWhen(stateIndexHits.orR)

    val tempOperand = Reg(PEOperand(g))
    tempOperand.stateIndex init(0)
    tempOperand.stateSize init(0)
    tempOperand.stateElement init(0)

    val colIndexCount = Counter(log2Up(g.sizeMax) bits)
    val countEnable = (colIndexCount.value + 1) < tempOperand.stateSize
    when(countEnable){
      colIndexCount.increment()
    } otherwise {
      colIndexCount.clear()
      tempOperand.stateSize := 0
      when(input.valid){
        tempOperand := input.payload
      }
    }

    val output = Flow(PEOperand(g))
    output.valid := colIndexCount.value < tempOperand.stateSize
    output.payload.assignSomeByName(tempOperand)
  }

  // MDSMatrixConstantMem
  val peMemAddr = PEMemAddr(g)
  peMemAddr.stateSize := operandLogic.output.stateSize
  peMemAddr.rowIndex := operandLogic.output.stateIndex
  peMemAddr.colIndex := operandLogic.colIndexCount
  val constant = PEConstantMem(g, peTag, peMemAddr)
  val opDelayed = Delay(operandLogic.output.stateElement, PEConstantMem.latency)
  val opValidDelayed = Delay(operandLogic.output.valid, PEConstantMem.latency, init=False)

  // Montgomery Multiplier
  val mulInput = Flow(operands(g.dataWidth))
  mulInput.op1 := opDelayed
  mulInput.op2 := constant
  mulInput.valid := opValidDelayed
  val mulOutput= MontgomeryMultFlow(modArith.mulConfig, modArith.mulIP, mulInput)
  val mulOutputTemp = mulOutput.translateWith{
    val payload = results(g.dataWidth)
    payload.res := Mux(mulOutput.valid, mulOutput.res, U(0,g.dataWidth bits))
    payload
  }.stage()


  // Modular Adder
  val addInput = io.input.context.translateWith{
    val payload = operands(g.dataWidth)
    payload.op1 := mulOutputTemp.res
    payload.op2 := io.input.context.stateElement
    payload
  }

  val addOutput = ModularAdderFlow(modArith.addConfig, modArith.addIP, addInput)
  val addContext = MDSAdderContext(g)
  addContext.assignSomeByName(io.input.context.payload)
  when(mulOutputTemp.valid){
    addContext.peCounter := io.input.context.peCounter + 1
  }
  val addLatency = ModularAdderFlow.latency(modArith.addIP)
  val addContextDelayed = Delay(addContext, addLatency)

  io.output.context := addOutput.translateWith{
    val payload = PEContext(g)
    payload.assignSomeByName(addContextDelayed)
    payload.stateElement := addOutput.res
    payload
  }

  // Operand Delay
  val nextOperand = io.input.operand.takeWhen(operandLogic.countEnable)
  val operandDelayed = FlowDelay(nextOperand, addLatency-1)
  io.output.operand.valid := operandDelayed.valid
  io.output.operand.payload := operandDelayed.payload
}


object MDSMixing{
  def apply(g:PoseidonGenerics, modArith:ModArithmetic, input:Flow[Context]):Flow[Context]={
    val mdsInst = MDSMixing(g, modArith)
    mdsInst.io.input := input
    mdsInst.io.output
  }
}

case class MDSMixing(g:PoseidonGenerics, modArith:ModArithmetic) extends Component{

  val io = new Bundle{
    val input  = slave Flow(Context(g))
    val output = master Flow(Context(g))
  }
  // The Array Of Processing Engines
  val peConnections = Vec(PEConnection(g), g.peNum+1)
  for(i <- 0 until g.peNum){
    val peInst = ProcessingEngine(peTag = i, g=g, modArith=modArith)
    peInst.io.input := peConnections(i)
    peConnections(i+1) := peInst.io.output
  }

  // Processing Engine Input Logic
  val peInputLogic = new Area{

    // PE Loopback Logic
    val contextLoopback = Flow(PEContext(g))
    val input = io.input

    // Input Operand Logic
    val operandInput = input.translateWith{
      val payload = PEOperand(g)
      payload.assignSomeByName(input.payload)
      payload
    }
    val operandOutput = operandInput

    // Input Context Logic
    val contextInput = input.translateWith{
      val payload = PEContext(g)
      payload.assignSomeByName(input.payload)
      payload.stateElement.allowOverride
      payload.stateElement := 0
      payload.peCounter := 0
      payload
    }
    val contextLatency = ProcessingEngine.latencyToAdder(modArith)
    val contextDelayed = FlowDelay(contextInput, contextLatency)

    val contextOutput = Mux(contextLoopback.valid, contextLoopback, contextDelayed)

    // Drive Input Signals Of The First Processing Engine
    peConnections(0).context := contextOutput
    peConnections(0).operand := operandOutput
  }

  // Processing Engine Output Logic
  val peOutputLogic = new Area{
    val input = peConnections.last

  
    val peOpLatency = g.peNum * ProcessingEngine.operandLatency(modArith)

    val done = input.context.peCounter === input.context.stateSize
    val contextLoopback = input.context.throwWhen(done) 
    peInputLogic.contextLoopback := FlowDelay(contextLoopback, g.mdsOperandLatency - peOpLatency)

    val output = input.context.takeWhen(done)
    
  }

  io.output := peOutputLogic.output.translateWith{
    val payload = Context(g)
    payload.assignSomeByName(peOutputLogic.output.payload)
    payload
  }.stage()
}


object ProcessingEngineVerilog{
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 5,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    val mulConfig = MontMultConfig(
        dataWidth = 255,
        rWidth = 256,
        modulus = PoseidonParam.modulus,
        modInverse = PoseidonParam.modInverse,
        compensation = PoseidonParam.compensation,
        isSim = true
    )

    // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
    val addConfig = ModAdderConfig(
      dataWidth = 255,
      modulus = PoseidonParam.modulus,
      compensation = PoseidonParam.compensation,
      isSim = true
    )

    val modArith = ModArithmetic(mulConfig, XilinxIPConfig.mul0, addConfig, XilinxIPConfig.adder0)
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(
      ProcessingEngine(
        peTag = 0,
        g = poseidonConfig,
        modArith = modArith
      )
    )
  }
}

object MDSMixingVerilog{
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 5,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    val mulConfig = MontMultConfig(
      dataWidth = 255,
      rWidth = 256,
      modulus = PoseidonParam.modulus,
      modInverse = PoseidonParam.modInverse,
      compensation = PoseidonParam.compensation,
      isSim = true
    )

    val addConfig = ModAdderConfig(
      dataWidth = 255,
      modulus = PoseidonParam.modulus,
      compensation = PoseidonParam.compensation,
      isSim = true
    )

    val modArith = ModArithmetic(
      mulConfig = mulConfig,
      mulIP = XilinxIPConfig.mul0,
      addConfig = addConfig,
      addIP = XilinxIPConfig.adder0
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MDSMixing(poseidonConfig, modArith))

  }
}

