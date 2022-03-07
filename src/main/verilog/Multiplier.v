// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Multiplier
// Git hash  : edd9aa84312d82dcc1302c088dec35f306638af7



module Multiplier (
  input               io_input_valid,
  output              io_input_ready,
  input      [255:0]  io_input_payload_op1,
  input      [255:0]  io_input_payload_op2,
  output              io_output_valid,
  input               io_output_ready,
  output     [511:0]  io_output_payload_res,
  input               clk,
  input               reset
);
  wire                io_input_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_valid;
  wire       [255:0]  io_input_fork_io_outputs_0_payload_op1;
  wire       [255:0]  io_input_fork_io_outputs_0_payload_op2;
  wire                io_input_fork_io_outputs_1_valid;
  wire       [255:0]  io_input_fork_io_outputs_1_payload_op1;
  wire       [255:0]  io_input_fork_io_outputs_1_payload_op2;
  wire                io_input_fork_io_outputs_2_valid;
  wire       [255:0]  io_input_fork_io_outputs_2_payload_op1;
  wire       [255:0]  io_input_fork_io_outputs_2_payload_op2;
  wire                io_input_fork_io_outputs_3_valid;
  wire       [255:0]  io_input_fork_io_outputs_3_payload_op1;
  wire       [255:0]  io_input_fork_io_outputs_3_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload_op2;
  wire                multiplierIPStream_16_io_input_ready;
  wire                multiplierIPStream_16_io_output_valid;
  wire       [127:0]  multiplierIPStream_16_io_output_payload_res;
  wire                multiplierIPStream_17_io_input_ready;
  wire                multiplierIPStream_17_io_output_valid;
  wire       [127:0]  multiplierIPStream_17_io_output_payload_res;
  wire                multiplierIPStream_18_io_input_ready;
  wire                multiplierIPStream_18_io_output_valid;
  wire       [127:0]  multiplierIPStream_18_io_output_payload_res;
  wire                multiplierIPStream_19_io_input_ready;
  wire                multiplierIPStream_19_io_output_valid;
  wire       [127:0]  multiplierIPStream_19_io_output_payload_res;
  wire                io_input_fork_io_outputs_1_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_0_valid;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_0_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_0_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_1_valid;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_1_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_1_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_2_valid;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_2_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_2_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_3_valid;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_3_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_fork_io_outputs_3_payload_op2;
  wire                multiplierIPStream_20_io_input_ready;
  wire                multiplierIPStream_20_io_output_valid;
  wire       [127:0]  multiplierIPStream_20_io_output_payload_res;
  wire                multiplierIPStream_21_io_input_ready;
  wire                multiplierIPStream_21_io_output_valid;
  wire       [127:0]  multiplierIPStream_21_io_output_payload_res;
  wire                multiplierIPStream_22_io_input_ready;
  wire                multiplierIPStream_22_io_output_valid;
  wire       [127:0]  multiplierIPStream_22_io_output_payload_res;
  wire                multiplierIPStream_23_io_input_ready;
  wire                multiplierIPStream_23_io_output_valid;
  wire       [127:0]  multiplierIPStream_23_io_output_payload_res;
  wire                io_input_fork_io_outputs_2_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_0_valid;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_0_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_0_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_1_valid;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_1_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_1_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_2_valid;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_2_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_2_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_3_valid;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_3_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_fork_io_outputs_3_payload_op2;
  wire                multiplierIPStream_24_io_input_ready;
  wire                multiplierIPStream_24_io_output_valid;
  wire       [127:0]  multiplierIPStream_24_io_output_payload_res;
  wire                multiplierIPStream_25_io_input_ready;
  wire                multiplierIPStream_25_io_output_valid;
  wire       [127:0]  multiplierIPStream_25_io_output_payload_res;
  wire                multiplierIPStream_26_io_input_ready;
  wire                multiplierIPStream_26_io_output_valid;
  wire       [127:0]  multiplierIPStream_26_io_output_payload_res;
  wire                multiplierIPStream_27_io_input_ready;
  wire                multiplierIPStream_27_io_output_valid;
  wire       [127:0]  multiplierIPStream_27_io_output_payload_res;
  wire                io_input_fork_io_outputs_3_translated_fork_io_input_ready;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_0_valid;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_0_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_0_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_1_valid;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_1_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_1_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_2_valid;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_2_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_2_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_3_valid;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_3_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_fork_io_outputs_3_payload_op2;
  wire                multiplierIPStream_28_io_input_ready;
  wire                multiplierIPStream_28_io_output_valid;
  wire       [127:0]  multiplierIPStream_28_io_output_payload_res;
  wire                multiplierIPStream_29_io_input_ready;
  wire                multiplierIPStream_29_io_output_valid;
  wire       [127:0]  multiplierIPStream_29_io_output_payload_res;
  wire                multiplierIPStream_30_io_input_ready;
  wire                multiplierIPStream_30_io_output_valid;
  wire       [127:0]  multiplierIPStream_30_io_output_payload_res;
  wire                multiplierIPStream_31_io_input_ready;
  wire                multiplierIPStream_31_io_output_valid;
  wire       [127:0]  multiplierIPStream_31_io_output_payload_res;
  wire       [255:0]  _zz__zz_io_output_payload_res;
  wire       [255:0]  _zz__zz_io_output_payload_res_1;
  wire       [255:0]  _zz__zz_io_output_payload_res_2;
  wire       [192:0]  _zz__zz_io_output_payload_res_3;
  wire       [128:0]  _zz__zz_io_output_payload_res_4;
  wire       [255:0]  _zz__zz_io_output_payload_res_5;
  wire       [255:0]  _zz__zz_io_output_payload_res_1_1;
  wire       [255:0]  _zz__zz_io_output_payload_res_1_2;
  wire       [255:0]  _zz__zz_io_output_payload_res_1_3;
  wire       [192:0]  _zz__zz_io_output_payload_res_1_4;
  wire       [128:0]  _zz__zz_io_output_payload_res_1_5;
  wire       [255:0]  _zz__zz_io_output_payload_res_1_6;
  wire       [255:0]  _zz__zz_io_output_payload_res_2_1;
  wire       [255:0]  _zz__zz_io_output_payload_res_2_2;
  wire       [255:0]  _zz__zz_io_output_payload_res_2_3;
  wire       [192:0]  _zz__zz_io_output_payload_res_2_4;
  wire       [128:0]  _zz__zz_io_output_payload_res_2_5;
  wire       [255:0]  _zz__zz_io_output_payload_res_2_6;
  wire       [255:0]  _zz__zz_io_output_payload_res_3_1;
  wire       [255:0]  _zz__zz_io_output_payload_res_3_2;
  wire       [255:0]  _zz__zz_io_output_payload_res_3_3;
  wire       [192:0]  _zz__zz_io_output_payload_res_3_4;
  wire       [128:0]  _zz__zz_io_output_payload_res_3_5;
  wire       [255:0]  _zz__zz_io_output_payload_res_3_6;
  wire       [511:0]  _zz__zz_io_output_payload_res_4_1;
  wire       [511:0]  _zz__zz_io_output_payload_res_4_2;
  wire       [511:0]  _zz__zz_io_output_payload_res_4_3;
  wire       [384:0]  _zz__zz_io_output_payload_res_4_4;
  wire       [256:0]  _zz__zz_io_output_payload_res_4_5;
  wire       [511:0]  _zz__zz_io_output_payload_res_4_6;
  wire       [127:0]  _zz_io_input_fork_io_outputs_2_translated_payload_op1;
  wire       [127:0]  _zz_io_input_fork_io_outputs_0_translated_payload_op1;
  wire       [127:0]  _zz_io_input_fork_io_outputs_1_translated_payload_op2;
  wire       [127:0]  _zz_io_input_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_ready;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_0_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op2;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_valid;
  wire                io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op2;
  wire                _zz_io_output_valid;
  wire                _zz_io_output_ready;
  reg                 _zz_io_output_ready_1;
  wire                _zz_io_output_valid_1;
  reg                 _zz_io_output_valid_2;
  reg        [255:0]  _zz_io_output_payload_res;
  wire                when_Stream_l342;
  wire                io_input_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_ready;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_1_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op2;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_valid;
  wire                io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op2;
  wire                _zz_io_output_valid_3;
  wire                _zz_io_output_ready_2;
  reg                 _zz_io_output_ready_3;
  wire                _zz_io_output_valid_4;
  reg                 _zz_io_output_valid_5;
  reg        [255:0]  _zz_io_output_payload_res_1;
  wire                when_Stream_l342_1;
  wire                io_input_fork_io_outputs_2_translated_valid;
  wire                io_input_fork_io_outputs_2_translated_ready;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_2_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_valid;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op2;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_valid;
  wire                io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op2;
  wire                _zz_io_output_valid_6;
  wire                _zz_io_output_ready_4;
  reg                 _zz_io_output_ready_5;
  wire                _zz_io_output_valid_7;
  reg                 _zz_io_output_valid_8;
  reg        [255:0]  _zz_io_output_payload_res_2;
  wire                when_Stream_l342_2;
  wire                io_input_fork_io_outputs_3_translated_valid;
  wire                io_input_fork_io_outputs_3_translated_ready;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_payload_op1;
  wire       [127:0]  io_input_fork_io_outputs_3_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2;
  wire       [63:0]   _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_valid;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_valid;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_valid;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op2;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_valid;
  wire                io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_ready;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op1;
  wire       [63:0]   io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op2;
  wire                _zz_io_output_valid_9;
  wire                _zz_io_output_ready_6;
  reg                 _zz_io_output_ready_7;
  wire                _zz_io_output_valid_10;
  reg                 _zz_io_output_valid_11;
  reg        [255:0]  _zz_io_output_payload_res_3;
  wire                when_Stream_l342_3;
  wire                _zz_io_output_valid_12;
  wire                _zz_io_output_ready_8;
  reg                 _zz_io_output_ready_9;
  wire                _zz_io_output_valid_13;
  reg                 _zz_io_output_valid_14;
  reg        [511:0]  _zz_io_output_payload_res_4;
  wire                when_Stream_l342_4;

  assign _zz__zz_io_output_payload_res = (_zz__zz_io_output_payload_res_1 + _zz__zz_io_output_payload_res_2);
  assign _zz__zz_io_output_payload_res_1 = ({128'd0,multiplierIPStream_16_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_3 = ({64'd0,_zz__zz_io_output_payload_res_4} <<< 64);
  assign _zz__zz_io_output_payload_res_2 = {63'd0, _zz__zz_io_output_payload_res_3};
  assign _zz__zz_io_output_payload_res_4 = ({1'b0,multiplierIPStream_17_io_output_payload_res} + {1'b0,multiplierIPStream_18_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_5 = {128'd0, multiplierIPStream_19_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_1_1 = (_zz__zz_io_output_payload_res_1_2 + _zz__zz_io_output_payload_res_1_3);
  assign _zz__zz_io_output_payload_res_1_2 = ({128'd0,multiplierIPStream_20_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_1_4 = ({64'd0,_zz__zz_io_output_payload_res_1_5} <<< 64);
  assign _zz__zz_io_output_payload_res_1_3 = {63'd0, _zz__zz_io_output_payload_res_1_4};
  assign _zz__zz_io_output_payload_res_1_5 = ({1'b0,multiplierIPStream_21_io_output_payload_res} + {1'b0,multiplierIPStream_22_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_1_6 = {128'd0, multiplierIPStream_23_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_2_1 = (_zz__zz_io_output_payload_res_2_2 + _zz__zz_io_output_payload_res_2_3);
  assign _zz__zz_io_output_payload_res_2_2 = ({128'd0,multiplierIPStream_24_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_2_4 = ({64'd0,_zz__zz_io_output_payload_res_2_5} <<< 64);
  assign _zz__zz_io_output_payload_res_2_3 = {63'd0, _zz__zz_io_output_payload_res_2_4};
  assign _zz__zz_io_output_payload_res_2_5 = ({1'b0,multiplierIPStream_25_io_output_payload_res} + {1'b0,multiplierIPStream_26_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_2_6 = {128'd0, multiplierIPStream_27_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_3_1 = (_zz__zz_io_output_payload_res_3_2 + _zz__zz_io_output_payload_res_3_3);
  assign _zz__zz_io_output_payload_res_3_2 = ({128'd0,multiplierIPStream_28_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_3_4 = ({64'd0,_zz__zz_io_output_payload_res_3_5} <<< 64);
  assign _zz__zz_io_output_payload_res_3_3 = {63'd0, _zz__zz_io_output_payload_res_3_4};
  assign _zz__zz_io_output_payload_res_3_5 = ({1'b0,multiplierIPStream_29_io_output_payload_res} + {1'b0,multiplierIPStream_30_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_3_6 = {128'd0, multiplierIPStream_31_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_4_1 = (_zz__zz_io_output_payload_res_4_2 + _zz__zz_io_output_payload_res_4_3);
  assign _zz__zz_io_output_payload_res_4_2 = ({256'd0,_zz_io_output_payload_res} <<< 256);
  assign _zz__zz_io_output_payload_res_4_4 = ({128'd0,_zz__zz_io_output_payload_res_4_5} <<< 128);
  assign _zz__zz_io_output_payload_res_4_3 = {127'd0, _zz__zz_io_output_payload_res_4_4};
  assign _zz__zz_io_output_payload_res_4_5 = ({1'b0,_zz_io_output_payload_res_1} + {1'b0,_zz_io_output_payload_res_2});
  assign _zz__zz_io_output_payload_res_4_6 = {256'd0, _zz_io_output_payload_res_3};
  StreamFork io_input_fork (
    .io_input_valid              (io_input_valid                               ), //i
    .io_input_ready              (io_input_fork_io_input_ready                 ), //o
    .io_input_payload_op1        (io_input_payload_op1                         ), //i
    .io_input_payload_op2        (io_input_payload_op2                         ), //i
    .io_outputs_0_valid          (io_input_fork_io_outputs_0_valid             ), //o
    .io_outputs_0_ready          (io_input_fork_io_outputs_0_translated_ready  ), //i
    .io_outputs_0_payload_op1    (io_input_fork_io_outputs_0_payload_op1       ), //o
    .io_outputs_0_payload_op2    (io_input_fork_io_outputs_0_payload_op2       ), //o
    .io_outputs_1_valid          (io_input_fork_io_outputs_1_valid             ), //o
    .io_outputs_1_ready          (io_input_fork_io_outputs_1_translated_ready  ), //i
    .io_outputs_1_payload_op1    (io_input_fork_io_outputs_1_payload_op1       ), //o
    .io_outputs_1_payload_op2    (io_input_fork_io_outputs_1_payload_op2       ), //o
    .io_outputs_2_valid          (io_input_fork_io_outputs_2_valid             ), //o
    .io_outputs_2_ready          (io_input_fork_io_outputs_2_translated_ready  ), //i
    .io_outputs_2_payload_op1    (io_input_fork_io_outputs_2_payload_op1       ), //o
    .io_outputs_2_payload_op2    (io_input_fork_io_outputs_2_payload_op2       ), //o
    .io_outputs_3_valid          (io_input_fork_io_outputs_3_valid             ), //o
    .io_outputs_3_ready          (io_input_fork_io_outputs_3_translated_ready  ), //i
    .io_outputs_3_payload_op1    (io_input_fork_io_outputs_3_payload_op1       ), //o
    .io_outputs_3_payload_op2    (io_input_fork_io_outputs_3_payload_op2       )  //o
  );
  StreamFork_1 io_input_fork_io_outputs_0_translated_fork (
    .io_input_valid              (io_input_fork_io_outputs_0_translated_valid                               ), //i
    .io_input_ready              (io_input_fork_io_outputs_0_translated_fork_io_input_ready                 ), //o
    .io_input_payload_op1        (io_input_fork_io_outputs_0_translated_payload_op1                         ), //i
    .io_input_payload_op2        (io_input_fork_io_outputs_0_translated_payload_op2                         ), //i
    .io_outputs_0_valid          (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid             ), //o
    .io_outputs_0_ready          (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_ready  ), //i
    .io_outputs_0_payload_op1    (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload_op1       ), //o
    .io_outputs_0_payload_op2    (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_payload_op2       ), //o
    .io_outputs_1_valid          (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid             ), //o
    .io_outputs_1_ready          (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_ready  ), //i
    .io_outputs_1_payload_op1    (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload_op1       ), //o
    .io_outputs_1_payload_op2    (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_payload_op2       ), //o
    .io_outputs_2_valid          (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid             ), //o
    .io_outputs_2_ready          (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_ready  ), //i
    .io_outputs_2_payload_op1    (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload_op1       ), //o
    .io_outputs_2_payload_op2    (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_payload_op2       ), //o
    .io_outputs_3_valid          (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid             ), //o
    .io_outputs_3_ready          (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_ready  ), //i
    .io_outputs_3_payload_op1    (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload_op1       ), //o
    .io_outputs_3_payload_op2    (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_payload_op2       )  //o
  );
  MultiplierIPStream multiplierIPStream_16 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_16_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_16_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_16_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_17 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_17_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_17_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_17_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_18 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_18_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_18_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_18_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_19 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_19_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_19_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_19_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  StreamFork_1 io_input_fork_io_outputs_1_translated_fork (
    .io_input_valid              (io_input_fork_io_outputs_1_translated_valid                               ), //i
    .io_input_ready              (io_input_fork_io_outputs_1_translated_fork_io_input_ready                 ), //o
    .io_input_payload_op1        (io_input_fork_io_outputs_1_translated_payload_op1                         ), //i
    .io_input_payload_op2        (io_input_fork_io_outputs_1_translated_payload_op2                         ), //i
    .io_outputs_0_valid          (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_valid             ), //o
    .io_outputs_0_ready          (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_ready  ), //i
    .io_outputs_0_payload_op1    (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_payload_op1       ), //o
    .io_outputs_0_payload_op2    (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_payload_op2       ), //o
    .io_outputs_1_valid          (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_valid             ), //o
    .io_outputs_1_ready          (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_ready  ), //i
    .io_outputs_1_payload_op1    (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_payload_op1       ), //o
    .io_outputs_1_payload_op2    (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_payload_op2       ), //o
    .io_outputs_2_valid          (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_valid             ), //o
    .io_outputs_2_ready          (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_ready  ), //i
    .io_outputs_2_payload_op1    (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_payload_op1       ), //o
    .io_outputs_2_payload_op2    (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_payload_op2       ), //o
    .io_outputs_3_valid          (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_valid             ), //o
    .io_outputs_3_ready          (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_ready  ), //i
    .io_outputs_3_payload_op1    (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_payload_op1       ), //o
    .io_outputs_3_payload_op2    (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_payload_op2       )  //o
  );
  MultiplierIPStream multiplierIPStream_20 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_20_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_20_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_20_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_21 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_21_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_21_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_21_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_22 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_22_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_22_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_22_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_23 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_23_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_23_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_23_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  StreamFork_1 io_input_fork_io_outputs_2_translated_fork (
    .io_input_valid              (io_input_fork_io_outputs_2_translated_valid                               ), //i
    .io_input_ready              (io_input_fork_io_outputs_2_translated_fork_io_input_ready                 ), //o
    .io_input_payload_op1        (io_input_fork_io_outputs_2_translated_payload_op1                         ), //i
    .io_input_payload_op2        (io_input_fork_io_outputs_2_translated_payload_op2                         ), //i
    .io_outputs_0_valid          (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_valid             ), //o
    .io_outputs_0_ready          (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_ready  ), //i
    .io_outputs_0_payload_op1    (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_payload_op1       ), //o
    .io_outputs_0_payload_op2    (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_payload_op2       ), //o
    .io_outputs_1_valid          (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_valid             ), //o
    .io_outputs_1_ready          (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_ready  ), //i
    .io_outputs_1_payload_op1    (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_payload_op1       ), //o
    .io_outputs_1_payload_op2    (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_payload_op2       ), //o
    .io_outputs_2_valid          (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_valid             ), //o
    .io_outputs_2_ready          (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_ready  ), //i
    .io_outputs_2_payload_op1    (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_payload_op1       ), //o
    .io_outputs_2_payload_op2    (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_payload_op2       ), //o
    .io_outputs_3_valid          (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_valid             ), //o
    .io_outputs_3_ready          (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_ready  ), //i
    .io_outputs_3_payload_op1    (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_payload_op1       ), //o
    .io_outputs_3_payload_op2    (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_payload_op2       )  //o
  );
  MultiplierIPStream multiplierIPStream_24 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_24_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_24_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_24_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_25 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_25_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_25_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_25_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_26 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_26_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_26_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_26_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_27 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_27_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_27_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_27_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  StreamFork_1 io_input_fork_io_outputs_3_translated_fork (
    .io_input_valid              (io_input_fork_io_outputs_3_translated_valid                               ), //i
    .io_input_ready              (io_input_fork_io_outputs_3_translated_fork_io_input_ready                 ), //o
    .io_input_payload_op1        (io_input_fork_io_outputs_3_translated_payload_op1                         ), //i
    .io_input_payload_op2        (io_input_fork_io_outputs_3_translated_payload_op2                         ), //i
    .io_outputs_0_valid          (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_valid             ), //o
    .io_outputs_0_ready          (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_ready  ), //i
    .io_outputs_0_payload_op1    (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_payload_op1       ), //o
    .io_outputs_0_payload_op2    (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_payload_op2       ), //o
    .io_outputs_1_valid          (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_valid             ), //o
    .io_outputs_1_ready          (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_ready  ), //i
    .io_outputs_1_payload_op1    (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_payload_op1       ), //o
    .io_outputs_1_payload_op2    (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_payload_op2       ), //o
    .io_outputs_2_valid          (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_valid             ), //o
    .io_outputs_2_ready          (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_ready  ), //i
    .io_outputs_2_payload_op1    (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_payload_op1       ), //o
    .io_outputs_2_payload_op2    (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_payload_op2       ), //o
    .io_outputs_3_valid          (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_valid             ), //o
    .io_outputs_3_ready          (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_ready  ), //i
    .io_outputs_3_payload_op1    (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_payload_op1       ), //o
    .io_outputs_3_payload_op2    (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_payload_op2       )  //o
  );
  MultiplierIPStream multiplierIPStream_28 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_28_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_28_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_28_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_29 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_29_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_29_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_29_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_30 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_30_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_30_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_30_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  MultiplierIPStream multiplierIPStream_31 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_31_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_31_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_31_io_output_payload_res                                     ), //o
    .clk                      (clk                                                                             ), //i
    .reset                    (reset                                                                           )  //i
  );
  assign _zz_io_input_fork_io_outputs_2_translated_payload_op1 = io_input_payload_op1[127 : 0];
  assign _zz_io_input_fork_io_outputs_0_translated_payload_op1 = io_input_payload_op1[255 : 128];
  assign _zz_io_input_fork_io_outputs_1_translated_payload_op2 = io_input_payload_op2[127 : 0];
  assign _zz_io_input_fork_io_outputs_0_translated_payload_op2 = io_input_payload_op2[255 : 128];
  assign io_input_ready = io_input_fork_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_0_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_payload_op2;
  assign _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1 = io_input_fork_io_outputs_0_translated_payload_op1[63 : 0];
  assign _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1 = io_input_fork_io_outputs_0_translated_payload_op1[127 : 64];
  assign _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2 = io_input_fork_io_outputs_0_translated_payload_op2[63 : 0];
  assign _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2 = io_input_fork_io_outputs_0_translated_payload_op2[127 : 64];
  assign io_input_fork_io_outputs_0_translated_ready = io_input_fork_io_outputs_0_translated_fork_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_16_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_17_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_18_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_19_io_input_ready;
  assign _zz_io_output_ready = (_zz_io_output_valid && _zz_io_output_ready_1);
  assign _zz_io_output_valid = (((multiplierIPStream_16_io_output_valid && multiplierIPStream_17_io_output_valid) && multiplierIPStream_18_io_output_valid) && multiplierIPStream_19_io_output_valid);
  always @(*) begin
    _zz_io_output_ready_1 = _zz_io_output_ready_8;
    if(when_Stream_l342) begin
      _zz_io_output_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l342 = (! _zz_io_output_valid_1);
  assign _zz_io_output_valid_1 = _zz_io_output_valid_2;
  assign io_input_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_payload_op2;
  assign _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1 = io_input_fork_io_outputs_1_translated_payload_op1[63 : 0];
  assign _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1 = io_input_fork_io_outputs_1_translated_payload_op1[127 : 64];
  assign _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2 = io_input_fork_io_outputs_1_translated_payload_op2[63 : 0];
  assign _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2 = io_input_fork_io_outputs_1_translated_payload_op2[127 : 64];
  assign io_input_fork_io_outputs_1_translated_ready = io_input_fork_io_outputs_1_translated_fork_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_20_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_21_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_22_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_23_io_input_ready;
  assign _zz_io_output_ready_2 = (_zz_io_output_valid_3 && _zz_io_output_ready_3);
  assign _zz_io_output_valid_3 = (((multiplierIPStream_20_io_output_valid && multiplierIPStream_21_io_output_valid) && multiplierIPStream_22_io_output_valid) && multiplierIPStream_23_io_output_valid);
  always @(*) begin
    _zz_io_output_ready_3 = _zz_io_output_ready_8;
    if(when_Stream_l342_1) begin
      _zz_io_output_ready_3 = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! _zz_io_output_valid_4);
  assign _zz_io_output_valid_4 = _zz_io_output_valid_5;
  assign io_input_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_payload_op2;
  assign _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1 = io_input_fork_io_outputs_2_translated_payload_op1[63 : 0];
  assign _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1 = io_input_fork_io_outputs_2_translated_payload_op1[127 : 64];
  assign _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2 = io_input_fork_io_outputs_2_translated_payload_op2[63 : 0];
  assign _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2 = io_input_fork_io_outputs_2_translated_payload_op2[127 : 64];
  assign io_input_fork_io_outputs_2_translated_ready = io_input_fork_io_outputs_2_translated_fork_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_24_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_25_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_26_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_27_io_input_ready;
  assign _zz_io_output_ready_4 = (_zz_io_output_valid_6 && _zz_io_output_ready_5);
  assign _zz_io_output_valid_6 = (((multiplierIPStream_24_io_output_valid && multiplierIPStream_25_io_output_valid) && multiplierIPStream_26_io_output_valid) && multiplierIPStream_27_io_output_valid);
  always @(*) begin
    _zz_io_output_ready_5 = _zz_io_output_ready_8;
    if(when_Stream_l342_2) begin
      _zz_io_output_ready_5 = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! _zz_io_output_valid_7);
  assign _zz_io_output_valid_7 = _zz_io_output_valid_8;
  assign io_input_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_payload_op2;
  assign _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1 = io_input_fork_io_outputs_3_translated_payload_op1[63 : 0];
  assign _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1 = io_input_fork_io_outputs_3_translated_payload_op1[127 : 64];
  assign _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2 = io_input_fork_io_outputs_3_translated_payload_op2[63 : 0];
  assign _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2 = io_input_fork_io_outputs_3_translated_payload_op2[127 : 64];
  assign io_input_fork_io_outputs_3_translated_ready = io_input_fork_io_outputs_3_translated_fork_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_0_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_28_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_29_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_30_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_31_io_input_ready;
  assign _zz_io_output_ready_6 = (_zz_io_output_valid_9 && _zz_io_output_ready_7);
  assign _zz_io_output_valid_9 = (((multiplierIPStream_28_io_output_valid && multiplierIPStream_29_io_output_valid) && multiplierIPStream_30_io_output_valid) && multiplierIPStream_31_io_output_valid);
  always @(*) begin
    _zz_io_output_ready_7 = _zz_io_output_ready_8;
    if(when_Stream_l342_3) begin
      _zz_io_output_ready_7 = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! _zz_io_output_valid_10);
  assign _zz_io_output_valid_10 = _zz_io_output_valid_11;
  assign _zz_io_output_ready_8 = (_zz_io_output_valid_12 && _zz_io_output_ready_9);
  assign _zz_io_output_valid_12 = (((_zz_io_output_valid_1 && _zz_io_output_valid_4) && _zz_io_output_valid_7) && _zz_io_output_valid_10);
  always @(*) begin
    _zz_io_output_ready_9 = io_output_ready;
    if(when_Stream_l342_4) begin
      _zz_io_output_ready_9 = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! _zz_io_output_valid_13);
  assign _zz_io_output_valid_13 = _zz_io_output_valid_14;
  assign io_output_valid = _zz_io_output_valid_13;
  assign io_output_payload_res = _zz_io_output_payload_res_4;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_output_valid_2 <= 1'b0;
      _zz_io_output_valid_5 <= 1'b0;
      _zz_io_output_valid_8 <= 1'b0;
      _zz_io_output_valid_11 <= 1'b0;
      _zz_io_output_valid_14 <= 1'b0;
    end else begin
      if(_zz_io_output_ready_1) begin
        _zz_io_output_valid_2 <= _zz_io_output_valid;
      end
      if(_zz_io_output_ready_3) begin
        _zz_io_output_valid_5 <= _zz_io_output_valid_3;
      end
      if(_zz_io_output_ready_5) begin
        _zz_io_output_valid_8 <= _zz_io_output_valid_6;
      end
      if(_zz_io_output_ready_7) begin
        _zz_io_output_valid_11 <= _zz_io_output_valid_9;
      end
      if(_zz_io_output_ready_9) begin
        _zz_io_output_valid_14 <= _zz_io_output_valid_12;
      end
    end
  end

  always @(posedge clk) begin
    if(_zz_io_output_ready_1) begin
      _zz_io_output_payload_res <= (_zz__zz_io_output_payload_res + _zz__zz_io_output_payload_res_5);
    end
    if(_zz_io_output_ready_3) begin
      _zz_io_output_payload_res_1 <= (_zz__zz_io_output_payload_res_1_1 + _zz__zz_io_output_payload_res_1_6);
    end
    if(_zz_io_output_ready_5) begin
      _zz_io_output_payload_res_2 <= (_zz__zz_io_output_payload_res_2_1 + _zz__zz_io_output_payload_res_2_6);
    end
    if(_zz_io_output_ready_7) begin
      _zz_io_output_payload_res_3 <= (_zz__zz_io_output_payload_res_3_1 + _zz__zz_io_output_payload_res_3_6);
    end
    if(_zz_io_output_ready_9) begin
      _zz_io_output_payload_res_4 <= (_zz__zz_io_output_payload_res_4_1 + _zz__zz_io_output_payload_res_4_6);
    end
  end


endmodule

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//StreamFork_1 replaced by StreamFork_1

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//StreamFork_1 replaced by StreamFork_1

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//StreamFork_1 replaced by StreamFork_1

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

//MultiplierIPStream replaced by MultiplierIPStream

module MultiplierIPStream (
  input               io_input_valid,
  output              io_input_ready,
  input      [63:0]   io_input_payload_op1,
  input      [63:0]   io_input_payload_op2,
  output              io_output_valid,
  input               io_output_ready,
  output     [127:0]  io_output_payload_res,
  input               clk,
  input               reset
);
  wire       [127:0]  simMultiplierIP_16_io_outputP;
  wire                validPipe_0;
  reg                 validPipe_1;
  reg                 validPipe_2;
  reg                 validPipe_3;
  reg                 validPipe_4;
  reg                 validPipe_5;
  reg                 validPipe_6;
  reg                 validPipe_7;
  reg                 validPipe_8;
  reg                 validPipe_9;
  reg                 validPipe_10;
  reg                 validPipe_11;
  reg                 validPipe_12;
  reg                 validPipe_13;
  reg                 validPipe_14;
  reg                 validPipe_15;
  reg                 validPipe_16;
  reg                 validPipe_17;
  reg                 validPipe_18;

  SimMultiplierIP simMultiplierIP_16 (
    .io_enable     (io_input_ready                 ), //i
    .io_inputA     (io_input_payload_op1           ), //i
    .io_inputB     (io_input_payload_op2           ), //i
    .io_outputP    (simMultiplierIP_16_io_outputP  ), //o
    .clk           (clk                            ), //i
    .reset         (reset                          )  //i
  );
  assign validPipe_0 = io_input_valid;
  assign io_output_valid = validPipe_18;
  assign io_input_ready = ((! io_output_valid) || io_output_ready);
  assign io_output_payload_res = simMultiplierIP_16_io_outputP;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      validPipe_1 <= 1'b0;
      validPipe_2 <= 1'b0;
      validPipe_3 <= 1'b0;
      validPipe_4 <= 1'b0;
      validPipe_5 <= 1'b0;
      validPipe_6 <= 1'b0;
      validPipe_7 <= 1'b0;
      validPipe_8 <= 1'b0;
      validPipe_9 <= 1'b0;
      validPipe_10 <= 1'b0;
      validPipe_11 <= 1'b0;
      validPipe_12 <= 1'b0;
      validPipe_13 <= 1'b0;
      validPipe_14 <= 1'b0;
      validPipe_15 <= 1'b0;
      validPipe_16 <= 1'b0;
      validPipe_17 <= 1'b0;
      validPipe_18 <= 1'b0;
    end else begin
      if(io_input_ready) begin
        validPipe_1 <= validPipe_0;
      end
      if(io_input_ready) begin
        validPipe_2 <= validPipe_1;
      end
      if(io_input_ready) begin
        validPipe_3 <= validPipe_2;
      end
      if(io_input_ready) begin
        validPipe_4 <= validPipe_3;
      end
      if(io_input_ready) begin
        validPipe_5 <= validPipe_4;
      end
      if(io_input_ready) begin
        validPipe_6 <= validPipe_5;
      end
      if(io_input_ready) begin
        validPipe_7 <= validPipe_6;
      end
      if(io_input_ready) begin
        validPipe_8 <= validPipe_7;
      end
      if(io_input_ready) begin
        validPipe_9 <= validPipe_8;
      end
      if(io_input_ready) begin
        validPipe_10 <= validPipe_9;
      end
      if(io_input_ready) begin
        validPipe_11 <= validPipe_10;
      end
      if(io_input_ready) begin
        validPipe_12 <= validPipe_11;
      end
      if(io_input_ready) begin
        validPipe_13 <= validPipe_12;
      end
      if(io_input_ready) begin
        validPipe_14 <= validPipe_13;
      end
      if(io_input_ready) begin
        validPipe_15 <= validPipe_14;
      end
      if(io_input_ready) begin
        validPipe_16 <= validPipe_15;
      end
      if(io_input_ready) begin
        validPipe_17 <= validPipe_16;
      end
      if(io_input_ready) begin
        validPipe_18 <= validPipe_17;
      end
    end
  end


endmodule

module StreamFork_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [127:0]  io_input_payload_op1,
  input      [127:0]  io_input_payload_op2,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [127:0]  io_outputs_0_payload_op1,
  output     [127:0]  io_outputs_0_payload_op2,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [127:0]  io_outputs_1_payload_op1,
  output     [127:0]  io_outputs_1_payload_op2,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [127:0]  io_outputs_2_payload_op1,
  output     [127:0]  io_outputs_2_payload_op2,
  output              io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [127:0]  io_outputs_3_payload_op1,
  output     [127:0]  io_outputs_3_payload_op2
);

  assign io_input_ready = (((io_outputs_0_ready && io_outputs_1_ready) && io_outputs_2_ready) && io_outputs_3_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_2_valid = (io_input_valid && io_input_ready);
  assign io_outputs_3_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload_op1 = io_input_payload_op1;
  assign io_outputs_0_payload_op2 = io_input_payload_op2;
  assign io_outputs_1_payload_op1 = io_input_payload_op1;
  assign io_outputs_1_payload_op2 = io_input_payload_op2;
  assign io_outputs_2_payload_op1 = io_input_payload_op1;
  assign io_outputs_2_payload_op2 = io_input_payload_op2;
  assign io_outputs_3_payload_op1 = io_input_payload_op1;
  assign io_outputs_3_payload_op2 = io_input_payload_op2;

endmodule

module StreamFork (
  input               io_input_valid,
  output              io_input_ready,
  input      [255:0]  io_input_payload_op1,
  input      [255:0]  io_input_payload_op2,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [255:0]  io_outputs_0_payload_op1,
  output     [255:0]  io_outputs_0_payload_op2,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [255:0]  io_outputs_1_payload_op1,
  output     [255:0]  io_outputs_1_payload_op2,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [255:0]  io_outputs_2_payload_op1,
  output     [255:0]  io_outputs_2_payload_op2,
  output              io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [255:0]  io_outputs_3_payload_op1,
  output     [255:0]  io_outputs_3_payload_op2
);

  assign io_input_ready = (((io_outputs_0_ready && io_outputs_1_ready) && io_outputs_2_ready) && io_outputs_3_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_2_valid = (io_input_valid && io_input_ready);
  assign io_outputs_3_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload_op1 = io_input_payload_op1;
  assign io_outputs_0_payload_op2 = io_input_payload_op2;
  assign io_outputs_1_payload_op1 = io_input_payload_op1;
  assign io_outputs_1_payload_op2 = io_input_payload_op2;
  assign io_outputs_2_payload_op1 = io_input_payload_op1;
  assign io_outputs_2_payload_op2 = io_input_payload_op2;
  assign io_outputs_3_payload_op1 = io_input_payload_op1;
  assign io_outputs_3_payload_op2 = io_input_payload_op2;

endmodule

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

//SimMultiplierIP replaced by SimMultiplierIP

module SimMultiplierIP (
  input               io_enable,
  input      [63:0]   io_inputA,
  input      [63:0]   io_inputB,
  output     [127:0]  io_outputP,
  input               clk,
  input               reset
);
  wire       [127:0]  _zz_mulRes;
  wire       [127:0]  mulRes;
  wire       [127:0]  stages_0;
  reg        [127:0]  stages_1;
  reg        [127:0]  stages_2;
  reg        [127:0]  stages_3;
  reg        [127:0]  stages_4;
  reg        [127:0]  stages_5;
  reg        [127:0]  stages_6;
  reg        [127:0]  stages_7;
  reg        [127:0]  stages_8;
  reg        [127:0]  stages_9;
  reg        [127:0]  stages_10;
  reg        [127:0]  stages_11;
  reg        [127:0]  stages_12;
  reg        [127:0]  stages_13;
  reg        [127:0]  stages_14;
  reg        [127:0]  stages_15;
  reg        [127:0]  stages_16;
  reg        [127:0]  stages_17;
  reg        [127:0]  stages_18;

  assign _zz_mulRes = (io_inputA * io_inputB);
  assign mulRes = _zz_mulRes;
  assign stages_0 = mulRes;
  assign io_outputP = stages_18;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stages_1 <= 128'h0;
      stages_2 <= 128'h0;
      stages_3 <= 128'h0;
      stages_4 <= 128'h0;
      stages_5 <= 128'h0;
      stages_6 <= 128'h0;
      stages_7 <= 128'h0;
      stages_8 <= 128'h0;
      stages_9 <= 128'h0;
      stages_10 <= 128'h0;
      stages_11 <= 128'h0;
      stages_12 <= 128'h0;
      stages_13 <= 128'h0;
      stages_14 <= 128'h0;
      stages_15 <= 128'h0;
      stages_16 <= 128'h0;
      stages_17 <= 128'h0;
      stages_18 <= 128'h0;
    end else begin
      if(io_enable) begin
        stages_1 <= stages_0;
      end
      if(io_enable) begin
        stages_2 <= stages_1;
      end
      if(io_enable) begin
        stages_3 <= stages_2;
      end
      if(io_enable) begin
        stages_4 <= stages_3;
      end
      if(io_enable) begin
        stages_5 <= stages_4;
      end
      if(io_enable) begin
        stages_6 <= stages_5;
      end
      if(io_enable) begin
        stages_7 <= stages_6;
      end
      if(io_enable) begin
        stages_8 <= stages_7;
      end
      if(io_enable) begin
        stages_9 <= stages_8;
      end
      if(io_enable) begin
        stages_10 <= stages_9;
      end
      if(io_enable) begin
        stages_11 <= stages_10;
      end
      if(io_enable) begin
        stages_12 <= stages_11;
      end
      if(io_enable) begin
        stages_13 <= stages_12;
      end
      if(io_enable) begin
        stages_14 <= stages_13;
      end
      if(io_enable) begin
        stages_15 <= stages_14;
      end
      if(io_enable) begin
        stages_16 <= stages_15;
      end
      if(io_enable) begin
        stages_17 <= stages_16;
      end
      if(io_enable) begin
        stages_18 <= stages_17;
      end
    end
  end


endmodule
