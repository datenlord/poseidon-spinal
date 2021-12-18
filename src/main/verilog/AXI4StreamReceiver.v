// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : AXI4StreamReceiver


`define ReceiverState_binary_sequential_type [2:0]
`define ReceiverState_binary_sequential_IDLE 3'b000
`define ReceiverState_binary_sequential_ELEMENT0 3'b001
`define ReceiverState_binary_sequential_ELEMENT1 3'b010
`define ReceiverState_binary_sequential_BLOCK_1 3'b011
`define ReceiverState_binary_sequential_BLOCK_IDLE 3'b100
`define ReceiverState_binary_sequential_DONE 3'b101


module AXI4StreamReceiver (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_last,
  input      [254:0]  io_input_payload,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [4:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [4:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [6:0]    io_outputs_2_payload_round_index,
  output     [3:0]    io_outputs_2_payload_state_index,
  output     [3:0]    io_outputs_2_payload_state_size,
  output     [4:0]    io_outputs_2_payload_state_id,
  output     [254:0]  io_outputs_2_payload_state_element,
  input               clk,
  input               reset
);
  wire                DataBuffer_buffer2_buffer3_buffer3_fork_io_input_ready;
  wire                DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_valid;
  wire       [6:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_size;
  wire       [4:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_id;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_2;
  wire                DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_valid;
  wire       [6:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_size;
  wire       [4:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_id;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_2;
  wire                DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_valid;
  wire       [6:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_round_index;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_size;
  wire       [4:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_id;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_2;
  reg        [4:0]    DataController_idCounter;
  reg        [3:0]    DataController_lengthCounter;
  reg        [254:0]  DataController_state_elements_0;
  reg        [254:0]  DataController_state_elements_1;
  reg        [254:0]  DataController_state_elements_2;
  reg        [3:0]    DataController_state_indexes_0;
  reg        [3:0]    DataController_state_indexes_1;
  reg        [3:0]    DataController_state_indexes_2;
  reg                 DataController_output_valid;
  reg                 DataController_output_ready;
  wire       [6:0]    DataController_output_payload_round_index;
  wire       [3:0]    DataController_output_payload_state_size;
  wire       [4:0]    DataController_output_payload_state_id;
  wire       [3:0]    DataController_output_payload_state_indexes_0;
  wire       [3:0]    DataController_output_payload_state_indexes_1;
  wire       [3:0]    DataController_output_payload_state_indexes_2;
  wire       [254:0]  DataController_output_payload_state_elements_0;
  wire       [254:0]  DataController_output_payload_state_elements_1;
  wire       [254:0]  DataController_output_payload_state_elements_2;
  reg        `ReceiverState_binary_sequential_type DataController_receiverState;
  wire                when_AXI4StreamInterface_l52;
  wire                when_AXI4StreamInterface_l63;
  wire                when_AXI4StreamInterface_l79;
  wire                DataController_output_fire;
  wire                when_AXI4StreamInterface_l99;
  wire                when_AXI4StreamInterface_l114;
  wire                DataController_output_fire_1;
  wire                when_AXI4StreamInterface_l131;
  wire                DataBuffer_continue;
  wire                DataController_output_buffer0_valid;
  wire                DataController_output_buffer0_ready;
  wire       [6:0]    DataController_output_buffer0_payload_round_index;
  wire       [3:0]    DataController_output_buffer0_payload_state_size;
  wire       [4:0]    DataController_output_buffer0_payload_state_id;
  wire       [3:0]    DataController_output_buffer0_payload_state_indexes_0;
  wire       [3:0]    DataController_output_buffer0_payload_state_indexes_1;
  wire       [3:0]    DataController_output_buffer0_payload_state_indexes_2;
  wire       [254:0]  DataController_output_buffer0_payload_state_elements_0;
  wire       [254:0]  DataController_output_buffer0_payload_state_elements_1;
  wire       [254:0]  DataController_output_buffer0_payload_state_elements_2;
  reg                 DataController_output_rValid;
  reg        [6:0]    DataController_output_rData_round_index;
  reg        [3:0]    DataController_output_rData_state_size;
  reg        [4:0]    DataController_output_rData_state_id;
  reg        [3:0]    DataController_output_rData_state_indexes_0;
  reg        [3:0]    DataController_output_rData_state_indexes_1;
  reg        [3:0]    DataController_output_rData_state_indexes_2;
  reg        [254:0]  DataController_output_rData_state_elements_0;
  reg        [254:0]  DataController_output_rData_state_elements_1;
  reg        [254:0]  DataController_output_rData_state_elements_2;
  wire                when_Stream_l342;
  wire                DataBuffer_buffer0_buffer1_valid;
  reg                 DataBuffer_buffer0_buffer1_ready;
  wire       [6:0]    DataBuffer_buffer0_buffer1_payload_round_index;
  reg        [3:0]    DataBuffer_buffer0_buffer1_payload_state_size;
  wire       [4:0]    DataBuffer_buffer0_buffer1_payload_state_id;
  wire       [3:0]    DataBuffer_buffer0_buffer1_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer0_buffer1_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer0_buffer1_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer0_buffer1_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer0_buffer1_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer0_buffer1_payload_state_elements_2;
  wire                _zz_DataController_output_buffer0_ready;
  wire                when_AXI4StreamInterface_l155;
  wire                when_AXI4StreamInterface_l156;
  wire                DataBuffer_buffer0_buffer1_buffer1_valid;
  wire                DataBuffer_buffer0_buffer1_buffer1_ready;
  wire       [6:0]    DataBuffer_buffer0_buffer1_buffer1_payload_round_index;
  wire       [3:0]    DataBuffer_buffer0_buffer1_buffer1_payload_state_size;
  wire       [4:0]    DataBuffer_buffer0_buffer1_buffer1_payload_state_id;
  wire       [3:0]    DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_2;
  reg                 DataBuffer_buffer0_buffer1_rValid;
  reg        [6:0]    DataBuffer_buffer0_buffer1_rData_round_index;
  reg        [3:0]    DataBuffer_buffer0_buffer1_rData_state_size;
  reg        [4:0]    DataBuffer_buffer0_buffer1_rData_state_id;
  reg        [3:0]    DataBuffer_buffer0_buffer1_rData_state_indexes_0;
  reg        [3:0]    DataBuffer_buffer0_buffer1_rData_state_indexes_1;
  reg        [3:0]    DataBuffer_buffer0_buffer1_rData_state_indexes_2;
  reg        [254:0]  DataBuffer_buffer0_buffer1_rData_state_elements_0;
  reg        [254:0]  DataBuffer_buffer0_buffer1_rData_state_elements_1;
  reg        [254:0]  DataBuffer_buffer0_buffer1_rData_state_elements_2;
  wire                when_Stream_l342_1;
  wire                DataBuffer_buffer1_buffer2_valid;
  reg                 DataBuffer_buffer1_buffer2_ready;
  wire       [6:0]    DataBuffer_buffer1_buffer2_payload_round_index;
  reg        [3:0]    DataBuffer_buffer1_buffer2_payload_state_size;
  wire       [4:0]    DataBuffer_buffer1_buffer2_payload_state_id;
  wire       [3:0]    DataBuffer_buffer1_buffer2_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer1_buffer2_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer1_buffer2_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer1_buffer2_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer1_buffer2_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer1_buffer2_payload_state_elements_2;
  wire                _zz_DataBuffer_buffer0_buffer1_buffer1_ready;
  wire                when_AXI4StreamInterface_l167;
  wire                when_AXI4StreamInterface_l168;
  wire                DataBuffer_buffer1_buffer2_buffer2_valid;
  wire                DataBuffer_buffer1_buffer2_buffer2_ready;
  wire       [6:0]    DataBuffer_buffer1_buffer2_buffer2_payload_round_index;
  wire       [3:0]    DataBuffer_buffer1_buffer2_buffer2_payload_state_size;
  wire       [4:0]    DataBuffer_buffer1_buffer2_buffer2_payload_state_id;
  wire       [3:0]    DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_2;
  reg                 DataBuffer_buffer1_buffer2_rValid;
  reg        [6:0]    DataBuffer_buffer1_buffer2_rData_round_index;
  reg        [3:0]    DataBuffer_buffer1_buffer2_rData_state_size;
  reg        [4:0]    DataBuffer_buffer1_buffer2_rData_state_id;
  reg        [3:0]    DataBuffer_buffer1_buffer2_rData_state_indexes_0;
  reg        [3:0]    DataBuffer_buffer1_buffer2_rData_state_indexes_1;
  reg        [3:0]    DataBuffer_buffer1_buffer2_rData_state_indexes_2;
  reg        [254:0]  DataBuffer_buffer1_buffer2_rData_state_elements_0;
  reg        [254:0]  DataBuffer_buffer1_buffer2_rData_state_elements_1;
  reg        [254:0]  DataBuffer_buffer1_buffer2_rData_state_elements_2;
  wire                when_Stream_l342_2;
  wire                DataBuffer_buffer2_buffer3_valid;
  reg                 DataBuffer_buffer2_buffer3_ready;
  wire       [6:0]    DataBuffer_buffer2_buffer3_payload_round_index;
  reg        [3:0]    DataBuffer_buffer2_buffer3_payload_state_size;
  wire       [4:0]    DataBuffer_buffer2_buffer3_payload_state_id;
  wire       [3:0]    DataBuffer_buffer2_buffer3_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer2_buffer3_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer2_buffer3_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer2_buffer3_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer2_buffer3_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer2_buffer3_payload_state_elements_2;
  wire                _zz_DataBuffer_buffer1_buffer2_buffer2_ready;
  wire                when_AXI4StreamInterface_l179;
  wire                when_AXI4StreamInterface_l180;
  wire                DataBuffer_buffer2_buffer3_buffer3_valid;
  wire                DataBuffer_buffer2_buffer3_buffer3_ready;
  wire       [6:0]    DataBuffer_buffer2_buffer3_buffer3_payload_round_index;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_payload_state_size;
  wire       [4:0]    DataBuffer_buffer2_buffer3_buffer3_payload_state_id;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_0;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_1;
  wire       [3:0]    DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_2;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_0;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_1;
  wire       [254:0]  DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_2;
  reg                 DataBuffer_buffer2_buffer3_rValid;
  reg        [6:0]    DataBuffer_buffer2_buffer3_rData_round_index;
  reg        [3:0]    DataBuffer_buffer2_buffer3_rData_state_size;
  reg        [4:0]    DataBuffer_buffer2_buffer3_rData_state_id;
  reg        [3:0]    DataBuffer_buffer2_buffer3_rData_state_indexes_0;
  reg        [3:0]    DataBuffer_buffer2_buffer3_rData_state_indexes_1;
  reg        [3:0]    DataBuffer_buffer2_buffer3_rData_state_indexes_2;
  reg        [254:0]  DataBuffer_buffer2_buffer3_rData_state_elements_0;
  reg        [254:0]  DataBuffer_buffer2_buffer3_rData_state_elements_1;
  reg        [254:0]  DataBuffer_buffer2_buffer3_rData_state_elements_2;
  wire                when_Stream_l342_3;
  `ifndef SYNTHESIS
  reg [79:0] DataController_receiverState_string;
  `endif


  StreamFork DataBuffer_buffer2_buffer3_buffer3_fork (
    .io_input_valid                           (DataBuffer_buffer2_buffer3_buffer3_valid                                       ), //i
    .io_input_ready                           (DataBuffer_buffer2_buffer3_buffer3_fork_io_input_ready                         ), //o
    .io_input_payload_round_index             (DataBuffer_buffer2_buffer3_buffer3_payload_round_index                         ), //i
    .io_input_payload_state_size              (DataBuffer_buffer2_buffer3_buffer3_payload_state_size                          ), //i
    .io_input_payload_state_id                (DataBuffer_buffer2_buffer3_buffer3_payload_state_id                            ), //i
    .io_input_payload_state_indexes_0         (DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_0                     ), //i
    .io_input_payload_state_indexes_1         (DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_1                     ), //i
    .io_input_payload_state_indexes_2         (DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_2                     ), //i
    .io_input_payload_state_elements_0        (DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_0                    ), //i
    .io_input_payload_state_elements_1        (DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_1                    ), //i
    .io_input_payload_state_elements_2        (DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_2                    ), //i
    .io_outputs_0_valid                       (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_valid                     ), //o
    .io_outputs_0_ready                       (io_outputs_0_ready                                                             ), //i
    .io_outputs_0_payload_round_index         (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_round_index       ), //o
    .io_outputs_0_payload_state_size          (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_size        ), //o
    .io_outputs_0_payload_state_id            (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_id          ), //o
    .io_outputs_0_payload_state_indexes_0     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_0   ), //o
    .io_outputs_0_payload_state_indexes_1     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_1   ), //o
    .io_outputs_0_payload_state_indexes_2     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_2   ), //o
    .io_outputs_0_payload_state_elements_0    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_0  ), //o
    .io_outputs_0_payload_state_elements_1    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_1  ), //o
    .io_outputs_0_payload_state_elements_2    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_2  ), //o
    .io_outputs_1_valid                       (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_valid                     ), //o
    .io_outputs_1_ready                       (io_outputs_1_ready                                                             ), //i
    .io_outputs_1_payload_round_index         (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_round_index       ), //o
    .io_outputs_1_payload_state_size          (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_size        ), //o
    .io_outputs_1_payload_state_id            (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_id          ), //o
    .io_outputs_1_payload_state_indexes_0     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_0   ), //o
    .io_outputs_1_payload_state_indexes_1     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_1   ), //o
    .io_outputs_1_payload_state_indexes_2     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_2   ), //o
    .io_outputs_1_payload_state_elements_0    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_0  ), //o
    .io_outputs_1_payload_state_elements_1    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_1  ), //o
    .io_outputs_1_payload_state_elements_2    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_2  ), //o
    .io_outputs_2_valid                       (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_valid                     ), //o
    .io_outputs_2_ready                       (io_outputs_2_ready                                                             ), //i
    .io_outputs_2_payload_round_index         (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_round_index       ), //o
    .io_outputs_2_payload_state_size          (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_size        ), //o
    .io_outputs_2_payload_state_id            (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_id          ), //o
    .io_outputs_2_payload_state_indexes_0     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_0   ), //o
    .io_outputs_2_payload_state_indexes_1     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_1   ), //o
    .io_outputs_2_payload_state_indexes_2     (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_2   ), //o
    .io_outputs_2_payload_state_elements_0    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_0  ), //o
    .io_outputs_2_payload_state_elements_1    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_1  ), //o
    .io_outputs_2_payload_state_elements_2    (DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_2  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(DataController_receiverState)
      `ReceiverState_binary_sequential_IDLE : DataController_receiverState_string = "IDLE      ";
      `ReceiverState_binary_sequential_ELEMENT0 : DataController_receiverState_string = "ELEMENT0  ";
      `ReceiverState_binary_sequential_ELEMENT1 : DataController_receiverState_string = "ELEMENT1  ";
      `ReceiverState_binary_sequential_BLOCK_1 : DataController_receiverState_string = "BLOCK_1   ";
      `ReceiverState_binary_sequential_BLOCK_IDLE : DataController_receiverState_string = "BLOCK_IDLE";
      `ReceiverState_binary_sequential_DONE : DataController_receiverState_string = "DONE      ";
      default : DataController_receiverState_string = "??????????";
    endcase
  end
  `endif

  assign DataController_output_payload_round_index = 7'h0;
  assign DataController_output_payload_state_size = DataController_lengthCounter;
  assign DataController_output_payload_state_id = DataController_idCounter;
  assign DataController_output_payload_state_indexes_0 = DataController_state_indexes_0;
  assign DataController_output_payload_state_indexes_1 = DataController_state_indexes_1;
  assign DataController_output_payload_state_indexes_2 = DataController_state_indexes_2;
  assign DataController_output_payload_state_elements_0 = DataController_state_elements_0;
  assign DataController_output_payload_state_elements_1 = DataController_state_elements_1;
  assign DataController_output_payload_state_elements_2 = DataController_state_elements_2;
  always @(*) begin
    DataController_output_valid = 1'b0;
    case(DataController_receiverState)
      `ReceiverState_binary_sequential_IDLE : begin
      end
      `ReceiverState_binary_sequential_ELEMENT0 : begin
      end
      `ReceiverState_binary_sequential_ELEMENT1 : begin
      end
      `ReceiverState_binary_sequential_BLOCK_1 : begin
        DataController_output_valid = 1'b1;
      end
      `ReceiverState_binary_sequential_BLOCK_IDLE : begin
      end
      default : begin
        DataController_output_valid = 1'b1;
      end
    endcase
  end

  always @(*) begin
    io_input_ready = 1'b0;
    case(DataController_receiverState)
      `ReceiverState_binary_sequential_IDLE : begin
        io_input_ready = 1'b1;
      end
      `ReceiverState_binary_sequential_ELEMENT0 : begin
        io_input_ready = 1'b1;
      end
      `ReceiverState_binary_sequential_ELEMENT1 : begin
        io_input_ready = 1'b1;
      end
      `ReceiverState_binary_sequential_BLOCK_1 : begin
        if(DataController_output_fire) begin
          io_input_ready = 1'b1;
        end
      end
      `ReceiverState_binary_sequential_BLOCK_IDLE : begin
        io_input_ready = 1'b1;
      end
      default : begin
        if(DataController_output_fire_1) begin
          io_input_ready = 1'b1;
        end
      end
    endcase
  end

  assign when_AXI4StreamInterface_l52 = (io_input_valid && io_input_ready);
  assign when_AXI4StreamInterface_l63 = (io_input_valid && io_input_ready);
  assign when_AXI4StreamInterface_l79 = (io_input_valid && io_input_ready);
  assign DataController_output_fire = (DataController_output_valid && DataController_output_ready);
  assign when_AXI4StreamInterface_l99 = (io_input_valid && io_input_ready);
  assign when_AXI4StreamInterface_l114 = (io_input_valid && io_input_ready);
  assign DataController_output_fire_1 = (DataController_output_valid && DataController_output_ready);
  assign when_AXI4StreamInterface_l131 = (io_input_valid && io_input_ready);
  assign DataBuffer_continue = (((DataController_receiverState == `ReceiverState_binary_sequential_DONE) || (DataController_receiverState == `ReceiverState_binary_sequential_BLOCK_1)) || (DataController_receiverState == `ReceiverState_binary_sequential_IDLE));
  always @(*) begin
    DataController_output_ready = DataController_output_buffer0_ready;
    if(when_Stream_l342) begin
      DataController_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! DataController_output_buffer0_valid);
  assign DataController_output_buffer0_valid = DataController_output_rValid;
  assign DataController_output_buffer0_payload_round_index = DataController_output_rData_round_index;
  assign DataController_output_buffer0_payload_state_size = DataController_output_rData_state_size;
  assign DataController_output_buffer0_payload_state_id = DataController_output_rData_state_id;
  assign DataController_output_buffer0_payload_state_indexes_0 = DataController_output_rData_state_indexes_0;
  assign DataController_output_buffer0_payload_state_indexes_1 = DataController_output_rData_state_indexes_1;
  assign DataController_output_buffer0_payload_state_indexes_2 = DataController_output_rData_state_indexes_2;
  assign DataController_output_buffer0_payload_state_elements_0 = DataController_output_rData_state_elements_0;
  assign DataController_output_buffer0_payload_state_elements_1 = DataController_output_rData_state_elements_1;
  assign DataController_output_buffer0_payload_state_elements_2 = DataController_output_rData_state_elements_2;
  assign _zz_DataController_output_buffer0_ready = (DataBuffer_continue || (DataController_output_buffer0_payload_state_id != DataController_idCounter));
  assign DataController_output_buffer0_ready = (DataBuffer_buffer0_buffer1_ready && _zz_DataController_output_buffer0_ready);
  assign DataBuffer_buffer0_buffer1_valid = (DataController_output_buffer0_valid && _zz_DataController_output_buffer0_ready);
  assign DataBuffer_buffer0_buffer1_payload_round_index = DataController_output_buffer0_payload_round_index;
  always @(*) begin
    DataBuffer_buffer0_buffer1_payload_state_size = DataController_output_buffer0_payload_state_size;
    DataBuffer_buffer0_buffer1_payload_state_size = DataController_output_buffer0_payload_state_size;
    if(when_AXI4StreamInterface_l155) begin
      if(when_AXI4StreamInterface_l156) begin
        DataBuffer_buffer0_buffer1_payload_state_size = DataController_lengthCounter;
      end
    end
  end

  assign DataBuffer_buffer0_buffer1_payload_state_id = DataController_output_buffer0_payload_state_id;
  assign DataBuffer_buffer0_buffer1_payload_state_indexes_0 = DataController_output_buffer0_payload_state_indexes_0;
  assign DataBuffer_buffer0_buffer1_payload_state_indexes_1 = DataController_output_buffer0_payload_state_indexes_1;
  assign DataBuffer_buffer0_buffer1_payload_state_indexes_2 = DataController_output_buffer0_payload_state_indexes_2;
  assign DataBuffer_buffer0_buffer1_payload_state_elements_0 = DataController_output_buffer0_payload_state_elements_0;
  assign DataBuffer_buffer0_buffer1_payload_state_elements_1 = DataController_output_buffer0_payload_state_elements_1;
  assign DataBuffer_buffer0_buffer1_payload_state_elements_2 = DataController_output_buffer0_payload_state_elements_2;
  assign when_AXI4StreamInterface_l155 = (DataController_receiverState == `ReceiverState_binary_sequential_DONE);
  assign when_AXI4StreamInterface_l156 = (4'b0011 < DataController_lengthCounter);
  always @(*) begin
    DataBuffer_buffer0_buffer1_ready = DataBuffer_buffer0_buffer1_buffer1_ready;
    if(when_Stream_l342_1) begin
      DataBuffer_buffer0_buffer1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! DataBuffer_buffer0_buffer1_buffer1_valid);
  assign DataBuffer_buffer0_buffer1_buffer1_valid = DataBuffer_buffer0_buffer1_rValid;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_round_index = DataBuffer_buffer0_buffer1_rData_round_index;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_size = DataBuffer_buffer0_buffer1_rData_state_size;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_id = DataBuffer_buffer0_buffer1_rData_state_id;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_0 = DataBuffer_buffer0_buffer1_rData_state_indexes_0;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_1 = DataBuffer_buffer0_buffer1_rData_state_indexes_1;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_2 = DataBuffer_buffer0_buffer1_rData_state_indexes_2;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_0 = DataBuffer_buffer0_buffer1_rData_state_elements_0;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_1 = DataBuffer_buffer0_buffer1_rData_state_elements_1;
  assign DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_2 = DataBuffer_buffer0_buffer1_rData_state_elements_2;
  assign _zz_DataBuffer_buffer0_buffer1_buffer1_ready = (DataBuffer_continue || (DataBuffer_buffer0_buffer1_buffer1_payload_state_id != DataController_idCounter));
  assign DataBuffer_buffer0_buffer1_buffer1_ready = (DataBuffer_buffer1_buffer2_ready && _zz_DataBuffer_buffer0_buffer1_buffer1_ready);
  assign DataBuffer_buffer1_buffer2_valid = (DataBuffer_buffer0_buffer1_buffer1_valid && _zz_DataBuffer_buffer0_buffer1_buffer1_ready);
  assign DataBuffer_buffer1_buffer2_payload_round_index = DataBuffer_buffer0_buffer1_buffer1_payload_round_index;
  always @(*) begin
    DataBuffer_buffer1_buffer2_payload_state_size = DataBuffer_buffer0_buffer1_buffer1_payload_state_size;
    DataBuffer_buffer1_buffer2_payload_state_size = DataBuffer_buffer0_buffer1_buffer1_payload_state_size;
    if(when_AXI4StreamInterface_l167) begin
      if(when_AXI4StreamInterface_l168) begin
        DataBuffer_buffer1_buffer2_payload_state_size = DataController_lengthCounter;
      end
    end
  end

  assign DataBuffer_buffer1_buffer2_payload_state_id = DataBuffer_buffer0_buffer1_buffer1_payload_state_id;
  assign DataBuffer_buffer1_buffer2_payload_state_indexes_0 = DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_0;
  assign DataBuffer_buffer1_buffer2_payload_state_indexes_1 = DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_1;
  assign DataBuffer_buffer1_buffer2_payload_state_indexes_2 = DataBuffer_buffer0_buffer1_buffer1_payload_state_indexes_2;
  assign DataBuffer_buffer1_buffer2_payload_state_elements_0 = DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_0;
  assign DataBuffer_buffer1_buffer2_payload_state_elements_1 = DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_1;
  assign DataBuffer_buffer1_buffer2_payload_state_elements_2 = DataBuffer_buffer0_buffer1_buffer1_payload_state_elements_2;
  assign when_AXI4StreamInterface_l167 = (DataController_receiverState == `ReceiverState_binary_sequential_DONE);
  assign when_AXI4StreamInterface_l168 = (4'b0110 < DataController_lengthCounter);
  always @(*) begin
    DataBuffer_buffer1_buffer2_ready = DataBuffer_buffer1_buffer2_buffer2_ready;
    if(when_Stream_l342_2) begin
      DataBuffer_buffer1_buffer2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! DataBuffer_buffer1_buffer2_buffer2_valid);
  assign DataBuffer_buffer1_buffer2_buffer2_valid = DataBuffer_buffer1_buffer2_rValid;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_round_index = DataBuffer_buffer1_buffer2_rData_round_index;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_size = DataBuffer_buffer1_buffer2_rData_state_size;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_id = DataBuffer_buffer1_buffer2_rData_state_id;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_0 = DataBuffer_buffer1_buffer2_rData_state_indexes_0;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_1 = DataBuffer_buffer1_buffer2_rData_state_indexes_1;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_2 = DataBuffer_buffer1_buffer2_rData_state_indexes_2;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_0 = DataBuffer_buffer1_buffer2_rData_state_elements_0;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_1 = DataBuffer_buffer1_buffer2_rData_state_elements_1;
  assign DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_2 = DataBuffer_buffer1_buffer2_rData_state_elements_2;
  assign _zz_DataBuffer_buffer1_buffer2_buffer2_ready = (DataBuffer_continue || (DataBuffer_buffer1_buffer2_buffer2_payload_state_id != DataController_idCounter));
  assign DataBuffer_buffer1_buffer2_buffer2_ready = (DataBuffer_buffer2_buffer3_ready && _zz_DataBuffer_buffer1_buffer2_buffer2_ready);
  assign DataBuffer_buffer2_buffer3_valid = (DataBuffer_buffer1_buffer2_buffer2_valid && _zz_DataBuffer_buffer1_buffer2_buffer2_ready);
  assign DataBuffer_buffer2_buffer3_payload_round_index = DataBuffer_buffer1_buffer2_buffer2_payload_round_index;
  always @(*) begin
    DataBuffer_buffer2_buffer3_payload_state_size = DataBuffer_buffer1_buffer2_buffer2_payload_state_size;
    DataBuffer_buffer2_buffer3_payload_state_size = DataBuffer_buffer1_buffer2_buffer2_payload_state_size;
    if(when_AXI4StreamInterface_l179) begin
      if(when_AXI4StreamInterface_l180) begin
        DataBuffer_buffer2_buffer3_payload_state_size = DataController_lengthCounter;
      end
    end
  end

  assign DataBuffer_buffer2_buffer3_payload_state_id = DataBuffer_buffer1_buffer2_buffer2_payload_state_id;
  assign DataBuffer_buffer2_buffer3_payload_state_indexes_0 = DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_0;
  assign DataBuffer_buffer2_buffer3_payload_state_indexes_1 = DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_1;
  assign DataBuffer_buffer2_buffer3_payload_state_indexes_2 = DataBuffer_buffer1_buffer2_buffer2_payload_state_indexes_2;
  assign DataBuffer_buffer2_buffer3_payload_state_elements_0 = DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_0;
  assign DataBuffer_buffer2_buffer3_payload_state_elements_1 = DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_1;
  assign DataBuffer_buffer2_buffer3_payload_state_elements_2 = DataBuffer_buffer1_buffer2_buffer2_payload_state_elements_2;
  assign when_AXI4StreamInterface_l179 = (DataController_receiverState == `ReceiverState_binary_sequential_DONE);
  assign when_AXI4StreamInterface_l180 = (4'b1001 < DataController_lengthCounter);
  always @(*) begin
    DataBuffer_buffer2_buffer3_ready = DataBuffer_buffer2_buffer3_buffer3_ready;
    if(when_Stream_l342_3) begin
      DataBuffer_buffer2_buffer3_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! DataBuffer_buffer2_buffer3_buffer3_valid);
  assign DataBuffer_buffer2_buffer3_buffer3_valid = DataBuffer_buffer2_buffer3_rValid;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_round_index = DataBuffer_buffer2_buffer3_rData_round_index;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_size = DataBuffer_buffer2_buffer3_rData_state_size;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_id = DataBuffer_buffer2_buffer3_rData_state_id;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_0 = DataBuffer_buffer2_buffer3_rData_state_indexes_0;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_1 = DataBuffer_buffer2_buffer3_rData_state_indexes_1;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_indexes_2 = DataBuffer_buffer2_buffer3_rData_state_indexes_2;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_0 = DataBuffer_buffer2_buffer3_rData_state_elements_0;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_1 = DataBuffer_buffer2_buffer3_rData_state_elements_1;
  assign DataBuffer_buffer2_buffer3_buffer3_payload_state_elements_2 = DataBuffer_buffer2_buffer3_rData_state_elements_2;
  assign DataBuffer_buffer2_buffer3_buffer3_ready = DataBuffer_buffer2_buffer3_buffer3_fork_io_input_ready;
  assign io_outputs_0_valid = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_valid;
  assign io_outputs_0_payload_round_index = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_round_index;
  assign io_outputs_0_payload_state_size = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_size;
  assign io_outputs_0_payload_state_id = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_id;
  assign io_outputs_0_payload_state_index = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_indexes_0;
  assign io_outputs_0_payload_state_element = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_0_payload_state_elements_0;
  assign io_outputs_1_valid = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_valid;
  assign io_outputs_1_payload_round_index = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_round_index;
  assign io_outputs_1_payload_state_size = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_size;
  assign io_outputs_1_payload_state_id = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_id;
  assign io_outputs_1_payload_state_index = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_indexes_1;
  assign io_outputs_1_payload_state_element = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_1_payload_state_elements_1;
  assign io_outputs_2_valid = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_valid;
  assign io_outputs_2_payload_round_index = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_round_index;
  assign io_outputs_2_payload_state_size = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_size;
  assign io_outputs_2_payload_state_id = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_id;
  assign io_outputs_2_payload_state_index = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_indexes_2;
  assign io_outputs_2_payload_state_element = DataBuffer_buffer2_buffer3_buffer3_fork_io_outputs_2_payload_state_elements_2;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      DataController_idCounter <= 5'h0;
      DataController_lengthCounter <= 4'b0000;
      DataController_state_elements_0 <= 255'h0;
      DataController_state_elements_1 <= 255'h0;
      DataController_state_elements_2 <= 255'h0;
      DataController_state_indexes_0 <= 4'b0000;
      DataController_state_indexes_1 <= 4'b0000;
      DataController_state_indexes_2 <= 4'b0000;
      DataController_receiverState <= `ReceiverState_binary_sequential_IDLE;
      DataController_output_rValid <= 1'b0;
      DataBuffer_buffer0_buffer1_rValid <= 1'b0;
      DataBuffer_buffer1_buffer2_rValid <= 1'b0;
      DataBuffer_buffer2_buffer3_rValid <= 1'b0;
    end else begin
      case(DataController_receiverState)
        `ReceiverState_binary_sequential_IDLE : begin
          if(when_AXI4StreamInterface_l52) begin
            DataController_state_indexes_0 <= DataController_lengthCounter;
            DataController_state_elements_0 <= io_input_payload;
            DataController_lengthCounter <= (DataController_lengthCounter + 4'b0001);
            DataController_receiverState <= `ReceiverState_binary_sequential_ELEMENT0;
          end
        end
        `ReceiverState_binary_sequential_ELEMENT0 : begin
          if(when_AXI4StreamInterface_l63) begin
            DataController_state_indexes_1 <= DataController_lengthCounter;
            DataController_state_elements_1 <= io_input_payload;
            DataController_lengthCounter <= (DataController_lengthCounter + 4'b0001);
            if(io_input_last) begin
              DataController_state_indexes_2 <= (DataController_lengthCounter + 4'b0001);
              DataController_receiverState <= `ReceiverState_binary_sequential_DONE;
            end else begin
              DataController_receiverState <= `ReceiverState_binary_sequential_ELEMENT1;
            end
          end
        end
        `ReceiverState_binary_sequential_ELEMENT1 : begin
          if(when_AXI4StreamInterface_l79) begin
            DataController_state_indexes_2 <= DataController_lengthCounter;
            DataController_state_elements_2 <= io_input_payload;
            DataController_lengthCounter <= (DataController_lengthCounter + 4'b0001);
            if(io_input_last) begin
              DataController_receiverState <= `ReceiverState_binary_sequential_DONE;
            end else begin
              DataController_receiverState <= `ReceiverState_binary_sequential_BLOCK_1;
            end
          end
        end
        `ReceiverState_binary_sequential_BLOCK_1 : begin
          if(DataController_output_fire) begin
            DataController_state_indexes_0 <= 4'b0000;
            DataController_state_indexes_1 <= 4'b0000;
            DataController_state_indexes_2 <= 4'b0000;
            DataController_state_elements_0 <= 255'h0;
            DataController_state_elements_1 <= 255'h0;
            DataController_state_elements_2 <= 255'h0;
            if(when_AXI4StreamInterface_l99) begin
              DataController_state_indexes_0 <= DataController_lengthCounter;
              DataController_state_elements_0 <= io_input_payload;
              DataController_lengthCounter <= (DataController_lengthCounter + 4'b0001);
              DataController_receiverState <= `ReceiverState_binary_sequential_ELEMENT0;
            end else begin
              DataController_receiverState <= `ReceiverState_binary_sequential_BLOCK_IDLE;
            end
          end
        end
        `ReceiverState_binary_sequential_BLOCK_IDLE : begin
          if(when_AXI4StreamInterface_l114) begin
            DataController_state_indexes_0 <= DataController_lengthCounter;
            DataController_state_elements_0 <= io_input_payload;
            DataController_lengthCounter <= (DataController_lengthCounter + 4'b0001);
            DataController_receiverState <= `ReceiverState_binary_sequential_ELEMENT0;
          end
        end
        default : begin
          if(DataController_output_fire_1) begin
            DataController_lengthCounter <= 4'b0000;
            DataController_idCounter <= (DataController_idCounter + 5'h01);
            DataController_state_indexes_0 <= 4'b0000;
            DataController_state_indexes_1 <= 4'b0000;
            DataController_state_indexes_2 <= 4'b0000;
            DataController_state_elements_0 <= 255'h0;
            DataController_state_elements_1 <= 255'h0;
            DataController_state_elements_2 <= 255'h0;
            if(when_AXI4StreamInterface_l131) begin
              DataController_state_elements_0 <= io_input_payload;
              DataController_lengthCounter <= 4'b0001;
              DataController_receiverState <= `ReceiverState_binary_sequential_ELEMENT0;
            end else begin
              DataController_receiverState <= `ReceiverState_binary_sequential_IDLE;
            end
          end
        end
      endcase
      if(DataController_output_ready) begin
        DataController_output_rValid <= DataController_output_valid;
      end
      if(DataBuffer_buffer0_buffer1_ready) begin
        DataBuffer_buffer0_buffer1_rValid <= DataBuffer_buffer0_buffer1_valid;
      end
      if(DataBuffer_buffer1_buffer2_ready) begin
        DataBuffer_buffer1_buffer2_rValid <= DataBuffer_buffer1_buffer2_valid;
      end
      if(DataBuffer_buffer2_buffer3_ready) begin
        DataBuffer_buffer2_buffer3_rValid <= DataBuffer_buffer2_buffer3_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(DataController_output_ready) begin
      DataController_output_rData_round_index <= DataController_output_payload_round_index;
      DataController_output_rData_state_size <= DataController_output_payload_state_size;
      DataController_output_rData_state_id <= DataController_output_payload_state_id;
      DataController_output_rData_state_indexes_0 <= DataController_output_payload_state_indexes_0;
      DataController_output_rData_state_indexes_1 <= DataController_output_payload_state_indexes_1;
      DataController_output_rData_state_indexes_2 <= DataController_output_payload_state_indexes_2;
      DataController_output_rData_state_elements_0 <= DataController_output_payload_state_elements_0;
      DataController_output_rData_state_elements_1 <= DataController_output_payload_state_elements_1;
      DataController_output_rData_state_elements_2 <= DataController_output_payload_state_elements_2;
    end
    if(DataBuffer_buffer0_buffer1_ready) begin
      DataBuffer_buffer0_buffer1_rData_round_index <= DataBuffer_buffer0_buffer1_payload_round_index;
      DataBuffer_buffer0_buffer1_rData_state_size <= DataBuffer_buffer0_buffer1_payload_state_size;
      DataBuffer_buffer0_buffer1_rData_state_id <= DataBuffer_buffer0_buffer1_payload_state_id;
      DataBuffer_buffer0_buffer1_rData_state_indexes_0 <= DataBuffer_buffer0_buffer1_payload_state_indexes_0;
      DataBuffer_buffer0_buffer1_rData_state_indexes_1 <= DataBuffer_buffer0_buffer1_payload_state_indexes_1;
      DataBuffer_buffer0_buffer1_rData_state_indexes_2 <= DataBuffer_buffer0_buffer1_payload_state_indexes_2;
      DataBuffer_buffer0_buffer1_rData_state_elements_0 <= DataBuffer_buffer0_buffer1_payload_state_elements_0;
      DataBuffer_buffer0_buffer1_rData_state_elements_1 <= DataBuffer_buffer0_buffer1_payload_state_elements_1;
      DataBuffer_buffer0_buffer1_rData_state_elements_2 <= DataBuffer_buffer0_buffer1_payload_state_elements_2;
    end
    if(DataBuffer_buffer1_buffer2_ready) begin
      DataBuffer_buffer1_buffer2_rData_round_index <= DataBuffer_buffer1_buffer2_payload_round_index;
      DataBuffer_buffer1_buffer2_rData_state_size <= DataBuffer_buffer1_buffer2_payload_state_size;
      DataBuffer_buffer1_buffer2_rData_state_id <= DataBuffer_buffer1_buffer2_payload_state_id;
      DataBuffer_buffer1_buffer2_rData_state_indexes_0 <= DataBuffer_buffer1_buffer2_payload_state_indexes_0;
      DataBuffer_buffer1_buffer2_rData_state_indexes_1 <= DataBuffer_buffer1_buffer2_payload_state_indexes_1;
      DataBuffer_buffer1_buffer2_rData_state_indexes_2 <= DataBuffer_buffer1_buffer2_payload_state_indexes_2;
      DataBuffer_buffer1_buffer2_rData_state_elements_0 <= DataBuffer_buffer1_buffer2_payload_state_elements_0;
      DataBuffer_buffer1_buffer2_rData_state_elements_1 <= DataBuffer_buffer1_buffer2_payload_state_elements_1;
      DataBuffer_buffer1_buffer2_rData_state_elements_2 <= DataBuffer_buffer1_buffer2_payload_state_elements_2;
    end
    if(DataBuffer_buffer2_buffer3_ready) begin
      DataBuffer_buffer2_buffer3_rData_round_index <= DataBuffer_buffer2_buffer3_payload_round_index;
      DataBuffer_buffer2_buffer3_rData_state_size <= DataBuffer_buffer2_buffer3_payload_state_size;
      DataBuffer_buffer2_buffer3_rData_state_id <= DataBuffer_buffer2_buffer3_payload_state_id;
      DataBuffer_buffer2_buffer3_rData_state_indexes_0 <= DataBuffer_buffer2_buffer3_payload_state_indexes_0;
      DataBuffer_buffer2_buffer3_rData_state_indexes_1 <= DataBuffer_buffer2_buffer3_payload_state_indexes_1;
      DataBuffer_buffer2_buffer3_rData_state_indexes_2 <= DataBuffer_buffer2_buffer3_payload_state_indexes_2;
      DataBuffer_buffer2_buffer3_rData_state_elements_0 <= DataBuffer_buffer2_buffer3_payload_state_elements_0;
      DataBuffer_buffer2_buffer3_rData_state_elements_1 <= DataBuffer_buffer2_buffer3_payload_state_elements_1;
      DataBuffer_buffer2_buffer3_rData_state_elements_2 <= DataBuffer_buffer2_buffer3_payload_state_elements_2;
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [4:0]    io_input_payload_state_id,
  input      [3:0]    io_input_payload_state_indexes_0,
  input      [3:0]    io_input_payload_state_indexes_1,
  input      [3:0]    io_input_payload_state_indexes_2,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [4:0]    io_outputs_0_payload_state_id,
  output     [3:0]    io_outputs_0_payload_state_indexes_0,
  output     [3:0]    io_outputs_0_payload_state_indexes_1,
  output     [3:0]    io_outputs_0_payload_state_indexes_2,
  output     [254:0]  io_outputs_0_payload_state_elements_0,
  output     [254:0]  io_outputs_0_payload_state_elements_1,
  output     [254:0]  io_outputs_0_payload_state_elements_2,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [4:0]    io_outputs_1_payload_state_id,
  output     [3:0]    io_outputs_1_payload_state_indexes_0,
  output     [3:0]    io_outputs_1_payload_state_indexes_1,
  output     [3:0]    io_outputs_1_payload_state_indexes_2,
  output     [254:0]  io_outputs_1_payload_state_elements_0,
  output     [254:0]  io_outputs_1_payload_state_elements_1,
  output     [254:0]  io_outputs_1_payload_state_elements_2,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [6:0]    io_outputs_2_payload_round_index,
  output     [3:0]    io_outputs_2_payload_state_size,
  output     [4:0]    io_outputs_2_payload_state_id,
  output     [3:0]    io_outputs_2_payload_state_indexes_0,
  output     [3:0]    io_outputs_2_payload_state_indexes_1,
  output     [3:0]    io_outputs_2_payload_state_indexes_2,
  output     [254:0]  io_outputs_2_payload_state_elements_0,
  output     [254:0]  io_outputs_2_payload_state_elements_1,
  output     [254:0]  io_outputs_2_payload_state_elements_2
);

  assign io_input_ready = ((io_outputs_0_ready && io_outputs_1_ready) && io_outputs_2_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_2_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload_round_index = io_input_payload_round_index;
  assign io_outputs_0_payload_state_size = io_input_payload_state_size;
  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_indexes_0 = io_input_payload_state_indexes_0;
  assign io_outputs_0_payload_state_indexes_1 = io_input_payload_state_indexes_1;
  assign io_outputs_0_payload_state_indexes_2 = io_input_payload_state_indexes_2;
  assign io_outputs_0_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_0_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_0_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_1_payload_round_index = io_input_payload_round_index;
  assign io_outputs_1_payload_state_size = io_input_payload_state_size;
  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_indexes_0 = io_input_payload_state_indexes_0;
  assign io_outputs_1_payload_state_indexes_1 = io_input_payload_state_indexes_1;
  assign io_outputs_1_payload_state_indexes_2 = io_input_payload_state_indexes_2;
  assign io_outputs_1_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_1_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_1_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_2_payload_round_index = io_input_payload_round_index;
  assign io_outputs_2_payload_state_size = io_input_payload_state_size;
  assign io_outputs_2_payload_state_id = io_input_payload_state_id;
  assign io_outputs_2_payload_state_indexes_0 = io_input_payload_state_indexes_0;
  assign io_outputs_2_payload_state_indexes_1 = io_input_payload_state_indexes_1;
  assign io_outputs_2_payload_state_indexes_2 = io_input_payload_state_indexes_2;
  assign io_outputs_2_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_2_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_2_payload_state_elements_2 = io_input_payload_state_elements_2;

endmodule
