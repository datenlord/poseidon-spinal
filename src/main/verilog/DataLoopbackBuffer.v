// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : DataLoopbackBuffer



module DataLoopbackBuffer (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_size,
  input      [3:0]    io_input_payload_state_id,
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
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [3:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [3:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [6:0]    io_outputs_2_payload_round_index,
  output     [3:0]    io_outputs_2_payload_state_index,
  output     [3:0]    io_outputs_2_payload_state_size,
  output     [3:0]    io_outputs_2_payload_state_id,
  output     [254:0]  io_outputs_2_payload_state_element,
  output reg [3:0]    io_residue,
  input               clk,
  input               reset
);
  reg                 streamArbiter_9_io_output_ready;
  reg                 streamArbiter_10_io_output_ready;
  reg                 streamArbiter_11_io_output_ready;
  reg                 streamArbiter_12_io_output_ready;
  reg                 streamArbiter_13_io_output_ready;
  reg                 streamArbiter_14_io_output_ready;
  reg                 streamArbiter_15_io_output_ready;
  reg                 streamArbiter_16_io_output_ready;
  reg                 streamArbiter_17_io_output_ready;
  wire                streamArbiter_9_io_inputs_0_ready;
  wire                streamArbiter_9_io_inputs_1_ready;
  wire                streamArbiter_9_io_output_valid;
  wire       [6:0]    streamArbiter_9_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_9_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_9_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_9_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_9_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_9_io_chosen;
  wire       [1:0]    streamArbiter_9_io_chosenOH;
  wire                streamArbiter_10_io_inputs_0_ready;
  wire                streamArbiter_10_io_inputs_1_ready;
  wire                streamArbiter_10_io_output_valid;
  wire       [6:0]    streamArbiter_10_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_10_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_10_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_10_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_10_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_10_io_chosen;
  wire       [1:0]    streamArbiter_10_io_chosenOH;
  wire                streamArbiter_11_io_inputs_0_ready;
  wire                streamArbiter_11_io_inputs_1_ready;
  wire                streamArbiter_11_io_output_valid;
  wire       [6:0]    streamArbiter_11_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_11_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_11_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_11_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_11_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_11_io_chosen;
  wire       [1:0]    streamArbiter_11_io_chosenOH;
  wire                streamArbiter_12_io_inputs_0_ready;
  wire                streamArbiter_12_io_inputs_1_ready;
  wire                streamArbiter_12_io_output_valid;
  wire       [6:0]    streamArbiter_12_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_12_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_12_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_12_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_12_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_12_io_chosen;
  wire       [1:0]    streamArbiter_12_io_chosenOH;
  wire                streamArbiter_13_io_inputs_0_ready;
  wire                streamArbiter_13_io_inputs_1_ready;
  wire                streamArbiter_13_io_output_valid;
  wire       [6:0]    streamArbiter_13_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_13_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_13_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_13_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_13_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_13_io_chosen;
  wire       [1:0]    streamArbiter_13_io_chosenOH;
  wire                streamArbiter_14_io_inputs_0_ready;
  wire                streamArbiter_14_io_inputs_1_ready;
  wire                streamArbiter_14_io_output_valid;
  wire       [6:0]    streamArbiter_14_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_14_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_14_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_14_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_14_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_14_io_chosen;
  wire       [1:0]    streamArbiter_14_io_chosenOH;
  wire                streamArbiter_15_io_inputs_0_ready;
  wire                streamArbiter_15_io_inputs_1_ready;
  wire                streamArbiter_15_io_output_valid;
  wire       [6:0]    streamArbiter_15_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_15_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_15_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_15_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_15_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_15_io_chosen;
  wire       [1:0]    streamArbiter_15_io_chosenOH;
  wire                streamArbiter_16_io_inputs_0_ready;
  wire                streamArbiter_16_io_inputs_1_ready;
  wire                streamArbiter_16_io_output_valid;
  wire       [6:0]    streamArbiter_16_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_16_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_16_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_16_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_16_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_16_io_chosen;
  wire       [1:0]    streamArbiter_16_io_chosenOH;
  wire                streamArbiter_17_io_inputs_0_ready;
  wire                streamArbiter_17_io_inputs_1_ready;
  wire                streamArbiter_17_io_output_valid;
  wire       [6:0]    streamArbiter_17_io_output_payload_round_index;
  wire       [3:0]    streamArbiter_17_io_output_payload_state_index;
  wire       [3:0]    streamArbiter_17_io_output_payload_state_size;
  wire       [3:0]    streamArbiter_17_io_output_payload_state_id;
  wire       [254:0]  streamArbiter_17_io_output_payload_state_element;
  wire       [0:0]    streamArbiter_17_io_chosen;
  wire       [1:0]    streamArbiter_17_io_chosenOH;
  wire       [0:0]    _zz_io_input_ready;
  wire       [1:0]    _zz_io_input_ready_1;
  wire                buffer0_0_valid;
  wire                buffer0_0_ready;
  wire       [6:0]    buffer0_0_payload_round_index;
  wire       [3:0]    buffer0_0_payload_state_index;
  wire       [3:0]    buffer0_0_payload_state_size;
  wire       [3:0]    buffer0_0_payload_state_id;
  wire       [254:0]  buffer0_0_payload_state_element;
  wire                buffer0_1_valid;
  wire                buffer0_1_ready;
  wire       [6:0]    buffer0_1_payload_round_index;
  wire       [3:0]    buffer0_1_payload_state_index;
  wire       [3:0]    buffer0_1_payload_state_size;
  wire       [3:0]    buffer0_1_payload_state_id;
  wire       [254:0]  buffer0_1_payload_state_element;
  wire                buffer0_2_valid;
  wire                buffer0_2_ready;
  wire       [6:0]    buffer0_2_payload_round_index;
  wire       [3:0]    buffer0_2_payload_state_index;
  wire       [3:0]    buffer0_2_payload_state_size;
  wire       [3:0]    buffer0_2_payload_state_id;
  wire       [254:0]  buffer0_2_payload_state_element;
  wire                buffer1_0_valid;
  wire                buffer1_0_ready;
  wire       [6:0]    buffer1_0_payload_round_index;
  wire       [3:0]    buffer1_0_payload_state_index;
  wire       [3:0]    buffer1_0_payload_state_size;
  wire       [3:0]    buffer1_0_payload_state_id;
  wire       [254:0]  buffer1_0_payload_state_element;
  wire                buffer1_1_valid;
  wire                buffer1_1_ready;
  wire       [6:0]    buffer1_1_payload_round_index;
  wire       [3:0]    buffer1_1_payload_state_index;
  wire       [3:0]    buffer1_1_payload_state_size;
  wire       [3:0]    buffer1_1_payload_state_id;
  wire       [254:0]  buffer1_1_payload_state_element;
  wire                buffer1_2_valid;
  wire                buffer1_2_ready;
  wire       [6:0]    buffer1_2_payload_round_index;
  wire       [3:0]    buffer1_2_payload_state_index;
  wire       [3:0]    buffer1_2_payload_state_size;
  wire       [3:0]    buffer1_2_payload_state_id;
  wire       [254:0]  buffer1_2_payload_state_element;
  wire                buffer2_0_valid;
  wire                buffer2_0_ready;
  wire       [6:0]    buffer2_0_payload_round_index;
  wire       [3:0]    buffer2_0_payload_state_index;
  wire       [3:0]    buffer2_0_payload_state_size;
  wire       [3:0]    buffer2_0_payload_state_id;
  wire       [254:0]  buffer2_0_payload_state_element;
  wire                buffer2_1_valid;
  wire                buffer2_1_ready;
  wire       [6:0]    buffer2_1_payload_round_index;
  wire       [3:0]    buffer2_1_payload_state_index;
  wire       [3:0]    buffer2_1_payload_state_size;
  wire       [3:0]    buffer2_1_payload_state_id;
  wire       [254:0]  buffer2_1_payload_state_element;
  wire                buffer2_2_valid;
  wire                buffer2_2_ready;
  wire       [6:0]    buffer2_2_payload_round_index;
  wire       [3:0]    buffer2_2_payload_state_index;
  wire       [3:0]    buffer2_2_payload_state_size;
  wire       [3:0]    buffer2_2_payload_state_id;
  wire       [254:0]  buffer2_2_payload_state_element;
  wire                buffer3_0_valid;
  reg                 buffer3_0_ready;
  wire       [6:0]    buffer3_0_payload_round_index;
  wire       [3:0]    buffer3_0_payload_state_index;
  wire       [3:0]    buffer3_0_payload_state_size;
  wire       [3:0]    buffer3_0_payload_state_id;
  wire       [254:0]  buffer3_0_payload_state_element;
  wire                buffer3_1_valid;
  reg                 buffer3_1_ready;
  wire       [6:0]    buffer3_1_payload_round_index;
  wire       [3:0]    buffer3_1_payload_state_index;
  wire       [3:0]    buffer3_1_payload_state_size;
  wire       [3:0]    buffer3_1_payload_state_id;
  wire       [254:0]  buffer3_1_payload_state_element;
  wire                buffer3_2_valid;
  reg                 buffer3_2_ready;
  wire       [6:0]    buffer3_2_payload_round_index;
  wire       [3:0]    buffer3_2_payload_state_index;
  wire       [3:0]    buffer3_2_payload_state_size;
  wire       [3:0]    buffer3_2_payload_state_id;
  wire       [254:0]  buffer3_2_payload_state_element;
  wire                inputs_0_valid;
  reg                 inputs_0_ready;
  wire       [6:0]    inputs_0_payload_round_index;
  wire       [3:0]    inputs_0_payload_state_index;
  wire       [3:0]    inputs_0_payload_state_size;
  wire       [3:0]    inputs_0_payload_state_id;
  wire       [254:0]  inputs_0_payload_state_element;
  wire                inputs_1_valid;
  reg                 inputs_1_ready;
  wire       [6:0]    inputs_1_payload_round_index;
  wire       [3:0]    inputs_1_payload_state_index;
  wire       [3:0]    inputs_1_payload_state_size;
  wire       [3:0]    inputs_1_payload_state_id;
  wire       [254:0]  inputs_1_payload_state_element;
  wire                inputs_2_valid;
  reg                 inputs_2_ready;
  wire       [6:0]    inputs_2_payload_round_index;
  wire       [3:0]    inputs_2_payload_state_index;
  wire       [3:0]    inputs_2_payload_state_size;
  wire       [3:0]    inputs_2_payload_state_id;
  wire       [254:0]  inputs_2_payload_state_element;
  wire                inputs_3_valid;
  reg                 inputs_3_ready;
  wire       [6:0]    inputs_3_payload_round_index;
  wire       [3:0]    inputs_3_payload_state_index;
  wire       [3:0]    inputs_3_payload_state_size;
  wire       [3:0]    inputs_3_payload_state_id;
  wire       [254:0]  inputs_3_payload_state_element;
  wire                inputs_4_valid;
  reg                 inputs_4_ready;
  wire       [6:0]    inputs_4_payload_round_index;
  wire       [3:0]    inputs_4_payload_state_index;
  wire       [3:0]    inputs_4_payload_state_size;
  wire       [3:0]    inputs_4_payload_state_id;
  wire       [254:0]  inputs_4_payload_state_element;
  wire                inputs_5_valid;
  reg                 inputs_5_ready;
  wire       [6:0]    inputs_5_payload_round_index;
  wire       [3:0]    inputs_5_payload_state_index;
  wire       [3:0]    inputs_5_payload_state_size;
  wire       [3:0]    inputs_5_payload_state_id;
  wire       [254:0]  inputs_5_payload_state_element;
  wire                inputs_6_valid;
  reg                 inputs_6_ready;
  wire       [6:0]    inputs_6_payload_round_index;
  wire       [3:0]    inputs_6_payload_state_index;
  wire       [3:0]    inputs_6_payload_state_size;
  wire       [3:0]    inputs_6_payload_state_id;
  wire       [254:0]  inputs_6_payload_state_element;
  wire                inputs_7_valid;
  reg                 inputs_7_ready;
  wire       [6:0]    inputs_7_payload_round_index;
  wire       [3:0]    inputs_7_payload_state_index;
  wire       [3:0]    inputs_7_payload_state_size;
  wire       [3:0]    inputs_7_payload_state_id;
  wire       [254:0]  inputs_7_payload_state_element;
  wire                inputs_8_valid;
  reg                 inputs_8_ready;
  wire       [6:0]    inputs_8_payload_round_index;
  wire       [3:0]    inputs_8_payload_state_index;
  wire       [3:0]    inputs_8_payload_state_size;
  wire       [3:0]    inputs_8_payload_state_id;
  wire       [254:0]  inputs_8_payload_state_element;
  wire                inputs_9_valid;
  reg                 inputs_9_ready;
  wire       [6:0]    inputs_9_payload_round_index;
  wire       [3:0]    inputs_9_payload_state_index;
  wire       [3:0]    inputs_9_payload_state_size;
  wire       [3:0]    inputs_9_payload_state_id;
  wire       [254:0]  inputs_9_payload_state_element;
  wire                inputs_10_valid;
  reg                 inputs_10_ready;
  wire       [6:0]    inputs_10_payload_round_index;
  wire       [3:0]    inputs_10_payload_state_index;
  wire       [3:0]    inputs_10_payload_state_size;
  wire       [3:0]    inputs_10_payload_state_id;
  wire       [254:0]  inputs_10_payload_state_element;
  wire                inputs_11_valid;
  reg                 inputs_11_ready;
  wire       [6:0]    inputs_11_payload_round_index;
  wire       [3:0]    inputs_11_payload_state_index;
  wire       [3:0]    inputs_11_payload_state_size;
  wire       [3:0]    inputs_11_payload_state_id;
  wire       [254:0]  inputs_11_payload_state_element;
  wire                inputs_0_m2sPipe_valid;
  wire                inputs_0_m2sPipe_ready;
  wire       [6:0]    inputs_0_m2sPipe_payload_round_index;
  wire       [3:0]    inputs_0_m2sPipe_payload_state_index;
  wire       [3:0]    inputs_0_m2sPipe_payload_state_size;
  wire       [3:0]    inputs_0_m2sPipe_payload_state_id;
  wire       [254:0]  inputs_0_m2sPipe_payload_state_element;
  reg                 inputs_0_rValid;
  reg        [6:0]    inputs_0_rData_round_index;
  reg        [3:0]    inputs_0_rData_state_index;
  reg        [3:0]    inputs_0_rData_state_size;
  reg        [3:0]    inputs_0_rData_state_id;
  reg        [254:0]  inputs_0_rData_state_element;
  wire                when_Stream_l342;
  wire                when_Stream_l408;
  reg                 inputs_3_thrown_valid;
  wire                inputs_3_thrown_ready;
  wire       [6:0]    inputs_3_thrown_payload_round_index;
  wire       [3:0]    inputs_3_thrown_payload_state_index;
  wire       [3:0]    inputs_3_thrown_payload_state_size;
  wire       [3:0]    inputs_3_thrown_payload_state_id;
  wire       [254:0]  inputs_3_thrown_payload_state_element;
  wire                streamArbiter_9_io_output_m2sPipe_valid;
  wire                streamArbiter_9_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_9_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_9_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_9_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_9_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_9_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_9_io_output_rValid;
  reg        [6:0]    streamArbiter_9_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_9_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_9_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_9_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_9_io_output_rData_state_element;
  wire                when_Stream_l342_1;
  wire                when_Stream_l408_1;
  reg                 inputs_6_thrown_valid;
  wire                inputs_6_thrown_ready;
  wire       [6:0]    inputs_6_thrown_payload_round_index;
  wire       [3:0]    inputs_6_thrown_payload_state_index;
  wire       [3:0]    inputs_6_thrown_payload_state_size;
  wire       [3:0]    inputs_6_thrown_payload_state_id;
  wire       [254:0]  inputs_6_thrown_payload_state_element;
  wire                streamArbiter_10_io_output_m2sPipe_valid;
  wire                streamArbiter_10_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_10_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_10_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_10_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_10_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_10_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_10_io_output_rValid;
  reg        [6:0]    streamArbiter_10_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_10_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_10_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_10_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_10_io_output_rData_state_element;
  wire                when_Stream_l342_2;
  wire                when_Stream_l408_2;
  reg                 inputs_9_thrown_valid;
  wire                inputs_9_thrown_ready;
  wire       [6:0]    inputs_9_thrown_payload_round_index;
  wire       [3:0]    inputs_9_thrown_payload_state_index;
  wire       [3:0]    inputs_9_thrown_payload_state_size;
  wire       [3:0]    inputs_9_thrown_payload_state_id;
  wire       [254:0]  inputs_9_thrown_payload_state_element;
  wire                streamArbiter_11_io_output_m2sPipe_valid;
  wire                streamArbiter_11_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_11_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_11_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_11_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_11_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_11_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_11_io_output_rValid;
  reg        [6:0]    streamArbiter_11_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_11_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_11_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_11_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_11_io_output_rData_state_element;
  wire                when_Stream_l342_3;
  wire                inputs_1_m2sPipe_valid;
  wire                inputs_1_m2sPipe_ready;
  wire       [6:0]    inputs_1_m2sPipe_payload_round_index;
  wire       [3:0]    inputs_1_m2sPipe_payload_state_index;
  wire       [3:0]    inputs_1_m2sPipe_payload_state_size;
  wire       [3:0]    inputs_1_m2sPipe_payload_state_id;
  wire       [254:0]  inputs_1_m2sPipe_payload_state_element;
  reg                 inputs_1_rValid;
  reg        [6:0]    inputs_1_rData_round_index;
  reg        [3:0]    inputs_1_rData_state_index;
  reg        [3:0]    inputs_1_rData_state_size;
  reg        [3:0]    inputs_1_rData_state_id;
  reg        [254:0]  inputs_1_rData_state_element;
  wire                when_Stream_l342_4;
  wire                when_Stream_l408_3;
  reg                 inputs_4_thrown_valid;
  wire                inputs_4_thrown_ready;
  wire       [6:0]    inputs_4_thrown_payload_round_index;
  wire       [3:0]    inputs_4_thrown_payload_state_index;
  wire       [3:0]    inputs_4_thrown_payload_state_size;
  wire       [3:0]    inputs_4_thrown_payload_state_id;
  wire       [254:0]  inputs_4_thrown_payload_state_element;
  wire                streamArbiter_12_io_output_m2sPipe_valid;
  wire                streamArbiter_12_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_12_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_12_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_12_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_12_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_12_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_12_io_output_rValid;
  reg        [6:0]    streamArbiter_12_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_12_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_12_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_12_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_12_io_output_rData_state_element;
  wire                when_Stream_l342_5;
  wire                when_Stream_l408_4;
  reg                 inputs_7_thrown_valid;
  wire                inputs_7_thrown_ready;
  wire       [6:0]    inputs_7_thrown_payload_round_index;
  wire       [3:0]    inputs_7_thrown_payload_state_index;
  wire       [3:0]    inputs_7_thrown_payload_state_size;
  wire       [3:0]    inputs_7_thrown_payload_state_id;
  wire       [254:0]  inputs_7_thrown_payload_state_element;
  wire                streamArbiter_13_io_output_m2sPipe_valid;
  wire                streamArbiter_13_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_13_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_13_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_13_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_13_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_13_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_13_io_output_rValid;
  reg        [6:0]    streamArbiter_13_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_13_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_13_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_13_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_13_io_output_rData_state_element;
  wire                when_Stream_l342_6;
  wire                when_Stream_l408_5;
  reg                 inputs_10_thrown_valid;
  wire                inputs_10_thrown_ready;
  wire       [6:0]    inputs_10_thrown_payload_round_index;
  wire       [3:0]    inputs_10_thrown_payload_state_index;
  wire       [3:0]    inputs_10_thrown_payload_state_size;
  wire       [3:0]    inputs_10_thrown_payload_state_id;
  wire       [254:0]  inputs_10_thrown_payload_state_element;
  wire                streamArbiter_14_io_output_m2sPipe_valid;
  wire                streamArbiter_14_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_14_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_14_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_14_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_14_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_14_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_14_io_output_rValid;
  reg        [6:0]    streamArbiter_14_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_14_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_14_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_14_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_14_io_output_rData_state_element;
  wire                when_Stream_l342_7;
  wire                inputs_2_m2sPipe_valid;
  wire                inputs_2_m2sPipe_ready;
  wire       [6:0]    inputs_2_m2sPipe_payload_round_index;
  wire       [3:0]    inputs_2_m2sPipe_payload_state_index;
  wire       [3:0]    inputs_2_m2sPipe_payload_state_size;
  wire       [3:0]    inputs_2_m2sPipe_payload_state_id;
  wire       [254:0]  inputs_2_m2sPipe_payload_state_element;
  reg                 inputs_2_rValid;
  reg        [6:0]    inputs_2_rData_round_index;
  reg        [3:0]    inputs_2_rData_state_index;
  reg        [3:0]    inputs_2_rData_state_size;
  reg        [3:0]    inputs_2_rData_state_id;
  reg        [254:0]  inputs_2_rData_state_element;
  wire                when_Stream_l342_8;
  wire                when_Stream_l408_6;
  reg                 inputs_5_thrown_valid;
  wire                inputs_5_thrown_ready;
  wire       [6:0]    inputs_5_thrown_payload_round_index;
  wire       [3:0]    inputs_5_thrown_payload_state_index;
  wire       [3:0]    inputs_5_thrown_payload_state_size;
  wire       [3:0]    inputs_5_thrown_payload_state_id;
  wire       [254:0]  inputs_5_thrown_payload_state_element;
  wire                streamArbiter_15_io_output_m2sPipe_valid;
  wire                streamArbiter_15_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_15_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_15_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_15_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_15_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_15_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_15_io_output_rValid;
  reg        [6:0]    streamArbiter_15_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_15_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_15_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_15_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_15_io_output_rData_state_element;
  wire                when_Stream_l342_9;
  wire                when_Stream_l408_7;
  reg                 inputs_8_thrown_valid;
  wire                inputs_8_thrown_ready;
  wire       [6:0]    inputs_8_thrown_payload_round_index;
  wire       [3:0]    inputs_8_thrown_payload_state_index;
  wire       [3:0]    inputs_8_thrown_payload_state_size;
  wire       [3:0]    inputs_8_thrown_payload_state_id;
  wire       [254:0]  inputs_8_thrown_payload_state_element;
  wire                streamArbiter_16_io_output_m2sPipe_valid;
  wire                streamArbiter_16_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_16_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_16_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_16_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_16_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_16_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_16_io_output_rValid;
  reg        [6:0]    streamArbiter_16_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_16_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_16_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_16_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_16_io_output_rData_state_element;
  wire                when_Stream_l342_10;
  wire                when_Stream_l408_8;
  reg                 inputs_11_thrown_valid;
  wire                inputs_11_thrown_ready;
  wire       [6:0]    inputs_11_thrown_payload_round_index;
  wire       [3:0]    inputs_11_thrown_payload_state_index;
  wire       [3:0]    inputs_11_thrown_payload_state_size;
  wire       [3:0]    inputs_11_thrown_payload_state_id;
  wire       [254:0]  inputs_11_thrown_payload_state_element;
  wire                streamArbiter_17_io_output_m2sPipe_valid;
  wire                streamArbiter_17_io_output_m2sPipe_ready;
  wire       [6:0]    streamArbiter_17_io_output_m2sPipe_payload_round_index;
  wire       [3:0]    streamArbiter_17_io_output_m2sPipe_payload_state_index;
  wire       [3:0]    streamArbiter_17_io_output_m2sPipe_payload_state_size;
  wire       [3:0]    streamArbiter_17_io_output_m2sPipe_payload_state_id;
  wire       [254:0]  streamArbiter_17_io_output_m2sPipe_payload_state_element;
  reg                 streamArbiter_17_io_output_rValid;
  reg        [6:0]    streamArbiter_17_io_output_rData_round_index;
  reg        [3:0]    streamArbiter_17_io_output_rData_state_index;
  reg        [3:0]    streamArbiter_17_io_output_rData_state_size;
  reg        [3:0]    streamArbiter_17_io_output_rData_state_id;
  reg        [254:0]  streamArbiter_17_io_output_rData_state_element;
  wire                when_Stream_l342_11;
  wire                buffers_0_0_valid;
  reg                 buffers_0_0_ready;
  wire       [6:0]    buffers_0_0_payload_round_index;
  wire       [3:0]    buffers_0_0_payload_state_index;
  wire       [3:0]    buffers_0_0_payload_state_size;
  wire       [3:0]    buffers_0_0_payload_state_id;
  wire       [254:0]  buffers_0_0_payload_state_element;
  wire                buffers_0_1_valid;
  reg                 buffers_0_1_ready;
  wire       [6:0]    buffers_0_1_payload_round_index;
  wire       [3:0]    buffers_0_1_payload_state_index;
  wire       [3:0]    buffers_0_1_payload_state_size;
  wire       [3:0]    buffers_0_1_payload_state_id;
  wire       [254:0]  buffers_0_1_payload_state_element;
  wire                buffers_0_2_valid;
  reg                 buffers_0_2_ready;
  wire       [6:0]    buffers_0_2_payload_round_index;
  wire       [3:0]    buffers_0_2_payload_state_index;
  wire       [3:0]    buffers_0_2_payload_state_size;
  wire       [3:0]    buffers_0_2_payload_state_id;
  wire       [254:0]  buffers_0_2_payload_state_element;
  wire                buffers_1_0_valid;
  reg                 buffers_1_0_ready;
  wire       [6:0]    buffers_1_0_payload_round_index;
  wire       [3:0]    buffers_1_0_payload_state_index;
  wire       [3:0]    buffers_1_0_payload_state_size;
  wire       [3:0]    buffers_1_0_payload_state_id;
  wire       [254:0]  buffers_1_0_payload_state_element;
  wire                buffers_1_1_valid;
  reg                 buffers_1_1_ready;
  wire       [6:0]    buffers_1_1_payload_round_index;
  wire       [3:0]    buffers_1_1_payload_state_index;
  wire       [3:0]    buffers_1_1_payload_state_size;
  wire       [3:0]    buffers_1_1_payload_state_id;
  wire       [254:0]  buffers_1_1_payload_state_element;
  wire                buffers_1_2_valid;
  reg                 buffers_1_2_ready;
  wire       [6:0]    buffers_1_2_payload_round_index;
  wire       [3:0]    buffers_1_2_payload_state_index;
  wire       [3:0]    buffers_1_2_payload_state_size;
  wire       [3:0]    buffers_1_2_payload_state_id;
  wire       [254:0]  buffers_1_2_payload_state_element;
  wire                buffers_2_0_valid;
  reg                 buffers_2_0_ready;
  wire       [6:0]    buffers_2_0_payload_round_index;
  wire       [3:0]    buffers_2_0_payload_state_index;
  wire       [3:0]    buffers_2_0_payload_state_size;
  wire       [3:0]    buffers_2_0_payload_state_id;
  wire       [254:0]  buffers_2_0_payload_state_element;
  wire                buffers_2_1_valid;
  reg                 buffers_2_1_ready;
  wire       [6:0]    buffers_2_1_payload_round_index;
  wire       [3:0]    buffers_2_1_payload_state_index;
  wire       [3:0]    buffers_2_1_payload_state_size;
  wire       [3:0]    buffers_2_1_payload_state_id;
  wire       [254:0]  buffers_2_1_payload_state_element;
  wire                buffers_2_2_valid;
  reg                 buffers_2_2_ready;
  wire       [6:0]    buffers_2_2_payload_round_index;
  wire       [3:0]    buffers_2_2_payload_state_index;
  wire       [3:0]    buffers_2_2_payload_state_size;
  wire       [3:0]    buffers_2_2_payload_state_id;
  wire       [254:0]  buffers_2_2_payload_state_element;
  wire                buffers_3_0_valid;
  wire                buffers_3_0_ready;
  wire       [6:0]    buffers_3_0_payload_round_index;
  wire       [3:0]    buffers_3_0_payload_state_index;
  wire       [3:0]    buffers_3_0_payload_state_size;
  wire       [3:0]    buffers_3_0_payload_state_id;
  wire       [254:0]  buffers_3_0_payload_state_element;
  wire                buffers_3_1_valid;
  wire                buffers_3_1_ready;
  wire       [6:0]    buffers_3_1_payload_round_index;
  wire       [3:0]    buffers_3_1_payload_state_index;
  wire       [3:0]    buffers_3_1_payload_state_size;
  wire       [3:0]    buffers_3_1_payload_state_id;
  wire       [254:0]  buffers_3_1_payload_state_element;
  wire                buffers_3_2_valid;
  wire                buffers_3_2_ready;
  wire       [6:0]    buffers_3_2_payload_round_index;
  wire       [3:0]    buffers_3_2_payload_state_index;
  wire       [3:0]    buffers_3_2_payload_state_size;
  wire       [3:0]    buffers_3_2_payload_state_id;
  wire       [254:0]  buffers_3_2_payload_state_element;
  wire                buffer3_0_m2sPipe_valid;
  wire                buffer3_0_m2sPipe_ready;
  wire       [6:0]    buffer3_0_m2sPipe_payload_round_index;
  wire       [3:0]    buffer3_0_m2sPipe_payload_state_index;
  wire       [3:0]    buffer3_0_m2sPipe_payload_state_size;
  wire       [3:0]    buffer3_0_m2sPipe_payload_state_id;
  wire       [254:0]  buffer3_0_m2sPipe_payload_state_element;
  reg                 buffer3_0_rValid;
  reg        [6:0]    buffer3_0_rData_round_index;
  reg        [3:0]    buffer3_0_rData_state_index;
  reg        [3:0]    buffer3_0_rData_state_size;
  reg        [3:0]    buffer3_0_rData_state_id;
  reg        [254:0]  buffer3_0_rData_state_element;
  wire                when_Stream_l342_12;
  wire                buffer3_1_m2sPipe_valid;
  wire                buffer3_1_m2sPipe_ready;
  wire       [6:0]    buffer3_1_m2sPipe_payload_round_index;
  wire       [3:0]    buffer3_1_m2sPipe_payload_state_index;
  wire       [3:0]    buffer3_1_m2sPipe_payload_state_size;
  wire       [3:0]    buffer3_1_m2sPipe_payload_state_id;
  wire       [254:0]  buffer3_1_m2sPipe_payload_state_element;
  reg                 buffer3_1_rValid;
  reg        [6:0]    buffer3_1_rData_round_index;
  reg        [3:0]    buffer3_1_rData_state_index;
  reg        [3:0]    buffer3_1_rData_state_size;
  reg        [3:0]    buffer3_1_rData_state_id;
  reg        [254:0]  buffer3_1_rData_state_element;
  wire                when_Stream_l342_13;
  wire                buffer3_2_m2sPipe_valid;
  wire                buffer3_2_m2sPipe_ready;
  wire       [6:0]    buffer3_2_m2sPipe_payload_round_index;
  wire       [3:0]    buffer3_2_m2sPipe_payload_state_index;
  wire       [3:0]    buffer3_2_m2sPipe_payload_state_size;
  wire       [3:0]    buffer3_2_m2sPipe_payload_state_id;
  wire       [254:0]  buffer3_2_m2sPipe_payload_state_element;
  reg                 buffer3_2_rValid;
  reg        [6:0]    buffer3_2_rData_round_index;
  reg        [3:0]    buffer3_2_rData_state_index;
  reg        [3:0]    buffer3_2_rData_state_size;
  reg        [3:0]    buffer3_2_rData_state_id;
  reg        [254:0]  buffer3_2_rData_state_element;
  wire                when_Stream_l342_14;
  wire                buffers_0_0_m2sPipe_valid;
  wire                buffers_0_0_m2sPipe_ready;
  wire       [6:0]    buffers_0_0_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_0_0_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_0_0_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_0_0_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_0_0_m2sPipe_payload_state_element;
  reg                 buffers_0_0_rValid;
  reg        [6:0]    buffers_0_0_rData_round_index;
  reg        [3:0]    buffers_0_0_rData_state_index;
  reg        [3:0]    buffers_0_0_rData_state_size;
  reg        [3:0]    buffers_0_0_rData_state_id;
  reg        [254:0]  buffers_0_0_rData_state_element;
  wire                when_Stream_l342_15;
  wire                buffers_0_1_m2sPipe_valid;
  wire                buffers_0_1_m2sPipe_ready;
  wire       [6:0]    buffers_0_1_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_0_1_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_0_1_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_0_1_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_0_1_m2sPipe_payload_state_element;
  reg                 buffers_0_1_rValid;
  reg        [6:0]    buffers_0_1_rData_round_index;
  reg        [3:0]    buffers_0_1_rData_state_index;
  reg        [3:0]    buffers_0_1_rData_state_size;
  reg        [3:0]    buffers_0_1_rData_state_id;
  reg        [254:0]  buffers_0_1_rData_state_element;
  wire                when_Stream_l342_16;
  wire                buffers_0_2_m2sPipe_valid;
  wire                buffers_0_2_m2sPipe_ready;
  wire       [6:0]    buffers_0_2_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_0_2_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_0_2_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_0_2_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_0_2_m2sPipe_payload_state_element;
  reg                 buffers_0_2_rValid;
  reg        [6:0]    buffers_0_2_rData_round_index;
  reg        [3:0]    buffers_0_2_rData_state_index;
  reg        [3:0]    buffers_0_2_rData_state_size;
  reg        [3:0]    buffers_0_2_rData_state_id;
  reg        [254:0]  buffers_0_2_rData_state_element;
  wire                when_Stream_l342_17;
  wire                buffers_1_0_m2sPipe_valid;
  wire                buffers_1_0_m2sPipe_ready;
  wire       [6:0]    buffers_1_0_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_1_0_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_1_0_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_1_0_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_1_0_m2sPipe_payload_state_element;
  reg                 buffers_1_0_rValid;
  reg        [6:0]    buffers_1_0_rData_round_index;
  reg        [3:0]    buffers_1_0_rData_state_index;
  reg        [3:0]    buffers_1_0_rData_state_size;
  reg        [3:0]    buffers_1_0_rData_state_id;
  reg        [254:0]  buffers_1_0_rData_state_element;
  wire                when_Stream_l342_18;
  wire                buffers_1_1_m2sPipe_valid;
  wire                buffers_1_1_m2sPipe_ready;
  wire       [6:0]    buffers_1_1_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_1_1_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_1_1_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_1_1_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_1_1_m2sPipe_payload_state_element;
  reg                 buffers_1_1_rValid;
  reg        [6:0]    buffers_1_1_rData_round_index;
  reg        [3:0]    buffers_1_1_rData_state_index;
  reg        [3:0]    buffers_1_1_rData_state_size;
  reg        [3:0]    buffers_1_1_rData_state_id;
  reg        [254:0]  buffers_1_1_rData_state_element;
  wire                when_Stream_l342_19;
  wire                buffers_1_2_m2sPipe_valid;
  wire                buffers_1_2_m2sPipe_ready;
  wire       [6:0]    buffers_1_2_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_1_2_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_1_2_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_1_2_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_1_2_m2sPipe_payload_state_element;
  reg                 buffers_1_2_rValid;
  reg        [6:0]    buffers_1_2_rData_round_index;
  reg        [3:0]    buffers_1_2_rData_state_index;
  reg        [3:0]    buffers_1_2_rData_state_size;
  reg        [3:0]    buffers_1_2_rData_state_id;
  reg        [254:0]  buffers_1_2_rData_state_element;
  wire                when_Stream_l342_20;
  wire                buffers_2_0_m2sPipe_valid;
  wire                buffers_2_0_m2sPipe_ready;
  wire       [6:0]    buffers_2_0_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_2_0_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_2_0_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_2_0_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_2_0_m2sPipe_payload_state_element;
  reg                 buffers_2_0_rValid;
  reg        [6:0]    buffers_2_0_rData_round_index;
  reg        [3:0]    buffers_2_0_rData_state_index;
  reg        [3:0]    buffers_2_0_rData_state_size;
  reg        [3:0]    buffers_2_0_rData_state_id;
  reg        [254:0]  buffers_2_0_rData_state_element;
  wire                when_Stream_l342_21;
  wire                buffers_2_1_m2sPipe_valid;
  wire                buffers_2_1_m2sPipe_ready;
  wire       [6:0]    buffers_2_1_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_2_1_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_2_1_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_2_1_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_2_1_m2sPipe_payload_state_element;
  reg                 buffers_2_1_rValid;
  reg        [6:0]    buffers_2_1_rData_round_index;
  reg        [3:0]    buffers_2_1_rData_state_index;
  reg        [3:0]    buffers_2_1_rData_state_size;
  reg        [3:0]    buffers_2_1_rData_state_id;
  reg        [254:0]  buffers_2_1_rData_state_element;
  wire                when_Stream_l342_22;
  wire                buffers_2_2_m2sPipe_valid;
  wire                buffers_2_2_m2sPipe_ready;
  wire       [6:0]    buffers_2_2_m2sPipe_payload_round_index;
  wire       [3:0]    buffers_2_2_m2sPipe_payload_state_index;
  wire       [3:0]    buffers_2_2_m2sPipe_payload_state_size;
  wire       [3:0]    buffers_2_2_m2sPipe_payload_state_id;
  wire       [254:0]  buffers_2_2_m2sPipe_payload_state_element;
  reg                 buffers_2_2_rValid;
  reg        [6:0]    buffers_2_2_rData_round_index;
  reg        [3:0]    buffers_2_2_rData_state_index;
  reg        [3:0]    buffers_2_2_rData_state_size;
  reg        [3:0]    buffers_2_2_rData_state_id;
  reg        [254:0]  buffers_2_2_rData_state_element;
  wire                when_Stream_l342_23;
  wire                when_PoseidonTopLevel_l88;
  wire                when_PoseidonTopLevel_l91;
  wire                when_PoseidonTopLevel_l94;
  wire                when_PoseidonTopLevel_l97;

  assign _zz_io_input_ready = inputs_2_ready;
  assign _zz_io_input_ready_1 = {inputs_1_ready,inputs_0_ready};
  StreamArbiter streamArbiter_9 (
    .io_inputs_0_valid                    (buffer0_0_valid                                  ), //i
    .io_inputs_0_ready                    (streamArbiter_9_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer0_0_payload_round_index                    ), //i
    .io_inputs_0_payload_state_index      (buffer0_0_payload_state_index                    ), //i
    .io_inputs_0_payload_state_size       (buffer0_0_payload_state_size                     ), //i
    .io_inputs_0_payload_state_id         (buffer0_0_payload_state_id                       ), //i
    .io_inputs_0_payload_state_element    (buffer0_0_payload_state_element                  ), //i
    .io_inputs_1_valid                    (inputs_3_thrown_valid                            ), //i
    .io_inputs_1_ready                    (streamArbiter_9_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_3_thrown_payload_round_index              ), //i
    .io_inputs_1_payload_state_index      (inputs_3_thrown_payload_state_index              ), //i
    .io_inputs_1_payload_state_size       (inputs_3_thrown_payload_state_size               ), //i
    .io_inputs_1_payload_state_id         (inputs_3_thrown_payload_state_id                 ), //i
    .io_inputs_1_payload_state_element    (inputs_3_thrown_payload_state_element            ), //i
    .io_output_valid                      (streamArbiter_9_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_9_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_9_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_9_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_9_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_9_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_9_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_9_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_9_io_chosenOH                      ), //o
    .clk                                  (clk                                              ), //i
    .reset                                (reset                                            )  //i
  );
  StreamArbiter streamArbiter_10 (
    .io_inputs_0_valid                    (buffer1_0_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_10_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer1_0_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer1_0_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer1_0_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer1_0_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer1_0_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_6_thrown_valid                             ), //i
    .io_inputs_1_ready                    (streamArbiter_10_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_6_thrown_payload_round_index               ), //i
    .io_inputs_1_payload_state_index      (inputs_6_thrown_payload_state_index               ), //i
    .io_inputs_1_payload_state_size       (inputs_6_thrown_payload_state_size                ), //i
    .io_inputs_1_payload_state_id         (inputs_6_thrown_payload_state_id                  ), //i
    .io_inputs_1_payload_state_element    (inputs_6_thrown_payload_state_element             ), //i
    .io_output_valid                      (streamArbiter_10_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_10_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_10_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_10_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_10_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_10_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_10_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_10_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_10_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_11 (
    .io_inputs_0_valid                    (buffer2_0_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_11_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer2_0_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer2_0_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer2_0_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer2_0_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer2_0_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_9_thrown_valid                             ), //i
    .io_inputs_1_ready                    (streamArbiter_11_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_9_thrown_payload_round_index               ), //i
    .io_inputs_1_payload_state_index      (inputs_9_thrown_payload_state_index               ), //i
    .io_inputs_1_payload_state_size       (inputs_9_thrown_payload_state_size                ), //i
    .io_inputs_1_payload_state_id         (inputs_9_thrown_payload_state_id                  ), //i
    .io_inputs_1_payload_state_element    (inputs_9_thrown_payload_state_element             ), //i
    .io_output_valid                      (streamArbiter_11_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_11_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_11_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_11_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_11_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_11_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_11_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_11_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_11_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_12 (
    .io_inputs_0_valid                    (buffer0_1_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_12_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer0_1_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer0_1_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer0_1_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer0_1_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer0_1_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_4_thrown_valid                             ), //i
    .io_inputs_1_ready                    (streamArbiter_12_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_4_thrown_payload_round_index               ), //i
    .io_inputs_1_payload_state_index      (inputs_4_thrown_payload_state_index               ), //i
    .io_inputs_1_payload_state_size       (inputs_4_thrown_payload_state_size                ), //i
    .io_inputs_1_payload_state_id         (inputs_4_thrown_payload_state_id                  ), //i
    .io_inputs_1_payload_state_element    (inputs_4_thrown_payload_state_element             ), //i
    .io_output_valid                      (streamArbiter_12_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_12_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_12_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_12_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_12_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_12_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_12_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_12_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_12_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_13 (
    .io_inputs_0_valid                    (buffer1_1_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_13_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer1_1_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer1_1_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer1_1_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer1_1_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer1_1_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_7_thrown_valid                             ), //i
    .io_inputs_1_ready                    (streamArbiter_13_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_7_thrown_payload_round_index               ), //i
    .io_inputs_1_payload_state_index      (inputs_7_thrown_payload_state_index               ), //i
    .io_inputs_1_payload_state_size       (inputs_7_thrown_payload_state_size                ), //i
    .io_inputs_1_payload_state_id         (inputs_7_thrown_payload_state_id                  ), //i
    .io_inputs_1_payload_state_element    (inputs_7_thrown_payload_state_element             ), //i
    .io_output_valid                      (streamArbiter_13_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_13_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_13_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_13_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_13_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_13_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_13_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_13_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_13_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_14 (
    .io_inputs_0_valid                    (buffer2_1_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_14_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer2_1_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer2_1_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer2_1_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer2_1_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer2_1_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_10_thrown_valid                            ), //i
    .io_inputs_1_ready                    (streamArbiter_14_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_10_thrown_payload_round_index              ), //i
    .io_inputs_1_payload_state_index      (inputs_10_thrown_payload_state_index              ), //i
    .io_inputs_1_payload_state_size       (inputs_10_thrown_payload_state_size               ), //i
    .io_inputs_1_payload_state_id         (inputs_10_thrown_payload_state_id                 ), //i
    .io_inputs_1_payload_state_element    (inputs_10_thrown_payload_state_element            ), //i
    .io_output_valid                      (streamArbiter_14_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_14_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_14_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_14_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_14_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_14_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_14_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_14_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_14_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_15 (
    .io_inputs_0_valid                    (buffer0_2_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_15_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer0_2_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer0_2_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer0_2_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer0_2_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer0_2_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_5_thrown_valid                             ), //i
    .io_inputs_1_ready                    (streamArbiter_15_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_5_thrown_payload_round_index               ), //i
    .io_inputs_1_payload_state_index      (inputs_5_thrown_payload_state_index               ), //i
    .io_inputs_1_payload_state_size       (inputs_5_thrown_payload_state_size                ), //i
    .io_inputs_1_payload_state_id         (inputs_5_thrown_payload_state_id                  ), //i
    .io_inputs_1_payload_state_element    (inputs_5_thrown_payload_state_element             ), //i
    .io_output_valid                      (streamArbiter_15_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_15_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_15_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_15_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_15_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_15_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_15_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_15_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_15_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_16 (
    .io_inputs_0_valid                    (buffer1_2_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_16_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer1_2_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer1_2_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer1_2_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer1_2_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer1_2_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_8_thrown_valid                             ), //i
    .io_inputs_1_ready                    (streamArbiter_16_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_8_thrown_payload_round_index               ), //i
    .io_inputs_1_payload_state_index      (inputs_8_thrown_payload_state_index               ), //i
    .io_inputs_1_payload_state_size       (inputs_8_thrown_payload_state_size                ), //i
    .io_inputs_1_payload_state_id         (inputs_8_thrown_payload_state_id                  ), //i
    .io_inputs_1_payload_state_element    (inputs_8_thrown_payload_state_element             ), //i
    .io_output_valid                      (streamArbiter_16_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_16_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_16_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_16_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_16_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_16_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_16_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_16_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_16_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  StreamArbiter streamArbiter_17 (
    .io_inputs_0_valid                    (buffer2_2_valid                                   ), //i
    .io_inputs_0_ready                    (streamArbiter_17_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_round_index      (buffer2_2_payload_round_index                     ), //i
    .io_inputs_0_payload_state_index      (buffer2_2_payload_state_index                     ), //i
    .io_inputs_0_payload_state_size       (buffer2_2_payload_state_size                      ), //i
    .io_inputs_0_payload_state_id         (buffer2_2_payload_state_id                        ), //i
    .io_inputs_0_payload_state_element    (buffer2_2_payload_state_element                   ), //i
    .io_inputs_1_valid                    (inputs_11_thrown_valid                            ), //i
    .io_inputs_1_ready                    (streamArbiter_17_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_round_index      (inputs_11_thrown_payload_round_index              ), //i
    .io_inputs_1_payload_state_index      (inputs_11_thrown_payload_state_index              ), //i
    .io_inputs_1_payload_state_size       (inputs_11_thrown_payload_state_size               ), //i
    .io_inputs_1_payload_state_id         (inputs_11_thrown_payload_state_id                 ), //i
    .io_inputs_1_payload_state_element    (inputs_11_thrown_payload_state_element            ), //i
    .io_output_valid                      (streamArbiter_17_io_output_valid                  ), //o
    .io_output_ready                      (streamArbiter_17_io_output_ready                  ), //i
    .io_output_payload_round_index        (streamArbiter_17_io_output_payload_round_index    ), //o
    .io_output_payload_state_index        (streamArbiter_17_io_output_payload_state_index    ), //o
    .io_output_payload_state_size         (streamArbiter_17_io_output_payload_state_size     ), //o
    .io_output_payload_state_id           (streamArbiter_17_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamArbiter_17_io_output_payload_state_element  ), //o
    .io_chosen                            (streamArbiter_17_io_chosen                        ), //o
    .io_chosenOH                          (streamArbiter_17_io_chosenOH                      ), //o
    .clk                                  (clk                                               ), //i
    .reset                                (reset                                             )  //i
  );
  assign inputs_0_valid = io_input_valid;
  assign inputs_0_payload_round_index = io_input_payload_round_index;
  assign inputs_0_payload_state_size = io_input_payload_state_size;
  assign inputs_0_payload_state_id = io_input_payload_state_id;
  assign inputs_0_payload_state_index = 4'b0000;
  assign inputs_0_payload_state_element = io_input_payload_state_elements_0;
  assign inputs_1_valid = io_input_valid;
  assign inputs_1_payload_round_index = io_input_payload_round_index;
  assign inputs_1_payload_state_size = io_input_payload_state_size;
  assign inputs_1_payload_state_id = io_input_payload_state_id;
  assign inputs_1_payload_state_index = 4'b0001;
  assign inputs_1_payload_state_element = io_input_payload_state_elements_1;
  assign inputs_2_valid = io_input_valid;
  assign inputs_2_payload_round_index = io_input_payload_round_index;
  assign inputs_2_payload_state_size = io_input_payload_state_size;
  assign inputs_2_payload_state_id = io_input_payload_state_id;
  assign inputs_2_payload_state_index = 4'b0010;
  assign inputs_2_payload_state_element = io_input_payload_state_elements_2;
  assign inputs_3_valid = io_input_valid;
  assign inputs_3_payload_round_index = io_input_payload_round_index;
  assign inputs_3_payload_state_size = io_input_payload_state_size;
  assign inputs_3_payload_state_id = io_input_payload_state_id;
  assign inputs_3_payload_state_index = 4'b0011;
  assign inputs_3_payload_state_element = io_input_payload_state_elements_3;
  assign inputs_4_valid = io_input_valid;
  assign inputs_4_payload_round_index = io_input_payload_round_index;
  assign inputs_4_payload_state_size = io_input_payload_state_size;
  assign inputs_4_payload_state_id = io_input_payload_state_id;
  assign inputs_4_payload_state_index = 4'b0100;
  assign inputs_4_payload_state_element = io_input_payload_state_elements_4;
  assign inputs_5_valid = io_input_valid;
  assign inputs_5_payload_round_index = io_input_payload_round_index;
  assign inputs_5_payload_state_size = io_input_payload_state_size;
  assign inputs_5_payload_state_id = io_input_payload_state_id;
  assign inputs_5_payload_state_index = 4'b0101;
  assign inputs_5_payload_state_element = io_input_payload_state_elements_5;
  assign inputs_6_valid = io_input_valid;
  assign inputs_6_payload_round_index = io_input_payload_round_index;
  assign inputs_6_payload_state_size = io_input_payload_state_size;
  assign inputs_6_payload_state_id = io_input_payload_state_id;
  assign inputs_6_payload_state_index = 4'b0110;
  assign inputs_6_payload_state_element = io_input_payload_state_elements_6;
  assign inputs_7_valid = io_input_valid;
  assign inputs_7_payload_round_index = io_input_payload_round_index;
  assign inputs_7_payload_state_size = io_input_payload_state_size;
  assign inputs_7_payload_state_id = io_input_payload_state_id;
  assign inputs_7_payload_state_index = 4'b0111;
  assign inputs_7_payload_state_element = io_input_payload_state_elements_7;
  assign inputs_8_valid = io_input_valid;
  assign inputs_8_payload_round_index = io_input_payload_round_index;
  assign inputs_8_payload_state_size = io_input_payload_state_size;
  assign inputs_8_payload_state_id = io_input_payload_state_id;
  assign inputs_8_payload_state_index = 4'b1000;
  assign inputs_8_payload_state_element = io_input_payload_state_elements_8;
  assign inputs_9_valid = io_input_valid;
  assign inputs_9_payload_round_index = io_input_payload_round_index;
  assign inputs_9_payload_state_size = io_input_payload_state_size;
  assign inputs_9_payload_state_id = io_input_payload_state_id;
  assign inputs_9_payload_state_index = 4'b1001;
  assign inputs_9_payload_state_element = io_input_payload_state_elements_9;
  assign inputs_10_valid = io_input_valid;
  assign inputs_10_payload_round_index = io_input_payload_round_index;
  assign inputs_10_payload_state_size = io_input_payload_state_size;
  assign inputs_10_payload_state_id = io_input_payload_state_id;
  assign inputs_10_payload_state_index = 4'b1010;
  assign inputs_10_payload_state_element = io_input_payload_state_elements_10;
  assign inputs_11_valid = io_input_valid;
  assign inputs_11_payload_round_index = io_input_payload_round_index;
  assign inputs_11_payload_state_size = io_input_payload_state_size;
  assign inputs_11_payload_state_id = io_input_payload_state_id;
  assign inputs_11_payload_state_index = 4'b1011;
  assign inputs_11_payload_state_element = io_input_payload_state_elements_11;
  assign io_input_ready = ({inputs_11_ready,{inputs_10_ready,{inputs_9_ready,{inputs_8_ready,{inputs_7_ready,{inputs_6_ready,{inputs_5_ready,{inputs_4_ready,{inputs_3_ready,{_zz_io_input_ready,_zz_io_input_ready_1}}}}}}}}}} == 12'hfff);
  always @(*) begin
    inputs_0_ready = inputs_0_m2sPipe_ready;
    if(when_Stream_l342) begin
      inputs_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! inputs_0_m2sPipe_valid);
  assign inputs_0_m2sPipe_valid = inputs_0_rValid;
  assign inputs_0_m2sPipe_payload_round_index = inputs_0_rData_round_index;
  assign inputs_0_m2sPipe_payload_state_index = inputs_0_rData_state_index;
  assign inputs_0_m2sPipe_payload_state_size = inputs_0_rData_state_size;
  assign inputs_0_m2sPipe_payload_state_id = inputs_0_rData_state_id;
  assign inputs_0_m2sPipe_payload_state_element = inputs_0_rData_state_element;
  assign buffer0_0_valid = inputs_0_m2sPipe_valid;
  assign inputs_0_m2sPipe_ready = buffer0_0_ready;
  assign buffer0_0_payload_round_index = inputs_0_m2sPipe_payload_round_index;
  assign buffer0_0_payload_state_index = inputs_0_m2sPipe_payload_state_index;
  assign buffer0_0_payload_state_size = inputs_0_m2sPipe_payload_state_size;
  assign buffer0_0_payload_state_id = inputs_0_m2sPipe_payload_state_id;
  assign buffer0_0_payload_state_element = inputs_0_m2sPipe_payload_state_element;
  assign when_Stream_l408 = (io_input_payload_state_size < 4'b0101);
  always @(*) begin
    inputs_3_thrown_valid = inputs_3_valid;
    if(when_Stream_l408) begin
      inputs_3_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_3_ready = inputs_3_thrown_ready;
    if(when_Stream_l408) begin
      inputs_3_ready = 1'b1;
    end
  end

  assign inputs_3_thrown_payload_round_index = inputs_3_payload_round_index;
  assign inputs_3_thrown_payload_state_index = inputs_3_payload_state_index;
  assign inputs_3_thrown_payload_state_size = inputs_3_payload_state_size;
  assign inputs_3_thrown_payload_state_id = inputs_3_payload_state_id;
  assign inputs_3_thrown_payload_state_element = inputs_3_payload_state_element;
  assign buffer0_0_ready = streamArbiter_9_io_inputs_0_ready;
  assign inputs_3_thrown_ready = streamArbiter_9_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_9_io_output_ready = streamArbiter_9_io_output_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      streamArbiter_9_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! streamArbiter_9_io_output_m2sPipe_valid);
  assign streamArbiter_9_io_output_m2sPipe_valid = streamArbiter_9_io_output_rValid;
  assign streamArbiter_9_io_output_m2sPipe_payload_round_index = streamArbiter_9_io_output_rData_round_index;
  assign streamArbiter_9_io_output_m2sPipe_payload_state_index = streamArbiter_9_io_output_rData_state_index;
  assign streamArbiter_9_io_output_m2sPipe_payload_state_size = streamArbiter_9_io_output_rData_state_size;
  assign streamArbiter_9_io_output_m2sPipe_payload_state_id = streamArbiter_9_io_output_rData_state_id;
  assign streamArbiter_9_io_output_m2sPipe_payload_state_element = streamArbiter_9_io_output_rData_state_element;
  assign buffer1_0_valid = streamArbiter_9_io_output_m2sPipe_valid;
  assign streamArbiter_9_io_output_m2sPipe_ready = buffer1_0_ready;
  assign buffer1_0_payload_round_index = streamArbiter_9_io_output_m2sPipe_payload_round_index;
  assign buffer1_0_payload_state_index = streamArbiter_9_io_output_m2sPipe_payload_state_index;
  assign buffer1_0_payload_state_size = streamArbiter_9_io_output_m2sPipe_payload_state_size;
  assign buffer1_0_payload_state_id = streamArbiter_9_io_output_m2sPipe_payload_state_id;
  assign buffer1_0_payload_state_element = streamArbiter_9_io_output_m2sPipe_payload_state_element;
  assign when_Stream_l408_1 = (io_input_payload_state_size < 4'b1001);
  always @(*) begin
    inputs_6_thrown_valid = inputs_6_valid;
    if(when_Stream_l408_1) begin
      inputs_6_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_6_ready = inputs_6_thrown_ready;
    if(when_Stream_l408_1) begin
      inputs_6_ready = 1'b1;
    end
  end

  assign inputs_6_thrown_payload_round_index = inputs_6_payload_round_index;
  assign inputs_6_thrown_payload_state_index = inputs_6_payload_state_index;
  assign inputs_6_thrown_payload_state_size = inputs_6_payload_state_size;
  assign inputs_6_thrown_payload_state_id = inputs_6_payload_state_id;
  assign inputs_6_thrown_payload_state_element = inputs_6_payload_state_element;
  assign buffer1_0_ready = streamArbiter_10_io_inputs_0_ready;
  assign inputs_6_thrown_ready = streamArbiter_10_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_10_io_output_ready = streamArbiter_10_io_output_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      streamArbiter_10_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! streamArbiter_10_io_output_m2sPipe_valid);
  assign streamArbiter_10_io_output_m2sPipe_valid = streamArbiter_10_io_output_rValid;
  assign streamArbiter_10_io_output_m2sPipe_payload_round_index = streamArbiter_10_io_output_rData_round_index;
  assign streamArbiter_10_io_output_m2sPipe_payload_state_index = streamArbiter_10_io_output_rData_state_index;
  assign streamArbiter_10_io_output_m2sPipe_payload_state_size = streamArbiter_10_io_output_rData_state_size;
  assign streamArbiter_10_io_output_m2sPipe_payload_state_id = streamArbiter_10_io_output_rData_state_id;
  assign streamArbiter_10_io_output_m2sPipe_payload_state_element = streamArbiter_10_io_output_rData_state_element;
  assign buffer2_0_valid = streamArbiter_10_io_output_m2sPipe_valid;
  assign streamArbiter_10_io_output_m2sPipe_ready = buffer2_0_ready;
  assign buffer2_0_payload_round_index = streamArbiter_10_io_output_m2sPipe_payload_round_index;
  assign buffer2_0_payload_state_index = streamArbiter_10_io_output_m2sPipe_payload_state_index;
  assign buffer2_0_payload_state_size = streamArbiter_10_io_output_m2sPipe_payload_state_size;
  assign buffer2_0_payload_state_id = streamArbiter_10_io_output_m2sPipe_payload_state_id;
  assign buffer2_0_payload_state_element = streamArbiter_10_io_output_m2sPipe_payload_state_element;
  assign when_Stream_l408_2 = (io_input_payload_state_size < 4'b1100);
  always @(*) begin
    inputs_9_thrown_valid = inputs_9_valid;
    if(when_Stream_l408_2) begin
      inputs_9_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_9_ready = inputs_9_thrown_ready;
    if(when_Stream_l408_2) begin
      inputs_9_ready = 1'b1;
    end
  end

  assign inputs_9_thrown_payload_round_index = inputs_9_payload_round_index;
  assign inputs_9_thrown_payload_state_index = inputs_9_payload_state_index;
  assign inputs_9_thrown_payload_state_size = inputs_9_payload_state_size;
  assign inputs_9_thrown_payload_state_id = inputs_9_payload_state_id;
  assign inputs_9_thrown_payload_state_element = inputs_9_payload_state_element;
  assign buffer2_0_ready = streamArbiter_11_io_inputs_0_ready;
  assign inputs_9_thrown_ready = streamArbiter_11_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_11_io_output_ready = streamArbiter_11_io_output_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      streamArbiter_11_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! streamArbiter_11_io_output_m2sPipe_valid);
  assign streamArbiter_11_io_output_m2sPipe_valid = streamArbiter_11_io_output_rValid;
  assign streamArbiter_11_io_output_m2sPipe_payload_round_index = streamArbiter_11_io_output_rData_round_index;
  assign streamArbiter_11_io_output_m2sPipe_payload_state_index = streamArbiter_11_io_output_rData_state_index;
  assign streamArbiter_11_io_output_m2sPipe_payload_state_size = streamArbiter_11_io_output_rData_state_size;
  assign streamArbiter_11_io_output_m2sPipe_payload_state_id = streamArbiter_11_io_output_rData_state_id;
  assign streamArbiter_11_io_output_m2sPipe_payload_state_element = streamArbiter_11_io_output_rData_state_element;
  assign buffer3_0_valid = streamArbiter_11_io_output_m2sPipe_valid;
  assign streamArbiter_11_io_output_m2sPipe_ready = buffer3_0_ready;
  assign buffer3_0_payload_round_index = streamArbiter_11_io_output_m2sPipe_payload_round_index;
  assign buffer3_0_payload_state_index = streamArbiter_11_io_output_m2sPipe_payload_state_index;
  assign buffer3_0_payload_state_size = streamArbiter_11_io_output_m2sPipe_payload_state_size;
  assign buffer3_0_payload_state_id = streamArbiter_11_io_output_m2sPipe_payload_state_id;
  assign buffer3_0_payload_state_element = streamArbiter_11_io_output_m2sPipe_payload_state_element;
  always @(*) begin
    inputs_1_ready = inputs_1_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      inputs_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! inputs_1_m2sPipe_valid);
  assign inputs_1_m2sPipe_valid = inputs_1_rValid;
  assign inputs_1_m2sPipe_payload_round_index = inputs_1_rData_round_index;
  assign inputs_1_m2sPipe_payload_state_index = inputs_1_rData_state_index;
  assign inputs_1_m2sPipe_payload_state_size = inputs_1_rData_state_size;
  assign inputs_1_m2sPipe_payload_state_id = inputs_1_rData_state_id;
  assign inputs_1_m2sPipe_payload_state_element = inputs_1_rData_state_element;
  assign buffer0_1_valid = inputs_1_m2sPipe_valid;
  assign inputs_1_m2sPipe_ready = buffer0_1_ready;
  assign buffer0_1_payload_round_index = inputs_1_m2sPipe_payload_round_index;
  assign buffer0_1_payload_state_index = inputs_1_m2sPipe_payload_state_index;
  assign buffer0_1_payload_state_size = inputs_1_m2sPipe_payload_state_size;
  assign buffer0_1_payload_state_id = inputs_1_m2sPipe_payload_state_id;
  assign buffer0_1_payload_state_element = inputs_1_m2sPipe_payload_state_element;
  assign when_Stream_l408_3 = (io_input_payload_state_size < 4'b0101);
  always @(*) begin
    inputs_4_thrown_valid = inputs_4_valid;
    if(when_Stream_l408_3) begin
      inputs_4_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_4_ready = inputs_4_thrown_ready;
    if(when_Stream_l408_3) begin
      inputs_4_ready = 1'b1;
    end
  end

  assign inputs_4_thrown_payload_round_index = inputs_4_payload_round_index;
  assign inputs_4_thrown_payload_state_index = inputs_4_payload_state_index;
  assign inputs_4_thrown_payload_state_size = inputs_4_payload_state_size;
  assign inputs_4_thrown_payload_state_id = inputs_4_payload_state_id;
  assign inputs_4_thrown_payload_state_element = inputs_4_payload_state_element;
  assign buffer0_1_ready = streamArbiter_12_io_inputs_0_ready;
  assign inputs_4_thrown_ready = streamArbiter_12_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_12_io_output_ready = streamArbiter_12_io_output_m2sPipe_ready;
    if(when_Stream_l342_5) begin
      streamArbiter_12_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! streamArbiter_12_io_output_m2sPipe_valid);
  assign streamArbiter_12_io_output_m2sPipe_valid = streamArbiter_12_io_output_rValid;
  assign streamArbiter_12_io_output_m2sPipe_payload_round_index = streamArbiter_12_io_output_rData_round_index;
  assign streamArbiter_12_io_output_m2sPipe_payload_state_index = streamArbiter_12_io_output_rData_state_index;
  assign streamArbiter_12_io_output_m2sPipe_payload_state_size = streamArbiter_12_io_output_rData_state_size;
  assign streamArbiter_12_io_output_m2sPipe_payload_state_id = streamArbiter_12_io_output_rData_state_id;
  assign streamArbiter_12_io_output_m2sPipe_payload_state_element = streamArbiter_12_io_output_rData_state_element;
  assign buffer1_1_valid = streamArbiter_12_io_output_m2sPipe_valid;
  assign streamArbiter_12_io_output_m2sPipe_ready = buffer1_1_ready;
  assign buffer1_1_payload_round_index = streamArbiter_12_io_output_m2sPipe_payload_round_index;
  assign buffer1_1_payload_state_index = streamArbiter_12_io_output_m2sPipe_payload_state_index;
  assign buffer1_1_payload_state_size = streamArbiter_12_io_output_m2sPipe_payload_state_size;
  assign buffer1_1_payload_state_id = streamArbiter_12_io_output_m2sPipe_payload_state_id;
  assign buffer1_1_payload_state_element = streamArbiter_12_io_output_m2sPipe_payload_state_element;
  assign when_Stream_l408_4 = (io_input_payload_state_size < 4'b1001);
  always @(*) begin
    inputs_7_thrown_valid = inputs_7_valid;
    if(when_Stream_l408_4) begin
      inputs_7_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_7_ready = inputs_7_thrown_ready;
    if(when_Stream_l408_4) begin
      inputs_7_ready = 1'b1;
    end
  end

  assign inputs_7_thrown_payload_round_index = inputs_7_payload_round_index;
  assign inputs_7_thrown_payload_state_index = inputs_7_payload_state_index;
  assign inputs_7_thrown_payload_state_size = inputs_7_payload_state_size;
  assign inputs_7_thrown_payload_state_id = inputs_7_payload_state_id;
  assign inputs_7_thrown_payload_state_element = inputs_7_payload_state_element;
  assign buffer1_1_ready = streamArbiter_13_io_inputs_0_ready;
  assign inputs_7_thrown_ready = streamArbiter_13_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_13_io_output_ready = streamArbiter_13_io_output_m2sPipe_ready;
    if(when_Stream_l342_6) begin
      streamArbiter_13_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_6 = (! streamArbiter_13_io_output_m2sPipe_valid);
  assign streamArbiter_13_io_output_m2sPipe_valid = streamArbiter_13_io_output_rValid;
  assign streamArbiter_13_io_output_m2sPipe_payload_round_index = streamArbiter_13_io_output_rData_round_index;
  assign streamArbiter_13_io_output_m2sPipe_payload_state_index = streamArbiter_13_io_output_rData_state_index;
  assign streamArbiter_13_io_output_m2sPipe_payload_state_size = streamArbiter_13_io_output_rData_state_size;
  assign streamArbiter_13_io_output_m2sPipe_payload_state_id = streamArbiter_13_io_output_rData_state_id;
  assign streamArbiter_13_io_output_m2sPipe_payload_state_element = streamArbiter_13_io_output_rData_state_element;
  assign buffer2_1_valid = streamArbiter_13_io_output_m2sPipe_valid;
  assign streamArbiter_13_io_output_m2sPipe_ready = buffer2_1_ready;
  assign buffer2_1_payload_round_index = streamArbiter_13_io_output_m2sPipe_payload_round_index;
  assign buffer2_1_payload_state_index = streamArbiter_13_io_output_m2sPipe_payload_state_index;
  assign buffer2_1_payload_state_size = streamArbiter_13_io_output_m2sPipe_payload_state_size;
  assign buffer2_1_payload_state_id = streamArbiter_13_io_output_m2sPipe_payload_state_id;
  assign buffer2_1_payload_state_element = streamArbiter_13_io_output_m2sPipe_payload_state_element;
  assign when_Stream_l408_5 = (io_input_payload_state_size < 4'b1100);
  always @(*) begin
    inputs_10_thrown_valid = inputs_10_valid;
    if(when_Stream_l408_5) begin
      inputs_10_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_10_ready = inputs_10_thrown_ready;
    if(when_Stream_l408_5) begin
      inputs_10_ready = 1'b1;
    end
  end

  assign inputs_10_thrown_payload_round_index = inputs_10_payload_round_index;
  assign inputs_10_thrown_payload_state_index = inputs_10_payload_state_index;
  assign inputs_10_thrown_payload_state_size = inputs_10_payload_state_size;
  assign inputs_10_thrown_payload_state_id = inputs_10_payload_state_id;
  assign inputs_10_thrown_payload_state_element = inputs_10_payload_state_element;
  assign buffer2_1_ready = streamArbiter_14_io_inputs_0_ready;
  assign inputs_10_thrown_ready = streamArbiter_14_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_14_io_output_ready = streamArbiter_14_io_output_m2sPipe_ready;
    if(when_Stream_l342_7) begin
      streamArbiter_14_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_7 = (! streamArbiter_14_io_output_m2sPipe_valid);
  assign streamArbiter_14_io_output_m2sPipe_valid = streamArbiter_14_io_output_rValid;
  assign streamArbiter_14_io_output_m2sPipe_payload_round_index = streamArbiter_14_io_output_rData_round_index;
  assign streamArbiter_14_io_output_m2sPipe_payload_state_index = streamArbiter_14_io_output_rData_state_index;
  assign streamArbiter_14_io_output_m2sPipe_payload_state_size = streamArbiter_14_io_output_rData_state_size;
  assign streamArbiter_14_io_output_m2sPipe_payload_state_id = streamArbiter_14_io_output_rData_state_id;
  assign streamArbiter_14_io_output_m2sPipe_payload_state_element = streamArbiter_14_io_output_rData_state_element;
  assign buffer3_1_valid = streamArbiter_14_io_output_m2sPipe_valid;
  assign streamArbiter_14_io_output_m2sPipe_ready = buffer3_1_ready;
  assign buffer3_1_payload_round_index = streamArbiter_14_io_output_m2sPipe_payload_round_index;
  assign buffer3_1_payload_state_index = streamArbiter_14_io_output_m2sPipe_payload_state_index;
  assign buffer3_1_payload_state_size = streamArbiter_14_io_output_m2sPipe_payload_state_size;
  assign buffer3_1_payload_state_id = streamArbiter_14_io_output_m2sPipe_payload_state_id;
  assign buffer3_1_payload_state_element = streamArbiter_14_io_output_m2sPipe_payload_state_element;
  always @(*) begin
    inputs_2_ready = inputs_2_m2sPipe_ready;
    if(when_Stream_l342_8) begin
      inputs_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_8 = (! inputs_2_m2sPipe_valid);
  assign inputs_2_m2sPipe_valid = inputs_2_rValid;
  assign inputs_2_m2sPipe_payload_round_index = inputs_2_rData_round_index;
  assign inputs_2_m2sPipe_payload_state_index = inputs_2_rData_state_index;
  assign inputs_2_m2sPipe_payload_state_size = inputs_2_rData_state_size;
  assign inputs_2_m2sPipe_payload_state_id = inputs_2_rData_state_id;
  assign inputs_2_m2sPipe_payload_state_element = inputs_2_rData_state_element;
  assign buffer0_2_valid = inputs_2_m2sPipe_valid;
  assign inputs_2_m2sPipe_ready = buffer0_2_ready;
  assign buffer0_2_payload_round_index = inputs_2_m2sPipe_payload_round_index;
  assign buffer0_2_payload_state_index = inputs_2_m2sPipe_payload_state_index;
  assign buffer0_2_payload_state_size = inputs_2_m2sPipe_payload_state_size;
  assign buffer0_2_payload_state_id = inputs_2_m2sPipe_payload_state_id;
  assign buffer0_2_payload_state_element = inputs_2_m2sPipe_payload_state_element;
  assign when_Stream_l408_6 = (io_input_payload_state_size < 4'b0101);
  always @(*) begin
    inputs_5_thrown_valid = inputs_5_valid;
    if(when_Stream_l408_6) begin
      inputs_5_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_5_ready = inputs_5_thrown_ready;
    if(when_Stream_l408_6) begin
      inputs_5_ready = 1'b1;
    end
  end

  assign inputs_5_thrown_payload_round_index = inputs_5_payload_round_index;
  assign inputs_5_thrown_payload_state_index = inputs_5_payload_state_index;
  assign inputs_5_thrown_payload_state_size = inputs_5_payload_state_size;
  assign inputs_5_thrown_payload_state_id = inputs_5_payload_state_id;
  assign inputs_5_thrown_payload_state_element = inputs_5_payload_state_element;
  assign buffer0_2_ready = streamArbiter_15_io_inputs_0_ready;
  assign inputs_5_thrown_ready = streamArbiter_15_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_15_io_output_ready = streamArbiter_15_io_output_m2sPipe_ready;
    if(when_Stream_l342_9) begin
      streamArbiter_15_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_9 = (! streamArbiter_15_io_output_m2sPipe_valid);
  assign streamArbiter_15_io_output_m2sPipe_valid = streamArbiter_15_io_output_rValid;
  assign streamArbiter_15_io_output_m2sPipe_payload_round_index = streamArbiter_15_io_output_rData_round_index;
  assign streamArbiter_15_io_output_m2sPipe_payload_state_index = streamArbiter_15_io_output_rData_state_index;
  assign streamArbiter_15_io_output_m2sPipe_payload_state_size = streamArbiter_15_io_output_rData_state_size;
  assign streamArbiter_15_io_output_m2sPipe_payload_state_id = streamArbiter_15_io_output_rData_state_id;
  assign streamArbiter_15_io_output_m2sPipe_payload_state_element = streamArbiter_15_io_output_rData_state_element;
  assign buffer1_2_valid = streamArbiter_15_io_output_m2sPipe_valid;
  assign streamArbiter_15_io_output_m2sPipe_ready = buffer1_2_ready;
  assign buffer1_2_payload_round_index = streamArbiter_15_io_output_m2sPipe_payload_round_index;
  assign buffer1_2_payload_state_index = streamArbiter_15_io_output_m2sPipe_payload_state_index;
  assign buffer1_2_payload_state_size = streamArbiter_15_io_output_m2sPipe_payload_state_size;
  assign buffer1_2_payload_state_id = streamArbiter_15_io_output_m2sPipe_payload_state_id;
  assign buffer1_2_payload_state_element = streamArbiter_15_io_output_m2sPipe_payload_state_element;
  assign when_Stream_l408_7 = (io_input_payload_state_size < 4'b1001);
  always @(*) begin
    inputs_8_thrown_valid = inputs_8_valid;
    if(when_Stream_l408_7) begin
      inputs_8_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_8_ready = inputs_8_thrown_ready;
    if(when_Stream_l408_7) begin
      inputs_8_ready = 1'b1;
    end
  end

  assign inputs_8_thrown_payload_round_index = inputs_8_payload_round_index;
  assign inputs_8_thrown_payload_state_index = inputs_8_payload_state_index;
  assign inputs_8_thrown_payload_state_size = inputs_8_payload_state_size;
  assign inputs_8_thrown_payload_state_id = inputs_8_payload_state_id;
  assign inputs_8_thrown_payload_state_element = inputs_8_payload_state_element;
  assign buffer1_2_ready = streamArbiter_16_io_inputs_0_ready;
  assign inputs_8_thrown_ready = streamArbiter_16_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_16_io_output_ready = streamArbiter_16_io_output_m2sPipe_ready;
    if(when_Stream_l342_10) begin
      streamArbiter_16_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_10 = (! streamArbiter_16_io_output_m2sPipe_valid);
  assign streamArbiter_16_io_output_m2sPipe_valid = streamArbiter_16_io_output_rValid;
  assign streamArbiter_16_io_output_m2sPipe_payload_round_index = streamArbiter_16_io_output_rData_round_index;
  assign streamArbiter_16_io_output_m2sPipe_payload_state_index = streamArbiter_16_io_output_rData_state_index;
  assign streamArbiter_16_io_output_m2sPipe_payload_state_size = streamArbiter_16_io_output_rData_state_size;
  assign streamArbiter_16_io_output_m2sPipe_payload_state_id = streamArbiter_16_io_output_rData_state_id;
  assign streamArbiter_16_io_output_m2sPipe_payload_state_element = streamArbiter_16_io_output_rData_state_element;
  assign buffer2_2_valid = streamArbiter_16_io_output_m2sPipe_valid;
  assign streamArbiter_16_io_output_m2sPipe_ready = buffer2_2_ready;
  assign buffer2_2_payload_round_index = streamArbiter_16_io_output_m2sPipe_payload_round_index;
  assign buffer2_2_payload_state_index = streamArbiter_16_io_output_m2sPipe_payload_state_index;
  assign buffer2_2_payload_state_size = streamArbiter_16_io_output_m2sPipe_payload_state_size;
  assign buffer2_2_payload_state_id = streamArbiter_16_io_output_m2sPipe_payload_state_id;
  assign buffer2_2_payload_state_element = streamArbiter_16_io_output_m2sPipe_payload_state_element;
  assign when_Stream_l408_8 = (io_input_payload_state_size < 4'b1100);
  always @(*) begin
    inputs_11_thrown_valid = inputs_11_valid;
    if(when_Stream_l408_8) begin
      inputs_11_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inputs_11_ready = inputs_11_thrown_ready;
    if(when_Stream_l408_8) begin
      inputs_11_ready = 1'b1;
    end
  end

  assign inputs_11_thrown_payload_round_index = inputs_11_payload_round_index;
  assign inputs_11_thrown_payload_state_index = inputs_11_payload_state_index;
  assign inputs_11_thrown_payload_state_size = inputs_11_payload_state_size;
  assign inputs_11_thrown_payload_state_id = inputs_11_payload_state_id;
  assign inputs_11_thrown_payload_state_element = inputs_11_payload_state_element;
  assign buffer2_2_ready = streamArbiter_17_io_inputs_0_ready;
  assign inputs_11_thrown_ready = streamArbiter_17_io_inputs_1_ready;
  always @(*) begin
    streamArbiter_17_io_output_ready = streamArbiter_17_io_output_m2sPipe_ready;
    if(when_Stream_l342_11) begin
      streamArbiter_17_io_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_11 = (! streamArbiter_17_io_output_m2sPipe_valid);
  assign streamArbiter_17_io_output_m2sPipe_valid = streamArbiter_17_io_output_rValid;
  assign streamArbiter_17_io_output_m2sPipe_payload_round_index = streamArbiter_17_io_output_rData_round_index;
  assign streamArbiter_17_io_output_m2sPipe_payload_state_index = streamArbiter_17_io_output_rData_state_index;
  assign streamArbiter_17_io_output_m2sPipe_payload_state_size = streamArbiter_17_io_output_rData_state_size;
  assign streamArbiter_17_io_output_m2sPipe_payload_state_id = streamArbiter_17_io_output_rData_state_id;
  assign streamArbiter_17_io_output_m2sPipe_payload_state_element = streamArbiter_17_io_output_rData_state_element;
  assign buffer3_2_valid = streamArbiter_17_io_output_m2sPipe_valid;
  assign streamArbiter_17_io_output_m2sPipe_ready = buffer3_2_ready;
  assign buffer3_2_payload_round_index = streamArbiter_17_io_output_m2sPipe_payload_round_index;
  assign buffer3_2_payload_state_index = streamArbiter_17_io_output_m2sPipe_payload_state_index;
  assign buffer3_2_payload_state_size = streamArbiter_17_io_output_m2sPipe_payload_state_size;
  assign buffer3_2_payload_state_id = streamArbiter_17_io_output_m2sPipe_payload_state_id;
  assign buffer3_2_payload_state_element = streamArbiter_17_io_output_m2sPipe_payload_state_element;
  always @(*) begin
    buffer3_0_ready = buffer3_0_m2sPipe_ready;
    if(when_Stream_l342_12) begin
      buffer3_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342_12 = (! buffer3_0_m2sPipe_valid);
  assign buffer3_0_m2sPipe_valid = buffer3_0_rValid;
  assign buffer3_0_m2sPipe_payload_round_index = buffer3_0_rData_round_index;
  assign buffer3_0_m2sPipe_payload_state_index = buffer3_0_rData_state_index;
  assign buffer3_0_m2sPipe_payload_state_size = buffer3_0_rData_state_size;
  assign buffer3_0_m2sPipe_payload_state_id = buffer3_0_rData_state_id;
  assign buffer3_0_m2sPipe_payload_state_element = buffer3_0_rData_state_element;
  assign buffers_0_0_valid = buffer3_0_m2sPipe_valid;
  assign buffer3_0_m2sPipe_ready = buffers_0_0_ready;
  assign buffers_0_0_payload_round_index = buffer3_0_m2sPipe_payload_round_index;
  assign buffers_0_0_payload_state_index = buffer3_0_m2sPipe_payload_state_index;
  assign buffers_0_0_payload_state_size = buffer3_0_m2sPipe_payload_state_size;
  assign buffers_0_0_payload_state_id = buffer3_0_m2sPipe_payload_state_id;
  assign buffers_0_0_payload_state_element = buffer3_0_m2sPipe_payload_state_element;
  always @(*) begin
    buffer3_1_ready = buffer3_1_m2sPipe_ready;
    if(when_Stream_l342_13) begin
      buffer3_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_13 = (! buffer3_1_m2sPipe_valid);
  assign buffer3_1_m2sPipe_valid = buffer3_1_rValid;
  assign buffer3_1_m2sPipe_payload_round_index = buffer3_1_rData_round_index;
  assign buffer3_1_m2sPipe_payload_state_index = buffer3_1_rData_state_index;
  assign buffer3_1_m2sPipe_payload_state_size = buffer3_1_rData_state_size;
  assign buffer3_1_m2sPipe_payload_state_id = buffer3_1_rData_state_id;
  assign buffer3_1_m2sPipe_payload_state_element = buffer3_1_rData_state_element;
  assign buffers_0_1_valid = buffer3_1_m2sPipe_valid;
  assign buffer3_1_m2sPipe_ready = buffers_0_1_ready;
  assign buffers_0_1_payload_round_index = buffer3_1_m2sPipe_payload_round_index;
  assign buffers_0_1_payload_state_index = buffer3_1_m2sPipe_payload_state_index;
  assign buffers_0_1_payload_state_size = buffer3_1_m2sPipe_payload_state_size;
  assign buffers_0_1_payload_state_id = buffer3_1_m2sPipe_payload_state_id;
  assign buffers_0_1_payload_state_element = buffer3_1_m2sPipe_payload_state_element;
  always @(*) begin
    buffer3_2_ready = buffer3_2_m2sPipe_ready;
    if(when_Stream_l342_14) begin
      buffer3_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_14 = (! buffer3_2_m2sPipe_valid);
  assign buffer3_2_m2sPipe_valid = buffer3_2_rValid;
  assign buffer3_2_m2sPipe_payload_round_index = buffer3_2_rData_round_index;
  assign buffer3_2_m2sPipe_payload_state_index = buffer3_2_rData_state_index;
  assign buffer3_2_m2sPipe_payload_state_size = buffer3_2_rData_state_size;
  assign buffer3_2_m2sPipe_payload_state_id = buffer3_2_rData_state_id;
  assign buffer3_2_m2sPipe_payload_state_element = buffer3_2_rData_state_element;
  assign buffers_0_2_valid = buffer3_2_m2sPipe_valid;
  assign buffer3_2_m2sPipe_ready = buffers_0_2_ready;
  assign buffers_0_2_payload_round_index = buffer3_2_m2sPipe_payload_round_index;
  assign buffers_0_2_payload_state_index = buffer3_2_m2sPipe_payload_state_index;
  assign buffers_0_2_payload_state_size = buffer3_2_m2sPipe_payload_state_size;
  assign buffers_0_2_payload_state_id = buffer3_2_m2sPipe_payload_state_id;
  assign buffers_0_2_payload_state_element = buffer3_2_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_0_0_ready = buffers_0_0_m2sPipe_ready;
    if(when_Stream_l342_15) begin
      buffers_0_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342_15 = (! buffers_0_0_m2sPipe_valid);
  assign buffers_0_0_m2sPipe_valid = buffers_0_0_rValid;
  assign buffers_0_0_m2sPipe_payload_round_index = buffers_0_0_rData_round_index;
  assign buffers_0_0_m2sPipe_payload_state_index = buffers_0_0_rData_state_index;
  assign buffers_0_0_m2sPipe_payload_state_size = buffers_0_0_rData_state_size;
  assign buffers_0_0_m2sPipe_payload_state_id = buffers_0_0_rData_state_id;
  assign buffers_0_0_m2sPipe_payload_state_element = buffers_0_0_rData_state_element;
  assign buffers_1_0_valid = buffers_0_0_m2sPipe_valid;
  assign buffers_0_0_m2sPipe_ready = buffers_1_0_ready;
  assign buffers_1_0_payload_round_index = buffers_0_0_m2sPipe_payload_round_index;
  assign buffers_1_0_payload_state_index = buffers_0_0_m2sPipe_payload_state_index;
  assign buffers_1_0_payload_state_size = buffers_0_0_m2sPipe_payload_state_size;
  assign buffers_1_0_payload_state_id = buffers_0_0_m2sPipe_payload_state_id;
  assign buffers_1_0_payload_state_element = buffers_0_0_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_0_1_ready = buffers_0_1_m2sPipe_ready;
    if(when_Stream_l342_16) begin
      buffers_0_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_16 = (! buffers_0_1_m2sPipe_valid);
  assign buffers_0_1_m2sPipe_valid = buffers_0_1_rValid;
  assign buffers_0_1_m2sPipe_payload_round_index = buffers_0_1_rData_round_index;
  assign buffers_0_1_m2sPipe_payload_state_index = buffers_0_1_rData_state_index;
  assign buffers_0_1_m2sPipe_payload_state_size = buffers_0_1_rData_state_size;
  assign buffers_0_1_m2sPipe_payload_state_id = buffers_0_1_rData_state_id;
  assign buffers_0_1_m2sPipe_payload_state_element = buffers_0_1_rData_state_element;
  assign buffers_1_1_valid = buffers_0_1_m2sPipe_valid;
  assign buffers_0_1_m2sPipe_ready = buffers_1_1_ready;
  assign buffers_1_1_payload_round_index = buffers_0_1_m2sPipe_payload_round_index;
  assign buffers_1_1_payload_state_index = buffers_0_1_m2sPipe_payload_state_index;
  assign buffers_1_1_payload_state_size = buffers_0_1_m2sPipe_payload_state_size;
  assign buffers_1_1_payload_state_id = buffers_0_1_m2sPipe_payload_state_id;
  assign buffers_1_1_payload_state_element = buffers_0_1_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_0_2_ready = buffers_0_2_m2sPipe_ready;
    if(when_Stream_l342_17) begin
      buffers_0_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_17 = (! buffers_0_2_m2sPipe_valid);
  assign buffers_0_2_m2sPipe_valid = buffers_0_2_rValid;
  assign buffers_0_2_m2sPipe_payload_round_index = buffers_0_2_rData_round_index;
  assign buffers_0_2_m2sPipe_payload_state_index = buffers_0_2_rData_state_index;
  assign buffers_0_2_m2sPipe_payload_state_size = buffers_0_2_rData_state_size;
  assign buffers_0_2_m2sPipe_payload_state_id = buffers_0_2_rData_state_id;
  assign buffers_0_2_m2sPipe_payload_state_element = buffers_0_2_rData_state_element;
  assign buffers_1_2_valid = buffers_0_2_m2sPipe_valid;
  assign buffers_0_2_m2sPipe_ready = buffers_1_2_ready;
  assign buffers_1_2_payload_round_index = buffers_0_2_m2sPipe_payload_round_index;
  assign buffers_1_2_payload_state_index = buffers_0_2_m2sPipe_payload_state_index;
  assign buffers_1_2_payload_state_size = buffers_0_2_m2sPipe_payload_state_size;
  assign buffers_1_2_payload_state_id = buffers_0_2_m2sPipe_payload_state_id;
  assign buffers_1_2_payload_state_element = buffers_0_2_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_1_0_ready = buffers_1_0_m2sPipe_ready;
    if(when_Stream_l342_18) begin
      buffers_1_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342_18 = (! buffers_1_0_m2sPipe_valid);
  assign buffers_1_0_m2sPipe_valid = buffers_1_0_rValid;
  assign buffers_1_0_m2sPipe_payload_round_index = buffers_1_0_rData_round_index;
  assign buffers_1_0_m2sPipe_payload_state_index = buffers_1_0_rData_state_index;
  assign buffers_1_0_m2sPipe_payload_state_size = buffers_1_0_rData_state_size;
  assign buffers_1_0_m2sPipe_payload_state_id = buffers_1_0_rData_state_id;
  assign buffers_1_0_m2sPipe_payload_state_element = buffers_1_0_rData_state_element;
  assign buffers_2_0_valid = buffers_1_0_m2sPipe_valid;
  assign buffers_1_0_m2sPipe_ready = buffers_2_0_ready;
  assign buffers_2_0_payload_round_index = buffers_1_0_m2sPipe_payload_round_index;
  assign buffers_2_0_payload_state_index = buffers_1_0_m2sPipe_payload_state_index;
  assign buffers_2_0_payload_state_size = buffers_1_0_m2sPipe_payload_state_size;
  assign buffers_2_0_payload_state_id = buffers_1_0_m2sPipe_payload_state_id;
  assign buffers_2_0_payload_state_element = buffers_1_0_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_1_1_ready = buffers_1_1_m2sPipe_ready;
    if(when_Stream_l342_19) begin
      buffers_1_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_19 = (! buffers_1_1_m2sPipe_valid);
  assign buffers_1_1_m2sPipe_valid = buffers_1_1_rValid;
  assign buffers_1_1_m2sPipe_payload_round_index = buffers_1_1_rData_round_index;
  assign buffers_1_1_m2sPipe_payload_state_index = buffers_1_1_rData_state_index;
  assign buffers_1_1_m2sPipe_payload_state_size = buffers_1_1_rData_state_size;
  assign buffers_1_1_m2sPipe_payload_state_id = buffers_1_1_rData_state_id;
  assign buffers_1_1_m2sPipe_payload_state_element = buffers_1_1_rData_state_element;
  assign buffers_2_1_valid = buffers_1_1_m2sPipe_valid;
  assign buffers_1_1_m2sPipe_ready = buffers_2_1_ready;
  assign buffers_2_1_payload_round_index = buffers_1_1_m2sPipe_payload_round_index;
  assign buffers_2_1_payload_state_index = buffers_1_1_m2sPipe_payload_state_index;
  assign buffers_2_1_payload_state_size = buffers_1_1_m2sPipe_payload_state_size;
  assign buffers_2_1_payload_state_id = buffers_1_1_m2sPipe_payload_state_id;
  assign buffers_2_1_payload_state_element = buffers_1_1_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_1_2_ready = buffers_1_2_m2sPipe_ready;
    if(when_Stream_l342_20) begin
      buffers_1_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_20 = (! buffers_1_2_m2sPipe_valid);
  assign buffers_1_2_m2sPipe_valid = buffers_1_2_rValid;
  assign buffers_1_2_m2sPipe_payload_round_index = buffers_1_2_rData_round_index;
  assign buffers_1_2_m2sPipe_payload_state_index = buffers_1_2_rData_state_index;
  assign buffers_1_2_m2sPipe_payload_state_size = buffers_1_2_rData_state_size;
  assign buffers_1_2_m2sPipe_payload_state_id = buffers_1_2_rData_state_id;
  assign buffers_1_2_m2sPipe_payload_state_element = buffers_1_2_rData_state_element;
  assign buffers_2_2_valid = buffers_1_2_m2sPipe_valid;
  assign buffers_1_2_m2sPipe_ready = buffers_2_2_ready;
  assign buffers_2_2_payload_round_index = buffers_1_2_m2sPipe_payload_round_index;
  assign buffers_2_2_payload_state_index = buffers_1_2_m2sPipe_payload_state_index;
  assign buffers_2_2_payload_state_size = buffers_1_2_m2sPipe_payload_state_size;
  assign buffers_2_2_payload_state_id = buffers_1_2_m2sPipe_payload_state_id;
  assign buffers_2_2_payload_state_element = buffers_1_2_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_2_0_ready = buffers_2_0_m2sPipe_ready;
    if(when_Stream_l342_21) begin
      buffers_2_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342_21 = (! buffers_2_0_m2sPipe_valid);
  assign buffers_2_0_m2sPipe_valid = buffers_2_0_rValid;
  assign buffers_2_0_m2sPipe_payload_round_index = buffers_2_0_rData_round_index;
  assign buffers_2_0_m2sPipe_payload_state_index = buffers_2_0_rData_state_index;
  assign buffers_2_0_m2sPipe_payload_state_size = buffers_2_0_rData_state_size;
  assign buffers_2_0_m2sPipe_payload_state_id = buffers_2_0_rData_state_id;
  assign buffers_2_0_m2sPipe_payload_state_element = buffers_2_0_rData_state_element;
  assign buffers_3_0_valid = buffers_2_0_m2sPipe_valid;
  assign buffers_2_0_m2sPipe_ready = buffers_3_0_ready;
  assign buffers_3_0_payload_round_index = buffers_2_0_m2sPipe_payload_round_index;
  assign buffers_3_0_payload_state_index = buffers_2_0_m2sPipe_payload_state_index;
  assign buffers_3_0_payload_state_size = buffers_2_0_m2sPipe_payload_state_size;
  assign buffers_3_0_payload_state_id = buffers_2_0_m2sPipe_payload_state_id;
  assign buffers_3_0_payload_state_element = buffers_2_0_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_2_1_ready = buffers_2_1_m2sPipe_ready;
    if(when_Stream_l342_22) begin
      buffers_2_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_22 = (! buffers_2_1_m2sPipe_valid);
  assign buffers_2_1_m2sPipe_valid = buffers_2_1_rValid;
  assign buffers_2_1_m2sPipe_payload_round_index = buffers_2_1_rData_round_index;
  assign buffers_2_1_m2sPipe_payload_state_index = buffers_2_1_rData_state_index;
  assign buffers_2_1_m2sPipe_payload_state_size = buffers_2_1_rData_state_size;
  assign buffers_2_1_m2sPipe_payload_state_id = buffers_2_1_rData_state_id;
  assign buffers_2_1_m2sPipe_payload_state_element = buffers_2_1_rData_state_element;
  assign buffers_3_1_valid = buffers_2_1_m2sPipe_valid;
  assign buffers_2_1_m2sPipe_ready = buffers_3_1_ready;
  assign buffers_3_1_payload_round_index = buffers_2_1_m2sPipe_payload_round_index;
  assign buffers_3_1_payload_state_index = buffers_2_1_m2sPipe_payload_state_index;
  assign buffers_3_1_payload_state_size = buffers_2_1_m2sPipe_payload_state_size;
  assign buffers_3_1_payload_state_id = buffers_2_1_m2sPipe_payload_state_id;
  assign buffers_3_1_payload_state_element = buffers_2_1_m2sPipe_payload_state_element;
  always @(*) begin
    buffers_2_2_ready = buffers_2_2_m2sPipe_ready;
    if(when_Stream_l342_23) begin
      buffers_2_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_23 = (! buffers_2_2_m2sPipe_valid);
  assign buffers_2_2_m2sPipe_valid = buffers_2_2_rValid;
  assign buffers_2_2_m2sPipe_payload_round_index = buffers_2_2_rData_round_index;
  assign buffers_2_2_m2sPipe_payload_state_index = buffers_2_2_rData_state_index;
  assign buffers_2_2_m2sPipe_payload_state_size = buffers_2_2_rData_state_size;
  assign buffers_2_2_m2sPipe_payload_state_id = buffers_2_2_rData_state_id;
  assign buffers_2_2_m2sPipe_payload_state_element = buffers_2_2_rData_state_element;
  assign buffers_3_2_valid = buffers_2_2_m2sPipe_valid;
  assign buffers_2_2_m2sPipe_ready = buffers_3_2_ready;
  assign buffers_3_2_payload_round_index = buffers_2_2_m2sPipe_payload_round_index;
  assign buffers_3_2_payload_state_index = buffers_2_2_m2sPipe_payload_state_index;
  assign buffers_3_2_payload_state_size = buffers_2_2_m2sPipe_payload_state_size;
  assign buffers_3_2_payload_state_id = buffers_2_2_m2sPipe_payload_state_id;
  assign buffers_3_2_payload_state_element = buffers_2_2_m2sPipe_payload_state_element;
  always @(*) begin
    io_residue = 4'b1100;
    if(when_PoseidonTopLevel_l88) begin
      io_residue = 4'b1001;
    end
    if(when_PoseidonTopLevel_l91) begin
      io_residue = 4'b0110;
    end
    if(when_PoseidonTopLevel_l94) begin
      io_residue = 4'b0011;
    end
    if(when_PoseidonTopLevel_l97) begin
      io_residue = 4'b0000;
    end
  end

  assign when_PoseidonTopLevel_l88 = ((buffers_0_0_valid && buffers_0_1_valid) && buffers_0_2_valid);
  assign when_PoseidonTopLevel_l91 = ((buffers_1_0_valid && buffers_1_1_valid) && buffers_1_2_valid);
  assign when_PoseidonTopLevel_l94 = ((buffers_2_0_valid && buffers_2_1_valid) && buffers_2_2_valid);
  assign when_PoseidonTopLevel_l97 = ((buffers_3_0_valid && buffers_3_1_valid) && buffers_3_2_valid);
  assign io_outputs_0_valid = buffers_3_0_valid;
  assign buffers_3_0_ready = io_outputs_0_ready;
  assign io_outputs_0_payload_round_index = buffers_3_0_payload_round_index;
  assign io_outputs_0_payload_state_index = buffers_3_0_payload_state_index;
  assign io_outputs_0_payload_state_size = buffers_3_0_payload_state_size;
  assign io_outputs_0_payload_state_id = buffers_3_0_payload_state_id;
  assign io_outputs_0_payload_state_element = buffers_3_0_payload_state_element;
  assign io_outputs_1_valid = buffers_3_1_valid;
  assign buffers_3_1_ready = io_outputs_1_ready;
  assign io_outputs_1_payload_round_index = buffers_3_1_payload_round_index;
  assign io_outputs_1_payload_state_index = buffers_3_1_payload_state_index;
  assign io_outputs_1_payload_state_size = buffers_3_1_payload_state_size;
  assign io_outputs_1_payload_state_id = buffers_3_1_payload_state_id;
  assign io_outputs_1_payload_state_element = buffers_3_1_payload_state_element;
  assign io_outputs_2_valid = buffers_3_2_valid;
  assign buffers_3_2_ready = io_outputs_2_ready;
  assign io_outputs_2_payload_round_index = buffers_3_2_payload_round_index;
  assign io_outputs_2_payload_state_index = buffers_3_2_payload_state_index;
  assign io_outputs_2_payload_state_size = buffers_3_2_payload_state_size;
  assign io_outputs_2_payload_state_id = buffers_3_2_payload_state_id;
  assign io_outputs_2_payload_state_element = buffers_3_2_payload_state_element;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inputs_0_rValid <= 1'b0;
      streamArbiter_9_io_output_rValid <= 1'b0;
      streamArbiter_10_io_output_rValid <= 1'b0;
      streamArbiter_11_io_output_rValid <= 1'b0;
      inputs_1_rValid <= 1'b0;
      streamArbiter_12_io_output_rValid <= 1'b0;
      streamArbiter_13_io_output_rValid <= 1'b0;
      streamArbiter_14_io_output_rValid <= 1'b0;
      inputs_2_rValid <= 1'b0;
      streamArbiter_15_io_output_rValid <= 1'b0;
      streamArbiter_16_io_output_rValid <= 1'b0;
      streamArbiter_17_io_output_rValid <= 1'b0;
      buffer3_0_rValid <= 1'b0;
      buffer3_1_rValid <= 1'b0;
      buffer3_2_rValid <= 1'b0;
      buffers_0_0_rValid <= 1'b0;
      buffers_0_1_rValid <= 1'b0;
      buffers_0_2_rValid <= 1'b0;
      buffers_1_0_rValid <= 1'b0;
      buffers_1_1_rValid <= 1'b0;
      buffers_1_2_rValid <= 1'b0;
      buffers_2_0_rValid <= 1'b0;
      buffers_2_1_rValid <= 1'b0;
      buffers_2_2_rValid <= 1'b0;
    end else begin
      if(inputs_0_ready) begin
        inputs_0_rValid <= inputs_0_valid;
      end
      if(streamArbiter_9_io_output_ready) begin
        streamArbiter_9_io_output_rValid <= streamArbiter_9_io_output_valid;
      end
      if(streamArbiter_10_io_output_ready) begin
        streamArbiter_10_io_output_rValid <= streamArbiter_10_io_output_valid;
      end
      if(streamArbiter_11_io_output_ready) begin
        streamArbiter_11_io_output_rValid <= streamArbiter_11_io_output_valid;
      end
      if(inputs_1_ready) begin
        inputs_1_rValid <= inputs_1_valid;
      end
      if(streamArbiter_12_io_output_ready) begin
        streamArbiter_12_io_output_rValid <= streamArbiter_12_io_output_valid;
      end
      if(streamArbiter_13_io_output_ready) begin
        streamArbiter_13_io_output_rValid <= streamArbiter_13_io_output_valid;
      end
      if(streamArbiter_14_io_output_ready) begin
        streamArbiter_14_io_output_rValid <= streamArbiter_14_io_output_valid;
      end
      if(inputs_2_ready) begin
        inputs_2_rValid <= inputs_2_valid;
      end
      if(streamArbiter_15_io_output_ready) begin
        streamArbiter_15_io_output_rValid <= streamArbiter_15_io_output_valid;
      end
      if(streamArbiter_16_io_output_ready) begin
        streamArbiter_16_io_output_rValid <= streamArbiter_16_io_output_valid;
      end
      if(streamArbiter_17_io_output_ready) begin
        streamArbiter_17_io_output_rValid <= streamArbiter_17_io_output_valid;
      end
      if(buffer3_0_ready) begin
        buffer3_0_rValid <= buffer3_0_valid;
      end
      if(buffer3_1_ready) begin
        buffer3_1_rValid <= buffer3_1_valid;
      end
      if(buffer3_2_ready) begin
        buffer3_2_rValid <= buffer3_2_valid;
      end
      if(buffers_0_0_ready) begin
        buffers_0_0_rValid <= buffers_0_0_valid;
      end
      if(buffers_0_1_ready) begin
        buffers_0_1_rValid <= buffers_0_1_valid;
      end
      if(buffers_0_2_ready) begin
        buffers_0_2_rValid <= buffers_0_2_valid;
      end
      if(buffers_1_0_ready) begin
        buffers_1_0_rValid <= buffers_1_0_valid;
      end
      if(buffers_1_1_ready) begin
        buffers_1_1_rValid <= buffers_1_1_valid;
      end
      if(buffers_1_2_ready) begin
        buffers_1_2_rValid <= buffers_1_2_valid;
      end
      if(buffers_2_0_ready) begin
        buffers_2_0_rValid <= buffers_2_0_valid;
      end
      if(buffers_2_1_ready) begin
        buffers_2_1_rValid <= buffers_2_1_valid;
      end
      if(buffers_2_2_ready) begin
        buffers_2_2_rValid <= buffers_2_2_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(inputs_0_ready) begin
      inputs_0_rData_round_index <= inputs_0_payload_round_index;
      inputs_0_rData_state_index <= inputs_0_payload_state_index;
      inputs_0_rData_state_size <= inputs_0_payload_state_size;
      inputs_0_rData_state_id <= inputs_0_payload_state_id;
      inputs_0_rData_state_element <= inputs_0_payload_state_element;
    end
    if(streamArbiter_9_io_output_ready) begin
      streamArbiter_9_io_output_rData_round_index <= streamArbiter_9_io_output_payload_round_index;
      streamArbiter_9_io_output_rData_state_index <= streamArbiter_9_io_output_payload_state_index;
      streamArbiter_9_io_output_rData_state_size <= streamArbiter_9_io_output_payload_state_size;
      streamArbiter_9_io_output_rData_state_id <= streamArbiter_9_io_output_payload_state_id;
      streamArbiter_9_io_output_rData_state_element <= streamArbiter_9_io_output_payload_state_element;
    end
    if(streamArbiter_10_io_output_ready) begin
      streamArbiter_10_io_output_rData_round_index <= streamArbiter_10_io_output_payload_round_index;
      streamArbiter_10_io_output_rData_state_index <= streamArbiter_10_io_output_payload_state_index;
      streamArbiter_10_io_output_rData_state_size <= streamArbiter_10_io_output_payload_state_size;
      streamArbiter_10_io_output_rData_state_id <= streamArbiter_10_io_output_payload_state_id;
      streamArbiter_10_io_output_rData_state_element <= streamArbiter_10_io_output_payload_state_element;
    end
    if(streamArbiter_11_io_output_ready) begin
      streamArbiter_11_io_output_rData_round_index <= streamArbiter_11_io_output_payload_round_index;
      streamArbiter_11_io_output_rData_state_index <= streamArbiter_11_io_output_payload_state_index;
      streamArbiter_11_io_output_rData_state_size <= streamArbiter_11_io_output_payload_state_size;
      streamArbiter_11_io_output_rData_state_id <= streamArbiter_11_io_output_payload_state_id;
      streamArbiter_11_io_output_rData_state_element <= streamArbiter_11_io_output_payload_state_element;
    end
    if(inputs_1_ready) begin
      inputs_1_rData_round_index <= inputs_1_payload_round_index;
      inputs_1_rData_state_index <= inputs_1_payload_state_index;
      inputs_1_rData_state_size <= inputs_1_payload_state_size;
      inputs_1_rData_state_id <= inputs_1_payload_state_id;
      inputs_1_rData_state_element <= inputs_1_payload_state_element;
    end
    if(streamArbiter_12_io_output_ready) begin
      streamArbiter_12_io_output_rData_round_index <= streamArbiter_12_io_output_payload_round_index;
      streamArbiter_12_io_output_rData_state_index <= streamArbiter_12_io_output_payload_state_index;
      streamArbiter_12_io_output_rData_state_size <= streamArbiter_12_io_output_payload_state_size;
      streamArbiter_12_io_output_rData_state_id <= streamArbiter_12_io_output_payload_state_id;
      streamArbiter_12_io_output_rData_state_element <= streamArbiter_12_io_output_payload_state_element;
    end
    if(streamArbiter_13_io_output_ready) begin
      streamArbiter_13_io_output_rData_round_index <= streamArbiter_13_io_output_payload_round_index;
      streamArbiter_13_io_output_rData_state_index <= streamArbiter_13_io_output_payload_state_index;
      streamArbiter_13_io_output_rData_state_size <= streamArbiter_13_io_output_payload_state_size;
      streamArbiter_13_io_output_rData_state_id <= streamArbiter_13_io_output_payload_state_id;
      streamArbiter_13_io_output_rData_state_element <= streamArbiter_13_io_output_payload_state_element;
    end
    if(streamArbiter_14_io_output_ready) begin
      streamArbiter_14_io_output_rData_round_index <= streamArbiter_14_io_output_payload_round_index;
      streamArbiter_14_io_output_rData_state_index <= streamArbiter_14_io_output_payload_state_index;
      streamArbiter_14_io_output_rData_state_size <= streamArbiter_14_io_output_payload_state_size;
      streamArbiter_14_io_output_rData_state_id <= streamArbiter_14_io_output_payload_state_id;
      streamArbiter_14_io_output_rData_state_element <= streamArbiter_14_io_output_payload_state_element;
    end
    if(inputs_2_ready) begin
      inputs_2_rData_round_index <= inputs_2_payload_round_index;
      inputs_2_rData_state_index <= inputs_2_payload_state_index;
      inputs_2_rData_state_size <= inputs_2_payload_state_size;
      inputs_2_rData_state_id <= inputs_2_payload_state_id;
      inputs_2_rData_state_element <= inputs_2_payload_state_element;
    end
    if(streamArbiter_15_io_output_ready) begin
      streamArbiter_15_io_output_rData_round_index <= streamArbiter_15_io_output_payload_round_index;
      streamArbiter_15_io_output_rData_state_index <= streamArbiter_15_io_output_payload_state_index;
      streamArbiter_15_io_output_rData_state_size <= streamArbiter_15_io_output_payload_state_size;
      streamArbiter_15_io_output_rData_state_id <= streamArbiter_15_io_output_payload_state_id;
      streamArbiter_15_io_output_rData_state_element <= streamArbiter_15_io_output_payload_state_element;
    end
    if(streamArbiter_16_io_output_ready) begin
      streamArbiter_16_io_output_rData_round_index <= streamArbiter_16_io_output_payload_round_index;
      streamArbiter_16_io_output_rData_state_index <= streamArbiter_16_io_output_payload_state_index;
      streamArbiter_16_io_output_rData_state_size <= streamArbiter_16_io_output_payload_state_size;
      streamArbiter_16_io_output_rData_state_id <= streamArbiter_16_io_output_payload_state_id;
      streamArbiter_16_io_output_rData_state_element <= streamArbiter_16_io_output_payload_state_element;
    end
    if(streamArbiter_17_io_output_ready) begin
      streamArbiter_17_io_output_rData_round_index <= streamArbiter_17_io_output_payload_round_index;
      streamArbiter_17_io_output_rData_state_index <= streamArbiter_17_io_output_payload_state_index;
      streamArbiter_17_io_output_rData_state_size <= streamArbiter_17_io_output_payload_state_size;
      streamArbiter_17_io_output_rData_state_id <= streamArbiter_17_io_output_payload_state_id;
      streamArbiter_17_io_output_rData_state_element <= streamArbiter_17_io_output_payload_state_element;
    end
    if(buffer3_0_ready) begin
      buffer3_0_rData_round_index <= buffer3_0_payload_round_index;
      buffer3_0_rData_state_index <= buffer3_0_payload_state_index;
      buffer3_0_rData_state_size <= buffer3_0_payload_state_size;
      buffer3_0_rData_state_id <= buffer3_0_payload_state_id;
      buffer3_0_rData_state_element <= buffer3_0_payload_state_element;
    end
    if(buffer3_1_ready) begin
      buffer3_1_rData_round_index <= buffer3_1_payload_round_index;
      buffer3_1_rData_state_index <= buffer3_1_payload_state_index;
      buffer3_1_rData_state_size <= buffer3_1_payload_state_size;
      buffer3_1_rData_state_id <= buffer3_1_payload_state_id;
      buffer3_1_rData_state_element <= buffer3_1_payload_state_element;
    end
    if(buffer3_2_ready) begin
      buffer3_2_rData_round_index <= buffer3_2_payload_round_index;
      buffer3_2_rData_state_index <= buffer3_2_payload_state_index;
      buffer3_2_rData_state_size <= buffer3_2_payload_state_size;
      buffer3_2_rData_state_id <= buffer3_2_payload_state_id;
      buffer3_2_rData_state_element <= buffer3_2_payload_state_element;
    end
    if(buffers_0_0_ready) begin
      buffers_0_0_rData_round_index <= buffers_0_0_payload_round_index;
      buffers_0_0_rData_state_index <= buffers_0_0_payload_state_index;
      buffers_0_0_rData_state_size <= buffers_0_0_payload_state_size;
      buffers_0_0_rData_state_id <= buffers_0_0_payload_state_id;
      buffers_0_0_rData_state_element <= buffers_0_0_payload_state_element;
    end
    if(buffers_0_1_ready) begin
      buffers_0_1_rData_round_index <= buffers_0_1_payload_round_index;
      buffers_0_1_rData_state_index <= buffers_0_1_payload_state_index;
      buffers_0_1_rData_state_size <= buffers_0_1_payload_state_size;
      buffers_0_1_rData_state_id <= buffers_0_1_payload_state_id;
      buffers_0_1_rData_state_element <= buffers_0_1_payload_state_element;
    end
    if(buffers_0_2_ready) begin
      buffers_0_2_rData_round_index <= buffers_0_2_payload_round_index;
      buffers_0_2_rData_state_index <= buffers_0_2_payload_state_index;
      buffers_0_2_rData_state_size <= buffers_0_2_payload_state_size;
      buffers_0_2_rData_state_id <= buffers_0_2_payload_state_id;
      buffers_0_2_rData_state_element <= buffers_0_2_payload_state_element;
    end
    if(buffers_1_0_ready) begin
      buffers_1_0_rData_round_index <= buffers_1_0_payload_round_index;
      buffers_1_0_rData_state_index <= buffers_1_0_payload_state_index;
      buffers_1_0_rData_state_size <= buffers_1_0_payload_state_size;
      buffers_1_0_rData_state_id <= buffers_1_0_payload_state_id;
      buffers_1_0_rData_state_element <= buffers_1_0_payload_state_element;
    end
    if(buffers_1_1_ready) begin
      buffers_1_1_rData_round_index <= buffers_1_1_payload_round_index;
      buffers_1_1_rData_state_index <= buffers_1_1_payload_state_index;
      buffers_1_1_rData_state_size <= buffers_1_1_payload_state_size;
      buffers_1_1_rData_state_id <= buffers_1_1_payload_state_id;
      buffers_1_1_rData_state_element <= buffers_1_1_payload_state_element;
    end
    if(buffers_1_2_ready) begin
      buffers_1_2_rData_round_index <= buffers_1_2_payload_round_index;
      buffers_1_2_rData_state_index <= buffers_1_2_payload_state_index;
      buffers_1_2_rData_state_size <= buffers_1_2_payload_state_size;
      buffers_1_2_rData_state_id <= buffers_1_2_payload_state_id;
      buffers_1_2_rData_state_element <= buffers_1_2_payload_state_element;
    end
    if(buffers_2_0_ready) begin
      buffers_2_0_rData_round_index <= buffers_2_0_payload_round_index;
      buffers_2_0_rData_state_index <= buffers_2_0_payload_state_index;
      buffers_2_0_rData_state_size <= buffers_2_0_payload_state_size;
      buffers_2_0_rData_state_id <= buffers_2_0_payload_state_id;
      buffers_2_0_rData_state_element <= buffers_2_0_payload_state_element;
    end
    if(buffers_2_1_ready) begin
      buffers_2_1_rData_round_index <= buffers_2_1_payload_round_index;
      buffers_2_1_rData_state_index <= buffers_2_1_payload_state_index;
      buffers_2_1_rData_state_size <= buffers_2_1_payload_state_size;
      buffers_2_1_rData_state_id <= buffers_2_1_payload_state_id;
      buffers_2_1_rData_state_element <= buffers_2_1_payload_state_element;
    end
    if(buffers_2_2_ready) begin
      buffers_2_2_rData_round_index <= buffers_2_2_payload_round_index;
      buffers_2_2_rData_state_index <= buffers_2_2_payload_state_index;
      buffers_2_2_rData_state_size <= buffers_2_2_payload_state_size;
      buffers_2_2_rData_state_id <= buffers_2_2_payload_state_id;
      buffers_2_2_rData_state_element <= buffers_2_2_payload_state_element;
    end
  end


endmodule

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

//StreamArbiter replaced by StreamArbiter

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_round_index,
  input      [3:0]    io_inputs_0_payload_state_index,
  input      [3:0]    io_inputs_0_payload_state_size,
  input      [3:0]    io_inputs_0_payload_state_id,
  input      [254:0]  io_inputs_0_payload_state_element,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [6:0]    io_inputs_1_payload_round_index,
  input      [3:0]    io_inputs_1_payload_state_index,
  input      [3:0]    io_inputs_1_payload_state_size,
  input      [3:0]    io_inputs_1_payload_state_id,
  input      [254:0]  io_inputs_1_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_index,
  output     [3:0]    io_output_payload_state_size,
  output     [3:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element,
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
  assign io_output_payload_state_index = (maskRouted_0 ? io_inputs_0_payload_state_index : io_inputs_1_payload_state_index);
  assign io_output_payload_state_size = (maskRouted_0 ? io_inputs_0_payload_state_size : io_inputs_1_payload_state_size);
  assign io_output_payload_state_id = (maskRouted_0 ? io_inputs_0_payload_state_id : io_inputs_1_payload_state_id);
  assign io_output_payload_state_element = (maskRouted_0 ? io_inputs_0_payload_state_element : io_inputs_1_payload_state_element);
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
