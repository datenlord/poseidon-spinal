package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

case class MDSContext(g: PoseidonGenerics) extends Bundle {
  val roundIndex = UInt(log2Up(g.roundMax) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateId = UInt(g.idWidth bits)
  val stateElements = Vec(UInt(g.dataWidth bits), g.sizeMax)
}

case class MDSMulContext(g: PoseidonGenerics) extends Bundle {
  val roundIndex = UInt(log2Up(g.roundMax) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateId = UInt(g.idWidth bits)
}

object MDSMatrixMultiplier {
  def apply(
      g: PoseidonGenerics,
      mulConfig: MontMultConfig,
      ipConfig: MulIPConfig,
      input: Flow[ContextCase]
  ): Flow[MDSContext] = {
    val MDSMultiplierInst = new MDSMatrixMultiplier(g, mulConfig, ipConfig)
    MDSMultiplierInst.io.input << input
    MDSMultiplierInst.io.output
  }
}

case class MDSMatrixMultiplier(
    g: PoseidonGenerics,
    mulConfig: MontMultConfig,
    ipConfig: MulIPConfig
) extends Component {

  val io = new Bundle {
    val input = slave Flow (ContextCase(g))
    val output = master Flow (MDSContext(g))
  }

  // mds_matrix_rom
  val mdsMatrix_t3 =
    MDSMatrix(t = 3, dataWidth = g.dataWidth, io.input.stateIndex.resized)
  val mdsMatrix_t5 =
    MDSMatrix(t = 5, dataWidth = g.dataWidth, io.input.stateIndex.resized)
  val mdsMatrix_t9 =
    MDSMatrix(t = 9, dataWidth = g.dataWidth, io.input.stateIndex.resized)
  val mdsMatrix_t12 =
    MDSMatrix(t = 12, dataWidth = g.dataWidth, io.input.stateIndex.resized)
  // mdsMatrix_t3.io.address_port  := io.input.state_index.resized
  // mdsMatrix_t5.io.address_port  := io.input.state_index.resized
  // mdsMatrix_t9.io.address_port  := io.input.state_index.resized
  // mdsMatrix_t12.io.address_port := io.input.state_index.resized

  val mdsConstants = Vec(UInt(g.dataWidth bits), g.sizeMax)
  switch(io.input.stateSize) {
    is(3) {
      mdsConstants.assignFromBits(
        B(0, (g.sizeMax - 3) * g.dataWidth bits) ## mdsMatrix_t3.asBits
      )
    }
    is(5) {
      when(io.input.stateIndex === 5) {
        mdsConstants.assignFromBits(B(0, g.sizeMax * g.dataWidth bits))
      } otherwise {
        mdsConstants.assignFromBits(
          B(0, (g.sizeMax - 5) * g.dataWidth bits) ## mdsMatrix_t5.asBits
        )
      }
    }
    is(9) {
      mdsConstants.assignFromBits(
        B(0, (g.sizeMax - 9) * g.dataWidth bits) ## mdsMatrix_t9.asBits
      )
    }
    is(12) {
      mdsConstants.assignFromBits(mdsMatrix_t12.asBits)
    }
    default {
      mdsConstants.assignFromBits(B(0, g.sizeMax * g.dataWidth bits))
    }
  }

  val mulInputs = for (i <- 0 until g.sizeMax) yield io.input.translateWith {
    operands(g.dataWidth, io.input.stateElement, mdsConstants(i))
  }


  val mulOutputs = mulInputs.map(MontgomeryMultFlow(mulConfig, ipConfig, _))

  val mulContext = MDSMulContext(g)
  mulContext.assignSomeByName(io.input.payload)
  val mulContextDelayed = Delay(mulContext, MontgomeryMultFlow.latency(mulConfig, ipConfig))

  // val mulResJoined = StreamJoin(mulOutputs)

  io.output.valid := mulOutputs.map(_.valid).asBits().andR
  io.output.payload.assignSomeByName(mulContextDelayed)
  io.output.payload.stateElements
    .assignFromBits(mulOutputs.map(_.res).asBits())
}


case class PEContext(g:PoseidonGenerics) extends Bundle {
  val peCounter    = UInt(log2Up(g.sizeMax) bits)
  val stateElement = UInt(g.dataWidth bits)
  val stateSize    = UInt(log2Up(g.sizeMax) bits)
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
  val peCounter    = UInt(log2Up(g.sizeMax) bits)
  val stateSize    = UInt(log2Up(g.sizeMax) bits)
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
  def apply(g:PoseidonGenerics, modArith:ModArithmetic, input:Stream[ContextCase]):Stream[MDSContext]={
    val mdsInst = MDSMixing(g, modArith)
    mdsInst.io.input := input
    mdsInst.io.output
  }
}

case class MDSMixing(g:PoseidonGenerics, modArith:ModArithmetic) extends Component{

  val io = new Bundle{
    val input  = slave Stream(ContextCase(g))
    val output = master Stream(MDSContext(g))
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
    val peLoopback = PEConnection(g)
    val stateSize, counter = Reg(UInt(log2Up(g.sizeMax) bits)) init(0)
    val countEnable = counter + 1 < stateSize
    when(countEnable){
      counter := counter + 1
    }otherwise{
      counter := 0
      stateSize := 0
      when(peLoopback.operand.valid){
        stateSize := peLoopback.operand.stateSize
      }
    }
    val input = io.input.haltWhen(countEnable || peLoopback.operand.valid).toFlow

    // Input Operand Logic
    val operandInput = input.translateWith{
      val payload = PEOperand(g)
      payload.assignSomeByName(input.payload)
      payload
    }
    val operandOutput = Mux(peLoopback.operand.valid, peLoopback.operand, operandInput)

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
    val validDelayed = Delay(contextInput.valid, contextLatency, init=False)
    val payloadDelayed = Delay(contextInput.payload, contextLatency)
    val contextDelayed = Flow(PEContext(g))
    contextDelayed.valid := validDelayed
    contextDelayed.payload := payloadDelayed
    val contextOutput = Mux(peLoopback.context.valid, peLoopback.context, contextDelayed)

    // Drive Input Signals Of The First Processing Engine
    peConnections(0).context := contextOutput
    peConnections(0).operand := operandOutput
  }

  // Processing Engine Output Logic
  val peOutputLogic = new Area{
    val input = peConnections.last
    val peLoopback = PEConnection(g)

  
    // Operand Logic
    val peOpLatency = g.peNum * ProcessingEngine.operandLatency(modArith)
    peLoopback.operand := FlowDelay(input.operand, g.mdsOperandLatency - peOpLatency)

    // Context Logic
    val done = input.context.peCounter === input.context.stateSize
    val contextLoopback = input.context.throwWhen(done)
    peLoopback.context := FlowDelay(contextLoopback, g.mdsOperandLatency - peOpLatency)
    
    val output = input.context.takeWhen(done)

    // Loopback
    peInputLogic.peLoopback := peLoopback
  }


  val MDSOutputFSM = new StateMachine {
    val input = peOutputLogic.output
    val output = Flow(MDSContext(g))
    val counter = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)
    val tempOutput = Reg(MDSContext(g))
    tempOutput.stateElements.foreach(_ init(0))
    tempOutput.stateSize init(0)
    tempOutput.roundIndex init(0)
    tempOutput.stateId init(0)
    output.payload.assignSomeByName(tempOutput)
    output.valid := False

    val IDLE = new State with EntryPoint
    val BUSY, DONE = new State

    IDLE
      .whenIsActive{
        when(input.valid){
          tempOutput.assignSomeByName(input.payload)
          tempOutput.stateElements(counter) := input.stateElement
          counter := counter + 1
          goto(BUSY)
        }
      }

    BUSY
      .whenIsActive{
        when(input.valid){
          tempOutput.stateElements(counter) := input.stateElement
          counter := counter + 1
          when(counter+1 === tempOutput.stateSize){
            goto(DONE)
          }
        }
      }.onExit(counter:=0)

    DONE
      .whenIsActive{
        output.valid := True
        when(input.valid){
          tempOutput.assignSomeByName(input.payload)
          tempOutput.stateElements(counter) := input.stateElement
          counter := counter + 1
          goto(BUSY)
        } otherwise{
          goto(IDLE)
        }
      }
  }

  io.output << MDSOutputFSM.output.toStream
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

    val mulIP = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    // set configuration parameters of Xilinx Adder IP implemented through LUT
    val addIP = AdderIPConfig(
      inputWidth = 255,
      outputWidth = 256,
      latency = 8,
      moduleName = "c_addsub_0"
    )

    // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
    val addConfig = ModAdderConfig(
      dataWidth = 255,
      modulus = PoseidonParam.modulus,
      compensation = PoseidonParam.compensation,
      isSim = true
    )

    val modArith = ModArithmetic(mulConfig, mulIP,addConfig, addIP)
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

object MDSMatrixMultiplierVerilog {
  def main(args: Array[String]): Unit = {
    val poseidonConfig = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 5,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    val modulus = BigInt(
      "73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001",
      16
    )
    val modInverse = BigInt(
      "3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff",
      16
    )
    val compensation = BigInt(
      "c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff",
      16
    )
    val montMultConfig =
      MontMultConfig(255, 256, modulus, modInverse, compensation, true)

    val mulIPConfig = MulIPConfig(
      inputWidth = 34,
      outputWidth = 68,
      isCE = false,
      isSCLR = false,
      pipeStages = 6,
      moduleName = "mult_gen_0"
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MDSMatrixMultiplier(poseidonConfig, montMultConfig, mulIPConfig))
  }
}
