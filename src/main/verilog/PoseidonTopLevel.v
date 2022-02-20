// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : PoseidonTopLevel
// Git hash  : 0683ef3d0270cb6a9cf91163b062f0688c0e1e60


`define receiver_receiverFSM_enumDefinition_binary_sequential_type [1:0]
`define receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BOOT 2'b00
`define receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY 2'b01
`define receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE 2'b10

`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_BUSY 2'b10
`define fsm_enumDefinition_binary_sequential_fsm_LAST 2'b11

`define fsm_enumDefinition_1_binary_sequential_type [1:0]
`define fsm_enumDefinition_1_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_1_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_1_binary_sequential_fsm_ADDING 2'b10
`define fsm_enumDefinition_1_binary_sequential_fsm_DONE 2'b11

`define fsm_enumDefinition_2_binary_sequential_type [1:0]
`define fsm_enumDefinition_2_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_2_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_2_binary_sequential_fsm_BUSY 2'b10
`define fsm_enumDefinition_2_binary_sequential_fsm_LAST 2'b11

`define fsm_enumDefinition_3_binary_sequential_type [1:0]
`define fsm_enumDefinition_3_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_3_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_3_binary_sequential_fsm_ADDING 2'b10
`define fsm_enumDefinition_3_binary_sequential_fsm_DONE 2'b11

`define fsm_enumDefinition_4_binary_sequential_type [1:0]
`define fsm_enumDefinition_4_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_4_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_4_binary_sequential_fsm_BUSY 2'b10
`define fsm_enumDefinition_4_binary_sequential_fsm_LAST 2'b11

`define fsm_enumDefinition_5_binary_sequential_type [1:0]
`define fsm_enumDefinition_5_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_5_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_5_binary_sequential_fsm_ADDING 2'b10
`define fsm_enumDefinition_5_binary_sequential_fsm_DONE 2'b11


module PoseidonTopLevel (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_last,
  input      [254:0]  io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_last,
  output     [254:0]  io_output_payload,
  input               clk,
  input               reset
);
  wire                streamDemux_50_io_outputs_0_ready;
  wire                streamDemux_50_io_outputs_1_ready;
  wire                streamDemux_50_io_outputs_2_ready;
  wire                aXI4StreamReceiver_1_io_input_ready;
  wire                aXI4StreamReceiver_1_io_output_valid;
  wire       [6:0]    aXI4StreamReceiver_1_io_output_payload_round_index;
  wire       [3:0]    aXI4StreamReceiver_1_io_output_payload_state_size;
  wire       [6:0]    aXI4StreamReceiver_1_io_output_payload_state_id;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_0;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_1;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_2;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_3;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_4;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_5;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_6;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_7;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_8;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_9;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_10;
  wire       [254:0]  aXI4StreamReceiver_1_io_output_payload_state_elements_11;
  wire                streamDemux_50_io_input_ready;
  wire                streamDemux_50_io_outputs_0_valid;
  wire       [6:0]    streamDemux_50_io_outputs_0_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_0_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_0_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_11;
  wire                streamDemux_50_io_outputs_1_valid;
  wire       [6:0]    streamDemux_50_io_outputs_1_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_1_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_1_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_11;
  wire                streamDemux_50_io_outputs_2_valid;
  wire       [6:0]    streamDemux_50_io_outputs_2_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_2_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_2_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_elements_11;
  wire                poseidonLoop_3_io_input_ready;
  wire                poseidonLoop_3_io_output_valid;
  wire       [6:0]    poseidonLoop_3_io_output_payload_state_id;
  wire       [254:0]  poseidonLoop_3_io_output_payload_state_element;
  wire                poseidonLoop_4_io_input_ready;
  wire                poseidonLoop_4_io_output_valid;
  wire       [6:0]    poseidonLoop_4_io_output_payload_state_id;
  wire       [254:0]  poseidonLoop_4_io_output_payload_state_element;
  wire                poseidonLoop_5_io_input_ready;
  wire                poseidonLoop_5_io_output_valid;
  wire       [6:0]    poseidonLoop_5_io_output_payload_state_id;
  wire       [254:0]  poseidonLoop_5_io_output_payload_state_element;
  wire                streamArbiter_49_io_inputs_0_ready;
  wire                streamArbiter_49_io_inputs_1_ready;
  wire                streamArbiter_49_io_inputs_2_ready;
  wire                streamArbiter_49_io_output_valid;
  wire       [6:0]    streamArbiter_49_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_element;
  wire       [1:0]    streamArbiter_49_io_chosen;
  wire       [2:0]    streamArbiter_49_io_chosenOH;
  wire                aXI4StreamTransmitter_1_io_input_ready;
  wire                aXI4StreamTransmitter_1_io_output_valid;
  wire                aXI4StreamTransmitter_1_io_output_last;
  wire       [254:0]  aXI4StreamTransmitter_1_io_output_payload;
  wire       [2:0]    _zz__zz_select_1;
  wire                loopInputs_0_valid;
  reg                 loopInputs_0_ready;
  wire       [6:0]    loopInputs_0_payload_round_index;
  wire       [3:0]    loopInputs_0_payload_state_size;
  wire       [6:0]    loopInputs_0_payload_state_id;
  wire       [254:0]  loopInputs_0_payload_state_elements_0;
  wire       [254:0]  loopInputs_0_payload_state_elements_1;
  wire       [254:0]  loopInputs_0_payload_state_elements_2;
  wire       [254:0]  loopInputs_0_payload_state_elements_3;
  wire       [254:0]  loopInputs_0_payload_state_elements_4;
  wire       [254:0]  loopInputs_0_payload_state_elements_5;
  wire       [254:0]  loopInputs_0_payload_state_elements_6;
  wire       [254:0]  loopInputs_0_payload_state_elements_7;
  wire       [254:0]  loopInputs_0_payload_state_elements_8;
  wire       [254:0]  loopInputs_0_payload_state_elements_9;
  wire       [254:0]  loopInputs_0_payload_state_elements_10;
  wire       [254:0]  loopInputs_0_payload_state_elements_11;
  wire                loopInputs_1_valid;
  reg                 loopInputs_1_ready;
  wire       [6:0]    loopInputs_1_payload_round_index;
  wire       [3:0]    loopInputs_1_payload_state_size;
  wire       [6:0]    loopInputs_1_payload_state_id;
  wire       [254:0]  loopInputs_1_payload_state_elements_0;
  wire       [254:0]  loopInputs_1_payload_state_elements_1;
  wire       [254:0]  loopInputs_1_payload_state_elements_2;
  wire       [254:0]  loopInputs_1_payload_state_elements_3;
  wire       [254:0]  loopInputs_1_payload_state_elements_4;
  wire       [254:0]  loopInputs_1_payload_state_elements_5;
  wire       [254:0]  loopInputs_1_payload_state_elements_6;
  wire       [254:0]  loopInputs_1_payload_state_elements_7;
  wire       [254:0]  loopInputs_1_payload_state_elements_8;
  wire       [254:0]  loopInputs_1_payload_state_elements_9;
  wire       [254:0]  loopInputs_1_payload_state_elements_10;
  wire       [254:0]  loopInputs_1_payload_state_elements_11;
  wire                loopInputs_2_valid;
  reg                 loopInputs_2_ready;
  wire       [6:0]    loopInputs_2_payload_round_index;
  wire       [3:0]    loopInputs_2_payload_state_size;
  wire       [6:0]    loopInputs_2_payload_state_id;
  wire       [254:0]  loopInputs_2_payload_state_elements_0;
  wire       [254:0]  loopInputs_2_payload_state_elements_1;
  wire       [254:0]  loopInputs_2_payload_state_elements_2;
  wire       [254:0]  loopInputs_2_payload_state_elements_3;
  wire       [254:0]  loopInputs_2_payload_state_elements_4;
  wire       [254:0]  loopInputs_2_payload_state_elements_5;
  wire       [254:0]  loopInputs_2_payload_state_elements_6;
  wire       [254:0]  loopInputs_2_payload_state_elements_7;
  wire       [254:0]  loopInputs_2_payload_state_elements_8;
  wire       [254:0]  loopInputs_2_payload_state_elements_9;
  wire       [254:0]  loopInputs_2_payload_state_elements_10;
  wire       [254:0]  loopInputs_2_payload_state_elements_11;
  wire       [2:0]    _zz_select;
  wire       [2:0]    _zz_select_1;
  wire                _zz_select_2;
  wire                _zz_select_3;
  wire       [1:0]    select_1;
  wire                streamDemux_50_io_outputs_0_s2mPipe_valid;
  reg                 streamDemux_50_io_outputs_0_s2mPipe_ready;
  wire       [6:0]    streamDemux_50_io_outputs_0_s2mPipe_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_0_s2mPipe_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_0_s2mPipe_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_11;
  reg                 streamDemux_50_io_outputs_0_rValid;
  reg        [6:0]    streamDemux_50_io_outputs_0_rData_round_index;
  reg        [3:0]    streamDemux_50_io_outputs_0_rData_state_size;
  reg        [6:0]    streamDemux_50_io_outputs_0_rData_state_id;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_0;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_1;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_2;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_3;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_4;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_5;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_6;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_7;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_8;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_9;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_10;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_state_elements_11;
  wire                streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_valid;
  wire                streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_ready;
  wire       [6:0]    streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_11;
  reg                 streamDemux_50_io_outputs_0_s2mPipe_rValid;
  reg        [6:0]    streamDemux_50_io_outputs_0_s2mPipe_rData_round_index;
  reg        [3:0]    streamDemux_50_io_outputs_0_s2mPipe_rData_state_size;
  reg        [6:0]    streamDemux_50_io_outputs_0_s2mPipe_rData_state_id;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_0;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_1;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_2;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_3;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_4;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_5;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_6;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_7;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_8;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_9;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_10;
  reg        [254:0]  streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_11;
  wire                when_Stream_l342;
  wire                streamDemux_50_io_outputs_1_s2mPipe_valid;
  reg                 streamDemux_50_io_outputs_1_s2mPipe_ready;
  wire       [6:0]    streamDemux_50_io_outputs_1_s2mPipe_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_1_s2mPipe_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_1_s2mPipe_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_11;
  reg                 streamDemux_50_io_outputs_1_rValid;
  reg        [6:0]    streamDemux_50_io_outputs_1_rData_round_index;
  reg        [3:0]    streamDemux_50_io_outputs_1_rData_state_size;
  reg        [6:0]    streamDemux_50_io_outputs_1_rData_state_id;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_0;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_1;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_2;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_3;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_4;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_5;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_6;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_7;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_8;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_9;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_10;
  reg        [254:0]  streamDemux_50_io_outputs_1_rData_state_elements_11;
  wire                streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_valid;
  wire                streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_ready;
  wire       [6:0]    streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_11;
  reg                 streamDemux_50_io_outputs_1_s2mPipe_rValid;
  reg        [6:0]    streamDemux_50_io_outputs_1_s2mPipe_rData_round_index;
  reg        [3:0]    streamDemux_50_io_outputs_1_s2mPipe_rData_state_size;
  reg        [6:0]    streamDemux_50_io_outputs_1_s2mPipe_rData_state_id;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_0;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_1;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_2;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_3;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_4;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_5;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_6;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_7;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_8;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_9;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_10;
  reg        [254:0]  streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_11;
  wire                when_Stream_l342_1;
  wire                streamDemux_50_io_outputs_2_s2mPipe_valid;
  reg                 streamDemux_50_io_outputs_2_s2mPipe_ready;
  wire       [6:0]    streamDemux_50_io_outputs_2_s2mPipe_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_2_s2mPipe_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_2_s2mPipe_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_11;
  reg                 streamDemux_50_io_outputs_2_rValid;
  reg        [6:0]    streamDemux_50_io_outputs_2_rData_round_index;
  reg        [3:0]    streamDemux_50_io_outputs_2_rData_state_size;
  reg        [6:0]    streamDemux_50_io_outputs_2_rData_state_id;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_0;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_1;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_2;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_3;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_4;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_5;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_6;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_7;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_8;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_9;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_10;
  reg        [254:0]  streamDemux_50_io_outputs_2_rData_state_elements_11;
  wire                streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_valid;
  wire                streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_ready;
  wire       [6:0]    streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_11;
  reg                 streamDemux_50_io_outputs_2_s2mPipe_rValid;
  reg        [6:0]    streamDemux_50_io_outputs_2_s2mPipe_rData_round_index;
  reg        [3:0]    streamDemux_50_io_outputs_2_s2mPipe_rData_state_size;
  reg        [6:0]    streamDemux_50_io_outputs_2_s2mPipe_rData_state_id;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_0;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_1;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_2;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_3;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_4;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_5;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_6;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_7;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_8;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_9;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_10;
  reg        [254:0]  streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_11;
  wire                when_Stream_l342_2;
  wire                loopInputs_0_m2sPipe_valid;
  wire                loopInputs_0_m2sPipe_ready;
  wire       [6:0]    loopInputs_0_m2sPipe_payload_round_index;
  wire       [3:0]    loopInputs_0_m2sPipe_payload_state_size;
  wire       [6:0]    loopInputs_0_m2sPipe_payload_state_id;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_0;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_1;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_2;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_3;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_4;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_5;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_6;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_7;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_8;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_9;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_10;
  wire       [254:0]  loopInputs_0_m2sPipe_payload_state_elements_11;
  reg                 loopInputs_0_rValid;
  reg        [6:0]    loopInputs_0_rData_round_index;
  reg        [3:0]    loopInputs_0_rData_state_size;
  reg        [6:0]    loopInputs_0_rData_state_id;
  reg        [254:0]  loopInputs_0_rData_state_elements_0;
  reg        [254:0]  loopInputs_0_rData_state_elements_1;
  reg        [254:0]  loopInputs_0_rData_state_elements_2;
  reg        [254:0]  loopInputs_0_rData_state_elements_3;
  reg        [254:0]  loopInputs_0_rData_state_elements_4;
  reg        [254:0]  loopInputs_0_rData_state_elements_5;
  reg        [254:0]  loopInputs_0_rData_state_elements_6;
  reg        [254:0]  loopInputs_0_rData_state_elements_7;
  reg        [254:0]  loopInputs_0_rData_state_elements_8;
  reg        [254:0]  loopInputs_0_rData_state_elements_9;
  reg        [254:0]  loopInputs_0_rData_state_elements_10;
  reg        [254:0]  loopInputs_0_rData_state_elements_11;
  wire                when_Stream_l342_3;
  wire                loopInputs_1_m2sPipe_valid;
  wire                loopInputs_1_m2sPipe_ready;
  wire       [6:0]    loopInputs_1_m2sPipe_payload_round_index;
  wire       [3:0]    loopInputs_1_m2sPipe_payload_state_size;
  wire       [6:0]    loopInputs_1_m2sPipe_payload_state_id;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_0;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_1;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_2;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_3;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_4;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_5;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_6;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_7;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_8;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_9;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_10;
  wire       [254:0]  loopInputs_1_m2sPipe_payload_state_elements_11;
  reg                 loopInputs_1_rValid;
  reg        [6:0]    loopInputs_1_rData_round_index;
  reg        [3:0]    loopInputs_1_rData_state_size;
  reg        [6:0]    loopInputs_1_rData_state_id;
  reg        [254:0]  loopInputs_1_rData_state_elements_0;
  reg        [254:0]  loopInputs_1_rData_state_elements_1;
  reg        [254:0]  loopInputs_1_rData_state_elements_2;
  reg        [254:0]  loopInputs_1_rData_state_elements_3;
  reg        [254:0]  loopInputs_1_rData_state_elements_4;
  reg        [254:0]  loopInputs_1_rData_state_elements_5;
  reg        [254:0]  loopInputs_1_rData_state_elements_6;
  reg        [254:0]  loopInputs_1_rData_state_elements_7;
  reg        [254:0]  loopInputs_1_rData_state_elements_8;
  reg        [254:0]  loopInputs_1_rData_state_elements_9;
  reg        [254:0]  loopInputs_1_rData_state_elements_10;
  reg        [254:0]  loopInputs_1_rData_state_elements_11;
  wire                when_Stream_l342_4;
  wire                loopInputs_2_m2sPipe_valid;
  wire                loopInputs_2_m2sPipe_ready;
  wire       [6:0]    loopInputs_2_m2sPipe_payload_round_index;
  wire       [3:0]    loopInputs_2_m2sPipe_payload_state_size;
  wire       [6:0]    loopInputs_2_m2sPipe_payload_state_id;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_0;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_1;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_2;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_3;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_4;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_5;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_6;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_7;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_8;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_9;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_10;
  wire       [254:0]  loopInputs_2_m2sPipe_payload_state_elements_11;
  reg                 loopInputs_2_rValid;
  reg        [6:0]    loopInputs_2_rData_round_index;
  reg        [3:0]    loopInputs_2_rData_state_size;
  reg        [6:0]    loopInputs_2_rData_state_id;
  reg        [254:0]  loopInputs_2_rData_state_elements_0;
  reg        [254:0]  loopInputs_2_rData_state_elements_1;
  reg        [254:0]  loopInputs_2_rData_state_elements_2;
  reg        [254:0]  loopInputs_2_rData_state_elements_3;
  reg        [254:0]  loopInputs_2_rData_state_elements_4;
  reg        [254:0]  loopInputs_2_rData_state_elements_5;
  reg        [254:0]  loopInputs_2_rData_state_elements_6;
  reg        [254:0]  loopInputs_2_rData_state_elements_7;
  reg        [254:0]  loopInputs_2_rData_state_elements_8;
  reg        [254:0]  loopInputs_2_rData_state_elements_9;
  reg        [254:0]  loopInputs_2_rData_state_elements_10;
  reg        [254:0]  loopInputs_2_rData_state_elements_11;
  wire                when_Stream_l342_5;

  assign _zz__zz_select_1 = (_zz_select - 3'b001);
  AXI4StreamReceiver aXI4StreamReceiver_1 (
    .io_input_valid                         (io_input_valid                                            ), //i
    .io_input_ready                         (aXI4StreamReceiver_1_io_input_ready                       ), //o
    .io_input_last                          (io_input_last                                             ), //i
    .io_input_payload                       (io_input_payload                                          ), //i
    .io_output_valid                        (aXI4StreamReceiver_1_io_output_valid                      ), //o
    .io_output_ready                        (streamDemux_50_io_input_ready                             ), //i
    .io_output_payload_round_index          (aXI4StreamReceiver_1_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (aXI4StreamReceiver_1_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (aXI4StreamReceiver_1_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (aXI4StreamReceiver_1_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (aXI4StreamReceiver_1_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (aXI4StreamReceiver_1_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (aXI4StreamReceiver_1_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (aXI4StreamReceiver_1_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (aXI4StreamReceiver_1_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (aXI4StreamReceiver_1_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (aXI4StreamReceiver_1_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (aXI4StreamReceiver_1_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (aXI4StreamReceiver_1_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (aXI4StreamReceiver_1_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (aXI4StreamReceiver_1_io_output_payload_state_elements_11  ), //o
    .clk                                    (clk                                                       ), //i
    .reset                                  (reset                                                     )  //i
  );
  StreamDemux_49 streamDemux_50 (
    .io_select                                 (select_1                                                  ), //i
    .io_input_valid                            (aXI4StreamReceiver_1_io_output_valid                      ), //i
    .io_input_ready                            (streamDemux_50_io_input_ready                             ), //o
    .io_input_payload_round_index              (aXI4StreamReceiver_1_io_output_payload_round_index        ), //i
    .io_input_payload_state_size               (aXI4StreamReceiver_1_io_output_payload_state_size         ), //i
    .io_input_payload_state_id                 (aXI4StreamReceiver_1_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0         (aXI4StreamReceiver_1_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1         (aXI4StreamReceiver_1_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2         (aXI4StreamReceiver_1_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3         (aXI4StreamReceiver_1_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4         (aXI4StreamReceiver_1_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5         (aXI4StreamReceiver_1_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6         (aXI4StreamReceiver_1_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7         (aXI4StreamReceiver_1_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8         (aXI4StreamReceiver_1_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9         (aXI4StreamReceiver_1_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10        (aXI4StreamReceiver_1_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11        (aXI4StreamReceiver_1_io_output_payload_state_elements_11  ), //i
    .io_outputs_0_valid                        (streamDemux_50_io_outputs_0_valid                         ), //o
    .io_outputs_0_ready                        (streamDemux_50_io_outputs_0_ready                         ), //i
    .io_outputs_0_payload_round_index          (streamDemux_50_io_outputs_0_payload_round_index           ), //o
    .io_outputs_0_payload_state_size           (streamDemux_50_io_outputs_0_payload_state_size            ), //o
    .io_outputs_0_payload_state_id             (streamDemux_50_io_outputs_0_payload_state_id              ), //o
    .io_outputs_0_payload_state_elements_0     (streamDemux_50_io_outputs_0_payload_state_elements_0      ), //o
    .io_outputs_0_payload_state_elements_1     (streamDemux_50_io_outputs_0_payload_state_elements_1      ), //o
    .io_outputs_0_payload_state_elements_2     (streamDemux_50_io_outputs_0_payload_state_elements_2      ), //o
    .io_outputs_0_payload_state_elements_3     (streamDemux_50_io_outputs_0_payload_state_elements_3      ), //o
    .io_outputs_0_payload_state_elements_4     (streamDemux_50_io_outputs_0_payload_state_elements_4      ), //o
    .io_outputs_0_payload_state_elements_5     (streamDemux_50_io_outputs_0_payload_state_elements_5      ), //o
    .io_outputs_0_payload_state_elements_6     (streamDemux_50_io_outputs_0_payload_state_elements_6      ), //o
    .io_outputs_0_payload_state_elements_7     (streamDemux_50_io_outputs_0_payload_state_elements_7      ), //o
    .io_outputs_0_payload_state_elements_8     (streamDemux_50_io_outputs_0_payload_state_elements_8      ), //o
    .io_outputs_0_payload_state_elements_9     (streamDemux_50_io_outputs_0_payload_state_elements_9      ), //o
    .io_outputs_0_payload_state_elements_10    (streamDemux_50_io_outputs_0_payload_state_elements_10     ), //o
    .io_outputs_0_payload_state_elements_11    (streamDemux_50_io_outputs_0_payload_state_elements_11     ), //o
    .io_outputs_1_valid                        (streamDemux_50_io_outputs_1_valid                         ), //o
    .io_outputs_1_ready                        (streamDemux_50_io_outputs_1_ready                         ), //i
    .io_outputs_1_payload_round_index          (streamDemux_50_io_outputs_1_payload_round_index           ), //o
    .io_outputs_1_payload_state_size           (streamDemux_50_io_outputs_1_payload_state_size            ), //o
    .io_outputs_1_payload_state_id             (streamDemux_50_io_outputs_1_payload_state_id              ), //o
    .io_outputs_1_payload_state_elements_0     (streamDemux_50_io_outputs_1_payload_state_elements_0      ), //o
    .io_outputs_1_payload_state_elements_1     (streamDemux_50_io_outputs_1_payload_state_elements_1      ), //o
    .io_outputs_1_payload_state_elements_2     (streamDemux_50_io_outputs_1_payload_state_elements_2      ), //o
    .io_outputs_1_payload_state_elements_3     (streamDemux_50_io_outputs_1_payload_state_elements_3      ), //o
    .io_outputs_1_payload_state_elements_4     (streamDemux_50_io_outputs_1_payload_state_elements_4      ), //o
    .io_outputs_1_payload_state_elements_5     (streamDemux_50_io_outputs_1_payload_state_elements_5      ), //o
    .io_outputs_1_payload_state_elements_6     (streamDemux_50_io_outputs_1_payload_state_elements_6      ), //o
    .io_outputs_1_payload_state_elements_7     (streamDemux_50_io_outputs_1_payload_state_elements_7      ), //o
    .io_outputs_1_payload_state_elements_8     (streamDemux_50_io_outputs_1_payload_state_elements_8      ), //o
    .io_outputs_1_payload_state_elements_9     (streamDemux_50_io_outputs_1_payload_state_elements_9      ), //o
    .io_outputs_1_payload_state_elements_10    (streamDemux_50_io_outputs_1_payload_state_elements_10     ), //o
    .io_outputs_1_payload_state_elements_11    (streamDemux_50_io_outputs_1_payload_state_elements_11     ), //o
    .io_outputs_2_valid                        (streamDemux_50_io_outputs_2_valid                         ), //o
    .io_outputs_2_ready                        (streamDemux_50_io_outputs_2_ready                         ), //i
    .io_outputs_2_payload_round_index          (streamDemux_50_io_outputs_2_payload_round_index           ), //o
    .io_outputs_2_payload_state_size           (streamDemux_50_io_outputs_2_payload_state_size            ), //o
    .io_outputs_2_payload_state_id             (streamDemux_50_io_outputs_2_payload_state_id              ), //o
    .io_outputs_2_payload_state_elements_0     (streamDemux_50_io_outputs_2_payload_state_elements_0      ), //o
    .io_outputs_2_payload_state_elements_1     (streamDemux_50_io_outputs_2_payload_state_elements_1      ), //o
    .io_outputs_2_payload_state_elements_2     (streamDemux_50_io_outputs_2_payload_state_elements_2      ), //o
    .io_outputs_2_payload_state_elements_3     (streamDemux_50_io_outputs_2_payload_state_elements_3      ), //o
    .io_outputs_2_payload_state_elements_4     (streamDemux_50_io_outputs_2_payload_state_elements_4      ), //o
    .io_outputs_2_payload_state_elements_5     (streamDemux_50_io_outputs_2_payload_state_elements_5      ), //o
    .io_outputs_2_payload_state_elements_6     (streamDemux_50_io_outputs_2_payload_state_elements_6      ), //o
    .io_outputs_2_payload_state_elements_7     (streamDemux_50_io_outputs_2_payload_state_elements_7      ), //o
    .io_outputs_2_payload_state_elements_8     (streamDemux_50_io_outputs_2_payload_state_elements_8      ), //o
    .io_outputs_2_payload_state_elements_9     (streamDemux_50_io_outputs_2_payload_state_elements_9      ), //o
    .io_outputs_2_payload_state_elements_10    (streamDemux_50_io_outputs_2_payload_state_elements_10     ), //o
    .io_outputs_2_payload_state_elements_11    (streamDemux_50_io_outputs_2_payload_state_elements_11     )  //o
  );
  PoseidonLoop poseidonLoop_3 (
    .io_input_valid                        (loopInputs_0_m2sPipe_valid                      ), //i
    .io_input_ready                        (poseidonLoop_3_io_input_ready                   ), //o
    .io_input_payload_round_index          (loopInputs_0_m2sPipe_payload_round_index        ), //i
    .io_input_payload_state_size           (loopInputs_0_m2sPipe_payload_state_size         ), //i
    .io_input_payload_state_id             (loopInputs_0_m2sPipe_payload_state_id           ), //i
    .io_input_payload_state_elements_0     (loopInputs_0_m2sPipe_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1     (loopInputs_0_m2sPipe_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2     (loopInputs_0_m2sPipe_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3     (loopInputs_0_m2sPipe_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4     (loopInputs_0_m2sPipe_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5     (loopInputs_0_m2sPipe_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6     (loopInputs_0_m2sPipe_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7     (loopInputs_0_m2sPipe_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8     (loopInputs_0_m2sPipe_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9     (loopInputs_0_m2sPipe_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10    (loopInputs_0_m2sPipe_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11    (loopInputs_0_m2sPipe_payload_state_elements_11  ), //i
    .io_output_valid                       (poseidonLoop_3_io_output_valid                  ), //o
    .io_output_ready                       (streamArbiter_49_io_inputs_0_ready              ), //i
    .io_output_payload_state_id            (poseidonLoop_3_io_output_payload_state_id       ), //o
    .io_output_payload_state_element       (poseidonLoop_3_io_output_payload_state_element  ), //o
    .clk                                   (clk                                             ), //i
    .reset                                 (reset                                           )  //i
  );
  PoseidonLoop_1 poseidonLoop_4 (
    .io_input_valid                        (loopInputs_1_m2sPipe_valid                      ), //i
    .io_input_ready                        (poseidonLoop_4_io_input_ready                   ), //o
    .io_input_payload_round_index          (loopInputs_1_m2sPipe_payload_round_index        ), //i
    .io_input_payload_state_size           (loopInputs_1_m2sPipe_payload_state_size         ), //i
    .io_input_payload_state_id             (loopInputs_1_m2sPipe_payload_state_id           ), //i
    .io_input_payload_state_elements_0     (loopInputs_1_m2sPipe_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1     (loopInputs_1_m2sPipe_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2     (loopInputs_1_m2sPipe_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3     (loopInputs_1_m2sPipe_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4     (loopInputs_1_m2sPipe_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5     (loopInputs_1_m2sPipe_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6     (loopInputs_1_m2sPipe_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7     (loopInputs_1_m2sPipe_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8     (loopInputs_1_m2sPipe_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9     (loopInputs_1_m2sPipe_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10    (loopInputs_1_m2sPipe_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11    (loopInputs_1_m2sPipe_payload_state_elements_11  ), //i
    .io_output_valid                       (poseidonLoop_4_io_output_valid                  ), //o
    .io_output_ready                       (streamArbiter_49_io_inputs_1_ready              ), //i
    .io_output_payload_state_id            (poseidonLoop_4_io_output_payload_state_id       ), //o
    .io_output_payload_state_element       (poseidonLoop_4_io_output_payload_state_element  ), //o
    .clk                                   (clk                                             ), //i
    .reset                                 (reset                                           )  //i
  );
  PoseidonLoop_2 poseidonLoop_5 (
    .io_input_valid                        (loopInputs_2_m2sPipe_valid                      ), //i
    .io_input_ready                        (poseidonLoop_5_io_input_ready                   ), //o
    .io_input_payload_round_index          (loopInputs_2_m2sPipe_payload_round_index        ), //i
    .io_input_payload_state_size           (loopInputs_2_m2sPipe_payload_state_size         ), //i
    .io_input_payload_state_id             (loopInputs_2_m2sPipe_payload_state_id           ), //i
    .io_input_payload_state_elements_0     (loopInputs_2_m2sPipe_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1     (loopInputs_2_m2sPipe_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2     (loopInputs_2_m2sPipe_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3     (loopInputs_2_m2sPipe_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4     (loopInputs_2_m2sPipe_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5     (loopInputs_2_m2sPipe_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6     (loopInputs_2_m2sPipe_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7     (loopInputs_2_m2sPipe_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8     (loopInputs_2_m2sPipe_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9     (loopInputs_2_m2sPipe_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10    (loopInputs_2_m2sPipe_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11    (loopInputs_2_m2sPipe_payload_state_elements_11  ), //i
    .io_output_valid                       (poseidonLoop_5_io_output_valid                  ), //o
    .io_output_ready                       (streamArbiter_49_io_inputs_2_ready              ), //i
    .io_output_payload_state_id            (poseidonLoop_5_io_output_payload_state_id       ), //o
    .io_output_payload_state_element       (poseidonLoop_5_io_output_payload_state_element  ), //o
    .clk                                   (clk                                             ), //i
    .reset                                 (reset                                           )  //i
  );
  StreamArbiter_48 streamArbiter_49 (
    .io_inputs_0_valid                    (poseidonLoop_3_io_output_valid                    ), //i
    .io_inputs_0_ready                    (streamArbiter_49_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_state_id         (poseidonLoop_3_io_output_payload_state_id         ), //i
    .io_inputs_0_payload_state_element    (poseidonLoop_3_io_output_payload_state_element    ), //i
    .io_inputs_1_valid                    (poseidonLoop_4_io_output_valid                    ), //i
    .io_inputs_1_ready                    (streamArbiter_49_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_state_id         (poseidonLoop_4_io_output_payload_state_id         ), //i
    .io_inputs_1_payload_state_element    (poseidonLoop_4_io_output_payload_state_element    ), //i
    .io_inputs_2_valid                    (poseidonLoop_5_io_output_valid                    ), //i
    .io_inputs_2_ready                    (streamArbiter_49_io_inputs_2_ready                ), //o
    .io_inputs_2_payload_state_id         (poseidonLoop_5_io_output_payload_state_id         ), //i
    .io_inputs_2_payload_state_element    (poseidonLoop_5_io_output_payload_state_element    ), //i
    .io_output_valid                      (streamArbiter_49_io_output_valid                  ), //o
    .io_output_ready                      (aXI4StreamTransmitter_1_io_input_ready            ), //i
    .io_output_payload_state_id           (streamArbiter_49_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_49_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_49_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_49_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  AXI4StreamTransmitter aXI4StreamTransmitter_1 (
    .io_input_valid                    (streamArbiter_49_io_output_valid                  ), //i
    .io_input_ready                    (aXI4StreamTransmitter_1_io_input_ready            ), //o
    .io_input_payload_state_id         (streamArbiter_49_io_output_payload_state_id       ), //i
    .io_input_payload_state_element    (streamArbiter_49_io_output_payload_state_element  ), //i
    .io_output_valid                   (aXI4StreamTransmitter_1_io_output_valid           ), //o
    .io_output_ready                   (io_output_ready                                   ), //i
    .io_output_last                    (aXI4StreamTransmitter_1_io_output_last            ), //o
    .io_output_payload                 (aXI4StreamTransmitter_1_io_output_payload         ), //o
    .clk                               (clk                                               ), //i
    .reset                             (reset                                             )  //i
  );
  assign io_input_ready = aXI4StreamReceiver_1_io_input_ready;
  assign _zz_select = {loopInputs_2_ready,{loopInputs_1_ready,loopInputs_0_ready}};
  assign _zz_select_1 = (_zz_select & (~ _zz__zz_select_1));
  assign _zz_select_2 = _zz_select_1[1];
  assign _zz_select_3 = _zz_select_1[2];
  assign select_1 = {_zz_select_3,_zz_select_2};
  assign streamDemux_50_io_outputs_0_ready = (! streamDemux_50_io_outputs_0_rValid);
  assign streamDemux_50_io_outputs_0_s2mPipe_valid = (streamDemux_50_io_outputs_0_valid || streamDemux_50_io_outputs_0_rValid);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_round_index = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_round_index : streamDemux_50_io_outputs_0_payload_round_index);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_size = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_size : streamDemux_50_io_outputs_0_payload_state_size);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_id = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_id : streamDemux_50_io_outputs_0_payload_state_id);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_0 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_0 : streamDemux_50_io_outputs_0_payload_state_elements_0);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_1 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_1 : streamDemux_50_io_outputs_0_payload_state_elements_1);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_2 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_2 : streamDemux_50_io_outputs_0_payload_state_elements_2);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_3 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_3 : streamDemux_50_io_outputs_0_payload_state_elements_3);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_4 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_4 : streamDemux_50_io_outputs_0_payload_state_elements_4);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_5 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_5 : streamDemux_50_io_outputs_0_payload_state_elements_5);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_6 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_6 : streamDemux_50_io_outputs_0_payload_state_elements_6);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_7 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_7 : streamDemux_50_io_outputs_0_payload_state_elements_7);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_8 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_8 : streamDemux_50_io_outputs_0_payload_state_elements_8);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_9 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_9 : streamDemux_50_io_outputs_0_payload_state_elements_9);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_10 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_10 : streamDemux_50_io_outputs_0_payload_state_elements_10);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_11 = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_state_elements_11 : streamDemux_50_io_outputs_0_payload_state_elements_11);
  always @(*) begin
    streamDemux_50_io_outputs_0_s2mPipe_ready = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342) begin
      streamDemux_50_io_outputs_0_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_valid);
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_valid = streamDemux_50_io_outputs_0_s2mPipe_rValid;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_round_index = streamDemux_50_io_outputs_0_s2mPipe_rData_round_index;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_size = streamDemux_50_io_outputs_0_s2mPipe_rData_state_size;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_id = streamDemux_50_io_outputs_0_s2mPipe_rData_state_id;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_0 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_0;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_1 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_1;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_2 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_2;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_3 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_3;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_4 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_4;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_5 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_5;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_6 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_6;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_7 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_7;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_8 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_8;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_9 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_9;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_10 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_10;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_11 = streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_11;
  assign loopInputs_0_valid = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_valid;
  assign streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_ready = loopInputs_0_ready;
  assign loopInputs_0_payload_round_index = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_round_index;
  assign loopInputs_0_payload_state_size = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_size;
  assign loopInputs_0_payload_state_id = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_id;
  assign loopInputs_0_payload_state_elements_0 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_0;
  assign loopInputs_0_payload_state_elements_1 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_1;
  assign loopInputs_0_payload_state_elements_2 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_2;
  assign loopInputs_0_payload_state_elements_3 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_3;
  assign loopInputs_0_payload_state_elements_4 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_4;
  assign loopInputs_0_payload_state_elements_5 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_5;
  assign loopInputs_0_payload_state_elements_6 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_6;
  assign loopInputs_0_payload_state_elements_7 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_7;
  assign loopInputs_0_payload_state_elements_8 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_8;
  assign loopInputs_0_payload_state_elements_9 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_9;
  assign loopInputs_0_payload_state_elements_10 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_10;
  assign loopInputs_0_payload_state_elements_11 = streamDemux_50_io_outputs_0_s2mPipe_m2sPipe_payload_state_elements_11;
  assign streamDemux_50_io_outputs_1_ready = (! streamDemux_50_io_outputs_1_rValid);
  assign streamDemux_50_io_outputs_1_s2mPipe_valid = (streamDemux_50_io_outputs_1_valid || streamDemux_50_io_outputs_1_rValid);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_round_index = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_round_index : streamDemux_50_io_outputs_1_payload_round_index);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_size = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_size : streamDemux_50_io_outputs_1_payload_state_size);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_id = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_id : streamDemux_50_io_outputs_1_payload_state_id);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_0 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_0 : streamDemux_50_io_outputs_1_payload_state_elements_0);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_1 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_1 : streamDemux_50_io_outputs_1_payload_state_elements_1);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_2 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_2 : streamDemux_50_io_outputs_1_payload_state_elements_2);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_3 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_3 : streamDemux_50_io_outputs_1_payload_state_elements_3);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_4 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_4 : streamDemux_50_io_outputs_1_payload_state_elements_4);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_5 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_5 : streamDemux_50_io_outputs_1_payload_state_elements_5);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_6 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_6 : streamDemux_50_io_outputs_1_payload_state_elements_6);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_7 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_7 : streamDemux_50_io_outputs_1_payload_state_elements_7);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_8 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_8 : streamDemux_50_io_outputs_1_payload_state_elements_8);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_9 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_9 : streamDemux_50_io_outputs_1_payload_state_elements_9);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_10 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_10 : streamDemux_50_io_outputs_1_payload_state_elements_10);
  assign streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_11 = (streamDemux_50_io_outputs_1_rValid ? streamDemux_50_io_outputs_1_rData_state_elements_11 : streamDemux_50_io_outputs_1_payload_state_elements_11);
  always @(*) begin
    streamDemux_50_io_outputs_1_s2mPipe_ready = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      streamDemux_50_io_outputs_1_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_valid);
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_valid = streamDemux_50_io_outputs_1_s2mPipe_rValid;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_round_index = streamDemux_50_io_outputs_1_s2mPipe_rData_round_index;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_size = streamDemux_50_io_outputs_1_s2mPipe_rData_state_size;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_id = streamDemux_50_io_outputs_1_s2mPipe_rData_state_id;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_0 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_0;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_1 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_1;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_2 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_2;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_3 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_3;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_4 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_4;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_5 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_5;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_6 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_6;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_7 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_7;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_8 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_8;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_9 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_9;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_10 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_10;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_11 = streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_11;
  assign loopInputs_1_valid = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_valid;
  assign streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_ready = loopInputs_1_ready;
  assign loopInputs_1_payload_round_index = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_round_index;
  assign loopInputs_1_payload_state_size = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_size;
  assign loopInputs_1_payload_state_id = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_id;
  assign loopInputs_1_payload_state_elements_0 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_0;
  assign loopInputs_1_payload_state_elements_1 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_1;
  assign loopInputs_1_payload_state_elements_2 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_2;
  assign loopInputs_1_payload_state_elements_3 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_3;
  assign loopInputs_1_payload_state_elements_4 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_4;
  assign loopInputs_1_payload_state_elements_5 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_5;
  assign loopInputs_1_payload_state_elements_6 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_6;
  assign loopInputs_1_payload_state_elements_7 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_7;
  assign loopInputs_1_payload_state_elements_8 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_8;
  assign loopInputs_1_payload_state_elements_9 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_9;
  assign loopInputs_1_payload_state_elements_10 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_10;
  assign loopInputs_1_payload_state_elements_11 = streamDemux_50_io_outputs_1_s2mPipe_m2sPipe_payload_state_elements_11;
  assign streamDemux_50_io_outputs_2_ready = (! streamDemux_50_io_outputs_2_rValid);
  assign streamDemux_50_io_outputs_2_s2mPipe_valid = (streamDemux_50_io_outputs_2_valid || streamDemux_50_io_outputs_2_rValid);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_round_index = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_round_index : streamDemux_50_io_outputs_2_payload_round_index);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_size = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_size : streamDemux_50_io_outputs_2_payload_state_size);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_id = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_id : streamDemux_50_io_outputs_2_payload_state_id);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_0 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_0 : streamDemux_50_io_outputs_2_payload_state_elements_0);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_1 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_1 : streamDemux_50_io_outputs_2_payload_state_elements_1);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_2 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_2 : streamDemux_50_io_outputs_2_payload_state_elements_2);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_3 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_3 : streamDemux_50_io_outputs_2_payload_state_elements_3);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_4 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_4 : streamDemux_50_io_outputs_2_payload_state_elements_4);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_5 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_5 : streamDemux_50_io_outputs_2_payload_state_elements_5);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_6 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_6 : streamDemux_50_io_outputs_2_payload_state_elements_6);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_7 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_7 : streamDemux_50_io_outputs_2_payload_state_elements_7);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_8 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_8 : streamDemux_50_io_outputs_2_payload_state_elements_8);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_9 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_9 : streamDemux_50_io_outputs_2_payload_state_elements_9);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_10 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_10 : streamDemux_50_io_outputs_2_payload_state_elements_10);
  assign streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_11 = (streamDemux_50_io_outputs_2_rValid ? streamDemux_50_io_outputs_2_rData_state_elements_11 : streamDemux_50_io_outputs_2_payload_state_elements_11);
  always @(*) begin
    streamDemux_50_io_outputs_2_s2mPipe_ready = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      streamDemux_50_io_outputs_2_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_valid);
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_valid = streamDemux_50_io_outputs_2_s2mPipe_rValid;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_round_index = streamDemux_50_io_outputs_2_s2mPipe_rData_round_index;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_size = streamDemux_50_io_outputs_2_s2mPipe_rData_state_size;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_id = streamDemux_50_io_outputs_2_s2mPipe_rData_state_id;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_0 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_0;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_1 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_1;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_2 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_2;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_3 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_3;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_4 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_4;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_5 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_5;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_6 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_6;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_7 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_7;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_8 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_8;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_9 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_9;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_10 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_10;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_11 = streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_11;
  assign loopInputs_2_valid = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_valid;
  assign streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_ready = loopInputs_2_ready;
  assign loopInputs_2_payload_round_index = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_round_index;
  assign loopInputs_2_payload_state_size = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_size;
  assign loopInputs_2_payload_state_id = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_id;
  assign loopInputs_2_payload_state_elements_0 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_0;
  assign loopInputs_2_payload_state_elements_1 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_1;
  assign loopInputs_2_payload_state_elements_2 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_2;
  assign loopInputs_2_payload_state_elements_3 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_3;
  assign loopInputs_2_payload_state_elements_4 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_4;
  assign loopInputs_2_payload_state_elements_5 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_5;
  assign loopInputs_2_payload_state_elements_6 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_6;
  assign loopInputs_2_payload_state_elements_7 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_7;
  assign loopInputs_2_payload_state_elements_8 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_8;
  assign loopInputs_2_payload_state_elements_9 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_9;
  assign loopInputs_2_payload_state_elements_10 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_10;
  assign loopInputs_2_payload_state_elements_11 = streamDemux_50_io_outputs_2_s2mPipe_m2sPipe_payload_state_elements_11;
  always @(*) begin
    loopInputs_0_ready = loopInputs_0_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      loopInputs_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! loopInputs_0_m2sPipe_valid);
  assign loopInputs_0_m2sPipe_valid = loopInputs_0_rValid;
  assign loopInputs_0_m2sPipe_payload_round_index = loopInputs_0_rData_round_index;
  assign loopInputs_0_m2sPipe_payload_state_size = loopInputs_0_rData_state_size;
  assign loopInputs_0_m2sPipe_payload_state_id = loopInputs_0_rData_state_id;
  assign loopInputs_0_m2sPipe_payload_state_elements_0 = loopInputs_0_rData_state_elements_0;
  assign loopInputs_0_m2sPipe_payload_state_elements_1 = loopInputs_0_rData_state_elements_1;
  assign loopInputs_0_m2sPipe_payload_state_elements_2 = loopInputs_0_rData_state_elements_2;
  assign loopInputs_0_m2sPipe_payload_state_elements_3 = loopInputs_0_rData_state_elements_3;
  assign loopInputs_0_m2sPipe_payload_state_elements_4 = loopInputs_0_rData_state_elements_4;
  assign loopInputs_0_m2sPipe_payload_state_elements_5 = loopInputs_0_rData_state_elements_5;
  assign loopInputs_0_m2sPipe_payload_state_elements_6 = loopInputs_0_rData_state_elements_6;
  assign loopInputs_0_m2sPipe_payload_state_elements_7 = loopInputs_0_rData_state_elements_7;
  assign loopInputs_0_m2sPipe_payload_state_elements_8 = loopInputs_0_rData_state_elements_8;
  assign loopInputs_0_m2sPipe_payload_state_elements_9 = loopInputs_0_rData_state_elements_9;
  assign loopInputs_0_m2sPipe_payload_state_elements_10 = loopInputs_0_rData_state_elements_10;
  assign loopInputs_0_m2sPipe_payload_state_elements_11 = loopInputs_0_rData_state_elements_11;
  assign loopInputs_0_m2sPipe_ready = poseidonLoop_3_io_input_ready;
  always @(*) begin
    loopInputs_1_ready = loopInputs_1_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      loopInputs_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! loopInputs_1_m2sPipe_valid);
  assign loopInputs_1_m2sPipe_valid = loopInputs_1_rValid;
  assign loopInputs_1_m2sPipe_payload_round_index = loopInputs_1_rData_round_index;
  assign loopInputs_1_m2sPipe_payload_state_size = loopInputs_1_rData_state_size;
  assign loopInputs_1_m2sPipe_payload_state_id = loopInputs_1_rData_state_id;
  assign loopInputs_1_m2sPipe_payload_state_elements_0 = loopInputs_1_rData_state_elements_0;
  assign loopInputs_1_m2sPipe_payload_state_elements_1 = loopInputs_1_rData_state_elements_1;
  assign loopInputs_1_m2sPipe_payload_state_elements_2 = loopInputs_1_rData_state_elements_2;
  assign loopInputs_1_m2sPipe_payload_state_elements_3 = loopInputs_1_rData_state_elements_3;
  assign loopInputs_1_m2sPipe_payload_state_elements_4 = loopInputs_1_rData_state_elements_4;
  assign loopInputs_1_m2sPipe_payload_state_elements_5 = loopInputs_1_rData_state_elements_5;
  assign loopInputs_1_m2sPipe_payload_state_elements_6 = loopInputs_1_rData_state_elements_6;
  assign loopInputs_1_m2sPipe_payload_state_elements_7 = loopInputs_1_rData_state_elements_7;
  assign loopInputs_1_m2sPipe_payload_state_elements_8 = loopInputs_1_rData_state_elements_8;
  assign loopInputs_1_m2sPipe_payload_state_elements_9 = loopInputs_1_rData_state_elements_9;
  assign loopInputs_1_m2sPipe_payload_state_elements_10 = loopInputs_1_rData_state_elements_10;
  assign loopInputs_1_m2sPipe_payload_state_elements_11 = loopInputs_1_rData_state_elements_11;
  assign loopInputs_1_m2sPipe_ready = poseidonLoop_4_io_input_ready;
  always @(*) begin
    loopInputs_2_ready = loopInputs_2_m2sPipe_ready;
    if(when_Stream_l342_5) begin
      loopInputs_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! loopInputs_2_m2sPipe_valid);
  assign loopInputs_2_m2sPipe_valid = loopInputs_2_rValid;
  assign loopInputs_2_m2sPipe_payload_round_index = loopInputs_2_rData_round_index;
  assign loopInputs_2_m2sPipe_payload_state_size = loopInputs_2_rData_state_size;
  assign loopInputs_2_m2sPipe_payload_state_id = loopInputs_2_rData_state_id;
  assign loopInputs_2_m2sPipe_payload_state_elements_0 = loopInputs_2_rData_state_elements_0;
  assign loopInputs_2_m2sPipe_payload_state_elements_1 = loopInputs_2_rData_state_elements_1;
  assign loopInputs_2_m2sPipe_payload_state_elements_2 = loopInputs_2_rData_state_elements_2;
  assign loopInputs_2_m2sPipe_payload_state_elements_3 = loopInputs_2_rData_state_elements_3;
  assign loopInputs_2_m2sPipe_payload_state_elements_4 = loopInputs_2_rData_state_elements_4;
  assign loopInputs_2_m2sPipe_payload_state_elements_5 = loopInputs_2_rData_state_elements_5;
  assign loopInputs_2_m2sPipe_payload_state_elements_6 = loopInputs_2_rData_state_elements_6;
  assign loopInputs_2_m2sPipe_payload_state_elements_7 = loopInputs_2_rData_state_elements_7;
  assign loopInputs_2_m2sPipe_payload_state_elements_8 = loopInputs_2_rData_state_elements_8;
  assign loopInputs_2_m2sPipe_payload_state_elements_9 = loopInputs_2_rData_state_elements_9;
  assign loopInputs_2_m2sPipe_payload_state_elements_10 = loopInputs_2_rData_state_elements_10;
  assign loopInputs_2_m2sPipe_payload_state_elements_11 = loopInputs_2_rData_state_elements_11;
  assign loopInputs_2_m2sPipe_ready = poseidonLoop_5_io_input_ready;
  assign io_output_valid = aXI4StreamTransmitter_1_io_output_valid;
  assign io_output_last = aXI4StreamTransmitter_1_io_output_last;
  assign io_output_payload = aXI4StreamTransmitter_1_io_output_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      streamDemux_50_io_outputs_0_rValid <= 1'b0;
      streamDemux_50_io_outputs_0_s2mPipe_rValid <= 1'b0;
      streamDemux_50_io_outputs_1_rValid <= 1'b0;
      streamDemux_50_io_outputs_1_s2mPipe_rValid <= 1'b0;
      streamDemux_50_io_outputs_2_rValid <= 1'b0;
      streamDemux_50_io_outputs_2_s2mPipe_rValid <= 1'b0;
      loopInputs_0_rValid <= 1'b0;
      loopInputs_1_rValid <= 1'b0;
      loopInputs_2_rValid <= 1'b0;
    end else begin
      if(streamDemux_50_io_outputs_0_valid) begin
        streamDemux_50_io_outputs_0_rValid <= 1'b1;
      end
      if(streamDemux_50_io_outputs_0_s2mPipe_ready) begin
        streamDemux_50_io_outputs_0_rValid <= 1'b0;
      end
      if(streamDemux_50_io_outputs_0_s2mPipe_ready) begin
        streamDemux_50_io_outputs_0_s2mPipe_rValid <= streamDemux_50_io_outputs_0_s2mPipe_valid;
      end
      if(streamDemux_50_io_outputs_1_valid) begin
        streamDemux_50_io_outputs_1_rValid <= 1'b1;
      end
      if(streamDemux_50_io_outputs_1_s2mPipe_ready) begin
        streamDemux_50_io_outputs_1_rValid <= 1'b0;
      end
      if(streamDemux_50_io_outputs_1_s2mPipe_ready) begin
        streamDemux_50_io_outputs_1_s2mPipe_rValid <= streamDemux_50_io_outputs_1_s2mPipe_valid;
      end
      if(streamDemux_50_io_outputs_2_valid) begin
        streamDemux_50_io_outputs_2_rValid <= 1'b1;
      end
      if(streamDemux_50_io_outputs_2_s2mPipe_ready) begin
        streamDemux_50_io_outputs_2_rValid <= 1'b0;
      end
      if(streamDemux_50_io_outputs_2_s2mPipe_ready) begin
        streamDemux_50_io_outputs_2_s2mPipe_rValid <= streamDemux_50_io_outputs_2_s2mPipe_valid;
      end
      if(loopInputs_0_ready) begin
        loopInputs_0_rValid <= loopInputs_0_valid;
      end
      if(loopInputs_1_ready) begin
        loopInputs_1_rValid <= loopInputs_1_valid;
      end
      if(loopInputs_2_ready) begin
        loopInputs_2_rValid <= loopInputs_2_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(streamDemux_50_io_outputs_0_ready) begin
      streamDemux_50_io_outputs_0_rData_round_index <= streamDemux_50_io_outputs_0_payload_round_index;
      streamDemux_50_io_outputs_0_rData_state_size <= streamDemux_50_io_outputs_0_payload_state_size;
      streamDemux_50_io_outputs_0_rData_state_id <= streamDemux_50_io_outputs_0_payload_state_id;
      streamDemux_50_io_outputs_0_rData_state_elements_0 <= streamDemux_50_io_outputs_0_payload_state_elements_0;
      streamDemux_50_io_outputs_0_rData_state_elements_1 <= streamDemux_50_io_outputs_0_payload_state_elements_1;
      streamDemux_50_io_outputs_0_rData_state_elements_2 <= streamDemux_50_io_outputs_0_payload_state_elements_2;
      streamDemux_50_io_outputs_0_rData_state_elements_3 <= streamDemux_50_io_outputs_0_payload_state_elements_3;
      streamDemux_50_io_outputs_0_rData_state_elements_4 <= streamDemux_50_io_outputs_0_payload_state_elements_4;
      streamDemux_50_io_outputs_0_rData_state_elements_5 <= streamDemux_50_io_outputs_0_payload_state_elements_5;
      streamDemux_50_io_outputs_0_rData_state_elements_6 <= streamDemux_50_io_outputs_0_payload_state_elements_6;
      streamDemux_50_io_outputs_0_rData_state_elements_7 <= streamDemux_50_io_outputs_0_payload_state_elements_7;
      streamDemux_50_io_outputs_0_rData_state_elements_8 <= streamDemux_50_io_outputs_0_payload_state_elements_8;
      streamDemux_50_io_outputs_0_rData_state_elements_9 <= streamDemux_50_io_outputs_0_payload_state_elements_9;
      streamDemux_50_io_outputs_0_rData_state_elements_10 <= streamDemux_50_io_outputs_0_payload_state_elements_10;
      streamDemux_50_io_outputs_0_rData_state_elements_11 <= streamDemux_50_io_outputs_0_payload_state_elements_11;
    end
    if(streamDemux_50_io_outputs_0_s2mPipe_ready) begin
      streamDemux_50_io_outputs_0_s2mPipe_rData_round_index <= streamDemux_50_io_outputs_0_s2mPipe_payload_round_index;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_size <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_size;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_id <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_id;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_0 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_0;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_1 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_1;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_2 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_2;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_3 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_3;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_4 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_4;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_5 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_5;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_6 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_6;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_7 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_7;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_8 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_8;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_9 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_9;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_10 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_10;
      streamDemux_50_io_outputs_0_s2mPipe_rData_state_elements_11 <= streamDemux_50_io_outputs_0_s2mPipe_payload_state_elements_11;
    end
    if(streamDemux_50_io_outputs_1_ready) begin
      streamDemux_50_io_outputs_1_rData_round_index <= streamDemux_50_io_outputs_1_payload_round_index;
      streamDemux_50_io_outputs_1_rData_state_size <= streamDemux_50_io_outputs_1_payload_state_size;
      streamDemux_50_io_outputs_1_rData_state_id <= streamDemux_50_io_outputs_1_payload_state_id;
      streamDemux_50_io_outputs_1_rData_state_elements_0 <= streamDemux_50_io_outputs_1_payload_state_elements_0;
      streamDemux_50_io_outputs_1_rData_state_elements_1 <= streamDemux_50_io_outputs_1_payload_state_elements_1;
      streamDemux_50_io_outputs_1_rData_state_elements_2 <= streamDemux_50_io_outputs_1_payload_state_elements_2;
      streamDemux_50_io_outputs_1_rData_state_elements_3 <= streamDemux_50_io_outputs_1_payload_state_elements_3;
      streamDemux_50_io_outputs_1_rData_state_elements_4 <= streamDemux_50_io_outputs_1_payload_state_elements_4;
      streamDemux_50_io_outputs_1_rData_state_elements_5 <= streamDemux_50_io_outputs_1_payload_state_elements_5;
      streamDemux_50_io_outputs_1_rData_state_elements_6 <= streamDemux_50_io_outputs_1_payload_state_elements_6;
      streamDemux_50_io_outputs_1_rData_state_elements_7 <= streamDemux_50_io_outputs_1_payload_state_elements_7;
      streamDemux_50_io_outputs_1_rData_state_elements_8 <= streamDemux_50_io_outputs_1_payload_state_elements_8;
      streamDemux_50_io_outputs_1_rData_state_elements_9 <= streamDemux_50_io_outputs_1_payload_state_elements_9;
      streamDemux_50_io_outputs_1_rData_state_elements_10 <= streamDemux_50_io_outputs_1_payload_state_elements_10;
      streamDemux_50_io_outputs_1_rData_state_elements_11 <= streamDemux_50_io_outputs_1_payload_state_elements_11;
    end
    if(streamDemux_50_io_outputs_1_s2mPipe_ready) begin
      streamDemux_50_io_outputs_1_s2mPipe_rData_round_index <= streamDemux_50_io_outputs_1_s2mPipe_payload_round_index;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_size <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_size;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_id <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_id;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_0 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_0;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_1 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_1;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_2 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_2;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_3 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_3;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_4 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_4;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_5 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_5;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_6 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_6;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_7 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_7;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_8 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_8;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_9 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_9;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_10 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_10;
      streamDemux_50_io_outputs_1_s2mPipe_rData_state_elements_11 <= streamDemux_50_io_outputs_1_s2mPipe_payload_state_elements_11;
    end
    if(streamDemux_50_io_outputs_2_ready) begin
      streamDemux_50_io_outputs_2_rData_round_index <= streamDemux_50_io_outputs_2_payload_round_index;
      streamDemux_50_io_outputs_2_rData_state_size <= streamDemux_50_io_outputs_2_payload_state_size;
      streamDemux_50_io_outputs_2_rData_state_id <= streamDemux_50_io_outputs_2_payload_state_id;
      streamDemux_50_io_outputs_2_rData_state_elements_0 <= streamDemux_50_io_outputs_2_payload_state_elements_0;
      streamDemux_50_io_outputs_2_rData_state_elements_1 <= streamDemux_50_io_outputs_2_payload_state_elements_1;
      streamDemux_50_io_outputs_2_rData_state_elements_2 <= streamDemux_50_io_outputs_2_payload_state_elements_2;
      streamDemux_50_io_outputs_2_rData_state_elements_3 <= streamDemux_50_io_outputs_2_payload_state_elements_3;
      streamDemux_50_io_outputs_2_rData_state_elements_4 <= streamDemux_50_io_outputs_2_payload_state_elements_4;
      streamDemux_50_io_outputs_2_rData_state_elements_5 <= streamDemux_50_io_outputs_2_payload_state_elements_5;
      streamDemux_50_io_outputs_2_rData_state_elements_6 <= streamDemux_50_io_outputs_2_payload_state_elements_6;
      streamDemux_50_io_outputs_2_rData_state_elements_7 <= streamDemux_50_io_outputs_2_payload_state_elements_7;
      streamDemux_50_io_outputs_2_rData_state_elements_8 <= streamDemux_50_io_outputs_2_payload_state_elements_8;
      streamDemux_50_io_outputs_2_rData_state_elements_9 <= streamDemux_50_io_outputs_2_payload_state_elements_9;
      streamDemux_50_io_outputs_2_rData_state_elements_10 <= streamDemux_50_io_outputs_2_payload_state_elements_10;
      streamDemux_50_io_outputs_2_rData_state_elements_11 <= streamDemux_50_io_outputs_2_payload_state_elements_11;
    end
    if(streamDemux_50_io_outputs_2_s2mPipe_ready) begin
      streamDemux_50_io_outputs_2_s2mPipe_rData_round_index <= streamDemux_50_io_outputs_2_s2mPipe_payload_round_index;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_size <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_size;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_id <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_id;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_0 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_0;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_1 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_1;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_2 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_2;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_3 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_3;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_4 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_4;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_5 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_5;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_6 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_6;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_7 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_7;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_8 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_8;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_9 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_9;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_10 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_10;
      streamDemux_50_io_outputs_2_s2mPipe_rData_state_elements_11 <= streamDemux_50_io_outputs_2_s2mPipe_payload_state_elements_11;
    end
    if(loopInputs_0_ready) begin
      loopInputs_0_rData_round_index <= loopInputs_0_payload_round_index;
      loopInputs_0_rData_state_size <= loopInputs_0_payload_state_size;
      loopInputs_0_rData_state_id <= loopInputs_0_payload_state_id;
      loopInputs_0_rData_state_elements_0 <= loopInputs_0_payload_state_elements_0;
      loopInputs_0_rData_state_elements_1 <= loopInputs_0_payload_state_elements_1;
      loopInputs_0_rData_state_elements_2 <= loopInputs_0_payload_state_elements_2;
      loopInputs_0_rData_state_elements_3 <= loopInputs_0_payload_state_elements_3;
      loopInputs_0_rData_state_elements_4 <= loopInputs_0_payload_state_elements_4;
      loopInputs_0_rData_state_elements_5 <= loopInputs_0_payload_state_elements_5;
      loopInputs_0_rData_state_elements_6 <= loopInputs_0_payload_state_elements_6;
      loopInputs_0_rData_state_elements_7 <= loopInputs_0_payload_state_elements_7;
      loopInputs_0_rData_state_elements_8 <= loopInputs_0_payload_state_elements_8;
      loopInputs_0_rData_state_elements_9 <= loopInputs_0_payload_state_elements_9;
      loopInputs_0_rData_state_elements_10 <= loopInputs_0_payload_state_elements_10;
      loopInputs_0_rData_state_elements_11 <= loopInputs_0_payload_state_elements_11;
    end
    if(loopInputs_1_ready) begin
      loopInputs_1_rData_round_index <= loopInputs_1_payload_round_index;
      loopInputs_1_rData_state_size <= loopInputs_1_payload_state_size;
      loopInputs_1_rData_state_id <= loopInputs_1_payload_state_id;
      loopInputs_1_rData_state_elements_0 <= loopInputs_1_payload_state_elements_0;
      loopInputs_1_rData_state_elements_1 <= loopInputs_1_payload_state_elements_1;
      loopInputs_1_rData_state_elements_2 <= loopInputs_1_payload_state_elements_2;
      loopInputs_1_rData_state_elements_3 <= loopInputs_1_payload_state_elements_3;
      loopInputs_1_rData_state_elements_4 <= loopInputs_1_payload_state_elements_4;
      loopInputs_1_rData_state_elements_5 <= loopInputs_1_payload_state_elements_5;
      loopInputs_1_rData_state_elements_6 <= loopInputs_1_payload_state_elements_6;
      loopInputs_1_rData_state_elements_7 <= loopInputs_1_payload_state_elements_7;
      loopInputs_1_rData_state_elements_8 <= loopInputs_1_payload_state_elements_8;
      loopInputs_1_rData_state_elements_9 <= loopInputs_1_payload_state_elements_9;
      loopInputs_1_rData_state_elements_10 <= loopInputs_1_payload_state_elements_10;
      loopInputs_1_rData_state_elements_11 <= loopInputs_1_payload_state_elements_11;
    end
    if(loopInputs_2_ready) begin
      loopInputs_2_rData_round_index <= loopInputs_2_payload_round_index;
      loopInputs_2_rData_state_size <= loopInputs_2_payload_state_size;
      loopInputs_2_rData_state_id <= loopInputs_2_payload_state_id;
      loopInputs_2_rData_state_elements_0 <= loopInputs_2_payload_state_elements_0;
      loopInputs_2_rData_state_elements_1 <= loopInputs_2_payload_state_elements_1;
      loopInputs_2_rData_state_elements_2 <= loopInputs_2_payload_state_elements_2;
      loopInputs_2_rData_state_elements_3 <= loopInputs_2_payload_state_elements_3;
      loopInputs_2_rData_state_elements_4 <= loopInputs_2_payload_state_elements_4;
      loopInputs_2_rData_state_elements_5 <= loopInputs_2_payload_state_elements_5;
      loopInputs_2_rData_state_elements_6 <= loopInputs_2_payload_state_elements_6;
      loopInputs_2_rData_state_elements_7 <= loopInputs_2_payload_state_elements_7;
      loopInputs_2_rData_state_elements_8 <= loopInputs_2_payload_state_elements_8;
      loopInputs_2_rData_state_elements_9 <= loopInputs_2_payload_state_elements_9;
      loopInputs_2_rData_state_elements_10 <= loopInputs_2_payload_state_elements_10;
      loopInputs_2_rData_state_elements_11 <= loopInputs_2_payload_state_elements_11;
    end
  end


endmodule

module AXI4StreamTransmitter (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_last,
  output     [254:0]  io_output_payload,
  input               clk,
  input               reset
);
  wire                streamMux_1_io_output_ready;
  wire                streamDemux_50_io_input_ready;
  wire                streamDemux_50_io_outputs_0_valid;
  wire       [6:0]    streamDemux_50_io_outputs_0_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_element;
  wire                streamDemux_50_io_outputs_1_valid;
  wire       [6:0]    streamDemux_50_io_outputs_1_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_element;
  wire                streamDemux_50_io_outputs_2_valid;
  wire       [6:0]    streamDemux_50_io_outputs_2_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_2_payload_state_element;
  wire                streamDemux_50_io_outputs_3_valid;
  wire       [6:0]    streamDemux_50_io_outputs_3_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_3_payload_state_element;
  wire                streamDemux_50_io_outputs_4_valid;
  wire       [6:0]    streamDemux_50_io_outputs_4_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_4_payload_state_element;
  wire                streamDemux_50_io_outputs_5_valid;
  wire       [6:0]    streamDemux_50_io_outputs_5_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_5_payload_state_element;
  wire                streamDemux_50_io_outputs_6_valid;
  wire       [6:0]    streamDemux_50_io_outputs_6_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_6_payload_state_element;
  wire                streamDemux_50_io_outputs_7_valid;
  wire       [6:0]    streamDemux_50_io_outputs_7_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_7_payload_state_element;
  wire                streamMux_1_io_inputs_0_ready;
  wire                streamMux_1_io_inputs_1_ready;
  wire                streamMux_1_io_inputs_2_ready;
  wire                streamMux_1_io_inputs_3_ready;
  wire                streamMux_1_io_inputs_4_ready;
  wire                streamMux_1_io_inputs_5_ready;
  wire                streamMux_1_io_inputs_6_ready;
  wire                streamMux_1_io_inputs_7_ready;
  wire                streamMux_1_io_output_valid;
  wire       [6:0]    streamMux_1_io_output_payload_state_id;
  wire       [254:0]  streamMux_1_io_output_payload_state_element;
  wire       [7:0]    _zz__zz_demux_select_1;
  reg        [6:0]    idCounter;
  wire                when_AXI4StreamInterface_l101;
  wire                input_demux_0_valid;
  reg                 input_demux_0_ready;
  wire       [6:0]    input_demux_0_payload_state_id;
  wire       [254:0]  input_demux_0_payload_state_element;
  wire                input_demux_1_valid;
  reg                 input_demux_1_ready;
  wire       [6:0]    input_demux_1_payload_state_id;
  wire       [254:0]  input_demux_1_payload_state_element;
  wire                input_demux_2_valid;
  reg                 input_demux_2_ready;
  wire       [6:0]    input_demux_2_payload_state_id;
  wire       [254:0]  input_demux_2_payload_state_element;
  wire                input_demux_3_valid;
  reg                 input_demux_3_ready;
  wire       [6:0]    input_demux_3_payload_state_id;
  wire       [254:0]  input_demux_3_payload_state_element;
  wire                input_demux_4_valid;
  reg                 input_demux_4_ready;
  wire       [6:0]    input_demux_4_payload_state_id;
  wire       [254:0]  input_demux_4_payload_state_element;
  wire                input_demux_5_valid;
  reg                 input_demux_5_ready;
  wire       [6:0]    input_demux_5_payload_state_id;
  wire       [254:0]  input_demux_5_payload_state_element;
  wire                input_demux_6_valid;
  reg                 input_demux_6_ready;
  wire       [6:0]    input_demux_6_payload_state_id;
  wire       [254:0]  input_demux_6_payload_state_element;
  wire                input_demux_7_valid;
  reg                 input_demux_7_ready;
  wire       [6:0]    input_demux_7_payload_state_id;
  wire       [254:0]  input_demux_7_payload_state_element;
  wire       [7:0]    _zz_demux_select;
  wire       [7:0]    _zz_demux_select_1;
  wire                _zz_demux_select_2;
  wire                _zz_demux_select_3;
  wire                _zz_demux_select_4;
  wire                _zz_demux_select_5;
  wire                _zz_demux_select_6;
  wire                _zz_demux_select_7;
  wire                _zz_demux_select_8;
  wire       [2:0]    demux_select;
  wire                buffer_0_valid;
  wire                buffer_0_ready;
  wire       [6:0]    buffer_0_payload_state_id;
  wire       [254:0]  buffer_0_payload_state_element;
  reg                 input_demux_0_rValid;
  reg        [6:0]    input_demux_0_rData_state_id;
  reg        [254:0]  input_demux_0_rData_state_element;
  wire                when_Stream_l342;
  wire                buffer_1_valid;
  wire                buffer_1_ready;
  wire       [6:0]    buffer_1_payload_state_id;
  wire       [254:0]  buffer_1_payload_state_element;
  reg                 input_demux_1_rValid;
  reg        [6:0]    input_demux_1_rData_state_id;
  reg        [254:0]  input_demux_1_rData_state_element;
  wire                when_Stream_l342_1;
  wire                buffer_2_valid;
  wire                buffer_2_ready;
  wire       [6:0]    buffer_2_payload_state_id;
  wire       [254:0]  buffer_2_payload_state_element;
  reg                 input_demux_2_rValid;
  reg        [6:0]    input_demux_2_rData_state_id;
  reg        [254:0]  input_demux_2_rData_state_element;
  wire                when_Stream_l342_2;
  wire                buffer_3_valid;
  wire                buffer_3_ready;
  wire       [6:0]    buffer_3_payload_state_id;
  wire       [254:0]  buffer_3_payload_state_element;
  reg                 input_demux_3_rValid;
  reg        [6:0]    input_demux_3_rData_state_id;
  reg        [254:0]  input_demux_3_rData_state_element;
  wire                when_Stream_l342_3;
  wire                buffer_4_valid;
  wire                buffer_4_ready;
  wire       [6:0]    buffer_4_payload_state_id;
  wire       [254:0]  buffer_4_payload_state_element;
  reg                 input_demux_4_rValid;
  reg        [6:0]    input_demux_4_rData_state_id;
  reg        [254:0]  input_demux_4_rData_state_element;
  wire                when_Stream_l342_4;
  wire                buffer_5_valid;
  wire                buffer_5_ready;
  wire       [6:0]    buffer_5_payload_state_id;
  wire       [254:0]  buffer_5_payload_state_element;
  reg                 input_demux_5_rValid;
  reg        [6:0]    input_demux_5_rData_state_id;
  reg        [254:0]  input_demux_5_rData_state_element;
  wire                when_Stream_l342_5;
  wire                buffer_6_valid;
  wire                buffer_6_ready;
  wire       [6:0]    buffer_6_payload_state_id;
  wire       [254:0]  buffer_6_payload_state_element;
  reg                 input_demux_6_rValid;
  reg        [6:0]    input_demux_6_rData_state_id;
  reg        [254:0]  input_demux_6_rData_state_element;
  wire                when_Stream_l342_6;
  wire                buffer_7_valid;
  wire                buffer_7_ready;
  wire       [6:0]    buffer_7_payload_state_id;
  wire       [254:0]  buffer_7_payload_state_element;
  reg                 input_demux_7_rValid;
  reg        [6:0]    input_demux_7_rData_state_id;
  reg        [254:0]  input_demux_7_rData_state_element;
  wire                when_Stream_l342_7;
  wire                _zz_select;
  wire                _zz_select_1;
  wire                _zz_select_2;
  wire                _zz_select_3;
  wire                _zz_select_4;
  wire                _zz_select_5;
  wire                _zz_select_6;
  wire       [2:0]    select_1;

  assign _zz__zz_demux_select_1 = (_zz_demux_select - 8'h01);
  StreamDemux_48 streamDemux_50 (
    .io_select                             (demux_select                                       ), //i
    .io_input_valid                        (io_input_valid                                     ), //i
    .io_input_ready                        (streamDemux_50_io_input_ready                      ), //o
    .io_input_payload_state_id             (io_input_payload_state_id                          ), //i
    .io_input_payload_state_element        (io_input_payload_state_element                     ), //i
    .io_outputs_0_valid                    (streamDemux_50_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (input_demux_0_ready                                ), //i
    .io_outputs_0_payload_state_id         (streamDemux_50_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (streamDemux_50_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (streamDemux_50_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (input_demux_1_ready                                ), //i
    .io_outputs_1_payload_state_id         (streamDemux_50_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (streamDemux_50_io_outputs_1_payload_state_element  ), //o
    .io_outputs_2_valid                    (streamDemux_50_io_outputs_2_valid                  ), //o
    .io_outputs_2_ready                    (input_demux_2_ready                                ), //i
    .io_outputs_2_payload_state_id         (streamDemux_50_io_outputs_2_payload_state_id       ), //o
    .io_outputs_2_payload_state_element    (streamDemux_50_io_outputs_2_payload_state_element  ), //o
    .io_outputs_3_valid                    (streamDemux_50_io_outputs_3_valid                  ), //o
    .io_outputs_3_ready                    (input_demux_3_ready                                ), //i
    .io_outputs_3_payload_state_id         (streamDemux_50_io_outputs_3_payload_state_id       ), //o
    .io_outputs_3_payload_state_element    (streamDemux_50_io_outputs_3_payload_state_element  ), //o
    .io_outputs_4_valid                    (streamDemux_50_io_outputs_4_valid                  ), //o
    .io_outputs_4_ready                    (input_demux_4_ready                                ), //i
    .io_outputs_4_payload_state_id         (streamDemux_50_io_outputs_4_payload_state_id       ), //o
    .io_outputs_4_payload_state_element    (streamDemux_50_io_outputs_4_payload_state_element  ), //o
    .io_outputs_5_valid                    (streamDemux_50_io_outputs_5_valid                  ), //o
    .io_outputs_5_ready                    (input_demux_5_ready                                ), //i
    .io_outputs_5_payload_state_id         (streamDemux_50_io_outputs_5_payload_state_id       ), //o
    .io_outputs_5_payload_state_element    (streamDemux_50_io_outputs_5_payload_state_element  ), //o
    .io_outputs_6_valid                    (streamDemux_50_io_outputs_6_valid                  ), //o
    .io_outputs_6_ready                    (input_demux_6_ready                                ), //i
    .io_outputs_6_payload_state_id         (streamDemux_50_io_outputs_6_payload_state_id       ), //o
    .io_outputs_6_payload_state_element    (streamDemux_50_io_outputs_6_payload_state_element  ), //o
    .io_outputs_7_valid                    (streamDemux_50_io_outputs_7_valid                  ), //o
    .io_outputs_7_ready                    (input_demux_7_ready                                ), //i
    .io_outputs_7_payload_state_id         (streamDemux_50_io_outputs_7_payload_state_id       ), //o
    .io_outputs_7_payload_state_element    (streamDemux_50_io_outputs_7_payload_state_element  )  //o
  );
  StreamMux streamMux_1 (
    .io_select                            (select_1                                     ), //i
    .io_inputs_0_valid                    (buffer_0_valid                               ), //i
    .io_inputs_0_ready                    (streamMux_1_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_state_id         (buffer_0_payload_state_id                    ), //i
    .io_inputs_0_payload_state_element    (buffer_0_payload_state_element               ), //i
    .io_inputs_1_valid                    (buffer_1_valid                               ), //i
    .io_inputs_1_ready                    (streamMux_1_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_state_id         (buffer_1_payload_state_id                    ), //i
    .io_inputs_1_payload_state_element    (buffer_1_payload_state_element               ), //i
    .io_inputs_2_valid                    (buffer_2_valid                               ), //i
    .io_inputs_2_ready                    (streamMux_1_io_inputs_2_ready                ), //o
    .io_inputs_2_payload_state_id         (buffer_2_payload_state_id                    ), //i
    .io_inputs_2_payload_state_element    (buffer_2_payload_state_element               ), //i
    .io_inputs_3_valid                    (buffer_3_valid                               ), //i
    .io_inputs_3_ready                    (streamMux_1_io_inputs_3_ready                ), //o
    .io_inputs_3_payload_state_id         (buffer_3_payload_state_id                    ), //i
    .io_inputs_3_payload_state_element    (buffer_3_payload_state_element               ), //i
    .io_inputs_4_valid                    (buffer_4_valid                               ), //i
    .io_inputs_4_ready                    (streamMux_1_io_inputs_4_ready                ), //o
    .io_inputs_4_payload_state_id         (buffer_4_payload_state_id                    ), //i
    .io_inputs_4_payload_state_element    (buffer_4_payload_state_element               ), //i
    .io_inputs_5_valid                    (buffer_5_valid                               ), //i
    .io_inputs_5_ready                    (streamMux_1_io_inputs_5_ready                ), //o
    .io_inputs_5_payload_state_id         (buffer_5_payload_state_id                    ), //i
    .io_inputs_5_payload_state_element    (buffer_5_payload_state_element               ), //i
    .io_inputs_6_valid                    (buffer_6_valid                               ), //i
    .io_inputs_6_ready                    (streamMux_1_io_inputs_6_ready                ), //o
    .io_inputs_6_payload_state_id         (buffer_6_payload_state_id                    ), //i
    .io_inputs_6_payload_state_element    (buffer_6_payload_state_element               ), //i
    .io_inputs_7_valid                    (buffer_7_valid                               ), //i
    .io_inputs_7_ready                    (streamMux_1_io_inputs_7_ready                ), //o
    .io_inputs_7_payload_state_id         (buffer_7_payload_state_id                    ), //i
    .io_inputs_7_payload_state_element    (buffer_7_payload_state_element               ), //i
    .io_output_valid                      (streamMux_1_io_output_valid                  ), //o
    .io_output_ready                      (streamMux_1_io_output_ready                  ), //i
    .io_output_payload_state_id           (streamMux_1_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamMux_1_io_output_payload_state_element  )  //o
  );
  assign when_AXI4StreamInterface_l101 = (io_output_valid && io_output_ready);
  assign _zz_demux_select = {input_demux_7_ready,{input_demux_6_ready,{input_demux_5_ready,{input_demux_4_ready,{input_demux_3_ready,{input_demux_2_ready,{input_demux_1_ready,input_demux_0_ready}}}}}}};
  assign _zz_demux_select_1 = (_zz_demux_select & (~ _zz__zz_demux_select_1));
  assign _zz_demux_select_2 = _zz_demux_select_1[3];
  assign _zz_demux_select_3 = _zz_demux_select_1[5];
  assign _zz_demux_select_4 = _zz_demux_select_1[6];
  assign _zz_demux_select_5 = _zz_demux_select_1[7];
  assign _zz_demux_select_6 = (((_zz_demux_select_1[1] || _zz_demux_select_2) || _zz_demux_select_3) || _zz_demux_select_5);
  assign _zz_demux_select_7 = (((_zz_demux_select_1[2] || _zz_demux_select_2) || _zz_demux_select_4) || _zz_demux_select_5);
  assign _zz_demux_select_8 = (((_zz_demux_select_1[4] || _zz_demux_select_3) || _zz_demux_select_4) || _zz_demux_select_5);
  assign demux_select = {_zz_demux_select_8,{_zz_demux_select_7,_zz_demux_select_6}};
  assign io_input_ready = streamDemux_50_io_input_ready;
  assign input_demux_0_valid = streamDemux_50_io_outputs_0_valid;
  assign input_demux_0_payload_state_id = streamDemux_50_io_outputs_0_payload_state_id;
  assign input_demux_0_payload_state_element = streamDemux_50_io_outputs_0_payload_state_element;
  assign input_demux_1_valid = streamDemux_50_io_outputs_1_valid;
  assign input_demux_1_payload_state_id = streamDemux_50_io_outputs_1_payload_state_id;
  assign input_demux_1_payload_state_element = streamDemux_50_io_outputs_1_payload_state_element;
  assign input_demux_2_valid = streamDemux_50_io_outputs_2_valid;
  assign input_demux_2_payload_state_id = streamDemux_50_io_outputs_2_payload_state_id;
  assign input_demux_2_payload_state_element = streamDemux_50_io_outputs_2_payload_state_element;
  assign input_demux_3_valid = streamDemux_50_io_outputs_3_valid;
  assign input_demux_3_payload_state_id = streamDemux_50_io_outputs_3_payload_state_id;
  assign input_demux_3_payload_state_element = streamDemux_50_io_outputs_3_payload_state_element;
  assign input_demux_4_valid = streamDemux_50_io_outputs_4_valid;
  assign input_demux_4_payload_state_id = streamDemux_50_io_outputs_4_payload_state_id;
  assign input_demux_4_payload_state_element = streamDemux_50_io_outputs_4_payload_state_element;
  assign input_demux_5_valid = streamDemux_50_io_outputs_5_valid;
  assign input_demux_5_payload_state_id = streamDemux_50_io_outputs_5_payload_state_id;
  assign input_demux_5_payload_state_element = streamDemux_50_io_outputs_5_payload_state_element;
  assign input_demux_6_valid = streamDemux_50_io_outputs_6_valid;
  assign input_demux_6_payload_state_id = streamDemux_50_io_outputs_6_payload_state_id;
  assign input_demux_6_payload_state_element = streamDemux_50_io_outputs_6_payload_state_element;
  assign input_demux_7_valid = streamDemux_50_io_outputs_7_valid;
  assign input_demux_7_payload_state_id = streamDemux_50_io_outputs_7_payload_state_id;
  assign input_demux_7_payload_state_element = streamDemux_50_io_outputs_7_payload_state_element;
  always @(*) begin
    input_demux_0_ready = buffer_0_ready;
    if(when_Stream_l342) begin
      input_demux_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! buffer_0_valid);
  assign buffer_0_valid = input_demux_0_rValid;
  assign buffer_0_payload_state_id = input_demux_0_rData_state_id;
  assign buffer_0_payload_state_element = input_demux_0_rData_state_element;
  always @(*) begin
    input_demux_1_ready = buffer_1_ready;
    if(when_Stream_l342_1) begin
      input_demux_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! buffer_1_valid);
  assign buffer_1_valid = input_demux_1_rValid;
  assign buffer_1_payload_state_id = input_demux_1_rData_state_id;
  assign buffer_1_payload_state_element = input_demux_1_rData_state_element;
  always @(*) begin
    input_demux_2_ready = buffer_2_ready;
    if(when_Stream_l342_2) begin
      input_demux_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! buffer_2_valid);
  assign buffer_2_valid = input_demux_2_rValid;
  assign buffer_2_payload_state_id = input_demux_2_rData_state_id;
  assign buffer_2_payload_state_element = input_demux_2_rData_state_element;
  always @(*) begin
    input_demux_3_ready = buffer_3_ready;
    if(when_Stream_l342_3) begin
      input_demux_3_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! buffer_3_valid);
  assign buffer_3_valid = input_demux_3_rValid;
  assign buffer_3_payload_state_id = input_demux_3_rData_state_id;
  assign buffer_3_payload_state_element = input_demux_3_rData_state_element;
  always @(*) begin
    input_demux_4_ready = buffer_4_ready;
    if(when_Stream_l342_4) begin
      input_demux_4_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! buffer_4_valid);
  assign buffer_4_valid = input_demux_4_rValid;
  assign buffer_4_payload_state_id = input_demux_4_rData_state_id;
  assign buffer_4_payload_state_element = input_demux_4_rData_state_element;
  always @(*) begin
    input_demux_5_ready = buffer_5_ready;
    if(when_Stream_l342_5) begin
      input_demux_5_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! buffer_5_valid);
  assign buffer_5_valid = input_demux_5_rValid;
  assign buffer_5_payload_state_id = input_demux_5_rData_state_id;
  assign buffer_5_payload_state_element = input_demux_5_rData_state_element;
  always @(*) begin
    input_demux_6_ready = buffer_6_ready;
    if(when_Stream_l342_6) begin
      input_demux_6_ready = 1'b1;
    end
  end

  assign when_Stream_l342_6 = (! buffer_6_valid);
  assign buffer_6_valid = input_demux_6_rValid;
  assign buffer_6_payload_state_id = input_demux_6_rData_state_id;
  assign buffer_6_payload_state_element = input_demux_6_rData_state_element;
  always @(*) begin
    input_demux_7_ready = buffer_7_ready;
    if(when_Stream_l342_7) begin
      input_demux_7_ready = 1'b1;
    end
  end

  assign when_Stream_l342_7 = (! buffer_7_valid);
  assign buffer_7_valid = input_demux_7_rValid;
  assign buffer_7_payload_state_id = input_demux_7_rData_state_id;
  assign buffer_7_payload_state_element = input_demux_7_rData_state_element;
  assign _zz_select = (buffer_3_valid && (buffer_3_payload_state_id == idCounter));
  assign _zz_select_1 = (buffer_5_valid && (buffer_5_payload_state_id == idCounter));
  assign _zz_select_2 = (buffer_6_valid && (buffer_6_payload_state_id == idCounter));
  assign _zz_select_3 = (buffer_7_valid && (buffer_7_payload_state_id == idCounter));
  assign _zz_select_4 = ((((buffer_1_valid && (buffer_1_payload_state_id == idCounter)) || _zz_select) || _zz_select_1) || _zz_select_3);
  assign _zz_select_5 = ((((buffer_2_valid && (buffer_2_payload_state_id == idCounter)) || _zz_select) || _zz_select_2) || _zz_select_3);
  assign _zz_select_6 = ((((buffer_4_valid && (buffer_4_payload_state_id == idCounter)) || _zz_select_1) || _zz_select_2) || _zz_select_3);
  assign select_1 = {_zz_select_6,{_zz_select_5,_zz_select_4}};
  assign buffer_0_ready = streamMux_1_io_inputs_0_ready;
  assign buffer_1_ready = streamMux_1_io_inputs_1_ready;
  assign buffer_2_ready = streamMux_1_io_inputs_2_ready;
  assign buffer_3_ready = streamMux_1_io_inputs_3_ready;
  assign buffer_4_ready = streamMux_1_io_inputs_4_ready;
  assign buffer_5_ready = streamMux_1_io_inputs_5_ready;
  assign buffer_6_ready = streamMux_1_io_inputs_6_ready;
  assign buffer_7_ready = streamMux_1_io_inputs_7_ready;
  assign io_output_valid = (streamMux_1_io_output_valid && (streamMux_1_io_output_payload_state_id == idCounter));
  assign io_output_last = 1'b1;
  assign io_output_payload = streamMux_1_io_output_payload_state_element;
  assign streamMux_1_io_output_ready = (io_output_ready && (streamMux_1_io_output_payload_state_id == idCounter));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      idCounter <= 7'h0;
      input_demux_0_rValid <= 1'b0;
      input_demux_1_rValid <= 1'b0;
      input_demux_2_rValid <= 1'b0;
      input_demux_3_rValid <= 1'b0;
      input_demux_4_rValid <= 1'b0;
      input_demux_5_rValid <= 1'b0;
      input_demux_6_rValid <= 1'b0;
      input_demux_7_rValid <= 1'b0;
    end else begin
      if(when_AXI4StreamInterface_l101) begin
        idCounter <= (idCounter + 7'h01);
      end
      if(input_demux_0_ready) begin
        input_demux_0_rValid <= input_demux_0_valid;
      end
      if(input_demux_1_ready) begin
        input_demux_1_rValid <= input_demux_1_valid;
      end
      if(input_demux_2_ready) begin
        input_demux_2_rValid <= input_demux_2_valid;
      end
      if(input_demux_3_ready) begin
        input_demux_3_rValid <= input_demux_3_valid;
      end
      if(input_demux_4_ready) begin
        input_demux_4_rValid <= input_demux_4_valid;
      end
      if(input_demux_5_ready) begin
        input_demux_5_rValid <= input_demux_5_valid;
      end
      if(input_demux_6_ready) begin
        input_demux_6_rValid <= input_demux_6_valid;
      end
      if(input_demux_7_ready) begin
        input_demux_7_rValid <= input_demux_7_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(input_demux_0_ready) begin
      input_demux_0_rData_state_id <= input_demux_0_payload_state_id;
      input_demux_0_rData_state_element <= input_demux_0_payload_state_element;
    end
    if(input_demux_1_ready) begin
      input_demux_1_rData_state_id <= input_demux_1_payload_state_id;
      input_demux_1_rData_state_element <= input_demux_1_payload_state_element;
    end
    if(input_demux_2_ready) begin
      input_demux_2_rData_state_id <= input_demux_2_payload_state_id;
      input_demux_2_rData_state_element <= input_demux_2_payload_state_element;
    end
    if(input_demux_3_ready) begin
      input_demux_3_rData_state_id <= input_demux_3_payload_state_id;
      input_demux_3_rData_state_element <= input_demux_3_payload_state_element;
    end
    if(input_demux_4_ready) begin
      input_demux_4_rData_state_id <= input_demux_4_payload_state_id;
      input_demux_4_rData_state_element <= input_demux_4_payload_state_element;
    end
    if(input_demux_5_ready) begin
      input_demux_5_rData_state_id <= input_demux_5_payload_state_id;
      input_demux_5_rData_state_element <= input_demux_5_payload_state_element;
    end
    if(input_demux_6_ready) begin
      input_demux_6_rData_state_id <= input_demux_6_payload_state_id;
      input_demux_6_rData_state_element <= input_demux_6_payload_state_element;
    end
    if(input_demux_7_ready) begin
      input_demux_7_rData_state_id <= input_demux_7_payload_state_id;
      input_demux_7_rData_state_element <= input_demux_7_payload_state_element;
    end
  end


endmodule

module StreamArbiter_48 (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_state_id,
  input      [254:0]  io_inputs_0_payload_state_element,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [6:0]    io_inputs_1_payload_state_id,
  input      [254:0]  io_inputs_1_payload_state_element,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [6:0]    io_inputs_2_payload_state_id,
  input      [254:0]  io_inputs_2_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element,
  output     [1:0]    io_chosen,
  output     [2:0]    io_chosenOH,
  input               clk,
  input               reset
);
  wire       [2:0]    _zz__zz_maskProposal_1_1;
  reg        [6:0]    _zz_io_output_payload_state_id_1;
  reg        [254:0]  _zz_io_output_payload_state_element;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  wire                maskProposal_2;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  reg                 maskLocked_2;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire                maskRouted_2;
  wire       [2:0]    _zz_maskProposal_1;
  wire       [2:0]    _zz_maskProposal_1_1;
  wire                io_output_fire;
  wire       [1:0]    _zz_io_output_payload_state_id;
  wire                _zz_io_chosen;
  wire                _zz_io_chosen_1;

  assign _zz__zz_maskProposal_1_1 = (_zz_maskProposal_1 - 3'b001);
  always @(*) begin
    case(_zz_io_output_payload_state_id)
      2'b00 : begin
        _zz_io_output_payload_state_id_1 = io_inputs_0_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_0_payload_state_element;
      end
      2'b01 : begin
        _zz_io_output_payload_state_id_1 = io_inputs_1_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_1_payload_state_element;
      end
      default : begin
        _zz_io_output_payload_state_id_1 = io_inputs_2_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_2_payload_state_element;
      end
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign _zz_maskProposal_1 = {io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}};
  assign _zz_maskProposal_1_1 = (_zz_maskProposal_1 & (~ _zz__zz_maskProposal_1_1));
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_maskProposal_1_1[1];
  assign maskProposal_2 = _zz_maskProposal_1_1[2];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2));
  assign _zz_io_output_payload_state_id = {maskRouted_2,maskRouted_1};
  assign io_output_payload_state_id = _zz_io_output_payload_state_id_1;
  assign io_output_payload_state_element = _zz_io_output_payload_state_element;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_inputs_2_ready = (maskRouted_2 && io_output_ready);
  assign io_chosenOH = {maskRouted_2,{maskRouted_1,maskRouted_0}};
  assign _zz_io_chosen = io_chosenOH[1];
  assign _zz_io_chosen_1 = io_chosenOH[2];
  assign io_chosen = {_zz_io_chosen_1,_zz_io_chosen};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_output_valid) begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
      maskLocked_2 <= maskRouted_2;
    end
  end


endmodule

module PoseidonLoop_2 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element,
  input               clk,
  input               reset
);
  wire                streamArbiter_49_io_inputs_0_ready;
  wire                streamArbiter_49_io_inputs_1_ready;
  wire                streamArbiter_49_io_output_valid;
  wire       [6:0]    streamArbiter_49_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_49_io_output_payload_state_size;
  wire       [6:0]    streamArbiter_49_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_0;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_1;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_2;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_3;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_4;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_5;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_6;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_7;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_8;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_9;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_10;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_11;
  wire       [0:0]    streamArbiter_49_io_chosen;
  wire       [1:0]    streamArbiter_49_io_chosenOH;
  wire                poseidonSerializer_3_io_parallelInput_ready;
  wire                poseidonSerializer_3_io_serialOutput_valid;
  wire       [6:0]    poseidonSerializer_3_io_serialOutput_payload_round_index;
  wire       [3:0]    poseidonSerializer_3_io_serialOutput_payload_state_index;
  wire       [3:0]    poseidonSerializer_3_io_serialOutput_payload_state_size;
  wire       [6:0]    poseidonSerializer_3_io_serialOutput_payload_state_id;
  wire       [254:0]  poseidonSerializer_3_io_serialOutput_payload_state_element;
  wire                poseidonThread_3_io_input_ready;
  wire                poseidonThread_3_io_output_valid;
  wire       [6:0]    poseidonThread_3_io_output_payload_round_index;
  wire       [3:0]    poseidonThread_3_io_output_payload_state_size;
  wire       [6:0]    poseidonThread_3_io_output_payload_state_id;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_0;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_1;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_2;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_3;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_4;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_5;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_6;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_7;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_8;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_9;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_10;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_11;
  wire                demuxInst_io_input_ready;
  wire                demuxInst_io_output0_valid;
  wire       [6:0]    demuxInst_io_output0_payload_round_index;
  wire       [3:0]    demuxInst_io_output0_payload_state_size;
  wire       [6:0]    demuxInst_io_output0_payload_state_id;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_0;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_1;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_2;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_3;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_4;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_5;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_6;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_7;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_8;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_9;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_10;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_11;
  wire                demuxInst_io_output1_valid;
  wire       [6:0]    demuxInst_io_output1_payload_state_id;
  wire       [254:0]  demuxInst_io_output1_payload_state_element;
  wire                demuxInst_io_output0_fifo_io_push_ready;
  wire                demuxInst_io_output0_fifo_io_pop_valid;
  wire       [6:0]    demuxInst_io_output0_fifo_io_pop_payload_round_index;
  wire       [3:0]    demuxInst_io_output0_fifo_io_pop_payload_state_size;
  wire       [6:0]    demuxInst_io_output0_fifo_io_pop_payload_state_id;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_0;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_1;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_2;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_3;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_4;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_5;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_6;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_7;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_8;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_9;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_10;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_11;
  wire       [2:0]    demuxInst_io_output0_fifo_io_occupancy;
  wire       [2:0]    demuxInst_io_output0_fifo_io_availability;
  wire                loopback_valid;
  wire                loopback_ready;
  wire       [6:0]    loopback_payload_round_index;
  wire       [3:0]    loopback_payload_state_size;
  wire       [6:0]    loopback_payload_state_id;
  wire       [254:0]  loopback_payload_state_elements_0;
  wire       [254:0]  loopback_payload_state_elements_1;
  wire       [254:0]  loopback_payload_state_elements_2;
  wire       [254:0]  loopback_payload_state_elements_3;
  wire       [254:0]  loopback_payload_state_elements_4;
  wire       [254:0]  loopback_payload_state_elements_5;
  wire       [254:0]  loopback_payload_state_elements_6;
  wire       [254:0]  loopback_payload_state_elements_7;
  wire       [254:0]  loopback_payload_state_elements_8;
  wire       [254:0]  loopback_payload_state_elements_9;
  wire       [254:0]  loopback_payload_state_elements_10;
  wire       [254:0]  loopback_payload_state_elements_11;

  StreamArbiter_45 streamArbiter_49 (
    .io_inputs_0_valid                        (loopback_valid                                        ), //i
    .io_inputs_0_ready                        (streamArbiter_49_io_inputs_0_ready                    ), //o
    .io_inputs_0_payload_round_index          (loopback_payload_round_index                          ), //i
    .io_inputs_0_payload_state_size           (loopback_payload_state_size                           ), //i
    .io_inputs_0_payload_state_id             (loopback_payload_state_id                             ), //i
    .io_inputs_0_payload_state_elements_0     (loopback_payload_state_elements_0                     ), //i
    .io_inputs_0_payload_state_elements_1     (loopback_payload_state_elements_1                     ), //i
    .io_inputs_0_payload_state_elements_2     (loopback_payload_state_elements_2                     ), //i
    .io_inputs_0_payload_state_elements_3     (loopback_payload_state_elements_3                     ), //i
    .io_inputs_0_payload_state_elements_4     (loopback_payload_state_elements_4                     ), //i
    .io_inputs_0_payload_state_elements_5     (loopback_payload_state_elements_5                     ), //i
    .io_inputs_0_payload_state_elements_6     (loopback_payload_state_elements_6                     ), //i
    .io_inputs_0_payload_state_elements_7     (loopback_payload_state_elements_7                     ), //i
    .io_inputs_0_payload_state_elements_8     (loopback_payload_state_elements_8                     ), //i
    .io_inputs_0_payload_state_elements_9     (loopback_payload_state_elements_9                     ), //i
    .io_inputs_0_payload_state_elements_10    (loopback_payload_state_elements_10                    ), //i
    .io_inputs_0_payload_state_elements_11    (loopback_payload_state_elements_11                    ), //i
    .io_inputs_1_valid                        (io_input_valid                                        ), //i
    .io_inputs_1_ready                        (streamArbiter_49_io_inputs_1_ready                    ), //o
    .io_inputs_1_payload_round_index          (io_input_payload_round_index                          ), //i
    .io_inputs_1_payload_state_size           (io_input_payload_state_size                           ), //i
    .io_inputs_1_payload_state_id             (io_input_payload_state_id                             ), //i
    .io_inputs_1_payload_state_elements_0     (io_input_payload_state_elements_0                     ), //i
    .io_inputs_1_payload_state_elements_1     (io_input_payload_state_elements_1                     ), //i
    .io_inputs_1_payload_state_elements_2     (io_input_payload_state_elements_2                     ), //i
    .io_inputs_1_payload_state_elements_3     (io_input_payload_state_elements_3                     ), //i
    .io_inputs_1_payload_state_elements_4     (io_input_payload_state_elements_4                     ), //i
    .io_inputs_1_payload_state_elements_5     (io_input_payload_state_elements_5                     ), //i
    .io_inputs_1_payload_state_elements_6     (io_input_payload_state_elements_6                     ), //i
    .io_inputs_1_payload_state_elements_7     (io_input_payload_state_elements_7                     ), //i
    .io_inputs_1_payload_state_elements_8     (io_input_payload_state_elements_8                     ), //i
    .io_inputs_1_payload_state_elements_9     (io_input_payload_state_elements_9                     ), //i
    .io_inputs_1_payload_state_elements_10    (io_input_payload_state_elements_10                    ), //i
    .io_inputs_1_payload_state_elements_11    (io_input_payload_state_elements_11                    ), //i
    .io_output_valid                          (streamArbiter_49_io_output_valid                      ), //o
    .io_output_ready                          (poseidonSerializer_3_io_parallelInput_ready           ), //i
    .io_output_payload_round_index            (streamArbiter_49_io_output_payload_round_index        ), //o
    .io_output_payload_state_size             (streamArbiter_49_io_output_payload_state_size         ), //o
    .io_output_payload_state_id               (streamArbiter_49_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0       (streamArbiter_49_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1       (streamArbiter_49_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2       (streamArbiter_49_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3       (streamArbiter_49_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4       (streamArbiter_49_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5       (streamArbiter_49_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6       (streamArbiter_49_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7       (streamArbiter_49_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8       (streamArbiter_49_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9       (streamArbiter_49_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10      (streamArbiter_49_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11      (streamArbiter_49_io_output_payload_state_elements_11  ), //o
    .io_chosen                                (streamArbiter_49_io_chosen                            ), //o
    .io_chosenOH                              (streamArbiter_49_io_chosenOH                          ), //o
    .clk                                      (clk                                                   ), //i
    .reset                                    (reset                                                 )  //i
  );
  PoseidonSerializer_2 poseidonSerializer_3 (
    .io_parallelInput_valid                        (streamArbiter_49_io_output_valid                            ), //i
    .io_parallelInput_ready                        (poseidonSerializer_3_io_parallelInput_ready                 ), //o
    .io_parallelInput_payload_round_index          (streamArbiter_49_io_output_payload_round_index              ), //i
    .io_parallelInput_payload_state_size           (streamArbiter_49_io_output_payload_state_size               ), //i
    .io_parallelInput_payload_state_id             (streamArbiter_49_io_output_payload_state_id                 ), //i
    .io_parallelInput_payload_state_elements_0     (streamArbiter_49_io_output_payload_state_elements_0         ), //i
    .io_parallelInput_payload_state_elements_1     (streamArbiter_49_io_output_payload_state_elements_1         ), //i
    .io_parallelInput_payload_state_elements_2     (streamArbiter_49_io_output_payload_state_elements_2         ), //i
    .io_parallelInput_payload_state_elements_3     (streamArbiter_49_io_output_payload_state_elements_3         ), //i
    .io_parallelInput_payload_state_elements_4     (streamArbiter_49_io_output_payload_state_elements_4         ), //i
    .io_parallelInput_payload_state_elements_5     (streamArbiter_49_io_output_payload_state_elements_5         ), //i
    .io_parallelInput_payload_state_elements_6     (streamArbiter_49_io_output_payload_state_elements_6         ), //i
    .io_parallelInput_payload_state_elements_7     (streamArbiter_49_io_output_payload_state_elements_7         ), //i
    .io_parallelInput_payload_state_elements_8     (streamArbiter_49_io_output_payload_state_elements_8         ), //i
    .io_parallelInput_payload_state_elements_9     (streamArbiter_49_io_output_payload_state_elements_9         ), //i
    .io_parallelInput_payload_state_elements_10    (streamArbiter_49_io_output_payload_state_elements_10        ), //i
    .io_parallelInput_payload_state_elements_11    (streamArbiter_49_io_output_payload_state_elements_11        ), //i
    .io_serialOutput_valid                         (poseidonSerializer_3_io_serialOutput_valid                  ), //o
    .io_serialOutput_ready                         (poseidonThread_3_io_input_ready                             ), //i
    .io_serialOutput_payload_round_index           (poseidonSerializer_3_io_serialOutput_payload_round_index    ), //o
    .io_serialOutput_payload_state_index           (poseidonSerializer_3_io_serialOutput_payload_state_index    ), //o
    .io_serialOutput_payload_state_size            (poseidonSerializer_3_io_serialOutput_payload_state_size     ), //o
    .io_serialOutput_payload_state_id              (poseidonSerializer_3_io_serialOutput_payload_state_id       ), //o
    .io_serialOutput_payload_state_element         (poseidonSerializer_3_io_serialOutput_payload_state_element  ), //o
    .clk                                           (clk                                                         ), //i
    .reset                                         (reset                                                       )  //i
  );
  PoseidonThread_2 poseidonThread_3 (
    .io_input_valid                         (poseidonSerializer_3_io_serialOutput_valid                  ), //i
    .io_input_ready                         (poseidonThread_3_io_input_ready                             ), //o
    .io_input_payload_round_index           (poseidonSerializer_3_io_serialOutput_payload_round_index    ), //i
    .io_input_payload_state_index           (poseidonSerializer_3_io_serialOutput_payload_state_index    ), //i
    .io_input_payload_state_size            (poseidonSerializer_3_io_serialOutput_payload_state_size     ), //i
    .io_input_payload_state_id              (poseidonSerializer_3_io_serialOutput_payload_state_id       ), //i
    .io_input_payload_state_element         (poseidonSerializer_3_io_serialOutput_payload_state_element  ), //i
    .io_output_valid                        (poseidonThread_3_io_output_valid                            ), //o
    .io_output_ready                        (demuxInst_io_input_ready                                    ), //i
    .io_output_payload_round_index          (poseidonThread_3_io_output_payload_round_index              ), //o
    .io_output_payload_state_size           (poseidonThread_3_io_output_payload_state_size               ), //o
    .io_output_payload_state_id             (poseidonThread_3_io_output_payload_state_id                 ), //o
    .io_output_payload_state_elements_0     (poseidonThread_3_io_output_payload_state_elements_0         ), //o
    .io_output_payload_state_elements_1     (poseidonThread_3_io_output_payload_state_elements_1         ), //o
    .io_output_payload_state_elements_2     (poseidonThread_3_io_output_payload_state_elements_2         ), //o
    .io_output_payload_state_elements_3     (poseidonThread_3_io_output_payload_state_elements_3         ), //o
    .io_output_payload_state_elements_4     (poseidonThread_3_io_output_payload_state_elements_4         ), //o
    .io_output_payload_state_elements_5     (poseidonThread_3_io_output_payload_state_elements_5         ), //o
    .io_output_payload_state_elements_6     (poseidonThread_3_io_output_payload_state_elements_6         ), //o
    .io_output_payload_state_elements_7     (poseidonThread_3_io_output_payload_state_elements_7         ), //o
    .io_output_payload_state_elements_8     (poseidonThread_3_io_output_payload_state_elements_8         ), //o
    .io_output_payload_state_elements_9     (poseidonThread_3_io_output_payload_state_elements_9         ), //o
    .io_output_payload_state_elements_10    (poseidonThread_3_io_output_payload_state_elements_10        ), //o
    .io_output_payload_state_elements_11    (poseidonThread_3_io_output_payload_state_elements_11        ), //o
    .clk                                    (clk                                                         ), //i
    .reset                                  (reset                                                       )  //i
  );
  LoopbackDeMux demuxInst (
    .io_input_valid                          (poseidonThread_3_io_output_valid                      ), //i
    .io_input_ready                          (demuxInst_io_input_ready                              ), //o
    .io_input_payload_round_index            (poseidonThread_3_io_output_payload_round_index        ), //i
    .io_input_payload_state_size             (poseidonThread_3_io_output_payload_state_size         ), //i
    .io_input_payload_state_id               (poseidonThread_3_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0       (poseidonThread_3_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1       (poseidonThread_3_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2       (poseidonThread_3_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3       (poseidonThread_3_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4       (poseidonThread_3_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5       (poseidonThread_3_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6       (poseidonThread_3_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7       (poseidonThread_3_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8       (poseidonThread_3_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9       (poseidonThread_3_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10      (poseidonThread_3_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11      (poseidonThread_3_io_output_payload_state_elements_11  ), //i
    .io_output0_valid                        (demuxInst_io_output0_valid                            ), //o
    .io_output0_ready                        (demuxInst_io_output0_fifo_io_push_ready               ), //i
    .io_output0_payload_round_index          (demuxInst_io_output0_payload_round_index              ), //o
    .io_output0_payload_state_size           (demuxInst_io_output0_payload_state_size               ), //o
    .io_output0_payload_state_id             (demuxInst_io_output0_payload_state_id                 ), //o
    .io_output0_payload_state_elements_0     (demuxInst_io_output0_payload_state_elements_0         ), //o
    .io_output0_payload_state_elements_1     (demuxInst_io_output0_payload_state_elements_1         ), //o
    .io_output0_payload_state_elements_2     (demuxInst_io_output0_payload_state_elements_2         ), //o
    .io_output0_payload_state_elements_3     (demuxInst_io_output0_payload_state_elements_3         ), //o
    .io_output0_payload_state_elements_4     (demuxInst_io_output0_payload_state_elements_4         ), //o
    .io_output0_payload_state_elements_5     (demuxInst_io_output0_payload_state_elements_5         ), //o
    .io_output0_payload_state_elements_6     (demuxInst_io_output0_payload_state_elements_6         ), //o
    .io_output0_payload_state_elements_7     (demuxInst_io_output0_payload_state_elements_7         ), //o
    .io_output0_payload_state_elements_8     (demuxInst_io_output0_payload_state_elements_8         ), //o
    .io_output0_payload_state_elements_9     (demuxInst_io_output0_payload_state_elements_9         ), //o
    .io_output0_payload_state_elements_10    (demuxInst_io_output0_payload_state_elements_10        ), //o
    .io_output0_payload_state_elements_11    (demuxInst_io_output0_payload_state_elements_11        ), //o
    .io_output1_valid                        (demuxInst_io_output1_valid                            ), //o
    .io_output1_ready                        (io_output_ready                                       ), //i
    .io_output1_payload_state_id             (demuxInst_io_output1_payload_state_id                 ), //o
    .io_output1_payload_state_element        (demuxInst_io_output1_payload_state_element            )  //o
  );
  StreamFifo_9 demuxInst_io_output0_fifo (
    .io_push_valid                        (demuxInst_io_output0_valid                                  ), //i
    .io_push_ready                        (demuxInst_io_output0_fifo_io_push_ready                     ), //o
    .io_push_payload_round_index          (demuxInst_io_output0_payload_round_index                    ), //i
    .io_push_payload_state_size           (demuxInst_io_output0_payload_state_size                     ), //i
    .io_push_payload_state_id             (demuxInst_io_output0_payload_state_id                       ), //i
    .io_push_payload_state_elements_0     (demuxInst_io_output0_payload_state_elements_0               ), //i
    .io_push_payload_state_elements_1     (demuxInst_io_output0_payload_state_elements_1               ), //i
    .io_push_payload_state_elements_2     (demuxInst_io_output0_payload_state_elements_2               ), //i
    .io_push_payload_state_elements_3     (demuxInst_io_output0_payload_state_elements_3               ), //i
    .io_push_payload_state_elements_4     (demuxInst_io_output0_payload_state_elements_4               ), //i
    .io_push_payload_state_elements_5     (demuxInst_io_output0_payload_state_elements_5               ), //i
    .io_push_payload_state_elements_6     (demuxInst_io_output0_payload_state_elements_6               ), //i
    .io_push_payload_state_elements_7     (demuxInst_io_output0_payload_state_elements_7               ), //i
    .io_push_payload_state_elements_8     (demuxInst_io_output0_payload_state_elements_8               ), //i
    .io_push_payload_state_elements_9     (demuxInst_io_output0_payload_state_elements_9               ), //i
    .io_push_payload_state_elements_10    (demuxInst_io_output0_payload_state_elements_10              ), //i
    .io_push_payload_state_elements_11    (demuxInst_io_output0_payload_state_elements_11              ), //i
    .io_pop_valid                         (demuxInst_io_output0_fifo_io_pop_valid                      ), //o
    .io_pop_ready                         (loopback_ready                                              ), //i
    .io_pop_payload_round_index           (demuxInst_io_output0_fifo_io_pop_payload_round_index        ), //o
    .io_pop_payload_state_size            (demuxInst_io_output0_fifo_io_pop_payload_state_size         ), //o
    .io_pop_payload_state_id              (demuxInst_io_output0_fifo_io_pop_payload_state_id           ), //o
    .io_pop_payload_state_elements_0      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_0   ), //o
    .io_pop_payload_state_elements_1      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_1   ), //o
    .io_pop_payload_state_elements_2      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_2   ), //o
    .io_pop_payload_state_elements_3      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_3   ), //o
    .io_pop_payload_state_elements_4      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_4   ), //o
    .io_pop_payload_state_elements_5      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_5   ), //o
    .io_pop_payload_state_elements_6      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_6   ), //o
    .io_pop_payload_state_elements_7      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_7   ), //o
    .io_pop_payload_state_elements_8      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_8   ), //o
    .io_pop_payload_state_elements_9      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_9   ), //o
    .io_pop_payload_state_elements_10     (demuxInst_io_output0_fifo_io_pop_payload_state_elements_10  ), //o
    .io_pop_payload_state_elements_11     (demuxInst_io_output0_fifo_io_pop_payload_state_elements_11  ), //o
    .io_flush                             (1'b0                                                        ), //i
    .io_occupancy                         (demuxInst_io_output0_fifo_io_occupancy                      ), //o
    .io_availability                      (demuxInst_io_output0_fifo_io_availability                   ), //o
    .clk                                  (clk                                                         ), //i
    .reset                                (reset                                                       )  //i
  );
  assign loopback_ready = streamArbiter_49_io_inputs_0_ready;
  assign io_input_ready = streamArbiter_49_io_inputs_1_ready;
  assign loopback_valid = demuxInst_io_output0_fifo_io_pop_valid;
  assign loopback_payload_round_index = demuxInst_io_output0_fifo_io_pop_payload_round_index;
  assign loopback_payload_state_size = demuxInst_io_output0_fifo_io_pop_payload_state_size;
  assign loopback_payload_state_id = demuxInst_io_output0_fifo_io_pop_payload_state_id;
  assign loopback_payload_state_elements_0 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_0;
  assign loopback_payload_state_elements_1 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_1;
  assign loopback_payload_state_elements_2 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_2;
  assign loopback_payload_state_elements_3 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_3;
  assign loopback_payload_state_elements_4 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_4;
  assign loopback_payload_state_elements_5 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_5;
  assign loopback_payload_state_elements_6 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_6;
  assign loopback_payload_state_elements_7 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_7;
  assign loopback_payload_state_elements_8 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_8;
  assign loopback_payload_state_elements_9 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_9;
  assign loopback_payload_state_elements_10 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_10;
  assign loopback_payload_state_elements_11 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_11;
  assign io_output_valid = demuxInst_io_output1_valid;
  assign io_output_payload_state_id = demuxInst_io_output1_payload_state_id;
  assign io_output_payload_state_element = demuxInst_io_output1_payload_state_element;

endmodule

module PoseidonLoop_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element,
  input               clk,
  input               reset
);
  wire                streamArbiter_49_io_inputs_0_ready;
  wire                streamArbiter_49_io_inputs_1_ready;
  wire                streamArbiter_49_io_output_valid;
  wire       [6:0]    streamArbiter_49_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_49_io_output_payload_state_size;
  wire       [6:0]    streamArbiter_49_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_0;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_1;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_2;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_3;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_4;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_5;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_6;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_7;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_8;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_9;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_10;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_11;
  wire       [0:0]    streamArbiter_49_io_chosen;
  wire       [1:0]    streamArbiter_49_io_chosenOH;
  wire                poseidonSerializer_3_io_parallelInput_ready;
  wire                poseidonSerializer_3_io_serialOutput_valid;
  wire       [6:0]    poseidonSerializer_3_io_serialOutput_payload_round_index;
  wire       [3:0]    poseidonSerializer_3_io_serialOutput_payload_state_index;
  wire       [3:0]    poseidonSerializer_3_io_serialOutput_payload_state_size;
  wire       [6:0]    poseidonSerializer_3_io_serialOutput_payload_state_id;
  wire       [254:0]  poseidonSerializer_3_io_serialOutput_payload_state_element;
  wire                poseidonThread_3_io_input_ready;
  wire                poseidonThread_3_io_output_valid;
  wire       [6:0]    poseidonThread_3_io_output_payload_round_index;
  wire       [3:0]    poseidonThread_3_io_output_payload_state_size;
  wire       [6:0]    poseidonThread_3_io_output_payload_state_id;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_0;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_1;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_2;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_3;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_4;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_5;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_6;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_7;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_8;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_9;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_10;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_11;
  wire                demuxInst_io_input_ready;
  wire                demuxInst_io_output0_valid;
  wire       [6:0]    demuxInst_io_output0_payload_round_index;
  wire       [3:0]    demuxInst_io_output0_payload_state_size;
  wire       [6:0]    demuxInst_io_output0_payload_state_id;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_0;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_1;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_2;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_3;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_4;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_5;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_6;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_7;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_8;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_9;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_10;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_11;
  wire                demuxInst_io_output1_valid;
  wire       [6:0]    demuxInst_io_output1_payload_state_id;
  wire       [254:0]  demuxInst_io_output1_payload_state_element;
  wire                demuxInst_io_output0_fifo_io_push_ready;
  wire                demuxInst_io_output0_fifo_io_pop_valid;
  wire       [6:0]    demuxInst_io_output0_fifo_io_pop_payload_round_index;
  wire       [3:0]    demuxInst_io_output0_fifo_io_pop_payload_state_size;
  wire       [6:0]    demuxInst_io_output0_fifo_io_pop_payload_state_id;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_0;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_1;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_2;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_3;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_4;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_5;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_6;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_7;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_8;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_9;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_10;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_11;
  wire       [2:0]    demuxInst_io_output0_fifo_io_occupancy;
  wire       [2:0]    demuxInst_io_output0_fifo_io_availability;
  wire                loopback_valid;
  wire                loopback_ready;
  wire       [6:0]    loopback_payload_round_index;
  wire       [3:0]    loopback_payload_state_size;
  wire       [6:0]    loopback_payload_state_id;
  wire       [254:0]  loopback_payload_state_elements_0;
  wire       [254:0]  loopback_payload_state_elements_1;
  wire       [254:0]  loopback_payload_state_elements_2;
  wire       [254:0]  loopback_payload_state_elements_3;
  wire       [254:0]  loopback_payload_state_elements_4;
  wire       [254:0]  loopback_payload_state_elements_5;
  wire       [254:0]  loopback_payload_state_elements_6;
  wire       [254:0]  loopback_payload_state_elements_7;
  wire       [254:0]  loopback_payload_state_elements_8;
  wire       [254:0]  loopback_payload_state_elements_9;
  wire       [254:0]  loopback_payload_state_elements_10;
  wire       [254:0]  loopback_payload_state_elements_11;

  StreamArbiter_45 streamArbiter_49 (
    .io_inputs_0_valid                        (loopback_valid                                        ), //i
    .io_inputs_0_ready                        (streamArbiter_49_io_inputs_0_ready                    ), //o
    .io_inputs_0_payload_round_index          (loopback_payload_round_index                          ), //i
    .io_inputs_0_payload_state_size           (loopback_payload_state_size                           ), //i
    .io_inputs_0_payload_state_id             (loopback_payload_state_id                             ), //i
    .io_inputs_0_payload_state_elements_0     (loopback_payload_state_elements_0                     ), //i
    .io_inputs_0_payload_state_elements_1     (loopback_payload_state_elements_1                     ), //i
    .io_inputs_0_payload_state_elements_2     (loopback_payload_state_elements_2                     ), //i
    .io_inputs_0_payload_state_elements_3     (loopback_payload_state_elements_3                     ), //i
    .io_inputs_0_payload_state_elements_4     (loopback_payload_state_elements_4                     ), //i
    .io_inputs_0_payload_state_elements_5     (loopback_payload_state_elements_5                     ), //i
    .io_inputs_0_payload_state_elements_6     (loopback_payload_state_elements_6                     ), //i
    .io_inputs_0_payload_state_elements_7     (loopback_payload_state_elements_7                     ), //i
    .io_inputs_0_payload_state_elements_8     (loopback_payload_state_elements_8                     ), //i
    .io_inputs_0_payload_state_elements_9     (loopback_payload_state_elements_9                     ), //i
    .io_inputs_0_payload_state_elements_10    (loopback_payload_state_elements_10                    ), //i
    .io_inputs_0_payload_state_elements_11    (loopback_payload_state_elements_11                    ), //i
    .io_inputs_1_valid                        (io_input_valid                                        ), //i
    .io_inputs_1_ready                        (streamArbiter_49_io_inputs_1_ready                    ), //o
    .io_inputs_1_payload_round_index          (io_input_payload_round_index                          ), //i
    .io_inputs_1_payload_state_size           (io_input_payload_state_size                           ), //i
    .io_inputs_1_payload_state_id             (io_input_payload_state_id                             ), //i
    .io_inputs_1_payload_state_elements_0     (io_input_payload_state_elements_0                     ), //i
    .io_inputs_1_payload_state_elements_1     (io_input_payload_state_elements_1                     ), //i
    .io_inputs_1_payload_state_elements_2     (io_input_payload_state_elements_2                     ), //i
    .io_inputs_1_payload_state_elements_3     (io_input_payload_state_elements_3                     ), //i
    .io_inputs_1_payload_state_elements_4     (io_input_payload_state_elements_4                     ), //i
    .io_inputs_1_payload_state_elements_5     (io_input_payload_state_elements_5                     ), //i
    .io_inputs_1_payload_state_elements_6     (io_input_payload_state_elements_6                     ), //i
    .io_inputs_1_payload_state_elements_7     (io_input_payload_state_elements_7                     ), //i
    .io_inputs_1_payload_state_elements_8     (io_input_payload_state_elements_8                     ), //i
    .io_inputs_1_payload_state_elements_9     (io_input_payload_state_elements_9                     ), //i
    .io_inputs_1_payload_state_elements_10    (io_input_payload_state_elements_10                    ), //i
    .io_inputs_1_payload_state_elements_11    (io_input_payload_state_elements_11                    ), //i
    .io_output_valid                          (streamArbiter_49_io_output_valid                      ), //o
    .io_output_ready                          (poseidonSerializer_3_io_parallelInput_ready           ), //i
    .io_output_payload_round_index            (streamArbiter_49_io_output_payload_round_index        ), //o
    .io_output_payload_state_size             (streamArbiter_49_io_output_payload_state_size         ), //o
    .io_output_payload_state_id               (streamArbiter_49_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0       (streamArbiter_49_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1       (streamArbiter_49_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2       (streamArbiter_49_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3       (streamArbiter_49_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4       (streamArbiter_49_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5       (streamArbiter_49_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6       (streamArbiter_49_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7       (streamArbiter_49_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8       (streamArbiter_49_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9       (streamArbiter_49_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10      (streamArbiter_49_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11      (streamArbiter_49_io_output_payload_state_elements_11  ), //o
    .io_chosen                                (streamArbiter_49_io_chosen                            ), //o
    .io_chosenOH                              (streamArbiter_49_io_chosenOH                          ), //o
    .clk                                      (clk                                                   ), //i
    .reset                                    (reset                                                 )  //i
  );
  PoseidonSerializer_1 poseidonSerializer_3 (
    .io_parallelInput_valid                        (streamArbiter_49_io_output_valid                            ), //i
    .io_parallelInput_ready                        (poseidonSerializer_3_io_parallelInput_ready                 ), //o
    .io_parallelInput_payload_round_index          (streamArbiter_49_io_output_payload_round_index              ), //i
    .io_parallelInput_payload_state_size           (streamArbiter_49_io_output_payload_state_size               ), //i
    .io_parallelInput_payload_state_id             (streamArbiter_49_io_output_payload_state_id                 ), //i
    .io_parallelInput_payload_state_elements_0     (streamArbiter_49_io_output_payload_state_elements_0         ), //i
    .io_parallelInput_payload_state_elements_1     (streamArbiter_49_io_output_payload_state_elements_1         ), //i
    .io_parallelInput_payload_state_elements_2     (streamArbiter_49_io_output_payload_state_elements_2         ), //i
    .io_parallelInput_payload_state_elements_3     (streamArbiter_49_io_output_payload_state_elements_3         ), //i
    .io_parallelInput_payload_state_elements_4     (streamArbiter_49_io_output_payload_state_elements_4         ), //i
    .io_parallelInput_payload_state_elements_5     (streamArbiter_49_io_output_payload_state_elements_5         ), //i
    .io_parallelInput_payload_state_elements_6     (streamArbiter_49_io_output_payload_state_elements_6         ), //i
    .io_parallelInput_payload_state_elements_7     (streamArbiter_49_io_output_payload_state_elements_7         ), //i
    .io_parallelInput_payload_state_elements_8     (streamArbiter_49_io_output_payload_state_elements_8         ), //i
    .io_parallelInput_payload_state_elements_9     (streamArbiter_49_io_output_payload_state_elements_9         ), //i
    .io_parallelInput_payload_state_elements_10    (streamArbiter_49_io_output_payload_state_elements_10        ), //i
    .io_parallelInput_payload_state_elements_11    (streamArbiter_49_io_output_payload_state_elements_11        ), //i
    .io_serialOutput_valid                         (poseidonSerializer_3_io_serialOutput_valid                  ), //o
    .io_serialOutput_ready                         (poseidonThread_3_io_input_ready                             ), //i
    .io_serialOutput_payload_round_index           (poseidonSerializer_3_io_serialOutput_payload_round_index    ), //o
    .io_serialOutput_payload_state_index           (poseidonSerializer_3_io_serialOutput_payload_state_index    ), //o
    .io_serialOutput_payload_state_size            (poseidonSerializer_3_io_serialOutput_payload_state_size     ), //o
    .io_serialOutput_payload_state_id              (poseidonSerializer_3_io_serialOutput_payload_state_id       ), //o
    .io_serialOutput_payload_state_element         (poseidonSerializer_3_io_serialOutput_payload_state_element  ), //o
    .clk                                           (clk                                                         ), //i
    .reset                                         (reset                                                       )  //i
  );
  PoseidonThread_1 poseidonThread_3 (
    .io_input_valid                         (poseidonSerializer_3_io_serialOutput_valid                  ), //i
    .io_input_ready                         (poseidonThread_3_io_input_ready                             ), //o
    .io_input_payload_round_index           (poseidonSerializer_3_io_serialOutput_payload_round_index    ), //i
    .io_input_payload_state_index           (poseidonSerializer_3_io_serialOutput_payload_state_index    ), //i
    .io_input_payload_state_size            (poseidonSerializer_3_io_serialOutput_payload_state_size     ), //i
    .io_input_payload_state_id              (poseidonSerializer_3_io_serialOutput_payload_state_id       ), //i
    .io_input_payload_state_element         (poseidonSerializer_3_io_serialOutput_payload_state_element  ), //i
    .io_output_valid                        (poseidonThread_3_io_output_valid                            ), //o
    .io_output_ready                        (demuxInst_io_input_ready                                    ), //i
    .io_output_payload_round_index          (poseidonThread_3_io_output_payload_round_index              ), //o
    .io_output_payload_state_size           (poseidonThread_3_io_output_payload_state_size               ), //o
    .io_output_payload_state_id             (poseidonThread_3_io_output_payload_state_id                 ), //o
    .io_output_payload_state_elements_0     (poseidonThread_3_io_output_payload_state_elements_0         ), //o
    .io_output_payload_state_elements_1     (poseidonThread_3_io_output_payload_state_elements_1         ), //o
    .io_output_payload_state_elements_2     (poseidonThread_3_io_output_payload_state_elements_2         ), //o
    .io_output_payload_state_elements_3     (poseidonThread_3_io_output_payload_state_elements_3         ), //o
    .io_output_payload_state_elements_4     (poseidonThread_3_io_output_payload_state_elements_4         ), //o
    .io_output_payload_state_elements_5     (poseidonThread_3_io_output_payload_state_elements_5         ), //o
    .io_output_payload_state_elements_6     (poseidonThread_3_io_output_payload_state_elements_6         ), //o
    .io_output_payload_state_elements_7     (poseidonThread_3_io_output_payload_state_elements_7         ), //o
    .io_output_payload_state_elements_8     (poseidonThread_3_io_output_payload_state_elements_8         ), //o
    .io_output_payload_state_elements_9     (poseidonThread_3_io_output_payload_state_elements_9         ), //o
    .io_output_payload_state_elements_10    (poseidonThread_3_io_output_payload_state_elements_10        ), //o
    .io_output_payload_state_elements_11    (poseidonThread_3_io_output_payload_state_elements_11        ), //o
    .clk                                    (clk                                                         ), //i
    .reset                                  (reset                                                       )  //i
  );
  LoopbackDeMux demuxInst (
    .io_input_valid                          (poseidonThread_3_io_output_valid                      ), //i
    .io_input_ready                          (demuxInst_io_input_ready                              ), //o
    .io_input_payload_round_index            (poseidonThread_3_io_output_payload_round_index        ), //i
    .io_input_payload_state_size             (poseidonThread_3_io_output_payload_state_size         ), //i
    .io_input_payload_state_id               (poseidonThread_3_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0       (poseidonThread_3_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1       (poseidonThread_3_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2       (poseidonThread_3_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3       (poseidonThread_3_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4       (poseidonThread_3_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5       (poseidonThread_3_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6       (poseidonThread_3_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7       (poseidonThread_3_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8       (poseidonThread_3_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9       (poseidonThread_3_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10      (poseidonThread_3_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11      (poseidonThread_3_io_output_payload_state_elements_11  ), //i
    .io_output0_valid                        (demuxInst_io_output0_valid                            ), //o
    .io_output0_ready                        (demuxInst_io_output0_fifo_io_push_ready               ), //i
    .io_output0_payload_round_index          (demuxInst_io_output0_payload_round_index              ), //o
    .io_output0_payload_state_size           (demuxInst_io_output0_payload_state_size               ), //o
    .io_output0_payload_state_id             (demuxInst_io_output0_payload_state_id                 ), //o
    .io_output0_payload_state_elements_0     (demuxInst_io_output0_payload_state_elements_0         ), //o
    .io_output0_payload_state_elements_1     (demuxInst_io_output0_payload_state_elements_1         ), //o
    .io_output0_payload_state_elements_2     (demuxInst_io_output0_payload_state_elements_2         ), //o
    .io_output0_payload_state_elements_3     (demuxInst_io_output0_payload_state_elements_3         ), //o
    .io_output0_payload_state_elements_4     (demuxInst_io_output0_payload_state_elements_4         ), //o
    .io_output0_payload_state_elements_5     (demuxInst_io_output0_payload_state_elements_5         ), //o
    .io_output0_payload_state_elements_6     (demuxInst_io_output0_payload_state_elements_6         ), //o
    .io_output0_payload_state_elements_7     (demuxInst_io_output0_payload_state_elements_7         ), //o
    .io_output0_payload_state_elements_8     (demuxInst_io_output0_payload_state_elements_8         ), //o
    .io_output0_payload_state_elements_9     (demuxInst_io_output0_payload_state_elements_9         ), //o
    .io_output0_payload_state_elements_10    (demuxInst_io_output0_payload_state_elements_10        ), //o
    .io_output0_payload_state_elements_11    (demuxInst_io_output0_payload_state_elements_11        ), //o
    .io_output1_valid                        (demuxInst_io_output1_valid                            ), //o
    .io_output1_ready                        (io_output_ready                                       ), //i
    .io_output1_payload_state_id             (demuxInst_io_output1_payload_state_id                 ), //o
    .io_output1_payload_state_element        (demuxInst_io_output1_payload_state_element            )  //o
  );
  StreamFifo_9 demuxInst_io_output0_fifo (
    .io_push_valid                        (demuxInst_io_output0_valid                                  ), //i
    .io_push_ready                        (demuxInst_io_output0_fifo_io_push_ready                     ), //o
    .io_push_payload_round_index          (demuxInst_io_output0_payload_round_index                    ), //i
    .io_push_payload_state_size           (demuxInst_io_output0_payload_state_size                     ), //i
    .io_push_payload_state_id             (demuxInst_io_output0_payload_state_id                       ), //i
    .io_push_payload_state_elements_0     (demuxInst_io_output0_payload_state_elements_0               ), //i
    .io_push_payload_state_elements_1     (demuxInst_io_output0_payload_state_elements_1               ), //i
    .io_push_payload_state_elements_2     (demuxInst_io_output0_payload_state_elements_2               ), //i
    .io_push_payload_state_elements_3     (demuxInst_io_output0_payload_state_elements_3               ), //i
    .io_push_payload_state_elements_4     (demuxInst_io_output0_payload_state_elements_4               ), //i
    .io_push_payload_state_elements_5     (demuxInst_io_output0_payload_state_elements_5               ), //i
    .io_push_payload_state_elements_6     (demuxInst_io_output0_payload_state_elements_6               ), //i
    .io_push_payload_state_elements_7     (demuxInst_io_output0_payload_state_elements_7               ), //i
    .io_push_payload_state_elements_8     (demuxInst_io_output0_payload_state_elements_8               ), //i
    .io_push_payload_state_elements_9     (demuxInst_io_output0_payload_state_elements_9               ), //i
    .io_push_payload_state_elements_10    (demuxInst_io_output0_payload_state_elements_10              ), //i
    .io_push_payload_state_elements_11    (demuxInst_io_output0_payload_state_elements_11              ), //i
    .io_pop_valid                         (demuxInst_io_output0_fifo_io_pop_valid                      ), //o
    .io_pop_ready                         (loopback_ready                                              ), //i
    .io_pop_payload_round_index           (demuxInst_io_output0_fifo_io_pop_payload_round_index        ), //o
    .io_pop_payload_state_size            (demuxInst_io_output0_fifo_io_pop_payload_state_size         ), //o
    .io_pop_payload_state_id              (demuxInst_io_output0_fifo_io_pop_payload_state_id           ), //o
    .io_pop_payload_state_elements_0      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_0   ), //o
    .io_pop_payload_state_elements_1      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_1   ), //o
    .io_pop_payload_state_elements_2      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_2   ), //o
    .io_pop_payload_state_elements_3      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_3   ), //o
    .io_pop_payload_state_elements_4      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_4   ), //o
    .io_pop_payload_state_elements_5      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_5   ), //o
    .io_pop_payload_state_elements_6      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_6   ), //o
    .io_pop_payload_state_elements_7      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_7   ), //o
    .io_pop_payload_state_elements_8      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_8   ), //o
    .io_pop_payload_state_elements_9      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_9   ), //o
    .io_pop_payload_state_elements_10     (demuxInst_io_output0_fifo_io_pop_payload_state_elements_10  ), //o
    .io_pop_payload_state_elements_11     (demuxInst_io_output0_fifo_io_pop_payload_state_elements_11  ), //o
    .io_flush                             (1'b0                                                        ), //i
    .io_occupancy                         (demuxInst_io_output0_fifo_io_occupancy                      ), //o
    .io_availability                      (demuxInst_io_output0_fifo_io_availability                   ), //o
    .clk                                  (clk                                                         ), //i
    .reset                                (reset                                                       )  //i
  );
  assign loopback_ready = streamArbiter_49_io_inputs_0_ready;
  assign io_input_ready = streamArbiter_49_io_inputs_1_ready;
  assign loopback_valid = demuxInst_io_output0_fifo_io_pop_valid;
  assign loopback_payload_round_index = demuxInst_io_output0_fifo_io_pop_payload_round_index;
  assign loopback_payload_state_size = demuxInst_io_output0_fifo_io_pop_payload_state_size;
  assign loopback_payload_state_id = demuxInst_io_output0_fifo_io_pop_payload_state_id;
  assign loopback_payload_state_elements_0 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_0;
  assign loopback_payload_state_elements_1 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_1;
  assign loopback_payload_state_elements_2 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_2;
  assign loopback_payload_state_elements_3 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_3;
  assign loopback_payload_state_elements_4 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_4;
  assign loopback_payload_state_elements_5 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_5;
  assign loopback_payload_state_elements_6 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_6;
  assign loopback_payload_state_elements_7 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_7;
  assign loopback_payload_state_elements_8 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_8;
  assign loopback_payload_state_elements_9 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_9;
  assign loopback_payload_state_elements_10 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_10;
  assign loopback_payload_state_elements_11 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_11;
  assign io_output_valid = demuxInst_io_output1_valid;
  assign io_output_payload_state_id = demuxInst_io_output1_payload_state_id;
  assign io_output_payload_state_element = demuxInst_io_output1_payload_state_element;

endmodule

module PoseidonLoop (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element,
  input               clk,
  input               reset
);
  wire                streamArbiter_49_io_inputs_0_ready;
  wire                streamArbiter_49_io_inputs_1_ready;
  wire                streamArbiter_49_io_output_valid;
  wire       [6:0]    streamArbiter_49_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_49_io_output_payload_state_size;
  wire       [6:0]    streamArbiter_49_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_0;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_1;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_2;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_3;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_4;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_5;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_6;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_7;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_8;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_9;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_10;
  wire       [254:0]  streamArbiter_49_io_output_payload_state_elements_11;
  wire       [0:0]    streamArbiter_49_io_chosen;
  wire       [1:0]    streamArbiter_49_io_chosenOH;
  wire                poseidonSerializer_3_io_parallelInput_ready;
  wire                poseidonSerializer_3_io_serialOutput_valid;
  wire       [6:0]    poseidonSerializer_3_io_serialOutput_payload_round_index;
  wire       [3:0]    poseidonSerializer_3_io_serialOutput_payload_state_index;
  wire       [3:0]    poseidonSerializer_3_io_serialOutput_payload_state_size;
  wire       [6:0]    poseidonSerializer_3_io_serialOutput_payload_state_id;
  wire       [254:0]  poseidonSerializer_3_io_serialOutput_payload_state_element;
  wire                poseidonThread_3_io_input_ready;
  wire                poseidonThread_3_io_output_valid;
  wire       [6:0]    poseidonThread_3_io_output_payload_round_index;
  wire       [3:0]    poseidonThread_3_io_output_payload_state_size;
  wire       [6:0]    poseidonThread_3_io_output_payload_state_id;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_0;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_1;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_2;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_3;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_4;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_5;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_6;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_7;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_8;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_9;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_10;
  wire       [254:0]  poseidonThread_3_io_output_payload_state_elements_11;
  wire                demuxInst_io_input_ready;
  wire                demuxInst_io_output0_valid;
  wire       [6:0]    demuxInst_io_output0_payload_round_index;
  wire       [3:0]    demuxInst_io_output0_payload_state_size;
  wire       [6:0]    demuxInst_io_output0_payload_state_id;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_0;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_1;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_2;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_3;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_4;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_5;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_6;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_7;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_8;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_9;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_10;
  wire       [254:0]  demuxInst_io_output0_payload_state_elements_11;
  wire                demuxInst_io_output1_valid;
  wire       [6:0]    demuxInst_io_output1_payload_state_id;
  wire       [254:0]  demuxInst_io_output1_payload_state_element;
  wire                demuxInst_io_output0_fifo_io_push_ready;
  wire                demuxInst_io_output0_fifo_io_pop_valid;
  wire       [6:0]    demuxInst_io_output0_fifo_io_pop_payload_round_index;
  wire       [3:0]    demuxInst_io_output0_fifo_io_pop_payload_state_size;
  wire       [6:0]    demuxInst_io_output0_fifo_io_pop_payload_state_id;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_0;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_1;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_2;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_3;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_4;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_5;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_6;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_7;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_8;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_9;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_10;
  wire       [254:0]  demuxInst_io_output0_fifo_io_pop_payload_state_elements_11;
  wire       [2:0]    demuxInst_io_output0_fifo_io_occupancy;
  wire       [2:0]    demuxInst_io_output0_fifo_io_availability;
  wire                loopback_valid;
  wire                loopback_ready;
  wire       [6:0]    loopback_payload_round_index;
  wire       [3:0]    loopback_payload_state_size;
  wire       [6:0]    loopback_payload_state_id;
  wire       [254:0]  loopback_payload_state_elements_0;
  wire       [254:0]  loopback_payload_state_elements_1;
  wire       [254:0]  loopback_payload_state_elements_2;
  wire       [254:0]  loopback_payload_state_elements_3;
  wire       [254:0]  loopback_payload_state_elements_4;
  wire       [254:0]  loopback_payload_state_elements_5;
  wire       [254:0]  loopback_payload_state_elements_6;
  wire       [254:0]  loopback_payload_state_elements_7;
  wire       [254:0]  loopback_payload_state_elements_8;
  wire       [254:0]  loopback_payload_state_elements_9;
  wire       [254:0]  loopback_payload_state_elements_10;
  wire       [254:0]  loopback_payload_state_elements_11;

  StreamArbiter_45 streamArbiter_49 (
    .io_inputs_0_valid                        (loopback_valid                                        ), //i
    .io_inputs_0_ready                        (streamArbiter_49_io_inputs_0_ready                    ), //o
    .io_inputs_0_payload_round_index          (loopback_payload_round_index                          ), //i
    .io_inputs_0_payload_state_size           (loopback_payload_state_size                           ), //i
    .io_inputs_0_payload_state_id             (loopback_payload_state_id                             ), //i
    .io_inputs_0_payload_state_elements_0     (loopback_payload_state_elements_0                     ), //i
    .io_inputs_0_payload_state_elements_1     (loopback_payload_state_elements_1                     ), //i
    .io_inputs_0_payload_state_elements_2     (loopback_payload_state_elements_2                     ), //i
    .io_inputs_0_payload_state_elements_3     (loopback_payload_state_elements_3                     ), //i
    .io_inputs_0_payload_state_elements_4     (loopback_payload_state_elements_4                     ), //i
    .io_inputs_0_payload_state_elements_5     (loopback_payload_state_elements_5                     ), //i
    .io_inputs_0_payload_state_elements_6     (loopback_payload_state_elements_6                     ), //i
    .io_inputs_0_payload_state_elements_7     (loopback_payload_state_elements_7                     ), //i
    .io_inputs_0_payload_state_elements_8     (loopback_payload_state_elements_8                     ), //i
    .io_inputs_0_payload_state_elements_9     (loopback_payload_state_elements_9                     ), //i
    .io_inputs_0_payload_state_elements_10    (loopback_payload_state_elements_10                    ), //i
    .io_inputs_0_payload_state_elements_11    (loopback_payload_state_elements_11                    ), //i
    .io_inputs_1_valid                        (io_input_valid                                        ), //i
    .io_inputs_1_ready                        (streamArbiter_49_io_inputs_1_ready                    ), //o
    .io_inputs_1_payload_round_index          (io_input_payload_round_index                          ), //i
    .io_inputs_1_payload_state_size           (io_input_payload_state_size                           ), //i
    .io_inputs_1_payload_state_id             (io_input_payload_state_id                             ), //i
    .io_inputs_1_payload_state_elements_0     (io_input_payload_state_elements_0                     ), //i
    .io_inputs_1_payload_state_elements_1     (io_input_payload_state_elements_1                     ), //i
    .io_inputs_1_payload_state_elements_2     (io_input_payload_state_elements_2                     ), //i
    .io_inputs_1_payload_state_elements_3     (io_input_payload_state_elements_3                     ), //i
    .io_inputs_1_payload_state_elements_4     (io_input_payload_state_elements_4                     ), //i
    .io_inputs_1_payload_state_elements_5     (io_input_payload_state_elements_5                     ), //i
    .io_inputs_1_payload_state_elements_6     (io_input_payload_state_elements_6                     ), //i
    .io_inputs_1_payload_state_elements_7     (io_input_payload_state_elements_7                     ), //i
    .io_inputs_1_payload_state_elements_8     (io_input_payload_state_elements_8                     ), //i
    .io_inputs_1_payload_state_elements_9     (io_input_payload_state_elements_9                     ), //i
    .io_inputs_1_payload_state_elements_10    (io_input_payload_state_elements_10                    ), //i
    .io_inputs_1_payload_state_elements_11    (io_input_payload_state_elements_11                    ), //i
    .io_output_valid                          (streamArbiter_49_io_output_valid                      ), //o
    .io_output_ready                          (poseidonSerializer_3_io_parallelInput_ready           ), //i
    .io_output_payload_round_index            (streamArbiter_49_io_output_payload_round_index        ), //o
    .io_output_payload_state_size             (streamArbiter_49_io_output_payload_state_size         ), //o
    .io_output_payload_state_id               (streamArbiter_49_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0       (streamArbiter_49_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1       (streamArbiter_49_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2       (streamArbiter_49_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3       (streamArbiter_49_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4       (streamArbiter_49_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5       (streamArbiter_49_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6       (streamArbiter_49_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7       (streamArbiter_49_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8       (streamArbiter_49_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9       (streamArbiter_49_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10      (streamArbiter_49_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11      (streamArbiter_49_io_output_payload_state_elements_11  ), //o
    .io_chosen                                (streamArbiter_49_io_chosen                            ), //o
    .io_chosenOH                              (streamArbiter_49_io_chosenOH                          ), //o
    .clk                                      (clk                                                   ), //i
    .reset                                    (reset                                                 )  //i
  );
  PoseidonSerializer poseidonSerializer_3 (
    .io_parallelInput_valid                        (streamArbiter_49_io_output_valid                            ), //i
    .io_parallelInput_ready                        (poseidonSerializer_3_io_parallelInput_ready                 ), //o
    .io_parallelInput_payload_round_index          (streamArbiter_49_io_output_payload_round_index              ), //i
    .io_parallelInput_payload_state_size           (streamArbiter_49_io_output_payload_state_size               ), //i
    .io_parallelInput_payload_state_id             (streamArbiter_49_io_output_payload_state_id                 ), //i
    .io_parallelInput_payload_state_elements_0     (streamArbiter_49_io_output_payload_state_elements_0         ), //i
    .io_parallelInput_payload_state_elements_1     (streamArbiter_49_io_output_payload_state_elements_1         ), //i
    .io_parallelInput_payload_state_elements_2     (streamArbiter_49_io_output_payload_state_elements_2         ), //i
    .io_parallelInput_payload_state_elements_3     (streamArbiter_49_io_output_payload_state_elements_3         ), //i
    .io_parallelInput_payload_state_elements_4     (streamArbiter_49_io_output_payload_state_elements_4         ), //i
    .io_parallelInput_payload_state_elements_5     (streamArbiter_49_io_output_payload_state_elements_5         ), //i
    .io_parallelInput_payload_state_elements_6     (streamArbiter_49_io_output_payload_state_elements_6         ), //i
    .io_parallelInput_payload_state_elements_7     (streamArbiter_49_io_output_payload_state_elements_7         ), //i
    .io_parallelInput_payload_state_elements_8     (streamArbiter_49_io_output_payload_state_elements_8         ), //i
    .io_parallelInput_payload_state_elements_9     (streamArbiter_49_io_output_payload_state_elements_9         ), //i
    .io_parallelInput_payload_state_elements_10    (streamArbiter_49_io_output_payload_state_elements_10        ), //i
    .io_parallelInput_payload_state_elements_11    (streamArbiter_49_io_output_payload_state_elements_11        ), //i
    .io_serialOutput_valid                         (poseidonSerializer_3_io_serialOutput_valid                  ), //o
    .io_serialOutput_ready                         (poseidonThread_3_io_input_ready                             ), //i
    .io_serialOutput_payload_round_index           (poseidonSerializer_3_io_serialOutput_payload_round_index    ), //o
    .io_serialOutput_payload_state_index           (poseidonSerializer_3_io_serialOutput_payload_state_index    ), //o
    .io_serialOutput_payload_state_size            (poseidonSerializer_3_io_serialOutput_payload_state_size     ), //o
    .io_serialOutput_payload_state_id              (poseidonSerializer_3_io_serialOutput_payload_state_id       ), //o
    .io_serialOutput_payload_state_element         (poseidonSerializer_3_io_serialOutput_payload_state_element  ), //o
    .clk                                           (clk                                                         ), //i
    .reset                                         (reset                                                       )  //i
  );
  PoseidonThread poseidonThread_3 (
    .io_input_valid                         (poseidonSerializer_3_io_serialOutput_valid                  ), //i
    .io_input_ready                         (poseidonThread_3_io_input_ready                             ), //o
    .io_input_payload_round_index           (poseidonSerializer_3_io_serialOutput_payload_round_index    ), //i
    .io_input_payload_state_index           (poseidonSerializer_3_io_serialOutput_payload_state_index    ), //i
    .io_input_payload_state_size            (poseidonSerializer_3_io_serialOutput_payload_state_size     ), //i
    .io_input_payload_state_id              (poseidonSerializer_3_io_serialOutput_payload_state_id       ), //i
    .io_input_payload_state_element         (poseidonSerializer_3_io_serialOutput_payload_state_element  ), //i
    .io_output_valid                        (poseidonThread_3_io_output_valid                            ), //o
    .io_output_ready                        (demuxInst_io_input_ready                                    ), //i
    .io_output_payload_round_index          (poseidonThread_3_io_output_payload_round_index              ), //o
    .io_output_payload_state_size           (poseidonThread_3_io_output_payload_state_size               ), //o
    .io_output_payload_state_id             (poseidonThread_3_io_output_payload_state_id                 ), //o
    .io_output_payload_state_elements_0     (poseidonThread_3_io_output_payload_state_elements_0         ), //o
    .io_output_payload_state_elements_1     (poseidonThread_3_io_output_payload_state_elements_1         ), //o
    .io_output_payload_state_elements_2     (poseidonThread_3_io_output_payload_state_elements_2         ), //o
    .io_output_payload_state_elements_3     (poseidonThread_3_io_output_payload_state_elements_3         ), //o
    .io_output_payload_state_elements_4     (poseidonThread_3_io_output_payload_state_elements_4         ), //o
    .io_output_payload_state_elements_5     (poseidonThread_3_io_output_payload_state_elements_5         ), //o
    .io_output_payload_state_elements_6     (poseidonThread_3_io_output_payload_state_elements_6         ), //o
    .io_output_payload_state_elements_7     (poseidonThread_3_io_output_payload_state_elements_7         ), //o
    .io_output_payload_state_elements_8     (poseidonThread_3_io_output_payload_state_elements_8         ), //o
    .io_output_payload_state_elements_9     (poseidonThread_3_io_output_payload_state_elements_9         ), //o
    .io_output_payload_state_elements_10    (poseidonThread_3_io_output_payload_state_elements_10        ), //o
    .io_output_payload_state_elements_11    (poseidonThread_3_io_output_payload_state_elements_11        ), //o
    .clk                                    (clk                                                         ), //i
    .reset                                  (reset                                                       )  //i
  );
  LoopbackDeMux demuxInst (
    .io_input_valid                          (poseidonThread_3_io_output_valid                      ), //i
    .io_input_ready                          (demuxInst_io_input_ready                              ), //o
    .io_input_payload_round_index            (poseidonThread_3_io_output_payload_round_index        ), //i
    .io_input_payload_state_size             (poseidonThread_3_io_output_payload_state_size         ), //i
    .io_input_payload_state_id               (poseidonThread_3_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0       (poseidonThread_3_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1       (poseidonThread_3_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2       (poseidonThread_3_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3       (poseidonThread_3_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4       (poseidonThread_3_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5       (poseidonThread_3_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6       (poseidonThread_3_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7       (poseidonThread_3_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8       (poseidonThread_3_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9       (poseidonThread_3_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10      (poseidonThread_3_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11      (poseidonThread_3_io_output_payload_state_elements_11  ), //i
    .io_output0_valid                        (demuxInst_io_output0_valid                            ), //o
    .io_output0_ready                        (demuxInst_io_output0_fifo_io_push_ready               ), //i
    .io_output0_payload_round_index          (demuxInst_io_output0_payload_round_index              ), //o
    .io_output0_payload_state_size           (demuxInst_io_output0_payload_state_size               ), //o
    .io_output0_payload_state_id             (demuxInst_io_output0_payload_state_id                 ), //o
    .io_output0_payload_state_elements_0     (demuxInst_io_output0_payload_state_elements_0         ), //o
    .io_output0_payload_state_elements_1     (demuxInst_io_output0_payload_state_elements_1         ), //o
    .io_output0_payload_state_elements_2     (demuxInst_io_output0_payload_state_elements_2         ), //o
    .io_output0_payload_state_elements_3     (demuxInst_io_output0_payload_state_elements_3         ), //o
    .io_output0_payload_state_elements_4     (demuxInst_io_output0_payload_state_elements_4         ), //o
    .io_output0_payload_state_elements_5     (demuxInst_io_output0_payload_state_elements_5         ), //o
    .io_output0_payload_state_elements_6     (demuxInst_io_output0_payload_state_elements_6         ), //o
    .io_output0_payload_state_elements_7     (demuxInst_io_output0_payload_state_elements_7         ), //o
    .io_output0_payload_state_elements_8     (demuxInst_io_output0_payload_state_elements_8         ), //o
    .io_output0_payload_state_elements_9     (demuxInst_io_output0_payload_state_elements_9         ), //o
    .io_output0_payload_state_elements_10    (demuxInst_io_output0_payload_state_elements_10        ), //o
    .io_output0_payload_state_elements_11    (demuxInst_io_output0_payload_state_elements_11        ), //o
    .io_output1_valid                        (demuxInst_io_output1_valid                            ), //o
    .io_output1_ready                        (io_output_ready                                       ), //i
    .io_output1_payload_state_id             (demuxInst_io_output1_payload_state_id                 ), //o
    .io_output1_payload_state_element        (demuxInst_io_output1_payload_state_element            )  //o
  );
  StreamFifo_9 demuxInst_io_output0_fifo (
    .io_push_valid                        (demuxInst_io_output0_valid                                  ), //i
    .io_push_ready                        (demuxInst_io_output0_fifo_io_push_ready                     ), //o
    .io_push_payload_round_index          (demuxInst_io_output0_payload_round_index                    ), //i
    .io_push_payload_state_size           (demuxInst_io_output0_payload_state_size                     ), //i
    .io_push_payload_state_id             (demuxInst_io_output0_payload_state_id                       ), //i
    .io_push_payload_state_elements_0     (demuxInst_io_output0_payload_state_elements_0               ), //i
    .io_push_payload_state_elements_1     (demuxInst_io_output0_payload_state_elements_1               ), //i
    .io_push_payload_state_elements_2     (demuxInst_io_output0_payload_state_elements_2               ), //i
    .io_push_payload_state_elements_3     (demuxInst_io_output0_payload_state_elements_3               ), //i
    .io_push_payload_state_elements_4     (demuxInst_io_output0_payload_state_elements_4               ), //i
    .io_push_payload_state_elements_5     (demuxInst_io_output0_payload_state_elements_5               ), //i
    .io_push_payload_state_elements_6     (demuxInst_io_output0_payload_state_elements_6               ), //i
    .io_push_payload_state_elements_7     (demuxInst_io_output0_payload_state_elements_7               ), //i
    .io_push_payload_state_elements_8     (demuxInst_io_output0_payload_state_elements_8               ), //i
    .io_push_payload_state_elements_9     (demuxInst_io_output0_payload_state_elements_9               ), //i
    .io_push_payload_state_elements_10    (demuxInst_io_output0_payload_state_elements_10              ), //i
    .io_push_payload_state_elements_11    (demuxInst_io_output0_payload_state_elements_11              ), //i
    .io_pop_valid                         (demuxInst_io_output0_fifo_io_pop_valid                      ), //o
    .io_pop_ready                         (loopback_ready                                              ), //i
    .io_pop_payload_round_index           (demuxInst_io_output0_fifo_io_pop_payload_round_index        ), //o
    .io_pop_payload_state_size            (demuxInst_io_output0_fifo_io_pop_payload_state_size         ), //o
    .io_pop_payload_state_id              (demuxInst_io_output0_fifo_io_pop_payload_state_id           ), //o
    .io_pop_payload_state_elements_0      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_0   ), //o
    .io_pop_payload_state_elements_1      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_1   ), //o
    .io_pop_payload_state_elements_2      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_2   ), //o
    .io_pop_payload_state_elements_3      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_3   ), //o
    .io_pop_payload_state_elements_4      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_4   ), //o
    .io_pop_payload_state_elements_5      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_5   ), //o
    .io_pop_payload_state_elements_6      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_6   ), //o
    .io_pop_payload_state_elements_7      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_7   ), //o
    .io_pop_payload_state_elements_8      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_8   ), //o
    .io_pop_payload_state_elements_9      (demuxInst_io_output0_fifo_io_pop_payload_state_elements_9   ), //o
    .io_pop_payload_state_elements_10     (demuxInst_io_output0_fifo_io_pop_payload_state_elements_10  ), //o
    .io_pop_payload_state_elements_11     (demuxInst_io_output0_fifo_io_pop_payload_state_elements_11  ), //o
    .io_flush                             (1'b0                                                        ), //i
    .io_occupancy                         (demuxInst_io_output0_fifo_io_occupancy                      ), //o
    .io_availability                      (demuxInst_io_output0_fifo_io_availability                   ), //o
    .clk                                  (clk                                                         ), //i
    .reset                                (reset                                                       )  //i
  );
  assign loopback_ready = streamArbiter_49_io_inputs_0_ready;
  assign io_input_ready = streamArbiter_49_io_inputs_1_ready;
  assign loopback_valid = demuxInst_io_output0_fifo_io_pop_valid;
  assign loopback_payload_round_index = demuxInst_io_output0_fifo_io_pop_payload_round_index;
  assign loopback_payload_state_size = demuxInst_io_output0_fifo_io_pop_payload_state_size;
  assign loopback_payload_state_id = demuxInst_io_output0_fifo_io_pop_payload_state_id;
  assign loopback_payload_state_elements_0 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_0;
  assign loopback_payload_state_elements_1 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_1;
  assign loopback_payload_state_elements_2 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_2;
  assign loopback_payload_state_elements_3 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_3;
  assign loopback_payload_state_elements_4 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_4;
  assign loopback_payload_state_elements_5 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_5;
  assign loopback_payload_state_elements_6 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_6;
  assign loopback_payload_state_elements_7 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_7;
  assign loopback_payload_state_elements_8 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_8;
  assign loopback_payload_state_elements_9 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_9;
  assign loopback_payload_state_elements_10 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_10;
  assign loopback_payload_state_elements_11 = demuxInst_io_output0_fifo_io_pop_payload_state_elements_11;
  assign io_output_valid = demuxInst_io_output1_valid;
  assign io_output_payload_state_id = demuxInst_io_output1_payload_state_id;
  assign io_output_payload_state_element = demuxInst_io_output1_payload_state_element;

endmodule

module StreamDemux_49 (
  input      [1:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [6:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_elements_0,
  output     [254:0]  io_outputs_0_payload_state_elements_1,
  output     [254:0]  io_outputs_0_payload_state_elements_2,
  output     [254:0]  io_outputs_0_payload_state_elements_3,
  output     [254:0]  io_outputs_0_payload_state_elements_4,
  output     [254:0]  io_outputs_0_payload_state_elements_5,
  output     [254:0]  io_outputs_0_payload_state_elements_6,
  output     [254:0]  io_outputs_0_payload_state_elements_7,
  output     [254:0]  io_outputs_0_payload_state_elements_8,
  output     [254:0]  io_outputs_0_payload_state_elements_9,
  output     [254:0]  io_outputs_0_payload_state_elements_10,
  output     [254:0]  io_outputs_0_payload_state_elements_11,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [6:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_elements_0,
  output     [254:0]  io_outputs_1_payload_state_elements_1,
  output     [254:0]  io_outputs_1_payload_state_elements_2,
  output     [254:0]  io_outputs_1_payload_state_elements_3,
  output     [254:0]  io_outputs_1_payload_state_elements_4,
  output     [254:0]  io_outputs_1_payload_state_elements_5,
  output     [254:0]  io_outputs_1_payload_state_elements_6,
  output     [254:0]  io_outputs_1_payload_state_elements_7,
  output     [254:0]  io_outputs_1_payload_state_elements_8,
  output     [254:0]  io_outputs_1_payload_state_elements_9,
  output     [254:0]  io_outputs_1_payload_state_elements_10,
  output     [254:0]  io_outputs_1_payload_state_elements_11,
  output reg          io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [6:0]    io_outputs_2_payload_round_index,
  output     [3:0]    io_outputs_2_payload_state_size,
  output     [6:0]    io_outputs_2_payload_state_id,
  output     [254:0]  io_outputs_2_payload_state_elements_0,
  output     [254:0]  io_outputs_2_payload_state_elements_1,
  output     [254:0]  io_outputs_2_payload_state_elements_2,
  output     [254:0]  io_outputs_2_payload_state_elements_3,
  output     [254:0]  io_outputs_2_payload_state_elements_4,
  output     [254:0]  io_outputs_2_payload_state_elements_5,
  output     [254:0]  io_outputs_2_payload_state_elements_6,
  output     [254:0]  io_outputs_2_payload_state_elements_7,
  output     [254:0]  io_outputs_2_payload_state_elements_8,
  output     [254:0]  io_outputs_2_payload_state_elements_9,
  output     [254:0]  io_outputs_2_payload_state_elements_10,
  output     [254:0]  io_outputs_2_payload_state_elements_11
);
  wire                when_Stream_l745;
  wire                when_Stream_l745_1;
  wire                when_Stream_l745_2;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l745) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l745_1) begin
      io_input_ready = io_outputs_1_ready;
    end
    if(!when_Stream_l745_2) begin
      io_input_ready = io_outputs_2_ready;
    end
  end

  assign io_outputs_0_payload_round_index = io_input_payload_round_index;
  assign io_outputs_0_payload_state_size = io_input_payload_state_size;
  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_0_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_0_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_0_payload_state_elements_3 = io_input_payload_state_elements_3;
  assign io_outputs_0_payload_state_elements_4 = io_input_payload_state_elements_4;
  assign io_outputs_0_payload_state_elements_5 = io_input_payload_state_elements_5;
  assign io_outputs_0_payload_state_elements_6 = io_input_payload_state_elements_6;
  assign io_outputs_0_payload_state_elements_7 = io_input_payload_state_elements_7;
  assign io_outputs_0_payload_state_elements_8 = io_input_payload_state_elements_8;
  assign io_outputs_0_payload_state_elements_9 = io_input_payload_state_elements_9;
  assign io_outputs_0_payload_state_elements_10 = io_input_payload_state_elements_10;
  assign io_outputs_0_payload_state_elements_11 = io_input_payload_state_elements_11;
  assign when_Stream_l745 = (2'b00 != io_select);
  always @(*) begin
    if(when_Stream_l745) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_round_index = io_input_payload_round_index;
  assign io_outputs_1_payload_state_size = io_input_payload_state_size;
  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_1_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_1_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_1_payload_state_elements_3 = io_input_payload_state_elements_3;
  assign io_outputs_1_payload_state_elements_4 = io_input_payload_state_elements_4;
  assign io_outputs_1_payload_state_elements_5 = io_input_payload_state_elements_5;
  assign io_outputs_1_payload_state_elements_6 = io_input_payload_state_elements_6;
  assign io_outputs_1_payload_state_elements_7 = io_input_payload_state_elements_7;
  assign io_outputs_1_payload_state_elements_8 = io_input_payload_state_elements_8;
  assign io_outputs_1_payload_state_elements_9 = io_input_payload_state_elements_9;
  assign io_outputs_1_payload_state_elements_10 = io_input_payload_state_elements_10;
  assign io_outputs_1_payload_state_elements_11 = io_input_payload_state_elements_11;
  assign when_Stream_l745_1 = (2'b01 != io_select);
  always @(*) begin
    if(when_Stream_l745_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  assign io_outputs_2_payload_round_index = io_input_payload_round_index;
  assign io_outputs_2_payload_state_size = io_input_payload_state_size;
  assign io_outputs_2_payload_state_id = io_input_payload_state_id;
  assign io_outputs_2_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_2_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_2_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_2_payload_state_elements_3 = io_input_payload_state_elements_3;
  assign io_outputs_2_payload_state_elements_4 = io_input_payload_state_elements_4;
  assign io_outputs_2_payload_state_elements_5 = io_input_payload_state_elements_5;
  assign io_outputs_2_payload_state_elements_6 = io_input_payload_state_elements_6;
  assign io_outputs_2_payload_state_elements_7 = io_input_payload_state_elements_7;
  assign io_outputs_2_payload_state_elements_8 = io_input_payload_state_elements_8;
  assign io_outputs_2_payload_state_elements_9 = io_input_payload_state_elements_9;
  assign io_outputs_2_payload_state_elements_10 = io_input_payload_state_elements_10;
  assign io_outputs_2_payload_state_elements_11 = io_input_payload_state_elements_11;
  assign when_Stream_l745_2 = (2'b10 != io_select);
  always @(*) begin
    if(when_Stream_l745_2) begin
      io_outputs_2_valid = 1'b0;
    end else begin
      io_outputs_2_valid = io_input_valid;
    end
  end


endmodule

module AXI4StreamReceiver (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_last,
  input      [254:0]  io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  reg                 receiver_output_valid;
  reg                 receiver_output_ready;
  wire       [6:0]    receiver_output_payload_round_index;
  reg        [3:0]    receiver_output_payload_state_size;
  reg        [6:0]    receiver_output_payload_state_id;
  reg        [254:0]  receiver_output_payload_state_elements_0;
  reg        [254:0]  receiver_output_payload_state_elements_1;
  reg        [254:0]  receiver_output_payload_state_elements_2;
  reg        [254:0]  receiver_output_payload_state_elements_3;
  reg        [254:0]  receiver_output_payload_state_elements_4;
  reg        [254:0]  receiver_output_payload_state_elements_5;
  reg        [254:0]  receiver_output_payload_state_elements_6;
  reg        [254:0]  receiver_output_payload_state_elements_7;
  reg        [254:0]  receiver_output_payload_state_elements_8;
  reg        [254:0]  receiver_output_payload_state_elements_9;
  reg        [254:0]  receiver_output_payload_state_elements_10;
  reg        [254:0]  receiver_output_payload_state_elements_11;
  reg        [3:0]    receiver_sizeCounter;
  reg        [6:0]    receiver_idCounter;
  reg        [254:0]  receiver_buffer_0;
  reg        [254:0]  receiver_buffer_1;
  reg        [254:0]  receiver_buffer_2;
  reg        [254:0]  receiver_buffer_3;
  reg        [254:0]  receiver_buffer_4;
  reg        [254:0]  receiver_buffer_5;
  reg        [254:0]  receiver_buffer_6;
  reg        [254:0]  receiver_buffer_7;
  reg        [254:0]  receiver_buffer_8;
  reg        [254:0]  receiver_buffer_9;
  reg        [254:0]  receiver_buffer_10;
  reg        [254:0]  receiver_buffer_11;
  wire                receiver_receiverFSM_wantExit;
  reg                 receiver_receiverFSM_wantStart;
  wire                receiver_receiverFSM_wantKill;
  wire                receiver_output_m2sPipe_valid;
  wire                receiver_output_m2sPipe_ready;
  wire       [6:0]    receiver_output_m2sPipe_payload_round_index;
  wire       [3:0]    receiver_output_m2sPipe_payload_state_size;
  wire       [6:0]    receiver_output_m2sPipe_payload_state_id;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_0;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_1;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_2;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_3;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_4;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_5;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_6;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_7;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_8;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_9;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_10;
  wire       [254:0]  receiver_output_m2sPipe_payload_state_elements_11;
  reg                 receiver_output_rValid;
  reg        [6:0]    receiver_output_rData_round_index;
  reg        [3:0]    receiver_output_rData_state_size;
  reg        [6:0]    receiver_output_rData_state_id;
  reg        [254:0]  receiver_output_rData_state_elements_0;
  reg        [254:0]  receiver_output_rData_state_elements_1;
  reg        [254:0]  receiver_output_rData_state_elements_2;
  reg        [254:0]  receiver_output_rData_state_elements_3;
  reg        [254:0]  receiver_output_rData_state_elements_4;
  reg        [254:0]  receiver_output_rData_state_elements_5;
  reg        [254:0]  receiver_output_rData_state_elements_6;
  reg        [254:0]  receiver_output_rData_state_elements_7;
  reg        [254:0]  receiver_output_rData_state_elements_8;
  reg        [254:0]  receiver_output_rData_state_elements_9;
  reg        [254:0]  receiver_output_rData_state_elements_10;
  reg        [254:0]  receiver_output_rData_state_elements_11;
  wire                when_Stream_l342;
  reg        `receiver_receiverFSM_enumDefinition_binary_sequential_type receiver_receiverFSM_stateReg;
  reg        `receiver_receiverFSM_enumDefinition_binary_sequential_type receiver_receiverFSM_stateNext;
  wire                when_AXI4StreamInterface_l45;
  wire       [15:0]   _zz_1;
  wire                receiver_output_fire;
  wire                when_AXI4StreamInterface_l65;
  `ifndef SYNTHESIS
  reg [199:0] receiver_receiverFSM_stateReg_string;
  reg [199:0] receiver_receiverFSM_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BOOT : receiver_receiverFSM_stateReg_string = "receiver_receiverFSM_BOOT";
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : receiver_receiverFSM_stateReg_string = "receiver_receiverFSM_BUSY";
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : receiver_receiverFSM_stateReg_string = "receiver_receiverFSM_DONE";
      default : receiver_receiverFSM_stateReg_string = "?????????????????????????";
    endcase
  end
  always @(*) begin
    case(receiver_receiverFSM_stateNext)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BOOT : receiver_receiverFSM_stateNext_string = "receiver_receiverFSM_BOOT";
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : receiver_receiverFSM_stateNext_string = "receiver_receiverFSM_BUSY";
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : receiver_receiverFSM_stateNext_string = "receiver_receiverFSM_DONE";
      default : receiver_receiverFSM_stateNext_string = "?????????????????????????";
    endcase
  end
  `endif

  assign receiver_receiverFSM_wantExit = 1'b0;
  always @(*) begin
    receiver_receiverFSM_wantStart = 1'b0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
      end
      default : begin
        receiver_receiverFSM_wantStart = 1'b1;
      end
    endcase
  end

  assign receiver_receiverFSM_wantKill = 1'b0;
  always @(*) begin
    io_input_ready = 1'b0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
        io_input_ready = 1'b1;
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        if(receiver_output_fire) begin
          io_input_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_valid = 1'b0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_id = 7'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_id = receiver_idCounter;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_size = 4'b0000;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_size = receiver_sizeCounter;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_0 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_0 = receiver_buffer_0;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_1 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_1 = receiver_buffer_1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_2 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_2 = receiver_buffer_2;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_3 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_3 = receiver_buffer_3;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_4 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_4 = receiver_buffer_4;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_5 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_5 = receiver_buffer_5;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_6 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_6 = receiver_buffer_6;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_7 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_7 = receiver_buffer_7;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_8 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_8 = receiver_buffer_8;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_9 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_9 = receiver_buffer_9;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_10 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_10 = receiver_buffer_10;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    receiver_output_payload_state_elements_11 = 255'h0;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        receiver_output_payload_state_elements_11 = receiver_buffer_11;
      end
      default : begin
      end
    endcase
  end

  assign receiver_output_payload_round_index = 7'h0;
  always @(*) begin
    receiver_output_ready = receiver_output_m2sPipe_ready;
    if(when_Stream_l342) begin
      receiver_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! receiver_output_m2sPipe_valid);
  assign receiver_output_m2sPipe_valid = receiver_output_rValid;
  assign receiver_output_m2sPipe_payload_round_index = receiver_output_rData_round_index;
  assign receiver_output_m2sPipe_payload_state_size = receiver_output_rData_state_size;
  assign receiver_output_m2sPipe_payload_state_id = receiver_output_rData_state_id;
  assign receiver_output_m2sPipe_payload_state_elements_0 = receiver_output_rData_state_elements_0;
  assign receiver_output_m2sPipe_payload_state_elements_1 = receiver_output_rData_state_elements_1;
  assign receiver_output_m2sPipe_payload_state_elements_2 = receiver_output_rData_state_elements_2;
  assign receiver_output_m2sPipe_payload_state_elements_3 = receiver_output_rData_state_elements_3;
  assign receiver_output_m2sPipe_payload_state_elements_4 = receiver_output_rData_state_elements_4;
  assign receiver_output_m2sPipe_payload_state_elements_5 = receiver_output_rData_state_elements_5;
  assign receiver_output_m2sPipe_payload_state_elements_6 = receiver_output_rData_state_elements_6;
  assign receiver_output_m2sPipe_payload_state_elements_7 = receiver_output_rData_state_elements_7;
  assign receiver_output_m2sPipe_payload_state_elements_8 = receiver_output_rData_state_elements_8;
  assign receiver_output_m2sPipe_payload_state_elements_9 = receiver_output_rData_state_elements_9;
  assign receiver_output_m2sPipe_payload_state_elements_10 = receiver_output_rData_state_elements_10;
  assign receiver_output_m2sPipe_payload_state_elements_11 = receiver_output_rData_state_elements_11;
  assign io_output_valid = receiver_output_m2sPipe_valid;
  assign receiver_output_m2sPipe_ready = io_output_ready;
  assign io_output_payload_round_index = receiver_output_m2sPipe_payload_round_index;
  assign io_output_payload_state_size = receiver_output_m2sPipe_payload_state_size;
  assign io_output_payload_state_id = receiver_output_m2sPipe_payload_state_id;
  assign io_output_payload_state_elements_0 = receiver_output_m2sPipe_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = receiver_output_m2sPipe_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = receiver_output_m2sPipe_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = receiver_output_m2sPipe_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = receiver_output_m2sPipe_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = receiver_output_m2sPipe_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = receiver_output_m2sPipe_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = receiver_output_m2sPipe_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = receiver_output_m2sPipe_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = receiver_output_m2sPipe_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = receiver_output_m2sPipe_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = receiver_output_m2sPipe_payload_state_elements_11;
  always @(*) begin
    receiver_receiverFSM_stateNext = receiver_receiverFSM_stateReg;
    case(receiver_receiverFSM_stateReg)
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
        if(when_AXI4StreamInterface_l45) begin
          if(io_input_last) begin
            receiver_receiverFSM_stateNext = `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE;
          end
        end
      end
      `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
        if(receiver_output_fire) begin
          receiver_receiverFSM_stateNext = `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY;
        end
      end
      default : begin
      end
    endcase
    if(receiver_receiverFSM_wantStart) begin
      receiver_receiverFSM_stateNext = `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY;
    end
    if(receiver_receiverFSM_wantKill) begin
      receiver_receiverFSM_stateNext = `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BOOT;
    end
  end

  assign when_AXI4StreamInterface_l45 = (io_input_valid && io_input_ready);
  assign _zz_1 = ({15'd0,1'b1} <<< receiver_sizeCounter);
  assign receiver_output_fire = (receiver_output_valid && receiver_output_ready);
  assign when_AXI4StreamInterface_l65 = (io_input_valid && io_input_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      receiver_sizeCounter <= 4'b0000;
      receiver_idCounter <= 7'h0;
      receiver_buffer_0 <= 255'h0;
      receiver_buffer_1 <= 255'h0;
      receiver_buffer_2 <= 255'h0;
      receiver_buffer_3 <= 255'h0;
      receiver_buffer_4 <= 255'h0;
      receiver_buffer_5 <= 255'h0;
      receiver_buffer_6 <= 255'h0;
      receiver_buffer_7 <= 255'h0;
      receiver_buffer_8 <= 255'h0;
      receiver_buffer_9 <= 255'h0;
      receiver_buffer_10 <= 255'h0;
      receiver_buffer_11 <= 255'h0;
      receiver_output_rValid <= 1'b0;
      receiver_receiverFSM_stateReg <= `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BOOT;
    end else begin
      if(receiver_output_ready) begin
        receiver_output_rValid <= receiver_output_valid;
      end
      receiver_receiverFSM_stateReg <= receiver_receiverFSM_stateNext;
      case(receiver_receiverFSM_stateReg)
        `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY : begin
          if(when_AXI4StreamInterface_l45) begin
            if(_zz_1[0]) begin
              receiver_buffer_0 <= io_input_payload;
            end
            if(_zz_1[1]) begin
              receiver_buffer_1 <= io_input_payload;
            end
            if(_zz_1[2]) begin
              receiver_buffer_2 <= io_input_payload;
            end
            if(_zz_1[3]) begin
              receiver_buffer_3 <= io_input_payload;
            end
            if(_zz_1[4]) begin
              receiver_buffer_4 <= io_input_payload;
            end
            if(_zz_1[5]) begin
              receiver_buffer_5 <= io_input_payload;
            end
            if(_zz_1[6]) begin
              receiver_buffer_6 <= io_input_payload;
            end
            if(_zz_1[7]) begin
              receiver_buffer_7 <= io_input_payload;
            end
            if(_zz_1[8]) begin
              receiver_buffer_8 <= io_input_payload;
            end
            if(_zz_1[9]) begin
              receiver_buffer_9 <= io_input_payload;
            end
            if(_zz_1[10]) begin
              receiver_buffer_10 <= io_input_payload;
            end
            if(_zz_1[11]) begin
              receiver_buffer_11 <= io_input_payload;
            end
            receiver_sizeCounter <= (receiver_sizeCounter + 4'b0001);
          end
        end
        `receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE : begin
          if(receiver_output_fire) begin
            receiver_buffer_0 <= 255'h0;
            receiver_buffer_1 <= 255'h0;
            receiver_buffer_2 <= 255'h0;
            receiver_buffer_3 <= 255'h0;
            receiver_buffer_4 <= 255'h0;
            receiver_buffer_5 <= 255'h0;
            receiver_buffer_6 <= 255'h0;
            receiver_buffer_7 <= 255'h0;
            receiver_buffer_8 <= 255'h0;
            receiver_buffer_9 <= 255'h0;
            receiver_buffer_10 <= 255'h0;
            receiver_buffer_11 <= 255'h0;
            receiver_idCounter <= (receiver_idCounter + 7'h01);
            receiver_sizeCounter <= 4'b0000;
            if(when_AXI4StreamInterface_l65) begin
              receiver_buffer_0 <= io_input_payload;
              receiver_sizeCounter <= 4'b0001;
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(receiver_output_ready) begin
      receiver_output_rData_round_index <= receiver_output_payload_round_index;
      receiver_output_rData_state_size <= receiver_output_payload_state_size;
      receiver_output_rData_state_id <= receiver_output_payload_state_id;
      receiver_output_rData_state_elements_0 <= receiver_output_payload_state_elements_0;
      receiver_output_rData_state_elements_1 <= receiver_output_payload_state_elements_1;
      receiver_output_rData_state_elements_2 <= receiver_output_payload_state_elements_2;
      receiver_output_rData_state_elements_3 <= receiver_output_payload_state_elements_3;
      receiver_output_rData_state_elements_4 <= receiver_output_payload_state_elements_4;
      receiver_output_rData_state_elements_5 <= receiver_output_payload_state_elements_5;
      receiver_output_rData_state_elements_6 <= receiver_output_payload_state_elements_6;
      receiver_output_rData_state_elements_7 <= receiver_output_payload_state_elements_7;
      receiver_output_rData_state_elements_8 <= receiver_output_payload_state_elements_8;
      receiver_output_rData_state_elements_9 <= receiver_output_payload_state_elements_9;
      receiver_output_rData_state_elements_10 <= receiver_output_payload_state_elements_10;
      receiver_output_rData_state_elements_11 <= receiver_output_payload_state_elements_11;
    end
  end


endmodule

module StreamMux (
  input      [2:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_state_id,
  input      [254:0]  io_inputs_0_payload_state_element,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [6:0]    io_inputs_1_payload_state_id,
  input      [254:0]  io_inputs_1_payload_state_element,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [6:0]    io_inputs_2_payload_state_id,
  input      [254:0]  io_inputs_2_payload_state_element,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input      [6:0]    io_inputs_3_payload_state_id,
  input      [254:0]  io_inputs_3_payload_state_element,
  input               io_inputs_4_valid,
  output              io_inputs_4_ready,
  input      [6:0]    io_inputs_4_payload_state_id,
  input      [254:0]  io_inputs_4_payload_state_element,
  input               io_inputs_5_valid,
  output              io_inputs_5_ready,
  input      [6:0]    io_inputs_5_payload_state_id,
  input      [254:0]  io_inputs_5_payload_state_element,
  input               io_inputs_6_valid,
  output              io_inputs_6_ready,
  input      [6:0]    io_inputs_6_payload_state_id,
  input      [254:0]  io_inputs_6_payload_state_element,
  input               io_inputs_7_valid,
  output              io_inputs_7_ready,
  input      [6:0]    io_inputs_7_payload_state_id,
  input      [254:0]  io_inputs_7_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element
);
  reg                 _zz_io_output_valid;
  reg        [6:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_element;

  always @(*) begin
    case(io_select)
      3'b000 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload_state_id = io_inputs_0_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_0_payload_state_element;
      end
      3'b001 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload_state_id = io_inputs_1_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_1_payload_state_element;
      end
      3'b010 : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload_state_id = io_inputs_2_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_2_payload_state_element;
      end
      3'b011 : begin
        _zz_io_output_valid = io_inputs_3_valid;
        _zz_io_output_payload_state_id = io_inputs_3_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_3_payload_state_element;
      end
      3'b100 : begin
        _zz_io_output_valid = io_inputs_4_valid;
        _zz_io_output_payload_state_id = io_inputs_4_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_4_payload_state_element;
      end
      3'b101 : begin
        _zz_io_output_valid = io_inputs_5_valid;
        _zz_io_output_payload_state_id = io_inputs_5_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_5_payload_state_element;
      end
      3'b110 : begin
        _zz_io_output_valid = io_inputs_6_valid;
        _zz_io_output_payload_state_id = io_inputs_6_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_6_payload_state_element;
      end
      default : begin
        _zz_io_output_valid = io_inputs_7_valid;
        _zz_io_output_payload_state_id = io_inputs_7_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_7_payload_state_element;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 3'b000) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 3'b001) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 3'b010) && io_output_ready);
  assign io_inputs_3_ready = ((io_select == 3'b011) && io_output_ready);
  assign io_inputs_4_ready = ((io_select == 3'b100) && io_output_ready);
  assign io_inputs_5_ready = ((io_select == 3'b101) && io_output_ready);
  assign io_inputs_6_ready = ((io_select == 3'b110) && io_output_ready);
  assign io_inputs_7_ready = ((io_select == 3'b111) && io_output_ready);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_element = _zz_io_output_payload_state_element;

endmodule

module StreamDemux_48 (
  input      [2:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element,
  output reg          io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [6:0]    io_outputs_2_payload_state_id,
  output     [254:0]  io_outputs_2_payload_state_element,
  output reg          io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [6:0]    io_outputs_3_payload_state_id,
  output     [254:0]  io_outputs_3_payload_state_element,
  output reg          io_outputs_4_valid,
  input               io_outputs_4_ready,
  output     [6:0]    io_outputs_4_payload_state_id,
  output     [254:0]  io_outputs_4_payload_state_element,
  output reg          io_outputs_5_valid,
  input               io_outputs_5_ready,
  output     [6:0]    io_outputs_5_payload_state_id,
  output     [254:0]  io_outputs_5_payload_state_element,
  output reg          io_outputs_6_valid,
  input               io_outputs_6_ready,
  output     [6:0]    io_outputs_6_payload_state_id,
  output     [254:0]  io_outputs_6_payload_state_element,
  output reg          io_outputs_7_valid,
  input               io_outputs_7_ready,
  output     [6:0]    io_outputs_7_payload_state_id,
  output     [254:0]  io_outputs_7_payload_state_element
);
  wire                when_Stream_l745;
  wire                when_Stream_l745_1;
  wire                when_Stream_l745_2;
  wire                when_Stream_l745_3;
  wire                when_Stream_l745_4;
  wire                when_Stream_l745_5;
  wire                when_Stream_l745_6;
  wire                when_Stream_l745_7;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l745) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l745_1) begin
      io_input_ready = io_outputs_1_ready;
    end
    if(!when_Stream_l745_2) begin
      io_input_ready = io_outputs_2_ready;
    end
    if(!when_Stream_l745_3) begin
      io_input_ready = io_outputs_3_ready;
    end
    if(!when_Stream_l745_4) begin
      io_input_ready = io_outputs_4_ready;
    end
    if(!when_Stream_l745_5) begin
      io_input_ready = io_outputs_5_ready;
    end
    if(!when_Stream_l745_6) begin
      io_input_ready = io_outputs_6_ready;
    end
    if(!when_Stream_l745_7) begin
      io_input_ready = io_outputs_7_ready;
    end
  end

  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745 = (3'b000 != io_select);
  always @(*) begin
    if(when_Stream_l745) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_1 = (3'b001 != io_select);
  always @(*) begin
    if(when_Stream_l745_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  assign io_outputs_2_payload_state_id = io_input_payload_state_id;
  assign io_outputs_2_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_2 = (3'b010 != io_select);
  always @(*) begin
    if(when_Stream_l745_2) begin
      io_outputs_2_valid = 1'b0;
    end else begin
      io_outputs_2_valid = io_input_valid;
    end
  end

  assign io_outputs_3_payload_state_id = io_input_payload_state_id;
  assign io_outputs_3_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_3 = (3'b011 != io_select);
  always @(*) begin
    if(when_Stream_l745_3) begin
      io_outputs_3_valid = 1'b0;
    end else begin
      io_outputs_3_valid = io_input_valid;
    end
  end

  assign io_outputs_4_payload_state_id = io_input_payload_state_id;
  assign io_outputs_4_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_4 = (3'b100 != io_select);
  always @(*) begin
    if(when_Stream_l745_4) begin
      io_outputs_4_valid = 1'b0;
    end else begin
      io_outputs_4_valid = io_input_valid;
    end
  end

  assign io_outputs_5_payload_state_id = io_input_payload_state_id;
  assign io_outputs_5_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_5 = (3'b101 != io_select);
  always @(*) begin
    if(when_Stream_l745_5) begin
      io_outputs_5_valid = 1'b0;
    end else begin
      io_outputs_5_valid = io_input_valid;
    end
  end

  assign io_outputs_6_payload_state_id = io_input_payload_state_id;
  assign io_outputs_6_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_6 = (3'b110 != io_select);
  always @(*) begin
    if(when_Stream_l745_6) begin
      io_outputs_6_valid = 1'b0;
    end else begin
      io_outputs_6_valid = io_input_valid;
    end
  end

  assign io_outputs_7_payload_state_id = io_input_payload_state_id;
  assign io_outputs_7_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_7 = (3'b111 != io_select);
  always @(*) begin
    if(when_Stream_l745_7) begin
      io_outputs_7_valid = 1'b0;
    end else begin
      io_outputs_7_valid = io_input_valid;
    end
  end


endmodule

//StreamFifo_9 replaced by StreamFifo_9

//LoopbackDeMux replaced by LoopbackDeMux

module PoseidonThread_2 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [1:0]    AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex;
  wire       [2:0]    AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex;
  reg        [254:0]  AddRoundConstantStage_modAdder_op2_i;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_modAdder_res_o;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_element;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element;
  wire                montMultiplierPipedSim_45_io_input_ready;
  wire                montMultiplierPipedSim_45_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_45_io_output_payload_res;
  wire                montMultiplierPipedSim_46_io_input_ready;
  wire                montMultiplierPipedSim_46_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_46_io_output_payload_res;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_occupancy;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_availability;
  wire                SBox5Stage_tempOutput_fork_io_input_ready;
  wire                SBox5Stage_tempOutput_fork_io_outputs_0_valid;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_0_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_element;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_valid;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element;
  wire                montMultiplierPipedSim_47_io_input_ready;
  wire                montMultiplierPipedSim_47_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_47_io_output_payload_res;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element;
  wire       [2:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire       [2:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_availability;
  wire                mDSMatrixMultiplier_3_io_input_ready;
  wire                mDSMatrixMultiplier_3_io_output_valid;
  wire       [6:0]    mDSMatrixMultiplier_3_io_output_payload_round_index;
  wire       [3:0]    mDSMatrixMultiplier_3_io_output_payload_state_size;
  wire       [6:0]    mDSMatrixMultiplier_3_io_output_payload_state_id;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_0;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_1;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_2;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_3;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_4;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_5;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_6;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_7;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_8;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_9;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_10;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_11;
  wire                mDSMatrixAdders_3_io_input_ready;
  wire                mDSMatrixAdders_3_io_output_valid;
  wire       [6:0]    mDSMatrixAdders_3_io_output_payload_round_index;
  wire       [3:0]    mDSMatrixAdders_3_io_output_payload_state_size;
  wire       [6:0]    mDSMatrixAdders_3_io_output_payload_state_id;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_0;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_1;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_2;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_3;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_4;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_5;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_6;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_7;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_8;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_9;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_10;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_11;
  wire                AddRoundConstantStage_output_valid;
  wire                AddRoundConstantStage_output_ready;
  wire       [6:0]    AddRoundConstantStage_output_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_payload_state_id;
  reg        [254:0]  AddRoundConstantStage_output_payload_state_element;
  wire                when_PoseidonThread_l61;
  wire                AddRoundConstantStage_output_s2mPipe_valid;
  reg                 AddRoundConstantStage_output_s2mPipe_ready;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_payload_state_element;
  reg                 AddRoundConstantStage_output_rValid;
  reg        [6:0]    AddRoundConstantStage_output_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_size;
  reg        [6:0]    AddRoundConstantStage_output_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_rData_state_element;
  wire                AddRoundConstantStage_output_s2mPipe_input_valid;
  wire                AddRoundConstantStage_output_s2mPipe_input_ready;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  reg                 AddRoundConstantStage_output_s2mPipe_rValid;
  reg        [6:0]    AddRoundConstantStage_output_s2mPipe_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_s2mPipe_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_s2mPipe_rData_state_size;
  reg        [6:0]    AddRoundConstantStage_output_s2mPipe_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_s2mPipe_rData_state_element;
  wire                when_Stream_l342;
  wire                SBox5Stage_mulInput0_valid;
  wire                SBox5Stage_mulInput0_ready;
  wire       [254:0]  SBox5Stage_mulInput0_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput0_payload_op2;
  wire                SBox5Stage_mulInput1_valid;
  wire                SBox5Stage_mulInput1_ready;
  wire       [254:0]  SBox5Stage_mulInput1_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput1_payload_op2;
  wire                SBox5Stage_tempOutput_valid;
  wire                SBox5Stage_tempOutput_ready;
  wire       [254:0]  SBox5Stage_tempOutput_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_payload__2_state_element;
  wire                SBox5Stage_tempOutput_fire;
  wire                SBox5Stage_tempOutput_fire_1;
  wire                SBox5Stage_mulInput2_valid;
  wire                SBox5Stage_mulInput2_ready;
  wire       [254:0]  SBox5Stage_mulInput2_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput2_payload_op2;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element;
  reg                 SBox5Stage_partialRound;
  wire                SBox5Stage_bypassSBox5;
  wire                _zz_SBox5Stage_output_valid;
  wire                _zz_io_output_ready;
  reg        [254:0]  _zz_SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_valid;
  reg                 SBox5Stage_output_ready;
  wire       [6:0]    SBox5Stage_output_payload_round_index;
  wire       [3:0]    SBox5Stage_output_payload_state_index;
  wire       [3:0]    SBox5Stage_output_payload_state_size;
  wire       [6:0]    SBox5Stage_output_payload_state_id;
  wire       [254:0]  SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_m2sPipe_valid;
  wire                SBox5Stage_output_m2sPipe_ready;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_size;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_payload_state_element;
  reg                 SBox5Stage_output_rValid;
  reg        [6:0]    SBox5Stage_output_rData_round_index;
  reg        [3:0]    SBox5Stage_output_rData_state_index;
  reg        [3:0]    SBox5Stage_output_rData_state_size;
  reg        [6:0]    SBox5Stage_output_rData_state_id;
  reg        [254:0]  SBox5Stage_output_rData_state_element;
  wire                when_Stream_l342_1;

  RoundConstants_8 AddRoundConstantStage_roundConstants_t3 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data        ), //o
    .io_readPorts_0_tIndex        (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex      ), //i
    .io_readPorts_0_roundIndex    (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex  )  //i
  );
  RoundConstants_9 AddRoundConstantStage_roundConstants_t5 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data        ), //o
    .io_readPorts_0_tIndex        (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex      ), //i
    .io_readPorts_0_roundIndex    (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex  )  //i
  );
  RoundConstants_10 AddRoundConstantStage_roundConstants_t9 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data  ), //o
    .io_readPorts_0_tIndex        (io_input_payload_state_index                                 ), //i
    .io_readPorts_0_roundIndex    (io_input_payload_round_index                                 )  //i
  );
  RoundConstants_11 AddRoundConstantStage_roundConstants_t12 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data  ), //o
    .io_readPorts_0_tIndex        (io_input_payload_state_index                                  ), //i
    .io_readPorts_0_roundIndex    (io_input_payload_round_index                                  )  //i
  );
  ModAdder AddRoundConstantStage_modAdder (
    .op1_i    (io_input_payload_state_element        ), //i
    .op2_i    (AddRoundConstantStage_modAdder_op2_i  ), //i
    .res_o    (AddRoundConstantStage_modAdder_res_o  )  //o
  );
  StreamFork AddRoundConstantStage_output_s2mPipe_input_fork (
    .io_input_valid                        (AddRoundConstantStage_output_s2mPipe_input_valid                                    ), //i
    .io_input_ready                        (AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (AddRoundConstantStage_output_s2mPipe_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (AddRoundConstantStage_output_s2mPipe_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (AddRoundConstantStage_output_s2mPipe_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (AddRoundConstantStage_output_s2mPipe_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (AddRoundConstantStage_output_s2mPipe_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (SBox5Stage_mulInput0_ready                                                          ), //i
    .io_outputs_0_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready     ), //i
    .io_outputs_1_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_45 (
    .io_input_valid           (SBox5Stage_mulInput0_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_45_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput0_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput0_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_45_io_output_valid        ), //o
    .io_output_ready          (SBox5Stage_mulInput1_ready                       ), //i
    .io_output_payload_res    (montMultiplierPipedSim_45_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_46 (
    .io_input_valid           (SBox5Stage_mulInput1_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_46_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput1_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput1_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_46_io_output_valid        ), //o
    .io_output_ready          (SBox5Stage_tempOutput_fire                       ), //i
    .io_output_payload_res    (montMultiplierPipedSim_46_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo_3 AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo (
    .io_push_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid                              ), //i
    .io_push_ready                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready                 ), //o
    .io_push_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index                ), //i
    .io_push_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index                ), //i
    .io_push_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size                 ), //i
    .io_push_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id                   ), //i
    .io_push_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element              ), //i
    .io_pop_valid                     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid                  ), //o
    .io_pop_ready                     (SBox5Stage_tempOutput_fire_1                                                                    ), //i
    .io_pop_payload_round_index       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index    ), //o
    .io_pop_payload_state_index       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index    ), //o
    .io_pop_payload_state_size        (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size     ), //o
    .io_pop_payload_state_id          (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id       ), //o
    .io_pop_payload_state_element     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element  ), //o
    .io_flush                         (1'b0                                                                                            ), //i
    .io_occupancy                     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_occupancy                  ), //o
    .io_availability                  (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_availability               ), //o
    .clk                              (clk                                                                                             ), //i
    .reset                            (reset                                                                                           )  //i
  );
  StreamFork_7 SBox5Stage_tempOutput_fork (
    .io_input_valid                           (SBox5Stage_tempOutput_valid                                       ), //i
    .io_input_ready                           (SBox5Stage_tempOutput_fork_io_input_ready                         ), //o
    .io_input_payload__1_res                  (SBox5Stage_tempOutput_payload__1_res                              ), //i
    .io_input_payload__2_round_index          (SBox5Stage_tempOutput_payload__2_round_index                      ), //i
    .io_input_payload__2_state_index          (SBox5Stage_tempOutput_payload__2_state_index                      ), //i
    .io_input_payload__2_state_size           (SBox5Stage_tempOutput_payload__2_state_size                       ), //i
    .io_input_payload__2_state_id             (SBox5Stage_tempOutput_payload__2_state_id                         ), //i
    .io_input_payload__2_state_element        (SBox5Stage_tempOutput_payload__2_state_element                    ), //i
    .io_outputs_0_valid                       (SBox5Stage_tempOutput_fork_io_outputs_0_valid                     ), //o
    .io_outputs_0_ready                       (SBox5Stage_mulInput2_ready                                        ), //i
    .io_outputs_0_payload__1_res              (SBox5Stage_tempOutput_fork_io_outputs_0_payload__1_res            ), //o
    .io_outputs_0_payload__2_round_index      (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_round_index    ), //o
    .io_outputs_0_payload__2_state_index      (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_index    ), //o
    .io_outputs_0_payload__2_state_size       (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_size     ), //o
    .io_outputs_0_payload__2_state_id         (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_id       ), //o
    .io_outputs_0_payload__2_state_element    (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_element  ), //o
    .io_outputs_1_valid                       (SBox5Stage_tempOutput_fork_io_outputs_1_valid                     ), //o
    .io_outputs_1_ready                       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready          ), //i
    .io_outputs_1_payload__1_res              (SBox5Stage_tempOutput_fork_io_outputs_1_payload__1_res            ), //o
    .io_outputs_1_payload__2_round_index      (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index    ), //o
    .io_outputs_1_payload__2_state_index      (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index    ), //o
    .io_outputs_1_payload__2_state_size       (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size     ), //o
    .io_outputs_1_payload__2_state_id         (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id       ), //o
    .io_outputs_1_payload__2_state_element    (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_47 (
    .io_input_valid           (SBox5Stage_mulInput2_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_47_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput2_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput2_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_47_io_output_valid        ), //o
    .io_output_ready          (_zz_io_output_ready                              ), //i
    .io_output_payload_res    (montMultiplierPipedSim_47_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo_4 SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo (
    .io_push_valid                    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid                              ), //i
    .io_push_ready                    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready                 ), //o
    .io_push_payload_round_index      (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index                ), //i
    .io_push_payload_state_index      (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index                ), //i
    .io_push_payload_state_size       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size                 ), //i
    .io_push_payload_state_id         (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id                   ), //i
    .io_push_payload_state_element    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element              ), //i
    .io_pop_valid                     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid                  ), //o
    .io_pop_ready                     (_zz_io_output_ready                                                                   ), //i
    .io_pop_payload_round_index       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index    ), //o
    .io_pop_payload_state_index       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index    ), //o
    .io_pop_payload_state_size        (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size     ), //o
    .io_pop_payload_state_id          (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id       ), //o
    .io_pop_payload_state_element     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element  ), //o
    .io_flush                         (1'b0                                                                                  ), //i
    .io_occupancy                     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_occupancy                  ), //o
    .io_availability                  (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_availability               ), //o
    .clk                              (clk                                                                                   ), //i
    .reset                            (reset                                                                                 )  //i
  );
  MDSMatrixMultiplier_2 mDSMatrixMultiplier_3 (
    .io_input_valid                         (SBox5Stage_output_m2sPipe_valid                            ), //i
    .io_input_ready                         (mDSMatrixMultiplier_3_io_input_ready                       ), //o
    .io_input_payload_round_index           (SBox5Stage_output_m2sPipe_payload_round_index              ), //i
    .io_input_payload_state_index           (SBox5Stage_output_m2sPipe_payload_state_index              ), //i
    .io_input_payload_state_size            (SBox5Stage_output_m2sPipe_payload_state_size               ), //i
    .io_input_payload_state_id              (SBox5Stage_output_m2sPipe_payload_state_id                 ), //i
    .io_input_payload_state_element         (SBox5Stage_output_m2sPipe_payload_state_element            ), //i
    .io_output_valid                        (mDSMatrixMultiplier_3_io_output_valid                      ), //o
    .io_output_ready                        (mDSMatrixAdders_3_io_input_ready                           ), //i
    .io_output_payload_round_index          (mDSMatrixMultiplier_3_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (mDSMatrixMultiplier_3_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (mDSMatrixMultiplier_3_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (mDSMatrixMultiplier_3_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (mDSMatrixMultiplier_3_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (mDSMatrixMultiplier_3_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (mDSMatrixMultiplier_3_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (mDSMatrixMultiplier_3_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (mDSMatrixMultiplier_3_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (mDSMatrixMultiplier_3_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (mDSMatrixMultiplier_3_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (mDSMatrixMultiplier_3_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (mDSMatrixMultiplier_3_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (mDSMatrixMultiplier_3_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (mDSMatrixMultiplier_3_io_output_payload_state_elements_11  ), //o
    .clk                                    (clk                                                        ), //i
    .reset                                  (reset                                                      )  //i
  );
  MDSMatrixAdders_2 mDSMatrixAdders_3 (
    .io_input_valid                         (mDSMatrixMultiplier_3_io_output_valid                      ), //i
    .io_input_ready                         (mDSMatrixAdders_3_io_input_ready                           ), //o
    .io_input_payload_round_index           (mDSMatrixMultiplier_3_io_output_payload_round_index        ), //i
    .io_input_payload_state_size            (mDSMatrixMultiplier_3_io_output_payload_state_size         ), //i
    .io_input_payload_state_id              (mDSMatrixMultiplier_3_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0      (mDSMatrixMultiplier_3_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1      (mDSMatrixMultiplier_3_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2      (mDSMatrixMultiplier_3_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3      (mDSMatrixMultiplier_3_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4      (mDSMatrixMultiplier_3_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5      (mDSMatrixMultiplier_3_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6      (mDSMatrixMultiplier_3_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7      (mDSMatrixMultiplier_3_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8      (mDSMatrixMultiplier_3_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9      (mDSMatrixMultiplier_3_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10     (mDSMatrixMultiplier_3_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11     (mDSMatrixMultiplier_3_io_output_payload_state_elements_11  ), //i
    .io_output_valid                        (mDSMatrixAdders_3_io_output_valid                          ), //o
    .io_output_ready                        (io_output_ready                                            ), //i
    .io_output_payload_round_index          (mDSMatrixAdders_3_io_output_payload_round_index            ), //o
    .io_output_payload_state_size           (mDSMatrixAdders_3_io_output_payload_state_size             ), //o
    .io_output_payload_state_id             (mDSMatrixAdders_3_io_output_payload_state_id               ), //o
    .io_output_payload_state_elements_0     (mDSMatrixAdders_3_io_output_payload_state_elements_0       ), //o
    .io_output_payload_state_elements_1     (mDSMatrixAdders_3_io_output_payload_state_elements_1       ), //o
    .io_output_payload_state_elements_2     (mDSMatrixAdders_3_io_output_payload_state_elements_2       ), //o
    .io_output_payload_state_elements_3     (mDSMatrixAdders_3_io_output_payload_state_elements_3       ), //o
    .io_output_payload_state_elements_4     (mDSMatrixAdders_3_io_output_payload_state_elements_4       ), //o
    .io_output_payload_state_elements_5     (mDSMatrixAdders_3_io_output_payload_state_elements_5       ), //o
    .io_output_payload_state_elements_6     (mDSMatrixAdders_3_io_output_payload_state_elements_6       ), //o
    .io_output_payload_state_elements_7     (mDSMatrixAdders_3_io_output_payload_state_elements_7       ), //o
    .io_output_payload_state_elements_8     (mDSMatrixAdders_3_io_output_payload_state_elements_8       ), //o
    .io_output_payload_state_elements_9     (mDSMatrixAdders_3_io_output_payload_state_elements_9       ), //o
    .io_output_payload_state_elements_10    (mDSMatrixAdders_3_io_output_payload_state_elements_10      ), //o
    .io_output_payload_state_elements_11    (mDSMatrixAdders_3_io_output_payload_state_elements_11      ), //o
    .clk                                    (clk                                                        ), //i
    .reset                                  (reset                                                      )  //i
  );
  assign AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex = io_input_payload_state_index[1:0];
  assign AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex = io_input_payload_state_index[2:0];
  assign AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex = io_input_payload_round_index[5:0];
  assign AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex = io_input_payload_round_index[5:0];
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data;
      end
      4'b0101 : begin
        if(when_PoseidonThread_l61) begin
          AddRoundConstantStage_modAdder_op2_i = 255'h0;
        end else begin
          AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data;
        end
      end
      4'b1001 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data;
      end
      4'b1100 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data;
      end
      default : begin
        AddRoundConstantStage_modAdder_op2_i = 255'h0;
      end
    endcase
  end

  assign when_PoseidonThread_l61 = (io_input_payload_state_index == 4'b0101);
  assign AddRoundConstantStage_output_valid = io_input_valid;
  assign io_input_ready = AddRoundConstantStage_output_ready;
  assign AddRoundConstantStage_output_payload_round_index = io_input_payload_round_index;
  assign AddRoundConstantStage_output_payload_state_index = io_input_payload_state_index;
  assign AddRoundConstantStage_output_payload_state_size = io_input_payload_state_size;
  assign AddRoundConstantStage_output_payload_state_id = io_input_payload_state_id;
  always @(*) begin
    AddRoundConstantStage_output_payload_state_element = io_input_payload_state_element;
    AddRoundConstantStage_output_payload_state_element = AddRoundConstantStage_modAdder_res_o;
  end

  assign AddRoundConstantStage_output_ready = (! AddRoundConstantStage_output_rValid);
  assign AddRoundConstantStage_output_s2mPipe_valid = (AddRoundConstantStage_output_valid || AddRoundConstantStage_output_rValid);
  assign AddRoundConstantStage_output_s2mPipe_payload_round_index = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_round_index : AddRoundConstantStage_output_payload_round_index);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_index = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_index : AddRoundConstantStage_output_payload_state_index);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_size = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_size : AddRoundConstantStage_output_payload_state_size);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_id = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_id : AddRoundConstantStage_output_payload_state_id);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_element = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_element : AddRoundConstantStage_output_payload_state_element);
  always @(*) begin
    AddRoundConstantStage_output_s2mPipe_ready = AddRoundConstantStage_output_s2mPipe_input_ready;
    if(when_Stream_l342) begin
      AddRoundConstantStage_output_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! AddRoundConstantStage_output_s2mPipe_input_valid);
  assign AddRoundConstantStage_output_s2mPipe_input_valid = AddRoundConstantStage_output_s2mPipe_rValid;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_round_index = AddRoundConstantStage_output_s2mPipe_rData_round_index;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_index = AddRoundConstantStage_output_s2mPipe_rData_state_index;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_size = AddRoundConstantStage_output_s2mPipe_rData_state_size;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_id = AddRoundConstantStage_output_s2mPipe_rData_state_id;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_element = AddRoundConstantStage_output_s2mPipe_rData_state_element;
  assign AddRoundConstantStage_output_s2mPipe_input_ready = AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready;
  assign SBox5Stage_mulInput0_valid = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid;
  assign SBox5Stage_mulInput0_payload_op1 = AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  assign SBox5Stage_mulInput0_payload_op2 = AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  assign SBox5Stage_mulInput0_ready = montMultiplierPipedSim_45_io_input_ready;
  assign SBox5Stage_mulInput1_valid = montMultiplierPipedSim_45_io_output_valid;
  assign SBox5Stage_mulInput1_payload_op1 = montMultiplierPipedSim_45_io_output_payload_res;
  assign SBox5Stage_mulInput1_payload_op2 = montMultiplierPipedSim_45_io_output_payload_res;
  assign SBox5Stage_mulInput1_ready = montMultiplierPipedSim_46_io_input_ready;
  assign SBox5Stage_tempOutput_valid = (montMultiplierPipedSim_46_io_output_valid && AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid);
  assign SBox5Stage_tempOutput_fire = (SBox5Stage_tempOutput_valid && SBox5Stage_tempOutput_ready);
  assign SBox5Stage_tempOutput_fire_1 = (SBox5Stage_tempOutput_valid && SBox5Stage_tempOutput_ready);
  assign SBox5Stage_tempOutput_payload__1_res = montMultiplierPipedSim_46_io_output_payload_res;
  assign SBox5Stage_tempOutput_payload__2_round_index = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index;
  assign SBox5Stage_tempOutput_payload__2_state_index = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index;
  assign SBox5Stage_tempOutput_payload__2_state_size = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size;
  assign SBox5Stage_tempOutput_payload__2_state_id = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id;
  assign SBox5Stage_tempOutput_payload__2_state_element = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element;
  assign SBox5Stage_tempOutput_ready = SBox5Stage_tempOutput_fork_io_input_ready;
  assign SBox5Stage_mulInput2_valid = SBox5Stage_tempOutput_fork_io_outputs_0_valid;
  assign SBox5Stage_mulInput2_payload_op1 = SBox5Stage_tempOutput_payload__1_res;
  assign SBox5Stage_mulInput2_payload_op2 = SBox5Stage_tempOutput_payload__2_state_element;
  assign SBox5Stage_mulInput2_ready = montMultiplierPipedSim_47_io_input_ready;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid = SBox5Stage_tempOutput_fork_io_outputs_1_valid;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready;
  always @(*) begin
    SBox5Stage_partialRound = 1'b0;
    case(SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size)
      4'b0011 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3b));
      end
      4'b0101 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3c));
      end
      4'b1001 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3d));
      end
      4'b1100 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3d));
      end
      default : begin
      end
    endcase
  end

  assign SBox5Stage_bypassSBox5 = (SBox5Stage_partialRound && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index != 4'b0000));
  assign _zz_io_output_ready = (_zz_SBox5Stage_output_valid && SBox5Stage_output_ready);
  assign _zz_SBox5Stage_output_valid = (montMultiplierPipedSim_47_io_output_valid && SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid);
  always @(*) begin
    _zz_SBox5Stage_output_payload_state_element = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element;
    _zz_SBox5Stage_output_payload_state_element = (SBox5Stage_bypassSBox5 ? SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element : montMultiplierPipedSim_47_io_output_payload_res);
  end

  assign SBox5Stage_output_valid = _zz_SBox5Stage_output_valid;
  assign SBox5Stage_output_payload_round_index = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  assign SBox5Stage_output_payload_state_index = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index;
  assign SBox5Stage_output_payload_state_size = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  assign SBox5Stage_output_payload_state_id = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  assign SBox5Stage_output_payload_state_element = _zz_SBox5Stage_output_payload_state_element;
  always @(*) begin
    SBox5Stage_output_ready = SBox5Stage_output_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      SBox5Stage_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! SBox5Stage_output_m2sPipe_valid);
  assign SBox5Stage_output_m2sPipe_valid = SBox5Stage_output_rValid;
  assign SBox5Stage_output_m2sPipe_payload_round_index = SBox5Stage_output_rData_round_index;
  assign SBox5Stage_output_m2sPipe_payload_state_index = SBox5Stage_output_rData_state_index;
  assign SBox5Stage_output_m2sPipe_payload_state_size = SBox5Stage_output_rData_state_size;
  assign SBox5Stage_output_m2sPipe_payload_state_id = SBox5Stage_output_rData_state_id;
  assign SBox5Stage_output_m2sPipe_payload_state_element = SBox5Stage_output_rData_state_element;
  assign SBox5Stage_output_m2sPipe_ready = mDSMatrixMultiplier_3_io_input_ready;
  assign io_output_valid = mDSMatrixAdders_3_io_output_valid;
  assign io_output_payload_round_index = mDSMatrixAdders_3_io_output_payload_round_index;
  assign io_output_payload_state_size = mDSMatrixAdders_3_io_output_payload_state_size;
  assign io_output_payload_state_id = mDSMatrixAdders_3_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = mDSMatrixAdders_3_io_output_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = mDSMatrixAdders_3_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = mDSMatrixAdders_3_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = mDSMatrixAdders_3_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = mDSMatrixAdders_3_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = mDSMatrixAdders_3_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = mDSMatrixAdders_3_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = mDSMatrixAdders_3_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = mDSMatrixAdders_3_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = mDSMatrixAdders_3_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = mDSMatrixAdders_3_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = mDSMatrixAdders_3_io_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      AddRoundConstantStage_output_rValid <= 1'b0;
      AddRoundConstantStage_output_s2mPipe_rValid <= 1'b0;
      SBox5Stage_output_rValid <= 1'b0;
    end else begin
      if(AddRoundConstantStage_output_valid) begin
        AddRoundConstantStage_output_rValid <= 1'b1;
      end
      if(AddRoundConstantStage_output_s2mPipe_ready) begin
        AddRoundConstantStage_output_rValid <= 1'b0;
      end
      if(AddRoundConstantStage_output_s2mPipe_ready) begin
        AddRoundConstantStage_output_s2mPipe_rValid <= AddRoundConstantStage_output_s2mPipe_valid;
      end
      if(SBox5Stage_output_ready) begin
        SBox5Stage_output_rValid <= SBox5Stage_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(AddRoundConstantStage_output_ready) begin
      AddRoundConstantStage_output_rData_round_index <= AddRoundConstantStage_output_payload_round_index;
      AddRoundConstantStage_output_rData_state_index <= AddRoundConstantStage_output_payload_state_index;
      AddRoundConstantStage_output_rData_state_size <= AddRoundConstantStage_output_payload_state_size;
      AddRoundConstantStage_output_rData_state_id <= AddRoundConstantStage_output_payload_state_id;
      AddRoundConstantStage_output_rData_state_element <= AddRoundConstantStage_output_payload_state_element;
    end
    if(AddRoundConstantStage_output_s2mPipe_ready) begin
      AddRoundConstantStage_output_s2mPipe_rData_round_index <= AddRoundConstantStage_output_s2mPipe_payload_round_index;
      AddRoundConstantStage_output_s2mPipe_rData_state_index <= AddRoundConstantStage_output_s2mPipe_payload_state_index;
      AddRoundConstantStage_output_s2mPipe_rData_state_size <= AddRoundConstantStage_output_s2mPipe_payload_state_size;
      AddRoundConstantStage_output_s2mPipe_rData_state_id <= AddRoundConstantStage_output_s2mPipe_payload_state_id;
      AddRoundConstantStage_output_s2mPipe_rData_state_element <= AddRoundConstantStage_output_s2mPipe_payload_state_element;
    end
    if(SBox5Stage_output_ready) begin
      SBox5Stage_output_rData_round_index <= SBox5Stage_output_payload_round_index;
      SBox5Stage_output_rData_state_index <= SBox5Stage_output_payload_state_index;
      SBox5Stage_output_rData_state_size <= SBox5Stage_output_payload_state_size;
      SBox5Stage_output_rData_state_id <= SBox5Stage_output_payload_state_id;
      SBox5Stage_output_rData_state_element <= SBox5Stage_output_payload_state_element;
    end
  end


endmodule

module PoseidonSerializer_2 (
  input               io_parallelInput_valid,
  output reg          io_parallelInput_ready,
  input      [6:0]    io_parallelInput_payload_round_index,
  input      [3:0]    io_parallelInput_payload_state_size,
  input      [6:0]    io_parallelInput_payload_state_id,
  input      [254:0]  io_parallelInput_payload_state_elements_0,
  input      [254:0]  io_parallelInput_payload_state_elements_1,
  input      [254:0]  io_parallelInput_payload_state_elements_2,
  input      [254:0]  io_parallelInput_payload_state_elements_3,
  input      [254:0]  io_parallelInput_payload_state_elements_4,
  input      [254:0]  io_parallelInput_payload_state_elements_5,
  input      [254:0]  io_parallelInput_payload_state_elements_6,
  input      [254:0]  io_parallelInput_payload_state_elements_7,
  input      [254:0]  io_parallelInput_payload_state_elements_8,
  input      [254:0]  io_parallelInput_payload_state_elements_9,
  input      [254:0]  io_parallelInput_payload_state_elements_10,
  input      [254:0]  io_parallelInput_payload_state_elements_11,
  output reg          io_serialOutput_valid,
  input               io_serialOutput_ready,
  output reg [6:0]    io_serialOutput_payload_round_index,
  output reg [3:0]    io_serialOutput_payload_state_index,
  output reg [3:0]    io_serialOutput_payload_state_size,
  output reg [6:0]    io_serialOutput_payload_state_id,
  output reg [254:0]  io_serialOutput_payload_state_element,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz_lastElementIndex;
  reg        [254:0]  _zz__zz_io_serialOutput_payload_state_element;
  wire       [3:0]    _zz_when_PoseidonSerializer_l68;
  reg        [3:0]    stateSize;
  wire       [3:0]    lastElementIndex;
  reg        [6:0]    roundIndex;
  reg        [6:0]    stateID;
  reg        [254:0]  buffer_0;
  reg        [254:0]  buffer_1;
  reg        [254:0]  buffer_2;
  reg        [254:0]  buffer_3;
  reg        [254:0]  buffer_4;
  reg        [254:0]  buffer_5;
  reg        [254:0]  buffer_6;
  reg        [254:0]  buffer_7;
  reg        [254:0]  buffer_8;
  reg        [254:0]  buffer_9;
  reg        [254:0]  buffer_10;
  reg        [254:0]  buffer_11;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_4_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_4_binary_sequential_type fsm_stateNext;
  wire                io_parallelInput_fire;
  wire       [254:0]  _zz_io_serialOutput_payload_state_element;
  wire                io_serialOutput_fire;
  wire                when_PoseidonSerializer_l68;
  wire                io_serialOutput_fire_1;
  wire                io_parallelInput_fire_1;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [63:0] fsm_stateReg_string;
  reg [63:0] fsm_stateNext_string;
  `endif


  assign _zz_lastElementIndex = (stateSize - 4'b0001);
  assign _zz_when_PoseidonSerializer_l68 = (lastElementIndex - 4'b0001);
  always @(*) begin
    case(fsm_counter)
      4'b0000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_0;
      end
      4'b0001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_1;
      end
      4'b0010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_2;
      end
      4'b0011 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_3;
      end
      4'b0100 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_4;
      end
      4'b0101 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_5;
      end
      4'b0110 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_6;
      end
      4'b0111 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_7;
      end
      4'b1000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_8;
      end
      4'b1001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_9;
      end
      4'b1010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_10;
      end
      default : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_11;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT";
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE";
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : fsm_stateReg_string = "fsm_BUSY";
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : fsm_stateReg_string = "fsm_LAST";
      default : fsm_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_4_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT";
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE";
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : fsm_stateNext_string = "fsm_BUSY";
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : fsm_stateNext_string = "fsm_LAST";
      default : fsm_stateNext_string = "????????";
    endcase
  end
  `endif

  assign lastElementIndex = ((stateSize == 4'b0101) ? stateSize : _zz_lastElementIndex);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    io_parallelInput_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
        io_parallelInput_ready = 1'b1;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          io_parallelInput_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        io_serialOutput_valid = 1'b1;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        io_serialOutput_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_id = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_id = stateID;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_id = stateID;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_size = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_element = 255'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_index = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_round_index = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
        if(io_parallelInput_fire) begin
          fsm_stateNext = `fsm_enumDefinition_4_binary_sequential_fsm_BUSY;
        end
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
        if(io_serialOutput_fire) begin
          if(when_PoseidonSerializer_l68) begin
            fsm_stateNext = `fsm_enumDefinition_4_binary_sequential_fsm_LAST;
          end
        end
      end
      `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          if(io_parallelInput_fire_1) begin
            fsm_stateNext = `fsm_enumDefinition_4_binary_sequential_fsm_BUSY;
          end else begin
            fsm_stateNext = `fsm_enumDefinition_4_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_4_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_4_binary_sequential_fsm_BOOT;
    end
  end

  assign io_parallelInput_fire = (io_parallelInput_valid && io_parallelInput_ready);
  assign _zz_io_serialOutput_payload_state_element = _zz__zz_io_serialOutput_payload_state_element;
  assign io_serialOutput_fire = (io_serialOutput_valid && io_serialOutput_ready);
  assign when_PoseidonSerializer_l68 = (fsm_counter == _zz_when_PoseidonSerializer_l68);
  assign io_serialOutput_fire_1 = (io_serialOutput_valid && io_serialOutput_ready);
  assign io_parallelInput_fire_1 = (io_parallelInput_valid && io_parallelInput_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_4_binary_sequential_fsm_LAST) && (! (fsm_stateNext == `fsm_enumDefinition_4_binary_sequential_fsm_LAST)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateSize <= 4'b0000;
      roundIndex <= 7'h0;
      stateID <= 7'h0;
      buffer_0 <= 255'h0;
      buffer_1 <= 255'h0;
      buffer_2 <= 255'h0;
      buffer_3 <= 255'h0;
      buffer_4 <= 255'h0;
      buffer_5 <= 255'h0;
      buffer_6 <= 255'h0;
      buffer_7 <= 255'h0;
      buffer_8 <= 255'h0;
      buffer_9 <= 255'h0;
      buffer_10 <= 255'h0;
      buffer_11 <= 255'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_4_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_4_binary_sequential_fsm_IDLE : begin
          if(io_parallelInput_fire) begin
            buffer_0 <= io_parallelInput_payload_state_elements_0;
            buffer_1 <= io_parallelInput_payload_state_elements_1;
            buffer_2 <= io_parallelInput_payload_state_elements_2;
            buffer_3 <= io_parallelInput_payload_state_elements_3;
            buffer_4 <= io_parallelInput_payload_state_elements_4;
            buffer_5 <= io_parallelInput_payload_state_elements_5;
            buffer_6 <= io_parallelInput_payload_state_elements_6;
            buffer_7 <= io_parallelInput_payload_state_elements_7;
            buffer_8 <= io_parallelInput_payload_state_elements_8;
            buffer_9 <= io_parallelInput_payload_state_elements_9;
            buffer_10 <= io_parallelInput_payload_state_elements_10;
            buffer_11 <= io_parallelInput_payload_state_elements_11;
            stateID <= io_parallelInput_payload_state_id;
            stateSize <= io_parallelInput_payload_state_size;
            roundIndex <= io_parallelInput_payload_round_index;
          end
        end
        `fsm_enumDefinition_4_binary_sequential_fsm_BUSY : begin
          if(io_serialOutput_fire) begin
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_4_binary_sequential_fsm_LAST : begin
          if(io_serialOutput_fire_1) begin
            if(io_parallelInput_fire_1) begin
              buffer_0 <= io_parallelInput_payload_state_elements_0;
              buffer_1 <= io_parallelInput_payload_state_elements_1;
              buffer_2 <= io_parallelInput_payload_state_elements_2;
              buffer_3 <= io_parallelInput_payload_state_elements_3;
              buffer_4 <= io_parallelInput_payload_state_elements_4;
              buffer_5 <= io_parallelInput_payload_state_elements_5;
              buffer_6 <= io_parallelInput_payload_state_elements_6;
              buffer_7 <= io_parallelInput_payload_state_elements_7;
              buffer_8 <= io_parallelInput_payload_state_elements_8;
              buffer_9 <= io_parallelInput_payload_state_elements_9;
              buffer_10 <= io_parallelInput_payload_state_elements_10;
              buffer_11 <= io_parallelInput_payload_state_elements_11;
              stateID <= io_parallelInput_payload_state_id;
              stateSize <= io_parallelInput_payload_state_size;
              roundIndex <= io_parallelInput_payload_round_index;
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        fsm_counter <= 4'b0000;
      end
    end
  end


endmodule

//StreamArbiter_45 replaced by StreamArbiter_45

//StreamFifo_9 replaced by StreamFifo_9

//LoopbackDeMux replaced by LoopbackDeMux

module PoseidonThread_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [1:0]    AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex;
  wire       [2:0]    AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex;
  reg        [254:0]  AddRoundConstantStage_modAdder_op2_i;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_modAdder_res_o;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_element;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element;
  wire                montMultiplierPipedSim_45_io_input_ready;
  wire                montMultiplierPipedSim_45_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_45_io_output_payload_res;
  wire                montMultiplierPipedSim_46_io_input_ready;
  wire                montMultiplierPipedSim_46_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_46_io_output_payload_res;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_occupancy;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_availability;
  wire                SBox5Stage_tempOutput_fork_io_input_ready;
  wire                SBox5Stage_tempOutput_fork_io_outputs_0_valid;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_0_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_element;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_valid;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element;
  wire                montMultiplierPipedSim_47_io_input_ready;
  wire                montMultiplierPipedSim_47_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_47_io_output_payload_res;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element;
  wire       [2:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire       [2:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_availability;
  wire                mDSMatrixMultiplier_3_io_input_ready;
  wire                mDSMatrixMultiplier_3_io_output_valid;
  wire       [6:0]    mDSMatrixMultiplier_3_io_output_payload_round_index;
  wire       [3:0]    mDSMatrixMultiplier_3_io_output_payload_state_size;
  wire       [6:0]    mDSMatrixMultiplier_3_io_output_payload_state_id;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_0;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_1;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_2;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_3;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_4;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_5;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_6;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_7;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_8;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_9;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_10;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_11;
  wire                mDSMatrixAdders_3_io_input_ready;
  wire                mDSMatrixAdders_3_io_output_valid;
  wire       [6:0]    mDSMatrixAdders_3_io_output_payload_round_index;
  wire       [3:0]    mDSMatrixAdders_3_io_output_payload_state_size;
  wire       [6:0]    mDSMatrixAdders_3_io_output_payload_state_id;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_0;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_1;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_2;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_3;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_4;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_5;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_6;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_7;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_8;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_9;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_10;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_11;
  wire                AddRoundConstantStage_output_valid;
  wire                AddRoundConstantStage_output_ready;
  wire       [6:0]    AddRoundConstantStage_output_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_payload_state_id;
  reg        [254:0]  AddRoundConstantStage_output_payload_state_element;
  wire                when_PoseidonThread_l61;
  wire                AddRoundConstantStage_output_s2mPipe_valid;
  reg                 AddRoundConstantStage_output_s2mPipe_ready;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_payload_state_element;
  reg                 AddRoundConstantStage_output_rValid;
  reg        [6:0]    AddRoundConstantStage_output_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_size;
  reg        [6:0]    AddRoundConstantStage_output_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_rData_state_element;
  wire                AddRoundConstantStage_output_s2mPipe_input_valid;
  wire                AddRoundConstantStage_output_s2mPipe_input_ready;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  reg                 AddRoundConstantStage_output_s2mPipe_rValid;
  reg        [6:0]    AddRoundConstantStage_output_s2mPipe_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_s2mPipe_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_s2mPipe_rData_state_size;
  reg        [6:0]    AddRoundConstantStage_output_s2mPipe_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_s2mPipe_rData_state_element;
  wire                when_Stream_l342;
  wire                SBox5Stage_mulInput0_valid;
  wire                SBox5Stage_mulInput0_ready;
  wire       [254:0]  SBox5Stage_mulInput0_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput0_payload_op2;
  wire                SBox5Stage_mulInput1_valid;
  wire                SBox5Stage_mulInput1_ready;
  wire       [254:0]  SBox5Stage_mulInput1_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput1_payload_op2;
  wire                SBox5Stage_tempOutput_valid;
  wire                SBox5Stage_tempOutput_ready;
  wire       [254:0]  SBox5Stage_tempOutput_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_payload__2_state_element;
  wire                SBox5Stage_tempOutput_fire;
  wire                SBox5Stage_tempOutput_fire_1;
  wire                SBox5Stage_mulInput2_valid;
  wire                SBox5Stage_mulInput2_ready;
  wire       [254:0]  SBox5Stage_mulInput2_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput2_payload_op2;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element;
  reg                 SBox5Stage_partialRound;
  wire                SBox5Stage_bypassSBox5;
  wire                _zz_SBox5Stage_output_valid;
  wire                _zz_io_output_ready;
  reg        [254:0]  _zz_SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_valid;
  reg                 SBox5Stage_output_ready;
  wire       [6:0]    SBox5Stage_output_payload_round_index;
  wire       [3:0]    SBox5Stage_output_payload_state_index;
  wire       [3:0]    SBox5Stage_output_payload_state_size;
  wire       [6:0]    SBox5Stage_output_payload_state_id;
  wire       [254:0]  SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_m2sPipe_valid;
  wire                SBox5Stage_output_m2sPipe_ready;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_size;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_payload_state_element;
  reg                 SBox5Stage_output_rValid;
  reg        [6:0]    SBox5Stage_output_rData_round_index;
  reg        [3:0]    SBox5Stage_output_rData_state_index;
  reg        [3:0]    SBox5Stage_output_rData_state_size;
  reg        [6:0]    SBox5Stage_output_rData_state_id;
  reg        [254:0]  SBox5Stage_output_rData_state_element;
  wire                when_Stream_l342_1;

  RoundConstants_4 AddRoundConstantStage_roundConstants_t3 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data        ), //o
    .io_readPorts_0_tIndex        (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex      ), //i
    .io_readPorts_0_roundIndex    (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex  )  //i
  );
  RoundConstants_5 AddRoundConstantStage_roundConstants_t5 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data        ), //o
    .io_readPorts_0_tIndex        (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex      ), //i
    .io_readPorts_0_roundIndex    (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex  )  //i
  );
  RoundConstants_6 AddRoundConstantStage_roundConstants_t9 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data  ), //o
    .io_readPorts_0_tIndex        (io_input_payload_state_index                                 ), //i
    .io_readPorts_0_roundIndex    (io_input_payload_round_index                                 )  //i
  );
  RoundConstants_7 AddRoundConstantStage_roundConstants_t12 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data  ), //o
    .io_readPorts_0_tIndex        (io_input_payload_state_index                                  ), //i
    .io_readPorts_0_roundIndex    (io_input_payload_round_index                                  )  //i
  );
  ModAdder AddRoundConstantStage_modAdder (
    .op1_i    (io_input_payload_state_element        ), //i
    .op2_i    (AddRoundConstantStage_modAdder_op2_i  ), //i
    .res_o    (AddRoundConstantStage_modAdder_res_o  )  //o
  );
  StreamFork AddRoundConstantStage_output_s2mPipe_input_fork (
    .io_input_valid                        (AddRoundConstantStage_output_s2mPipe_input_valid                                    ), //i
    .io_input_ready                        (AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (AddRoundConstantStage_output_s2mPipe_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (AddRoundConstantStage_output_s2mPipe_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (AddRoundConstantStage_output_s2mPipe_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (AddRoundConstantStage_output_s2mPipe_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (AddRoundConstantStage_output_s2mPipe_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (SBox5Stage_mulInput0_ready                                                          ), //i
    .io_outputs_0_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready     ), //i
    .io_outputs_1_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_45 (
    .io_input_valid           (SBox5Stage_mulInput0_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_45_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput0_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput0_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_45_io_output_valid        ), //o
    .io_output_ready          (SBox5Stage_mulInput1_ready                       ), //i
    .io_output_payload_res    (montMultiplierPipedSim_45_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_46 (
    .io_input_valid           (SBox5Stage_mulInput1_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_46_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput1_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput1_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_46_io_output_valid        ), //o
    .io_output_ready          (SBox5Stage_tempOutput_fire                       ), //i
    .io_output_payload_res    (montMultiplierPipedSim_46_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo_3 AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo (
    .io_push_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid                              ), //i
    .io_push_ready                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready                 ), //o
    .io_push_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index                ), //i
    .io_push_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index                ), //i
    .io_push_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size                 ), //i
    .io_push_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id                   ), //i
    .io_push_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element              ), //i
    .io_pop_valid                     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid                  ), //o
    .io_pop_ready                     (SBox5Stage_tempOutput_fire_1                                                                    ), //i
    .io_pop_payload_round_index       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index    ), //o
    .io_pop_payload_state_index       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index    ), //o
    .io_pop_payload_state_size        (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size     ), //o
    .io_pop_payload_state_id          (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id       ), //o
    .io_pop_payload_state_element     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element  ), //o
    .io_flush                         (1'b0                                                                                            ), //i
    .io_occupancy                     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_occupancy                  ), //o
    .io_availability                  (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_availability               ), //o
    .clk                              (clk                                                                                             ), //i
    .reset                            (reset                                                                                           )  //i
  );
  StreamFork_7 SBox5Stage_tempOutput_fork (
    .io_input_valid                           (SBox5Stage_tempOutput_valid                                       ), //i
    .io_input_ready                           (SBox5Stage_tempOutput_fork_io_input_ready                         ), //o
    .io_input_payload__1_res                  (SBox5Stage_tempOutput_payload__1_res                              ), //i
    .io_input_payload__2_round_index          (SBox5Stage_tempOutput_payload__2_round_index                      ), //i
    .io_input_payload__2_state_index          (SBox5Stage_tempOutput_payload__2_state_index                      ), //i
    .io_input_payload__2_state_size           (SBox5Stage_tempOutput_payload__2_state_size                       ), //i
    .io_input_payload__2_state_id             (SBox5Stage_tempOutput_payload__2_state_id                         ), //i
    .io_input_payload__2_state_element        (SBox5Stage_tempOutput_payload__2_state_element                    ), //i
    .io_outputs_0_valid                       (SBox5Stage_tempOutput_fork_io_outputs_0_valid                     ), //o
    .io_outputs_0_ready                       (SBox5Stage_mulInput2_ready                                        ), //i
    .io_outputs_0_payload__1_res              (SBox5Stage_tempOutput_fork_io_outputs_0_payload__1_res            ), //o
    .io_outputs_0_payload__2_round_index      (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_round_index    ), //o
    .io_outputs_0_payload__2_state_index      (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_index    ), //o
    .io_outputs_0_payload__2_state_size       (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_size     ), //o
    .io_outputs_0_payload__2_state_id         (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_id       ), //o
    .io_outputs_0_payload__2_state_element    (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_element  ), //o
    .io_outputs_1_valid                       (SBox5Stage_tempOutput_fork_io_outputs_1_valid                     ), //o
    .io_outputs_1_ready                       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready          ), //i
    .io_outputs_1_payload__1_res              (SBox5Stage_tempOutput_fork_io_outputs_1_payload__1_res            ), //o
    .io_outputs_1_payload__2_round_index      (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index    ), //o
    .io_outputs_1_payload__2_state_index      (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index    ), //o
    .io_outputs_1_payload__2_state_size       (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size     ), //o
    .io_outputs_1_payload__2_state_id         (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id       ), //o
    .io_outputs_1_payload__2_state_element    (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_47 (
    .io_input_valid           (SBox5Stage_mulInput2_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_47_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput2_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput2_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_47_io_output_valid        ), //o
    .io_output_ready          (_zz_io_output_ready                              ), //i
    .io_output_payload_res    (montMultiplierPipedSim_47_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo_4 SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo (
    .io_push_valid                    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid                              ), //i
    .io_push_ready                    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready                 ), //o
    .io_push_payload_round_index      (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index                ), //i
    .io_push_payload_state_index      (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index                ), //i
    .io_push_payload_state_size       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size                 ), //i
    .io_push_payload_state_id         (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id                   ), //i
    .io_push_payload_state_element    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element              ), //i
    .io_pop_valid                     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid                  ), //o
    .io_pop_ready                     (_zz_io_output_ready                                                                   ), //i
    .io_pop_payload_round_index       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index    ), //o
    .io_pop_payload_state_index       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index    ), //o
    .io_pop_payload_state_size        (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size     ), //o
    .io_pop_payload_state_id          (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id       ), //o
    .io_pop_payload_state_element     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element  ), //o
    .io_flush                         (1'b0                                                                                  ), //i
    .io_occupancy                     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_occupancy                  ), //o
    .io_availability                  (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_availability               ), //o
    .clk                              (clk                                                                                   ), //i
    .reset                            (reset                                                                                 )  //i
  );
  MDSMatrixMultiplier_1 mDSMatrixMultiplier_3 (
    .io_input_valid                         (SBox5Stage_output_m2sPipe_valid                            ), //i
    .io_input_ready                         (mDSMatrixMultiplier_3_io_input_ready                       ), //o
    .io_input_payload_round_index           (SBox5Stage_output_m2sPipe_payload_round_index              ), //i
    .io_input_payload_state_index           (SBox5Stage_output_m2sPipe_payload_state_index              ), //i
    .io_input_payload_state_size            (SBox5Stage_output_m2sPipe_payload_state_size               ), //i
    .io_input_payload_state_id              (SBox5Stage_output_m2sPipe_payload_state_id                 ), //i
    .io_input_payload_state_element         (SBox5Stage_output_m2sPipe_payload_state_element            ), //i
    .io_output_valid                        (mDSMatrixMultiplier_3_io_output_valid                      ), //o
    .io_output_ready                        (mDSMatrixAdders_3_io_input_ready                           ), //i
    .io_output_payload_round_index          (mDSMatrixMultiplier_3_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (mDSMatrixMultiplier_3_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (mDSMatrixMultiplier_3_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (mDSMatrixMultiplier_3_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (mDSMatrixMultiplier_3_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (mDSMatrixMultiplier_3_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (mDSMatrixMultiplier_3_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (mDSMatrixMultiplier_3_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (mDSMatrixMultiplier_3_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (mDSMatrixMultiplier_3_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (mDSMatrixMultiplier_3_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (mDSMatrixMultiplier_3_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (mDSMatrixMultiplier_3_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (mDSMatrixMultiplier_3_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (mDSMatrixMultiplier_3_io_output_payload_state_elements_11  ), //o
    .clk                                    (clk                                                        ), //i
    .reset                                  (reset                                                      )  //i
  );
  MDSMatrixAdders_1 mDSMatrixAdders_3 (
    .io_input_valid                         (mDSMatrixMultiplier_3_io_output_valid                      ), //i
    .io_input_ready                         (mDSMatrixAdders_3_io_input_ready                           ), //o
    .io_input_payload_round_index           (mDSMatrixMultiplier_3_io_output_payload_round_index        ), //i
    .io_input_payload_state_size            (mDSMatrixMultiplier_3_io_output_payload_state_size         ), //i
    .io_input_payload_state_id              (mDSMatrixMultiplier_3_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0      (mDSMatrixMultiplier_3_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1      (mDSMatrixMultiplier_3_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2      (mDSMatrixMultiplier_3_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3      (mDSMatrixMultiplier_3_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4      (mDSMatrixMultiplier_3_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5      (mDSMatrixMultiplier_3_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6      (mDSMatrixMultiplier_3_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7      (mDSMatrixMultiplier_3_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8      (mDSMatrixMultiplier_3_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9      (mDSMatrixMultiplier_3_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10     (mDSMatrixMultiplier_3_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11     (mDSMatrixMultiplier_3_io_output_payload_state_elements_11  ), //i
    .io_output_valid                        (mDSMatrixAdders_3_io_output_valid                          ), //o
    .io_output_ready                        (io_output_ready                                            ), //i
    .io_output_payload_round_index          (mDSMatrixAdders_3_io_output_payload_round_index            ), //o
    .io_output_payload_state_size           (mDSMatrixAdders_3_io_output_payload_state_size             ), //o
    .io_output_payload_state_id             (mDSMatrixAdders_3_io_output_payload_state_id               ), //o
    .io_output_payload_state_elements_0     (mDSMatrixAdders_3_io_output_payload_state_elements_0       ), //o
    .io_output_payload_state_elements_1     (mDSMatrixAdders_3_io_output_payload_state_elements_1       ), //o
    .io_output_payload_state_elements_2     (mDSMatrixAdders_3_io_output_payload_state_elements_2       ), //o
    .io_output_payload_state_elements_3     (mDSMatrixAdders_3_io_output_payload_state_elements_3       ), //o
    .io_output_payload_state_elements_4     (mDSMatrixAdders_3_io_output_payload_state_elements_4       ), //o
    .io_output_payload_state_elements_5     (mDSMatrixAdders_3_io_output_payload_state_elements_5       ), //o
    .io_output_payload_state_elements_6     (mDSMatrixAdders_3_io_output_payload_state_elements_6       ), //o
    .io_output_payload_state_elements_7     (mDSMatrixAdders_3_io_output_payload_state_elements_7       ), //o
    .io_output_payload_state_elements_8     (mDSMatrixAdders_3_io_output_payload_state_elements_8       ), //o
    .io_output_payload_state_elements_9     (mDSMatrixAdders_3_io_output_payload_state_elements_9       ), //o
    .io_output_payload_state_elements_10    (mDSMatrixAdders_3_io_output_payload_state_elements_10      ), //o
    .io_output_payload_state_elements_11    (mDSMatrixAdders_3_io_output_payload_state_elements_11      ), //o
    .clk                                    (clk                                                        ), //i
    .reset                                  (reset                                                      )  //i
  );
  assign AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex = io_input_payload_state_index[1:0];
  assign AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex = io_input_payload_state_index[2:0];
  assign AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex = io_input_payload_round_index[5:0];
  assign AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex = io_input_payload_round_index[5:0];
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data;
      end
      4'b0101 : begin
        if(when_PoseidonThread_l61) begin
          AddRoundConstantStage_modAdder_op2_i = 255'h0;
        end else begin
          AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data;
        end
      end
      4'b1001 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data;
      end
      4'b1100 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data;
      end
      default : begin
        AddRoundConstantStage_modAdder_op2_i = 255'h0;
      end
    endcase
  end

  assign when_PoseidonThread_l61 = (io_input_payload_state_index == 4'b0101);
  assign AddRoundConstantStage_output_valid = io_input_valid;
  assign io_input_ready = AddRoundConstantStage_output_ready;
  assign AddRoundConstantStage_output_payload_round_index = io_input_payload_round_index;
  assign AddRoundConstantStage_output_payload_state_index = io_input_payload_state_index;
  assign AddRoundConstantStage_output_payload_state_size = io_input_payload_state_size;
  assign AddRoundConstantStage_output_payload_state_id = io_input_payload_state_id;
  always @(*) begin
    AddRoundConstantStage_output_payload_state_element = io_input_payload_state_element;
    AddRoundConstantStage_output_payload_state_element = AddRoundConstantStage_modAdder_res_o;
  end

  assign AddRoundConstantStage_output_ready = (! AddRoundConstantStage_output_rValid);
  assign AddRoundConstantStage_output_s2mPipe_valid = (AddRoundConstantStage_output_valid || AddRoundConstantStage_output_rValid);
  assign AddRoundConstantStage_output_s2mPipe_payload_round_index = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_round_index : AddRoundConstantStage_output_payload_round_index);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_index = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_index : AddRoundConstantStage_output_payload_state_index);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_size = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_size : AddRoundConstantStage_output_payload_state_size);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_id = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_id : AddRoundConstantStage_output_payload_state_id);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_element = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_element : AddRoundConstantStage_output_payload_state_element);
  always @(*) begin
    AddRoundConstantStage_output_s2mPipe_ready = AddRoundConstantStage_output_s2mPipe_input_ready;
    if(when_Stream_l342) begin
      AddRoundConstantStage_output_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! AddRoundConstantStage_output_s2mPipe_input_valid);
  assign AddRoundConstantStage_output_s2mPipe_input_valid = AddRoundConstantStage_output_s2mPipe_rValid;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_round_index = AddRoundConstantStage_output_s2mPipe_rData_round_index;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_index = AddRoundConstantStage_output_s2mPipe_rData_state_index;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_size = AddRoundConstantStage_output_s2mPipe_rData_state_size;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_id = AddRoundConstantStage_output_s2mPipe_rData_state_id;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_element = AddRoundConstantStage_output_s2mPipe_rData_state_element;
  assign AddRoundConstantStage_output_s2mPipe_input_ready = AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready;
  assign SBox5Stage_mulInput0_valid = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid;
  assign SBox5Stage_mulInput0_payload_op1 = AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  assign SBox5Stage_mulInput0_payload_op2 = AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  assign SBox5Stage_mulInput0_ready = montMultiplierPipedSim_45_io_input_ready;
  assign SBox5Stage_mulInput1_valid = montMultiplierPipedSim_45_io_output_valid;
  assign SBox5Stage_mulInput1_payload_op1 = montMultiplierPipedSim_45_io_output_payload_res;
  assign SBox5Stage_mulInput1_payload_op2 = montMultiplierPipedSim_45_io_output_payload_res;
  assign SBox5Stage_mulInput1_ready = montMultiplierPipedSim_46_io_input_ready;
  assign SBox5Stage_tempOutput_valid = (montMultiplierPipedSim_46_io_output_valid && AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid);
  assign SBox5Stage_tempOutput_fire = (SBox5Stage_tempOutput_valid && SBox5Stage_tempOutput_ready);
  assign SBox5Stage_tempOutput_fire_1 = (SBox5Stage_tempOutput_valid && SBox5Stage_tempOutput_ready);
  assign SBox5Stage_tempOutput_payload__1_res = montMultiplierPipedSim_46_io_output_payload_res;
  assign SBox5Stage_tempOutput_payload__2_round_index = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index;
  assign SBox5Stage_tempOutput_payload__2_state_index = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index;
  assign SBox5Stage_tempOutput_payload__2_state_size = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size;
  assign SBox5Stage_tempOutput_payload__2_state_id = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id;
  assign SBox5Stage_tempOutput_payload__2_state_element = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element;
  assign SBox5Stage_tempOutput_ready = SBox5Stage_tempOutput_fork_io_input_ready;
  assign SBox5Stage_mulInput2_valid = SBox5Stage_tempOutput_fork_io_outputs_0_valid;
  assign SBox5Stage_mulInput2_payload_op1 = SBox5Stage_tempOutput_payload__1_res;
  assign SBox5Stage_mulInput2_payload_op2 = SBox5Stage_tempOutput_payload__2_state_element;
  assign SBox5Stage_mulInput2_ready = montMultiplierPipedSim_47_io_input_ready;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid = SBox5Stage_tempOutput_fork_io_outputs_1_valid;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready;
  always @(*) begin
    SBox5Stage_partialRound = 1'b0;
    case(SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size)
      4'b0011 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3b));
      end
      4'b0101 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3c));
      end
      4'b1001 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3d));
      end
      4'b1100 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3d));
      end
      default : begin
      end
    endcase
  end

  assign SBox5Stage_bypassSBox5 = (SBox5Stage_partialRound && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index != 4'b0000));
  assign _zz_io_output_ready = (_zz_SBox5Stage_output_valid && SBox5Stage_output_ready);
  assign _zz_SBox5Stage_output_valid = (montMultiplierPipedSim_47_io_output_valid && SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid);
  always @(*) begin
    _zz_SBox5Stage_output_payload_state_element = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element;
    _zz_SBox5Stage_output_payload_state_element = (SBox5Stage_bypassSBox5 ? SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element : montMultiplierPipedSim_47_io_output_payload_res);
  end

  assign SBox5Stage_output_valid = _zz_SBox5Stage_output_valid;
  assign SBox5Stage_output_payload_round_index = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  assign SBox5Stage_output_payload_state_index = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index;
  assign SBox5Stage_output_payload_state_size = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  assign SBox5Stage_output_payload_state_id = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  assign SBox5Stage_output_payload_state_element = _zz_SBox5Stage_output_payload_state_element;
  always @(*) begin
    SBox5Stage_output_ready = SBox5Stage_output_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      SBox5Stage_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! SBox5Stage_output_m2sPipe_valid);
  assign SBox5Stage_output_m2sPipe_valid = SBox5Stage_output_rValid;
  assign SBox5Stage_output_m2sPipe_payload_round_index = SBox5Stage_output_rData_round_index;
  assign SBox5Stage_output_m2sPipe_payload_state_index = SBox5Stage_output_rData_state_index;
  assign SBox5Stage_output_m2sPipe_payload_state_size = SBox5Stage_output_rData_state_size;
  assign SBox5Stage_output_m2sPipe_payload_state_id = SBox5Stage_output_rData_state_id;
  assign SBox5Stage_output_m2sPipe_payload_state_element = SBox5Stage_output_rData_state_element;
  assign SBox5Stage_output_m2sPipe_ready = mDSMatrixMultiplier_3_io_input_ready;
  assign io_output_valid = mDSMatrixAdders_3_io_output_valid;
  assign io_output_payload_round_index = mDSMatrixAdders_3_io_output_payload_round_index;
  assign io_output_payload_state_size = mDSMatrixAdders_3_io_output_payload_state_size;
  assign io_output_payload_state_id = mDSMatrixAdders_3_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = mDSMatrixAdders_3_io_output_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = mDSMatrixAdders_3_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = mDSMatrixAdders_3_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = mDSMatrixAdders_3_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = mDSMatrixAdders_3_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = mDSMatrixAdders_3_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = mDSMatrixAdders_3_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = mDSMatrixAdders_3_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = mDSMatrixAdders_3_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = mDSMatrixAdders_3_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = mDSMatrixAdders_3_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = mDSMatrixAdders_3_io_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      AddRoundConstantStage_output_rValid <= 1'b0;
      AddRoundConstantStage_output_s2mPipe_rValid <= 1'b0;
      SBox5Stage_output_rValid <= 1'b0;
    end else begin
      if(AddRoundConstantStage_output_valid) begin
        AddRoundConstantStage_output_rValid <= 1'b1;
      end
      if(AddRoundConstantStage_output_s2mPipe_ready) begin
        AddRoundConstantStage_output_rValid <= 1'b0;
      end
      if(AddRoundConstantStage_output_s2mPipe_ready) begin
        AddRoundConstantStage_output_s2mPipe_rValid <= AddRoundConstantStage_output_s2mPipe_valid;
      end
      if(SBox5Stage_output_ready) begin
        SBox5Stage_output_rValid <= SBox5Stage_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(AddRoundConstantStage_output_ready) begin
      AddRoundConstantStage_output_rData_round_index <= AddRoundConstantStage_output_payload_round_index;
      AddRoundConstantStage_output_rData_state_index <= AddRoundConstantStage_output_payload_state_index;
      AddRoundConstantStage_output_rData_state_size <= AddRoundConstantStage_output_payload_state_size;
      AddRoundConstantStage_output_rData_state_id <= AddRoundConstantStage_output_payload_state_id;
      AddRoundConstantStage_output_rData_state_element <= AddRoundConstantStage_output_payload_state_element;
    end
    if(AddRoundConstantStage_output_s2mPipe_ready) begin
      AddRoundConstantStage_output_s2mPipe_rData_round_index <= AddRoundConstantStage_output_s2mPipe_payload_round_index;
      AddRoundConstantStage_output_s2mPipe_rData_state_index <= AddRoundConstantStage_output_s2mPipe_payload_state_index;
      AddRoundConstantStage_output_s2mPipe_rData_state_size <= AddRoundConstantStage_output_s2mPipe_payload_state_size;
      AddRoundConstantStage_output_s2mPipe_rData_state_id <= AddRoundConstantStage_output_s2mPipe_payload_state_id;
      AddRoundConstantStage_output_s2mPipe_rData_state_element <= AddRoundConstantStage_output_s2mPipe_payload_state_element;
    end
    if(SBox5Stage_output_ready) begin
      SBox5Stage_output_rData_round_index <= SBox5Stage_output_payload_round_index;
      SBox5Stage_output_rData_state_index <= SBox5Stage_output_payload_state_index;
      SBox5Stage_output_rData_state_size <= SBox5Stage_output_payload_state_size;
      SBox5Stage_output_rData_state_id <= SBox5Stage_output_payload_state_id;
      SBox5Stage_output_rData_state_element <= SBox5Stage_output_payload_state_element;
    end
  end


endmodule

module PoseidonSerializer_1 (
  input               io_parallelInput_valid,
  output reg          io_parallelInput_ready,
  input      [6:0]    io_parallelInput_payload_round_index,
  input      [3:0]    io_parallelInput_payload_state_size,
  input      [6:0]    io_parallelInput_payload_state_id,
  input      [254:0]  io_parallelInput_payload_state_elements_0,
  input      [254:0]  io_parallelInput_payload_state_elements_1,
  input      [254:0]  io_parallelInput_payload_state_elements_2,
  input      [254:0]  io_parallelInput_payload_state_elements_3,
  input      [254:0]  io_parallelInput_payload_state_elements_4,
  input      [254:0]  io_parallelInput_payload_state_elements_5,
  input      [254:0]  io_parallelInput_payload_state_elements_6,
  input      [254:0]  io_parallelInput_payload_state_elements_7,
  input      [254:0]  io_parallelInput_payload_state_elements_8,
  input      [254:0]  io_parallelInput_payload_state_elements_9,
  input      [254:0]  io_parallelInput_payload_state_elements_10,
  input      [254:0]  io_parallelInput_payload_state_elements_11,
  output reg          io_serialOutput_valid,
  input               io_serialOutput_ready,
  output reg [6:0]    io_serialOutput_payload_round_index,
  output reg [3:0]    io_serialOutput_payload_state_index,
  output reg [3:0]    io_serialOutput_payload_state_size,
  output reg [6:0]    io_serialOutput_payload_state_id,
  output reg [254:0]  io_serialOutput_payload_state_element,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz_lastElementIndex;
  reg        [254:0]  _zz__zz_io_serialOutput_payload_state_element;
  wire       [3:0]    _zz_when_PoseidonSerializer_l68;
  reg        [3:0]    stateSize;
  wire       [3:0]    lastElementIndex;
  reg        [6:0]    roundIndex;
  reg        [6:0]    stateID;
  reg        [254:0]  buffer_0;
  reg        [254:0]  buffer_1;
  reg        [254:0]  buffer_2;
  reg        [254:0]  buffer_3;
  reg        [254:0]  buffer_4;
  reg        [254:0]  buffer_5;
  reg        [254:0]  buffer_6;
  reg        [254:0]  buffer_7;
  reg        [254:0]  buffer_8;
  reg        [254:0]  buffer_9;
  reg        [254:0]  buffer_10;
  reg        [254:0]  buffer_11;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_2_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_2_binary_sequential_type fsm_stateNext;
  wire                io_parallelInput_fire;
  wire       [254:0]  _zz_io_serialOutput_payload_state_element;
  wire                io_serialOutput_fire;
  wire                when_PoseidonSerializer_l68;
  wire                io_serialOutput_fire_1;
  wire                io_parallelInput_fire_1;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [63:0] fsm_stateReg_string;
  reg [63:0] fsm_stateNext_string;
  `endif


  assign _zz_lastElementIndex = (stateSize - 4'b0001);
  assign _zz_when_PoseidonSerializer_l68 = (lastElementIndex - 4'b0001);
  always @(*) begin
    case(fsm_counter)
      4'b0000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_0;
      end
      4'b0001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_1;
      end
      4'b0010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_2;
      end
      4'b0011 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_3;
      end
      4'b0100 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_4;
      end
      4'b0101 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_5;
      end
      4'b0110 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_6;
      end
      4'b0111 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_7;
      end
      4'b1000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_8;
      end
      4'b1001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_9;
      end
      4'b1010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_10;
      end
      default : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_11;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT";
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE";
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : fsm_stateReg_string = "fsm_BUSY";
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : fsm_stateReg_string = "fsm_LAST";
      default : fsm_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_2_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT";
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE";
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : fsm_stateNext_string = "fsm_BUSY";
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : fsm_stateNext_string = "fsm_LAST";
      default : fsm_stateNext_string = "????????";
    endcase
  end
  `endif

  assign lastElementIndex = ((stateSize == 4'b0101) ? stateSize : _zz_lastElementIndex);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    io_parallelInput_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
        io_parallelInput_ready = 1'b1;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          io_parallelInput_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        io_serialOutput_valid = 1'b1;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        io_serialOutput_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_id = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_id = stateID;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_id = stateID;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_size = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_element = 255'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_index = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_round_index = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
        if(io_parallelInput_fire) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_BUSY;
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
        if(io_serialOutput_fire) begin
          if(when_PoseidonSerializer_l68) begin
            fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_LAST;
          end
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          if(io_parallelInput_fire_1) begin
            fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_BUSY;
          end else begin
            fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_BOOT;
    end
  end

  assign io_parallelInput_fire = (io_parallelInput_valid && io_parallelInput_ready);
  assign _zz_io_serialOutput_payload_state_element = _zz__zz_io_serialOutput_payload_state_element;
  assign io_serialOutput_fire = (io_serialOutput_valid && io_serialOutput_ready);
  assign when_PoseidonSerializer_l68 = (fsm_counter == _zz_when_PoseidonSerializer_l68);
  assign io_serialOutput_fire_1 = (io_serialOutput_valid && io_serialOutput_ready);
  assign io_parallelInput_fire_1 = (io_parallelInput_valid && io_parallelInput_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_LAST) && (! (fsm_stateNext == `fsm_enumDefinition_2_binary_sequential_fsm_LAST)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateSize <= 4'b0000;
      roundIndex <= 7'h0;
      stateID <= 7'h0;
      buffer_0 <= 255'h0;
      buffer_1 <= 255'h0;
      buffer_2 <= 255'h0;
      buffer_3 <= 255'h0;
      buffer_4 <= 255'h0;
      buffer_5 <= 255'h0;
      buffer_6 <= 255'h0;
      buffer_7 <= 255'h0;
      buffer_8 <= 255'h0;
      buffer_9 <= 255'h0;
      buffer_10 <= 255'h0;
      buffer_11 <= 255'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_2_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
          if(io_parallelInput_fire) begin
            buffer_0 <= io_parallelInput_payload_state_elements_0;
            buffer_1 <= io_parallelInput_payload_state_elements_1;
            buffer_2 <= io_parallelInput_payload_state_elements_2;
            buffer_3 <= io_parallelInput_payload_state_elements_3;
            buffer_4 <= io_parallelInput_payload_state_elements_4;
            buffer_5 <= io_parallelInput_payload_state_elements_5;
            buffer_6 <= io_parallelInput_payload_state_elements_6;
            buffer_7 <= io_parallelInput_payload_state_elements_7;
            buffer_8 <= io_parallelInput_payload_state_elements_8;
            buffer_9 <= io_parallelInput_payload_state_elements_9;
            buffer_10 <= io_parallelInput_payload_state_elements_10;
            buffer_11 <= io_parallelInput_payload_state_elements_11;
            stateID <= io_parallelInput_payload_state_id;
            stateSize <= io_parallelInput_payload_state_size;
            roundIndex <= io_parallelInput_payload_round_index;
          end
        end
        `fsm_enumDefinition_2_binary_sequential_fsm_BUSY : begin
          if(io_serialOutput_fire) begin
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_2_binary_sequential_fsm_LAST : begin
          if(io_serialOutput_fire_1) begin
            if(io_parallelInput_fire_1) begin
              buffer_0 <= io_parallelInput_payload_state_elements_0;
              buffer_1 <= io_parallelInput_payload_state_elements_1;
              buffer_2 <= io_parallelInput_payload_state_elements_2;
              buffer_3 <= io_parallelInput_payload_state_elements_3;
              buffer_4 <= io_parallelInput_payload_state_elements_4;
              buffer_5 <= io_parallelInput_payload_state_elements_5;
              buffer_6 <= io_parallelInput_payload_state_elements_6;
              buffer_7 <= io_parallelInput_payload_state_elements_7;
              buffer_8 <= io_parallelInput_payload_state_elements_8;
              buffer_9 <= io_parallelInput_payload_state_elements_9;
              buffer_10 <= io_parallelInput_payload_state_elements_10;
              buffer_11 <= io_parallelInput_payload_state_elements_11;
              stateID <= io_parallelInput_payload_state_id;
              stateSize <= io_parallelInput_payload_state_size;
              roundIndex <= io_parallelInput_payload_round_index;
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        fsm_counter <= 4'b0000;
      end
    end
  end


endmodule

//StreamArbiter_45 replaced by StreamArbiter_45

module StreamFifo_9 (
  input               io_push_valid,
  output              io_push_ready,
  input      [6:0]    io_push_payload_round_index,
  input      [3:0]    io_push_payload_state_size,
  input      [6:0]    io_push_payload_state_id,
  input      [254:0]  io_push_payload_state_elements_0,
  input      [254:0]  io_push_payload_state_elements_1,
  input      [254:0]  io_push_payload_state_elements_2,
  input      [254:0]  io_push_payload_state_elements_3,
  input      [254:0]  io_push_payload_state_elements_4,
  input      [254:0]  io_push_payload_state_elements_5,
  input      [254:0]  io_push_payload_state_elements_6,
  input      [254:0]  io_push_payload_state_elements_7,
  input      [254:0]  io_push_payload_state_elements_8,
  input      [254:0]  io_push_payload_state_elements_9,
  input      [254:0]  io_push_payload_state_elements_10,
  input      [254:0]  io_push_payload_state_elements_11,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [6:0]    io_pop_payload_round_index,
  output     [3:0]    io_pop_payload_state_size,
  output     [6:0]    io_pop_payload_state_id,
  output     [254:0]  io_pop_payload_state_elements_0,
  output     [254:0]  io_pop_payload_state_elements_1,
  output     [254:0]  io_pop_payload_state_elements_2,
  output     [254:0]  io_pop_payload_state_elements_3,
  output     [254:0]  io_pop_payload_state_elements_4,
  output     [254:0]  io_pop_payload_state_elements_5,
  output     [254:0]  io_pop_payload_state_elements_6,
  output     [254:0]  io_pop_payload_state_elements_7,
  output     [254:0]  io_pop_payload_state_elements_8,
  output     [254:0]  io_pop_payload_state_elements_9,
  output     [254:0]  io_pop_payload_state_elements_10,
  output     [254:0]  io_pop_payload_state_elements_11,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  output reg [2:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [3077:0] _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_round_index;
  wire       [3077:0] _zz_logic_ram_port_1;
  wire       [2:0]    _zz_io_occupancy;
  wire       [2:0]    _zz_io_availability;
  wire       [2:0]    _zz_io_availability_1;
  wire       [2:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [3077:0] _zz_io_pop_payload_round_index;
  wire       [3059:0] _zz_io_pop_payload_state_elements_0;
  wire                when_Stream_l933;
  wire       [2:0]    logic_ptrDif;
  reg [3077:0] logic_ram [0:4];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (3'b101 + logic_ptrDif);
  assign _zz_io_availability = (3'b101 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_round_index = 1'b1;
  assign _zz_logic_ram_port_1 = {{io_push_payload_state_elements_11,{io_push_payload_state_elements_10,{io_push_payload_state_elements_9,{io_push_payload_state_elements_8,{io_push_payload_state_elements_7,{io_push_payload_state_elements_6,{io_push_payload_state_elements_5,{io_push_payload_state_elements_4,{io_push_payload_state_elements_3,{io_push_payload_state_elements_2,{io_push_payload_state_elements_1,io_push_payload_state_elements_0}}}}}}}}}}},{io_push_payload_state_id,{io_push_payload_state_size,io_push_payload_round_index}}};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_round_index) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b100);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b100);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_round_index = _zz_logic_ram_port0;
  assign _zz_io_pop_payload_state_elements_0 = _zz_io_pop_payload_round_index[3077 : 18];
  assign io_pop_payload_round_index = _zz_io_pop_payload_round_index[6 : 0];
  assign io_pop_payload_state_size = _zz_io_pop_payload_round_index[10 : 7];
  assign io_pop_payload_state_id = _zz_io_pop_payload_round_index[17 : 11];
  assign io_pop_payload_state_elements_0 = _zz_io_pop_payload_state_elements_0[254 : 0];
  assign io_pop_payload_state_elements_1 = _zz_io_pop_payload_state_elements_0[509 : 255];
  assign io_pop_payload_state_elements_2 = _zz_io_pop_payload_state_elements_0[764 : 510];
  assign io_pop_payload_state_elements_3 = _zz_io_pop_payload_state_elements_0[1019 : 765];
  assign io_pop_payload_state_elements_4 = _zz_io_pop_payload_state_elements_0[1274 : 1020];
  assign io_pop_payload_state_elements_5 = _zz_io_pop_payload_state_elements_0[1529 : 1275];
  assign io_pop_payload_state_elements_6 = _zz_io_pop_payload_state_elements_0[1784 : 1530];
  assign io_pop_payload_state_elements_7 = _zz_io_pop_payload_state_elements_0[2039 : 1785];
  assign io_pop_payload_state_elements_8 = _zz_io_pop_payload_state_elements_0[2294 : 2040];
  assign io_pop_payload_state_elements_9 = _zz_io_pop_payload_state_elements_0[2549 : 2295];
  assign io_pop_payload_state_elements_10 = _zz_io_pop_payload_state_elements_0[2804 : 2550];
  assign io_pop_payload_state_elements_11 = _zz_io_pop_payload_state_elements_0[3059 : 2805];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 3'b101 : 3'b000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 3'b000 : 3'b101);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module LoopbackDeMux (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output              io_output0_valid,
  input               io_output0_ready,
  output     [6:0]    io_output0_payload_round_index,
  output     [3:0]    io_output0_payload_state_size,
  output     [6:0]    io_output0_payload_state_id,
  output     [254:0]  io_output0_payload_state_elements_0,
  output     [254:0]  io_output0_payload_state_elements_1,
  output     [254:0]  io_output0_payload_state_elements_2,
  output     [254:0]  io_output0_payload_state_elements_3,
  output     [254:0]  io_output0_payload_state_elements_4,
  output     [254:0]  io_output0_payload_state_elements_5,
  output     [254:0]  io_output0_payload_state_elements_6,
  output     [254:0]  io_output0_payload_state_elements_7,
  output     [254:0]  io_output0_payload_state_elements_8,
  output     [254:0]  io_output0_payload_state_elements_9,
  output     [254:0]  io_output0_payload_state_elements_10,
  output     [254:0]  io_output0_payload_state_elements_11,
  output              io_output1_valid,
  input               io_output1_ready,
  output     [6:0]    io_output1_payload_state_id,
  output     [254:0]  io_output1_payload_state_element
);
  wire       [0:0]    streamDemux_50_io_select;
  wire                streamDemux_50_io_input_ready;
  wire                streamDemux_50_io_outputs_0_valid;
  wire       [6:0]    streamDemux_50_io_outputs_0_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_0_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_0_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_state_elements_11;
  wire                streamDemux_50_io_outputs_1_valid;
  wire       [6:0]    streamDemux_50_io_outputs_1_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_1_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_1_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_state_elements_11;
  reg                 select_1;
  reg        [6:0]    _zz_round_index;
  wire                streamDemux_50_io_outputs_0_translated_valid;
  wire                streamDemux_50_io_outputs_0_translated_ready;
  wire       [6:0]    streamDemux_50_io_outputs_0_translated_payload_round_index;
  wire       [3:0]    streamDemux_50_io_outputs_0_translated_payload_state_size;
  wire       [6:0]    streamDemux_50_io_outputs_0_translated_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_0;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_1;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_2;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_3;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_4;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_5;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_6;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_7;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_8;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_9;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_10;
  wire       [254:0]  streamDemux_50_io_outputs_0_translated_payload_state_elements_11;
  wire                streamDemux_50_io_outputs_1_translated_valid;
  wire                streamDemux_50_io_outputs_1_translated_ready;
  wire       [6:0]    streamDemux_50_io_outputs_1_translated_payload_state_id;
  wire       [254:0]  streamDemux_50_io_outputs_1_translated_payload_state_element;

  StreamDemux_45 streamDemux_50 (
    .io_select                                 (streamDemux_50_io_select                               ), //i
    .io_input_valid                            (io_input_valid                                         ), //i
    .io_input_ready                            (streamDemux_50_io_input_ready                          ), //o
    .io_input_payload_round_index              (io_input_payload_round_index                           ), //i
    .io_input_payload_state_size               (io_input_payload_state_size                            ), //i
    .io_input_payload_state_id                 (io_input_payload_state_id                              ), //i
    .io_input_payload_state_elements_0         (io_input_payload_state_elements_0                      ), //i
    .io_input_payload_state_elements_1         (io_input_payload_state_elements_1                      ), //i
    .io_input_payload_state_elements_2         (io_input_payload_state_elements_2                      ), //i
    .io_input_payload_state_elements_3         (io_input_payload_state_elements_3                      ), //i
    .io_input_payload_state_elements_4         (io_input_payload_state_elements_4                      ), //i
    .io_input_payload_state_elements_5         (io_input_payload_state_elements_5                      ), //i
    .io_input_payload_state_elements_6         (io_input_payload_state_elements_6                      ), //i
    .io_input_payload_state_elements_7         (io_input_payload_state_elements_7                      ), //i
    .io_input_payload_state_elements_8         (io_input_payload_state_elements_8                      ), //i
    .io_input_payload_state_elements_9         (io_input_payload_state_elements_9                      ), //i
    .io_input_payload_state_elements_10        (io_input_payload_state_elements_10                     ), //i
    .io_input_payload_state_elements_11        (io_input_payload_state_elements_11                     ), //i
    .io_outputs_0_valid                        (streamDemux_50_io_outputs_0_valid                      ), //o
    .io_outputs_0_ready                        (streamDemux_50_io_outputs_0_translated_ready           ), //i
    .io_outputs_0_payload_round_index          (streamDemux_50_io_outputs_0_payload_round_index        ), //o
    .io_outputs_0_payload_state_size           (streamDemux_50_io_outputs_0_payload_state_size         ), //o
    .io_outputs_0_payload_state_id             (streamDemux_50_io_outputs_0_payload_state_id           ), //o
    .io_outputs_0_payload_state_elements_0     (streamDemux_50_io_outputs_0_payload_state_elements_0   ), //o
    .io_outputs_0_payload_state_elements_1     (streamDemux_50_io_outputs_0_payload_state_elements_1   ), //o
    .io_outputs_0_payload_state_elements_2     (streamDemux_50_io_outputs_0_payload_state_elements_2   ), //o
    .io_outputs_0_payload_state_elements_3     (streamDemux_50_io_outputs_0_payload_state_elements_3   ), //o
    .io_outputs_0_payload_state_elements_4     (streamDemux_50_io_outputs_0_payload_state_elements_4   ), //o
    .io_outputs_0_payload_state_elements_5     (streamDemux_50_io_outputs_0_payload_state_elements_5   ), //o
    .io_outputs_0_payload_state_elements_6     (streamDemux_50_io_outputs_0_payload_state_elements_6   ), //o
    .io_outputs_0_payload_state_elements_7     (streamDemux_50_io_outputs_0_payload_state_elements_7   ), //o
    .io_outputs_0_payload_state_elements_8     (streamDemux_50_io_outputs_0_payload_state_elements_8   ), //o
    .io_outputs_0_payload_state_elements_9     (streamDemux_50_io_outputs_0_payload_state_elements_9   ), //o
    .io_outputs_0_payload_state_elements_10    (streamDemux_50_io_outputs_0_payload_state_elements_10  ), //o
    .io_outputs_0_payload_state_elements_11    (streamDemux_50_io_outputs_0_payload_state_elements_11  ), //o
    .io_outputs_1_valid                        (streamDemux_50_io_outputs_1_valid                      ), //o
    .io_outputs_1_ready                        (streamDemux_50_io_outputs_1_translated_ready           ), //i
    .io_outputs_1_payload_round_index          (streamDemux_50_io_outputs_1_payload_round_index        ), //o
    .io_outputs_1_payload_state_size           (streamDemux_50_io_outputs_1_payload_state_size         ), //o
    .io_outputs_1_payload_state_id             (streamDemux_50_io_outputs_1_payload_state_id           ), //o
    .io_outputs_1_payload_state_elements_0     (streamDemux_50_io_outputs_1_payload_state_elements_0   ), //o
    .io_outputs_1_payload_state_elements_1     (streamDemux_50_io_outputs_1_payload_state_elements_1   ), //o
    .io_outputs_1_payload_state_elements_2     (streamDemux_50_io_outputs_1_payload_state_elements_2   ), //o
    .io_outputs_1_payload_state_elements_3     (streamDemux_50_io_outputs_1_payload_state_elements_3   ), //o
    .io_outputs_1_payload_state_elements_4     (streamDemux_50_io_outputs_1_payload_state_elements_4   ), //o
    .io_outputs_1_payload_state_elements_5     (streamDemux_50_io_outputs_1_payload_state_elements_5   ), //o
    .io_outputs_1_payload_state_elements_6     (streamDemux_50_io_outputs_1_payload_state_elements_6   ), //o
    .io_outputs_1_payload_state_elements_7     (streamDemux_50_io_outputs_1_payload_state_elements_7   ), //o
    .io_outputs_1_payload_state_elements_8     (streamDemux_50_io_outputs_1_payload_state_elements_8   ), //o
    .io_outputs_1_payload_state_elements_9     (streamDemux_50_io_outputs_1_payload_state_elements_9   ), //o
    .io_outputs_1_payload_state_elements_10    (streamDemux_50_io_outputs_1_payload_state_elements_10  ), //o
    .io_outputs_1_payload_state_elements_11    (streamDemux_50_io_outputs_1_payload_state_elements_11  )  //o
  );
  always @(*) begin
    select_1 = 1'b0;
    case(io_input_payload_state_size)
      4'b0011 : begin
        select_1 = (io_input_payload_round_index == 7'h3e);
      end
      4'b0101 : begin
        select_1 = (io_input_payload_round_index == 7'h3f);
      end
      4'b1001 : begin
        select_1 = (io_input_payload_round_index == 7'h40);
      end
      4'b1100 : begin
        select_1 = (io_input_payload_round_index == 7'h40);
      end
      default : begin
      end
    endcase
  end

  assign io_input_ready = streamDemux_50_io_input_ready;
  assign streamDemux_50_io_select = select_1;
  always @(*) begin
    _zz_round_index = streamDemux_50_io_outputs_0_payload_round_index;
    _zz_round_index = (streamDemux_50_io_outputs_0_payload_round_index + 7'h01);
  end

  assign streamDemux_50_io_outputs_0_translated_valid = streamDemux_50_io_outputs_0_valid;
  assign streamDemux_50_io_outputs_0_translated_payload_round_index = _zz_round_index;
  assign streamDemux_50_io_outputs_0_translated_payload_state_size = streamDemux_50_io_outputs_0_payload_state_size;
  assign streamDemux_50_io_outputs_0_translated_payload_state_id = streamDemux_50_io_outputs_0_payload_state_id;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_0 = streamDemux_50_io_outputs_0_payload_state_elements_0;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_1 = streamDemux_50_io_outputs_0_payload_state_elements_1;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_2 = streamDemux_50_io_outputs_0_payload_state_elements_2;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_3 = streamDemux_50_io_outputs_0_payload_state_elements_3;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_4 = streamDemux_50_io_outputs_0_payload_state_elements_4;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_5 = streamDemux_50_io_outputs_0_payload_state_elements_5;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_6 = streamDemux_50_io_outputs_0_payload_state_elements_6;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_7 = streamDemux_50_io_outputs_0_payload_state_elements_7;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_8 = streamDemux_50_io_outputs_0_payload_state_elements_8;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_9 = streamDemux_50_io_outputs_0_payload_state_elements_9;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_10 = streamDemux_50_io_outputs_0_payload_state_elements_10;
  assign streamDemux_50_io_outputs_0_translated_payload_state_elements_11 = streamDemux_50_io_outputs_0_payload_state_elements_11;
  assign io_output0_valid = streamDemux_50_io_outputs_0_translated_valid;
  assign streamDemux_50_io_outputs_0_translated_ready = io_output0_ready;
  assign io_output0_payload_round_index = streamDemux_50_io_outputs_0_translated_payload_round_index;
  assign io_output0_payload_state_size = streamDemux_50_io_outputs_0_translated_payload_state_size;
  assign io_output0_payload_state_id = streamDemux_50_io_outputs_0_translated_payload_state_id;
  assign io_output0_payload_state_elements_0 = streamDemux_50_io_outputs_0_translated_payload_state_elements_0;
  assign io_output0_payload_state_elements_1 = streamDemux_50_io_outputs_0_translated_payload_state_elements_1;
  assign io_output0_payload_state_elements_2 = streamDemux_50_io_outputs_0_translated_payload_state_elements_2;
  assign io_output0_payload_state_elements_3 = streamDemux_50_io_outputs_0_translated_payload_state_elements_3;
  assign io_output0_payload_state_elements_4 = streamDemux_50_io_outputs_0_translated_payload_state_elements_4;
  assign io_output0_payload_state_elements_5 = streamDemux_50_io_outputs_0_translated_payload_state_elements_5;
  assign io_output0_payload_state_elements_6 = streamDemux_50_io_outputs_0_translated_payload_state_elements_6;
  assign io_output0_payload_state_elements_7 = streamDemux_50_io_outputs_0_translated_payload_state_elements_7;
  assign io_output0_payload_state_elements_8 = streamDemux_50_io_outputs_0_translated_payload_state_elements_8;
  assign io_output0_payload_state_elements_9 = streamDemux_50_io_outputs_0_translated_payload_state_elements_9;
  assign io_output0_payload_state_elements_10 = streamDemux_50_io_outputs_0_translated_payload_state_elements_10;
  assign io_output0_payload_state_elements_11 = streamDemux_50_io_outputs_0_translated_payload_state_elements_11;
  assign streamDemux_50_io_outputs_1_translated_valid = streamDemux_50_io_outputs_1_valid;
  assign streamDemux_50_io_outputs_1_translated_payload_state_id = streamDemux_50_io_outputs_1_payload_state_id;
  assign streamDemux_50_io_outputs_1_translated_payload_state_element = streamDemux_50_io_outputs_1_payload_state_elements_1;
  assign io_output1_valid = streamDemux_50_io_outputs_1_translated_valid;
  assign streamDemux_50_io_outputs_1_translated_ready = io_output1_ready;
  assign io_output1_payload_state_id = streamDemux_50_io_outputs_1_translated_payload_state_id;
  assign io_output1_payload_state_element = streamDemux_50_io_outputs_1_translated_payload_state_element;

endmodule

module PoseidonThread (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [1:0]    AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex;
  wire       [2:0]    AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex;
  reg        [254:0]  AddRoundConstantStage_modAdder_op2_i;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data;
  wire       [254:0]  AddRoundConstantStage_modAdder_res_o;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_element;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element;
  wire                montMultiplierPipedSim_45_io_input_ready;
  wire                montMultiplierPipedSim_45_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_45_io_output_payload_res;
  wire                montMultiplierPipedSim_46_io_input_ready;
  wire                montMultiplierPipedSim_46_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_46_io_output_payload_res;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready;
  wire                AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_occupancy;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_availability;
  wire                SBox5Stage_tempOutput_fork_io_input_ready;
  wire                SBox5Stage_tempOutput_fork_io_outputs_0_valid;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_0_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_element;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_valid;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element;
  wire                montMultiplierPipedSim_47_io_input_ready;
  wire                montMultiplierPipedSim_47_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_47_io_output_payload_res;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element;
  wire       [2:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire       [2:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_availability;
  wire                mDSMatrixMultiplier_3_io_input_ready;
  wire                mDSMatrixMultiplier_3_io_output_valid;
  wire       [6:0]    mDSMatrixMultiplier_3_io_output_payload_round_index;
  wire       [3:0]    mDSMatrixMultiplier_3_io_output_payload_state_size;
  wire       [6:0]    mDSMatrixMultiplier_3_io_output_payload_state_id;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_0;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_1;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_2;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_3;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_4;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_5;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_6;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_7;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_8;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_9;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_10;
  wire       [254:0]  mDSMatrixMultiplier_3_io_output_payload_state_elements_11;
  wire                mDSMatrixAdders_3_io_input_ready;
  wire                mDSMatrixAdders_3_io_output_valid;
  wire       [6:0]    mDSMatrixAdders_3_io_output_payload_round_index;
  wire       [3:0]    mDSMatrixAdders_3_io_output_payload_state_size;
  wire       [6:0]    mDSMatrixAdders_3_io_output_payload_state_id;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_0;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_1;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_2;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_3;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_4;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_5;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_6;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_7;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_8;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_9;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_10;
  wire       [254:0]  mDSMatrixAdders_3_io_output_payload_state_elements_11;
  wire                AddRoundConstantStage_output_valid;
  wire                AddRoundConstantStage_output_ready;
  wire       [6:0]    AddRoundConstantStage_output_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_payload_state_id;
  reg        [254:0]  AddRoundConstantStage_output_payload_state_element;
  wire                when_PoseidonThread_l61;
  wire                AddRoundConstantStage_output_s2mPipe_valid;
  reg                 AddRoundConstantStage_output_s2mPipe_ready;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_payload_state_element;
  reg                 AddRoundConstantStage_output_rValid;
  reg        [6:0]    AddRoundConstantStage_output_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_size;
  reg        [6:0]    AddRoundConstantStage_output_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_rData_state_element;
  wire                AddRoundConstantStage_output_s2mPipe_input_valid;
  wire                AddRoundConstantStage_output_s2mPipe_input_ready;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_size;
  wire       [6:0]    AddRoundConstantStage_output_s2mPipe_input_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  reg                 AddRoundConstantStage_output_s2mPipe_rValid;
  reg        [6:0]    AddRoundConstantStage_output_s2mPipe_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_s2mPipe_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_s2mPipe_rData_state_size;
  reg        [6:0]    AddRoundConstantStage_output_s2mPipe_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_s2mPipe_rData_state_element;
  wire                when_Stream_l342;
  wire                SBox5Stage_mulInput0_valid;
  wire                SBox5Stage_mulInput0_ready;
  wire       [254:0]  SBox5Stage_mulInput0_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput0_payload_op2;
  wire                SBox5Stage_mulInput1_valid;
  wire                SBox5Stage_mulInput1_ready;
  wire       [254:0]  SBox5Stage_mulInput1_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput1_payload_op2;
  wire                SBox5Stage_tempOutput_valid;
  wire                SBox5Stage_tempOutput_ready;
  wire       [254:0]  SBox5Stage_tempOutput_payload__1_res;
  wire       [6:0]    SBox5Stage_tempOutput_payload__2_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_payload__2_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_payload__2_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_payload__2_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_payload__2_state_element;
  wire                SBox5Stage_tempOutput_fire;
  wire                SBox5Stage_tempOutput_fire_1;
  wire                SBox5Stage_mulInput2_valid;
  wire                SBox5Stage_mulInput2_ready;
  wire       [254:0]  SBox5Stage_mulInput2_payload_op1;
  wire       [254:0]  SBox5Stage_mulInput2_payload_op2;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid;
  wire                SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index;
  wire       [3:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size;
  wire       [6:0]    SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id;
  wire       [254:0]  SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element;
  reg                 SBox5Stage_partialRound;
  wire                SBox5Stage_bypassSBox5;
  wire                _zz_SBox5Stage_output_valid;
  wire                _zz_io_output_ready;
  reg        [254:0]  _zz_SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_valid;
  reg                 SBox5Stage_output_ready;
  wire       [6:0]    SBox5Stage_output_payload_round_index;
  wire       [3:0]    SBox5Stage_output_payload_state_index;
  wire       [3:0]    SBox5Stage_output_payload_state_size;
  wire       [6:0]    SBox5Stage_output_payload_state_id;
  wire       [254:0]  SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_m2sPipe_valid;
  wire                SBox5Stage_output_m2sPipe_ready;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_size;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_payload_state_element;
  reg                 SBox5Stage_output_rValid;
  reg        [6:0]    SBox5Stage_output_rData_round_index;
  reg        [3:0]    SBox5Stage_output_rData_state_index;
  reg        [3:0]    SBox5Stage_output_rData_state_size;
  reg        [6:0]    SBox5Stage_output_rData_state_id;
  reg        [254:0]  SBox5Stage_output_rData_state_element;
  wire                when_Stream_l342_1;

  RoundConstants AddRoundConstantStage_roundConstants_t3 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data        ), //o
    .io_readPorts_0_tIndex        (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex      ), //i
    .io_readPorts_0_roundIndex    (AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex  )  //i
  );
  RoundConstants_1 AddRoundConstantStage_roundConstants_t5 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data        ), //o
    .io_readPorts_0_tIndex        (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex      ), //i
    .io_readPorts_0_roundIndex    (AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex  )  //i
  );
  RoundConstants_2 AddRoundConstantStage_roundConstants_t9 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data  ), //o
    .io_readPorts_0_tIndex        (io_input_payload_state_index                                 ), //i
    .io_readPorts_0_roundIndex    (io_input_payload_round_index                                 )  //i
  );
  RoundConstants_3 AddRoundConstantStage_roundConstants_t12 (
    .io_readPorts_0_data          (AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data  ), //o
    .io_readPorts_0_tIndex        (io_input_payload_state_index                                  ), //i
    .io_readPorts_0_roundIndex    (io_input_payload_round_index                                  )  //i
  );
  ModAdder AddRoundConstantStage_modAdder (
    .op1_i    (io_input_payload_state_element        ), //i
    .op2_i    (AddRoundConstantStage_modAdder_op2_i  ), //i
    .res_o    (AddRoundConstantStage_modAdder_res_o  )  //o
  );
  StreamFork AddRoundConstantStage_output_s2mPipe_input_fork (
    .io_input_valid                        (AddRoundConstantStage_output_s2mPipe_input_valid                                    ), //i
    .io_input_ready                        (AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (AddRoundConstantStage_output_s2mPipe_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (AddRoundConstantStage_output_s2mPipe_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (AddRoundConstantStage_output_s2mPipe_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (AddRoundConstantStage_output_s2mPipe_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (AddRoundConstantStage_output_s2mPipe_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (SBox5Stage_mulInput0_ready                                                          ), //i
    .io_outputs_0_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready     ), //i
    .io_outputs_1_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_45 (
    .io_input_valid           (SBox5Stage_mulInput0_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_45_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput0_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput0_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_45_io_output_valid        ), //o
    .io_output_ready          (SBox5Stage_mulInput1_ready                       ), //i
    .io_output_payload_res    (montMultiplierPipedSim_45_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_46 (
    .io_input_valid           (SBox5Stage_mulInput1_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_46_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput1_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput1_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_46_io_output_valid        ), //o
    .io_output_ready          (SBox5Stage_tempOutput_fire                       ), //i
    .io_output_payload_res    (montMultiplierPipedSim_46_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo_3 AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo (
    .io_push_valid                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_valid                              ), //i
    .io_push_ready                    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_push_ready                 ), //o
    .io_push_payload_round_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_round_index                ), //i
    .io_push_payload_state_index      (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_index                ), //i
    .io_push_payload_state_size       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_size                 ), //i
    .io_push_payload_state_id         (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_id                   ), //i
    .io_push_payload_state_element    (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_payload_state_element              ), //i
    .io_pop_valid                     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid                  ), //o
    .io_pop_ready                     (SBox5Stage_tempOutput_fire_1                                                                    ), //i
    .io_pop_payload_round_index       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index    ), //o
    .io_pop_payload_state_index       (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index    ), //o
    .io_pop_payload_state_size        (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size     ), //o
    .io_pop_payload_state_id          (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id       ), //o
    .io_pop_payload_state_element     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element  ), //o
    .io_flush                         (1'b0                                                                                            ), //i
    .io_occupancy                     (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_occupancy                  ), //o
    .io_availability                  (AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_availability               ), //o
    .clk                              (clk                                                                                             ), //i
    .reset                            (reset                                                                                           )  //i
  );
  StreamFork_7 SBox5Stage_tempOutput_fork (
    .io_input_valid                           (SBox5Stage_tempOutput_valid                                       ), //i
    .io_input_ready                           (SBox5Stage_tempOutput_fork_io_input_ready                         ), //o
    .io_input_payload__1_res                  (SBox5Stage_tempOutput_payload__1_res                              ), //i
    .io_input_payload__2_round_index          (SBox5Stage_tempOutput_payload__2_round_index                      ), //i
    .io_input_payload__2_state_index          (SBox5Stage_tempOutput_payload__2_state_index                      ), //i
    .io_input_payload__2_state_size           (SBox5Stage_tempOutput_payload__2_state_size                       ), //i
    .io_input_payload__2_state_id             (SBox5Stage_tempOutput_payload__2_state_id                         ), //i
    .io_input_payload__2_state_element        (SBox5Stage_tempOutput_payload__2_state_element                    ), //i
    .io_outputs_0_valid                       (SBox5Stage_tempOutput_fork_io_outputs_0_valid                     ), //o
    .io_outputs_0_ready                       (SBox5Stage_mulInput2_ready                                        ), //i
    .io_outputs_0_payload__1_res              (SBox5Stage_tempOutput_fork_io_outputs_0_payload__1_res            ), //o
    .io_outputs_0_payload__2_round_index      (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_round_index    ), //o
    .io_outputs_0_payload__2_state_index      (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_index    ), //o
    .io_outputs_0_payload__2_state_size       (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_size     ), //o
    .io_outputs_0_payload__2_state_id         (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_id       ), //o
    .io_outputs_0_payload__2_state_element    (SBox5Stage_tempOutput_fork_io_outputs_0_payload__2_state_element  ), //o
    .io_outputs_1_valid                       (SBox5Stage_tempOutput_fork_io_outputs_1_valid                     ), //o
    .io_outputs_1_ready                       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready          ), //i
    .io_outputs_1_payload__1_res              (SBox5Stage_tempOutput_fork_io_outputs_1_payload__1_res            ), //o
    .io_outputs_1_payload__2_round_index      (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index    ), //o
    .io_outputs_1_payload__2_state_index      (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index    ), //o
    .io_outputs_1_payload__2_state_size       (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size     ), //o
    .io_outputs_1_payload__2_state_id         (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id       ), //o
    .io_outputs_1_payload__2_state_element    (SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_47 (
    .io_input_valid           (SBox5Stage_mulInput2_valid                       ), //i
    .io_input_ready           (montMultiplierPipedSim_47_io_input_ready         ), //o
    .io_input_payload_op1     (SBox5Stage_mulInput2_payload_op1                 ), //i
    .io_input_payload_op2     (SBox5Stage_mulInput2_payload_op2                 ), //i
    .io_output_valid          (montMultiplierPipedSim_47_io_output_valid        ), //o
    .io_output_ready          (_zz_io_output_ready                              ), //i
    .io_output_payload_res    (montMultiplierPipedSim_47_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo_4 SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo (
    .io_push_valid                    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid                              ), //i
    .io_push_ready                    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready                 ), //o
    .io_push_payload_round_index      (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index                ), //i
    .io_push_payload_state_index      (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index                ), //i
    .io_push_payload_state_size       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size                 ), //i
    .io_push_payload_state_id         (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id                   ), //i
    .io_push_payload_state_element    (SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element              ), //i
    .io_pop_valid                     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid                  ), //o
    .io_pop_ready                     (_zz_io_output_ready                                                                   ), //i
    .io_pop_payload_round_index       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index    ), //o
    .io_pop_payload_state_index       (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index    ), //o
    .io_pop_payload_state_size        (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size     ), //o
    .io_pop_payload_state_id          (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id       ), //o
    .io_pop_payload_state_element     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element  ), //o
    .io_flush                         (1'b0                                                                                  ), //i
    .io_occupancy                     (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_occupancy                  ), //o
    .io_availability                  (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_availability               ), //o
    .clk                              (clk                                                                                   ), //i
    .reset                            (reset                                                                                 )  //i
  );
  MDSMatrixMultiplier mDSMatrixMultiplier_3 (
    .io_input_valid                         (SBox5Stage_output_m2sPipe_valid                            ), //i
    .io_input_ready                         (mDSMatrixMultiplier_3_io_input_ready                       ), //o
    .io_input_payload_round_index           (SBox5Stage_output_m2sPipe_payload_round_index              ), //i
    .io_input_payload_state_index           (SBox5Stage_output_m2sPipe_payload_state_index              ), //i
    .io_input_payload_state_size            (SBox5Stage_output_m2sPipe_payload_state_size               ), //i
    .io_input_payload_state_id              (SBox5Stage_output_m2sPipe_payload_state_id                 ), //i
    .io_input_payload_state_element         (SBox5Stage_output_m2sPipe_payload_state_element            ), //i
    .io_output_valid                        (mDSMatrixMultiplier_3_io_output_valid                      ), //o
    .io_output_ready                        (mDSMatrixAdders_3_io_input_ready                           ), //i
    .io_output_payload_round_index          (mDSMatrixMultiplier_3_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (mDSMatrixMultiplier_3_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (mDSMatrixMultiplier_3_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (mDSMatrixMultiplier_3_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (mDSMatrixMultiplier_3_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (mDSMatrixMultiplier_3_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (mDSMatrixMultiplier_3_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (mDSMatrixMultiplier_3_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (mDSMatrixMultiplier_3_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (mDSMatrixMultiplier_3_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (mDSMatrixMultiplier_3_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (mDSMatrixMultiplier_3_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (mDSMatrixMultiplier_3_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (mDSMatrixMultiplier_3_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (mDSMatrixMultiplier_3_io_output_payload_state_elements_11  ), //o
    .clk                                    (clk                                                        ), //i
    .reset                                  (reset                                                      )  //i
  );
  MDSMatrixAdders mDSMatrixAdders_3 (
    .io_input_valid                         (mDSMatrixMultiplier_3_io_output_valid                      ), //i
    .io_input_ready                         (mDSMatrixAdders_3_io_input_ready                           ), //o
    .io_input_payload_round_index           (mDSMatrixMultiplier_3_io_output_payload_round_index        ), //i
    .io_input_payload_state_size            (mDSMatrixMultiplier_3_io_output_payload_state_size         ), //i
    .io_input_payload_state_id              (mDSMatrixMultiplier_3_io_output_payload_state_id           ), //i
    .io_input_payload_state_elements_0      (mDSMatrixMultiplier_3_io_output_payload_state_elements_0   ), //i
    .io_input_payload_state_elements_1      (mDSMatrixMultiplier_3_io_output_payload_state_elements_1   ), //i
    .io_input_payload_state_elements_2      (mDSMatrixMultiplier_3_io_output_payload_state_elements_2   ), //i
    .io_input_payload_state_elements_3      (mDSMatrixMultiplier_3_io_output_payload_state_elements_3   ), //i
    .io_input_payload_state_elements_4      (mDSMatrixMultiplier_3_io_output_payload_state_elements_4   ), //i
    .io_input_payload_state_elements_5      (mDSMatrixMultiplier_3_io_output_payload_state_elements_5   ), //i
    .io_input_payload_state_elements_6      (mDSMatrixMultiplier_3_io_output_payload_state_elements_6   ), //i
    .io_input_payload_state_elements_7      (mDSMatrixMultiplier_3_io_output_payload_state_elements_7   ), //i
    .io_input_payload_state_elements_8      (mDSMatrixMultiplier_3_io_output_payload_state_elements_8   ), //i
    .io_input_payload_state_elements_9      (mDSMatrixMultiplier_3_io_output_payload_state_elements_9   ), //i
    .io_input_payload_state_elements_10     (mDSMatrixMultiplier_3_io_output_payload_state_elements_10  ), //i
    .io_input_payload_state_elements_11     (mDSMatrixMultiplier_3_io_output_payload_state_elements_11  ), //i
    .io_output_valid                        (mDSMatrixAdders_3_io_output_valid                          ), //o
    .io_output_ready                        (io_output_ready                                            ), //i
    .io_output_payload_round_index          (mDSMatrixAdders_3_io_output_payload_round_index            ), //o
    .io_output_payload_state_size           (mDSMatrixAdders_3_io_output_payload_state_size             ), //o
    .io_output_payload_state_id             (mDSMatrixAdders_3_io_output_payload_state_id               ), //o
    .io_output_payload_state_elements_0     (mDSMatrixAdders_3_io_output_payload_state_elements_0       ), //o
    .io_output_payload_state_elements_1     (mDSMatrixAdders_3_io_output_payload_state_elements_1       ), //o
    .io_output_payload_state_elements_2     (mDSMatrixAdders_3_io_output_payload_state_elements_2       ), //o
    .io_output_payload_state_elements_3     (mDSMatrixAdders_3_io_output_payload_state_elements_3       ), //o
    .io_output_payload_state_elements_4     (mDSMatrixAdders_3_io_output_payload_state_elements_4       ), //o
    .io_output_payload_state_elements_5     (mDSMatrixAdders_3_io_output_payload_state_elements_5       ), //o
    .io_output_payload_state_elements_6     (mDSMatrixAdders_3_io_output_payload_state_elements_6       ), //o
    .io_output_payload_state_elements_7     (mDSMatrixAdders_3_io_output_payload_state_elements_7       ), //o
    .io_output_payload_state_elements_8     (mDSMatrixAdders_3_io_output_payload_state_elements_8       ), //o
    .io_output_payload_state_elements_9     (mDSMatrixAdders_3_io_output_payload_state_elements_9       ), //o
    .io_output_payload_state_elements_10    (mDSMatrixAdders_3_io_output_payload_state_elements_10      ), //o
    .io_output_payload_state_elements_11    (mDSMatrixAdders_3_io_output_payload_state_elements_11      ), //o
    .clk                                    (clk                                                        ), //i
    .reset                                  (reset                                                      )  //i
  );
  assign AddRoundConstantStage_roundConstants_t3_io_readPorts_0_tIndex = io_input_payload_state_index[1:0];
  assign AddRoundConstantStage_roundConstants_t5_io_readPorts_0_tIndex = io_input_payload_state_index[2:0];
  assign AddRoundConstantStage_roundConstants_t3_io_readPorts_0_roundIndex = io_input_payload_round_index[5:0];
  assign AddRoundConstantStage_roundConstants_t5_io_readPorts_0_roundIndex = io_input_payload_round_index[5:0];
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t3_io_readPorts_0_data;
      end
      4'b0101 : begin
        if(when_PoseidonThread_l61) begin
          AddRoundConstantStage_modAdder_op2_i = 255'h0;
        end else begin
          AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t5_io_readPorts_0_data;
        end
      end
      4'b1001 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t9_io_readPorts_0_data;
      end
      4'b1100 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t12_io_readPorts_0_data;
      end
      default : begin
        AddRoundConstantStage_modAdder_op2_i = 255'h0;
      end
    endcase
  end

  assign when_PoseidonThread_l61 = (io_input_payload_state_index == 4'b0101);
  assign AddRoundConstantStage_output_valid = io_input_valid;
  assign io_input_ready = AddRoundConstantStage_output_ready;
  assign AddRoundConstantStage_output_payload_round_index = io_input_payload_round_index;
  assign AddRoundConstantStage_output_payload_state_index = io_input_payload_state_index;
  assign AddRoundConstantStage_output_payload_state_size = io_input_payload_state_size;
  assign AddRoundConstantStage_output_payload_state_id = io_input_payload_state_id;
  always @(*) begin
    AddRoundConstantStage_output_payload_state_element = io_input_payload_state_element;
    AddRoundConstantStage_output_payload_state_element = AddRoundConstantStage_modAdder_res_o;
  end

  assign AddRoundConstantStage_output_ready = (! AddRoundConstantStage_output_rValid);
  assign AddRoundConstantStage_output_s2mPipe_valid = (AddRoundConstantStage_output_valid || AddRoundConstantStage_output_rValid);
  assign AddRoundConstantStage_output_s2mPipe_payload_round_index = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_round_index : AddRoundConstantStage_output_payload_round_index);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_index = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_index : AddRoundConstantStage_output_payload_state_index);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_size = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_size : AddRoundConstantStage_output_payload_state_size);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_id = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_id : AddRoundConstantStage_output_payload_state_id);
  assign AddRoundConstantStage_output_s2mPipe_payload_state_element = (AddRoundConstantStage_output_rValid ? AddRoundConstantStage_output_rData_state_element : AddRoundConstantStage_output_payload_state_element);
  always @(*) begin
    AddRoundConstantStage_output_s2mPipe_ready = AddRoundConstantStage_output_s2mPipe_input_ready;
    if(when_Stream_l342) begin
      AddRoundConstantStage_output_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! AddRoundConstantStage_output_s2mPipe_input_valid);
  assign AddRoundConstantStage_output_s2mPipe_input_valid = AddRoundConstantStage_output_s2mPipe_rValid;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_round_index = AddRoundConstantStage_output_s2mPipe_rData_round_index;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_index = AddRoundConstantStage_output_s2mPipe_rData_state_index;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_size = AddRoundConstantStage_output_s2mPipe_rData_state_size;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_id = AddRoundConstantStage_output_s2mPipe_rData_state_id;
  assign AddRoundConstantStage_output_s2mPipe_input_payload_state_element = AddRoundConstantStage_output_s2mPipe_rData_state_element;
  assign AddRoundConstantStage_output_s2mPipe_input_ready = AddRoundConstantStage_output_s2mPipe_input_fork_io_input_ready;
  assign SBox5Stage_mulInput0_valid = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_0_valid;
  assign SBox5Stage_mulInput0_payload_op1 = AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  assign SBox5Stage_mulInput0_payload_op2 = AddRoundConstantStage_output_s2mPipe_input_payload_state_element;
  assign SBox5Stage_mulInput0_ready = montMultiplierPipedSim_45_io_input_ready;
  assign SBox5Stage_mulInput1_valid = montMultiplierPipedSim_45_io_output_valid;
  assign SBox5Stage_mulInput1_payload_op1 = montMultiplierPipedSim_45_io_output_payload_res;
  assign SBox5Stage_mulInput1_payload_op2 = montMultiplierPipedSim_45_io_output_payload_res;
  assign SBox5Stage_mulInput1_ready = montMultiplierPipedSim_46_io_input_ready;
  assign SBox5Stage_tempOutput_valid = (montMultiplierPipedSim_46_io_output_valid && AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_valid);
  assign SBox5Stage_tempOutput_fire = (SBox5Stage_tempOutput_valid && SBox5Stage_tempOutput_ready);
  assign SBox5Stage_tempOutput_fire_1 = (SBox5Stage_tempOutput_valid && SBox5Stage_tempOutput_ready);
  assign SBox5Stage_tempOutput_payload__1_res = montMultiplierPipedSim_46_io_output_payload_res;
  assign SBox5Stage_tempOutput_payload__2_round_index = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_round_index;
  assign SBox5Stage_tempOutput_payload__2_state_index = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_index;
  assign SBox5Stage_tempOutput_payload__2_state_size = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_size;
  assign SBox5Stage_tempOutput_payload__2_state_id = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_id;
  assign SBox5Stage_tempOutput_payload__2_state_element = AddRoundConstantStage_output_s2mPipe_input_fork_io_outputs_1_fifo_io_pop_payload_state_element;
  assign SBox5Stage_tempOutput_ready = SBox5Stage_tempOutput_fork_io_input_ready;
  assign SBox5Stage_mulInput2_valid = SBox5Stage_tempOutput_fork_io_outputs_0_valid;
  assign SBox5Stage_mulInput2_payload_op1 = SBox5Stage_tempOutput_payload__1_res;
  assign SBox5Stage_mulInput2_payload_op2 = SBox5Stage_tempOutput_payload__2_state_element;
  assign SBox5Stage_mulInput2_ready = montMultiplierPipedSim_47_io_input_ready;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_valid = SBox5Stage_tempOutput_fork_io_outputs_1_valid;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_round_index = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_round_index;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_index = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_index;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_size = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_size;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_id = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_id;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_payload_state_element = SBox5Stage_tempOutput_fork_io_outputs_1_payload__2_state_element;
  assign SBox5Stage_tempOutput_fork_io_outputs_1_translated_ready = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_push_ready;
  always @(*) begin
    SBox5Stage_partialRound = 1'b0;
    case(SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size)
      4'b0011 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3b));
      end
      4'b0101 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3c));
      end
      4'b1001 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3d));
      end
      4'b1100 : begin
        SBox5Stage_partialRound = ((7'h04 <= SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index) && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index < 7'h3d));
      end
      default : begin
      end
    endcase
  end

  assign SBox5Stage_bypassSBox5 = (SBox5Stage_partialRound && (SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index != 4'b0000));
  assign _zz_io_output_ready = (_zz_SBox5Stage_output_valid && SBox5Stage_output_ready);
  assign _zz_SBox5Stage_output_valid = (montMultiplierPipedSim_47_io_output_valid && SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_valid);
  always @(*) begin
    _zz_SBox5Stage_output_payload_state_element = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element;
    _zz_SBox5Stage_output_payload_state_element = (SBox5Stage_bypassSBox5 ? SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_element : montMultiplierPipedSim_47_io_output_payload_res);
  end

  assign SBox5Stage_output_valid = _zz_SBox5Stage_output_valid;
  assign SBox5Stage_output_payload_round_index = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  assign SBox5Stage_output_payload_state_index = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_index;
  assign SBox5Stage_output_payload_state_size = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  assign SBox5Stage_output_payload_state_id = SBox5Stage_tempOutput_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  assign SBox5Stage_output_payload_state_element = _zz_SBox5Stage_output_payload_state_element;
  always @(*) begin
    SBox5Stage_output_ready = SBox5Stage_output_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      SBox5Stage_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! SBox5Stage_output_m2sPipe_valid);
  assign SBox5Stage_output_m2sPipe_valid = SBox5Stage_output_rValid;
  assign SBox5Stage_output_m2sPipe_payload_round_index = SBox5Stage_output_rData_round_index;
  assign SBox5Stage_output_m2sPipe_payload_state_index = SBox5Stage_output_rData_state_index;
  assign SBox5Stage_output_m2sPipe_payload_state_size = SBox5Stage_output_rData_state_size;
  assign SBox5Stage_output_m2sPipe_payload_state_id = SBox5Stage_output_rData_state_id;
  assign SBox5Stage_output_m2sPipe_payload_state_element = SBox5Stage_output_rData_state_element;
  assign SBox5Stage_output_m2sPipe_ready = mDSMatrixMultiplier_3_io_input_ready;
  assign io_output_valid = mDSMatrixAdders_3_io_output_valid;
  assign io_output_payload_round_index = mDSMatrixAdders_3_io_output_payload_round_index;
  assign io_output_payload_state_size = mDSMatrixAdders_3_io_output_payload_state_size;
  assign io_output_payload_state_id = mDSMatrixAdders_3_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = mDSMatrixAdders_3_io_output_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = mDSMatrixAdders_3_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = mDSMatrixAdders_3_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = mDSMatrixAdders_3_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = mDSMatrixAdders_3_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = mDSMatrixAdders_3_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = mDSMatrixAdders_3_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = mDSMatrixAdders_3_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = mDSMatrixAdders_3_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = mDSMatrixAdders_3_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = mDSMatrixAdders_3_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = mDSMatrixAdders_3_io_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      AddRoundConstantStage_output_rValid <= 1'b0;
      AddRoundConstantStage_output_s2mPipe_rValid <= 1'b0;
      SBox5Stage_output_rValid <= 1'b0;
    end else begin
      if(AddRoundConstantStage_output_valid) begin
        AddRoundConstantStage_output_rValid <= 1'b1;
      end
      if(AddRoundConstantStage_output_s2mPipe_ready) begin
        AddRoundConstantStage_output_rValid <= 1'b0;
      end
      if(AddRoundConstantStage_output_s2mPipe_ready) begin
        AddRoundConstantStage_output_s2mPipe_rValid <= AddRoundConstantStage_output_s2mPipe_valid;
      end
      if(SBox5Stage_output_ready) begin
        SBox5Stage_output_rValid <= SBox5Stage_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(AddRoundConstantStage_output_ready) begin
      AddRoundConstantStage_output_rData_round_index <= AddRoundConstantStage_output_payload_round_index;
      AddRoundConstantStage_output_rData_state_index <= AddRoundConstantStage_output_payload_state_index;
      AddRoundConstantStage_output_rData_state_size <= AddRoundConstantStage_output_payload_state_size;
      AddRoundConstantStage_output_rData_state_id <= AddRoundConstantStage_output_payload_state_id;
      AddRoundConstantStage_output_rData_state_element <= AddRoundConstantStage_output_payload_state_element;
    end
    if(AddRoundConstantStage_output_s2mPipe_ready) begin
      AddRoundConstantStage_output_s2mPipe_rData_round_index <= AddRoundConstantStage_output_s2mPipe_payload_round_index;
      AddRoundConstantStage_output_s2mPipe_rData_state_index <= AddRoundConstantStage_output_s2mPipe_payload_state_index;
      AddRoundConstantStage_output_s2mPipe_rData_state_size <= AddRoundConstantStage_output_s2mPipe_payload_state_size;
      AddRoundConstantStage_output_s2mPipe_rData_state_id <= AddRoundConstantStage_output_s2mPipe_payload_state_id;
      AddRoundConstantStage_output_s2mPipe_rData_state_element <= AddRoundConstantStage_output_s2mPipe_payload_state_element;
    end
    if(SBox5Stage_output_ready) begin
      SBox5Stage_output_rData_round_index <= SBox5Stage_output_payload_round_index;
      SBox5Stage_output_rData_state_index <= SBox5Stage_output_payload_state_index;
      SBox5Stage_output_rData_state_size <= SBox5Stage_output_payload_state_size;
      SBox5Stage_output_rData_state_id <= SBox5Stage_output_payload_state_id;
      SBox5Stage_output_rData_state_element <= SBox5Stage_output_payload_state_element;
    end
  end


endmodule

module PoseidonSerializer (
  input               io_parallelInput_valid,
  output reg          io_parallelInput_ready,
  input      [6:0]    io_parallelInput_payload_round_index,
  input      [3:0]    io_parallelInput_payload_state_size,
  input      [6:0]    io_parallelInput_payload_state_id,
  input      [254:0]  io_parallelInput_payload_state_elements_0,
  input      [254:0]  io_parallelInput_payload_state_elements_1,
  input      [254:0]  io_parallelInput_payload_state_elements_2,
  input      [254:0]  io_parallelInput_payload_state_elements_3,
  input      [254:0]  io_parallelInput_payload_state_elements_4,
  input      [254:0]  io_parallelInput_payload_state_elements_5,
  input      [254:0]  io_parallelInput_payload_state_elements_6,
  input      [254:0]  io_parallelInput_payload_state_elements_7,
  input      [254:0]  io_parallelInput_payload_state_elements_8,
  input      [254:0]  io_parallelInput_payload_state_elements_9,
  input      [254:0]  io_parallelInput_payload_state_elements_10,
  input      [254:0]  io_parallelInput_payload_state_elements_11,
  output reg          io_serialOutput_valid,
  input               io_serialOutput_ready,
  output reg [6:0]    io_serialOutput_payload_round_index,
  output reg [3:0]    io_serialOutput_payload_state_index,
  output reg [3:0]    io_serialOutput_payload_state_size,
  output reg [6:0]    io_serialOutput_payload_state_id,
  output reg [254:0]  io_serialOutput_payload_state_element,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz_lastElementIndex;
  reg        [254:0]  _zz__zz_io_serialOutput_payload_state_element;
  wire       [3:0]    _zz_when_PoseidonSerializer_l68;
  reg        [3:0]    stateSize;
  wire       [3:0]    lastElementIndex;
  reg        [6:0]    roundIndex;
  reg        [6:0]    stateID;
  reg        [254:0]  buffer_0;
  reg        [254:0]  buffer_1;
  reg        [254:0]  buffer_2;
  reg        [254:0]  buffer_3;
  reg        [254:0]  buffer_4;
  reg        [254:0]  buffer_5;
  reg        [254:0]  buffer_6;
  reg        [254:0]  buffer_7;
  reg        [254:0]  buffer_8;
  reg        [254:0]  buffer_9;
  reg        [254:0]  buffer_10;
  reg        [254:0]  buffer_11;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                io_parallelInput_fire;
  wire       [254:0]  _zz_io_serialOutput_payload_state_element;
  wire                io_serialOutput_fire;
  wire                when_PoseidonSerializer_l68;
  wire                io_serialOutput_fire_1;
  wire                io_parallelInput_fire_1;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [63:0] fsm_stateReg_string;
  reg [63:0] fsm_stateNext_string;
  `endif


  assign _zz_lastElementIndex = (stateSize - 4'b0001);
  assign _zz_when_PoseidonSerializer_l68 = (lastElementIndex - 4'b0001);
  always @(*) begin
    case(fsm_counter)
      4'b0000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_0;
      end
      4'b0001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_1;
      end
      4'b0010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_2;
      end
      4'b0011 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_3;
      end
      4'b0100 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_4;
      end
      4'b0101 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_5;
      end
      4'b0110 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_6;
      end
      4'b0111 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_7;
      end
      4'b1000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_8;
      end
      4'b1001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_9;
      end
      4'b1010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_10;
      end
      default : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_11;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE";
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : fsm_stateReg_string = "fsm_BUSY";
      `fsm_enumDefinition_binary_sequential_fsm_LAST : fsm_stateReg_string = "fsm_LAST";
      default : fsm_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE";
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : fsm_stateNext_string = "fsm_BUSY";
      `fsm_enumDefinition_binary_sequential_fsm_LAST : fsm_stateNext_string = "fsm_LAST";
      default : fsm_stateNext_string = "????????";
    endcase
  end
  `endif

  assign lastElementIndex = ((stateSize == 4'b0101) ? stateSize : _zz_lastElementIndex);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    io_parallelInput_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        io_parallelInput_ready = 1'b1;
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          io_parallelInput_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_valid = 1'b1;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_id = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_id = stateID;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_id = stateID;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_size = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_element = 255'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_index = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_round_index = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(io_parallelInput_fire) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BUSY;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        if(io_serialOutput_fire) begin
          if(when_PoseidonSerializer_l68) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_LAST;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          if(io_parallelInput_fire_1) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BUSY;
          end else begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign io_parallelInput_fire = (io_parallelInput_valid && io_parallelInput_ready);
  assign _zz_io_serialOutput_payload_state_element = _zz__zz_io_serialOutput_payload_state_element;
  assign io_serialOutput_fire = (io_serialOutput_valid && io_serialOutput_ready);
  assign when_PoseidonSerializer_l68 = (fsm_counter == _zz_when_PoseidonSerializer_l68);
  assign io_serialOutput_fire_1 = (io_serialOutput_valid && io_serialOutput_ready);
  assign io_parallelInput_fire_1 = (io_parallelInput_valid && io_parallelInput_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_LAST) && (! (fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_LAST)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateSize <= 4'b0000;
      roundIndex <= 7'h0;
      stateID <= 7'h0;
      buffer_0 <= 255'h0;
      buffer_1 <= 255'h0;
      buffer_2 <= 255'h0;
      buffer_3 <= 255'h0;
      buffer_4 <= 255'h0;
      buffer_5 <= 255'h0;
      buffer_6 <= 255'h0;
      buffer_7 <= 255'h0;
      buffer_8 <= 255'h0;
      buffer_9 <= 255'h0;
      buffer_10 <= 255'h0;
      buffer_11 <= 255'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
          if(io_parallelInput_fire) begin
            buffer_0 <= io_parallelInput_payload_state_elements_0;
            buffer_1 <= io_parallelInput_payload_state_elements_1;
            buffer_2 <= io_parallelInput_payload_state_elements_2;
            buffer_3 <= io_parallelInput_payload_state_elements_3;
            buffer_4 <= io_parallelInput_payload_state_elements_4;
            buffer_5 <= io_parallelInput_payload_state_elements_5;
            buffer_6 <= io_parallelInput_payload_state_elements_6;
            buffer_7 <= io_parallelInput_payload_state_elements_7;
            buffer_8 <= io_parallelInput_payload_state_elements_8;
            buffer_9 <= io_parallelInput_payload_state_elements_9;
            buffer_10 <= io_parallelInput_payload_state_elements_10;
            buffer_11 <= io_parallelInput_payload_state_elements_11;
            stateID <= io_parallelInput_payload_state_id;
            stateSize <= io_parallelInput_payload_state_size;
            roundIndex <= io_parallelInput_payload_round_index;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
          if(io_serialOutput_fire) begin
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
          if(io_serialOutput_fire_1) begin
            if(io_parallelInput_fire_1) begin
              buffer_0 <= io_parallelInput_payload_state_elements_0;
              buffer_1 <= io_parallelInput_payload_state_elements_1;
              buffer_2 <= io_parallelInput_payload_state_elements_2;
              buffer_3 <= io_parallelInput_payload_state_elements_3;
              buffer_4 <= io_parallelInput_payload_state_elements_4;
              buffer_5 <= io_parallelInput_payload_state_elements_5;
              buffer_6 <= io_parallelInput_payload_state_elements_6;
              buffer_7 <= io_parallelInput_payload_state_elements_7;
              buffer_8 <= io_parallelInput_payload_state_elements_8;
              buffer_9 <= io_parallelInput_payload_state_elements_9;
              buffer_10 <= io_parallelInput_payload_state_elements_10;
              buffer_11 <= io_parallelInput_payload_state_elements_11;
              stateID <= io_parallelInput_payload_state_id;
              stateSize <= io_parallelInput_payload_state_size;
              roundIndex <= io_parallelInput_payload_round_index;
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        fsm_counter <= 4'b0000;
      end
    end
  end


endmodule

module StreamArbiter_45 (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_round_index,
  input      [3:0]    io_inputs_0_payload_state_size,
  input      [6:0]    io_inputs_0_payload_state_id,
  input      [254:0]  io_inputs_0_payload_state_elements_0,
  input      [254:0]  io_inputs_0_payload_state_elements_1,
  input      [254:0]  io_inputs_0_payload_state_elements_2,
  input      [254:0]  io_inputs_0_payload_state_elements_3,
  input      [254:0]  io_inputs_0_payload_state_elements_4,
  input      [254:0]  io_inputs_0_payload_state_elements_5,
  input      [254:0]  io_inputs_0_payload_state_elements_6,
  input      [254:0]  io_inputs_0_payload_state_elements_7,
  input      [254:0]  io_inputs_0_payload_state_elements_8,
  input      [254:0]  io_inputs_0_payload_state_elements_9,
  input      [254:0]  io_inputs_0_payload_state_elements_10,
  input      [254:0]  io_inputs_0_payload_state_elements_11,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [6:0]    io_inputs_1_payload_round_index,
  input      [3:0]    io_inputs_1_payload_state_size,
  input      [6:0]    io_inputs_1_payload_state_id,
  input      [254:0]  io_inputs_1_payload_state_elements_0,
  input      [254:0]  io_inputs_1_payload_state_elements_1,
  input      [254:0]  io_inputs_1_payload_state_elements_2,
  input      [254:0]  io_inputs_1_payload_state_elements_3,
  input      [254:0]  io_inputs_1_payload_state_elements_4,
  input      [254:0]  io_inputs_1_payload_state_elements_5,
  input      [254:0]  io_inputs_1_payload_state_elements_6,
  input      [254:0]  io_inputs_1_payload_state_elements_7,
  input      [254:0]  io_inputs_1_payload_state_elements_8,
  input      [254:0]  io_inputs_1_payload_state_elements_9,
  input      [254:0]  io_inputs_1_payload_state_elements_10,
  input      [254:0]  io_inputs_1_payload_state_elements_11,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               clk,
  input               reset
);
  wire       [1:0]    _zz_maskProposal_1_1;
  wire       [1:0]    _zz_maskProposal_1_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_1;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz_maskProposal_1_1 = (_zz_maskProposal_1 & (~ _zz_maskProposal_1_2));
  assign _zz_maskProposal_1_2 = (_zz_maskProposal_1 - 2'b01);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_maskProposal_1_1[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_round_index = (maskRouted_0 ? io_inputs_0_payload_round_index : io_inputs_1_payload_round_index);
  assign io_output_payload_state_size = (maskRouted_0 ? io_inputs_0_payload_state_size : io_inputs_1_payload_state_size);
  assign io_output_payload_state_id = (maskRouted_0 ? io_inputs_0_payload_state_id : io_inputs_1_payload_state_id);
  assign io_output_payload_state_elements_0 = (maskRouted_0 ? io_inputs_0_payload_state_elements_0 : io_inputs_1_payload_state_elements_0);
  assign io_output_payload_state_elements_1 = (maskRouted_0 ? io_inputs_0_payload_state_elements_1 : io_inputs_1_payload_state_elements_1);
  assign io_output_payload_state_elements_2 = (maskRouted_0 ? io_inputs_0_payload_state_elements_2 : io_inputs_1_payload_state_elements_2);
  assign io_output_payload_state_elements_3 = (maskRouted_0 ? io_inputs_0_payload_state_elements_3 : io_inputs_1_payload_state_elements_3);
  assign io_output_payload_state_elements_4 = (maskRouted_0 ? io_inputs_0_payload_state_elements_4 : io_inputs_1_payload_state_elements_4);
  assign io_output_payload_state_elements_5 = (maskRouted_0 ? io_inputs_0_payload_state_elements_5 : io_inputs_1_payload_state_elements_5);
  assign io_output_payload_state_elements_6 = (maskRouted_0 ? io_inputs_0_payload_state_elements_6 : io_inputs_1_payload_state_elements_6);
  assign io_output_payload_state_elements_7 = (maskRouted_0 ? io_inputs_0_payload_state_elements_7 : io_inputs_1_payload_state_elements_7);
  assign io_output_payload_state_elements_8 = (maskRouted_0 ? io_inputs_0_payload_state_elements_8 : io_inputs_1_payload_state_elements_8);
  assign io_output_payload_state_elements_9 = (maskRouted_0 ? io_inputs_0_payload_state_elements_9 : io_inputs_1_payload_state_elements_9);
  assign io_output_payload_state_elements_10 = (maskRouted_0 ? io_inputs_0_payload_state_elements_10 : io_inputs_1_payload_state_elements_10);
  assign io_output_payload_state_elements_11 = (maskRouted_0 ? io_inputs_0_payload_state_elements_11 : io_inputs_1_payload_state_elements_11);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_output_valid) begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end


endmodule

//StreamDemux_45 replaced by StreamDemux_45

module MDSMatrixAdders_2 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output reg          io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [254:0]  modAdder_1_res_o;
  wire       [254:0]  modAdder_2_res_o;
  wire       [254:0]  modAdder_3_res_o;
  wire       [254:0]  modAdder_4_res_o;
  wire       [254:0]  modAdder_5_res_o;
  wire       [254:0]  modAdder_6_res_o;
  wire       [254:0]  modAdder_7_res_o;
  wire       [254:0]  modAdder_8_res_o;
  wire       [254:0]  modAdder_9_res_o;
  wire       [254:0]  modAdder_10_res_o;
  wire       [254:0]  modAdder_11_res_o;
  wire       [254:0]  modAdder_12_res_o;
  wire       [3:0]    _zz_countNum;
  wire       [3:0]    _zz_when_MDSMatrixAdders_l81;
  reg        [6:0]    tempRes_round_index;
  reg        [3:0]    tempRes_state_size;
  reg        [6:0]    tempRes_state_id;
  reg        [254:0]  tempRes_state_elements_0;
  reg        [254:0]  tempRes_state_elements_1;
  reg        [254:0]  tempRes_state_elements_2;
  reg        [254:0]  tempRes_state_elements_3;
  reg        [254:0]  tempRes_state_elements_4;
  reg        [254:0]  tempRes_state_elements_5;
  reg        [254:0]  tempRes_state_elements_6;
  reg        [254:0]  tempRes_state_elements_7;
  reg        [254:0]  tempRes_state_elements_8;
  reg        [254:0]  tempRes_state_elements_9;
  reg        [254:0]  tempRes_state_elements_10;
  reg        [254:0]  tempRes_state_elements_11;
  wire       [254:0]  modAdderRes_0;
  wire       [254:0]  modAdderRes_1;
  wire       [254:0]  modAdderRes_2;
  wire       [254:0]  modAdderRes_3;
  wire       [254:0]  modAdderRes_4;
  wire       [254:0]  modAdderRes_5;
  wire       [254:0]  modAdderRes_6;
  wire       [254:0]  modAdderRes_7;
  wire       [254:0]  modAdderRes_8;
  wire       [254:0]  modAdderRes_9;
  wire       [254:0]  modAdderRes_10;
  wire       [254:0]  modAdderRes_11;
  wire       [3:0]    countNum;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_5_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_5_binary_sequential_type fsm_stateNext;
  wire                io_input_fire;
  wire                io_input_fire_1;
  wire                when_MDSMatrixAdders_l81;
  wire                io_output_fire;
  wire                io_input_fire_2;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_countNum = (tempRes_state_size + 4'b0001);
  assign _zz_when_MDSMatrixAdders_l81 = (fsm_counter + 4'b0001);
  ModAdder modAdder_1 (
    .op1_i    (tempRes_state_elements_0           ), //i
    .op2_i    (io_input_payload_state_elements_0  ), //i
    .res_o    (modAdder_1_res_o                   )  //o
  );
  ModAdder modAdder_2 (
    .op1_i    (tempRes_state_elements_1           ), //i
    .op2_i    (io_input_payload_state_elements_1  ), //i
    .res_o    (modAdder_2_res_o                   )  //o
  );
  ModAdder modAdder_3 (
    .op1_i    (tempRes_state_elements_2           ), //i
    .op2_i    (io_input_payload_state_elements_2  ), //i
    .res_o    (modAdder_3_res_o                   )  //o
  );
  ModAdder modAdder_4 (
    .op1_i    (tempRes_state_elements_3           ), //i
    .op2_i    (io_input_payload_state_elements_3  ), //i
    .res_o    (modAdder_4_res_o                   )  //o
  );
  ModAdder modAdder_5 (
    .op1_i    (tempRes_state_elements_4           ), //i
    .op2_i    (io_input_payload_state_elements_4  ), //i
    .res_o    (modAdder_5_res_o                   )  //o
  );
  ModAdder modAdder_6 (
    .op1_i    (tempRes_state_elements_5           ), //i
    .op2_i    (io_input_payload_state_elements_5  ), //i
    .res_o    (modAdder_6_res_o                   )  //o
  );
  ModAdder modAdder_7 (
    .op1_i    (tempRes_state_elements_6           ), //i
    .op2_i    (io_input_payload_state_elements_6  ), //i
    .res_o    (modAdder_7_res_o                   )  //o
  );
  ModAdder modAdder_8 (
    .op1_i    (tempRes_state_elements_7           ), //i
    .op2_i    (io_input_payload_state_elements_7  ), //i
    .res_o    (modAdder_8_res_o                   )  //o
  );
  ModAdder modAdder_9 (
    .op1_i    (tempRes_state_elements_8           ), //i
    .op2_i    (io_input_payload_state_elements_8  ), //i
    .res_o    (modAdder_9_res_o                   )  //o
  );
  ModAdder modAdder_10 (
    .op1_i    (tempRes_state_elements_9           ), //i
    .op2_i    (io_input_payload_state_elements_9  ), //i
    .res_o    (modAdder_10_res_o                  )  //o
  );
  ModAdder modAdder_11 (
    .op1_i    (tempRes_state_elements_10           ), //i
    .op2_i    (io_input_payload_state_elements_10  ), //i
    .res_o    (modAdder_11_res_o                   )  //o
  );
  ModAdder modAdder_12 (
    .op1_i    (tempRes_state_elements_11           ), //i
    .op2_i    (io_input_payload_state_elements_11  ), //i
    .res_o    (modAdder_12_res_o                   )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_5_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : fsm_stateReg_string = "fsm_ADDING";
      `fsm_enumDefinition_5_binary_sequential_fsm_DONE : fsm_stateReg_string = "fsm_DONE  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_5_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : fsm_stateNext_string = "fsm_ADDING";
      `fsm_enumDefinition_5_binary_sequential_fsm_DONE : fsm_stateNext_string = "fsm_DONE  ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign modAdderRes_0 = modAdder_1_res_o;
  assign modAdderRes_1 = modAdder_2_res_o;
  assign modAdderRes_2 = modAdder_3_res_o;
  assign modAdderRes_3 = modAdder_4_res_o;
  assign modAdderRes_4 = modAdder_5_res_o;
  assign modAdderRes_5 = modAdder_6_res_o;
  assign modAdderRes_6 = modAdder_7_res_o;
  assign modAdderRes_7 = modAdder_8_res_o;
  assign modAdderRes_8 = modAdder_9_res_o;
  assign modAdderRes_9 = modAdder_10_res_o;
  assign modAdderRes_10 = modAdder_11_res_o;
  assign modAdderRes_11 = modAdder_12_res_o;
  assign countNum = ((tempRes_state_size == 4'b0101) ? _zz_countNum : tempRes_state_size);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_DONE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign io_output_payload_round_index = tempRes_round_index;
  assign io_output_payload_state_size = tempRes_state_size;
  assign io_output_payload_state_id = tempRes_state_id;
  assign io_output_payload_state_elements_0 = tempRes_state_elements_0;
  assign io_output_payload_state_elements_1 = tempRes_state_elements_1;
  assign io_output_payload_state_elements_2 = tempRes_state_elements_2;
  assign io_output_payload_state_elements_3 = tempRes_state_elements_3;
  assign io_output_payload_state_elements_4 = tempRes_state_elements_4;
  assign io_output_payload_state_elements_5 = tempRes_state_elements_5;
  assign io_output_payload_state_elements_6 = tempRes_state_elements_6;
  assign io_output_payload_state_elements_7 = tempRes_state_elements_7;
  assign io_output_payload_state_elements_8 = tempRes_state_elements_8;
  assign io_output_payload_state_elements_9 = tempRes_state_elements_9;
  assign io_output_payload_state_elements_10 = tempRes_state_elements_10;
  assign io_output_payload_state_elements_11 = tempRes_state_elements_11;
  always @(*) begin
    io_output_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_DONE : begin
        io_output_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_input_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          io_input_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : begin
        if(io_input_fire) begin
          fsm_stateNext = `fsm_enumDefinition_5_binary_sequential_fsm_ADDING;
        end
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : begin
        if(io_input_fire_1) begin
          if(when_MDSMatrixAdders_l81) begin
            fsm_stateNext = `fsm_enumDefinition_5_binary_sequential_fsm_DONE;
          end
        end
      end
      `fsm_enumDefinition_5_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          if(io_input_fire_2) begin
            fsm_stateNext = `fsm_enumDefinition_5_binary_sequential_fsm_ADDING;
          end else begin
            fsm_stateNext = `fsm_enumDefinition_5_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_5_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_5_binary_sequential_fsm_BOOT;
    end
  end

  assign io_input_fire = (io_input_valid && io_input_ready);
  assign io_input_fire_1 = (io_input_valid && io_input_ready);
  assign when_MDSMatrixAdders_l81 = (_zz_when_MDSMatrixAdders_l81 == countNum);
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire_2 = (io_input_valid && io_input_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_5_binary_sequential_fsm_ADDING) && (! (fsm_stateNext == `fsm_enumDefinition_5_binary_sequential_fsm_ADDING)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      tempRes_state_size <= 4'b0000;
      tempRes_state_elements_0 <= 255'h0;
      tempRes_state_elements_1 <= 255'h0;
      tempRes_state_elements_2 <= 255'h0;
      tempRes_state_elements_3 <= 255'h0;
      tempRes_state_elements_4 <= 255'h0;
      tempRes_state_elements_5 <= 255'h0;
      tempRes_state_elements_6 <= 255'h0;
      tempRes_state_elements_7 <= 255'h0;
      tempRes_state_elements_8 <= 255'h0;
      tempRes_state_elements_9 <= 255'h0;
      tempRes_state_elements_10 <= 255'h0;
      tempRes_state_elements_11 <= 255'h0;
      tempRes_state_id <= 7'h0;
      tempRes_round_index <= 7'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_5_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_5_binary_sequential_fsm_IDLE : begin
          if(io_input_fire) begin
            tempRes_round_index <= io_input_payload_round_index;
            tempRes_state_size <= io_input_payload_state_size;
            tempRes_state_id <= io_input_payload_state_id;
            tempRes_state_elements_0 <= io_input_payload_state_elements_0;
            tempRes_state_elements_1 <= io_input_payload_state_elements_1;
            tempRes_state_elements_2 <= io_input_payload_state_elements_2;
            tempRes_state_elements_3 <= io_input_payload_state_elements_3;
            tempRes_state_elements_4 <= io_input_payload_state_elements_4;
            tempRes_state_elements_5 <= io_input_payload_state_elements_5;
            tempRes_state_elements_6 <= io_input_payload_state_elements_6;
            tempRes_state_elements_7 <= io_input_payload_state_elements_7;
            tempRes_state_elements_8 <= io_input_payload_state_elements_8;
            tempRes_state_elements_9 <= io_input_payload_state_elements_9;
            tempRes_state_elements_10 <= io_input_payload_state_elements_10;
            tempRes_state_elements_11 <= io_input_payload_state_elements_11;
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_5_binary_sequential_fsm_ADDING : begin
          if(io_input_fire_1) begin
            tempRes_state_elements_0 <= modAdderRes_0;
            tempRes_state_elements_1 <= modAdderRes_1;
            tempRes_state_elements_2 <= modAdderRes_2;
            tempRes_state_elements_3 <= modAdderRes_3;
            tempRes_state_elements_4 <= modAdderRes_4;
            tempRes_state_elements_5 <= modAdderRes_5;
            tempRes_state_elements_6 <= modAdderRes_6;
            tempRes_state_elements_7 <= modAdderRes_7;
            tempRes_state_elements_8 <= modAdderRes_8;
            tempRes_state_elements_9 <= modAdderRes_9;
            tempRes_state_elements_10 <= modAdderRes_10;
            tempRes_state_elements_11 <= modAdderRes_11;
            if(!when_MDSMatrixAdders_l81) begin
              fsm_counter <= (fsm_counter + 4'b0001);
            end
          end
        end
        `fsm_enumDefinition_5_binary_sequential_fsm_DONE : begin
          if(io_output_fire) begin
            if(io_input_fire_2) begin
              tempRes_round_index <= io_input_payload_round_index;
              tempRes_state_size <= io_input_payload_state_size;
              tempRes_state_id <= io_input_payload_state_id;
              tempRes_state_elements_0 <= io_input_payload_state_elements_0;
              tempRes_state_elements_1 <= io_input_payload_state_elements_1;
              tempRes_state_elements_2 <= io_input_payload_state_elements_2;
              tempRes_state_elements_3 <= io_input_payload_state_elements_3;
              tempRes_state_elements_4 <= io_input_payload_state_elements_4;
              tempRes_state_elements_5 <= io_input_payload_state_elements_5;
              tempRes_state_elements_6 <= io_input_payload_state_elements_6;
              tempRes_state_elements_7 <= io_input_payload_state_elements_7;
              tempRes_state_elements_8 <= io_input_payload_state_elements_8;
              tempRes_state_elements_9 <= io_input_payload_state_elements_9;
              tempRes_state_elements_10 <= io_input_payload_state_elements_10;
              tempRes_state_elements_11 <= io_input_payload_state_elements_11;
              fsm_counter <= (fsm_counter + 4'b0001);
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        fsm_counter <= 4'b0000;
      end
    end
  end


endmodule

module MDSMatrixMultiplier_2 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [1:0]    mDSMatrix_12_io_addressPort;
  wire       [2:0]    mDSMatrix_13_io_addressPort;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_5;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_6;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_7;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_8;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_5;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_6;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_7;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_8;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_9;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_10;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_11;
  wire                io_input_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_valid;
  wire       [6:0]    io_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  io_input_fork_io_outputs_0_payload_state_element;
  wire                io_input_fork_io_outputs_1_valid;
  wire       [6:0]    io_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  io_input_fork_io_outputs_1_payload_state_element;
  wire                io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload;
  wire                montMultiplierPipedSim_45_io_input_ready;
  wire                montMultiplierPipedSim_45_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_45_io_output_payload_res;
  wire                montMultiplierPipedSim_46_io_input_ready;
  wire                montMultiplierPipedSim_46_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_46_io_output_payload_res;
  wire                montMultiplierPipedSim_47_io_input_ready;
  wire                montMultiplierPipedSim_47_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_47_io_output_payload_res;
  wire                montMultiplierPipedSim_48_io_input_ready;
  wire                montMultiplierPipedSim_48_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_48_io_output_payload_res;
  wire                montMultiplierPipedSim_49_io_input_ready;
  wire                montMultiplierPipedSim_49_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_49_io_output_payload_res;
  wire                montMultiplierPipedSim_50_io_input_ready;
  wire                montMultiplierPipedSim_50_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_50_io_output_payload_res;
  wire                montMultiplierPipedSim_51_io_input_ready;
  wire                montMultiplierPipedSim_51_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_51_io_output_payload_res;
  wire                montMultiplierPipedSim_52_io_input_ready;
  wire                montMultiplierPipedSim_52_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_52_io_output_payload_res;
  wire                montMultiplierPipedSim_53_io_input_ready;
  wire                montMultiplierPipedSim_53_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_53_io_output_payload_res;
  wire                montMultiplierPipedSim_54_io_input_ready;
  wire                montMultiplierPipedSim_54_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_54_io_output_payload_res;
  wire                montMultiplierPipedSim_55_io_input_ready;
  wire                montMultiplierPipedSim_55_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_55_io_output_payload_res;
  wire                montMultiplierPipedSim_56_io_input_ready;
  wire                montMultiplierPipedSim_56_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_56_io_output_payload_res;
  wire                io_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                io_input_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_availability;
  wire       [254:0]  _zz__zz_mulOp2s_0_4;
  wire       [254:0]  _zz__zz_mulOp2s_0_4_1;
  wire       [254:0]  _zz__zz_io_output_payload_state_elements_0;
  wire       [254:0]  _zz__zz_io_output_payload_state_elements_0_1;
  reg        [254:0]  mulOp2s_0;
  reg        [254:0]  mulOp2s_1;
  reg        [254:0]  mulOp2s_2;
  reg        [254:0]  mulOp2s_3;
  reg        [254:0]  mulOp2s_4;
  reg        [254:0]  mulOp2s_5;
  reg        [254:0]  mulOp2s_6;
  reg        [254:0]  mulOp2s_7;
  reg        [254:0]  mulOp2s_8;
  reg        [254:0]  mulOp2s_9;
  reg        [254:0]  mulOp2s_10;
  reg        [254:0]  mulOp2s_11;
  wire       [3059:0] _zz_mulOp2s_0;
  wire                when_MDSMatrixMultiplier_l50;
  wire       [3059:0] _zz_mulOp2s_0_1;
  wire       [3059:0] _zz_mulOp2s_0_2;
  wire       [3059:0] _zz_mulOp2s_0_3;
  wire       [3059:0] _zz_mulOp2s_0_4;
  wire       [3059:0] _zz_mulOp2s_0_5;
  wire                io_input_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_ready;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_payload;
  wire                mulInputs_0_valid;
  wire                mulInputs_0_ready;
  wire       [254:0]  mulInputs_0_payload_op1;
  wire       [254:0]  mulInputs_0_payload_op2;
  wire                mulInputs_1_valid;
  wire                mulInputs_1_ready;
  wire       [254:0]  mulInputs_1_payload_op1;
  wire       [254:0]  mulInputs_1_payload_op2;
  wire                mulInputs_2_valid;
  wire                mulInputs_2_ready;
  wire       [254:0]  mulInputs_2_payload_op1;
  wire       [254:0]  mulInputs_2_payload_op2;
  wire                mulInputs_3_valid;
  wire                mulInputs_3_ready;
  wire       [254:0]  mulInputs_3_payload_op1;
  wire       [254:0]  mulInputs_3_payload_op2;
  wire                mulInputs_4_valid;
  wire                mulInputs_4_ready;
  wire       [254:0]  mulInputs_4_payload_op1;
  wire       [254:0]  mulInputs_4_payload_op2;
  wire                mulInputs_5_valid;
  wire                mulInputs_5_ready;
  wire       [254:0]  mulInputs_5_payload_op1;
  wire       [254:0]  mulInputs_5_payload_op2;
  wire                mulInputs_6_valid;
  wire                mulInputs_6_ready;
  wire       [254:0]  mulInputs_6_payload_op1;
  wire       [254:0]  mulInputs_6_payload_op2;
  wire                mulInputs_7_valid;
  wire                mulInputs_7_ready;
  wire       [254:0]  mulInputs_7_payload_op1;
  wire       [254:0]  mulInputs_7_payload_op2;
  wire                mulInputs_8_valid;
  wire                mulInputs_8_ready;
  wire       [254:0]  mulInputs_8_payload_op1;
  wire       [254:0]  mulInputs_8_payload_op2;
  wire                mulInputs_9_valid;
  wire                mulInputs_9_ready;
  wire       [254:0]  mulInputs_9_payload_op1;
  wire       [254:0]  mulInputs_9_payload_op2;
  wire                mulInputs_10_valid;
  wire                mulInputs_10_ready;
  wire       [254:0]  mulInputs_10_payload_op1;
  wire       [254:0]  mulInputs_10_payload_op2;
  wire                mulInputs_11_valid;
  wire                mulInputs_11_ready;
  wire       [254:0]  mulInputs_11_payload_op1;
  wire       [254:0]  mulInputs_11_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_ready;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_payload_state_id;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire                _zz_io_output_valid;
  wire                _zz_mulResJoined_ready;
  wire       [3059:0] _zz_io_output_payload_state_elements_0;
  reg                 _zz_mulResJoined_ready_1;
  wire                _zz_io_output_valid_1;
  reg                 _zz_io_output_valid_2;
  reg        [6:0]    _zz_io_output_payload_round_index;
  reg        [3:0]    _zz_io_output_payload_state_size;
  reg        [6:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_elements_0_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_2;
  reg        [254:0]  _zz_io_output_payload_state_elements_3;
  reg        [254:0]  _zz_io_output_payload_state_elements_4;
  reg        [254:0]  _zz_io_output_payload_state_elements_5;
  reg        [254:0]  _zz_io_output_payload_state_elements_6;
  reg        [254:0]  _zz_io_output_payload_state_elements_7;
  reg        [254:0]  _zz_io_output_payload_state_elements_8;
  reg        [254:0]  _zz_io_output_payload_state_elements_9;
  reg        [254:0]  _zz_io_output_payload_state_elements_10;
  reg        [254:0]  _zz_io_output_payload_state_elements_11;
  wire                when_Stream_l342;

  assign _zz__zz_mulOp2s_0_4 = mDSMatrix_15_io_dataPorts_1;
  assign _zz__zz_mulOp2s_0_4_1 = mDSMatrix_15_io_dataPorts_0;
  assign _zz__zz_io_output_payload_state_elements_0 = montMultiplierPipedSim_46_io_output_payload_res;
  assign _zz__zz_io_output_payload_state_elements_0_1 = montMultiplierPipedSim_45_io_output_payload_res;
  MDSMatrix_8 mDSMatrix_12 (
    .io_dataPorts_0    (mDSMatrix_12_io_dataPorts_0  ), //o
    .io_dataPorts_1    (mDSMatrix_12_io_dataPorts_1  ), //o
    .io_dataPorts_2    (mDSMatrix_12_io_dataPorts_2  ), //o
    .io_addressPort    (mDSMatrix_12_io_addressPort  )  //i
  );
  MDSMatrix_9 mDSMatrix_13 (
    .io_dataPorts_0    (mDSMatrix_13_io_dataPorts_0  ), //o
    .io_dataPorts_1    (mDSMatrix_13_io_dataPorts_1  ), //o
    .io_dataPorts_2    (mDSMatrix_13_io_dataPorts_2  ), //o
    .io_dataPorts_3    (mDSMatrix_13_io_dataPorts_3  ), //o
    .io_dataPorts_4    (mDSMatrix_13_io_dataPorts_4  ), //o
    .io_addressPort    (mDSMatrix_13_io_addressPort  )  //i
  );
  MDSMatrix_10 mDSMatrix_14 (
    .io_dataPorts_0    (mDSMatrix_14_io_dataPorts_0   ), //o
    .io_dataPorts_1    (mDSMatrix_14_io_dataPorts_1   ), //o
    .io_dataPorts_2    (mDSMatrix_14_io_dataPorts_2   ), //o
    .io_dataPorts_3    (mDSMatrix_14_io_dataPorts_3   ), //o
    .io_dataPorts_4    (mDSMatrix_14_io_dataPorts_4   ), //o
    .io_dataPorts_5    (mDSMatrix_14_io_dataPorts_5   ), //o
    .io_dataPorts_6    (mDSMatrix_14_io_dataPorts_6   ), //o
    .io_dataPorts_7    (mDSMatrix_14_io_dataPorts_7   ), //o
    .io_dataPorts_8    (mDSMatrix_14_io_dataPorts_8   ), //o
    .io_addressPort    (io_input_payload_state_index  )  //i
  );
  MDSMatrix_11 mDSMatrix_15 (
    .io_dataPorts_0     (mDSMatrix_15_io_dataPorts_0   ), //o
    .io_dataPorts_1     (mDSMatrix_15_io_dataPorts_1   ), //o
    .io_dataPorts_2     (mDSMatrix_15_io_dataPorts_2   ), //o
    .io_dataPorts_3     (mDSMatrix_15_io_dataPorts_3   ), //o
    .io_dataPorts_4     (mDSMatrix_15_io_dataPorts_4   ), //o
    .io_dataPorts_5     (mDSMatrix_15_io_dataPorts_5   ), //o
    .io_dataPorts_6     (mDSMatrix_15_io_dataPorts_6   ), //o
    .io_dataPorts_7     (mDSMatrix_15_io_dataPorts_7   ), //o
    .io_dataPorts_8     (mDSMatrix_15_io_dataPorts_8   ), //o
    .io_dataPorts_9     (mDSMatrix_15_io_dataPorts_9   ), //o
    .io_dataPorts_10    (mDSMatrix_15_io_dataPorts_10  ), //o
    .io_dataPorts_11    (mDSMatrix_15_io_dataPorts_11  ), //o
    .io_addressPort     (io_input_payload_state_index  )  //i
  );
  StreamFork io_input_fork (
    .io_input_valid                        (io_input_valid                                    ), //i
    .io_input_ready                        (io_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (io_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (io_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (io_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (io_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (io_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (io_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (io_input_fork_io_outputs_0_translated_ready       ), //i
    .io_outputs_0_payload_round_index      (io_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (io_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (io_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (io_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (io_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (io_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (io_input_fork_io_outputs_1_translated_ready       ), //i
    .io_outputs_1_payload_round_index      (io_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (io_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (io_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (io_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (io_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  StreamFork_1 io_input_fork_io_outputs_0_translated_fork (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_valid                       ), //i
    .io_input_ready           (io_input_fork_io_outputs_0_translated_fork_io_input_ready         ), //o
    .io_input_payload         (io_input_fork_io_outputs_0_translated_payload                     ), //i
    .io_outputs_0_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid     ), //o
    .io_outputs_0_ready       (mulInputs_0_ready                                                 ), //i
    .io_outputs_0_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload   ), //o
    .io_outputs_1_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid     ), //o
    .io_outputs_1_ready       (mulInputs_1_ready                                                 ), //i
    .io_outputs_1_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload   ), //o
    .io_outputs_2_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid     ), //o
    .io_outputs_2_ready       (mulInputs_2_ready                                                 ), //i
    .io_outputs_2_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload   ), //o
    .io_outputs_3_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid     ), //o
    .io_outputs_3_ready       (mulInputs_3_ready                                                 ), //i
    .io_outputs_3_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload   ), //o
    .io_outputs_4_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid     ), //o
    .io_outputs_4_ready       (mulInputs_4_ready                                                 ), //i
    .io_outputs_4_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload   ), //o
    .io_outputs_5_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid     ), //o
    .io_outputs_5_ready       (mulInputs_5_ready                                                 ), //i
    .io_outputs_5_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload   ), //o
    .io_outputs_6_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid     ), //o
    .io_outputs_6_ready       (mulInputs_6_ready                                                 ), //i
    .io_outputs_6_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload   ), //o
    .io_outputs_7_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid     ), //o
    .io_outputs_7_ready       (mulInputs_7_ready                                                 ), //i
    .io_outputs_7_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload   ), //o
    .io_outputs_8_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid     ), //o
    .io_outputs_8_ready       (mulInputs_8_ready                                                 ), //i
    .io_outputs_8_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload   ), //o
    .io_outputs_9_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid     ), //o
    .io_outputs_9_ready       (mulInputs_9_ready                                                 ), //i
    .io_outputs_9_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload   ), //o
    .io_outputs_10_valid      (io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid    ), //o
    .io_outputs_10_ready      (mulInputs_10_ready                                                ), //i
    .io_outputs_10_payload    (io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload  ), //o
    .io_outputs_11_valid      (io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid    ), //o
    .io_outputs_11_ready      (mulInputs_11_ready                                                ), //i
    .io_outputs_11_payload    (io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_45 (
    .io_input_valid           (mulInputs_0_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_45_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_0_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_0_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_45_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_45_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_46 (
    .io_input_valid           (mulInputs_1_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_46_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_1_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_1_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_46_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_46_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_47 (
    .io_input_valid           (mulInputs_2_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_47_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_2_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_2_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_47_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_47_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_48 (
    .io_input_valid           (mulInputs_3_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_48_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_3_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_3_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_48_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_48_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_49 (
    .io_input_valid           (mulInputs_4_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_49_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_4_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_4_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_49_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_49_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_50 (
    .io_input_valid           (mulInputs_5_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_50_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_5_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_5_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_50_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_50_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_51 (
    .io_input_valid           (mulInputs_6_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_51_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_6_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_6_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_51_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_51_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_52 (
    .io_input_valid           (mulInputs_7_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_52_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_7_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_7_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_52_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_52_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_53 (
    .io_input_valid           (mulInputs_8_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_53_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_8_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_8_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_53_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_53_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_54 (
    .io_input_valid           (mulInputs_9_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_54_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_9_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_9_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_54_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_54_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_55 (
    .io_input_valid           (mulInputs_10_valid                               ), //i
    .io_input_ready           (montMultiplierPipedSim_55_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_10_payload_op1                         ), //i
    .io_input_payload_op2     (mulInputs_10_payload_op2                         ), //i
    .io_output_valid          (montMultiplierPipedSim_55_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_55_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_56 (
    .io_input_valid           (mulInputs_11_valid                               ), //i
    .io_input_ready           (montMultiplierPipedSim_56_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_11_payload_op1                         ), //i
    .io_input_payload_op2     (mulInputs_11_payload_op2                         ), //i
    .io_output_valid          (montMultiplierPipedSim_56_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_56_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo io_input_fork_io_outputs_1_translated_fifo (
    .io_push_valid                  (io_input_fork_io_outputs_1_translated_valid                            ), //i
    .io_push_ready                  (io_input_fork_io_outputs_1_translated_fifo_io_push_ready               ), //o
    .io_push_payload_round_index    (io_input_fork_io_outputs_1_translated_payload_round_index              ), //i
    .io_push_payload_state_size     (io_input_fork_io_outputs_1_translated_payload_state_size               ), //i
    .io_push_payload_state_id       (io_input_fork_io_outputs_1_translated_payload_state_id                 ), //i
    .io_pop_valid                   (io_input_fork_io_outputs_1_translated_fifo_io_pop_valid                ), //o
    .io_pop_ready                   (_zz_mulResJoined_ready                                                 ), //i
    .io_pop_payload_round_index     (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index  ), //o
    .io_pop_payload_state_size      (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size   ), //o
    .io_pop_payload_state_id        (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id     ), //o
    .io_flush                       (1'b0                                                                   ), //i
    .io_occupancy                   (io_input_fork_io_outputs_1_translated_fifo_io_occupancy                ), //o
    .io_availability                (io_input_fork_io_outputs_1_translated_fifo_io_availability             ), //o
    .clk                            (clk                                                                    ), //i
    .reset                          (reset                                                                  )  //i
  );
  assign mDSMatrix_12_io_addressPort = io_input_payload_state_index[1:0];
  assign mDSMatrix_13_io_addressPort = io_input_payload_state_index[2:0];
  assign _zz_mulOp2s_0 = {2295'h0,{mDSMatrix_12_io_dataPorts_2,{mDSMatrix_12_io_dataPorts_1,mDSMatrix_12_io_dataPorts_0}}};
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_0 = _zz_mulOp2s_0[254 : 0];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_0 = _zz_mulOp2s_0_1[254 : 0];
        end else begin
          mulOp2s_0 = _zz_mulOp2s_0_2[254 : 0];
        end
      end
      4'b1001 : begin
        mulOp2s_0 = _zz_mulOp2s_0_3[254 : 0];
      end
      4'b1100 : begin
        mulOp2s_0 = _zz_mulOp2s_0_4[254 : 0];
      end
      default : begin
        mulOp2s_0 = _zz_mulOp2s_0_5[254 : 0];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_1 = _zz_mulOp2s_0[509 : 255];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_1 = _zz_mulOp2s_0_1[509 : 255];
        end else begin
          mulOp2s_1 = _zz_mulOp2s_0_2[509 : 255];
        end
      end
      4'b1001 : begin
        mulOp2s_1 = _zz_mulOp2s_0_3[509 : 255];
      end
      4'b1100 : begin
        mulOp2s_1 = _zz_mulOp2s_0_4[509 : 255];
      end
      default : begin
        mulOp2s_1 = _zz_mulOp2s_0_5[509 : 255];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_2 = _zz_mulOp2s_0[764 : 510];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_2 = _zz_mulOp2s_0_1[764 : 510];
        end else begin
          mulOp2s_2 = _zz_mulOp2s_0_2[764 : 510];
        end
      end
      4'b1001 : begin
        mulOp2s_2 = _zz_mulOp2s_0_3[764 : 510];
      end
      4'b1100 : begin
        mulOp2s_2 = _zz_mulOp2s_0_4[764 : 510];
      end
      default : begin
        mulOp2s_2 = _zz_mulOp2s_0_5[764 : 510];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_3 = _zz_mulOp2s_0[1019 : 765];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_3 = _zz_mulOp2s_0_1[1019 : 765];
        end else begin
          mulOp2s_3 = _zz_mulOp2s_0_2[1019 : 765];
        end
      end
      4'b1001 : begin
        mulOp2s_3 = _zz_mulOp2s_0_3[1019 : 765];
      end
      4'b1100 : begin
        mulOp2s_3 = _zz_mulOp2s_0_4[1019 : 765];
      end
      default : begin
        mulOp2s_3 = _zz_mulOp2s_0_5[1019 : 765];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_4 = _zz_mulOp2s_0[1274 : 1020];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_4 = _zz_mulOp2s_0_1[1274 : 1020];
        end else begin
          mulOp2s_4 = _zz_mulOp2s_0_2[1274 : 1020];
        end
      end
      4'b1001 : begin
        mulOp2s_4 = _zz_mulOp2s_0_3[1274 : 1020];
      end
      4'b1100 : begin
        mulOp2s_4 = _zz_mulOp2s_0_4[1274 : 1020];
      end
      default : begin
        mulOp2s_4 = _zz_mulOp2s_0_5[1274 : 1020];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_5 = _zz_mulOp2s_0[1529 : 1275];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_5 = _zz_mulOp2s_0_1[1529 : 1275];
        end else begin
          mulOp2s_5 = _zz_mulOp2s_0_2[1529 : 1275];
        end
      end
      4'b1001 : begin
        mulOp2s_5 = _zz_mulOp2s_0_3[1529 : 1275];
      end
      4'b1100 : begin
        mulOp2s_5 = _zz_mulOp2s_0_4[1529 : 1275];
      end
      default : begin
        mulOp2s_5 = _zz_mulOp2s_0_5[1529 : 1275];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_6 = _zz_mulOp2s_0[1784 : 1530];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_6 = _zz_mulOp2s_0_1[1784 : 1530];
        end else begin
          mulOp2s_6 = _zz_mulOp2s_0_2[1784 : 1530];
        end
      end
      4'b1001 : begin
        mulOp2s_6 = _zz_mulOp2s_0_3[1784 : 1530];
      end
      4'b1100 : begin
        mulOp2s_6 = _zz_mulOp2s_0_4[1784 : 1530];
      end
      default : begin
        mulOp2s_6 = _zz_mulOp2s_0_5[1784 : 1530];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_7 = _zz_mulOp2s_0[2039 : 1785];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_7 = _zz_mulOp2s_0_1[2039 : 1785];
        end else begin
          mulOp2s_7 = _zz_mulOp2s_0_2[2039 : 1785];
        end
      end
      4'b1001 : begin
        mulOp2s_7 = _zz_mulOp2s_0_3[2039 : 1785];
      end
      4'b1100 : begin
        mulOp2s_7 = _zz_mulOp2s_0_4[2039 : 1785];
      end
      default : begin
        mulOp2s_7 = _zz_mulOp2s_0_5[2039 : 1785];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_8 = _zz_mulOp2s_0[2294 : 2040];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_8 = _zz_mulOp2s_0_1[2294 : 2040];
        end else begin
          mulOp2s_8 = _zz_mulOp2s_0_2[2294 : 2040];
        end
      end
      4'b1001 : begin
        mulOp2s_8 = _zz_mulOp2s_0_3[2294 : 2040];
      end
      4'b1100 : begin
        mulOp2s_8 = _zz_mulOp2s_0_4[2294 : 2040];
      end
      default : begin
        mulOp2s_8 = _zz_mulOp2s_0_5[2294 : 2040];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_9 = _zz_mulOp2s_0[2549 : 2295];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_9 = _zz_mulOp2s_0_1[2549 : 2295];
        end else begin
          mulOp2s_9 = _zz_mulOp2s_0_2[2549 : 2295];
        end
      end
      4'b1001 : begin
        mulOp2s_9 = _zz_mulOp2s_0_3[2549 : 2295];
      end
      4'b1100 : begin
        mulOp2s_9 = _zz_mulOp2s_0_4[2549 : 2295];
      end
      default : begin
        mulOp2s_9 = _zz_mulOp2s_0_5[2549 : 2295];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_10 = _zz_mulOp2s_0[2804 : 2550];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_10 = _zz_mulOp2s_0_1[2804 : 2550];
        end else begin
          mulOp2s_10 = _zz_mulOp2s_0_2[2804 : 2550];
        end
      end
      4'b1001 : begin
        mulOp2s_10 = _zz_mulOp2s_0_3[2804 : 2550];
      end
      4'b1100 : begin
        mulOp2s_10 = _zz_mulOp2s_0_4[2804 : 2550];
      end
      default : begin
        mulOp2s_10 = _zz_mulOp2s_0_5[2804 : 2550];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_11 = _zz_mulOp2s_0[3059 : 2805];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_11 = _zz_mulOp2s_0_1[3059 : 2805];
        end else begin
          mulOp2s_11 = _zz_mulOp2s_0_2[3059 : 2805];
        end
      end
      4'b1001 : begin
        mulOp2s_11 = _zz_mulOp2s_0_3[3059 : 2805];
      end
      4'b1100 : begin
        mulOp2s_11 = _zz_mulOp2s_0_4[3059 : 2805];
      end
      default : begin
        mulOp2s_11 = _zz_mulOp2s_0_5[3059 : 2805];
      end
    endcase
  end

  assign when_MDSMatrixMultiplier_l50 = (io_input_payload_state_index == 4'b0101);
  assign _zz_mulOp2s_0_1 = 3060'h0;
  assign _zz_mulOp2s_0_2 = {1785'h0,{mDSMatrix_13_io_dataPorts_4,{mDSMatrix_13_io_dataPorts_3,{mDSMatrix_13_io_dataPorts_2,{mDSMatrix_13_io_dataPorts_1,mDSMatrix_13_io_dataPorts_0}}}}};
  assign _zz_mulOp2s_0_3 = {765'h0,{mDSMatrix_14_io_dataPorts_8,{mDSMatrix_14_io_dataPorts_7,{mDSMatrix_14_io_dataPorts_6,{mDSMatrix_14_io_dataPorts_5,{mDSMatrix_14_io_dataPorts_4,{mDSMatrix_14_io_dataPorts_3,{mDSMatrix_14_io_dataPorts_2,{mDSMatrix_14_io_dataPorts_1,mDSMatrix_14_io_dataPorts_0}}}}}}}}};
  assign _zz_mulOp2s_0_4 = {mDSMatrix_15_io_dataPorts_11,{mDSMatrix_15_io_dataPorts_10,{mDSMatrix_15_io_dataPorts_9,{mDSMatrix_15_io_dataPorts_8,{mDSMatrix_15_io_dataPorts_7,{mDSMatrix_15_io_dataPorts_6,{mDSMatrix_15_io_dataPorts_5,{mDSMatrix_15_io_dataPorts_4,{mDSMatrix_15_io_dataPorts_3,{mDSMatrix_15_io_dataPorts_2,{_zz__zz_mulOp2s_0_4,_zz__zz_mulOp2s_0_4_1}}}}}}}}}}};
  assign _zz_mulOp2s_0_5 = 3060'h0;
  assign io_input_ready = io_input_fork_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_0_translated_payload = io_input_payload_state_element;
  assign io_input_fork_io_outputs_0_translated_ready = io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  assign mulInputs_0_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  assign mulInputs_0_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload;
  assign mulInputs_0_payload_op2 = mulOp2s_0;
  assign mulInputs_1_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  assign mulInputs_1_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload;
  assign mulInputs_1_payload_op2 = mulOp2s_1;
  assign mulInputs_2_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  assign mulInputs_2_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload;
  assign mulInputs_2_payload_op2 = mulOp2s_2;
  assign mulInputs_3_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  assign mulInputs_3_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload;
  assign mulInputs_3_payload_op2 = mulOp2s_3;
  assign mulInputs_4_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid;
  assign mulInputs_4_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload;
  assign mulInputs_4_payload_op2 = mulOp2s_4;
  assign mulInputs_5_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid;
  assign mulInputs_5_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload;
  assign mulInputs_5_payload_op2 = mulOp2s_5;
  assign mulInputs_6_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid;
  assign mulInputs_6_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload;
  assign mulInputs_6_payload_op2 = mulOp2s_6;
  assign mulInputs_7_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid;
  assign mulInputs_7_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload;
  assign mulInputs_7_payload_op2 = mulOp2s_7;
  assign mulInputs_8_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid;
  assign mulInputs_8_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload;
  assign mulInputs_8_payload_op2 = mulOp2s_8;
  assign mulInputs_9_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid;
  assign mulInputs_9_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload;
  assign mulInputs_9_payload_op2 = mulOp2s_9;
  assign mulInputs_10_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid;
  assign mulInputs_10_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload;
  assign mulInputs_10_payload_op2 = mulOp2s_10;
  assign mulInputs_11_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid;
  assign mulInputs_11_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload;
  assign mulInputs_11_payload_op2 = mulOp2s_11;
  assign mulInputs_0_ready = montMultiplierPipedSim_45_io_input_ready;
  assign mulInputs_1_ready = montMultiplierPipedSim_46_io_input_ready;
  assign mulInputs_2_ready = montMultiplierPipedSim_47_io_input_ready;
  assign mulInputs_3_ready = montMultiplierPipedSim_48_io_input_ready;
  assign mulInputs_4_ready = montMultiplierPipedSim_49_io_input_ready;
  assign mulInputs_5_ready = montMultiplierPipedSim_50_io_input_ready;
  assign mulInputs_6_ready = montMultiplierPipedSim_51_io_input_ready;
  assign mulInputs_7_ready = montMultiplierPipedSim_52_io_input_ready;
  assign mulInputs_8_ready = montMultiplierPipedSim_53_io_input_ready;
  assign mulInputs_9_ready = montMultiplierPipedSim_54_io_input_ready;
  assign mulInputs_10_ready = montMultiplierPipedSim_55_io_input_ready;
  assign mulInputs_11_ready = montMultiplierPipedSim_56_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_1_translated_payload_round_index = io_input_payload_round_index;
  assign io_input_fork_io_outputs_1_translated_payload_state_size = io_input_payload_state_size;
  assign io_input_fork_io_outputs_1_translated_payload_state_id = io_input_payload_state_id;
  assign io_input_fork_io_outputs_1_translated_ready = io_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  assign mulResJoined_fire = (mulResJoined_valid && mulResJoined_ready);
  assign mulResJoined_valid = (((((((((((montMultiplierPipedSim_45_io_output_valid && montMultiplierPipedSim_46_io_output_valid) && montMultiplierPipedSim_47_io_output_valid) && montMultiplierPipedSim_48_io_output_valid) && montMultiplierPipedSim_49_io_output_valid) && montMultiplierPipedSim_50_io_output_valid) && montMultiplierPipedSim_51_io_output_valid) && montMultiplierPipedSim_52_io_output_valid) && montMultiplierPipedSim_53_io_output_valid) && montMultiplierPipedSim_54_io_output_valid) && montMultiplierPipedSim_55_io_output_valid) && montMultiplierPipedSim_56_io_output_valid);
  assign _zz_mulResJoined_ready = (_zz_io_output_valid && _zz_mulResJoined_ready_1);
  assign _zz_io_output_valid = (mulResJoined_valid && io_input_fork_io_outputs_1_translated_fifo_io_pop_valid);
  assign mulResJoined_ready = _zz_mulResJoined_ready;
  assign _zz_io_output_payload_state_elements_0 = {montMultiplierPipedSim_56_io_output_payload_res,{montMultiplierPipedSim_55_io_output_payload_res,{montMultiplierPipedSim_54_io_output_payload_res,{montMultiplierPipedSim_53_io_output_payload_res,{montMultiplierPipedSim_52_io_output_payload_res,{montMultiplierPipedSim_51_io_output_payload_res,{montMultiplierPipedSim_50_io_output_payload_res,{montMultiplierPipedSim_49_io_output_payload_res,{montMultiplierPipedSim_48_io_output_payload_res,{montMultiplierPipedSim_47_io_output_payload_res,{_zz__zz_io_output_payload_state_elements_0,_zz__zz_io_output_payload_state_elements_0_1}}}}}}}}}}};
  always @(*) begin
    _zz_mulResJoined_ready_1 = io_output_ready;
    if(when_Stream_l342) begin
      _zz_mulResJoined_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l342 = (! _zz_io_output_valid_1);
  assign _zz_io_output_valid_1 = _zz_io_output_valid_2;
  assign io_output_valid = _zz_io_output_valid_1;
  assign io_output_payload_round_index = _zz_io_output_payload_round_index;
  assign io_output_payload_state_size = _zz_io_output_payload_state_size;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = _zz_io_output_payload_state_elements_0_1;
  assign io_output_payload_state_elements_1 = _zz_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = _zz_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = _zz_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = _zz_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = _zz_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = _zz_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = _zz_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = _zz_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = _zz_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = _zz_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = _zz_io_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_output_valid_2 <= 1'b0;
    end else begin
      if(_zz_mulResJoined_ready_1) begin
        _zz_io_output_valid_2 <= _zz_io_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(_zz_mulResJoined_ready_1) begin
      _zz_io_output_payload_round_index <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
      _zz_io_output_payload_state_size <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
      _zz_io_output_payload_state_id <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
      _zz_io_output_payload_state_elements_0_1 <= _zz_io_output_payload_state_elements_0[254 : 0];
      _zz_io_output_payload_state_elements_1 <= _zz_io_output_payload_state_elements_0[509 : 255];
      _zz_io_output_payload_state_elements_2 <= _zz_io_output_payload_state_elements_0[764 : 510];
      _zz_io_output_payload_state_elements_3 <= _zz_io_output_payload_state_elements_0[1019 : 765];
      _zz_io_output_payload_state_elements_4 <= _zz_io_output_payload_state_elements_0[1274 : 1020];
      _zz_io_output_payload_state_elements_5 <= _zz_io_output_payload_state_elements_0[1529 : 1275];
      _zz_io_output_payload_state_elements_6 <= _zz_io_output_payload_state_elements_0[1784 : 1530];
      _zz_io_output_payload_state_elements_7 <= _zz_io_output_payload_state_elements_0[2039 : 1785];
      _zz_io_output_payload_state_elements_8 <= _zz_io_output_payload_state_elements_0[2294 : 2040];
      _zz_io_output_payload_state_elements_9 <= _zz_io_output_payload_state_elements_0[2549 : 2295];
      _zz_io_output_payload_state_elements_10 <= _zz_io_output_payload_state_elements_0[2804 : 2550];
      _zz_io_output_payload_state_elements_11 <= _zz_io_output_payload_state_elements_0[3059 : 2805];
    end
  end


endmodule

//StreamFifo_4 replaced by StreamFifo_4

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork_7 replaced by StreamFork_7

//StreamFifo_3 replaced by StreamFifo_3

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork replaced by StreamFork

module RoundConstants_11 (
  output     [254:0]  io_readPorts_0_data,
  input      [3:0]    io_readPorts_0_tIndex,
  input      [6:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  wire       [254:0]  _zz_constantsRoms_5_port0;
  wire       [254:0]  _zz_constantsRoms_6_port0;
  wire       [254:0]  _zz_constantsRoms_7_port0;
  wire       [254:0]  _zz_constantsRoms_8_port0;
  wire       [254:0]  _zz_constantsRoms_9_port0;
  wire       [254:0]  _zz_constantsRoms_10_port0;
  wire       [254:0]  _zz_constantsRoms_11_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_8 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_9 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_10 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_11 [0:64];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_5.bin",constantsRoms_5);
  end
  assign _zz_constantsRoms_5_port0 = constantsRoms_5[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_6.bin",constantsRoms_6);
  end
  assign _zz_constantsRoms_6_port0 = constantsRoms_6[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_7.bin",constantsRoms_7);
  end
  assign _zz_constantsRoms_7_port0 = constantsRoms_7[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_8.bin",constantsRoms_8);
  end
  assign _zz_constantsRoms_8_port0 = constantsRoms_8[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_9.bin",constantsRoms_9);
  end
  assign _zz_constantsRoms_9_port0 = constantsRoms_9[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_10.bin",constantsRoms_10);
  end
  assign _zz_constantsRoms_10_port0 = constantsRoms_10[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_11.bin",constantsRoms_11);
  end
  assign _zz_constantsRoms_11_port0 = constantsRoms_11[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      4'b0000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      4'b0001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      4'b0010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      4'b0011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      4'b0100 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
      4'b0101 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_5_port0;
      end
      4'b0110 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_6_port0;
      end
      4'b0111 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_7_port0;
      end
      4'b1000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_8_port0;
      end
      4'b1001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_9_port0;
      end
      4'b1010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_10_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_11_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_10 (
  output     [254:0]  io_readPorts_0_data,
  input      [3:0]    io_readPorts_0_tIndex,
  input      [6:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  wire       [254:0]  _zz_constantsRoms_5_port0;
  wire       [254:0]  _zz_constantsRoms_6_port0;
  wire       [254:0]  _zz_constantsRoms_7_port0;
  wire       [254:0]  _zz_constantsRoms_8_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_8 [0:64];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_5.bin",constantsRoms_5);
  end
  assign _zz_constantsRoms_5_port0 = constantsRoms_5[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_6.bin",constantsRoms_6);
  end
  assign _zz_constantsRoms_6_port0 = constantsRoms_6[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_7.bin",constantsRoms_7);
  end
  assign _zz_constantsRoms_7_port0 = constantsRoms_7[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_8.bin",constantsRoms_8);
  end
  assign _zz_constantsRoms_8_port0 = constantsRoms_8[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      4'b0000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      4'b0001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      4'b0010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      4'b0011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      4'b0100 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
      4'b0101 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_5_port0;
      end
      4'b0110 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_6_port0;
      end
      4'b0111 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_7_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_8_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_9 (
  output     [254:0]  io_readPorts_0_data,
  input      [2:0]    io_readPorts_0_tIndex,
  input      [5:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:63];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      3'b000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      3'b001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      3'b010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      3'b011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_8 (
  output     [254:0]  io_readPorts_0_data,
  input      [1:0]    io_readPorts_0_tIndex,
  input      [5:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:62];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      2'b00 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      2'b01 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

//StreamDemux_45 replaced by StreamDemux_45

module MDSMatrixAdders_1 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output reg          io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [254:0]  modAdder_1_res_o;
  wire       [254:0]  modAdder_2_res_o;
  wire       [254:0]  modAdder_3_res_o;
  wire       [254:0]  modAdder_4_res_o;
  wire       [254:0]  modAdder_5_res_o;
  wire       [254:0]  modAdder_6_res_o;
  wire       [254:0]  modAdder_7_res_o;
  wire       [254:0]  modAdder_8_res_o;
  wire       [254:0]  modAdder_9_res_o;
  wire       [254:0]  modAdder_10_res_o;
  wire       [254:0]  modAdder_11_res_o;
  wire       [254:0]  modAdder_12_res_o;
  wire       [3:0]    _zz_countNum;
  wire       [3:0]    _zz_when_MDSMatrixAdders_l81;
  reg        [6:0]    tempRes_round_index;
  reg        [3:0]    tempRes_state_size;
  reg        [6:0]    tempRes_state_id;
  reg        [254:0]  tempRes_state_elements_0;
  reg        [254:0]  tempRes_state_elements_1;
  reg        [254:0]  tempRes_state_elements_2;
  reg        [254:0]  tempRes_state_elements_3;
  reg        [254:0]  tempRes_state_elements_4;
  reg        [254:0]  tempRes_state_elements_5;
  reg        [254:0]  tempRes_state_elements_6;
  reg        [254:0]  tempRes_state_elements_7;
  reg        [254:0]  tempRes_state_elements_8;
  reg        [254:0]  tempRes_state_elements_9;
  reg        [254:0]  tempRes_state_elements_10;
  reg        [254:0]  tempRes_state_elements_11;
  wire       [254:0]  modAdderRes_0;
  wire       [254:0]  modAdderRes_1;
  wire       [254:0]  modAdderRes_2;
  wire       [254:0]  modAdderRes_3;
  wire       [254:0]  modAdderRes_4;
  wire       [254:0]  modAdderRes_5;
  wire       [254:0]  modAdderRes_6;
  wire       [254:0]  modAdderRes_7;
  wire       [254:0]  modAdderRes_8;
  wire       [254:0]  modAdderRes_9;
  wire       [254:0]  modAdderRes_10;
  wire       [254:0]  modAdderRes_11;
  wire       [3:0]    countNum;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_3_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_3_binary_sequential_type fsm_stateNext;
  wire                io_input_fire;
  wire                io_input_fire_1;
  wire                when_MDSMatrixAdders_l81;
  wire                io_output_fire;
  wire                io_input_fire_2;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_countNum = (tempRes_state_size + 4'b0001);
  assign _zz_when_MDSMatrixAdders_l81 = (fsm_counter + 4'b0001);
  ModAdder modAdder_1 (
    .op1_i    (tempRes_state_elements_0           ), //i
    .op2_i    (io_input_payload_state_elements_0  ), //i
    .res_o    (modAdder_1_res_o                   )  //o
  );
  ModAdder modAdder_2 (
    .op1_i    (tempRes_state_elements_1           ), //i
    .op2_i    (io_input_payload_state_elements_1  ), //i
    .res_o    (modAdder_2_res_o                   )  //o
  );
  ModAdder modAdder_3 (
    .op1_i    (tempRes_state_elements_2           ), //i
    .op2_i    (io_input_payload_state_elements_2  ), //i
    .res_o    (modAdder_3_res_o                   )  //o
  );
  ModAdder modAdder_4 (
    .op1_i    (tempRes_state_elements_3           ), //i
    .op2_i    (io_input_payload_state_elements_3  ), //i
    .res_o    (modAdder_4_res_o                   )  //o
  );
  ModAdder modAdder_5 (
    .op1_i    (tempRes_state_elements_4           ), //i
    .op2_i    (io_input_payload_state_elements_4  ), //i
    .res_o    (modAdder_5_res_o                   )  //o
  );
  ModAdder modAdder_6 (
    .op1_i    (tempRes_state_elements_5           ), //i
    .op2_i    (io_input_payload_state_elements_5  ), //i
    .res_o    (modAdder_6_res_o                   )  //o
  );
  ModAdder modAdder_7 (
    .op1_i    (tempRes_state_elements_6           ), //i
    .op2_i    (io_input_payload_state_elements_6  ), //i
    .res_o    (modAdder_7_res_o                   )  //o
  );
  ModAdder modAdder_8 (
    .op1_i    (tempRes_state_elements_7           ), //i
    .op2_i    (io_input_payload_state_elements_7  ), //i
    .res_o    (modAdder_8_res_o                   )  //o
  );
  ModAdder modAdder_9 (
    .op1_i    (tempRes_state_elements_8           ), //i
    .op2_i    (io_input_payload_state_elements_8  ), //i
    .res_o    (modAdder_9_res_o                   )  //o
  );
  ModAdder modAdder_10 (
    .op1_i    (tempRes_state_elements_9           ), //i
    .op2_i    (io_input_payload_state_elements_9  ), //i
    .res_o    (modAdder_10_res_o                  )  //o
  );
  ModAdder modAdder_11 (
    .op1_i    (tempRes_state_elements_10           ), //i
    .op2_i    (io_input_payload_state_elements_10  ), //i
    .res_o    (modAdder_11_res_o                   )  //o
  );
  ModAdder modAdder_12 (
    .op1_i    (tempRes_state_elements_11           ), //i
    .op2_i    (io_input_payload_state_elements_11  ), //i
    .res_o    (modAdder_12_res_o                   )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_3_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : fsm_stateReg_string = "fsm_ADDING";
      `fsm_enumDefinition_3_binary_sequential_fsm_DONE : fsm_stateReg_string = "fsm_DONE  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_3_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : fsm_stateNext_string = "fsm_ADDING";
      `fsm_enumDefinition_3_binary_sequential_fsm_DONE : fsm_stateNext_string = "fsm_DONE  ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign modAdderRes_0 = modAdder_1_res_o;
  assign modAdderRes_1 = modAdder_2_res_o;
  assign modAdderRes_2 = modAdder_3_res_o;
  assign modAdderRes_3 = modAdder_4_res_o;
  assign modAdderRes_4 = modAdder_5_res_o;
  assign modAdderRes_5 = modAdder_6_res_o;
  assign modAdderRes_6 = modAdder_7_res_o;
  assign modAdderRes_7 = modAdder_8_res_o;
  assign modAdderRes_8 = modAdder_9_res_o;
  assign modAdderRes_9 = modAdder_10_res_o;
  assign modAdderRes_10 = modAdder_11_res_o;
  assign modAdderRes_11 = modAdder_12_res_o;
  assign countNum = ((tempRes_state_size == 4'b0101) ? _zz_countNum : tempRes_state_size);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_DONE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign io_output_payload_round_index = tempRes_round_index;
  assign io_output_payload_state_size = tempRes_state_size;
  assign io_output_payload_state_id = tempRes_state_id;
  assign io_output_payload_state_elements_0 = tempRes_state_elements_0;
  assign io_output_payload_state_elements_1 = tempRes_state_elements_1;
  assign io_output_payload_state_elements_2 = tempRes_state_elements_2;
  assign io_output_payload_state_elements_3 = tempRes_state_elements_3;
  assign io_output_payload_state_elements_4 = tempRes_state_elements_4;
  assign io_output_payload_state_elements_5 = tempRes_state_elements_5;
  assign io_output_payload_state_elements_6 = tempRes_state_elements_6;
  assign io_output_payload_state_elements_7 = tempRes_state_elements_7;
  assign io_output_payload_state_elements_8 = tempRes_state_elements_8;
  assign io_output_payload_state_elements_9 = tempRes_state_elements_9;
  assign io_output_payload_state_elements_10 = tempRes_state_elements_10;
  assign io_output_payload_state_elements_11 = tempRes_state_elements_11;
  always @(*) begin
    io_output_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_DONE : begin
        io_output_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_input_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          io_input_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
        if(io_input_fire) begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_ADDING;
        end
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : begin
        if(io_input_fire_1) begin
          if(when_MDSMatrixAdders_l81) begin
            fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_DONE;
          end
        end
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          if(io_input_fire_2) begin
            fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_ADDING;
          end else begin
            fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_BOOT;
    end
  end

  assign io_input_fire = (io_input_valid && io_input_ready);
  assign io_input_fire_1 = (io_input_valid && io_input_ready);
  assign when_MDSMatrixAdders_l81 = (_zz_when_MDSMatrixAdders_l81 == countNum);
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire_2 = (io_input_valid && io_input_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_ADDING) && (! (fsm_stateNext == `fsm_enumDefinition_3_binary_sequential_fsm_ADDING)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      tempRes_state_size <= 4'b0000;
      tempRes_state_elements_0 <= 255'h0;
      tempRes_state_elements_1 <= 255'h0;
      tempRes_state_elements_2 <= 255'h0;
      tempRes_state_elements_3 <= 255'h0;
      tempRes_state_elements_4 <= 255'h0;
      tempRes_state_elements_5 <= 255'h0;
      tempRes_state_elements_6 <= 255'h0;
      tempRes_state_elements_7 <= 255'h0;
      tempRes_state_elements_8 <= 255'h0;
      tempRes_state_elements_9 <= 255'h0;
      tempRes_state_elements_10 <= 255'h0;
      tempRes_state_elements_11 <= 255'h0;
      tempRes_state_id <= 7'h0;
      tempRes_round_index <= 7'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_3_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
          if(io_input_fire) begin
            tempRes_round_index <= io_input_payload_round_index;
            tempRes_state_size <= io_input_payload_state_size;
            tempRes_state_id <= io_input_payload_state_id;
            tempRes_state_elements_0 <= io_input_payload_state_elements_0;
            tempRes_state_elements_1 <= io_input_payload_state_elements_1;
            tempRes_state_elements_2 <= io_input_payload_state_elements_2;
            tempRes_state_elements_3 <= io_input_payload_state_elements_3;
            tempRes_state_elements_4 <= io_input_payload_state_elements_4;
            tempRes_state_elements_5 <= io_input_payload_state_elements_5;
            tempRes_state_elements_6 <= io_input_payload_state_elements_6;
            tempRes_state_elements_7 <= io_input_payload_state_elements_7;
            tempRes_state_elements_8 <= io_input_payload_state_elements_8;
            tempRes_state_elements_9 <= io_input_payload_state_elements_9;
            tempRes_state_elements_10 <= io_input_payload_state_elements_10;
            tempRes_state_elements_11 <= io_input_payload_state_elements_11;
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_3_binary_sequential_fsm_ADDING : begin
          if(io_input_fire_1) begin
            tempRes_state_elements_0 <= modAdderRes_0;
            tempRes_state_elements_1 <= modAdderRes_1;
            tempRes_state_elements_2 <= modAdderRes_2;
            tempRes_state_elements_3 <= modAdderRes_3;
            tempRes_state_elements_4 <= modAdderRes_4;
            tempRes_state_elements_5 <= modAdderRes_5;
            tempRes_state_elements_6 <= modAdderRes_6;
            tempRes_state_elements_7 <= modAdderRes_7;
            tempRes_state_elements_8 <= modAdderRes_8;
            tempRes_state_elements_9 <= modAdderRes_9;
            tempRes_state_elements_10 <= modAdderRes_10;
            tempRes_state_elements_11 <= modAdderRes_11;
            if(!when_MDSMatrixAdders_l81) begin
              fsm_counter <= (fsm_counter + 4'b0001);
            end
          end
        end
        `fsm_enumDefinition_3_binary_sequential_fsm_DONE : begin
          if(io_output_fire) begin
            if(io_input_fire_2) begin
              tempRes_round_index <= io_input_payload_round_index;
              tempRes_state_size <= io_input_payload_state_size;
              tempRes_state_id <= io_input_payload_state_id;
              tempRes_state_elements_0 <= io_input_payload_state_elements_0;
              tempRes_state_elements_1 <= io_input_payload_state_elements_1;
              tempRes_state_elements_2 <= io_input_payload_state_elements_2;
              tempRes_state_elements_3 <= io_input_payload_state_elements_3;
              tempRes_state_elements_4 <= io_input_payload_state_elements_4;
              tempRes_state_elements_5 <= io_input_payload_state_elements_5;
              tempRes_state_elements_6 <= io_input_payload_state_elements_6;
              tempRes_state_elements_7 <= io_input_payload_state_elements_7;
              tempRes_state_elements_8 <= io_input_payload_state_elements_8;
              tempRes_state_elements_9 <= io_input_payload_state_elements_9;
              tempRes_state_elements_10 <= io_input_payload_state_elements_10;
              tempRes_state_elements_11 <= io_input_payload_state_elements_11;
              fsm_counter <= (fsm_counter + 4'b0001);
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        fsm_counter <= 4'b0000;
      end
    end
  end


endmodule

module MDSMatrixMultiplier_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [1:0]    mDSMatrix_12_io_addressPort;
  wire       [2:0]    mDSMatrix_13_io_addressPort;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_5;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_6;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_7;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_8;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_5;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_6;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_7;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_8;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_9;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_10;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_11;
  wire                io_input_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_valid;
  wire       [6:0]    io_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  io_input_fork_io_outputs_0_payload_state_element;
  wire                io_input_fork_io_outputs_1_valid;
  wire       [6:0]    io_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  io_input_fork_io_outputs_1_payload_state_element;
  wire                io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload;
  wire                montMultiplierPipedSim_45_io_input_ready;
  wire                montMultiplierPipedSim_45_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_45_io_output_payload_res;
  wire                montMultiplierPipedSim_46_io_input_ready;
  wire                montMultiplierPipedSim_46_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_46_io_output_payload_res;
  wire                montMultiplierPipedSim_47_io_input_ready;
  wire                montMultiplierPipedSim_47_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_47_io_output_payload_res;
  wire                montMultiplierPipedSim_48_io_input_ready;
  wire                montMultiplierPipedSim_48_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_48_io_output_payload_res;
  wire                montMultiplierPipedSim_49_io_input_ready;
  wire                montMultiplierPipedSim_49_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_49_io_output_payload_res;
  wire                montMultiplierPipedSim_50_io_input_ready;
  wire                montMultiplierPipedSim_50_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_50_io_output_payload_res;
  wire                montMultiplierPipedSim_51_io_input_ready;
  wire                montMultiplierPipedSim_51_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_51_io_output_payload_res;
  wire                montMultiplierPipedSim_52_io_input_ready;
  wire                montMultiplierPipedSim_52_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_52_io_output_payload_res;
  wire                montMultiplierPipedSim_53_io_input_ready;
  wire                montMultiplierPipedSim_53_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_53_io_output_payload_res;
  wire                montMultiplierPipedSim_54_io_input_ready;
  wire                montMultiplierPipedSim_54_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_54_io_output_payload_res;
  wire                montMultiplierPipedSim_55_io_input_ready;
  wire                montMultiplierPipedSim_55_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_55_io_output_payload_res;
  wire                montMultiplierPipedSim_56_io_input_ready;
  wire                montMultiplierPipedSim_56_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_56_io_output_payload_res;
  wire                io_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                io_input_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_availability;
  wire       [254:0]  _zz__zz_mulOp2s_0_4;
  wire       [254:0]  _zz__zz_mulOp2s_0_4_1;
  wire       [254:0]  _zz__zz_io_output_payload_state_elements_0;
  wire       [254:0]  _zz__zz_io_output_payload_state_elements_0_1;
  reg        [254:0]  mulOp2s_0;
  reg        [254:0]  mulOp2s_1;
  reg        [254:0]  mulOp2s_2;
  reg        [254:0]  mulOp2s_3;
  reg        [254:0]  mulOp2s_4;
  reg        [254:0]  mulOp2s_5;
  reg        [254:0]  mulOp2s_6;
  reg        [254:0]  mulOp2s_7;
  reg        [254:0]  mulOp2s_8;
  reg        [254:0]  mulOp2s_9;
  reg        [254:0]  mulOp2s_10;
  reg        [254:0]  mulOp2s_11;
  wire       [3059:0] _zz_mulOp2s_0;
  wire                when_MDSMatrixMultiplier_l50;
  wire       [3059:0] _zz_mulOp2s_0_1;
  wire       [3059:0] _zz_mulOp2s_0_2;
  wire       [3059:0] _zz_mulOp2s_0_3;
  wire       [3059:0] _zz_mulOp2s_0_4;
  wire       [3059:0] _zz_mulOp2s_0_5;
  wire                io_input_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_ready;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_payload;
  wire                mulInputs_0_valid;
  wire                mulInputs_0_ready;
  wire       [254:0]  mulInputs_0_payload_op1;
  wire       [254:0]  mulInputs_0_payload_op2;
  wire                mulInputs_1_valid;
  wire                mulInputs_1_ready;
  wire       [254:0]  mulInputs_1_payload_op1;
  wire       [254:0]  mulInputs_1_payload_op2;
  wire                mulInputs_2_valid;
  wire                mulInputs_2_ready;
  wire       [254:0]  mulInputs_2_payload_op1;
  wire       [254:0]  mulInputs_2_payload_op2;
  wire                mulInputs_3_valid;
  wire                mulInputs_3_ready;
  wire       [254:0]  mulInputs_3_payload_op1;
  wire       [254:0]  mulInputs_3_payload_op2;
  wire                mulInputs_4_valid;
  wire                mulInputs_4_ready;
  wire       [254:0]  mulInputs_4_payload_op1;
  wire       [254:0]  mulInputs_4_payload_op2;
  wire                mulInputs_5_valid;
  wire                mulInputs_5_ready;
  wire       [254:0]  mulInputs_5_payload_op1;
  wire       [254:0]  mulInputs_5_payload_op2;
  wire                mulInputs_6_valid;
  wire                mulInputs_6_ready;
  wire       [254:0]  mulInputs_6_payload_op1;
  wire       [254:0]  mulInputs_6_payload_op2;
  wire                mulInputs_7_valid;
  wire                mulInputs_7_ready;
  wire       [254:0]  mulInputs_7_payload_op1;
  wire       [254:0]  mulInputs_7_payload_op2;
  wire                mulInputs_8_valid;
  wire                mulInputs_8_ready;
  wire       [254:0]  mulInputs_8_payload_op1;
  wire       [254:0]  mulInputs_8_payload_op2;
  wire                mulInputs_9_valid;
  wire                mulInputs_9_ready;
  wire       [254:0]  mulInputs_9_payload_op1;
  wire       [254:0]  mulInputs_9_payload_op2;
  wire                mulInputs_10_valid;
  wire                mulInputs_10_ready;
  wire       [254:0]  mulInputs_10_payload_op1;
  wire       [254:0]  mulInputs_10_payload_op2;
  wire                mulInputs_11_valid;
  wire                mulInputs_11_ready;
  wire       [254:0]  mulInputs_11_payload_op1;
  wire       [254:0]  mulInputs_11_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_ready;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_payload_state_id;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire                _zz_io_output_valid;
  wire                _zz_mulResJoined_ready;
  wire       [3059:0] _zz_io_output_payload_state_elements_0;
  reg                 _zz_mulResJoined_ready_1;
  wire                _zz_io_output_valid_1;
  reg                 _zz_io_output_valid_2;
  reg        [6:0]    _zz_io_output_payload_round_index;
  reg        [3:0]    _zz_io_output_payload_state_size;
  reg        [6:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_elements_0_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_2;
  reg        [254:0]  _zz_io_output_payload_state_elements_3;
  reg        [254:0]  _zz_io_output_payload_state_elements_4;
  reg        [254:0]  _zz_io_output_payload_state_elements_5;
  reg        [254:0]  _zz_io_output_payload_state_elements_6;
  reg        [254:0]  _zz_io_output_payload_state_elements_7;
  reg        [254:0]  _zz_io_output_payload_state_elements_8;
  reg        [254:0]  _zz_io_output_payload_state_elements_9;
  reg        [254:0]  _zz_io_output_payload_state_elements_10;
  reg        [254:0]  _zz_io_output_payload_state_elements_11;
  wire                when_Stream_l342;

  assign _zz__zz_mulOp2s_0_4 = mDSMatrix_15_io_dataPorts_1;
  assign _zz__zz_mulOp2s_0_4_1 = mDSMatrix_15_io_dataPorts_0;
  assign _zz__zz_io_output_payload_state_elements_0 = montMultiplierPipedSim_46_io_output_payload_res;
  assign _zz__zz_io_output_payload_state_elements_0_1 = montMultiplierPipedSim_45_io_output_payload_res;
  MDSMatrix_4 mDSMatrix_12 (
    .io_dataPorts_0    (mDSMatrix_12_io_dataPorts_0  ), //o
    .io_dataPorts_1    (mDSMatrix_12_io_dataPorts_1  ), //o
    .io_dataPorts_2    (mDSMatrix_12_io_dataPorts_2  ), //o
    .io_addressPort    (mDSMatrix_12_io_addressPort  )  //i
  );
  MDSMatrix_5 mDSMatrix_13 (
    .io_dataPorts_0    (mDSMatrix_13_io_dataPorts_0  ), //o
    .io_dataPorts_1    (mDSMatrix_13_io_dataPorts_1  ), //o
    .io_dataPorts_2    (mDSMatrix_13_io_dataPorts_2  ), //o
    .io_dataPorts_3    (mDSMatrix_13_io_dataPorts_3  ), //o
    .io_dataPorts_4    (mDSMatrix_13_io_dataPorts_4  ), //o
    .io_addressPort    (mDSMatrix_13_io_addressPort  )  //i
  );
  MDSMatrix_6 mDSMatrix_14 (
    .io_dataPorts_0    (mDSMatrix_14_io_dataPorts_0   ), //o
    .io_dataPorts_1    (mDSMatrix_14_io_dataPorts_1   ), //o
    .io_dataPorts_2    (mDSMatrix_14_io_dataPorts_2   ), //o
    .io_dataPorts_3    (mDSMatrix_14_io_dataPorts_3   ), //o
    .io_dataPorts_4    (mDSMatrix_14_io_dataPorts_4   ), //o
    .io_dataPorts_5    (mDSMatrix_14_io_dataPorts_5   ), //o
    .io_dataPorts_6    (mDSMatrix_14_io_dataPorts_6   ), //o
    .io_dataPorts_7    (mDSMatrix_14_io_dataPorts_7   ), //o
    .io_dataPorts_8    (mDSMatrix_14_io_dataPorts_8   ), //o
    .io_addressPort    (io_input_payload_state_index  )  //i
  );
  MDSMatrix_7 mDSMatrix_15 (
    .io_dataPorts_0     (mDSMatrix_15_io_dataPorts_0   ), //o
    .io_dataPorts_1     (mDSMatrix_15_io_dataPorts_1   ), //o
    .io_dataPorts_2     (mDSMatrix_15_io_dataPorts_2   ), //o
    .io_dataPorts_3     (mDSMatrix_15_io_dataPorts_3   ), //o
    .io_dataPorts_4     (mDSMatrix_15_io_dataPorts_4   ), //o
    .io_dataPorts_5     (mDSMatrix_15_io_dataPorts_5   ), //o
    .io_dataPorts_6     (mDSMatrix_15_io_dataPorts_6   ), //o
    .io_dataPorts_7     (mDSMatrix_15_io_dataPorts_7   ), //o
    .io_dataPorts_8     (mDSMatrix_15_io_dataPorts_8   ), //o
    .io_dataPorts_9     (mDSMatrix_15_io_dataPorts_9   ), //o
    .io_dataPorts_10    (mDSMatrix_15_io_dataPorts_10  ), //o
    .io_dataPorts_11    (mDSMatrix_15_io_dataPorts_11  ), //o
    .io_addressPort     (io_input_payload_state_index  )  //i
  );
  StreamFork io_input_fork (
    .io_input_valid                        (io_input_valid                                    ), //i
    .io_input_ready                        (io_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (io_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (io_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (io_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (io_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (io_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (io_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (io_input_fork_io_outputs_0_translated_ready       ), //i
    .io_outputs_0_payload_round_index      (io_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (io_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (io_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (io_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (io_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (io_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (io_input_fork_io_outputs_1_translated_ready       ), //i
    .io_outputs_1_payload_round_index      (io_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (io_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (io_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (io_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (io_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  StreamFork_1 io_input_fork_io_outputs_0_translated_fork (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_valid                       ), //i
    .io_input_ready           (io_input_fork_io_outputs_0_translated_fork_io_input_ready         ), //o
    .io_input_payload         (io_input_fork_io_outputs_0_translated_payload                     ), //i
    .io_outputs_0_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid     ), //o
    .io_outputs_0_ready       (mulInputs_0_ready                                                 ), //i
    .io_outputs_0_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload   ), //o
    .io_outputs_1_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid     ), //o
    .io_outputs_1_ready       (mulInputs_1_ready                                                 ), //i
    .io_outputs_1_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload   ), //o
    .io_outputs_2_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid     ), //o
    .io_outputs_2_ready       (mulInputs_2_ready                                                 ), //i
    .io_outputs_2_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload   ), //o
    .io_outputs_3_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid     ), //o
    .io_outputs_3_ready       (mulInputs_3_ready                                                 ), //i
    .io_outputs_3_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload   ), //o
    .io_outputs_4_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid     ), //o
    .io_outputs_4_ready       (mulInputs_4_ready                                                 ), //i
    .io_outputs_4_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload   ), //o
    .io_outputs_5_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid     ), //o
    .io_outputs_5_ready       (mulInputs_5_ready                                                 ), //i
    .io_outputs_5_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload   ), //o
    .io_outputs_6_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid     ), //o
    .io_outputs_6_ready       (mulInputs_6_ready                                                 ), //i
    .io_outputs_6_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload   ), //o
    .io_outputs_7_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid     ), //o
    .io_outputs_7_ready       (mulInputs_7_ready                                                 ), //i
    .io_outputs_7_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload   ), //o
    .io_outputs_8_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid     ), //o
    .io_outputs_8_ready       (mulInputs_8_ready                                                 ), //i
    .io_outputs_8_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload   ), //o
    .io_outputs_9_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid     ), //o
    .io_outputs_9_ready       (mulInputs_9_ready                                                 ), //i
    .io_outputs_9_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload   ), //o
    .io_outputs_10_valid      (io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid    ), //o
    .io_outputs_10_ready      (mulInputs_10_ready                                                ), //i
    .io_outputs_10_payload    (io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload  ), //o
    .io_outputs_11_valid      (io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid    ), //o
    .io_outputs_11_ready      (mulInputs_11_ready                                                ), //i
    .io_outputs_11_payload    (io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_45 (
    .io_input_valid           (mulInputs_0_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_45_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_0_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_0_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_45_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_45_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_46 (
    .io_input_valid           (mulInputs_1_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_46_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_1_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_1_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_46_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_46_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_47 (
    .io_input_valid           (mulInputs_2_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_47_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_2_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_2_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_47_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_47_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_48 (
    .io_input_valid           (mulInputs_3_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_48_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_3_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_3_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_48_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_48_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_49 (
    .io_input_valid           (mulInputs_4_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_49_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_4_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_4_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_49_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_49_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_50 (
    .io_input_valid           (mulInputs_5_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_50_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_5_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_5_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_50_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_50_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_51 (
    .io_input_valid           (mulInputs_6_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_51_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_6_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_6_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_51_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_51_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_52 (
    .io_input_valid           (mulInputs_7_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_52_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_7_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_7_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_52_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_52_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_53 (
    .io_input_valid           (mulInputs_8_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_53_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_8_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_8_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_53_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_53_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_54 (
    .io_input_valid           (mulInputs_9_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_54_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_9_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_9_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_54_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_54_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_55 (
    .io_input_valid           (mulInputs_10_valid                               ), //i
    .io_input_ready           (montMultiplierPipedSim_55_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_10_payload_op1                         ), //i
    .io_input_payload_op2     (mulInputs_10_payload_op2                         ), //i
    .io_output_valid          (montMultiplierPipedSim_55_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_55_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_56 (
    .io_input_valid           (mulInputs_11_valid                               ), //i
    .io_input_ready           (montMultiplierPipedSim_56_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_11_payload_op1                         ), //i
    .io_input_payload_op2     (mulInputs_11_payload_op2                         ), //i
    .io_output_valid          (montMultiplierPipedSim_56_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_56_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo io_input_fork_io_outputs_1_translated_fifo (
    .io_push_valid                  (io_input_fork_io_outputs_1_translated_valid                            ), //i
    .io_push_ready                  (io_input_fork_io_outputs_1_translated_fifo_io_push_ready               ), //o
    .io_push_payload_round_index    (io_input_fork_io_outputs_1_translated_payload_round_index              ), //i
    .io_push_payload_state_size     (io_input_fork_io_outputs_1_translated_payload_state_size               ), //i
    .io_push_payload_state_id       (io_input_fork_io_outputs_1_translated_payload_state_id                 ), //i
    .io_pop_valid                   (io_input_fork_io_outputs_1_translated_fifo_io_pop_valid                ), //o
    .io_pop_ready                   (_zz_mulResJoined_ready                                                 ), //i
    .io_pop_payload_round_index     (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index  ), //o
    .io_pop_payload_state_size      (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size   ), //o
    .io_pop_payload_state_id        (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id     ), //o
    .io_flush                       (1'b0                                                                   ), //i
    .io_occupancy                   (io_input_fork_io_outputs_1_translated_fifo_io_occupancy                ), //o
    .io_availability                (io_input_fork_io_outputs_1_translated_fifo_io_availability             ), //o
    .clk                            (clk                                                                    ), //i
    .reset                          (reset                                                                  )  //i
  );
  assign mDSMatrix_12_io_addressPort = io_input_payload_state_index[1:0];
  assign mDSMatrix_13_io_addressPort = io_input_payload_state_index[2:0];
  assign _zz_mulOp2s_0 = {2295'h0,{mDSMatrix_12_io_dataPorts_2,{mDSMatrix_12_io_dataPorts_1,mDSMatrix_12_io_dataPorts_0}}};
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_0 = _zz_mulOp2s_0[254 : 0];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_0 = _zz_mulOp2s_0_1[254 : 0];
        end else begin
          mulOp2s_0 = _zz_mulOp2s_0_2[254 : 0];
        end
      end
      4'b1001 : begin
        mulOp2s_0 = _zz_mulOp2s_0_3[254 : 0];
      end
      4'b1100 : begin
        mulOp2s_0 = _zz_mulOp2s_0_4[254 : 0];
      end
      default : begin
        mulOp2s_0 = _zz_mulOp2s_0_5[254 : 0];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_1 = _zz_mulOp2s_0[509 : 255];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_1 = _zz_mulOp2s_0_1[509 : 255];
        end else begin
          mulOp2s_1 = _zz_mulOp2s_0_2[509 : 255];
        end
      end
      4'b1001 : begin
        mulOp2s_1 = _zz_mulOp2s_0_3[509 : 255];
      end
      4'b1100 : begin
        mulOp2s_1 = _zz_mulOp2s_0_4[509 : 255];
      end
      default : begin
        mulOp2s_1 = _zz_mulOp2s_0_5[509 : 255];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_2 = _zz_mulOp2s_0[764 : 510];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_2 = _zz_mulOp2s_0_1[764 : 510];
        end else begin
          mulOp2s_2 = _zz_mulOp2s_0_2[764 : 510];
        end
      end
      4'b1001 : begin
        mulOp2s_2 = _zz_mulOp2s_0_3[764 : 510];
      end
      4'b1100 : begin
        mulOp2s_2 = _zz_mulOp2s_0_4[764 : 510];
      end
      default : begin
        mulOp2s_2 = _zz_mulOp2s_0_5[764 : 510];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_3 = _zz_mulOp2s_0[1019 : 765];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_3 = _zz_mulOp2s_0_1[1019 : 765];
        end else begin
          mulOp2s_3 = _zz_mulOp2s_0_2[1019 : 765];
        end
      end
      4'b1001 : begin
        mulOp2s_3 = _zz_mulOp2s_0_3[1019 : 765];
      end
      4'b1100 : begin
        mulOp2s_3 = _zz_mulOp2s_0_4[1019 : 765];
      end
      default : begin
        mulOp2s_3 = _zz_mulOp2s_0_5[1019 : 765];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_4 = _zz_mulOp2s_0[1274 : 1020];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_4 = _zz_mulOp2s_0_1[1274 : 1020];
        end else begin
          mulOp2s_4 = _zz_mulOp2s_0_2[1274 : 1020];
        end
      end
      4'b1001 : begin
        mulOp2s_4 = _zz_mulOp2s_0_3[1274 : 1020];
      end
      4'b1100 : begin
        mulOp2s_4 = _zz_mulOp2s_0_4[1274 : 1020];
      end
      default : begin
        mulOp2s_4 = _zz_mulOp2s_0_5[1274 : 1020];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_5 = _zz_mulOp2s_0[1529 : 1275];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_5 = _zz_mulOp2s_0_1[1529 : 1275];
        end else begin
          mulOp2s_5 = _zz_mulOp2s_0_2[1529 : 1275];
        end
      end
      4'b1001 : begin
        mulOp2s_5 = _zz_mulOp2s_0_3[1529 : 1275];
      end
      4'b1100 : begin
        mulOp2s_5 = _zz_mulOp2s_0_4[1529 : 1275];
      end
      default : begin
        mulOp2s_5 = _zz_mulOp2s_0_5[1529 : 1275];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_6 = _zz_mulOp2s_0[1784 : 1530];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_6 = _zz_mulOp2s_0_1[1784 : 1530];
        end else begin
          mulOp2s_6 = _zz_mulOp2s_0_2[1784 : 1530];
        end
      end
      4'b1001 : begin
        mulOp2s_6 = _zz_mulOp2s_0_3[1784 : 1530];
      end
      4'b1100 : begin
        mulOp2s_6 = _zz_mulOp2s_0_4[1784 : 1530];
      end
      default : begin
        mulOp2s_6 = _zz_mulOp2s_0_5[1784 : 1530];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_7 = _zz_mulOp2s_0[2039 : 1785];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_7 = _zz_mulOp2s_0_1[2039 : 1785];
        end else begin
          mulOp2s_7 = _zz_mulOp2s_0_2[2039 : 1785];
        end
      end
      4'b1001 : begin
        mulOp2s_7 = _zz_mulOp2s_0_3[2039 : 1785];
      end
      4'b1100 : begin
        mulOp2s_7 = _zz_mulOp2s_0_4[2039 : 1785];
      end
      default : begin
        mulOp2s_7 = _zz_mulOp2s_0_5[2039 : 1785];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_8 = _zz_mulOp2s_0[2294 : 2040];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_8 = _zz_mulOp2s_0_1[2294 : 2040];
        end else begin
          mulOp2s_8 = _zz_mulOp2s_0_2[2294 : 2040];
        end
      end
      4'b1001 : begin
        mulOp2s_8 = _zz_mulOp2s_0_3[2294 : 2040];
      end
      4'b1100 : begin
        mulOp2s_8 = _zz_mulOp2s_0_4[2294 : 2040];
      end
      default : begin
        mulOp2s_8 = _zz_mulOp2s_0_5[2294 : 2040];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_9 = _zz_mulOp2s_0[2549 : 2295];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_9 = _zz_mulOp2s_0_1[2549 : 2295];
        end else begin
          mulOp2s_9 = _zz_mulOp2s_0_2[2549 : 2295];
        end
      end
      4'b1001 : begin
        mulOp2s_9 = _zz_mulOp2s_0_3[2549 : 2295];
      end
      4'b1100 : begin
        mulOp2s_9 = _zz_mulOp2s_0_4[2549 : 2295];
      end
      default : begin
        mulOp2s_9 = _zz_mulOp2s_0_5[2549 : 2295];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_10 = _zz_mulOp2s_0[2804 : 2550];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_10 = _zz_mulOp2s_0_1[2804 : 2550];
        end else begin
          mulOp2s_10 = _zz_mulOp2s_0_2[2804 : 2550];
        end
      end
      4'b1001 : begin
        mulOp2s_10 = _zz_mulOp2s_0_3[2804 : 2550];
      end
      4'b1100 : begin
        mulOp2s_10 = _zz_mulOp2s_0_4[2804 : 2550];
      end
      default : begin
        mulOp2s_10 = _zz_mulOp2s_0_5[2804 : 2550];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_11 = _zz_mulOp2s_0[3059 : 2805];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_11 = _zz_mulOp2s_0_1[3059 : 2805];
        end else begin
          mulOp2s_11 = _zz_mulOp2s_0_2[3059 : 2805];
        end
      end
      4'b1001 : begin
        mulOp2s_11 = _zz_mulOp2s_0_3[3059 : 2805];
      end
      4'b1100 : begin
        mulOp2s_11 = _zz_mulOp2s_0_4[3059 : 2805];
      end
      default : begin
        mulOp2s_11 = _zz_mulOp2s_0_5[3059 : 2805];
      end
    endcase
  end

  assign when_MDSMatrixMultiplier_l50 = (io_input_payload_state_index == 4'b0101);
  assign _zz_mulOp2s_0_1 = 3060'h0;
  assign _zz_mulOp2s_0_2 = {1785'h0,{mDSMatrix_13_io_dataPorts_4,{mDSMatrix_13_io_dataPorts_3,{mDSMatrix_13_io_dataPorts_2,{mDSMatrix_13_io_dataPorts_1,mDSMatrix_13_io_dataPorts_0}}}}};
  assign _zz_mulOp2s_0_3 = {765'h0,{mDSMatrix_14_io_dataPorts_8,{mDSMatrix_14_io_dataPorts_7,{mDSMatrix_14_io_dataPorts_6,{mDSMatrix_14_io_dataPorts_5,{mDSMatrix_14_io_dataPorts_4,{mDSMatrix_14_io_dataPorts_3,{mDSMatrix_14_io_dataPorts_2,{mDSMatrix_14_io_dataPorts_1,mDSMatrix_14_io_dataPorts_0}}}}}}}}};
  assign _zz_mulOp2s_0_4 = {mDSMatrix_15_io_dataPorts_11,{mDSMatrix_15_io_dataPorts_10,{mDSMatrix_15_io_dataPorts_9,{mDSMatrix_15_io_dataPorts_8,{mDSMatrix_15_io_dataPorts_7,{mDSMatrix_15_io_dataPorts_6,{mDSMatrix_15_io_dataPorts_5,{mDSMatrix_15_io_dataPorts_4,{mDSMatrix_15_io_dataPorts_3,{mDSMatrix_15_io_dataPorts_2,{_zz__zz_mulOp2s_0_4,_zz__zz_mulOp2s_0_4_1}}}}}}}}}}};
  assign _zz_mulOp2s_0_5 = 3060'h0;
  assign io_input_ready = io_input_fork_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_0_translated_payload = io_input_payload_state_element;
  assign io_input_fork_io_outputs_0_translated_ready = io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  assign mulInputs_0_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  assign mulInputs_0_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload;
  assign mulInputs_0_payload_op2 = mulOp2s_0;
  assign mulInputs_1_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  assign mulInputs_1_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload;
  assign mulInputs_1_payload_op2 = mulOp2s_1;
  assign mulInputs_2_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  assign mulInputs_2_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload;
  assign mulInputs_2_payload_op2 = mulOp2s_2;
  assign mulInputs_3_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  assign mulInputs_3_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload;
  assign mulInputs_3_payload_op2 = mulOp2s_3;
  assign mulInputs_4_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid;
  assign mulInputs_4_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload;
  assign mulInputs_4_payload_op2 = mulOp2s_4;
  assign mulInputs_5_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid;
  assign mulInputs_5_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload;
  assign mulInputs_5_payload_op2 = mulOp2s_5;
  assign mulInputs_6_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid;
  assign mulInputs_6_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload;
  assign mulInputs_6_payload_op2 = mulOp2s_6;
  assign mulInputs_7_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid;
  assign mulInputs_7_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload;
  assign mulInputs_7_payload_op2 = mulOp2s_7;
  assign mulInputs_8_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid;
  assign mulInputs_8_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload;
  assign mulInputs_8_payload_op2 = mulOp2s_8;
  assign mulInputs_9_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid;
  assign mulInputs_9_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload;
  assign mulInputs_9_payload_op2 = mulOp2s_9;
  assign mulInputs_10_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid;
  assign mulInputs_10_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload;
  assign mulInputs_10_payload_op2 = mulOp2s_10;
  assign mulInputs_11_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid;
  assign mulInputs_11_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload;
  assign mulInputs_11_payload_op2 = mulOp2s_11;
  assign mulInputs_0_ready = montMultiplierPipedSim_45_io_input_ready;
  assign mulInputs_1_ready = montMultiplierPipedSim_46_io_input_ready;
  assign mulInputs_2_ready = montMultiplierPipedSim_47_io_input_ready;
  assign mulInputs_3_ready = montMultiplierPipedSim_48_io_input_ready;
  assign mulInputs_4_ready = montMultiplierPipedSim_49_io_input_ready;
  assign mulInputs_5_ready = montMultiplierPipedSim_50_io_input_ready;
  assign mulInputs_6_ready = montMultiplierPipedSim_51_io_input_ready;
  assign mulInputs_7_ready = montMultiplierPipedSim_52_io_input_ready;
  assign mulInputs_8_ready = montMultiplierPipedSim_53_io_input_ready;
  assign mulInputs_9_ready = montMultiplierPipedSim_54_io_input_ready;
  assign mulInputs_10_ready = montMultiplierPipedSim_55_io_input_ready;
  assign mulInputs_11_ready = montMultiplierPipedSim_56_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_1_translated_payload_round_index = io_input_payload_round_index;
  assign io_input_fork_io_outputs_1_translated_payload_state_size = io_input_payload_state_size;
  assign io_input_fork_io_outputs_1_translated_payload_state_id = io_input_payload_state_id;
  assign io_input_fork_io_outputs_1_translated_ready = io_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  assign mulResJoined_fire = (mulResJoined_valid && mulResJoined_ready);
  assign mulResJoined_valid = (((((((((((montMultiplierPipedSim_45_io_output_valid && montMultiplierPipedSim_46_io_output_valid) && montMultiplierPipedSim_47_io_output_valid) && montMultiplierPipedSim_48_io_output_valid) && montMultiplierPipedSim_49_io_output_valid) && montMultiplierPipedSim_50_io_output_valid) && montMultiplierPipedSim_51_io_output_valid) && montMultiplierPipedSim_52_io_output_valid) && montMultiplierPipedSim_53_io_output_valid) && montMultiplierPipedSim_54_io_output_valid) && montMultiplierPipedSim_55_io_output_valid) && montMultiplierPipedSim_56_io_output_valid);
  assign _zz_mulResJoined_ready = (_zz_io_output_valid && _zz_mulResJoined_ready_1);
  assign _zz_io_output_valid = (mulResJoined_valid && io_input_fork_io_outputs_1_translated_fifo_io_pop_valid);
  assign mulResJoined_ready = _zz_mulResJoined_ready;
  assign _zz_io_output_payload_state_elements_0 = {montMultiplierPipedSim_56_io_output_payload_res,{montMultiplierPipedSim_55_io_output_payload_res,{montMultiplierPipedSim_54_io_output_payload_res,{montMultiplierPipedSim_53_io_output_payload_res,{montMultiplierPipedSim_52_io_output_payload_res,{montMultiplierPipedSim_51_io_output_payload_res,{montMultiplierPipedSim_50_io_output_payload_res,{montMultiplierPipedSim_49_io_output_payload_res,{montMultiplierPipedSim_48_io_output_payload_res,{montMultiplierPipedSim_47_io_output_payload_res,{_zz__zz_io_output_payload_state_elements_0,_zz__zz_io_output_payload_state_elements_0_1}}}}}}}}}}};
  always @(*) begin
    _zz_mulResJoined_ready_1 = io_output_ready;
    if(when_Stream_l342) begin
      _zz_mulResJoined_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l342 = (! _zz_io_output_valid_1);
  assign _zz_io_output_valid_1 = _zz_io_output_valid_2;
  assign io_output_valid = _zz_io_output_valid_1;
  assign io_output_payload_round_index = _zz_io_output_payload_round_index;
  assign io_output_payload_state_size = _zz_io_output_payload_state_size;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = _zz_io_output_payload_state_elements_0_1;
  assign io_output_payload_state_elements_1 = _zz_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = _zz_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = _zz_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = _zz_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = _zz_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = _zz_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = _zz_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = _zz_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = _zz_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = _zz_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = _zz_io_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_output_valid_2 <= 1'b0;
    end else begin
      if(_zz_mulResJoined_ready_1) begin
        _zz_io_output_valid_2 <= _zz_io_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(_zz_mulResJoined_ready_1) begin
      _zz_io_output_payload_round_index <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
      _zz_io_output_payload_state_size <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
      _zz_io_output_payload_state_id <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
      _zz_io_output_payload_state_elements_0_1 <= _zz_io_output_payload_state_elements_0[254 : 0];
      _zz_io_output_payload_state_elements_1 <= _zz_io_output_payload_state_elements_0[509 : 255];
      _zz_io_output_payload_state_elements_2 <= _zz_io_output_payload_state_elements_0[764 : 510];
      _zz_io_output_payload_state_elements_3 <= _zz_io_output_payload_state_elements_0[1019 : 765];
      _zz_io_output_payload_state_elements_4 <= _zz_io_output_payload_state_elements_0[1274 : 1020];
      _zz_io_output_payload_state_elements_5 <= _zz_io_output_payload_state_elements_0[1529 : 1275];
      _zz_io_output_payload_state_elements_6 <= _zz_io_output_payload_state_elements_0[1784 : 1530];
      _zz_io_output_payload_state_elements_7 <= _zz_io_output_payload_state_elements_0[2039 : 1785];
      _zz_io_output_payload_state_elements_8 <= _zz_io_output_payload_state_elements_0[2294 : 2040];
      _zz_io_output_payload_state_elements_9 <= _zz_io_output_payload_state_elements_0[2549 : 2295];
      _zz_io_output_payload_state_elements_10 <= _zz_io_output_payload_state_elements_0[2804 : 2550];
      _zz_io_output_payload_state_elements_11 <= _zz_io_output_payload_state_elements_0[3059 : 2805];
    end
  end


endmodule

//StreamFifo_4 replaced by StreamFifo_4

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork_7 replaced by StreamFork_7

//StreamFifo_3 replaced by StreamFifo_3

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork replaced by StreamFork

module RoundConstants_7 (
  output     [254:0]  io_readPorts_0_data,
  input      [3:0]    io_readPorts_0_tIndex,
  input      [6:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  wire       [254:0]  _zz_constantsRoms_5_port0;
  wire       [254:0]  _zz_constantsRoms_6_port0;
  wire       [254:0]  _zz_constantsRoms_7_port0;
  wire       [254:0]  _zz_constantsRoms_8_port0;
  wire       [254:0]  _zz_constantsRoms_9_port0;
  wire       [254:0]  _zz_constantsRoms_10_port0;
  wire       [254:0]  _zz_constantsRoms_11_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_8 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_9 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_10 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_11 [0:64];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_5.bin",constantsRoms_5);
  end
  assign _zz_constantsRoms_5_port0 = constantsRoms_5[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_6.bin",constantsRoms_6);
  end
  assign _zz_constantsRoms_6_port0 = constantsRoms_6[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_7.bin",constantsRoms_7);
  end
  assign _zz_constantsRoms_7_port0 = constantsRoms_7[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_8.bin",constantsRoms_8);
  end
  assign _zz_constantsRoms_8_port0 = constantsRoms_8[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_9.bin",constantsRoms_9);
  end
  assign _zz_constantsRoms_9_port0 = constantsRoms_9[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_10.bin",constantsRoms_10);
  end
  assign _zz_constantsRoms_10_port0 = constantsRoms_10[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_11.bin",constantsRoms_11);
  end
  assign _zz_constantsRoms_11_port0 = constantsRoms_11[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      4'b0000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      4'b0001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      4'b0010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      4'b0011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      4'b0100 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
      4'b0101 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_5_port0;
      end
      4'b0110 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_6_port0;
      end
      4'b0111 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_7_port0;
      end
      4'b1000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_8_port0;
      end
      4'b1001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_9_port0;
      end
      4'b1010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_10_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_11_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_6 (
  output     [254:0]  io_readPorts_0_data,
  input      [3:0]    io_readPorts_0_tIndex,
  input      [6:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  wire       [254:0]  _zz_constantsRoms_5_port0;
  wire       [254:0]  _zz_constantsRoms_6_port0;
  wire       [254:0]  _zz_constantsRoms_7_port0;
  wire       [254:0]  _zz_constantsRoms_8_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_8 [0:64];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_5.bin",constantsRoms_5);
  end
  assign _zz_constantsRoms_5_port0 = constantsRoms_5[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_6.bin",constantsRoms_6);
  end
  assign _zz_constantsRoms_6_port0 = constantsRoms_6[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_7.bin",constantsRoms_7);
  end
  assign _zz_constantsRoms_7_port0 = constantsRoms_7[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_8.bin",constantsRoms_8);
  end
  assign _zz_constantsRoms_8_port0 = constantsRoms_8[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      4'b0000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      4'b0001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      4'b0010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      4'b0011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      4'b0100 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
      4'b0101 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_5_port0;
      end
      4'b0110 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_6_port0;
      end
      4'b0111 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_7_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_8_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_5 (
  output     [254:0]  io_readPorts_0_data,
  input      [2:0]    io_readPorts_0_tIndex,
  input      [5:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:63];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      3'b000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      3'b001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      3'b010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      3'b011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_4 (
  output     [254:0]  io_readPorts_0_data,
  input      [1:0]    io_readPorts_0_tIndex,
  input      [5:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:62];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      2'b00 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      2'b01 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module StreamDemux_45 (
  input      [0:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [6:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_elements_0,
  output     [254:0]  io_outputs_0_payload_state_elements_1,
  output     [254:0]  io_outputs_0_payload_state_elements_2,
  output     [254:0]  io_outputs_0_payload_state_elements_3,
  output     [254:0]  io_outputs_0_payload_state_elements_4,
  output     [254:0]  io_outputs_0_payload_state_elements_5,
  output     [254:0]  io_outputs_0_payload_state_elements_6,
  output     [254:0]  io_outputs_0_payload_state_elements_7,
  output     [254:0]  io_outputs_0_payload_state_elements_8,
  output     [254:0]  io_outputs_0_payload_state_elements_9,
  output     [254:0]  io_outputs_0_payload_state_elements_10,
  output     [254:0]  io_outputs_0_payload_state_elements_11,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [6:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_elements_0,
  output     [254:0]  io_outputs_1_payload_state_elements_1,
  output     [254:0]  io_outputs_1_payload_state_elements_2,
  output     [254:0]  io_outputs_1_payload_state_elements_3,
  output     [254:0]  io_outputs_1_payload_state_elements_4,
  output     [254:0]  io_outputs_1_payload_state_elements_5,
  output     [254:0]  io_outputs_1_payload_state_elements_6,
  output     [254:0]  io_outputs_1_payload_state_elements_7,
  output     [254:0]  io_outputs_1_payload_state_elements_8,
  output     [254:0]  io_outputs_1_payload_state_elements_9,
  output     [254:0]  io_outputs_1_payload_state_elements_10,
  output     [254:0]  io_outputs_1_payload_state_elements_11
);
  wire                when_Stream_l745;
  wire                when_Stream_l745_1;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l745) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l745_1) begin
      io_input_ready = io_outputs_1_ready;
    end
  end

  assign io_outputs_0_payload_round_index = io_input_payload_round_index;
  assign io_outputs_0_payload_state_size = io_input_payload_state_size;
  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_0_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_0_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_0_payload_state_elements_3 = io_input_payload_state_elements_3;
  assign io_outputs_0_payload_state_elements_4 = io_input_payload_state_elements_4;
  assign io_outputs_0_payload_state_elements_5 = io_input_payload_state_elements_5;
  assign io_outputs_0_payload_state_elements_6 = io_input_payload_state_elements_6;
  assign io_outputs_0_payload_state_elements_7 = io_input_payload_state_elements_7;
  assign io_outputs_0_payload_state_elements_8 = io_input_payload_state_elements_8;
  assign io_outputs_0_payload_state_elements_9 = io_input_payload_state_elements_9;
  assign io_outputs_0_payload_state_elements_10 = io_input_payload_state_elements_10;
  assign io_outputs_0_payload_state_elements_11 = io_input_payload_state_elements_11;
  assign when_Stream_l745 = (1'b0 != io_select);
  always @(*) begin
    if(when_Stream_l745) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_round_index = io_input_payload_round_index;
  assign io_outputs_1_payload_state_size = io_input_payload_state_size;
  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_elements_0 = io_input_payload_state_elements_0;
  assign io_outputs_1_payload_state_elements_1 = io_input_payload_state_elements_1;
  assign io_outputs_1_payload_state_elements_2 = io_input_payload_state_elements_2;
  assign io_outputs_1_payload_state_elements_3 = io_input_payload_state_elements_3;
  assign io_outputs_1_payload_state_elements_4 = io_input_payload_state_elements_4;
  assign io_outputs_1_payload_state_elements_5 = io_input_payload_state_elements_5;
  assign io_outputs_1_payload_state_elements_6 = io_input_payload_state_elements_6;
  assign io_outputs_1_payload_state_elements_7 = io_input_payload_state_elements_7;
  assign io_outputs_1_payload_state_elements_8 = io_input_payload_state_elements_8;
  assign io_outputs_1_payload_state_elements_9 = io_input_payload_state_elements_9;
  assign io_outputs_1_payload_state_elements_10 = io_input_payload_state_elements_10;
  assign io_outputs_1_payload_state_elements_11 = io_input_payload_state_elements_11;
  assign when_Stream_l745_1 = (1'b1 != io_select);
  always @(*) begin
    if(when_Stream_l745_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end


endmodule

module MDSMatrixAdders (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_elements_0,
  input      [254:0]  io_input_payload_state_elements_1,
  input      [254:0]  io_input_payload_state_elements_2,
  input      [254:0]  io_input_payload_state_elements_3,
  input      [254:0]  io_input_payload_state_elements_4,
  input      [254:0]  io_input_payload_state_elements_5,
  input      [254:0]  io_input_payload_state_elements_6,
  input      [254:0]  io_input_payload_state_elements_7,
  input      [254:0]  io_input_payload_state_elements_8,
  input      [254:0]  io_input_payload_state_elements_9,
  input      [254:0]  io_input_payload_state_elements_10,
  input      [254:0]  io_input_payload_state_elements_11,
  output reg          io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [254:0]  modAdder_1_res_o;
  wire       [254:0]  modAdder_2_res_o;
  wire       [254:0]  modAdder_3_res_o;
  wire       [254:0]  modAdder_4_res_o;
  wire       [254:0]  modAdder_5_res_o;
  wire       [254:0]  modAdder_6_res_o;
  wire       [254:0]  modAdder_7_res_o;
  wire       [254:0]  modAdder_8_res_o;
  wire       [254:0]  modAdder_9_res_o;
  wire       [254:0]  modAdder_10_res_o;
  wire       [254:0]  modAdder_11_res_o;
  wire       [254:0]  modAdder_12_res_o;
  wire       [3:0]    _zz_countNum;
  wire       [3:0]    _zz_when_MDSMatrixAdders_l81;
  reg        [6:0]    tempRes_round_index;
  reg        [3:0]    tempRes_state_size;
  reg        [6:0]    tempRes_state_id;
  reg        [254:0]  tempRes_state_elements_0;
  reg        [254:0]  tempRes_state_elements_1;
  reg        [254:0]  tempRes_state_elements_2;
  reg        [254:0]  tempRes_state_elements_3;
  reg        [254:0]  tempRes_state_elements_4;
  reg        [254:0]  tempRes_state_elements_5;
  reg        [254:0]  tempRes_state_elements_6;
  reg        [254:0]  tempRes_state_elements_7;
  reg        [254:0]  tempRes_state_elements_8;
  reg        [254:0]  tempRes_state_elements_9;
  reg        [254:0]  tempRes_state_elements_10;
  reg        [254:0]  tempRes_state_elements_11;
  wire       [254:0]  modAdderRes_0;
  wire       [254:0]  modAdderRes_1;
  wire       [254:0]  modAdderRes_2;
  wire       [254:0]  modAdderRes_3;
  wire       [254:0]  modAdderRes_4;
  wire       [254:0]  modAdderRes_5;
  wire       [254:0]  modAdderRes_6;
  wire       [254:0]  modAdderRes_7;
  wire       [254:0]  modAdderRes_8;
  wire       [254:0]  modAdderRes_9;
  wire       [254:0]  modAdderRes_10;
  wire       [254:0]  modAdderRes_11;
  wire       [3:0]    countNum;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateNext;
  wire                io_input_fire;
  wire                io_input_fire_1;
  wire                when_MDSMatrixAdders_l81;
  wire                io_output_fire;
  wire                io_input_fire_2;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_countNum = (tempRes_state_size + 4'b0001);
  assign _zz_when_MDSMatrixAdders_l81 = (fsm_counter + 4'b0001);
  ModAdder modAdder_1 (
    .op1_i    (tempRes_state_elements_0           ), //i
    .op2_i    (io_input_payload_state_elements_0  ), //i
    .res_o    (modAdder_1_res_o                   )  //o
  );
  ModAdder modAdder_2 (
    .op1_i    (tempRes_state_elements_1           ), //i
    .op2_i    (io_input_payload_state_elements_1  ), //i
    .res_o    (modAdder_2_res_o                   )  //o
  );
  ModAdder modAdder_3 (
    .op1_i    (tempRes_state_elements_2           ), //i
    .op2_i    (io_input_payload_state_elements_2  ), //i
    .res_o    (modAdder_3_res_o                   )  //o
  );
  ModAdder modAdder_4 (
    .op1_i    (tempRes_state_elements_3           ), //i
    .op2_i    (io_input_payload_state_elements_3  ), //i
    .res_o    (modAdder_4_res_o                   )  //o
  );
  ModAdder modAdder_5 (
    .op1_i    (tempRes_state_elements_4           ), //i
    .op2_i    (io_input_payload_state_elements_4  ), //i
    .res_o    (modAdder_5_res_o                   )  //o
  );
  ModAdder modAdder_6 (
    .op1_i    (tempRes_state_elements_5           ), //i
    .op2_i    (io_input_payload_state_elements_5  ), //i
    .res_o    (modAdder_6_res_o                   )  //o
  );
  ModAdder modAdder_7 (
    .op1_i    (tempRes_state_elements_6           ), //i
    .op2_i    (io_input_payload_state_elements_6  ), //i
    .res_o    (modAdder_7_res_o                   )  //o
  );
  ModAdder modAdder_8 (
    .op1_i    (tempRes_state_elements_7           ), //i
    .op2_i    (io_input_payload_state_elements_7  ), //i
    .res_o    (modAdder_8_res_o                   )  //o
  );
  ModAdder modAdder_9 (
    .op1_i    (tempRes_state_elements_8           ), //i
    .op2_i    (io_input_payload_state_elements_8  ), //i
    .res_o    (modAdder_9_res_o                   )  //o
  );
  ModAdder modAdder_10 (
    .op1_i    (tempRes_state_elements_9           ), //i
    .op2_i    (io_input_payload_state_elements_9  ), //i
    .res_o    (modAdder_10_res_o                  )  //o
  );
  ModAdder modAdder_11 (
    .op1_i    (tempRes_state_elements_10           ), //i
    .op2_i    (io_input_payload_state_elements_10  ), //i
    .res_o    (modAdder_11_res_o                   )  //o
  );
  ModAdder modAdder_12 (
    .op1_i    (tempRes_state_elements_11           ), //i
    .op2_i    (io_input_payload_state_elements_11  ), //i
    .res_o    (modAdder_12_res_o                   )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : fsm_stateReg_string = "fsm_ADDING";
      `fsm_enumDefinition_1_binary_sequential_fsm_DONE : fsm_stateReg_string = "fsm_DONE  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : fsm_stateNext_string = "fsm_ADDING";
      `fsm_enumDefinition_1_binary_sequential_fsm_DONE : fsm_stateNext_string = "fsm_DONE  ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign modAdderRes_0 = modAdder_1_res_o;
  assign modAdderRes_1 = modAdder_2_res_o;
  assign modAdderRes_2 = modAdder_3_res_o;
  assign modAdderRes_3 = modAdder_4_res_o;
  assign modAdderRes_4 = modAdder_5_res_o;
  assign modAdderRes_5 = modAdder_6_res_o;
  assign modAdderRes_6 = modAdder_7_res_o;
  assign modAdderRes_7 = modAdder_8_res_o;
  assign modAdderRes_8 = modAdder_9_res_o;
  assign modAdderRes_9 = modAdder_10_res_o;
  assign modAdderRes_10 = modAdder_11_res_o;
  assign modAdderRes_11 = modAdder_12_res_o;
  assign countNum = ((tempRes_state_size == 4'b0101) ? _zz_countNum : tempRes_state_size);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_DONE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign io_output_payload_round_index = tempRes_round_index;
  assign io_output_payload_state_size = tempRes_state_size;
  assign io_output_payload_state_id = tempRes_state_id;
  assign io_output_payload_state_elements_0 = tempRes_state_elements_0;
  assign io_output_payload_state_elements_1 = tempRes_state_elements_1;
  assign io_output_payload_state_elements_2 = tempRes_state_elements_2;
  assign io_output_payload_state_elements_3 = tempRes_state_elements_3;
  assign io_output_payload_state_elements_4 = tempRes_state_elements_4;
  assign io_output_payload_state_elements_5 = tempRes_state_elements_5;
  assign io_output_payload_state_elements_6 = tempRes_state_elements_6;
  assign io_output_payload_state_elements_7 = tempRes_state_elements_7;
  assign io_output_payload_state_elements_8 = tempRes_state_elements_8;
  assign io_output_payload_state_elements_9 = tempRes_state_elements_9;
  assign io_output_payload_state_elements_10 = tempRes_state_elements_10;
  assign io_output_payload_state_elements_11 = tempRes_state_elements_11;
  always @(*) begin
    io_output_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_DONE : begin
        io_output_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_input_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          io_input_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
        if(io_input_fire) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_ADDING;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : begin
        if(io_input_fire_1) begin
          if(when_MDSMatrixAdders_l81) begin
            fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_DONE;
          end
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          if(io_input_fire_2) begin
            fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_ADDING;
          end else begin
            fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end
  end

  assign io_input_fire = (io_input_valid && io_input_ready);
  assign io_input_fire_1 = (io_input_valid && io_input_ready);
  assign when_MDSMatrixAdders_l81 = (_zz_when_MDSMatrixAdders_l81 == countNum);
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire_2 = (io_input_valid && io_input_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_ADDING) && (! (fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_ADDING)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      tempRes_state_size <= 4'b0000;
      tempRes_state_elements_0 <= 255'h0;
      tempRes_state_elements_1 <= 255'h0;
      tempRes_state_elements_2 <= 255'h0;
      tempRes_state_elements_3 <= 255'h0;
      tempRes_state_elements_4 <= 255'h0;
      tempRes_state_elements_5 <= 255'h0;
      tempRes_state_elements_6 <= 255'h0;
      tempRes_state_elements_7 <= 255'h0;
      tempRes_state_elements_8 <= 255'h0;
      tempRes_state_elements_9 <= 255'h0;
      tempRes_state_elements_10 <= 255'h0;
      tempRes_state_elements_11 <= 255'h0;
      tempRes_state_id <= 7'h0;
      tempRes_round_index <= 7'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
          if(io_input_fire) begin
            tempRes_round_index <= io_input_payload_round_index;
            tempRes_state_size <= io_input_payload_state_size;
            tempRes_state_id <= io_input_payload_state_id;
            tempRes_state_elements_0 <= io_input_payload_state_elements_0;
            tempRes_state_elements_1 <= io_input_payload_state_elements_1;
            tempRes_state_elements_2 <= io_input_payload_state_elements_2;
            tempRes_state_elements_3 <= io_input_payload_state_elements_3;
            tempRes_state_elements_4 <= io_input_payload_state_elements_4;
            tempRes_state_elements_5 <= io_input_payload_state_elements_5;
            tempRes_state_elements_6 <= io_input_payload_state_elements_6;
            tempRes_state_elements_7 <= io_input_payload_state_elements_7;
            tempRes_state_elements_8 <= io_input_payload_state_elements_8;
            tempRes_state_elements_9 <= io_input_payload_state_elements_9;
            tempRes_state_elements_10 <= io_input_payload_state_elements_10;
            tempRes_state_elements_11 <= io_input_payload_state_elements_11;
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_1_binary_sequential_fsm_ADDING : begin
          if(io_input_fire_1) begin
            tempRes_state_elements_0 <= modAdderRes_0;
            tempRes_state_elements_1 <= modAdderRes_1;
            tempRes_state_elements_2 <= modAdderRes_2;
            tempRes_state_elements_3 <= modAdderRes_3;
            tempRes_state_elements_4 <= modAdderRes_4;
            tempRes_state_elements_5 <= modAdderRes_5;
            tempRes_state_elements_6 <= modAdderRes_6;
            tempRes_state_elements_7 <= modAdderRes_7;
            tempRes_state_elements_8 <= modAdderRes_8;
            tempRes_state_elements_9 <= modAdderRes_9;
            tempRes_state_elements_10 <= modAdderRes_10;
            tempRes_state_elements_11 <= modAdderRes_11;
            if(!when_MDSMatrixAdders_l81) begin
              fsm_counter <= (fsm_counter + 4'b0001);
            end
          end
        end
        `fsm_enumDefinition_1_binary_sequential_fsm_DONE : begin
          if(io_output_fire) begin
            if(io_input_fire_2) begin
              tempRes_round_index <= io_input_payload_round_index;
              tempRes_state_size <= io_input_payload_state_size;
              tempRes_state_id <= io_input_payload_state_id;
              tempRes_state_elements_0 <= io_input_payload_state_elements_0;
              tempRes_state_elements_1 <= io_input_payload_state_elements_1;
              tempRes_state_elements_2 <= io_input_payload_state_elements_2;
              tempRes_state_elements_3 <= io_input_payload_state_elements_3;
              tempRes_state_elements_4 <= io_input_payload_state_elements_4;
              tempRes_state_elements_5 <= io_input_payload_state_elements_5;
              tempRes_state_elements_6 <= io_input_payload_state_elements_6;
              tempRes_state_elements_7 <= io_input_payload_state_elements_7;
              tempRes_state_elements_8 <= io_input_payload_state_elements_8;
              tempRes_state_elements_9 <= io_input_payload_state_elements_9;
              tempRes_state_elements_10 <= io_input_payload_state_elements_10;
              tempRes_state_elements_11 <= io_input_payload_state_elements_11;
              fsm_counter <= (fsm_counter + 4'b0001);
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        fsm_counter <= 4'b0000;
      end
    end
  end


endmodule

module MDSMatrixMultiplier (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [6:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_elements_0,
  output     [254:0]  io_output_payload_state_elements_1,
  output     [254:0]  io_output_payload_state_elements_2,
  output     [254:0]  io_output_payload_state_elements_3,
  output     [254:0]  io_output_payload_state_elements_4,
  output     [254:0]  io_output_payload_state_elements_5,
  output     [254:0]  io_output_payload_state_elements_6,
  output     [254:0]  io_output_payload_state_elements_7,
  output     [254:0]  io_output_payload_state_elements_8,
  output     [254:0]  io_output_payload_state_elements_9,
  output     [254:0]  io_output_payload_state_elements_10,
  output     [254:0]  io_output_payload_state_elements_11,
  input               clk,
  input               reset
);
  wire       [1:0]    mDSMatrix_12_io_addressPort;
  wire       [2:0]    mDSMatrix_13_io_addressPort;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_12_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_13_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_5;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_6;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_7;
  wire       [254:0]  mDSMatrix_14_io_dataPorts_8;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_0;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_1;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_2;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_3;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_4;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_5;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_6;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_7;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_8;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_9;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_10;
  wire       [254:0]  mDSMatrix_15_io_dataPorts_11;
  wire                io_input_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_valid;
  wire       [6:0]    io_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  io_input_fork_io_outputs_0_payload_state_element;
  wire                io_input_fork_io_outputs_1_valid;
  wire       [6:0]    io_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  io_input_fork_io_outputs_1_payload_state_element;
  wire                io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload;
  wire                montMultiplierPipedSim_45_io_input_ready;
  wire                montMultiplierPipedSim_45_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_45_io_output_payload_res;
  wire                montMultiplierPipedSim_46_io_input_ready;
  wire                montMultiplierPipedSim_46_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_46_io_output_payload_res;
  wire                montMultiplierPipedSim_47_io_input_ready;
  wire                montMultiplierPipedSim_47_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_47_io_output_payload_res;
  wire                montMultiplierPipedSim_48_io_input_ready;
  wire                montMultiplierPipedSim_48_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_48_io_output_payload_res;
  wire                montMultiplierPipedSim_49_io_input_ready;
  wire                montMultiplierPipedSim_49_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_49_io_output_payload_res;
  wire                montMultiplierPipedSim_50_io_input_ready;
  wire                montMultiplierPipedSim_50_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_50_io_output_payload_res;
  wire                montMultiplierPipedSim_51_io_input_ready;
  wire                montMultiplierPipedSim_51_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_51_io_output_payload_res;
  wire                montMultiplierPipedSim_52_io_input_ready;
  wire                montMultiplierPipedSim_52_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_52_io_output_payload_res;
  wire                montMultiplierPipedSim_53_io_input_ready;
  wire                montMultiplierPipedSim_53_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_53_io_output_payload_res;
  wire                montMultiplierPipedSim_54_io_input_ready;
  wire                montMultiplierPipedSim_54_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_54_io_output_payload_res;
  wire                montMultiplierPipedSim_55_io_input_ready;
  wire                montMultiplierPipedSim_55_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_55_io_output_payload_res;
  wire                montMultiplierPipedSim_56_io_input_ready;
  wire                montMultiplierPipedSim_56_io_output_valid;
  wire       [254:0]  montMultiplierPipedSim_56_io_output_payload_res;
  wire                io_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                io_input_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_fifo_io_availability;
  wire       [254:0]  _zz__zz_mulOp2s_0_4;
  wire       [254:0]  _zz__zz_mulOp2s_0_4_1;
  wire       [254:0]  _zz__zz_io_output_payload_state_elements_0;
  wire       [254:0]  _zz__zz_io_output_payload_state_elements_0_1;
  reg        [254:0]  mulOp2s_0;
  reg        [254:0]  mulOp2s_1;
  reg        [254:0]  mulOp2s_2;
  reg        [254:0]  mulOp2s_3;
  reg        [254:0]  mulOp2s_4;
  reg        [254:0]  mulOp2s_5;
  reg        [254:0]  mulOp2s_6;
  reg        [254:0]  mulOp2s_7;
  reg        [254:0]  mulOp2s_8;
  reg        [254:0]  mulOp2s_9;
  reg        [254:0]  mulOp2s_10;
  reg        [254:0]  mulOp2s_11;
  wire       [3059:0] _zz_mulOp2s_0;
  wire                when_MDSMatrixMultiplier_l50;
  wire       [3059:0] _zz_mulOp2s_0_1;
  wire       [3059:0] _zz_mulOp2s_0_2;
  wire       [3059:0] _zz_mulOp2s_0_3;
  wire       [3059:0] _zz_mulOp2s_0_4;
  wire       [3059:0] _zz_mulOp2s_0_5;
  wire                io_input_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_ready;
  wire       [254:0]  io_input_fork_io_outputs_0_translated_payload;
  wire                mulInputs_0_valid;
  wire                mulInputs_0_ready;
  wire       [254:0]  mulInputs_0_payload_op1;
  wire       [254:0]  mulInputs_0_payload_op2;
  wire                mulInputs_1_valid;
  wire                mulInputs_1_ready;
  wire       [254:0]  mulInputs_1_payload_op1;
  wire       [254:0]  mulInputs_1_payload_op2;
  wire                mulInputs_2_valid;
  wire                mulInputs_2_ready;
  wire       [254:0]  mulInputs_2_payload_op1;
  wire       [254:0]  mulInputs_2_payload_op2;
  wire                mulInputs_3_valid;
  wire                mulInputs_3_ready;
  wire       [254:0]  mulInputs_3_payload_op1;
  wire       [254:0]  mulInputs_3_payload_op2;
  wire                mulInputs_4_valid;
  wire                mulInputs_4_ready;
  wire       [254:0]  mulInputs_4_payload_op1;
  wire       [254:0]  mulInputs_4_payload_op2;
  wire                mulInputs_5_valid;
  wire                mulInputs_5_ready;
  wire       [254:0]  mulInputs_5_payload_op1;
  wire       [254:0]  mulInputs_5_payload_op2;
  wire                mulInputs_6_valid;
  wire                mulInputs_6_ready;
  wire       [254:0]  mulInputs_6_payload_op1;
  wire       [254:0]  mulInputs_6_payload_op2;
  wire                mulInputs_7_valid;
  wire                mulInputs_7_ready;
  wire       [254:0]  mulInputs_7_payload_op1;
  wire       [254:0]  mulInputs_7_payload_op2;
  wire                mulInputs_8_valid;
  wire                mulInputs_8_ready;
  wire       [254:0]  mulInputs_8_payload_op1;
  wire       [254:0]  mulInputs_8_payload_op2;
  wire                mulInputs_9_valid;
  wire                mulInputs_9_ready;
  wire       [254:0]  mulInputs_9_payload_op1;
  wire       [254:0]  mulInputs_9_payload_op2;
  wire                mulInputs_10_valid;
  wire                mulInputs_10_ready;
  wire       [254:0]  mulInputs_10_payload_op1;
  wire       [254:0]  mulInputs_10_payload_op2;
  wire                mulInputs_11_valid;
  wire                mulInputs_11_ready;
  wire       [254:0]  mulInputs_11_payload_op1;
  wire       [254:0]  mulInputs_11_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_ready;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_payload_round_index;
  wire       [3:0]    io_input_fork_io_outputs_1_translated_payload_state_size;
  wire       [6:0]    io_input_fork_io_outputs_1_translated_payload_state_id;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire                _zz_io_output_valid;
  wire                _zz_mulResJoined_ready;
  wire       [3059:0] _zz_io_output_payload_state_elements_0;
  reg                 _zz_mulResJoined_ready_1;
  wire                _zz_io_output_valid_1;
  reg                 _zz_io_output_valid_2;
  reg        [6:0]    _zz_io_output_payload_round_index;
  reg        [3:0]    _zz_io_output_payload_state_size;
  reg        [6:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_elements_0_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_2;
  reg        [254:0]  _zz_io_output_payload_state_elements_3;
  reg        [254:0]  _zz_io_output_payload_state_elements_4;
  reg        [254:0]  _zz_io_output_payload_state_elements_5;
  reg        [254:0]  _zz_io_output_payload_state_elements_6;
  reg        [254:0]  _zz_io_output_payload_state_elements_7;
  reg        [254:0]  _zz_io_output_payload_state_elements_8;
  reg        [254:0]  _zz_io_output_payload_state_elements_9;
  reg        [254:0]  _zz_io_output_payload_state_elements_10;
  reg        [254:0]  _zz_io_output_payload_state_elements_11;
  wire                when_Stream_l342;

  assign _zz__zz_mulOp2s_0_4 = mDSMatrix_15_io_dataPorts_1;
  assign _zz__zz_mulOp2s_0_4_1 = mDSMatrix_15_io_dataPorts_0;
  assign _zz__zz_io_output_payload_state_elements_0 = montMultiplierPipedSim_46_io_output_payload_res;
  assign _zz__zz_io_output_payload_state_elements_0_1 = montMultiplierPipedSim_45_io_output_payload_res;
  MDSMatrix mDSMatrix_12 (
    .io_dataPorts_0    (mDSMatrix_12_io_dataPorts_0  ), //o
    .io_dataPorts_1    (mDSMatrix_12_io_dataPorts_1  ), //o
    .io_dataPorts_2    (mDSMatrix_12_io_dataPorts_2  ), //o
    .io_addressPort    (mDSMatrix_12_io_addressPort  )  //i
  );
  MDSMatrix_1 mDSMatrix_13 (
    .io_dataPorts_0    (mDSMatrix_13_io_dataPorts_0  ), //o
    .io_dataPorts_1    (mDSMatrix_13_io_dataPorts_1  ), //o
    .io_dataPorts_2    (mDSMatrix_13_io_dataPorts_2  ), //o
    .io_dataPorts_3    (mDSMatrix_13_io_dataPorts_3  ), //o
    .io_dataPorts_4    (mDSMatrix_13_io_dataPorts_4  ), //o
    .io_addressPort    (mDSMatrix_13_io_addressPort  )  //i
  );
  MDSMatrix_2 mDSMatrix_14 (
    .io_dataPorts_0    (mDSMatrix_14_io_dataPorts_0   ), //o
    .io_dataPorts_1    (mDSMatrix_14_io_dataPorts_1   ), //o
    .io_dataPorts_2    (mDSMatrix_14_io_dataPorts_2   ), //o
    .io_dataPorts_3    (mDSMatrix_14_io_dataPorts_3   ), //o
    .io_dataPorts_4    (mDSMatrix_14_io_dataPorts_4   ), //o
    .io_dataPorts_5    (mDSMatrix_14_io_dataPorts_5   ), //o
    .io_dataPorts_6    (mDSMatrix_14_io_dataPorts_6   ), //o
    .io_dataPorts_7    (mDSMatrix_14_io_dataPorts_7   ), //o
    .io_dataPorts_8    (mDSMatrix_14_io_dataPorts_8   ), //o
    .io_addressPort    (io_input_payload_state_index  )  //i
  );
  MDSMatrix_3 mDSMatrix_15 (
    .io_dataPorts_0     (mDSMatrix_15_io_dataPorts_0   ), //o
    .io_dataPorts_1     (mDSMatrix_15_io_dataPorts_1   ), //o
    .io_dataPorts_2     (mDSMatrix_15_io_dataPorts_2   ), //o
    .io_dataPorts_3     (mDSMatrix_15_io_dataPorts_3   ), //o
    .io_dataPorts_4     (mDSMatrix_15_io_dataPorts_4   ), //o
    .io_dataPorts_5     (mDSMatrix_15_io_dataPorts_5   ), //o
    .io_dataPorts_6     (mDSMatrix_15_io_dataPorts_6   ), //o
    .io_dataPorts_7     (mDSMatrix_15_io_dataPorts_7   ), //o
    .io_dataPorts_8     (mDSMatrix_15_io_dataPorts_8   ), //o
    .io_dataPorts_9     (mDSMatrix_15_io_dataPorts_9   ), //o
    .io_dataPorts_10    (mDSMatrix_15_io_dataPorts_10  ), //o
    .io_dataPorts_11    (mDSMatrix_15_io_dataPorts_11  ), //o
    .io_addressPort     (io_input_payload_state_index  )  //i
  );
  StreamFork io_input_fork (
    .io_input_valid                        (io_input_valid                                    ), //i
    .io_input_ready                        (io_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (io_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (io_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (io_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (io_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (io_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (io_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (io_input_fork_io_outputs_0_translated_ready       ), //i
    .io_outputs_0_payload_round_index      (io_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (io_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (io_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (io_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (io_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (io_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (io_input_fork_io_outputs_1_translated_ready       ), //i
    .io_outputs_1_payload_round_index      (io_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (io_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (io_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (io_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (io_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  StreamFork_1 io_input_fork_io_outputs_0_translated_fork (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_valid                       ), //i
    .io_input_ready           (io_input_fork_io_outputs_0_translated_fork_io_input_ready         ), //o
    .io_input_payload         (io_input_fork_io_outputs_0_translated_payload                     ), //i
    .io_outputs_0_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid     ), //o
    .io_outputs_0_ready       (mulInputs_0_ready                                                 ), //i
    .io_outputs_0_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload   ), //o
    .io_outputs_1_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid     ), //o
    .io_outputs_1_ready       (mulInputs_1_ready                                                 ), //i
    .io_outputs_1_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload   ), //o
    .io_outputs_2_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid     ), //o
    .io_outputs_2_ready       (mulInputs_2_ready                                                 ), //i
    .io_outputs_2_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload   ), //o
    .io_outputs_3_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid     ), //o
    .io_outputs_3_ready       (mulInputs_3_ready                                                 ), //i
    .io_outputs_3_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload   ), //o
    .io_outputs_4_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid     ), //o
    .io_outputs_4_ready       (mulInputs_4_ready                                                 ), //i
    .io_outputs_4_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload   ), //o
    .io_outputs_5_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid     ), //o
    .io_outputs_5_ready       (mulInputs_5_ready                                                 ), //i
    .io_outputs_5_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload   ), //o
    .io_outputs_6_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid     ), //o
    .io_outputs_6_ready       (mulInputs_6_ready                                                 ), //i
    .io_outputs_6_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload   ), //o
    .io_outputs_7_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid     ), //o
    .io_outputs_7_ready       (mulInputs_7_ready                                                 ), //i
    .io_outputs_7_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload   ), //o
    .io_outputs_8_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid     ), //o
    .io_outputs_8_ready       (mulInputs_8_ready                                                 ), //i
    .io_outputs_8_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload   ), //o
    .io_outputs_9_valid       (io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid     ), //o
    .io_outputs_9_ready       (mulInputs_9_ready                                                 ), //i
    .io_outputs_9_payload     (io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload   ), //o
    .io_outputs_10_valid      (io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid    ), //o
    .io_outputs_10_ready      (mulInputs_10_ready                                                ), //i
    .io_outputs_10_payload    (io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload  ), //o
    .io_outputs_11_valid      (io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid    ), //o
    .io_outputs_11_ready      (mulInputs_11_ready                                                ), //i
    .io_outputs_11_payload    (io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload  )  //o
  );
  MontMultiplierPipedSim montMultiplierPipedSim_45 (
    .io_input_valid           (mulInputs_0_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_45_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_0_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_0_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_45_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_45_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_46 (
    .io_input_valid           (mulInputs_1_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_46_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_1_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_1_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_46_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_46_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_47 (
    .io_input_valid           (mulInputs_2_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_47_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_2_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_2_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_47_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_47_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_48 (
    .io_input_valid           (mulInputs_3_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_48_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_3_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_3_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_48_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_48_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_49 (
    .io_input_valid           (mulInputs_4_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_49_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_4_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_4_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_49_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_49_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_50 (
    .io_input_valid           (mulInputs_5_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_50_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_5_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_5_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_50_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_50_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_51 (
    .io_input_valid           (mulInputs_6_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_51_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_6_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_6_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_51_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_51_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_52 (
    .io_input_valid           (mulInputs_7_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_52_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_7_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_7_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_52_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_52_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_53 (
    .io_input_valid           (mulInputs_8_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_53_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_8_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_8_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_53_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_53_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_54 (
    .io_input_valid           (mulInputs_9_valid                                ), //i
    .io_input_ready           (montMultiplierPipedSim_54_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_9_payload_op1                          ), //i
    .io_input_payload_op2     (mulInputs_9_payload_op2                          ), //i
    .io_output_valid          (montMultiplierPipedSim_54_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_54_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_55 (
    .io_input_valid           (mulInputs_10_valid                               ), //i
    .io_input_ready           (montMultiplierPipedSim_55_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_10_payload_op1                         ), //i
    .io_input_payload_op2     (mulInputs_10_payload_op2                         ), //i
    .io_output_valid          (montMultiplierPipedSim_55_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_55_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  MontMultiplierPipedSim montMultiplierPipedSim_56 (
    .io_input_valid           (mulInputs_11_valid                               ), //i
    .io_input_ready           (montMultiplierPipedSim_56_io_input_ready         ), //o
    .io_input_payload_op1     (mulInputs_11_payload_op1                         ), //i
    .io_input_payload_op2     (mulInputs_11_payload_op2                         ), //i
    .io_output_valid          (montMultiplierPipedSim_56_io_output_valid        ), //o
    .io_output_ready          (mulResJoined_fire                                ), //i
    .io_output_payload_res    (montMultiplierPipedSim_56_io_output_payload_res  ), //o
    .clk                      (clk                                              ), //i
    .reset                    (reset                                            )  //i
  );
  StreamFifo io_input_fork_io_outputs_1_translated_fifo (
    .io_push_valid                  (io_input_fork_io_outputs_1_translated_valid                            ), //i
    .io_push_ready                  (io_input_fork_io_outputs_1_translated_fifo_io_push_ready               ), //o
    .io_push_payload_round_index    (io_input_fork_io_outputs_1_translated_payload_round_index              ), //i
    .io_push_payload_state_size     (io_input_fork_io_outputs_1_translated_payload_state_size               ), //i
    .io_push_payload_state_id       (io_input_fork_io_outputs_1_translated_payload_state_id                 ), //i
    .io_pop_valid                   (io_input_fork_io_outputs_1_translated_fifo_io_pop_valid                ), //o
    .io_pop_ready                   (_zz_mulResJoined_ready                                                 ), //i
    .io_pop_payload_round_index     (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index  ), //o
    .io_pop_payload_state_size      (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size   ), //o
    .io_pop_payload_state_id        (io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id     ), //o
    .io_flush                       (1'b0                                                                   ), //i
    .io_occupancy                   (io_input_fork_io_outputs_1_translated_fifo_io_occupancy                ), //o
    .io_availability                (io_input_fork_io_outputs_1_translated_fifo_io_availability             ), //o
    .clk                            (clk                                                                    ), //i
    .reset                          (reset                                                                  )  //i
  );
  assign mDSMatrix_12_io_addressPort = io_input_payload_state_index[1:0];
  assign mDSMatrix_13_io_addressPort = io_input_payload_state_index[2:0];
  assign _zz_mulOp2s_0 = {2295'h0,{mDSMatrix_12_io_dataPorts_2,{mDSMatrix_12_io_dataPorts_1,mDSMatrix_12_io_dataPorts_0}}};
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_0 = _zz_mulOp2s_0[254 : 0];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_0 = _zz_mulOp2s_0_1[254 : 0];
        end else begin
          mulOp2s_0 = _zz_mulOp2s_0_2[254 : 0];
        end
      end
      4'b1001 : begin
        mulOp2s_0 = _zz_mulOp2s_0_3[254 : 0];
      end
      4'b1100 : begin
        mulOp2s_0 = _zz_mulOp2s_0_4[254 : 0];
      end
      default : begin
        mulOp2s_0 = _zz_mulOp2s_0_5[254 : 0];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_1 = _zz_mulOp2s_0[509 : 255];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_1 = _zz_mulOp2s_0_1[509 : 255];
        end else begin
          mulOp2s_1 = _zz_mulOp2s_0_2[509 : 255];
        end
      end
      4'b1001 : begin
        mulOp2s_1 = _zz_mulOp2s_0_3[509 : 255];
      end
      4'b1100 : begin
        mulOp2s_1 = _zz_mulOp2s_0_4[509 : 255];
      end
      default : begin
        mulOp2s_1 = _zz_mulOp2s_0_5[509 : 255];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_2 = _zz_mulOp2s_0[764 : 510];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_2 = _zz_mulOp2s_0_1[764 : 510];
        end else begin
          mulOp2s_2 = _zz_mulOp2s_0_2[764 : 510];
        end
      end
      4'b1001 : begin
        mulOp2s_2 = _zz_mulOp2s_0_3[764 : 510];
      end
      4'b1100 : begin
        mulOp2s_2 = _zz_mulOp2s_0_4[764 : 510];
      end
      default : begin
        mulOp2s_2 = _zz_mulOp2s_0_5[764 : 510];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_3 = _zz_mulOp2s_0[1019 : 765];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_3 = _zz_mulOp2s_0_1[1019 : 765];
        end else begin
          mulOp2s_3 = _zz_mulOp2s_0_2[1019 : 765];
        end
      end
      4'b1001 : begin
        mulOp2s_3 = _zz_mulOp2s_0_3[1019 : 765];
      end
      4'b1100 : begin
        mulOp2s_3 = _zz_mulOp2s_0_4[1019 : 765];
      end
      default : begin
        mulOp2s_3 = _zz_mulOp2s_0_5[1019 : 765];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_4 = _zz_mulOp2s_0[1274 : 1020];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_4 = _zz_mulOp2s_0_1[1274 : 1020];
        end else begin
          mulOp2s_4 = _zz_mulOp2s_0_2[1274 : 1020];
        end
      end
      4'b1001 : begin
        mulOp2s_4 = _zz_mulOp2s_0_3[1274 : 1020];
      end
      4'b1100 : begin
        mulOp2s_4 = _zz_mulOp2s_0_4[1274 : 1020];
      end
      default : begin
        mulOp2s_4 = _zz_mulOp2s_0_5[1274 : 1020];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_5 = _zz_mulOp2s_0[1529 : 1275];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_5 = _zz_mulOp2s_0_1[1529 : 1275];
        end else begin
          mulOp2s_5 = _zz_mulOp2s_0_2[1529 : 1275];
        end
      end
      4'b1001 : begin
        mulOp2s_5 = _zz_mulOp2s_0_3[1529 : 1275];
      end
      4'b1100 : begin
        mulOp2s_5 = _zz_mulOp2s_0_4[1529 : 1275];
      end
      default : begin
        mulOp2s_5 = _zz_mulOp2s_0_5[1529 : 1275];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_6 = _zz_mulOp2s_0[1784 : 1530];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_6 = _zz_mulOp2s_0_1[1784 : 1530];
        end else begin
          mulOp2s_6 = _zz_mulOp2s_0_2[1784 : 1530];
        end
      end
      4'b1001 : begin
        mulOp2s_6 = _zz_mulOp2s_0_3[1784 : 1530];
      end
      4'b1100 : begin
        mulOp2s_6 = _zz_mulOp2s_0_4[1784 : 1530];
      end
      default : begin
        mulOp2s_6 = _zz_mulOp2s_0_5[1784 : 1530];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_7 = _zz_mulOp2s_0[2039 : 1785];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_7 = _zz_mulOp2s_0_1[2039 : 1785];
        end else begin
          mulOp2s_7 = _zz_mulOp2s_0_2[2039 : 1785];
        end
      end
      4'b1001 : begin
        mulOp2s_7 = _zz_mulOp2s_0_3[2039 : 1785];
      end
      4'b1100 : begin
        mulOp2s_7 = _zz_mulOp2s_0_4[2039 : 1785];
      end
      default : begin
        mulOp2s_7 = _zz_mulOp2s_0_5[2039 : 1785];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_8 = _zz_mulOp2s_0[2294 : 2040];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_8 = _zz_mulOp2s_0_1[2294 : 2040];
        end else begin
          mulOp2s_8 = _zz_mulOp2s_0_2[2294 : 2040];
        end
      end
      4'b1001 : begin
        mulOp2s_8 = _zz_mulOp2s_0_3[2294 : 2040];
      end
      4'b1100 : begin
        mulOp2s_8 = _zz_mulOp2s_0_4[2294 : 2040];
      end
      default : begin
        mulOp2s_8 = _zz_mulOp2s_0_5[2294 : 2040];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_9 = _zz_mulOp2s_0[2549 : 2295];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_9 = _zz_mulOp2s_0_1[2549 : 2295];
        end else begin
          mulOp2s_9 = _zz_mulOp2s_0_2[2549 : 2295];
        end
      end
      4'b1001 : begin
        mulOp2s_9 = _zz_mulOp2s_0_3[2549 : 2295];
      end
      4'b1100 : begin
        mulOp2s_9 = _zz_mulOp2s_0_4[2549 : 2295];
      end
      default : begin
        mulOp2s_9 = _zz_mulOp2s_0_5[2549 : 2295];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_10 = _zz_mulOp2s_0[2804 : 2550];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_10 = _zz_mulOp2s_0_1[2804 : 2550];
        end else begin
          mulOp2s_10 = _zz_mulOp2s_0_2[2804 : 2550];
        end
      end
      4'b1001 : begin
        mulOp2s_10 = _zz_mulOp2s_0_3[2804 : 2550];
      end
      4'b1100 : begin
        mulOp2s_10 = _zz_mulOp2s_0_4[2804 : 2550];
      end
      default : begin
        mulOp2s_10 = _zz_mulOp2s_0_5[2804 : 2550];
      end
    endcase
  end

  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_11 = _zz_mulOp2s_0[3059 : 2805];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l50) begin
          mulOp2s_11 = _zz_mulOp2s_0_1[3059 : 2805];
        end else begin
          mulOp2s_11 = _zz_mulOp2s_0_2[3059 : 2805];
        end
      end
      4'b1001 : begin
        mulOp2s_11 = _zz_mulOp2s_0_3[3059 : 2805];
      end
      4'b1100 : begin
        mulOp2s_11 = _zz_mulOp2s_0_4[3059 : 2805];
      end
      default : begin
        mulOp2s_11 = _zz_mulOp2s_0_5[3059 : 2805];
      end
    endcase
  end

  assign when_MDSMatrixMultiplier_l50 = (io_input_payload_state_index == 4'b0101);
  assign _zz_mulOp2s_0_1 = 3060'h0;
  assign _zz_mulOp2s_0_2 = {1785'h0,{mDSMatrix_13_io_dataPorts_4,{mDSMatrix_13_io_dataPorts_3,{mDSMatrix_13_io_dataPorts_2,{mDSMatrix_13_io_dataPorts_1,mDSMatrix_13_io_dataPorts_0}}}}};
  assign _zz_mulOp2s_0_3 = {765'h0,{mDSMatrix_14_io_dataPorts_8,{mDSMatrix_14_io_dataPorts_7,{mDSMatrix_14_io_dataPorts_6,{mDSMatrix_14_io_dataPorts_5,{mDSMatrix_14_io_dataPorts_4,{mDSMatrix_14_io_dataPorts_3,{mDSMatrix_14_io_dataPorts_2,{mDSMatrix_14_io_dataPorts_1,mDSMatrix_14_io_dataPorts_0}}}}}}}}};
  assign _zz_mulOp2s_0_4 = {mDSMatrix_15_io_dataPorts_11,{mDSMatrix_15_io_dataPorts_10,{mDSMatrix_15_io_dataPorts_9,{mDSMatrix_15_io_dataPorts_8,{mDSMatrix_15_io_dataPorts_7,{mDSMatrix_15_io_dataPorts_6,{mDSMatrix_15_io_dataPorts_5,{mDSMatrix_15_io_dataPorts_4,{mDSMatrix_15_io_dataPorts_3,{mDSMatrix_15_io_dataPorts_2,{_zz__zz_mulOp2s_0_4,_zz__zz_mulOp2s_0_4_1}}}}}}}}}}};
  assign _zz_mulOp2s_0_5 = 3060'h0;
  assign io_input_ready = io_input_fork_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_0_translated_payload = io_input_payload_state_element;
  assign io_input_fork_io_outputs_0_translated_ready = io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  assign mulInputs_0_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  assign mulInputs_0_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload;
  assign mulInputs_0_payload_op2 = mulOp2s_0;
  assign mulInputs_1_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  assign mulInputs_1_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload;
  assign mulInputs_1_payload_op2 = mulOp2s_1;
  assign mulInputs_2_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  assign mulInputs_2_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload;
  assign mulInputs_2_payload_op2 = mulOp2s_2;
  assign mulInputs_3_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  assign mulInputs_3_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload;
  assign mulInputs_3_payload_op2 = mulOp2s_3;
  assign mulInputs_4_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_4_valid;
  assign mulInputs_4_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_4_payload;
  assign mulInputs_4_payload_op2 = mulOp2s_4;
  assign mulInputs_5_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_5_valid;
  assign mulInputs_5_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_5_payload;
  assign mulInputs_5_payload_op2 = mulOp2s_5;
  assign mulInputs_6_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_6_valid;
  assign mulInputs_6_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_6_payload;
  assign mulInputs_6_payload_op2 = mulOp2s_6;
  assign mulInputs_7_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_7_valid;
  assign mulInputs_7_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_7_payload;
  assign mulInputs_7_payload_op2 = mulOp2s_7;
  assign mulInputs_8_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_8_valid;
  assign mulInputs_8_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_8_payload;
  assign mulInputs_8_payload_op2 = mulOp2s_8;
  assign mulInputs_9_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_9_valid;
  assign mulInputs_9_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_9_payload;
  assign mulInputs_9_payload_op2 = mulOp2s_9;
  assign mulInputs_10_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_10_valid;
  assign mulInputs_10_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_10_payload;
  assign mulInputs_10_payload_op2 = mulOp2s_10;
  assign mulInputs_11_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_11_valid;
  assign mulInputs_11_payload_op1 = io_input_fork_io_outputs_0_translated_fork_io_outputs_11_payload;
  assign mulInputs_11_payload_op2 = mulOp2s_11;
  assign mulInputs_0_ready = montMultiplierPipedSim_45_io_input_ready;
  assign mulInputs_1_ready = montMultiplierPipedSim_46_io_input_ready;
  assign mulInputs_2_ready = montMultiplierPipedSim_47_io_input_ready;
  assign mulInputs_3_ready = montMultiplierPipedSim_48_io_input_ready;
  assign mulInputs_4_ready = montMultiplierPipedSim_49_io_input_ready;
  assign mulInputs_5_ready = montMultiplierPipedSim_50_io_input_ready;
  assign mulInputs_6_ready = montMultiplierPipedSim_51_io_input_ready;
  assign mulInputs_7_ready = montMultiplierPipedSim_52_io_input_ready;
  assign mulInputs_8_ready = montMultiplierPipedSim_53_io_input_ready;
  assign mulInputs_9_ready = montMultiplierPipedSim_54_io_input_ready;
  assign mulInputs_10_ready = montMultiplierPipedSim_55_io_input_ready;
  assign mulInputs_11_ready = montMultiplierPipedSim_56_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_1_translated_payload_round_index = io_input_payload_round_index;
  assign io_input_fork_io_outputs_1_translated_payload_state_size = io_input_payload_state_size;
  assign io_input_fork_io_outputs_1_translated_payload_state_id = io_input_payload_state_id;
  assign io_input_fork_io_outputs_1_translated_ready = io_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  assign mulResJoined_fire = (mulResJoined_valid && mulResJoined_ready);
  assign mulResJoined_valid = (((((((((((montMultiplierPipedSim_45_io_output_valid && montMultiplierPipedSim_46_io_output_valid) && montMultiplierPipedSim_47_io_output_valid) && montMultiplierPipedSim_48_io_output_valid) && montMultiplierPipedSim_49_io_output_valid) && montMultiplierPipedSim_50_io_output_valid) && montMultiplierPipedSim_51_io_output_valid) && montMultiplierPipedSim_52_io_output_valid) && montMultiplierPipedSim_53_io_output_valid) && montMultiplierPipedSim_54_io_output_valid) && montMultiplierPipedSim_55_io_output_valid) && montMultiplierPipedSim_56_io_output_valid);
  assign _zz_mulResJoined_ready = (_zz_io_output_valid && _zz_mulResJoined_ready_1);
  assign _zz_io_output_valid = (mulResJoined_valid && io_input_fork_io_outputs_1_translated_fifo_io_pop_valid);
  assign mulResJoined_ready = _zz_mulResJoined_ready;
  assign _zz_io_output_payload_state_elements_0 = {montMultiplierPipedSim_56_io_output_payload_res,{montMultiplierPipedSim_55_io_output_payload_res,{montMultiplierPipedSim_54_io_output_payload_res,{montMultiplierPipedSim_53_io_output_payload_res,{montMultiplierPipedSim_52_io_output_payload_res,{montMultiplierPipedSim_51_io_output_payload_res,{montMultiplierPipedSim_50_io_output_payload_res,{montMultiplierPipedSim_49_io_output_payload_res,{montMultiplierPipedSim_48_io_output_payload_res,{montMultiplierPipedSim_47_io_output_payload_res,{_zz__zz_io_output_payload_state_elements_0,_zz__zz_io_output_payload_state_elements_0_1}}}}}}}}}}};
  always @(*) begin
    _zz_mulResJoined_ready_1 = io_output_ready;
    if(when_Stream_l342) begin
      _zz_mulResJoined_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l342 = (! _zz_io_output_valid_1);
  assign _zz_io_output_valid_1 = _zz_io_output_valid_2;
  assign io_output_valid = _zz_io_output_valid_1;
  assign io_output_payload_round_index = _zz_io_output_payload_round_index;
  assign io_output_payload_state_size = _zz_io_output_payload_state_size;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = _zz_io_output_payload_state_elements_0_1;
  assign io_output_payload_state_elements_1 = _zz_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = _zz_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = _zz_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = _zz_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = _zz_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = _zz_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = _zz_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = _zz_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = _zz_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = _zz_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = _zz_io_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_output_valid_2 <= 1'b0;
    end else begin
      if(_zz_mulResJoined_ready_1) begin
        _zz_io_output_valid_2 <= _zz_io_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(_zz_mulResJoined_ready_1) begin
      _zz_io_output_payload_round_index <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_round_index;
      _zz_io_output_payload_state_size <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_size;
      _zz_io_output_payload_state_id <= io_input_fork_io_outputs_1_translated_fifo_io_pop_payload_state_id;
      _zz_io_output_payload_state_elements_0_1 <= _zz_io_output_payload_state_elements_0[254 : 0];
      _zz_io_output_payload_state_elements_1 <= _zz_io_output_payload_state_elements_0[509 : 255];
      _zz_io_output_payload_state_elements_2 <= _zz_io_output_payload_state_elements_0[764 : 510];
      _zz_io_output_payload_state_elements_3 <= _zz_io_output_payload_state_elements_0[1019 : 765];
      _zz_io_output_payload_state_elements_4 <= _zz_io_output_payload_state_elements_0[1274 : 1020];
      _zz_io_output_payload_state_elements_5 <= _zz_io_output_payload_state_elements_0[1529 : 1275];
      _zz_io_output_payload_state_elements_6 <= _zz_io_output_payload_state_elements_0[1784 : 1530];
      _zz_io_output_payload_state_elements_7 <= _zz_io_output_payload_state_elements_0[2039 : 1785];
      _zz_io_output_payload_state_elements_8 <= _zz_io_output_payload_state_elements_0[2294 : 2040];
      _zz_io_output_payload_state_elements_9 <= _zz_io_output_payload_state_elements_0[2549 : 2295];
      _zz_io_output_payload_state_elements_10 <= _zz_io_output_payload_state_elements_0[2804 : 2550];
      _zz_io_output_payload_state_elements_11 <= _zz_io_output_payload_state_elements_0[3059 : 2805];
    end
  end


endmodule

module StreamFifo_4 (
  input               io_push_valid,
  output              io_push_ready,
  input      [6:0]    io_push_payload_round_index,
  input      [3:0]    io_push_payload_state_index,
  input      [3:0]    io_push_payload_state_size,
  input      [6:0]    io_push_payload_state_id,
  input      [254:0]  io_push_payload_state_element,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [6:0]    io_pop_payload_round_index,
  output     [3:0]    io_pop_payload_state_index,
  output     [3:0]    io_pop_payload_state_size,
  output     [6:0]    io_pop_payload_state_id,
  output     [254:0]  io_pop_payload_state_element,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  output reg [2:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [276:0]  _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_round_index;
  wire       [276:0]  _zz_logic_ram_port_1;
  wire       [2:0]    _zz_io_occupancy;
  wire       [2:0]    _zz_io_availability;
  wire       [2:0]    _zz_io_availability_1;
  wire       [2:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [276:0]  _zz_io_pop_payload_round_index;
  wire                when_Stream_l933;
  wire       [2:0]    logic_ptrDif;
  reg [276:0] logic_ram [0:5];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (3'b110 + logic_ptrDif);
  assign _zz_io_availability = (3'b110 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_round_index = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_state_element,{io_push_payload_state_id,{io_push_payload_state_size,{io_push_payload_state_index,io_push_payload_round_index}}}};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_round_index) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b101);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b101);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_round_index = _zz_logic_ram_port0;
  assign io_pop_payload_round_index = _zz_io_pop_payload_round_index[6 : 0];
  assign io_pop_payload_state_index = _zz_io_pop_payload_round_index[10 : 7];
  assign io_pop_payload_state_size = _zz_io_pop_payload_round_index[14 : 11];
  assign io_pop_payload_state_id = _zz_io_pop_payload_round_index[21 : 15];
  assign io_pop_payload_state_element = _zz_io_pop_payload_round_index[276 : 22];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 3'b110 : 3'b000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 3'b000 : 3'b110);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

module StreamFork_7 (
  input               io_input_valid,
  output              io_input_ready,
  input      [254:0]  io_input_payload__1_res,
  input      [6:0]    io_input_payload__2_round_index,
  input      [3:0]    io_input_payload__2_state_index,
  input      [3:0]    io_input_payload__2_state_size,
  input      [6:0]    io_input_payload__2_state_id,
  input      [254:0]  io_input_payload__2_state_element,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [254:0]  io_outputs_0_payload__1_res,
  output     [6:0]    io_outputs_0_payload__2_round_index,
  output     [3:0]    io_outputs_0_payload__2_state_index,
  output     [3:0]    io_outputs_0_payload__2_state_size,
  output     [6:0]    io_outputs_0_payload__2_state_id,
  output     [254:0]  io_outputs_0_payload__2_state_element,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [254:0]  io_outputs_1_payload__1_res,
  output     [6:0]    io_outputs_1_payload__2_round_index,
  output     [3:0]    io_outputs_1_payload__2_state_index,
  output     [3:0]    io_outputs_1_payload__2_state_size,
  output     [6:0]    io_outputs_1_payload__2_state_id,
  output     [254:0]  io_outputs_1_payload__2_state_element
);

  assign io_input_ready = (io_outputs_0_ready && io_outputs_1_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload__1_res = io_input_payload__1_res;
  assign io_outputs_0_payload__2_round_index = io_input_payload__2_round_index;
  assign io_outputs_0_payload__2_state_index = io_input_payload__2_state_index;
  assign io_outputs_0_payload__2_state_size = io_input_payload__2_state_size;
  assign io_outputs_0_payload__2_state_id = io_input_payload__2_state_id;
  assign io_outputs_0_payload__2_state_element = io_input_payload__2_state_element;
  assign io_outputs_1_payload__1_res = io_input_payload__1_res;
  assign io_outputs_1_payload__2_round_index = io_input_payload__2_round_index;
  assign io_outputs_1_payload__2_state_index = io_input_payload__2_state_index;
  assign io_outputs_1_payload__2_state_size = io_input_payload__2_state_size;
  assign io_outputs_1_payload__2_state_id = io_input_payload__2_state_id;
  assign io_outputs_1_payload__2_state_element = io_input_payload__2_state_element;

endmodule

module StreamFifo_3 (
  input               io_push_valid,
  output              io_push_ready,
  input      [6:0]    io_push_payload_round_index,
  input      [3:0]    io_push_payload_state_index,
  input      [3:0]    io_push_payload_state_size,
  input      [6:0]    io_push_payload_state_id,
  input      [254:0]  io_push_payload_state_element,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [6:0]    io_pop_payload_round_index,
  output     [3:0]    io_pop_payload_state_index,
  output     [3:0]    io_pop_payload_state_size,
  output     [6:0]    io_pop_payload_state_id,
  output     [254:0]  io_pop_payload_state_element,
  input               io_flush,
  output reg [3:0]    io_occupancy,
  output reg [3:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [276:0]  _zz_logic_ram_port0;
  wire       [3:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [3:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_round_index;
  wire       [276:0]  _zz_logic_ram_port_1;
  wire       [3:0]    _zz_io_occupancy;
  wire       [3:0]    _zz_io_availability;
  wire       [3:0]    _zz_io_availability_1;
  wire       [3:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [3:0]    logic_pushPtr_valueNext;
  reg        [3:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [3:0]    logic_popPtr_valueNext;
  reg        [3:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [276:0]  _zz_io_pop_payload_round_index;
  wire                when_Stream_l933;
  wire       [3:0]    logic_ptrDif;
  reg [276:0] logic_ram [0:9];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {3'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {3'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (4'b1010 + logic_ptrDif);
  assign _zz_io_availability = (4'b1010 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_round_index = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_state_element,{io_push_payload_state_id,{io_push_payload_state_size,{io_push_payload_state_index,io_push_payload_round_index}}}};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_round_index) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 4'b1001);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 4'b0000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 4'b1001);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 4'b0000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 4'b0000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_round_index = _zz_logic_ram_port0;
  assign io_pop_payload_round_index = _zz_io_pop_payload_round_index[6 : 0];
  assign io_pop_payload_state_index = _zz_io_pop_payload_round_index[10 : 7];
  assign io_pop_payload_state_size = _zz_io_pop_payload_round_index[14 : 11];
  assign io_pop_payload_state_id = _zz_io_pop_payload_round_index[21 : 15];
  assign io_pop_payload_state_element = _zz_io_pop_payload_round_index[276 : 22];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 4'b1010 : 4'b0000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 4'b0000 : 4'b1010);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 4'b0000;
      logic_popPtr_value <= 4'b0000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork replaced by StreamFork

module RoundConstants_3 (
  output     [254:0]  io_readPorts_0_data,
  input      [3:0]    io_readPorts_0_tIndex,
  input      [6:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  wire       [254:0]  _zz_constantsRoms_5_port0;
  wire       [254:0]  _zz_constantsRoms_6_port0;
  wire       [254:0]  _zz_constantsRoms_7_port0;
  wire       [254:0]  _zz_constantsRoms_8_port0;
  wire       [254:0]  _zz_constantsRoms_9_port0;
  wire       [254:0]  _zz_constantsRoms_10_port0;
  wire       [254:0]  _zz_constantsRoms_11_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_8 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_9 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_10 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_11 [0:64];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_5.bin",constantsRoms_5);
  end
  assign _zz_constantsRoms_5_port0 = constantsRoms_5[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_6.bin",constantsRoms_6);
  end
  assign _zz_constantsRoms_6_port0 = constantsRoms_6[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_7.bin",constantsRoms_7);
  end
  assign _zz_constantsRoms_7_port0 = constantsRoms_7[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_8.bin",constantsRoms_8);
  end
  assign _zz_constantsRoms_8_port0 = constantsRoms_8[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_9.bin",constantsRoms_9);
  end
  assign _zz_constantsRoms_9_port0 = constantsRoms_9[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_10.bin",constantsRoms_10);
  end
  assign _zz_constantsRoms_10_port0 = constantsRoms_10[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t12_constantsRoms_11.bin",constantsRoms_11);
  end
  assign _zz_constantsRoms_11_port0 = constantsRoms_11[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      4'b0000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      4'b0001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      4'b0010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      4'b0011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      4'b0100 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
      4'b0101 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_5_port0;
      end
      4'b0110 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_6_port0;
      end
      4'b0111 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_7_port0;
      end
      4'b1000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_8_port0;
      end
      4'b1001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_9_port0;
      end
      4'b1010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_10_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_11_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_2 (
  output     [254:0]  io_readPorts_0_data,
  input      [3:0]    io_readPorts_0_tIndex,
  input      [6:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  wire       [254:0]  _zz_constantsRoms_5_port0;
  wire       [254:0]  _zz_constantsRoms_6_port0;
  wire       [254:0]  _zz_constantsRoms_7_port0;
  wire       [254:0]  _zz_constantsRoms_8_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_8 [0:64];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_5.bin",constantsRoms_5);
  end
  assign _zz_constantsRoms_5_port0 = constantsRoms_5[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_6.bin",constantsRoms_6);
  end
  assign _zz_constantsRoms_6_port0 = constantsRoms_6[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_7.bin",constantsRoms_7);
  end
  assign _zz_constantsRoms_7_port0 = constantsRoms_7[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t9_constantsRoms_8.bin",constantsRoms_8);
  end
  assign _zz_constantsRoms_8_port0 = constantsRoms_8[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      4'b0000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      4'b0001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      4'b0010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      4'b0011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      4'b0100 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
      4'b0101 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_5_port0;
      end
      4'b0110 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_6_port0;
      end
      4'b0111 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_7_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_8_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants_1 (
  output     [254:0]  io_readPorts_0_data,
  input      [2:0]    io_readPorts_0_tIndex,
  input      [5:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  wire       [254:0]  _zz_constantsRoms_3_port0;
  wire       [254:0]  _zz_constantsRoms_4_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_3 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_4 [0:63];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_3.bin",constantsRoms_3);
  end
  assign _zz_constantsRoms_3_port0 = constantsRoms_3[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t5_constantsRoms_4.bin",constantsRoms_4);
  end
  assign _zz_constantsRoms_4_port0 = constantsRoms_4[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      3'b000 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      3'b001 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      3'b010 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
      3'b011 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_3_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_4_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

module RoundConstants (
  output     [254:0]  io_readPorts_0_data,
  input      [1:0]    io_readPorts_0_tIndex,
  input      [5:0]    io_readPorts_0_roundIndex
);
  wire       [254:0]  _zz_constantsRoms_0_port0;
  wire       [254:0]  _zz_constantsRoms_1_port0;
  wire       [254:0]  _zz_constantsRoms_2_port0;
  reg        [254:0]  _zz_io_readPorts_0_data;
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_0 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_1 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constantsRoms_2 [0:62];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_0.bin",constantsRoms_0);
  end
  assign _zz_constantsRoms_0_port0 = constantsRoms_0[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_1.bin",constantsRoms_1);
  end
  assign _zz_constantsRoms_1_port0 = constantsRoms_1[io_readPorts_0_roundIndex];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_AddRoundConstantStage_roundConstants_t3_constantsRoms_2.bin",constantsRoms_2);
  end
  assign _zz_constantsRoms_2_port0 = constantsRoms_2[io_readPorts_0_roundIndex];
  always @(*) begin
    case(io_readPorts_0_tIndex)
      2'b00 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_0_port0;
      end
      2'b01 : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_1_port0;
      end
      default : begin
        _zz_io_readPorts_0_data = _zz_constantsRoms_2_port0;
      end
    endcase
  end

  assign io_readPorts_0_data = _zz_io_readPorts_0_data;

endmodule

//StreamFifo replaced by StreamFifo

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork_1 replaced by StreamFork_1

//StreamFork replaced by StreamFork

module MDSMatrix_11 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  output     [254:0]  io_dataPorts_5,
  output     [254:0]  io_dataPorts_6,
  output     [254:0]  io_dataPorts_7,
  output     [254:0]  io_dataPorts_8,
  output     [254:0]  io_dataPorts_9,
  output     [254:0]  io_dataPorts_10,
  output     [254:0]  io_dataPorts_11,
  input      [3:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  wire       [254:0]  _zz_mdsRoms_5_port0;
  wire       [254:0]  _zz_mdsRoms_6_port0;
  wire       [254:0]  _zz_mdsRoms_7_port0;
  wire       [254:0]  _zz_mdsRoms_8_port0;
  wire       [254:0]  _zz_mdsRoms_9_port0;
  wire       [254:0]  _zz_mdsRoms_10_port0;
  wire       [254:0]  _zz_mdsRoms_11_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_5 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_6 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_7 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_8 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_9 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_10 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_11 [0:11];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_5.bin",mdsRoms_5);
  end
  assign _zz_mdsRoms_5_port0 = mdsRoms_5[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_6.bin",mdsRoms_6);
  end
  assign _zz_mdsRoms_6_port0 = mdsRoms_6[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_7.bin",mdsRoms_7);
  end
  assign _zz_mdsRoms_7_port0 = mdsRoms_7[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_8.bin",mdsRoms_8);
  end
  assign _zz_mdsRoms_8_port0 = mdsRoms_8[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_9.bin",mdsRoms_9);
  end
  assign _zz_mdsRoms_9_port0 = mdsRoms_9[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_10.bin",mdsRoms_10);
  end
  assign _zz_mdsRoms_10_port0 = mdsRoms_10[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_11.bin",mdsRoms_11);
  end
  assign _zz_mdsRoms_11_port0 = mdsRoms_11[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;
  assign io_dataPorts_5 = _zz_mdsRoms_5_port0;
  assign io_dataPorts_6 = _zz_mdsRoms_6_port0;
  assign io_dataPorts_7 = _zz_mdsRoms_7_port0;
  assign io_dataPorts_8 = _zz_mdsRoms_8_port0;
  assign io_dataPorts_9 = _zz_mdsRoms_9_port0;
  assign io_dataPorts_10 = _zz_mdsRoms_10_port0;
  assign io_dataPorts_11 = _zz_mdsRoms_11_port0;

endmodule

module MDSMatrix_10 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  output     [254:0]  io_dataPorts_5,
  output     [254:0]  io_dataPorts_6,
  output     [254:0]  io_dataPorts_7,
  output     [254:0]  io_dataPorts_8,
  input      [3:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  wire       [254:0]  _zz_mdsRoms_5_port0;
  wire       [254:0]  _zz_mdsRoms_6_port0;
  wire       [254:0]  _zz_mdsRoms_7_port0;
  wire       [254:0]  _zz_mdsRoms_8_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_5 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_6 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_7 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_8 [0:8];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_5.bin",mdsRoms_5);
  end
  assign _zz_mdsRoms_5_port0 = mdsRoms_5[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_6.bin",mdsRoms_6);
  end
  assign _zz_mdsRoms_6_port0 = mdsRoms_6[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_7.bin",mdsRoms_7);
  end
  assign _zz_mdsRoms_7_port0 = mdsRoms_7[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_8.bin",mdsRoms_8);
  end
  assign _zz_mdsRoms_8_port0 = mdsRoms_8[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;
  assign io_dataPorts_5 = _zz_mdsRoms_5_port0;
  assign io_dataPorts_6 = _zz_mdsRoms_6_port0;
  assign io_dataPorts_7 = _zz_mdsRoms_7_port0;
  assign io_dataPorts_8 = _zz_mdsRoms_8_port0;

endmodule

module MDSMatrix_9 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  input      [2:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:4];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;

endmodule

module MDSMatrix_8 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  input      [1:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:2];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_5_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;

endmodule

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamFifo replaced by StreamFifo

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//StreamFork_1 replaced by StreamFork_1

//StreamFork replaced by StreamFork

module MDSMatrix_7 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  output     [254:0]  io_dataPorts_5,
  output     [254:0]  io_dataPorts_6,
  output     [254:0]  io_dataPorts_7,
  output     [254:0]  io_dataPorts_8,
  output     [254:0]  io_dataPorts_9,
  output     [254:0]  io_dataPorts_10,
  output     [254:0]  io_dataPorts_11,
  input      [3:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  wire       [254:0]  _zz_mdsRoms_5_port0;
  wire       [254:0]  _zz_mdsRoms_6_port0;
  wire       [254:0]  _zz_mdsRoms_7_port0;
  wire       [254:0]  _zz_mdsRoms_8_port0;
  wire       [254:0]  _zz_mdsRoms_9_port0;
  wire       [254:0]  _zz_mdsRoms_10_port0;
  wire       [254:0]  _zz_mdsRoms_11_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_5 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_6 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_7 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_8 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_9 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_10 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_11 [0:11];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_5.bin",mdsRoms_5);
  end
  assign _zz_mdsRoms_5_port0 = mdsRoms_5[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_6.bin",mdsRoms_6);
  end
  assign _zz_mdsRoms_6_port0 = mdsRoms_6[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_7.bin",mdsRoms_7);
  end
  assign _zz_mdsRoms_7_port0 = mdsRoms_7[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_8.bin",mdsRoms_8);
  end
  assign _zz_mdsRoms_8_port0 = mdsRoms_8[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_9.bin",mdsRoms_9);
  end
  assign _zz_mdsRoms_9_port0 = mdsRoms_9[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_10.bin",mdsRoms_10);
  end
  assign _zz_mdsRoms_10_port0 = mdsRoms_10[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_11.bin",mdsRoms_11);
  end
  assign _zz_mdsRoms_11_port0 = mdsRoms_11[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;
  assign io_dataPorts_5 = _zz_mdsRoms_5_port0;
  assign io_dataPorts_6 = _zz_mdsRoms_6_port0;
  assign io_dataPorts_7 = _zz_mdsRoms_7_port0;
  assign io_dataPorts_8 = _zz_mdsRoms_8_port0;
  assign io_dataPorts_9 = _zz_mdsRoms_9_port0;
  assign io_dataPorts_10 = _zz_mdsRoms_10_port0;
  assign io_dataPorts_11 = _zz_mdsRoms_11_port0;

endmodule

module MDSMatrix_6 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  output     [254:0]  io_dataPorts_5,
  output     [254:0]  io_dataPorts_6,
  output     [254:0]  io_dataPorts_7,
  output     [254:0]  io_dataPorts_8,
  input      [3:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  wire       [254:0]  _zz_mdsRoms_5_port0;
  wire       [254:0]  _zz_mdsRoms_6_port0;
  wire       [254:0]  _zz_mdsRoms_7_port0;
  wire       [254:0]  _zz_mdsRoms_8_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_5 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_6 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_7 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_8 [0:8];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_5.bin",mdsRoms_5);
  end
  assign _zz_mdsRoms_5_port0 = mdsRoms_5[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_6.bin",mdsRoms_6);
  end
  assign _zz_mdsRoms_6_port0 = mdsRoms_6[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_7.bin",mdsRoms_7);
  end
  assign _zz_mdsRoms_7_port0 = mdsRoms_7[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_8.bin",mdsRoms_8);
  end
  assign _zz_mdsRoms_8_port0 = mdsRoms_8[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;
  assign io_dataPorts_5 = _zz_mdsRoms_5_port0;
  assign io_dataPorts_6 = _zz_mdsRoms_6_port0;
  assign io_dataPorts_7 = _zz_mdsRoms_7_port0;
  assign io_dataPorts_8 = _zz_mdsRoms_8_port0;

endmodule

module MDSMatrix_5 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  input      [2:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:4];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;

endmodule

module MDSMatrix_4 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  input      [1:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:2];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_4_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;

endmodule

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [6:0]    io_push_payload_round_index,
  input      [3:0]    io_push_payload_state_size,
  input      [6:0]    io_push_payload_state_id,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [6:0]    io_pop_payload_round_index,
  output     [3:0]    io_pop_payload_state_size,
  output     [6:0]    io_pop_payload_state_id,
  input               io_flush,
  output     [3:0]    io_occupancy,
  output     [3:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [17:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_round_index;
  wire       [17:0]   _zz_logic_ram_port_1;
  wire       [2:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [17:0]   _zz_io_pop_payload_round_index;
  wire                when_Stream_l933;
  wire       [2:0]    logic_ptrDif;
  reg [17:0] logic_ram [0:7];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_round_index = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_state_id,{io_push_payload_state_size,io_push_payload_round_index}};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_round_index) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_round_index = _zz_logic_ram_port0;
  assign io_pop_payload_round_index = _zz_io_pop_payload_round_index[6 : 0];
  assign io_pop_payload_state_size = _zz_io_pop_payload_round_index[10 : 7];
  assign io_pop_payload_state_id = _zz_io_pop_payload_round_index[17 : 11];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

//MontMultiplierPipedSim replaced by MontMultiplierPipedSim

module MontMultiplierPipedSim (
  input               io_input_valid,
  output              io_input_ready,
  input      [254:0]  io_input_payload_op1,
  input      [254:0]  io_input_payload_op2,
  output              io_output_valid,
  input               io_output_ready,
  output     [254:0]  io_output_payload_res,
  input               clk,
  input               reset
);
  wire       [4:0]    oneBitFullAdderArraySim_1_x_temp_i;
  wire       [4:0]    oneBitFullAdderArraySim_2_x_temp_i;
  wire       [4:0]    oneBitFullAdderArraySim_3_x_temp_i;
  wire       [0:0]    streamDemux_50_io_select;
  wire                streamDemux_50_io_outputs_0_ready;
  wire                streamArbiter_49_io_inputs_0_ready;
  wire                streamArbiter_49_io_inputs_1_ready;
  wire                streamArbiter_49_io_output_valid;
  wire       [254:0]  streamArbiter_49_io_output_payload_xTemp;
  wire       [254:0]  streamArbiter_49_io_output_payload_yTemp;
  wire       [255:0]  streamArbiter_49_io_output_payload_yAddM;
  wire       [255:0]  streamArbiter_49_io_output_payload_adderRes;
  wire       [5:0]    streamArbiter_49_io_output_payload_counter;
  wire       [0:0]    streamArbiter_49_io_chosen;
  wire       [1:0]    streamArbiter_49_io_chosenOH;
  wire       [255:0]  oneBitFullAdderArraySim_1_adder_res_o;
  wire       [255:0]  oneBitFullAdderArraySim_2_adder_res_o;
  wire       [255:0]  oneBitFullAdderArraySim_3_adder_res_o;
  wire                streamDemux_50_io_input_ready;
  wire                streamDemux_50_io_outputs_0_valid;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_xTemp;
  wire       [254:0]  streamDemux_50_io_outputs_0_payload_yTemp;
  wire       [255:0]  streamDemux_50_io_outputs_0_payload_yAddM;
  wire       [255:0]  streamDemux_50_io_outputs_0_payload_adderRes;
  wire       [5:0]    streamDemux_50_io_outputs_0_payload_counter;
  wire                streamDemux_50_io_outputs_1_valid;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_xTemp;
  wire       [254:0]  streamDemux_50_io_outputs_1_payload_yTemp;
  wire       [255:0]  streamDemux_50_io_outputs_1_payload_yAddM;
  wire       [255:0]  streamDemux_50_io_outputs_1_payload_adderRes;
  wire       [5:0]    streamDemux_50_io_outputs_1_payload_counter;
  wire       [254:0]  _zz_resCombination_tempRes;
  wire       [254:0]  preComputation_initialContext_xTemp;
  wire       [254:0]  preComputation_initialContext_yTemp;
  wire       [255:0]  preComputation_initialContext_yAddM;
  wire       [255:0]  preComputation_initialContext_adderRes;
  wire       [5:0]    preComputation_initialContext_counter;
  wire                io_input_translated_valid;
  reg                 io_input_translated_ready;
  wire       [254:0]  io_input_translated_payload_xTemp;
  wire       [254:0]  io_input_translated_payload_yTemp;
  wire       [255:0]  io_input_translated_payload_yAddM;
  wire       [255:0]  io_input_translated_payload_adderRes;
  wire       [5:0]    io_input_translated_payload_counter;
  wire                io_input_translated_output_valid;
  wire                io_input_translated_output_ready;
  wire       [254:0]  io_input_translated_output_payload_xTemp;
  wire       [254:0]  io_input_translated_output_payload_yTemp;
  wire       [255:0]  io_input_translated_output_payload_yAddM;
  wire       [255:0]  io_input_translated_output_payload_adderRes;
  wire       [5:0]    io_input_translated_output_payload_counter;
  reg                 io_input_translated_rValid;
  reg        [254:0]  io_input_translated_rData_xTemp;
  reg        [254:0]  io_input_translated_rData_yTemp;
  reg        [255:0]  io_input_translated_rData_yAddM;
  reg        [255:0]  io_input_translated_rData_adderRes;
  reg        [5:0]    io_input_translated_rData_counter;
  wire                when_Stream_l342;
  wire                adderPipeline_loopback_valid;
  wire                adderPipeline_loopback_ready;
  wire       [254:0]  adderPipeline_loopback_payload_xTemp;
  wire       [254:0]  adderPipeline_loopback_payload_yTemp;
  wire       [255:0]  adderPipeline_loopback_payload_yAddM;
  wire       [255:0]  adderPipeline_loopback_payload_adderRes;
  wire       [5:0]    adderPipeline_loopback_payload_counter;
  wire                adderPipeline_tempRes_0_valid;
  wire                adderPipeline_tempRes_0_ready;
  wire       [254:0]  adderPipeline_tempRes_0_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_0_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_0_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_0_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_0_payload_counter;
  wire                adderPipeline_tempRes_1_valid;
  wire                adderPipeline_tempRes_1_ready;
  wire       [254:0]  adderPipeline_tempRes_1_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_1_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_1_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_1_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_1_payload_counter;
  wire                adderPipeline_tempRes_2_valid;
  wire                adderPipeline_tempRes_2_ready;
  wire       [254:0]  adderPipeline_tempRes_2_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_2_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_2_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_2_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_2_payload_counter;
  wire                adderPipeline_tempRes_3_valid;
  wire                adderPipeline_tempRes_3_ready;
  wire       [254:0]  adderPipeline_tempRes_3_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_3_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_3_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_3_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_3_payload_counter;
  wire                adderPipeline_tempRes_0_translated_valid;
  reg                 adderPipeline_tempRes_0_translated_ready;
  wire       [254:0]  adderPipeline_tempRes_0_translated_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_0_translated_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_0_translated_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_0_translated_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_0_translated_payload_counter;
  wire                adderPipeline_tempRes_0_translated_m2sPipe_valid;
  wire                adderPipeline_tempRes_0_translated_m2sPipe_ready;
  wire       [254:0]  adderPipeline_tempRes_0_translated_m2sPipe_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_0_translated_m2sPipe_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_0_translated_m2sPipe_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_0_translated_m2sPipe_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_0_translated_m2sPipe_payload_counter;
  reg                 adderPipeline_tempRes_0_translated_rValid;
  reg        [254:0]  adderPipeline_tempRes_0_translated_rData_xTemp;
  reg        [254:0]  adderPipeline_tempRes_0_translated_rData_yTemp;
  reg        [255:0]  adderPipeline_tempRes_0_translated_rData_yAddM;
  reg        [255:0]  adderPipeline_tempRes_0_translated_rData_adderRes;
  reg        [5:0]    adderPipeline_tempRes_0_translated_rData_counter;
  wire                when_Stream_l342_1;
  wire                adderPipeline_tempRes_1_translated_valid;
  reg                 adderPipeline_tempRes_1_translated_ready;
  wire       [254:0]  adderPipeline_tempRes_1_translated_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_1_translated_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_1_translated_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_1_translated_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_1_translated_payload_counter;
  wire                adderPipeline_tempRes_1_translated_m2sPipe_valid;
  wire                adderPipeline_tempRes_1_translated_m2sPipe_ready;
  wire       [254:0]  adderPipeline_tempRes_1_translated_m2sPipe_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_1_translated_m2sPipe_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_1_translated_m2sPipe_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_1_translated_m2sPipe_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_1_translated_m2sPipe_payload_counter;
  reg                 adderPipeline_tempRes_1_translated_rValid;
  reg        [254:0]  adderPipeline_tempRes_1_translated_rData_xTemp;
  reg        [254:0]  adderPipeline_tempRes_1_translated_rData_yTemp;
  reg        [255:0]  adderPipeline_tempRes_1_translated_rData_yAddM;
  reg        [255:0]  adderPipeline_tempRes_1_translated_rData_adderRes;
  reg        [5:0]    adderPipeline_tempRes_1_translated_rData_counter;
  wire                when_Stream_l342_2;
  wire                adderPipeline_tempRes_2_translated_valid;
  reg                 adderPipeline_tempRes_2_translated_ready;
  wire       [254:0]  adderPipeline_tempRes_2_translated_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_2_translated_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_2_translated_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_2_translated_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_2_translated_payload_counter;
  wire                adderPipeline_tempRes_2_translated_m2sPipe_valid;
  wire                adderPipeline_tempRes_2_translated_m2sPipe_ready;
  wire       [254:0]  adderPipeline_tempRes_2_translated_m2sPipe_payload_xTemp;
  wire       [254:0]  adderPipeline_tempRes_2_translated_m2sPipe_payload_yTemp;
  wire       [255:0]  adderPipeline_tempRes_2_translated_m2sPipe_payload_yAddM;
  wire       [255:0]  adderPipeline_tempRes_2_translated_m2sPipe_payload_adderRes;
  wire       [5:0]    adderPipeline_tempRes_2_translated_m2sPipe_payload_counter;
  reg                 adderPipeline_tempRes_2_translated_rValid;
  reg        [254:0]  adderPipeline_tempRes_2_translated_rData_xTemp;
  reg        [254:0]  adderPipeline_tempRes_2_translated_rData_yTemp;
  reg        [255:0]  adderPipeline_tempRes_2_translated_rData_yAddM;
  reg        [255:0]  adderPipeline_tempRes_2_translated_rData_adderRes;
  reg        [5:0]    adderPipeline_tempRes_2_translated_rData_counter;
  wire                when_Stream_l342_3;
  wire                adderPipeline_select;
  wire                streamDemux_50_io_outputs_0_s2mPipe_valid;
  wire                streamDemux_50_io_outputs_0_s2mPipe_ready;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_xTemp;
  wire       [254:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_yTemp;
  wire       [255:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_yAddM;
  wire       [255:0]  streamDemux_50_io_outputs_0_s2mPipe_payload_adderRes;
  wire       [5:0]    streamDemux_50_io_outputs_0_s2mPipe_payload_counter;
  reg                 streamDemux_50_io_outputs_0_rValid;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_xTemp;
  reg        [254:0]  streamDemux_50_io_outputs_0_rData_yTemp;
  reg        [255:0]  streamDemux_50_io_outputs_0_rData_yAddM;
  reg        [255:0]  streamDemux_50_io_outputs_0_rData_adderRes;
  reg        [5:0]    streamDemux_50_io_outputs_0_rData_counter;
  wire                resCombination_output_valid;
  reg                 resCombination_output_ready;
  reg        [254:0]  resCombination_output_payload_res;
  wire       [255:0]  resCombination_tempRes;
  wire                when_MontMultiplierPiped_l236;
  wire                resCombination_output_m2sPipe_valid;
  wire                resCombination_output_m2sPipe_ready;
  wire       [254:0]  resCombination_output_m2sPipe_payload_res;
  reg                 resCombination_output_rValid;
  reg        [254:0]  resCombination_output_rData_res;
  wire                when_Stream_l342_4;

  assign _zz_resCombination_tempRes = streamDemux_50_io_outputs_1_payload_adderRes[254:0];
  StreamArbiter streamArbiter_49 (
    .io_inputs_0_valid               (adderPipeline_loopback_valid                 ), //i
    .io_inputs_0_ready               (streamArbiter_49_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_xTemp       (adderPipeline_loopback_payload_xTemp         ), //i
    .io_inputs_0_payload_yTemp       (adderPipeline_loopback_payload_yTemp         ), //i
    .io_inputs_0_payload_yAddM       (adderPipeline_loopback_payload_yAddM         ), //i
    .io_inputs_0_payload_adderRes    (adderPipeline_loopback_payload_adderRes      ), //i
    .io_inputs_0_payload_counter     (adderPipeline_loopback_payload_counter       ), //i
    .io_inputs_1_valid               (io_input_translated_output_valid             ), //i
    .io_inputs_1_ready               (streamArbiter_49_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_xTemp       (io_input_translated_output_payload_xTemp     ), //i
    .io_inputs_1_payload_yTemp       (io_input_translated_output_payload_yTemp     ), //i
    .io_inputs_1_payload_yAddM       (io_input_translated_output_payload_yAddM     ), //i
    .io_inputs_1_payload_adderRes    (io_input_translated_output_payload_adderRes  ), //i
    .io_inputs_1_payload_counter     (io_input_translated_output_payload_counter   ), //i
    .io_output_valid                 (streamArbiter_49_io_output_valid             ), //o
    .io_output_ready                 (adderPipeline_tempRes_0_ready                ), //i
    .io_output_payload_xTemp         (streamArbiter_49_io_output_payload_xTemp     ), //o
    .io_output_payload_yTemp         (streamArbiter_49_io_output_payload_yTemp     ), //o
    .io_output_payload_yAddM         (streamArbiter_49_io_output_payload_yAddM     ), //o
    .io_output_payload_adderRes      (streamArbiter_49_io_output_payload_adderRes  ), //o
    .io_output_payload_counter       (streamArbiter_49_io_output_payload_counter   ), //o
    .io_chosen                       (streamArbiter_49_io_chosen                   ), //o
    .io_chosenOH                     (streamArbiter_49_io_chosenOH                 ), //o
    .clk                             (clk                                          ), //i
    .reset                           (reset                                        )  //i
  );
  OneBitFullAdderArraySim #(
    .ROW_NUM(5),
    .DATA_WIDTH(255) 
  ) oneBitFullAdderArraySim_1 (
    .x_temp_i       (oneBitFullAdderArraySim_1_x_temp_i        ), //i
    .y_temp_i       (adderPipeline_tempRes_0_payload_yTemp     ), //i
    .y_add_m_i      (adderPipeline_tempRes_0_payload_yAddM     ), //i
    .adder_res_i    (adderPipeline_tempRes_0_payload_adderRes  ), //i
    .adder_res_o    (oneBitFullAdderArraySim_1_adder_res_o     )  //o
  );
  OneBitFullAdderArraySim #(
    .ROW_NUM(5),
    .DATA_WIDTH(255) 
  ) oneBitFullAdderArraySim_2 (
    .x_temp_i       (oneBitFullAdderArraySim_2_x_temp_i        ), //i
    .y_temp_i       (adderPipeline_tempRes_1_payload_yTemp     ), //i
    .y_add_m_i      (adderPipeline_tempRes_1_payload_yAddM     ), //i
    .adder_res_i    (adderPipeline_tempRes_1_payload_adderRes  ), //i
    .adder_res_o    (oneBitFullAdderArraySim_2_adder_res_o     )  //o
  );
  OneBitFullAdderArraySim #(
    .ROW_NUM(5),
    .DATA_WIDTH(255) 
  ) oneBitFullAdderArraySim_3 (
    .x_temp_i       (oneBitFullAdderArraySim_3_x_temp_i        ), //i
    .y_temp_i       (adderPipeline_tempRes_2_payload_yTemp     ), //i
    .y_add_m_i      (adderPipeline_tempRes_2_payload_yAddM     ), //i
    .adder_res_i    (adderPipeline_tempRes_2_payload_adderRes  ), //i
    .adder_res_o    (oneBitFullAdderArraySim_3_adder_res_o     )  //o
  );
  StreamDemux streamDemux_50 (
    .io_select                        (streamDemux_50_io_select                      ), //i
    .io_input_valid                   (adderPipeline_tempRes_3_valid                 ), //i
    .io_input_ready                   (streamDemux_50_io_input_ready                 ), //o
    .io_input_payload_xTemp           (adderPipeline_tempRes_3_payload_xTemp         ), //i
    .io_input_payload_yTemp           (adderPipeline_tempRes_3_payload_yTemp         ), //i
    .io_input_payload_yAddM           (adderPipeline_tempRes_3_payload_yAddM         ), //i
    .io_input_payload_adderRes        (adderPipeline_tempRes_3_payload_adderRes      ), //i
    .io_input_payload_counter         (adderPipeline_tempRes_3_payload_counter       ), //i
    .io_outputs_0_valid               (streamDemux_50_io_outputs_0_valid             ), //o
    .io_outputs_0_ready               (streamDemux_50_io_outputs_0_ready             ), //i
    .io_outputs_0_payload_xTemp       (streamDemux_50_io_outputs_0_payload_xTemp     ), //o
    .io_outputs_0_payload_yTemp       (streamDemux_50_io_outputs_0_payload_yTemp     ), //o
    .io_outputs_0_payload_yAddM       (streamDemux_50_io_outputs_0_payload_yAddM     ), //o
    .io_outputs_0_payload_adderRes    (streamDemux_50_io_outputs_0_payload_adderRes  ), //o
    .io_outputs_0_payload_counter     (streamDemux_50_io_outputs_0_payload_counter   ), //o
    .io_outputs_1_valid               (streamDemux_50_io_outputs_1_valid             ), //o
    .io_outputs_1_ready               (resCombination_output_ready                   ), //i
    .io_outputs_1_payload_xTemp       (streamDemux_50_io_outputs_1_payload_xTemp     ), //o
    .io_outputs_1_payload_yTemp       (streamDemux_50_io_outputs_1_payload_yTemp     ), //o
    .io_outputs_1_payload_yAddM       (streamDemux_50_io_outputs_1_payload_yAddM     ), //o
    .io_outputs_1_payload_adderRes    (streamDemux_50_io_outputs_1_payload_adderRes  ), //o
    .io_outputs_1_payload_counter     (streamDemux_50_io_outputs_1_payload_counter   )  //o
  );
  assign preComputation_initialContext_xTemp = io_input_payload_op1;
  assign preComputation_initialContext_yTemp = io_input_payload_op2;
  assign preComputation_initialContext_yAddM = ({1'b0,io_input_payload_op2} + {1'b0,255'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001});
  assign preComputation_initialContext_adderRes = 256'h0;
  assign preComputation_initialContext_counter = 6'h0;
  assign io_input_translated_valid = io_input_valid;
  assign io_input_ready = io_input_translated_ready;
  assign io_input_translated_payload_xTemp = preComputation_initialContext_xTemp;
  assign io_input_translated_payload_yTemp = preComputation_initialContext_yTemp;
  assign io_input_translated_payload_yAddM = preComputation_initialContext_yAddM;
  assign io_input_translated_payload_adderRes = preComputation_initialContext_adderRes;
  assign io_input_translated_payload_counter = preComputation_initialContext_counter;
  always @(*) begin
    io_input_translated_ready = io_input_translated_output_ready;
    if(when_Stream_l342) begin
      io_input_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! io_input_translated_output_valid);
  assign io_input_translated_output_valid = io_input_translated_rValid;
  assign io_input_translated_output_payload_xTemp = io_input_translated_rData_xTemp;
  assign io_input_translated_output_payload_yTemp = io_input_translated_rData_yTemp;
  assign io_input_translated_output_payload_yAddM = io_input_translated_rData_yAddM;
  assign io_input_translated_output_payload_adderRes = io_input_translated_rData_adderRes;
  assign io_input_translated_output_payload_counter = io_input_translated_rData_counter;
  assign adderPipeline_loopback_ready = streamArbiter_49_io_inputs_0_ready;
  assign io_input_translated_output_ready = streamArbiter_49_io_inputs_1_ready;
  assign adderPipeline_tempRes_0_valid = streamArbiter_49_io_output_valid;
  assign adderPipeline_tempRes_0_payload_xTemp = streamArbiter_49_io_output_payload_xTemp;
  assign adderPipeline_tempRes_0_payload_yTemp = streamArbiter_49_io_output_payload_yTemp;
  assign adderPipeline_tempRes_0_payload_yAddM = streamArbiter_49_io_output_payload_yAddM;
  assign adderPipeline_tempRes_0_payload_adderRes = streamArbiter_49_io_output_payload_adderRes;
  assign adderPipeline_tempRes_0_payload_counter = streamArbiter_49_io_output_payload_counter;
  assign oneBitFullAdderArraySim_1_x_temp_i = adderPipeline_tempRes_0_payload_xTemp[4:0];
  assign adderPipeline_tempRes_0_translated_valid = adderPipeline_tempRes_0_valid;
  assign adderPipeline_tempRes_0_ready = adderPipeline_tempRes_0_translated_ready;
  assign adderPipeline_tempRes_0_translated_payload_xTemp = (adderPipeline_tempRes_0_payload_xTemp >>> 5);
  assign adderPipeline_tempRes_0_translated_payload_yTemp = adderPipeline_tempRes_0_payload_yTemp;
  assign adderPipeline_tempRes_0_translated_payload_yAddM = adderPipeline_tempRes_0_payload_yAddM;
  assign adderPipeline_tempRes_0_translated_payload_adderRes = oneBitFullAdderArraySim_1_adder_res_o;
  assign adderPipeline_tempRes_0_translated_payload_counter = (adderPipeline_tempRes_0_payload_counter + 6'h01);
  always @(*) begin
    adderPipeline_tempRes_0_translated_ready = adderPipeline_tempRes_0_translated_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      adderPipeline_tempRes_0_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! adderPipeline_tempRes_0_translated_m2sPipe_valid);
  assign adderPipeline_tempRes_0_translated_m2sPipe_valid = adderPipeline_tempRes_0_translated_rValid;
  assign adderPipeline_tempRes_0_translated_m2sPipe_payload_xTemp = adderPipeline_tempRes_0_translated_rData_xTemp;
  assign adderPipeline_tempRes_0_translated_m2sPipe_payload_yTemp = adderPipeline_tempRes_0_translated_rData_yTemp;
  assign adderPipeline_tempRes_0_translated_m2sPipe_payload_yAddM = adderPipeline_tempRes_0_translated_rData_yAddM;
  assign adderPipeline_tempRes_0_translated_m2sPipe_payload_adderRes = adderPipeline_tempRes_0_translated_rData_adderRes;
  assign adderPipeline_tempRes_0_translated_m2sPipe_payload_counter = adderPipeline_tempRes_0_translated_rData_counter;
  assign adderPipeline_tempRes_1_valid = adderPipeline_tempRes_0_translated_m2sPipe_valid;
  assign adderPipeline_tempRes_0_translated_m2sPipe_ready = adderPipeline_tempRes_1_ready;
  assign adderPipeline_tempRes_1_payload_xTemp = adderPipeline_tempRes_0_translated_m2sPipe_payload_xTemp;
  assign adderPipeline_tempRes_1_payload_yTemp = adderPipeline_tempRes_0_translated_m2sPipe_payload_yTemp;
  assign adderPipeline_tempRes_1_payload_yAddM = adderPipeline_tempRes_0_translated_m2sPipe_payload_yAddM;
  assign adderPipeline_tempRes_1_payload_adderRes = adderPipeline_tempRes_0_translated_m2sPipe_payload_adderRes;
  assign adderPipeline_tempRes_1_payload_counter = adderPipeline_tempRes_0_translated_m2sPipe_payload_counter;
  assign oneBitFullAdderArraySim_2_x_temp_i = adderPipeline_tempRes_1_payload_xTemp[4:0];
  assign adderPipeline_tempRes_1_translated_valid = adderPipeline_tempRes_1_valid;
  assign adderPipeline_tempRes_1_ready = adderPipeline_tempRes_1_translated_ready;
  assign adderPipeline_tempRes_1_translated_payload_xTemp = (adderPipeline_tempRes_1_payload_xTemp >>> 5);
  assign adderPipeline_tempRes_1_translated_payload_yTemp = adderPipeline_tempRes_1_payload_yTemp;
  assign adderPipeline_tempRes_1_translated_payload_yAddM = adderPipeline_tempRes_1_payload_yAddM;
  assign adderPipeline_tempRes_1_translated_payload_adderRes = oneBitFullAdderArraySim_2_adder_res_o;
  assign adderPipeline_tempRes_1_translated_payload_counter = (adderPipeline_tempRes_1_payload_counter + 6'h01);
  always @(*) begin
    adderPipeline_tempRes_1_translated_ready = adderPipeline_tempRes_1_translated_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      adderPipeline_tempRes_1_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! adderPipeline_tempRes_1_translated_m2sPipe_valid);
  assign adderPipeline_tempRes_1_translated_m2sPipe_valid = adderPipeline_tempRes_1_translated_rValid;
  assign adderPipeline_tempRes_1_translated_m2sPipe_payload_xTemp = adderPipeline_tempRes_1_translated_rData_xTemp;
  assign adderPipeline_tempRes_1_translated_m2sPipe_payload_yTemp = adderPipeline_tempRes_1_translated_rData_yTemp;
  assign adderPipeline_tempRes_1_translated_m2sPipe_payload_yAddM = adderPipeline_tempRes_1_translated_rData_yAddM;
  assign adderPipeline_tempRes_1_translated_m2sPipe_payload_adderRes = adderPipeline_tempRes_1_translated_rData_adderRes;
  assign adderPipeline_tempRes_1_translated_m2sPipe_payload_counter = adderPipeline_tempRes_1_translated_rData_counter;
  assign adderPipeline_tempRes_2_valid = adderPipeline_tempRes_1_translated_m2sPipe_valid;
  assign adderPipeline_tempRes_1_translated_m2sPipe_ready = adderPipeline_tempRes_2_ready;
  assign adderPipeline_tempRes_2_payload_xTemp = adderPipeline_tempRes_1_translated_m2sPipe_payload_xTemp;
  assign adderPipeline_tempRes_2_payload_yTemp = adderPipeline_tempRes_1_translated_m2sPipe_payload_yTemp;
  assign adderPipeline_tempRes_2_payload_yAddM = adderPipeline_tempRes_1_translated_m2sPipe_payload_yAddM;
  assign adderPipeline_tempRes_2_payload_adderRes = adderPipeline_tempRes_1_translated_m2sPipe_payload_adderRes;
  assign adderPipeline_tempRes_2_payload_counter = adderPipeline_tempRes_1_translated_m2sPipe_payload_counter;
  assign oneBitFullAdderArraySim_3_x_temp_i = adderPipeline_tempRes_2_payload_xTemp[4:0];
  assign adderPipeline_tempRes_2_translated_valid = adderPipeline_tempRes_2_valid;
  assign adderPipeline_tempRes_2_ready = adderPipeline_tempRes_2_translated_ready;
  assign adderPipeline_tempRes_2_translated_payload_xTemp = (adderPipeline_tempRes_2_payload_xTemp >>> 5);
  assign adderPipeline_tempRes_2_translated_payload_yTemp = adderPipeline_tempRes_2_payload_yTemp;
  assign adderPipeline_tempRes_2_translated_payload_yAddM = adderPipeline_tempRes_2_payload_yAddM;
  assign adderPipeline_tempRes_2_translated_payload_adderRes = oneBitFullAdderArraySim_3_adder_res_o;
  assign adderPipeline_tempRes_2_translated_payload_counter = (adderPipeline_tempRes_2_payload_counter + 6'h01);
  always @(*) begin
    adderPipeline_tempRes_2_translated_ready = adderPipeline_tempRes_2_translated_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      adderPipeline_tempRes_2_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! adderPipeline_tempRes_2_translated_m2sPipe_valid);
  assign adderPipeline_tempRes_2_translated_m2sPipe_valid = adderPipeline_tempRes_2_translated_rValid;
  assign adderPipeline_tempRes_2_translated_m2sPipe_payload_xTemp = adderPipeline_tempRes_2_translated_rData_xTemp;
  assign adderPipeline_tempRes_2_translated_m2sPipe_payload_yTemp = adderPipeline_tempRes_2_translated_rData_yTemp;
  assign adderPipeline_tempRes_2_translated_m2sPipe_payload_yAddM = adderPipeline_tempRes_2_translated_rData_yAddM;
  assign adderPipeline_tempRes_2_translated_m2sPipe_payload_adderRes = adderPipeline_tempRes_2_translated_rData_adderRes;
  assign adderPipeline_tempRes_2_translated_m2sPipe_payload_counter = adderPipeline_tempRes_2_translated_rData_counter;
  assign adderPipeline_tempRes_3_valid = adderPipeline_tempRes_2_translated_m2sPipe_valid;
  assign adderPipeline_tempRes_2_translated_m2sPipe_ready = adderPipeline_tempRes_3_ready;
  assign adderPipeline_tempRes_3_payload_xTemp = adderPipeline_tempRes_2_translated_m2sPipe_payload_xTemp;
  assign adderPipeline_tempRes_3_payload_yTemp = adderPipeline_tempRes_2_translated_m2sPipe_payload_yTemp;
  assign adderPipeline_tempRes_3_payload_yAddM = adderPipeline_tempRes_2_translated_m2sPipe_payload_yAddM;
  assign adderPipeline_tempRes_3_payload_adderRes = adderPipeline_tempRes_2_translated_m2sPipe_payload_adderRes;
  assign adderPipeline_tempRes_3_payload_counter = adderPipeline_tempRes_2_translated_m2sPipe_payload_counter;
  assign adderPipeline_select = (adderPipeline_tempRes_3_valid && (adderPipeline_tempRes_3_payload_counter == 6'h33));
  assign adderPipeline_tempRes_3_ready = streamDemux_50_io_input_ready;
  assign streamDemux_50_io_select = adderPipeline_select;
  assign streamDemux_50_io_outputs_0_ready = (! streamDemux_50_io_outputs_0_rValid);
  assign streamDemux_50_io_outputs_0_s2mPipe_valid = (streamDemux_50_io_outputs_0_valid || streamDemux_50_io_outputs_0_rValid);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_xTemp = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_xTemp : streamDemux_50_io_outputs_0_payload_xTemp);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_yTemp = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_yTemp : streamDemux_50_io_outputs_0_payload_yTemp);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_yAddM = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_yAddM : streamDemux_50_io_outputs_0_payload_yAddM);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_adderRes = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_adderRes : streamDemux_50_io_outputs_0_payload_adderRes);
  assign streamDemux_50_io_outputs_0_s2mPipe_payload_counter = (streamDemux_50_io_outputs_0_rValid ? streamDemux_50_io_outputs_0_rData_counter : streamDemux_50_io_outputs_0_payload_counter);
  assign adderPipeline_loopback_valid = streamDemux_50_io_outputs_0_s2mPipe_valid;
  assign streamDemux_50_io_outputs_0_s2mPipe_ready = adderPipeline_loopback_ready;
  assign adderPipeline_loopback_payload_xTemp = streamDemux_50_io_outputs_0_s2mPipe_payload_xTemp;
  assign adderPipeline_loopback_payload_yTemp = streamDemux_50_io_outputs_0_s2mPipe_payload_yTemp;
  assign adderPipeline_loopback_payload_yAddM = streamDemux_50_io_outputs_0_s2mPipe_payload_yAddM;
  assign adderPipeline_loopback_payload_adderRes = streamDemux_50_io_outputs_0_s2mPipe_payload_adderRes;
  assign adderPipeline_loopback_payload_counter = streamDemux_50_io_outputs_0_s2mPipe_payload_counter;
  assign resCombination_tempRes = ({1'b0,_zz_resCombination_tempRes} + {1'b0,255'h0c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff});
  assign when_MontMultiplierPiped_l236 = (resCombination_tempRes[255] || streamDemux_50_io_outputs_1_payload_adderRes[255]);
  always @(*) begin
    if(when_MontMultiplierPiped_l236) begin
      resCombination_output_payload_res = resCombination_tempRes[254:0];
    end else begin
      resCombination_output_payload_res = streamDemux_50_io_outputs_1_payload_adderRes[254:0];
    end
  end

  assign resCombination_output_valid = streamDemux_50_io_outputs_1_valid;
  always @(*) begin
    resCombination_output_ready = resCombination_output_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      resCombination_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! resCombination_output_m2sPipe_valid);
  assign resCombination_output_m2sPipe_valid = resCombination_output_rValid;
  assign resCombination_output_m2sPipe_payload_res = resCombination_output_rData_res;
  assign io_output_valid = resCombination_output_m2sPipe_valid;
  assign resCombination_output_m2sPipe_ready = io_output_ready;
  assign io_output_payload_res = resCombination_output_m2sPipe_payload_res;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_input_translated_rValid <= 1'b0;
      adderPipeline_tempRes_0_translated_rValid <= 1'b0;
      adderPipeline_tempRes_1_translated_rValid <= 1'b0;
      adderPipeline_tempRes_2_translated_rValid <= 1'b0;
      streamDemux_50_io_outputs_0_rValid <= 1'b0;
      resCombination_output_rValid <= 1'b0;
    end else begin
      if(io_input_translated_ready) begin
        io_input_translated_rValid <= io_input_translated_valid;
      end
      if(adderPipeline_tempRes_0_translated_ready) begin
        adderPipeline_tempRes_0_translated_rValid <= adderPipeline_tempRes_0_translated_valid;
      end
      if(adderPipeline_tempRes_1_translated_ready) begin
        adderPipeline_tempRes_1_translated_rValid <= adderPipeline_tempRes_1_translated_valid;
      end
      if(adderPipeline_tempRes_2_translated_ready) begin
        adderPipeline_tempRes_2_translated_rValid <= adderPipeline_tempRes_2_translated_valid;
      end
      if(streamDemux_50_io_outputs_0_valid) begin
        streamDemux_50_io_outputs_0_rValid <= 1'b1;
      end
      if(streamDemux_50_io_outputs_0_s2mPipe_ready) begin
        streamDemux_50_io_outputs_0_rValid <= 1'b0;
      end
      if(resCombination_output_ready) begin
        resCombination_output_rValid <= resCombination_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(io_input_translated_ready) begin
      io_input_translated_rData_xTemp <= io_input_translated_payload_xTemp;
      io_input_translated_rData_yTemp <= io_input_translated_payload_yTemp;
      io_input_translated_rData_yAddM <= io_input_translated_payload_yAddM;
      io_input_translated_rData_adderRes <= io_input_translated_payload_adderRes;
      io_input_translated_rData_counter <= io_input_translated_payload_counter;
    end
    if(adderPipeline_tempRes_0_translated_ready) begin
      adderPipeline_tempRes_0_translated_rData_xTemp <= adderPipeline_tempRes_0_translated_payload_xTemp;
      adderPipeline_tempRes_0_translated_rData_yTemp <= adderPipeline_tempRes_0_translated_payload_yTemp;
      adderPipeline_tempRes_0_translated_rData_yAddM <= adderPipeline_tempRes_0_translated_payload_yAddM;
      adderPipeline_tempRes_0_translated_rData_adderRes <= adderPipeline_tempRes_0_translated_payload_adderRes;
      adderPipeline_tempRes_0_translated_rData_counter <= adderPipeline_tempRes_0_translated_payload_counter;
    end
    if(adderPipeline_tempRes_1_translated_ready) begin
      adderPipeline_tempRes_1_translated_rData_xTemp <= adderPipeline_tempRes_1_translated_payload_xTemp;
      adderPipeline_tempRes_1_translated_rData_yTemp <= adderPipeline_tempRes_1_translated_payload_yTemp;
      adderPipeline_tempRes_1_translated_rData_yAddM <= adderPipeline_tempRes_1_translated_payload_yAddM;
      adderPipeline_tempRes_1_translated_rData_adderRes <= adderPipeline_tempRes_1_translated_payload_adderRes;
      adderPipeline_tempRes_1_translated_rData_counter <= adderPipeline_tempRes_1_translated_payload_counter;
    end
    if(adderPipeline_tempRes_2_translated_ready) begin
      adderPipeline_tempRes_2_translated_rData_xTemp <= adderPipeline_tempRes_2_translated_payload_xTemp;
      adderPipeline_tempRes_2_translated_rData_yTemp <= adderPipeline_tempRes_2_translated_payload_yTemp;
      adderPipeline_tempRes_2_translated_rData_yAddM <= adderPipeline_tempRes_2_translated_payload_yAddM;
      adderPipeline_tempRes_2_translated_rData_adderRes <= adderPipeline_tempRes_2_translated_payload_adderRes;
      adderPipeline_tempRes_2_translated_rData_counter <= adderPipeline_tempRes_2_translated_payload_counter;
    end
    if(streamDemux_50_io_outputs_0_ready) begin
      streamDemux_50_io_outputs_0_rData_xTemp <= streamDemux_50_io_outputs_0_payload_xTemp;
      streamDemux_50_io_outputs_0_rData_yTemp <= streamDemux_50_io_outputs_0_payload_yTemp;
      streamDemux_50_io_outputs_0_rData_yAddM <= streamDemux_50_io_outputs_0_payload_yAddM;
      streamDemux_50_io_outputs_0_rData_adderRes <= streamDemux_50_io_outputs_0_payload_adderRes;
      streamDemux_50_io_outputs_0_rData_counter <= streamDemux_50_io_outputs_0_payload_counter;
    end
    if(resCombination_output_ready) begin
      resCombination_output_rData_res <= resCombination_output_payload_res;
    end
  end


endmodule

module StreamFork_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [254:0]  io_input_payload,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [254:0]  io_outputs_0_payload,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [254:0]  io_outputs_1_payload,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [254:0]  io_outputs_2_payload,
  output              io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [254:0]  io_outputs_3_payload,
  output              io_outputs_4_valid,
  input               io_outputs_4_ready,
  output     [254:0]  io_outputs_4_payload,
  output              io_outputs_5_valid,
  input               io_outputs_5_ready,
  output     [254:0]  io_outputs_5_payload,
  output              io_outputs_6_valid,
  input               io_outputs_6_ready,
  output     [254:0]  io_outputs_6_payload,
  output              io_outputs_7_valid,
  input               io_outputs_7_ready,
  output     [254:0]  io_outputs_7_payload,
  output              io_outputs_8_valid,
  input               io_outputs_8_ready,
  output     [254:0]  io_outputs_8_payload,
  output              io_outputs_9_valid,
  input               io_outputs_9_ready,
  output     [254:0]  io_outputs_9_payload,
  output              io_outputs_10_valid,
  input               io_outputs_10_ready,
  output     [254:0]  io_outputs_10_payload,
  output              io_outputs_11_valid,
  input               io_outputs_11_ready,
  output     [254:0]  io_outputs_11_payload
);

  assign io_input_ready = (((((((((((io_outputs_0_ready && io_outputs_1_ready) && io_outputs_2_ready) && io_outputs_3_ready) && io_outputs_4_ready) && io_outputs_5_ready) && io_outputs_6_ready) && io_outputs_7_ready) && io_outputs_8_ready) && io_outputs_9_ready) && io_outputs_10_ready) && io_outputs_11_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_2_valid = (io_input_valid && io_input_ready);
  assign io_outputs_3_valid = (io_input_valid && io_input_ready);
  assign io_outputs_4_valid = (io_input_valid && io_input_ready);
  assign io_outputs_5_valid = (io_input_valid && io_input_ready);
  assign io_outputs_6_valid = (io_input_valid && io_input_ready);
  assign io_outputs_7_valid = (io_input_valid && io_input_ready);
  assign io_outputs_8_valid = (io_input_valid && io_input_ready);
  assign io_outputs_9_valid = (io_input_valid && io_input_ready);
  assign io_outputs_10_valid = (io_input_valid && io_input_ready);
  assign io_outputs_11_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload = io_input_payload;
  assign io_outputs_1_payload = io_input_payload;
  assign io_outputs_2_payload = io_input_payload;
  assign io_outputs_3_payload = io_input_payload;
  assign io_outputs_4_payload = io_input_payload;
  assign io_outputs_5_payload = io_input_payload;
  assign io_outputs_6_payload = io_input_payload;
  assign io_outputs_7_payload = io_input_payload;
  assign io_outputs_8_payload = io_input_payload;
  assign io_outputs_9_payload = io_input_payload;
  assign io_outputs_10_payload = io_input_payload;
  assign io_outputs_11_payload = io_input_payload;

endmodule

module StreamFork (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [6:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [6:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [6:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element
);

  assign io_input_ready = (io_outputs_0_ready && io_outputs_1_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload_round_index = io_input_payload_round_index;
  assign io_outputs_0_payload_state_index = io_input_payload_state_index;
  assign io_outputs_0_payload_state_size = io_input_payload_state_size;
  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_element = io_input_payload_state_element;
  assign io_outputs_1_payload_round_index = io_input_payload_round_index;
  assign io_outputs_1_payload_state_index = io_input_payload_state_index;
  assign io_outputs_1_payload_state_size = io_input_payload_state_size;
  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_element = io_input_payload_state_element;

endmodule

module MDSMatrix_3 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  output     [254:0]  io_dataPorts_5,
  output     [254:0]  io_dataPorts_6,
  output     [254:0]  io_dataPorts_7,
  output     [254:0]  io_dataPorts_8,
  output     [254:0]  io_dataPorts_9,
  output     [254:0]  io_dataPorts_10,
  output     [254:0]  io_dataPorts_11,
  input      [3:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  wire       [254:0]  _zz_mdsRoms_5_port0;
  wire       [254:0]  _zz_mdsRoms_6_port0;
  wire       [254:0]  _zz_mdsRoms_7_port0;
  wire       [254:0]  _zz_mdsRoms_8_port0;
  wire       [254:0]  _zz_mdsRoms_9_port0;
  wire       [254:0]  _zz_mdsRoms_10_port0;
  wire       [254:0]  _zz_mdsRoms_11_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_5 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_6 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_7 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_8 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_9 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_10 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_11 [0:11];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_5.bin",mdsRoms_5);
  end
  assign _zz_mdsRoms_5_port0 = mdsRoms_5[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_6.bin",mdsRoms_6);
  end
  assign _zz_mdsRoms_6_port0 = mdsRoms_6[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_7.bin",mdsRoms_7);
  end
  assign _zz_mdsRoms_7_port0 = mdsRoms_7[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_8.bin",mdsRoms_8);
  end
  assign _zz_mdsRoms_8_port0 = mdsRoms_8[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_9.bin",mdsRoms_9);
  end
  assign _zz_mdsRoms_9_port0 = mdsRoms_9[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_10.bin",mdsRoms_10);
  end
  assign _zz_mdsRoms_10_port0 = mdsRoms_10[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_15_mdsRoms_11.bin",mdsRoms_11);
  end
  assign _zz_mdsRoms_11_port0 = mdsRoms_11[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;
  assign io_dataPorts_5 = _zz_mdsRoms_5_port0;
  assign io_dataPorts_6 = _zz_mdsRoms_6_port0;
  assign io_dataPorts_7 = _zz_mdsRoms_7_port0;
  assign io_dataPorts_8 = _zz_mdsRoms_8_port0;
  assign io_dataPorts_9 = _zz_mdsRoms_9_port0;
  assign io_dataPorts_10 = _zz_mdsRoms_10_port0;
  assign io_dataPorts_11 = _zz_mdsRoms_11_port0;

endmodule

module MDSMatrix_2 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  output     [254:0]  io_dataPorts_5,
  output     [254:0]  io_dataPorts_6,
  output     [254:0]  io_dataPorts_7,
  output     [254:0]  io_dataPorts_8,
  input      [3:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  wire       [254:0]  _zz_mdsRoms_5_port0;
  wire       [254:0]  _zz_mdsRoms_6_port0;
  wire       [254:0]  _zz_mdsRoms_7_port0;
  wire       [254:0]  _zz_mdsRoms_8_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_5 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_6 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_7 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_8 [0:8];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_5.bin",mdsRoms_5);
  end
  assign _zz_mdsRoms_5_port0 = mdsRoms_5[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_6.bin",mdsRoms_6);
  end
  assign _zz_mdsRoms_6_port0 = mdsRoms_6[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_7.bin",mdsRoms_7);
  end
  assign _zz_mdsRoms_7_port0 = mdsRoms_7[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_14_mdsRoms_8.bin",mdsRoms_8);
  end
  assign _zz_mdsRoms_8_port0 = mdsRoms_8[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;
  assign io_dataPorts_5 = _zz_mdsRoms_5_port0;
  assign io_dataPorts_6 = _zz_mdsRoms_6_port0;
  assign io_dataPorts_7 = _zz_mdsRoms_7_port0;
  assign io_dataPorts_8 = _zz_mdsRoms_8_port0;

endmodule

module MDSMatrix_1 (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  output     [254:0]  io_dataPorts_3,
  output     [254:0]  io_dataPorts_4,
  input      [2:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  wire       [254:0]  _zz_mdsRoms_3_port0;
  wire       [254:0]  _zz_mdsRoms_4_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_3 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_4 [0:4];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_3.bin",mdsRoms_3);
  end
  assign _zz_mdsRoms_3_port0 = mdsRoms_3[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_13_mdsRoms_4.bin",mdsRoms_4);
  end
  assign _zz_mdsRoms_4_port0 = mdsRoms_4[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;
  assign io_dataPorts_3 = _zz_mdsRoms_3_port0;
  assign io_dataPorts_4 = _zz_mdsRoms_4_port0;

endmodule

module MDSMatrix (
  output     [254:0]  io_dataPorts_0,
  output     [254:0]  io_dataPorts_1,
  output     [254:0]  io_dataPorts_2,
  input      [1:0]    io_addressPort
);
  wire       [254:0]  _zz_mdsRoms_0_port0;
  wire       [254:0]  _zz_mdsRoms_1_port0;
  wire       [254:0]  _zz_mdsRoms_2_port0;
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_0 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_1 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mdsRoms_2 [0:2];

  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_0.bin",mdsRoms_0);
  end
  assign _zz_mdsRoms_0_port0 = mdsRoms_0[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_1.bin",mdsRoms_1);
  end
  assign _zz_mdsRoms_1_port0 = mdsRoms_1[io_addressPort];
  initial begin
    $readmemb("PoseidonTopLevel.v_toplevel_poseidonLoop_3_poseidonThread_3_mDSMatrixMultiplier_3_mDSMatrix_12_mdsRoms_2.bin",mdsRoms_2);
  end
  assign _zz_mdsRoms_2_port0 = mdsRoms_2[io_addressPort];
  assign io_dataPorts_0 = _zz_mdsRoms_0_port0;
  assign io_dataPorts_1 = _zz_mdsRoms_1_port0;
  assign io_dataPorts_2 = _zz_mdsRoms_2_port0;

endmodule

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

//StreamDemux replaced by StreamDemux

//StreamArbiter replaced by StreamArbiter

module StreamDemux (
  input      [0:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [254:0]  io_input_payload_xTemp,
  input      [254:0]  io_input_payload_yTemp,
  input      [255:0]  io_input_payload_yAddM,
  input      [255:0]  io_input_payload_adderRes,
  input      [5:0]    io_input_payload_counter,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [254:0]  io_outputs_0_payload_xTemp,
  output     [254:0]  io_outputs_0_payload_yTemp,
  output     [255:0]  io_outputs_0_payload_yAddM,
  output     [255:0]  io_outputs_0_payload_adderRes,
  output     [5:0]    io_outputs_0_payload_counter,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [254:0]  io_outputs_1_payload_xTemp,
  output     [254:0]  io_outputs_1_payload_yTemp,
  output     [255:0]  io_outputs_1_payload_yAddM,
  output     [255:0]  io_outputs_1_payload_adderRes,
  output     [5:0]    io_outputs_1_payload_counter
);
  wire                when_Stream_l745;
  wire                when_Stream_l745_1;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l745) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l745_1) begin
      io_input_ready = io_outputs_1_ready;
    end
  end

  assign io_outputs_0_payload_xTemp = io_input_payload_xTemp;
  assign io_outputs_0_payload_yTemp = io_input_payload_yTemp;
  assign io_outputs_0_payload_yAddM = io_input_payload_yAddM;
  assign io_outputs_0_payload_adderRes = io_input_payload_adderRes;
  assign io_outputs_0_payload_counter = io_input_payload_counter;
  assign when_Stream_l745 = (1'b0 != io_select);
  always @(*) begin
    if(when_Stream_l745) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_xTemp = io_input_payload_xTemp;
  assign io_outputs_1_payload_yTemp = io_input_payload_yTemp;
  assign io_outputs_1_payload_yAddM = io_input_payload_yAddM;
  assign io_outputs_1_payload_adderRes = io_input_payload_adderRes;
  assign io_outputs_1_payload_counter = io_input_payload_counter;
  assign when_Stream_l745_1 = (1'b1 != io_select);
  always @(*) begin
    if(when_Stream_l745_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end


endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [254:0]  io_inputs_0_payload_xTemp,
  input      [254:0]  io_inputs_0_payload_yTemp,
  input      [255:0]  io_inputs_0_payload_yAddM,
  input      [255:0]  io_inputs_0_payload_adderRes,
  input      [5:0]    io_inputs_0_payload_counter,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [254:0]  io_inputs_1_payload_xTemp,
  input      [254:0]  io_inputs_1_payload_yTemp,
  input      [255:0]  io_inputs_1_payload_yAddM,
  input      [255:0]  io_inputs_1_payload_adderRes,
  input      [5:0]    io_inputs_1_payload_counter,
  output              io_output_valid,
  input               io_output_ready,
  output     [254:0]  io_output_payload_xTemp,
  output     [254:0]  io_output_payload_yTemp,
  output     [255:0]  io_output_payload_yAddM,
  output     [255:0]  io_output_payload_adderRes,
  output     [5:0]    io_output_payload_counter,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               clk,
  input               reset
);
  wire       [1:0]    _zz_maskProposal_1_1;
  wire       [1:0]    _zz_maskProposal_1_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_1;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz_maskProposal_1_1 = (_zz_maskProposal_1 & (~ _zz_maskProposal_1_2));
  assign _zz_maskProposal_1_2 = (_zz_maskProposal_1 - 2'b01);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_maskProposal_1_1[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_xTemp = (maskRouted_0 ? io_inputs_0_payload_xTemp : io_inputs_1_payload_xTemp);
  assign io_output_payload_yTemp = (maskRouted_0 ? io_inputs_0_payload_yTemp : io_inputs_1_payload_yTemp);
  assign io_output_payload_yAddM = (maskRouted_0 ? io_inputs_0_payload_yAddM : io_inputs_1_payload_yAddM);
  assign io_output_payload_adderRes = (maskRouted_0 ? io_inputs_0_payload_adderRes : io_inputs_1_payload_adderRes);
  assign io_output_payload_counter = (maskRouted_0 ? io_inputs_0_payload_counter : io_inputs_1_payload_counter);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_output_valid) begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end


endmodule
