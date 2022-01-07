package poseidon

import spinal.core._
import spinal.lib._

case class ReceiverContext(g: PoseidonGenerics) extends Bundle {
  val round_index = UInt(log2Up(g.round_max) bits)
  val state_size = UInt(log2Up(g.t_max) bits)
  val state_id = UInt(g.id_width bits)
  val state_indexes = Vec(UInt(log2Up(g.t_max) bits), g.thread_num)
  val state_elements = Vec(UInt(g.data_width bits), g.thread_num)
}

object ReceiverState extends SpinalEnum {
  val IDLE, ELEMENT0, ELEMENT1, BLOCK, BLOCK_IDLE, DONE = newElement()
}

class AXI4StreamReceiver(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val input = slave(AXI4Stream(g.data_width))
    val outputs = Vec(master Stream (new Context(g)), g.thread_num)
  }

  import ReceiverState._

  val DataController = new Area {

    val idCounter = Reg(UInt(g.id_width bits)) init (0)
    val lengthCounter = Reg(UInt(log2Up(g.t_max) bits)) init (0)
    val state_elements = Vec(Reg(UInt(g.data_width bits)), g.thread_num)
    val state_indexes = Vec(Reg(UInt(log2Up(g.t_max) bits)), g.thread_num)
    state_elements.foreach(_ init (0))
    state_indexes.foreach(_ init (0))

    val output = Stream(ReceiverContext(g))
    output.round_index := 0
    output.state_size := lengthCounter
    output.state_id := idCounter
    output.state_indexes.assignFrom(state_indexes)
    output.state_elements.assignFrom(state_elements)

    //initiate signals
    output.valid := False
    io.input.ready := False
    val receiverState = Reg(ReceiverState()) init (IDLE)
    switch(receiverState) {
      is(IDLE) {
        io.input.ready := True
        when(io.input.fire()) {
          state_indexes(0) := lengthCounter
          state_elements(0) := io.input.payload

          lengthCounter := lengthCounter + 1
          receiverState := ELEMENT0
        }
      }

      is(ELEMENT0) {
        io.input.ready := True
        when(io.input.fire()) {
          state_indexes(1) := lengthCounter
          state_elements(1) := io.input.payload
          lengthCounter := lengthCounter + 1

          when(io.input.last) {
            state_indexes(2) := lengthCounter + 1
            receiverState := DONE
          } otherwise {
            receiverState := ELEMENT1
          }
        }
      }

      is(ELEMENT1) {
        io.input.ready := True
        when(io.input.fire()) {
          state_indexes(2) := lengthCounter
          state_elements(2) := io.input.payload

          lengthCounter := lengthCounter + 1
          when(io.input.last) {
            receiverState := DONE
          } otherwise {
            receiverState := BLOCK
          }
        }
      }

      is(BLOCK) {
        output.valid := True
        when(output.fire) {
          state_indexes.foreach(_ := 0)
          state_elements.foreach(_ := 0)
          io.input.ready := True

          when(io.input.fire()) {
            state_indexes(0) := lengthCounter
            state_elements(0) := io.input.payload

            lengthCounter := lengthCounter + 1
            receiverState := ELEMENT0
          } otherwise {
            receiverState := BLOCK_IDLE
          }
        }

      }

      is(BLOCK_IDLE) {
        io.input.ready := True
        when(io.input.fire()) {
          state_indexes(0) := lengthCounter
          state_elements(0) := io.input.payload

          lengthCounter := lengthCounter + 1
          receiverState := ELEMENT0
        }
      }

      is(DONE) {
        output.valid := True
        when(output.fire) {
          lengthCounter := 0
          idCounter := idCounter + 1
          state_indexes.foreach(_ := 0)
          state_elements.foreach(_ := 0)
          io.input.ready := True
          when(io.input.fire()) {
            state_elements(0) := io.input.payload
            lengthCounter := 1
            receiverState := ELEMENT0
          } otherwise {
            receiverState := IDLE
          }
        }
      }
    }
  }

  val DataBuffer = new Area {

    val continue =
      DataController.receiverState === DONE | DataController.receiverState === BLOCK | DataController.receiverState === IDLE

    val buffer0 = DataController.output.stage()
    val buffer0_buffer1 = Stream(ReceiverContext(g))
    buffer0_buffer1.arbitrationFrom(
      buffer0.continueWhen(
        continue | buffer0.state_id =/= DataController.idCounter
      )
    )
    buffer0_buffer1.payload.assignSomeByName(buffer0.payload)
    buffer0_buffer1.state_size.allowOverride
    buffer0_buffer1.state_size := buffer0.state_size
    when(DataController.receiverState === DONE) {
      when(DataController.lengthCounter > 3) {
        buffer0_buffer1.state_size := DataController.lengthCounter
      }
    }

    val buffer1 = buffer0_buffer1.stage()
    val buffer1_buffer2 = Stream(ReceiverContext(g))
    buffer1_buffer2.arbitrationFrom(
      buffer1.continueWhen(
        continue | buffer1.state_id =/= DataController.idCounter
      )
    )
    buffer1_buffer2.payload.assignSomeByName(buffer1.payload)
    buffer1_buffer2.state_size.allowOverride
    buffer1_buffer2.state_size := buffer1.state_size
    when(DataController.receiverState === DONE) {
      when(DataController.lengthCounter > 6) {
        buffer1_buffer2.state_size := DataController.lengthCounter
      }
    }

    val buffer2 = buffer1_buffer2.stage()
    val buffer2_buffer3 = Stream(ReceiverContext(g))
    buffer2_buffer3.arbitrationFrom(
      buffer2.continueWhen(
        continue | buffer2.state_id =/= DataController.idCounter
      )
    )
    buffer2_buffer3.payload.assignSomeByName(buffer2.payload)
    buffer2_buffer3.state_size.allowOverride
    buffer2_buffer3.state_size := buffer2.state_size
    when(DataController.receiverState === DONE) {
      when(DataController.lengthCounter > 9) {
        buffer2_buffer3.state_size := DataController.lengthCounter
      }
    }

    val buffer3 = buffer2_buffer3.stage()
    val outputs = StreamFork(buffer3, g.thread_num, true)
  }

  for (i <- 0 until g.thread_num) {
    io.outputs(i).arbitrationFrom(DataBuffer.outputs(i))
    io.outputs(i).payload.assignSomeByName(DataBuffer.outputs(i).payload)
    io.outputs(i).state_index := DataBuffer.outputs(i).state_indexes(i)
    io.outputs(i).state_element := DataBuffer.outputs(i).state_elements(i)
  }
}

case class TransmitterContext(g: PoseidonGenerics) extends Bundle {
  val state_id = UInt(g.id_width bits)
  val state_element = UInt(g.data_width bits)
}

class AXI4StreamTransmitter(g: PoseidonGenerics, buffer_depth: Int)
    extends Component {

  val io = new Bundle {
    val input = slave Stream (TransmitterContext(g))
    val output = master(AXI4Stream(g.data_width))
  }

  val idCounter = Reg(UInt(g.id_width bits)) init (0)
  when(io.output.fire()) {
    idCounter := idCounter + 1
  }
  val input_demux = Vec(Stream(TransmitterContext(g)), buffer_depth)
  val demux_select = OHToUInt(OHMasking.first(input_demux.map(_.ready)))
  (input_demux, StreamDemux(io.input, demux_select, buffer_depth)).zipped
    .foreach(_ << _)

  val buffer = input_demux.map(_.stage())
  val select = OHToUInt(
    (buffer.map(_.valid), buffer.map(_.state_id)).zipped
      .map(_ & _ === idCounter)
  )
  val buffer_out = StreamMux(select, buffer)

  io.output.valid := buffer_out.valid && buffer_out.state_id === idCounter
  io.output.last := True
  io.output.payload := buffer_out.state_element
  buffer_out.ready := io.output.ready && buffer_out.state_id === idCounter
}

object AXI4StreamReceiverVerilog {

  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      t_max = 12,
      round_max = 65,
      thread_num = 3,
      data_width = 255,
      id_width = 5
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
      t_max = 12,
      round_max = 65,
      thread_num = 3,
      data_width = 255,
      id_width = 5
    )
    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog"
    ).generate(new AXI4StreamTransmitter(config, 5))
  }
}
