package poseidon
import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

case class MDSAddContext(g: PoseidonGenerics) extends Bundle {
  val isFull = Bool()
  val fullRound = UInt(log2Up(g.roundf) bits)
  val partialRound = UInt(log2Up(g.roundp) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateID = UInt(g.idWidth bits)
}

object MDSMatrixAdders {
  def apply(
      g: PoseidonGenerics,
      input: Flow[MDSContext]
  ): Flow[MDSContext] = {
    val matrixAddersInst = new MDSMatrixAdders(g)
    matrixAddersInst.io.input << input
    matrixAddersInst.io.output
  }
}

class MDSMatrixAdders(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Flow (MDSContext(g))
    val output = master Flow (MDSContext(g))
  }

  val adderIPConfig1 = AdderIPConfig(
    inputWidth = 255,
    outputWidth = 256,
    latency = 8,
    moduleName = "c_addsub_1"
  )

  // set configuration parameters of ModularAdderFlow implemented through Xilinx Adder IP
  val modAdderConfig = ModAdderConfig(
    dataWidth = g.dataWidth,
    modulus = PoseidonParam.modulus,
    compensation = PoseidonParam.compensation,
    isSim = g.isSim
  )

  val adderTree =
    AdderTree(modAdderConfig, adderIPConfig1, g.sizeMax)

  val partialRound = new Area {
    val input = io.input.takeWhen(!io.input.isFull)

    val inputBuffered = Vec(Flow(MDSContext(g)), 11)
    inputBuffered(0) := input.stage()
    for (i <- 1 until 11) {
      inputBuffered(i) := inputBuffered(i - 1).stage()
    }
    val bufferOut = PoseidonParam.sizeRange.map(size =>
      inputBuffered(size - 2).takeWhen(
        inputBuffered(size - 2).stateSize === size
      )
    )
    val bufferSelect = bufferOut.map(_.valid)
    val bufferOutMuxed = MuxOH(bufferSelect, bufferOut)

    val partialFlag = Reg(Bool()) init (False)
    when(bufferOutMuxed.valid && bufferOutMuxed.stateSize > 5) {
      partialFlag := !partialFlag
    }
    val tempInput = bufferOutMuxed.throwWhen(partialFlag).stage()

    val adderTreeInput = tempInput.translateWith {
      val payload =
        Mux(partialFlag, bufferOutMuxed.stateElements, tempInput.stateElements)
      when(tempInput.stateSize === 3) {
        for (i <- 1 until 3) { payload(i) := 0 }
      } elsewhen (tempInput.stateSize === 5) {
        for (i <- 1 until 5) { payload(i) := 0 }
      }
      payload
    }

    val contextDelayed = Delay(tempInput, adderTree.latency)

    val output = adderTree.io.output
      .translateWith {
        val payload = MDSContext(g)
        payload.assignSomeByName(contextDelayed.payload)
        payload.stateElements(0).allowOverride
        payload.stateElements(0) := adderTree.io.output.payload
        when(contextDelayed.stateSize === 3) {
          for (i <- 3 until 5) { payload.stateElements(i) := 0 }
        }
        when(contextDelayed.stateSize === 5) {
          for (i <- 5 until 9) { payload.stateElements(i) := 0 }
        }
        payload
      }
      .takeWhen(contextDelayed.valid)
      .stage()

  }

  val fullRound = new Area {
    val input = io.input.takeWhen(io.input.isFull)
    val output = Flow(MDSContext(g))

    //
    val shiftMat = ShiftMatrix(g)
    shiftMat.io.input << input

    // generate adder tree input
    val adderTreeInput = shiftMat.io.output.translateWith {
      shiftMat.io.output.stateElements
    }
    val addContext = shiftMat.io.output.translateWith {
      val payload = MDSAddContext(g)
      payload.assignSomeByName(shiftMat.io.output.payload)
      payload
    }
    val addContextDelayed = Delay(addContext, adderTree.latency)

    // deserialize adderTree Output
    val deserialization = new StateMachine {
      val counter = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)
      val tempOutput = Reg(MDSContext(g))
      tempOutput.stateElements.foreach(_ init (0))
      output.payload := tempOutput
      output.valid := False

      val adderTreeValid = adderTree.io.output.valid & addContextDelayed.valid
      val IDLE: State = new State with EntryPoint {
        whenIsActive {
          when(adderTreeValid) {
            tempOutput.assignSomeByName(addContextDelayed.payload)
            tempOutput.stateElements(counter) := adderTree.io.output.payload
            goto(BUSY)
            counter := counter + 1
          }
        }
      }

      val BUSY: State = new State {
        whenIsActive {
          when(adderTreeValid) {
            tempOutput.stateElements(counter) := adderTree.io.output.payload
            when(counter + 1 === tempOutput.stateSize) {
              goto(DONE)
            } otherwise {
              counter := counter + 1
            }
          }
        }
        onExit(counter := 0)
      }

      val DONE: State = new State {
        whenIsActive {
          output.valid := True
          when(adderTreeValid) {
            tempOutput.assignSomeByName(addContextDelayed.payload)
            tempOutput.stateElements(counter) := adderTree.io.output.payload
            goto(BUSY)
            counter := counter + 1
          } otherwise {
            goto(IDLE)
          }
        }
      }

    }
  }

  adderTree.io.input << fullRound.adderTreeInput
  when(partialRound.adderTreeInput.valid) {
    adderTree.io.input << partialRound.adderTreeInput
  }

  io.output << fullRound.output
  when(partialRound.output.valid) {
    io.output << partialRound.output
  }

}

case class ShiftRegister(dataWidth: Int, length: Int) extends Component {
  val io = new Bundle {
    val ena = in Bool ()
    val init = in Bool ()
    val serialInput = in UInt (dataWidth bits)
    val parallelInput = Vec(in UInt (dataWidth bits), length)
    val parallelOutput = Vec(out UInt (dataWidth bits), length)
  }
  val buffer = Vec(Reg(UInt(dataWidth bits)), length)
  buffer.foreach(_ init (0))
  io.parallelOutput.assignFromBits(buffer.asBits)

  when(io.init) {
    buffer.assignFromBits(io.parallelInput.asBits)
  } elsewhen (io.ena) {
    buffer(0) := io.serialInput
    for (i <- 1 until length) buffer(i) := buffer(i - 1)
  }
}

case class ShiftMatrix(g: PoseidonGenerics) extends Component {
  val io = new Bundle {
    val input = slave Flow (MDSContext(g))
    val output = master Flow (MDSContext(g))
  }
  val bufferEna0, bufferEna1, bufferInit0, bufferInit1 = Bool()
  val bufferVec0, bufferVec1 =
    Array.fill(g.sizeMax)(ShiftRegister(g.dataWidth, g.sizeMax))

  for (i <- 0 until g.sizeMax) {
    bufferVec0(i).io.ena := bufferEna0
    bufferVec1(i).io.ena := bufferEna1

    bufferVec0(i).io.init := bufferInit0
    bufferVec1(i).io.init := bufferInit1

    bufferVec0(i).io.serialInput := io.input.stateElements(i)
    bufferVec1(i).io.serialInput := io.input.stateElements(i)
    if (i == g.sizeMax - 1) {
      bufferVec0(i).io.parallelInput
        .assignFromBits(B(0, g.dataWidth * g.sizeMax bits))
      bufferVec1(i).io.parallelInput
        .assignFromBits(B(0, g.dataWidth * g.sizeMax bits))
    } else {
      bufferVec0(i).io.parallelInput
        .assignFromBits(bufferVec0(i + 1).io.parallelOutput.asBits)
      bufferVec1(i).io.parallelInput
        .assignFromBits(bufferVec1(i + 1).io.parallelOutput.asBits)
    }
  }

  val fsm = new StateMachine {
    val R0R1 = new State with EntryPoint
    val R1R0, T0R1, R0T1 = new State

    val outContext = Reg(MDSAddContext(g))
    val inCount, outCount = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)

    io.output.valid := False
    io.output.stateElements.assignFromBits(B(0, g.dataWidth * g.sizeMax bits))
    io.output.payload.assignSomeByName(outContext)
    bufferEna0 := False
    bufferEna1 := False
    bufferInit0 := False
    bufferInit1 := False

    R0R1
      .whenIsActive {
        when(io.input.valid) {
          bufferEna0 := True
          inCount := inCount + 1
          when(inCount === io.input.stateSize - 1) {
            goto(T0R1)
            outContext.assignSomeByName(io.input.payload)
          }
        }
      }
      .onExit(inCount := 0)

    R1R0
      .whenIsActive {
        when(io.input.valid) {
          bufferEna1 := True
          inCount := inCount + 1
          when(inCount === io.input.stateSize - 1) {
            goto(R0T1)
            outContext.assignSomeByName(io.input.payload)
          }
        }
      }
      .onExit(inCount := 0)

    T0R1
      .whenIsActive {
        bufferInit0 := True
        io.output.valid := True
        io.output.stateElements.assignFromBits(
          bufferVec0(0).io.parallelOutput.asBits
        )

        outCount := outCount + 1
        when(io.input.valid) {
          bufferEna1 := True
          inCount := inCount + 1
        }

        when(io.input.valid & (inCount === io.input.stateSize - 1)) {
          goto(R0T1)
          inCount := 0
          outContext.assignSomeByName(io.input.payload)
        } elsewhen (outCount === outContext.stateSize - 1) {
          goto(R1R0)
        }

      }
      .onExit(outCount := 0)

    R0T1
      .whenIsActive {
        io.output.valid := True
        bufferInit1 := True
        io.output.stateElements.assignFromBits(
          bufferVec1(0).io.parallelOutput.asBits
        )

        outCount := outCount + 1
        when(io.input.valid) {
          bufferEna0 := True
          inCount := inCount + 1
        }

        when(io.input.valid & (inCount === io.input.stateSize - 1)) {
          goto(T0R1)
          inCount := 0
          outContext.assignSomeByName(io.input.payload)
        } elsewhen (outCount === outContext.stateSize - 1) {
          goto(R0R1)
        }

      }
      .onExit(outCount := 0)
  }

  // val ena, init = Bool()
  // val bufferVec = Array.fill(g.sizeMax)(ShiftRegister(g.dataWidth, g.sizeMax))
  // for(i <- 0 until g.sizeMax){
  //   bufferVec(i).io.ena := ena
  //   bufferVec(i).io.init := init
  //   bufferVec(i).io.serialInput := io.input.stateElements(i)
  //   if(i == g.sizeMax-1){
  //     bufferVec(i).io.parallelInput.assignFromBits(B(0, g.dataWidth*g.sizeMax bits))
  //   } else{
  //     bufferVec(i).io.parallelInput.assignFromBits(bufferVec(i+1).io.parallelOutput.asBits)
  //   }
  // }

  // val fsm = new StateMachine{
  //   val IDLE = new State with EntryPoint
  //   val IN = new State
  //   val OUT = new State

  //   val tempContext = Reg(MDSAddContext(g))
  //   val inCount = Reg(UInt(log2Up(g.sizeMax) bits)) init(0)
  //   val outCount = Reg(UInt(log2Up(g.sizeMax) bits)) init(0)

  //   io.element.valid := False
  //   io.context.valid := False
  //   io.element.payload.assignFromBits(bufferVec(0).io.parallelOutput.asBits)
  //   io.context.payload := tempContext
  //   ena := False
  //   init := False

  //   IDLE.whenIsActive{
  //     when(io.input.valid){
  //       tempContext.assignSomeByName(io.input.payload)
  //       ena := True
  //       goto(IN)
  //       inCount := inCount + 1
  //     }
  //   }

  //   IN.whenIsActive{
  //     when(io.input.valid){
  //       ena := True
  //       inCount := inCount + 1
  //       when(inCount === tempContext.stateSize-1){
  //         goto(OUT)
  //       }
  //     }
  //   }.onExit(inCount := 0)

  //   OUT.whenIsActive{
  //     outCount := outCount + 1
  //     init := True
  //     io.element.valid := True
  //     io.context.valid := True
  //     when(outCount === tempContext.stateSize-1){
  //       goto(IDLE)
  //     }
  //   }.onExit(outCount := 0)
  // }
}

object ShiftRegisterVerilog {
  def main(args: Array[String]): Unit = {
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(ShiftRegister(255, 12))
  }
}

object ShiftMatrixVerilog {
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
    ).generate(ShiftMatrix(config))
  }
}

object MDSMatrixAddersVerilog {
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
    ).generate(new MDSMatrixAdders(config))
  }
}
