// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : MDSMatrixAdders


`define threadAccumulator_fsm_enumDefinition_binary_sequential_type [1:0]
`define threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_BOOT 2'b00
`define threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE 2'b01
`define threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING 2'b10
`define threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE 2'b11


module MDSMatrixAdders (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_round_index,
  input      [3:0]    io_inputs_0_payload_state_size,
  input      [3:0]    io_inputs_0_payload_state_id,
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
  input      [3:0]    io_inputs_1_payload_state_id,
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
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [6:0]    io_inputs_2_payload_round_index,
  input      [3:0]    io_inputs_2_payload_state_size,
  input      [3:0]    io_inputs_2_payload_state_id,
  input      [254:0]  io_inputs_2_payload_state_elements_0,
  input      [254:0]  io_inputs_2_payload_state_elements_1,
  input      [254:0]  io_inputs_2_payload_state_elements_2,
  input      [254:0]  io_inputs_2_payload_state_elements_3,
  input      [254:0]  io_inputs_2_payload_state_elements_4,
  input      [254:0]  io_inputs_2_payload_state_elements_5,
  input      [254:0]  io_inputs_2_payload_state_elements_6,
  input      [254:0]  io_inputs_2_payload_state_elements_7,
  input      [254:0]  io_inputs_2_payload_state_elements_8,
  input      [254:0]  io_inputs_2_payload_state_elements_9,
  input      [254:0]  io_inputs_2_payload_state_elements_10,
  input      [254:0]  io_inputs_2_payload_state_elements_11,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [3:0]    io_output_payload_state_id,
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
  wire       [254:0]  modAdder_13_res_o;
  wire       [254:0]  modAdder_14_res_o;
  wire       [254:0]  modAdder_15_res_o;
  wire       [254:0]  modAdder_16_res_o;
  wire       [254:0]  modAdder_17_res_o;
  wire       [254:0]  modAdder_18_res_o;
  wire       [254:0]  modAdder_19_res_o;
  wire       [254:0]  modAdder_20_res_o;
  wire       [254:0]  modAdder_21_res_o;
  wire       [254:0]  modAdder_22_res_o;
  wire       [254:0]  modAdder_23_res_o;
  wire       [254:0]  modAdder_24_res_o;
  wire       [254:0]  modAdder_25_res_o;
  wire       [254:0]  modAdder_26_res_o;
  wire       [254:0]  modAdder_27_res_o;
  wire       [254:0]  modAdder_28_res_o;
  wire       [254:0]  modAdder_29_res_o;
  wire       [254:0]  modAdder_30_res_o;
  wire       [254:0]  modAdder_31_res_o;
  wire       [254:0]  modAdder_32_res_o;
  wire       [254:0]  modAdder_33_res_o;
  wire       [254:0]  modAdder_34_res_o;
  wire       [254:0]  modAdder_35_res_o;
  wire       [254:0]  modAdder_36_res_o;
  wire       [3:0]    _zz_when_MDSMatrixAdders_l94;
  wire                threadAdders_tempRes_valid;
  reg                 threadAdders_tempRes_ready;
  wire       [6:0]    threadAdders_tempRes_payload_round_index;
  wire       [3:0]    threadAdders_tempRes_payload_state_size;
  wire       [3:0]    threadAdders_tempRes_payload_state_id;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_0;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_1;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_2;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_3;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_4;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_5;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_6;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_7;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_8;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_9;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_10;
  reg        [254:0]  threadAdders_tempRes_payload_state_elements_11;
  wire                _zz_io_inputs_0_ready;
  wire                _zz_io_inputs_0_ready_1;
  wire                threadAdders_tempRes_tempOp1s_valid;
  wire                threadAdders_tempRes_tempOp1s_ready;
  wire       [6:0]    threadAdders_tempRes_tempOp1s_payload_round_index;
  wire       [3:0]    threadAdders_tempRes_tempOp1s_payload_state_size;
  wire       [3:0]    threadAdders_tempRes_tempOp1s_payload_state_id;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_0;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_1;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_2;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_3;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_4;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_5;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_6;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_7;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_8;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_9;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_10;
  wire       [254:0]  threadAdders_tempRes_tempOp1s_payload_state_elements_11;
  reg                 threadAdders_tempRes_rValid;
  reg        [6:0]    threadAdders_tempRes_rData_round_index;
  reg        [3:0]    threadAdders_tempRes_rData_state_size;
  reg        [3:0]    threadAdders_tempRes_rData_state_id;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_0;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_1;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_2;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_3;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_4;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_5;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_6;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_7;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_8;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_9;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_10;
  reg        [254:0]  threadAdders_tempRes_rData_state_elements_11;
  wire                when_Stream_l342;
  wire                threadAdders_tempRes_fire;
  reg        [254:0]  threadAdders_tempOp2s_0;
  reg        [254:0]  threadAdders_tempOp2s_1;
  reg        [254:0]  threadAdders_tempOp2s_2;
  reg        [254:0]  threadAdders_tempOp2s_3;
  reg        [254:0]  threadAdders_tempOp2s_4;
  reg        [254:0]  threadAdders_tempOp2s_5;
  reg        [254:0]  threadAdders_tempOp2s_6;
  reg        [254:0]  threadAdders_tempOp2s_7;
  reg        [254:0]  threadAdders_tempOp2s_8;
  reg        [254:0]  threadAdders_tempOp2s_9;
  reg        [254:0]  threadAdders_tempOp2s_10;
  reg        [254:0]  threadAdders_tempOp2s_11;
  wire                threadAdders_output_valid;
  reg                 threadAdders_output_ready;
  wire       [6:0]    threadAdders_output_payload_round_index;
  wire       [3:0]    threadAdders_output_payload_state_size;
  wire       [3:0]    threadAdders_output_payload_state_id;
  reg        [254:0]  threadAdders_output_payload_state_elements_0;
  reg        [254:0]  threadAdders_output_payload_state_elements_1;
  reg        [254:0]  threadAdders_output_payload_state_elements_2;
  reg        [254:0]  threadAdders_output_payload_state_elements_3;
  reg        [254:0]  threadAdders_output_payload_state_elements_4;
  reg        [254:0]  threadAdders_output_payload_state_elements_5;
  reg        [254:0]  threadAdders_output_payload_state_elements_6;
  reg        [254:0]  threadAdders_output_payload_state_elements_7;
  reg        [254:0]  threadAdders_output_payload_state_elements_8;
  reg        [254:0]  threadAdders_output_payload_state_elements_9;
  reg        [254:0]  threadAdders_output_payload_state_elements_10;
  reg        [254:0]  threadAdders_output_payload_state_elements_11;
  wire                threadAdders_output_input_valid;
  reg                 threadAdders_output_input_ready;
  wire       [6:0]    threadAdders_output_input_payload_round_index;
  wire       [3:0]    threadAdders_output_input_payload_state_size;
  wire       [3:0]    threadAdders_output_input_payload_state_id;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_0;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_1;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_2;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_3;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_4;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_5;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_6;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_7;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_8;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_9;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_10;
  wire       [254:0]  threadAdders_output_input_payload_state_elements_11;
  reg                 threadAdders_output_rValid;
  reg        [6:0]    threadAdders_output_rData_round_index;
  reg        [3:0]    threadAdders_output_rData_state_size;
  reg        [3:0]    threadAdders_output_rData_state_id;
  reg        [254:0]  threadAdders_output_rData_state_elements_0;
  reg        [254:0]  threadAdders_output_rData_state_elements_1;
  reg        [254:0]  threadAdders_output_rData_state_elements_2;
  reg        [254:0]  threadAdders_output_rData_state_elements_3;
  reg        [254:0]  threadAdders_output_rData_state_elements_4;
  reg        [254:0]  threadAdders_output_rData_state_elements_5;
  reg        [254:0]  threadAdders_output_rData_state_elements_6;
  reg        [254:0]  threadAdders_output_rData_state_elements_7;
  reg        [254:0]  threadAdders_output_rData_state_elements_8;
  reg        [254:0]  threadAdders_output_rData_state_elements_9;
  reg        [254:0]  threadAdders_output_rData_state_elements_10;
  reg        [254:0]  threadAdders_output_rData_state_elements_11;
  wire                when_Stream_l342_1;
  reg                 threadAccumulator_output_valid;
  wire                threadAccumulator_output_ready;
  wire       [6:0]    threadAccumulator_output_payload_round_index;
  wire       [3:0]    threadAccumulator_output_payload_state_size;
  wire       [3:0]    threadAccumulator_output_payload_state_id;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_0;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_1;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_2;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_3;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_4;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_5;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_6;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_7;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_8;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_9;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_10;
  wire       [254:0]  threadAccumulator_output_payload_state_elements_11;
  reg        [6:0]    threadAccumulator_tempRes_round_index;
  reg        [3:0]    threadAccumulator_tempRes_state_size;
  reg        [3:0]    threadAccumulator_tempRes_state_id;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_0;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_1;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_2;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_3;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_4;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_5;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_6;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_7;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_8;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_9;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_10;
  reg        [254:0]  threadAccumulator_tempRes_state_elements_11;
  wire       [254:0]  threadAccumulator_modAdderRes_0;
  wire       [254:0]  threadAccumulator_modAdderRes_1;
  wire       [254:0]  threadAccumulator_modAdderRes_2;
  wire       [254:0]  threadAccumulator_modAdderRes_3;
  wire       [254:0]  threadAccumulator_modAdderRes_4;
  wire       [254:0]  threadAccumulator_modAdderRes_5;
  wire       [254:0]  threadAccumulator_modAdderRes_6;
  wire       [254:0]  threadAccumulator_modAdderRes_7;
  wire       [254:0]  threadAccumulator_modAdderRes_8;
  wire       [254:0]  threadAccumulator_modAdderRes_9;
  wire       [254:0]  threadAccumulator_modAdderRes_10;
  wire       [254:0]  threadAccumulator_modAdderRes_11;
  wire                threadAccumulator_fsm_wantExit;
  reg                 threadAccumulator_fsm_wantStart;
  wire                threadAccumulator_fsm_wantKill;
  reg        [3:0]    threadAccumulator_fsm_counter;
  reg        `threadAccumulator_fsm_enumDefinition_binary_sequential_type threadAccumulator_fsm_stateReg;
  reg        `threadAccumulator_fsm_enumDefinition_binary_sequential_type threadAccumulator_fsm_stateNext;
  wire                threadAdders_output_input_fire;
  wire                when_MDSMatrixAdders_l79;
  wire                threadAdders_output_input_fire_1;
  wire                when_MDSMatrixAdders_l94;
  wire                threadAccumulator_output_fire;
  wire                threadAdders_output_input_fire_2;
  wire                when_MDSMatrixAdders_l111;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [223:0] threadAccumulator_fsm_stateReg_string;
  reg [223:0] threadAccumulator_fsm_stateNext_string;
  `endif


  assign _zz_when_MDSMatrixAdders_l94 = (threadAccumulator_fsm_counter + 4'b0011);
  ModAdder modAdder_1 (
    .op1_i    (io_inputs_0_payload_state_elements_0  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_0  ), //i
    .res_o    (modAdder_1_res_o                      )  //o
  );
  ModAdder modAdder_2 (
    .op1_i    (io_inputs_0_payload_state_elements_1  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_1  ), //i
    .res_o    (modAdder_2_res_o                      )  //o
  );
  ModAdder modAdder_3 (
    .op1_i    (io_inputs_0_payload_state_elements_2  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_2  ), //i
    .res_o    (modAdder_3_res_o                      )  //o
  );
  ModAdder modAdder_4 (
    .op1_i    (io_inputs_0_payload_state_elements_3  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_3  ), //i
    .res_o    (modAdder_4_res_o                      )  //o
  );
  ModAdder modAdder_5 (
    .op1_i    (io_inputs_0_payload_state_elements_4  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_4  ), //i
    .res_o    (modAdder_5_res_o                      )  //o
  );
  ModAdder modAdder_6 (
    .op1_i    (io_inputs_0_payload_state_elements_5  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_5  ), //i
    .res_o    (modAdder_6_res_o                      )  //o
  );
  ModAdder modAdder_7 (
    .op1_i    (io_inputs_0_payload_state_elements_6  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_6  ), //i
    .res_o    (modAdder_7_res_o                      )  //o
  );
  ModAdder modAdder_8 (
    .op1_i    (io_inputs_0_payload_state_elements_7  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_7  ), //i
    .res_o    (modAdder_8_res_o                      )  //o
  );
  ModAdder modAdder_9 (
    .op1_i    (io_inputs_0_payload_state_elements_8  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_8  ), //i
    .res_o    (modAdder_9_res_o                      )  //o
  );
  ModAdder modAdder_10 (
    .op1_i    (io_inputs_0_payload_state_elements_9  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_9  ), //i
    .res_o    (modAdder_10_res_o                     )  //o
  );
  ModAdder modAdder_11 (
    .op1_i    (io_inputs_0_payload_state_elements_10  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_10  ), //i
    .res_o    (modAdder_11_res_o                      )  //o
  );
  ModAdder modAdder_12 (
    .op1_i    (io_inputs_0_payload_state_elements_11  ), //i
    .op2_i    (io_inputs_1_payload_state_elements_11  ), //i
    .res_o    (modAdder_12_res_o                      )  //o
  );
  ModAdder modAdder_13 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_0  ), //i
    .op2_i    (threadAdders_tempOp2s_0                                 ), //i
    .res_o    (modAdder_13_res_o                                       )  //o
  );
  ModAdder modAdder_14 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_1  ), //i
    .op2_i    (threadAdders_tempOp2s_1                                 ), //i
    .res_o    (modAdder_14_res_o                                       )  //o
  );
  ModAdder modAdder_15 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_2  ), //i
    .op2_i    (threadAdders_tempOp2s_2                                 ), //i
    .res_o    (modAdder_15_res_o                                       )  //o
  );
  ModAdder modAdder_16 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_3  ), //i
    .op2_i    (threadAdders_tempOp2s_3                                 ), //i
    .res_o    (modAdder_16_res_o                                       )  //o
  );
  ModAdder modAdder_17 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_4  ), //i
    .op2_i    (threadAdders_tempOp2s_4                                 ), //i
    .res_o    (modAdder_17_res_o                                       )  //o
  );
  ModAdder modAdder_18 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_5  ), //i
    .op2_i    (threadAdders_tempOp2s_5                                 ), //i
    .res_o    (modAdder_18_res_o                                       )  //o
  );
  ModAdder modAdder_19 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_6  ), //i
    .op2_i    (threadAdders_tempOp2s_6                                 ), //i
    .res_o    (modAdder_19_res_o                                       )  //o
  );
  ModAdder modAdder_20 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_7  ), //i
    .op2_i    (threadAdders_tempOp2s_7                                 ), //i
    .res_o    (modAdder_20_res_o                                       )  //o
  );
  ModAdder modAdder_21 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_8  ), //i
    .op2_i    (threadAdders_tempOp2s_8                                 ), //i
    .res_o    (modAdder_21_res_o                                       )  //o
  );
  ModAdder modAdder_22 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_9  ), //i
    .op2_i    (threadAdders_tempOp2s_9                                 ), //i
    .res_o    (modAdder_22_res_o                                       )  //o
  );
  ModAdder modAdder_23 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_10  ), //i
    .op2_i    (threadAdders_tempOp2s_10                                 ), //i
    .res_o    (modAdder_23_res_o                                        )  //o
  );
  ModAdder modAdder_24 (
    .op1_i    (threadAdders_tempRes_tempOp1s_payload_state_elements_11  ), //i
    .op2_i    (threadAdders_tempOp2s_11                                 ), //i
    .res_o    (modAdder_24_res_o                                        )  //o
  );
  ModAdder modAdder_25 (
    .op1_i    (threadAccumulator_tempRes_state_elements_0          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_0  ), //i
    .res_o    (modAdder_25_res_o                                   )  //o
  );
  ModAdder modAdder_26 (
    .op1_i    (threadAccumulator_tempRes_state_elements_1          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_1  ), //i
    .res_o    (modAdder_26_res_o                                   )  //o
  );
  ModAdder modAdder_27 (
    .op1_i    (threadAccumulator_tempRes_state_elements_2          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_2  ), //i
    .res_o    (modAdder_27_res_o                                   )  //o
  );
  ModAdder modAdder_28 (
    .op1_i    (threadAccumulator_tempRes_state_elements_3          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_3  ), //i
    .res_o    (modAdder_28_res_o                                   )  //o
  );
  ModAdder modAdder_29 (
    .op1_i    (threadAccumulator_tempRes_state_elements_4          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_4  ), //i
    .res_o    (modAdder_29_res_o                                   )  //o
  );
  ModAdder modAdder_30 (
    .op1_i    (threadAccumulator_tempRes_state_elements_5          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_5  ), //i
    .res_o    (modAdder_30_res_o                                   )  //o
  );
  ModAdder modAdder_31 (
    .op1_i    (threadAccumulator_tempRes_state_elements_6          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_6  ), //i
    .res_o    (modAdder_31_res_o                                   )  //o
  );
  ModAdder modAdder_32 (
    .op1_i    (threadAccumulator_tempRes_state_elements_7          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_7  ), //i
    .res_o    (modAdder_32_res_o                                   )  //o
  );
  ModAdder modAdder_33 (
    .op1_i    (threadAccumulator_tempRes_state_elements_8          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_8  ), //i
    .res_o    (modAdder_33_res_o                                   )  //o
  );
  ModAdder modAdder_34 (
    .op1_i    (threadAccumulator_tempRes_state_elements_9          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_9  ), //i
    .res_o    (modAdder_34_res_o                                   )  //o
  );
  ModAdder modAdder_35 (
    .op1_i    (threadAccumulator_tempRes_state_elements_10          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_10  ), //i
    .res_o    (modAdder_35_res_o                                    )  //o
  );
  ModAdder modAdder_36 (
    .op1_i    (threadAccumulator_tempRes_state_elements_11          ), //i
    .op2_i    (threadAdders_output_input_payload_state_elements_11  ), //i
    .res_o    (modAdder_36_res_o                                    )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(threadAccumulator_fsm_stateReg)
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_BOOT : threadAccumulator_fsm_stateReg_string = "threadAccumulator_fsm_BOOT  ";
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : threadAccumulator_fsm_stateReg_string = "threadAccumulator_fsm_IDLE  ";
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : threadAccumulator_fsm_stateReg_string = "threadAccumulator_fsm_ADDING";
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : threadAccumulator_fsm_stateReg_string = "threadAccumulator_fsm_DONE  ";
      default : threadAccumulator_fsm_stateReg_string = "????????????????????????????";
    endcase
  end
  always @(*) begin
    case(threadAccumulator_fsm_stateNext)
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_BOOT : threadAccumulator_fsm_stateNext_string = "threadAccumulator_fsm_BOOT  ";
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : threadAccumulator_fsm_stateNext_string = "threadAccumulator_fsm_IDLE  ";
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : threadAccumulator_fsm_stateNext_string = "threadAccumulator_fsm_ADDING";
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : threadAccumulator_fsm_stateNext_string = "threadAccumulator_fsm_DONE  ";
      default : threadAccumulator_fsm_stateNext_string = "????????????????????????????";
    endcase
  end
  `endif

  assign _zz_io_inputs_0_ready_1 = (_zz_io_inputs_0_ready && threadAdders_tempRes_ready);
  assign _zz_io_inputs_0_ready = ((io_inputs_0_valid && io_inputs_1_valid) && io_inputs_2_valid);
  assign io_inputs_0_ready = _zz_io_inputs_0_ready_1;
  assign io_inputs_1_ready = _zz_io_inputs_0_ready_1;
  assign io_inputs_2_ready = _zz_io_inputs_0_ready_1;
  assign threadAdders_tempRes_valid = _zz_io_inputs_0_ready;
  assign threadAdders_tempRes_payload_round_index = io_inputs_0_payload_round_index;
  assign threadAdders_tempRes_payload_state_size = io_inputs_0_payload_state_size;
  assign threadAdders_tempRes_payload_state_id = io_inputs_0_payload_state_id;
  always @(*) begin
    threadAdders_tempRes_payload_state_elements_0 = io_inputs_0_payload_state_elements_0;
    threadAdders_tempRes_payload_state_elements_0 = modAdder_1_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_1 = io_inputs_0_payload_state_elements_1;
    threadAdders_tempRes_payload_state_elements_1 = modAdder_2_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_2 = io_inputs_0_payload_state_elements_2;
    threadAdders_tempRes_payload_state_elements_2 = modAdder_3_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_3 = io_inputs_0_payload_state_elements_3;
    threadAdders_tempRes_payload_state_elements_3 = modAdder_4_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_4 = io_inputs_0_payload_state_elements_4;
    threadAdders_tempRes_payload_state_elements_4 = modAdder_5_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_5 = io_inputs_0_payload_state_elements_5;
    threadAdders_tempRes_payload_state_elements_5 = modAdder_6_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_6 = io_inputs_0_payload_state_elements_6;
    threadAdders_tempRes_payload_state_elements_6 = modAdder_7_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_7 = io_inputs_0_payload_state_elements_7;
    threadAdders_tempRes_payload_state_elements_7 = modAdder_8_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_8 = io_inputs_0_payload_state_elements_8;
    threadAdders_tempRes_payload_state_elements_8 = modAdder_9_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_9 = io_inputs_0_payload_state_elements_9;
    threadAdders_tempRes_payload_state_elements_9 = modAdder_10_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_10 = io_inputs_0_payload_state_elements_10;
    threadAdders_tempRes_payload_state_elements_10 = modAdder_11_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_payload_state_elements_11 = io_inputs_0_payload_state_elements_11;
    threadAdders_tempRes_payload_state_elements_11 = modAdder_12_res_o;
  end

  always @(*) begin
    threadAdders_tempRes_ready = threadAdders_tempRes_tempOp1s_ready;
    if(when_Stream_l342) begin
      threadAdders_tempRes_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! threadAdders_tempRes_tempOp1s_valid);
  assign threadAdders_tempRes_tempOp1s_valid = threadAdders_tempRes_rValid;
  assign threadAdders_tempRes_tempOp1s_payload_round_index = threadAdders_tempRes_rData_round_index;
  assign threadAdders_tempRes_tempOp1s_payload_state_size = threadAdders_tempRes_rData_state_size;
  assign threadAdders_tempRes_tempOp1s_payload_state_id = threadAdders_tempRes_rData_state_id;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_0 = threadAdders_tempRes_rData_state_elements_0;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_1 = threadAdders_tempRes_rData_state_elements_1;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_2 = threadAdders_tempRes_rData_state_elements_2;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_3 = threadAdders_tempRes_rData_state_elements_3;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_4 = threadAdders_tempRes_rData_state_elements_4;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_5 = threadAdders_tempRes_rData_state_elements_5;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_6 = threadAdders_tempRes_rData_state_elements_6;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_7 = threadAdders_tempRes_rData_state_elements_7;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_8 = threadAdders_tempRes_rData_state_elements_8;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_9 = threadAdders_tempRes_rData_state_elements_9;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_10 = threadAdders_tempRes_rData_state_elements_10;
  assign threadAdders_tempRes_tempOp1s_payload_state_elements_11 = threadAdders_tempRes_rData_state_elements_11;
  assign threadAdders_tempRes_fire = (threadAdders_tempRes_valid && threadAdders_tempRes_ready);
  assign threadAdders_output_valid = threadAdders_tempRes_tempOp1s_valid;
  assign threadAdders_tempRes_tempOp1s_ready = threadAdders_output_ready;
  assign threadAdders_output_payload_round_index = threadAdders_tempRes_tempOp1s_payload_round_index;
  assign threadAdders_output_payload_state_size = threadAdders_tempRes_tempOp1s_payload_state_size;
  assign threadAdders_output_payload_state_id = threadAdders_tempRes_tempOp1s_payload_state_id;
  always @(*) begin
    threadAdders_output_payload_state_elements_0 = threadAdders_tempRes_tempOp1s_payload_state_elements_0;
    threadAdders_output_payload_state_elements_0 = modAdder_13_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_1 = threadAdders_tempRes_tempOp1s_payload_state_elements_1;
    threadAdders_output_payload_state_elements_1 = modAdder_14_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_2 = threadAdders_tempRes_tempOp1s_payload_state_elements_2;
    threadAdders_output_payload_state_elements_2 = modAdder_15_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_3 = threadAdders_tempRes_tempOp1s_payload_state_elements_3;
    threadAdders_output_payload_state_elements_3 = modAdder_16_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_4 = threadAdders_tempRes_tempOp1s_payload_state_elements_4;
    threadAdders_output_payload_state_elements_4 = modAdder_17_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_5 = threadAdders_tempRes_tempOp1s_payload_state_elements_5;
    threadAdders_output_payload_state_elements_5 = modAdder_18_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_6 = threadAdders_tempRes_tempOp1s_payload_state_elements_6;
    threadAdders_output_payload_state_elements_6 = modAdder_19_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_7 = threadAdders_tempRes_tempOp1s_payload_state_elements_7;
    threadAdders_output_payload_state_elements_7 = modAdder_20_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_8 = threadAdders_tempRes_tempOp1s_payload_state_elements_8;
    threadAdders_output_payload_state_elements_8 = modAdder_21_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_9 = threadAdders_tempRes_tempOp1s_payload_state_elements_9;
    threadAdders_output_payload_state_elements_9 = modAdder_22_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_10 = threadAdders_tempRes_tempOp1s_payload_state_elements_10;
    threadAdders_output_payload_state_elements_10 = modAdder_23_res_o;
  end

  always @(*) begin
    threadAdders_output_payload_state_elements_11 = threadAdders_tempRes_tempOp1s_payload_state_elements_11;
    threadAdders_output_payload_state_elements_11 = modAdder_24_res_o;
  end

  always @(*) begin
    threadAdders_output_ready = threadAdders_output_input_ready;
    if(when_Stream_l342_1) begin
      threadAdders_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! threadAdders_output_input_valid);
  assign threadAdders_output_input_valid = threadAdders_output_rValid;
  assign threadAdders_output_input_payload_round_index = threadAdders_output_rData_round_index;
  assign threadAdders_output_input_payload_state_size = threadAdders_output_rData_state_size;
  assign threadAdders_output_input_payload_state_id = threadAdders_output_rData_state_id;
  assign threadAdders_output_input_payload_state_elements_0 = threadAdders_output_rData_state_elements_0;
  assign threadAdders_output_input_payload_state_elements_1 = threadAdders_output_rData_state_elements_1;
  assign threadAdders_output_input_payload_state_elements_2 = threadAdders_output_rData_state_elements_2;
  assign threadAdders_output_input_payload_state_elements_3 = threadAdders_output_rData_state_elements_3;
  assign threadAdders_output_input_payload_state_elements_4 = threadAdders_output_rData_state_elements_4;
  assign threadAdders_output_input_payload_state_elements_5 = threadAdders_output_rData_state_elements_5;
  assign threadAdders_output_input_payload_state_elements_6 = threadAdders_output_rData_state_elements_6;
  assign threadAdders_output_input_payload_state_elements_7 = threadAdders_output_rData_state_elements_7;
  assign threadAdders_output_input_payload_state_elements_8 = threadAdders_output_rData_state_elements_8;
  assign threadAdders_output_input_payload_state_elements_9 = threadAdders_output_rData_state_elements_9;
  assign threadAdders_output_input_payload_state_elements_10 = threadAdders_output_rData_state_elements_10;
  assign threadAdders_output_input_payload_state_elements_11 = threadAdders_output_rData_state_elements_11;
  assign threadAccumulator_modAdderRes_0 = modAdder_25_res_o;
  assign threadAccumulator_modAdderRes_1 = modAdder_26_res_o;
  assign threadAccumulator_modAdderRes_2 = modAdder_27_res_o;
  assign threadAccumulator_modAdderRes_3 = modAdder_28_res_o;
  assign threadAccumulator_modAdderRes_4 = modAdder_29_res_o;
  assign threadAccumulator_modAdderRes_5 = modAdder_30_res_o;
  assign threadAccumulator_modAdderRes_6 = modAdder_31_res_o;
  assign threadAccumulator_modAdderRes_7 = modAdder_32_res_o;
  assign threadAccumulator_modAdderRes_8 = modAdder_33_res_o;
  assign threadAccumulator_modAdderRes_9 = modAdder_34_res_o;
  assign threadAccumulator_modAdderRes_10 = modAdder_35_res_o;
  assign threadAccumulator_modAdderRes_11 = modAdder_36_res_o;
  assign threadAccumulator_fsm_wantExit = 1'b0;
  always @(*) begin
    threadAccumulator_fsm_wantStart = 1'b0;
    case(threadAccumulator_fsm_stateReg)
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : begin
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : begin
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : begin
      end
      default : begin
        threadAccumulator_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign threadAccumulator_fsm_wantKill = 1'b0;
  assign threadAccumulator_output_payload_round_index = threadAccumulator_tempRes_round_index;
  assign threadAccumulator_output_payload_state_size = threadAccumulator_tempRes_state_size;
  assign threadAccumulator_output_payload_state_id = threadAccumulator_tempRes_state_id;
  assign threadAccumulator_output_payload_state_elements_0 = threadAccumulator_tempRes_state_elements_0;
  assign threadAccumulator_output_payload_state_elements_1 = threadAccumulator_tempRes_state_elements_1;
  assign threadAccumulator_output_payload_state_elements_2 = threadAccumulator_tempRes_state_elements_2;
  assign threadAccumulator_output_payload_state_elements_3 = threadAccumulator_tempRes_state_elements_3;
  assign threadAccumulator_output_payload_state_elements_4 = threadAccumulator_tempRes_state_elements_4;
  assign threadAccumulator_output_payload_state_elements_5 = threadAccumulator_tempRes_state_elements_5;
  assign threadAccumulator_output_payload_state_elements_6 = threadAccumulator_tempRes_state_elements_6;
  assign threadAccumulator_output_payload_state_elements_7 = threadAccumulator_tempRes_state_elements_7;
  assign threadAccumulator_output_payload_state_elements_8 = threadAccumulator_tempRes_state_elements_8;
  assign threadAccumulator_output_payload_state_elements_9 = threadAccumulator_tempRes_state_elements_9;
  assign threadAccumulator_output_payload_state_elements_10 = threadAccumulator_tempRes_state_elements_10;
  assign threadAccumulator_output_payload_state_elements_11 = threadAccumulator_tempRes_state_elements_11;
  always @(*) begin
    threadAccumulator_output_valid = 1'b0;
    case(threadAccumulator_fsm_stateReg)
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : begin
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : begin
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : begin
        threadAccumulator_output_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    threadAdders_output_input_ready = 1'b0;
    case(threadAccumulator_fsm_stateReg)
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : begin
        threadAdders_output_input_ready = 1'b1;
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : begin
        threadAdders_output_input_ready = 1'b1;
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : begin
        if(threadAccumulator_output_fire) begin
          threadAdders_output_input_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_output_valid = threadAccumulator_output_valid;
  assign threadAccumulator_output_ready = io_output_ready;
  assign io_output_payload_round_index = threadAccumulator_output_payload_round_index;
  assign io_output_payload_state_size = threadAccumulator_output_payload_state_size;
  assign io_output_payload_state_id = threadAccumulator_output_payload_state_id;
  assign io_output_payload_state_elements_0 = threadAccumulator_output_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = threadAccumulator_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = threadAccumulator_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = threadAccumulator_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = threadAccumulator_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = threadAccumulator_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = threadAccumulator_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = threadAccumulator_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = threadAccumulator_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = threadAccumulator_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = threadAccumulator_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = threadAccumulator_output_payload_state_elements_11;
  always @(*) begin
    threadAccumulator_fsm_stateNext = threadAccumulator_fsm_stateReg;
    case(threadAccumulator_fsm_stateReg)
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : begin
        if(threadAdders_output_input_fire) begin
          if(when_MDSMatrixAdders_l79) begin
            threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE;
          end else begin
            threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING;
          end
        end
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : begin
        if(threadAdders_output_input_fire_1) begin
          if(when_MDSMatrixAdders_l94) begin
            threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE;
          end
        end
      end
      `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : begin
        if(threadAccumulator_output_fire) begin
          if(threadAdders_output_input_fire_2) begin
            if(when_MDSMatrixAdders_l111) begin
              threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING;
            end
          end else begin
            threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(threadAccumulator_fsm_wantStart) begin
      threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE;
    end
    if(threadAccumulator_fsm_wantKill) begin
      threadAccumulator_fsm_stateNext = `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_BOOT;
    end
  end

  assign threadAdders_output_input_fire = (threadAdders_output_input_valid && threadAdders_output_input_ready);
  assign when_MDSMatrixAdders_l79 = (threadAdders_output_input_payload_state_size == 4'b0011);
  assign threadAdders_output_input_fire_1 = (threadAdders_output_input_valid && threadAdders_output_input_ready);
  assign when_MDSMatrixAdders_l94 = (threadAccumulator_tempRes_state_size <= _zz_when_MDSMatrixAdders_l94);
  assign threadAccumulator_output_fire = (threadAccumulator_output_valid && threadAccumulator_output_ready);
  assign threadAdders_output_input_fire_2 = (threadAdders_output_input_valid && threadAdders_output_input_ready);
  assign when_MDSMatrixAdders_l111 = (4'b0011 < threadAdders_output_input_payload_state_size);
  assign when_StateMachine_l214 = ((threadAccumulator_fsm_stateReg == `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING) && (! (threadAccumulator_fsm_stateNext == `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      threadAdders_tempRes_rValid <= 1'b0;
      threadAdders_tempOp2s_0 <= 255'h0;
      threadAdders_tempOp2s_1 <= 255'h0;
      threadAdders_tempOp2s_2 <= 255'h0;
      threadAdders_tempOp2s_3 <= 255'h0;
      threadAdders_tempOp2s_4 <= 255'h0;
      threadAdders_tempOp2s_5 <= 255'h0;
      threadAdders_tempOp2s_6 <= 255'h0;
      threadAdders_tempOp2s_7 <= 255'h0;
      threadAdders_tempOp2s_8 <= 255'h0;
      threadAdders_tempOp2s_9 <= 255'h0;
      threadAdders_tempOp2s_10 <= 255'h0;
      threadAdders_tempOp2s_11 <= 255'h0;
      threadAdders_output_rValid <= 1'b0;
      threadAccumulator_tempRes_state_size <= 4'b0000;
      threadAccumulator_tempRes_state_elements_0 <= 255'h0;
      threadAccumulator_tempRes_state_elements_1 <= 255'h0;
      threadAccumulator_tempRes_state_elements_2 <= 255'h0;
      threadAccumulator_tempRes_state_elements_3 <= 255'h0;
      threadAccumulator_tempRes_state_elements_4 <= 255'h0;
      threadAccumulator_tempRes_state_elements_5 <= 255'h0;
      threadAccumulator_tempRes_state_elements_6 <= 255'h0;
      threadAccumulator_tempRes_state_elements_7 <= 255'h0;
      threadAccumulator_tempRes_state_elements_8 <= 255'h0;
      threadAccumulator_tempRes_state_elements_9 <= 255'h0;
      threadAccumulator_tempRes_state_elements_10 <= 255'h0;
      threadAccumulator_tempRes_state_elements_11 <= 255'h0;
      threadAccumulator_tempRes_state_id <= 4'b0000;
      threadAccumulator_tempRes_round_index <= 7'h0;
      threadAccumulator_fsm_counter <= 4'b0000;
      threadAccumulator_fsm_stateReg <= `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_BOOT;
    end else begin
      if(threadAdders_tempRes_ready) begin
        threadAdders_tempRes_rValid <= threadAdders_tempRes_valid;
      end
      if(threadAdders_tempRes_fire) begin
        threadAdders_tempOp2s_0 <= io_inputs_2_payload_state_elements_0;
        threadAdders_tempOp2s_1 <= io_inputs_2_payload_state_elements_1;
        threadAdders_tempOp2s_2 <= io_inputs_2_payload_state_elements_2;
        threadAdders_tempOp2s_3 <= io_inputs_2_payload_state_elements_3;
        threadAdders_tempOp2s_4 <= io_inputs_2_payload_state_elements_4;
        threadAdders_tempOp2s_5 <= io_inputs_2_payload_state_elements_5;
        threadAdders_tempOp2s_6 <= io_inputs_2_payload_state_elements_6;
        threadAdders_tempOp2s_7 <= io_inputs_2_payload_state_elements_7;
        threadAdders_tempOp2s_8 <= io_inputs_2_payload_state_elements_8;
        threadAdders_tempOp2s_9 <= io_inputs_2_payload_state_elements_9;
        threadAdders_tempOp2s_10 <= io_inputs_2_payload_state_elements_10;
        threadAdders_tempOp2s_11 <= io_inputs_2_payload_state_elements_11;
      end
      if(threadAdders_output_ready) begin
        threadAdders_output_rValid <= threadAdders_output_valid;
      end
      threadAccumulator_fsm_stateReg <= threadAccumulator_fsm_stateNext;
      case(threadAccumulator_fsm_stateReg)
        `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_IDLE : begin
          if(threadAdders_output_input_fire) begin
            threadAccumulator_tempRes_round_index <= threadAdders_output_input_payload_round_index;
            threadAccumulator_tempRes_state_size <= threadAdders_output_input_payload_state_size;
            threadAccumulator_tempRes_state_id <= threadAdders_output_input_payload_state_id;
            threadAccumulator_tempRes_state_elements_0 <= threadAdders_output_input_payload_state_elements_0;
            threadAccumulator_tempRes_state_elements_1 <= threadAdders_output_input_payload_state_elements_1;
            threadAccumulator_tempRes_state_elements_2 <= threadAdders_output_input_payload_state_elements_2;
            threadAccumulator_tempRes_state_elements_3 <= threadAdders_output_input_payload_state_elements_3;
            threadAccumulator_tempRes_state_elements_4 <= threadAdders_output_input_payload_state_elements_4;
            threadAccumulator_tempRes_state_elements_5 <= threadAdders_output_input_payload_state_elements_5;
            threadAccumulator_tempRes_state_elements_6 <= threadAdders_output_input_payload_state_elements_6;
            threadAccumulator_tempRes_state_elements_7 <= threadAdders_output_input_payload_state_elements_7;
            threadAccumulator_tempRes_state_elements_8 <= threadAdders_output_input_payload_state_elements_8;
            threadAccumulator_tempRes_state_elements_9 <= threadAdders_output_input_payload_state_elements_9;
            threadAccumulator_tempRes_state_elements_10 <= threadAdders_output_input_payload_state_elements_10;
            threadAccumulator_tempRes_state_elements_11 <= threadAdders_output_input_payload_state_elements_11;
            if(!when_MDSMatrixAdders_l79) begin
              threadAccumulator_fsm_counter <= (threadAccumulator_fsm_counter + 4'b0011);
            end
          end
        end
        `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_ADDING : begin
          if(threadAdders_output_input_fire_1) begin
            threadAccumulator_tempRes_state_elements_0 <= threadAccumulator_modAdderRes_0;
            threadAccumulator_tempRes_state_elements_1 <= threadAccumulator_modAdderRes_1;
            threadAccumulator_tempRes_state_elements_2 <= threadAccumulator_modAdderRes_2;
            threadAccumulator_tempRes_state_elements_3 <= threadAccumulator_modAdderRes_3;
            threadAccumulator_tempRes_state_elements_4 <= threadAccumulator_modAdderRes_4;
            threadAccumulator_tempRes_state_elements_5 <= threadAccumulator_modAdderRes_5;
            threadAccumulator_tempRes_state_elements_6 <= threadAccumulator_modAdderRes_6;
            threadAccumulator_tempRes_state_elements_7 <= threadAccumulator_modAdderRes_7;
            threadAccumulator_tempRes_state_elements_8 <= threadAccumulator_modAdderRes_8;
            threadAccumulator_tempRes_state_elements_9 <= threadAccumulator_modAdderRes_9;
            threadAccumulator_tempRes_state_elements_10 <= threadAccumulator_modAdderRes_10;
            threadAccumulator_tempRes_state_elements_11 <= threadAccumulator_modAdderRes_11;
            if(!when_MDSMatrixAdders_l94) begin
              threadAccumulator_fsm_counter <= (threadAccumulator_fsm_counter + 4'b0011);
            end
          end
        end
        `threadAccumulator_fsm_enumDefinition_binary_sequential_threadAccumulator_fsm_DONE : begin
          if(threadAccumulator_output_fire) begin
            if(threadAdders_output_input_fire_2) begin
              threadAccumulator_tempRes_round_index <= threadAdders_output_input_payload_round_index;
              threadAccumulator_tempRes_state_size <= threadAdders_output_input_payload_state_size;
              threadAccumulator_tempRes_state_id <= threadAdders_output_input_payload_state_id;
              threadAccumulator_tempRes_state_elements_0 <= threadAdders_output_input_payload_state_elements_0;
              threadAccumulator_tempRes_state_elements_1 <= threadAdders_output_input_payload_state_elements_1;
              threadAccumulator_tempRes_state_elements_2 <= threadAdders_output_input_payload_state_elements_2;
              threadAccumulator_tempRes_state_elements_3 <= threadAdders_output_input_payload_state_elements_3;
              threadAccumulator_tempRes_state_elements_4 <= threadAdders_output_input_payload_state_elements_4;
              threadAccumulator_tempRes_state_elements_5 <= threadAdders_output_input_payload_state_elements_5;
              threadAccumulator_tempRes_state_elements_6 <= threadAdders_output_input_payload_state_elements_6;
              threadAccumulator_tempRes_state_elements_7 <= threadAdders_output_input_payload_state_elements_7;
              threadAccumulator_tempRes_state_elements_8 <= threadAdders_output_input_payload_state_elements_8;
              threadAccumulator_tempRes_state_elements_9 <= threadAdders_output_input_payload_state_elements_9;
              threadAccumulator_tempRes_state_elements_10 <= threadAdders_output_input_payload_state_elements_10;
              threadAccumulator_tempRes_state_elements_11 <= threadAdders_output_input_payload_state_elements_11;
              if(when_MDSMatrixAdders_l111) begin
                threadAccumulator_fsm_counter <= (threadAccumulator_fsm_counter + 4'b0011);
              end
            end
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l214) begin
        threadAccumulator_fsm_counter <= 4'b0000;
      end
    end
  end

  always @(posedge clk) begin
    if(threadAdders_tempRes_ready) begin
      threadAdders_tempRes_rData_round_index <= threadAdders_tempRes_payload_round_index;
      threadAdders_tempRes_rData_state_size <= threadAdders_tempRes_payload_state_size;
      threadAdders_tempRes_rData_state_id <= threadAdders_tempRes_payload_state_id;
      threadAdders_tempRes_rData_state_elements_0 <= threadAdders_tempRes_payload_state_elements_0;
      threadAdders_tempRes_rData_state_elements_1 <= threadAdders_tempRes_payload_state_elements_1;
      threadAdders_tempRes_rData_state_elements_2 <= threadAdders_tempRes_payload_state_elements_2;
      threadAdders_tempRes_rData_state_elements_3 <= threadAdders_tempRes_payload_state_elements_3;
      threadAdders_tempRes_rData_state_elements_4 <= threadAdders_tempRes_payload_state_elements_4;
      threadAdders_tempRes_rData_state_elements_5 <= threadAdders_tempRes_payload_state_elements_5;
      threadAdders_tempRes_rData_state_elements_6 <= threadAdders_tempRes_payload_state_elements_6;
      threadAdders_tempRes_rData_state_elements_7 <= threadAdders_tempRes_payload_state_elements_7;
      threadAdders_tempRes_rData_state_elements_8 <= threadAdders_tempRes_payload_state_elements_8;
      threadAdders_tempRes_rData_state_elements_9 <= threadAdders_tempRes_payload_state_elements_9;
      threadAdders_tempRes_rData_state_elements_10 <= threadAdders_tempRes_payload_state_elements_10;
      threadAdders_tempRes_rData_state_elements_11 <= threadAdders_tempRes_payload_state_elements_11;
    end
    if(threadAdders_output_ready) begin
      threadAdders_output_rData_round_index <= threadAdders_output_payload_round_index;
      threadAdders_output_rData_state_size <= threadAdders_output_payload_state_size;
      threadAdders_output_rData_state_id <= threadAdders_output_payload_state_id;
      threadAdders_output_rData_state_elements_0 <= threadAdders_output_payload_state_elements_0;
      threadAdders_output_rData_state_elements_1 <= threadAdders_output_payload_state_elements_1;
      threadAdders_output_rData_state_elements_2 <= threadAdders_output_payload_state_elements_2;
      threadAdders_output_rData_state_elements_3 <= threadAdders_output_payload_state_elements_3;
      threadAdders_output_rData_state_elements_4 <= threadAdders_output_payload_state_elements_4;
      threadAdders_output_rData_state_elements_5 <= threadAdders_output_payload_state_elements_5;
      threadAdders_output_rData_state_elements_6 <= threadAdders_output_payload_state_elements_6;
      threadAdders_output_rData_state_elements_7 <= threadAdders_output_payload_state_elements_7;
      threadAdders_output_rData_state_elements_8 <= threadAdders_output_payload_state_elements_8;
      threadAdders_output_rData_state_elements_9 <= threadAdders_output_payload_state_elements_9;
      threadAdders_output_rData_state_elements_10 <= threadAdders_output_payload_state_elements_10;
      threadAdders_output_rData_state_elements_11 <= threadAdders_output_payload_state_elements_11;
    end
  end


endmodule
