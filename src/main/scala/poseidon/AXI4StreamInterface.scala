package poseidon

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object AXI4StreamReceiver {
  def apply(g: PoseidonGenerics, input: AXI4Stream): Stream[MDSContext] = {
    val receiver = new AXI4StreamReceiver(g)
    receiver.io.input.connectFrom(input)
    receiver.io.output
  }
}

class AXI4StreamReceiver(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave(AXI4Stream(g.dataWidth))
    val output = master Stream (MDSContext(g))
  }

  // deserialize the serial input from AXIStream Bus to get stateSize
  val receiver = new Area {
    val output = Stream(MDSContext(g))

    val sizeCounter = Reg(UInt(log2Up(g.sizeMax) bits)) init (0)
    val idCounter = Reg(UInt(g.idWidth bits)) init (0)
    val buffer = Vec(Reg(UInt(g.dataWidth bits)), g.sizeMax)
    buffer.foreach(_ init (0))

    val receiverFSM = new StateMachine {
      io.input.ready := False
      output.valid := False
      output.stateId := 0
      output.stateSize := 0
      output.stateElements.foreach(_ := 0)
      output.roundIndex := 0

      val BUSY = new State with EntryPoint
      val DONE = new State

      BUSY
        .whenIsActive {
          io.input.ready := True
          when(io.input.fire()) {
            buffer(sizeCounter) := io.input.payload
            sizeCounter := sizeCounter + 1
            when(io.input.last) { goto(DONE) }
          }
        }

      DONE
        .whenIsActive {
          output.valid := True
          output.stateSize := sizeCounter
          output.stateId := idCounter
          (output.stateElements lazyZip buffer).foreach(_ := _)

          when(output.fire) {
            io.input.ready := True
            buffer.foreach(_ := 0)
            idCounter := idCounter + 1
            sizeCounter := 0
            goto(BUSY)
            when(io.input.fire()) {
              buffer(0) := io.input.payload
              sizeCounter := 1
            }
          }
        }
    }
  }

  io.output << receiver.output.stage()
}

case class TransmitterContext(g: PoseidonGenerics) extends Bundle {
  val state_id = UInt(g.idWidth bits)
  val state_element = UInt(g.dataWidth bits)
}

object AXI4StreamTransmitter {
  def apply(
      g: PoseidonGenerics,
      input: Stream[TransmitterContext]
  ): AXI4Stream = {
    val transmitterInst = new AXI4StreamTransmitter(g)
    transmitterInst.io.input << input
    transmitterInst.io.output
  }
}

class AXI4StreamTransmitter(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave Stream (TransmitterContext(g))
    val output = master(AXI4Stream(g.dataWidth))
  }

  val idCounter = Reg(UInt(g.idWidth bits)) init (0)
  when(io.output.fire()) {
    idCounter := idCounter + 1
  }

  val loopback = Stream(TransmitterContext(g))
  val temp = StreamArbiterFactory.lowerFirst.onArgs(io.input, loopback).stage()
  val demuxOutputs = StreamDemux(temp, (temp.state_id === idCounter).asUInt, 2)
  io.output.last := True
  io.output.valid := demuxOutputs(1).valid
  demuxOutputs(1).ready := io.output.ready
  io.output.payload := demuxOutputs(1).state_element
  loopback << demuxOutputs(0).queue(g.transmitterQueue).s2mPipe()

  // val inputTemp = io.input.s2mPipe().m2sPipe()
  // val outputTemp = inputTemp.queue(bufferDepth)
  // io.output.valid := outputTemp.valid
  // io.output.payload := outputTemp.state_element
  // io.output.last := True
  // outputTemp.ready := io.output.ready

  // val idCounter = Reg(UInt(g.idWidth bits)) init (0)
  // when(io.output.fire()) {
  //   idCounter := idCounter + 1
  // }
  // val input_demux = Vec(Stream(TransmitterContext(g)), bufferDepth)
  // val demux_select = OHToUInt(OHMasking.first(input_demux.map(_.ready)))

  // input_demux
  //   .lazyZip(StreamDemux(io.input, demux_select, bufferDepth))
  //   .foreach(_ << _)

  // val buffer = input_demux.map(_.stage())
  // val select = OHToUInt(
  //   buffer
  //     .map(_.valid)
  //     .lazyZip(buffer.map(_.state_id))
  //     .map(_ & _ === idCounter)
  // )
  // val buffer_out = StreamMux(select, buffer)

  // io.output.valid := buffer_out.valid && buffer_out.state_id === idCounter
  // io.output.last := True
  // io.output.payload := buffer_out.state_element
  // buffer_out.ready := io.output.ready && buffer_out.state_id === idCounter
}

object AXI4StreamReceiverVerilog {

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
    ).generate(new AXI4StreamReceiver(config))
  }
}

object AXI4StreamTransmitterVerilog {

  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 2,
      dataWidth = 255,
      idWidth = 5,
      isSim = true,
      transmitterQueue = 20
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new AXI4StreamTransmitter(config))
  }
}
