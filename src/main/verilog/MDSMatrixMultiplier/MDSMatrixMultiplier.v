// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : MDSMatrixMultiplier



module MDSMatrixMultiplier (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [3:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
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
  input               reset,
  input               clk
);
  wire       [1:0]    mdsMatrix_t3_io_address_port;
  wire       [2:0]    mdsMatrix_t5_io_address_port;
  wire       [254:0]  mdsMatrix_t3_io_data_ports_0;
  wire       [254:0]  mdsMatrix_t3_io_data_ports_1;
  wire       [254:0]  mdsMatrix_t3_io_data_ports_2;
  wire       [254:0]  mdsMatrix_t5_io_data_ports_0;
  wire       [254:0]  mdsMatrix_t5_io_data_ports_1;
  wire       [254:0]  mdsMatrix_t5_io_data_ports_2;
  wire       [254:0]  mdsMatrix_t5_io_data_ports_3;
  wire       [254:0]  mdsMatrix_t5_io_data_ports_4;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_0;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_1;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_2;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_3;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_4;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_5;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_6;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_7;
  wire       [254:0]  mdsMatrix_t9_io_data_ports_8;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_0;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_1;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_2;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_3;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_4;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_5;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_6;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_7;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_8;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_9;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_10;
  wire       [254:0]  mdsMatrix_t12_io_data_ports_11;
  wire                io_input_translated_fork_io_input_ready;
  wire                io_input_translated_fork_io_outputs_0_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_0_payload;
  wire                io_input_translated_fork_io_outputs_1_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_1_payload;
  wire                io_input_translated_fork_io_outputs_2_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_2_payload;
  wire                io_input_translated_fork_io_outputs_3_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_3_payload;
  wire                io_input_translated_fork_io_outputs_4_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_4_payload;
  wire                io_input_translated_fork_io_outputs_5_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_5_payload;
  wire                io_input_translated_fork_io_outputs_6_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_6_payload;
  wire                io_input_translated_fork_io_outputs_7_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_7_payload;
  wire                io_input_translated_fork_io_outputs_8_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_8_payload;
  wire                io_input_translated_fork_io_outputs_9_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_9_payload;
  wire                io_input_translated_fork_io_outputs_10_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_10_payload;
  wire                io_input_translated_fork_io_outputs_11_valid;
  wire       [254:0]  io_input_translated_fork_io_outputs_11_payload;
  wire                modMultipliers_0_op_ready_o;
  wire                modMultipliers_0_res_valid_o;
  wire       [254:0]  modMultipliers_0_res_o;
  wire                modMultipliers_1_op_ready_o;
  wire                modMultipliers_1_res_valid_o;
  wire       [254:0]  modMultipliers_1_res_o;
  wire                modMultipliers_2_op_ready_o;
  wire                modMultipliers_2_res_valid_o;
  wire       [254:0]  modMultipliers_2_res_o;
  wire                modMultipliers_3_op_ready_o;
  wire                modMultipliers_3_res_valid_o;
  wire       [254:0]  modMultipliers_3_res_o;
  wire                modMultipliers_4_op_ready_o;
  wire                modMultipliers_4_res_valid_o;
  wire       [254:0]  modMultipliers_4_res_o;
  wire                modMultipliers_5_op_ready_o;
  wire                modMultipliers_5_res_valid_o;
  wire       [254:0]  modMultipliers_5_res_o;
  wire                modMultipliers_6_op_ready_o;
  wire                modMultipliers_6_res_valid_o;
  wire       [254:0]  modMultipliers_6_res_o;
  wire                modMultipliers_7_op_ready_o;
  wire                modMultipliers_7_res_valid_o;
  wire       [254:0]  modMultipliers_7_res_o;
  wire                modMultipliers_8_op_ready_o;
  wire                modMultipliers_8_res_valid_o;
  wire       [254:0]  modMultipliers_8_res_o;
  wire                modMultipliers_9_op_ready_o;
  wire                modMultipliers_9_res_valid_o;
  wire       [254:0]  modMultipliers_9_res_o;
  wire                modMultipliers_10_op_ready_o;
  wire                modMultipliers_10_res_valid_o;
  wire       [254:0]  modMultipliers_10_res_o;
  wire                modMultipliers_11_op_ready_o;
  wire                modMultipliers_11_res_valid_o;
  wire       [254:0]  modMultipliers_11_res_o;
  wire       [254:0]  _zz__zz_mulOp2s_0_4;
  wire       [254:0]  _zz__zz_mulOp2s_0_4_1;
  wire       [254:0]  _zz__zz_mulResJoined_translated_payload_state_elements_0;
  wire       [254:0]  _zz__zz_mulResJoined_translated_payload_state_elements_0_1;
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
  wire                when_MDSMatrixMultiplier_l51;
  wire       [3059:0] _zz_mulOp2s_0_1;
  wire       [3059:0] _zz_mulOp2s_0_2;
  wire       [3059:0] _zz_mulOp2s_0_3;
  wire       [3059:0] _zz_mulOp2s_0_4;
  wire       [3059:0] _zz_mulOp2s_0_5;
  wire                io_input_translated_valid;
  wire                io_input_translated_ready;
  wire       [254:0]  io_input_translated_payload;
  reg        [6:0]    mulContext_round_index;
  reg        [3:0]    mulContext_state_size;
  reg        [3:0]    mulContext_state_id;
  wire                io_input_fire;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire       [3059:0] _zz_mulResJoined_translated_payload_state_elements_0;
  wire                mulResJoined_translated_valid;
  reg                 mulResJoined_translated_ready;
  wire       [6:0]    mulResJoined_translated_payload_round_index;
  wire       [3:0]    mulResJoined_translated_payload_state_size;
  wire       [3:0]    mulResJoined_translated_payload_state_id;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_0;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_1;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_2;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_3;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_4;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_5;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_6;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_7;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_8;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_9;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_10;
  wire       [254:0]  mulResJoined_translated_payload_state_elements_11;
  wire                mulResJoined_translated_m2sPipe_valid;
  wire                mulResJoined_translated_m2sPipe_ready;
  wire       [6:0]    mulResJoined_translated_m2sPipe_payload_round_index;
  wire       [3:0]    mulResJoined_translated_m2sPipe_payload_state_size;
  wire       [3:0]    mulResJoined_translated_m2sPipe_payload_state_id;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_0;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_1;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_2;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_3;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_4;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_5;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_6;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_7;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_8;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_9;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_10;
  wire       [254:0]  mulResJoined_translated_m2sPipe_payload_state_elements_11;
  reg                 mulResJoined_translated_rValid;
  reg        [6:0]    mulResJoined_translated_rData_round_index;
  reg        [3:0]    mulResJoined_translated_rData_state_size;
  reg        [3:0]    mulResJoined_translated_rData_state_id;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_0;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_1;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_2;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_3;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_4;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_5;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_6;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_7;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_8;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_9;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_10;
  reg        [254:0]  mulResJoined_translated_rData_state_elements_11;
  wire                when_Stream_l342;

  assign _zz__zz_mulOp2s_0_4 = mdsMatrix_t12_io_data_ports_1;
  assign _zz__zz_mulOp2s_0_4_1 = mdsMatrix_t12_io_data_ports_0;
  assign _zz__zz_mulResJoined_translated_payload_state_elements_0 = modMultipliers_1_res_o;
  assign _zz__zz_mulResJoined_translated_payload_state_elements_0_1 = modMultipliers_0_res_o;
  MDSMatrix mdsMatrix_t3 (
    .io_data_ports_0    (mdsMatrix_t3_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t3_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t3_io_data_ports_2  ), //o
    .io_address_port    (mdsMatrix_t3_io_address_port  )  //i
  );
  MDSMatrix_1 mdsMatrix_t5 (
    .io_data_ports_0    (mdsMatrix_t5_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t5_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t5_io_data_ports_2  ), //o
    .io_data_ports_3    (mdsMatrix_t5_io_data_ports_3  ), //o
    .io_data_ports_4    (mdsMatrix_t5_io_data_ports_4  ), //o
    .io_address_port    (mdsMatrix_t5_io_address_port  )  //i
  );
  MDSMatrix_2 mdsMatrix_t9 (
    .io_data_ports_0    (mdsMatrix_t9_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t9_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t9_io_data_ports_2  ), //o
    .io_data_ports_3    (mdsMatrix_t9_io_data_ports_3  ), //o
    .io_data_ports_4    (mdsMatrix_t9_io_data_ports_4  ), //o
    .io_data_ports_5    (mdsMatrix_t9_io_data_ports_5  ), //o
    .io_data_ports_6    (mdsMatrix_t9_io_data_ports_6  ), //o
    .io_data_ports_7    (mdsMatrix_t9_io_data_ports_7  ), //o
    .io_data_ports_8    (mdsMatrix_t9_io_data_ports_8  ), //o
    .io_address_port    (io_input_payload_state_index  )  //i
  );
  MDSMatrix_3 mdsMatrix_t12 (
    .io_data_ports_0     (mdsMatrix_t12_io_data_ports_0   ), //o
    .io_data_ports_1     (mdsMatrix_t12_io_data_ports_1   ), //o
    .io_data_ports_2     (mdsMatrix_t12_io_data_ports_2   ), //o
    .io_data_ports_3     (mdsMatrix_t12_io_data_ports_3   ), //o
    .io_data_ports_4     (mdsMatrix_t12_io_data_ports_4   ), //o
    .io_data_ports_5     (mdsMatrix_t12_io_data_ports_5   ), //o
    .io_data_ports_6     (mdsMatrix_t12_io_data_ports_6   ), //o
    .io_data_ports_7     (mdsMatrix_t12_io_data_ports_7   ), //o
    .io_data_ports_8     (mdsMatrix_t12_io_data_ports_8   ), //o
    .io_data_ports_9     (mdsMatrix_t12_io_data_ports_9   ), //o
    .io_data_ports_10    (mdsMatrix_t12_io_data_ports_10  ), //o
    .io_data_ports_11    (mdsMatrix_t12_io_data_ports_11  ), //o
    .io_address_port     (io_input_payload_state_index    )  //i
  );
  StreamFork io_input_translated_fork (
    .io_input_valid           (io_input_translated_valid                       ), //i
    .io_input_ready           (io_input_translated_fork_io_input_ready         ), //o
    .io_input_payload         (io_input_translated_payload                     ), //i
    .io_outputs_0_valid       (io_input_translated_fork_io_outputs_0_valid     ), //o
    .io_outputs_0_ready       (modMultipliers_0_op_ready_o                     ), //i
    .io_outputs_0_payload     (io_input_translated_fork_io_outputs_0_payload   ), //o
    .io_outputs_1_valid       (io_input_translated_fork_io_outputs_1_valid     ), //o
    .io_outputs_1_ready       (modMultipliers_1_op_ready_o                     ), //i
    .io_outputs_1_payload     (io_input_translated_fork_io_outputs_1_payload   ), //o
    .io_outputs_2_valid       (io_input_translated_fork_io_outputs_2_valid     ), //o
    .io_outputs_2_ready       (modMultipliers_2_op_ready_o                     ), //i
    .io_outputs_2_payload     (io_input_translated_fork_io_outputs_2_payload   ), //o
    .io_outputs_3_valid       (io_input_translated_fork_io_outputs_3_valid     ), //o
    .io_outputs_3_ready       (modMultipliers_3_op_ready_o                     ), //i
    .io_outputs_3_payload     (io_input_translated_fork_io_outputs_3_payload   ), //o
    .io_outputs_4_valid       (io_input_translated_fork_io_outputs_4_valid     ), //o
    .io_outputs_4_ready       (modMultipliers_4_op_ready_o                     ), //i
    .io_outputs_4_payload     (io_input_translated_fork_io_outputs_4_payload   ), //o
    .io_outputs_5_valid       (io_input_translated_fork_io_outputs_5_valid     ), //o
    .io_outputs_5_ready       (modMultipliers_5_op_ready_o                     ), //i
    .io_outputs_5_payload     (io_input_translated_fork_io_outputs_5_payload   ), //o
    .io_outputs_6_valid       (io_input_translated_fork_io_outputs_6_valid     ), //o
    .io_outputs_6_ready       (modMultipliers_6_op_ready_o                     ), //i
    .io_outputs_6_payload     (io_input_translated_fork_io_outputs_6_payload   ), //o
    .io_outputs_7_valid       (io_input_translated_fork_io_outputs_7_valid     ), //o
    .io_outputs_7_ready       (modMultipliers_7_op_ready_o                     ), //i
    .io_outputs_7_payload     (io_input_translated_fork_io_outputs_7_payload   ), //o
    .io_outputs_8_valid       (io_input_translated_fork_io_outputs_8_valid     ), //o
    .io_outputs_8_ready       (modMultipliers_8_op_ready_o                     ), //i
    .io_outputs_8_payload     (io_input_translated_fork_io_outputs_8_payload   ), //o
    .io_outputs_9_valid       (io_input_translated_fork_io_outputs_9_valid     ), //o
    .io_outputs_9_ready       (modMultipliers_9_op_ready_o                     ), //i
    .io_outputs_9_payload     (io_input_translated_fork_io_outputs_9_payload   ), //o
    .io_outputs_10_valid      (io_input_translated_fork_io_outputs_10_valid    ), //o
    .io_outputs_10_ready      (modMultipliers_10_op_ready_o                    ), //i
    .io_outputs_10_payload    (io_input_translated_fork_io_outputs_10_payload  ), //o
    .io_outputs_11_valid      (io_input_translated_fork_io_outputs_11_valid    ), //o
    .io_outputs_11_ready      (modMultipliers_11_op_ready_o                    ), //i
    .io_outputs_11_payload    (io_input_translated_fork_io_outputs_11_payload  )  //o
  );
  ModMultiplier modMultipliers_0 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_0_valid    ), //i
    .op_ready_o     (modMultipliers_0_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_0_payload  ), //i
    .op2_i          (mulOp2s_0                                      ), //i
    .res_valid_o    (modMultipliers_0_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_0_res_o                         )  //o
  );
  ModMultiplier modMultipliers_1 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_1_valid    ), //i
    .op_ready_o     (modMultipliers_1_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_1_payload  ), //i
    .op2_i          (mulOp2s_1                                      ), //i
    .res_valid_o    (modMultipliers_1_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_1_res_o                         )  //o
  );
  ModMultiplier modMultipliers_2 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_2_valid    ), //i
    .op_ready_o     (modMultipliers_2_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_2_payload  ), //i
    .op2_i          (mulOp2s_2                                      ), //i
    .res_valid_o    (modMultipliers_2_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_2_res_o                         )  //o
  );
  ModMultiplier modMultipliers_3 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_3_valid    ), //i
    .op_ready_o     (modMultipliers_3_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_3_payload  ), //i
    .op2_i          (mulOp2s_3                                      ), //i
    .res_valid_o    (modMultipliers_3_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_3_res_o                         )  //o
  );
  ModMultiplier modMultipliers_4 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_4_valid    ), //i
    .op_ready_o     (modMultipliers_4_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_4_payload  ), //i
    .op2_i          (mulOp2s_4                                      ), //i
    .res_valid_o    (modMultipliers_4_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_4_res_o                         )  //o
  );
  ModMultiplier modMultipliers_5 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_5_valid    ), //i
    .op_ready_o     (modMultipliers_5_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_5_payload  ), //i
    .op2_i          (mulOp2s_5                                      ), //i
    .res_valid_o    (modMultipliers_5_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_5_res_o                         )  //o
  );
  ModMultiplier modMultipliers_6 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_6_valid    ), //i
    .op_ready_o     (modMultipliers_6_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_6_payload  ), //i
    .op2_i          (mulOp2s_6                                      ), //i
    .res_valid_o    (modMultipliers_6_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_6_res_o                         )  //o
  );
  ModMultiplier modMultipliers_7 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_7_valid    ), //i
    .op_ready_o     (modMultipliers_7_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_7_payload  ), //i
    .op2_i          (mulOp2s_7                                      ), //i
    .res_valid_o    (modMultipliers_7_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_7_res_o                         )  //o
  );
  ModMultiplier modMultipliers_8 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_8_valid    ), //i
    .op_ready_o     (modMultipliers_8_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_8_payload  ), //i
    .op2_i          (mulOp2s_8                                      ), //i
    .res_valid_o    (modMultipliers_8_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_8_res_o                         )  //o
  );
  ModMultiplier modMultipliers_9 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_9_valid    ), //i
    .op_ready_o     (modMultipliers_9_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_9_payload  ), //i
    .op2_i          (mulOp2s_9                                      ), //i
    .res_valid_o    (modMultipliers_9_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                              ), //i
    .res_o          (modMultipliers_9_res_o                         )  //o
  );
  ModMultiplier modMultipliers_10 (
    .clk            (clk                                             ), //i
    .rst            (reset                                           ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_10_valid    ), //i
    .op_ready_o     (modMultipliers_10_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_10_payload  ), //i
    .op2_i          (mulOp2s_10                                      ), //i
    .res_valid_o    (modMultipliers_10_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                               ), //i
    .res_o          (modMultipliers_10_res_o                         )  //o
  );
  ModMultiplier modMultipliers_11 (
    .clk            (clk                                             ), //i
    .rst            (reset                                           ), //i
    .op_valid_i     (io_input_translated_fork_io_outputs_11_valid    ), //i
    .op_ready_o     (modMultipliers_11_op_ready_o                    ), //o
    .op1_i          (io_input_translated_fork_io_outputs_11_payload  ), //i
    .op2_i          (mulOp2s_11                                      ), //i
    .res_valid_o    (modMultipliers_11_res_valid_o                   ), //o
    .res_ready_i    (mulResJoined_fire                               ), //i
    .res_o          (modMultipliers_11_res_o                         )  //o
  );
  assign mdsMatrix_t3_io_address_port = io_input_payload_state_index[1:0];
  assign mdsMatrix_t5_io_address_port = io_input_payload_state_index[2:0];
  assign _zz_mulOp2s_0 = {2295'h0,{mdsMatrix_t3_io_data_ports_2,{mdsMatrix_t3_io_data_ports_1,mdsMatrix_t3_io_data_ports_0}}};
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        mulOp2s_0 = _zz_mulOp2s_0[254 : 0];
      end
      4'b0101 : begin
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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
        if(when_MDSMatrixMultiplier_l51) begin
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

  assign when_MDSMatrixMultiplier_l51 = (io_input_payload_state_index == 4'b0101);
  assign _zz_mulOp2s_0_1 = 3060'h0;
  assign _zz_mulOp2s_0_2 = {1785'h0,{mdsMatrix_t5_io_data_ports_4,{mdsMatrix_t5_io_data_ports_3,{mdsMatrix_t5_io_data_ports_2,{mdsMatrix_t5_io_data_ports_1,mdsMatrix_t5_io_data_ports_0}}}}};
  assign _zz_mulOp2s_0_3 = {765'h0,{mdsMatrix_t9_io_data_ports_8,{mdsMatrix_t9_io_data_ports_7,{mdsMatrix_t9_io_data_ports_6,{mdsMatrix_t9_io_data_ports_5,{mdsMatrix_t9_io_data_ports_4,{mdsMatrix_t9_io_data_ports_3,{mdsMatrix_t9_io_data_ports_2,{mdsMatrix_t9_io_data_ports_1,mdsMatrix_t9_io_data_ports_0}}}}}}}}};
  assign _zz_mulOp2s_0_4 = {mdsMatrix_t12_io_data_ports_11,{mdsMatrix_t12_io_data_ports_10,{mdsMatrix_t12_io_data_ports_9,{mdsMatrix_t12_io_data_ports_8,{mdsMatrix_t12_io_data_ports_7,{mdsMatrix_t12_io_data_ports_6,{mdsMatrix_t12_io_data_ports_5,{mdsMatrix_t12_io_data_ports_4,{mdsMatrix_t12_io_data_ports_3,{mdsMatrix_t12_io_data_ports_2,{_zz__zz_mulOp2s_0_4,_zz__zz_mulOp2s_0_4_1}}}}}}}}}}};
  assign _zz_mulOp2s_0_5 = 3060'h0;
  assign io_input_translated_valid = io_input_valid;
  assign io_input_ready = io_input_translated_ready;
  assign io_input_translated_payload = io_input_payload_state_element;
  assign io_input_translated_ready = io_input_translated_fork_io_input_ready;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign mulResJoined_fire = (mulResJoined_valid && mulResJoined_ready);
  assign mulResJoined_valid = (((((((((((modMultipliers_0_res_valid_o && modMultipliers_1_res_valid_o) && modMultipliers_2_res_valid_o) && modMultipliers_3_res_valid_o) && modMultipliers_4_res_valid_o) && modMultipliers_5_res_valid_o) && modMultipliers_6_res_valid_o) && modMultipliers_7_res_valid_o) && modMultipliers_8_res_valid_o) && modMultipliers_9_res_valid_o) && modMultipliers_10_res_valid_o) && modMultipliers_11_res_valid_o);
  assign _zz_mulResJoined_translated_payload_state_elements_0 = {modMultipliers_11_res_o,{modMultipliers_10_res_o,{modMultipliers_9_res_o,{modMultipliers_8_res_o,{modMultipliers_7_res_o,{modMultipliers_6_res_o,{modMultipliers_5_res_o,{modMultipliers_4_res_o,{modMultipliers_3_res_o,{modMultipliers_2_res_o,{_zz__zz_mulResJoined_translated_payload_state_elements_0,_zz__zz_mulResJoined_translated_payload_state_elements_0_1}}}}}}}}}}};
  assign mulResJoined_translated_valid = mulResJoined_valid;
  assign mulResJoined_ready = mulResJoined_translated_ready;
  assign mulResJoined_translated_payload_round_index = mulContext_round_index;
  assign mulResJoined_translated_payload_state_size = mulContext_state_size;
  assign mulResJoined_translated_payload_state_id = mulContext_state_id;
  assign mulResJoined_translated_payload_state_elements_0 = _zz_mulResJoined_translated_payload_state_elements_0[254 : 0];
  assign mulResJoined_translated_payload_state_elements_1 = _zz_mulResJoined_translated_payload_state_elements_0[509 : 255];
  assign mulResJoined_translated_payload_state_elements_2 = _zz_mulResJoined_translated_payload_state_elements_0[764 : 510];
  assign mulResJoined_translated_payload_state_elements_3 = _zz_mulResJoined_translated_payload_state_elements_0[1019 : 765];
  assign mulResJoined_translated_payload_state_elements_4 = _zz_mulResJoined_translated_payload_state_elements_0[1274 : 1020];
  assign mulResJoined_translated_payload_state_elements_5 = _zz_mulResJoined_translated_payload_state_elements_0[1529 : 1275];
  assign mulResJoined_translated_payload_state_elements_6 = _zz_mulResJoined_translated_payload_state_elements_0[1784 : 1530];
  assign mulResJoined_translated_payload_state_elements_7 = _zz_mulResJoined_translated_payload_state_elements_0[2039 : 1785];
  assign mulResJoined_translated_payload_state_elements_8 = _zz_mulResJoined_translated_payload_state_elements_0[2294 : 2040];
  assign mulResJoined_translated_payload_state_elements_9 = _zz_mulResJoined_translated_payload_state_elements_0[2549 : 2295];
  assign mulResJoined_translated_payload_state_elements_10 = _zz_mulResJoined_translated_payload_state_elements_0[2804 : 2550];
  assign mulResJoined_translated_payload_state_elements_11 = _zz_mulResJoined_translated_payload_state_elements_0[3059 : 2805];
  always @(*) begin
    mulResJoined_translated_ready = mulResJoined_translated_m2sPipe_ready;
    if(when_Stream_l342) begin
      mulResJoined_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! mulResJoined_translated_m2sPipe_valid);
  assign mulResJoined_translated_m2sPipe_valid = mulResJoined_translated_rValid;
  assign mulResJoined_translated_m2sPipe_payload_round_index = mulResJoined_translated_rData_round_index;
  assign mulResJoined_translated_m2sPipe_payload_state_size = mulResJoined_translated_rData_state_size;
  assign mulResJoined_translated_m2sPipe_payload_state_id = mulResJoined_translated_rData_state_id;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_0 = mulResJoined_translated_rData_state_elements_0;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_1 = mulResJoined_translated_rData_state_elements_1;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_2 = mulResJoined_translated_rData_state_elements_2;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_3 = mulResJoined_translated_rData_state_elements_3;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_4 = mulResJoined_translated_rData_state_elements_4;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_5 = mulResJoined_translated_rData_state_elements_5;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_6 = mulResJoined_translated_rData_state_elements_6;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_7 = mulResJoined_translated_rData_state_elements_7;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_8 = mulResJoined_translated_rData_state_elements_8;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_9 = mulResJoined_translated_rData_state_elements_9;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_10 = mulResJoined_translated_rData_state_elements_10;
  assign mulResJoined_translated_m2sPipe_payload_state_elements_11 = mulResJoined_translated_rData_state_elements_11;
  assign io_output_valid = mulResJoined_translated_m2sPipe_valid;
  assign mulResJoined_translated_m2sPipe_ready = io_output_ready;
  assign io_output_payload_round_index = mulResJoined_translated_m2sPipe_payload_round_index;
  assign io_output_payload_state_size = mulResJoined_translated_m2sPipe_payload_state_size;
  assign io_output_payload_state_id = mulResJoined_translated_m2sPipe_payload_state_id;
  assign io_output_payload_state_elements_0 = mulResJoined_translated_m2sPipe_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = mulResJoined_translated_m2sPipe_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = mulResJoined_translated_m2sPipe_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = mulResJoined_translated_m2sPipe_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = mulResJoined_translated_m2sPipe_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = mulResJoined_translated_m2sPipe_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = mulResJoined_translated_m2sPipe_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = mulResJoined_translated_m2sPipe_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = mulResJoined_translated_m2sPipe_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = mulResJoined_translated_m2sPipe_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = mulResJoined_translated_m2sPipe_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = mulResJoined_translated_m2sPipe_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mulContext_state_size <= 4'b0000;
      mulContext_state_id <= 4'b0000;
      mulContext_round_index <= 7'h0;
      mulResJoined_translated_rValid <= 1'b0;
    end else begin
      if(io_input_fire) begin
        mulContext_round_index <= io_input_payload_round_index;
        mulContext_state_size <= io_input_payload_state_size;
        mulContext_state_id <= io_input_payload_state_id;
      end
      if(mulResJoined_translated_ready) begin
        mulResJoined_translated_rValid <= mulResJoined_translated_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(mulResJoined_translated_ready) begin
      mulResJoined_translated_rData_round_index <= mulResJoined_translated_payload_round_index;
      mulResJoined_translated_rData_state_size <= mulResJoined_translated_payload_state_size;
      mulResJoined_translated_rData_state_id <= mulResJoined_translated_payload_state_id;
      mulResJoined_translated_rData_state_elements_0 <= mulResJoined_translated_payload_state_elements_0;
      mulResJoined_translated_rData_state_elements_1 <= mulResJoined_translated_payload_state_elements_1;
      mulResJoined_translated_rData_state_elements_2 <= mulResJoined_translated_payload_state_elements_2;
      mulResJoined_translated_rData_state_elements_3 <= mulResJoined_translated_payload_state_elements_3;
      mulResJoined_translated_rData_state_elements_4 <= mulResJoined_translated_payload_state_elements_4;
      mulResJoined_translated_rData_state_elements_5 <= mulResJoined_translated_payload_state_elements_5;
      mulResJoined_translated_rData_state_elements_6 <= mulResJoined_translated_payload_state_elements_6;
      mulResJoined_translated_rData_state_elements_7 <= mulResJoined_translated_payload_state_elements_7;
      mulResJoined_translated_rData_state_elements_8 <= mulResJoined_translated_payload_state_elements_8;
      mulResJoined_translated_rData_state_elements_9 <= mulResJoined_translated_payload_state_elements_9;
      mulResJoined_translated_rData_state_elements_10 <= mulResJoined_translated_payload_state_elements_10;
      mulResJoined_translated_rData_state_elements_11 <= mulResJoined_translated_payload_state_elements_11;
    end
  end


endmodule

module StreamFork (
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

module MDSMatrix_3 (
  output     [254:0]  io_data_ports_0,
  output     [254:0]  io_data_ports_1,
  output     [254:0]  io_data_ports_2,
  output     [254:0]  io_data_ports_3,
  output     [254:0]  io_data_ports_4,
  output     [254:0]  io_data_ports_5,
  output     [254:0]  io_data_ports_6,
  output     [254:0]  io_data_ports_7,
  output     [254:0]  io_data_ports_8,
  output     [254:0]  io_data_ports_9,
  output     [254:0]  io_data_ports_10,
  output     [254:0]  io_data_ports_11,
  input      [3:0]    io_address_port
);
  wire       [254:0]  _zz_mds_roms_0_port0;
  wire       [254:0]  _zz_mds_roms_1_port0;
  wire       [254:0]  _zz_mds_roms_2_port0;
  wire       [254:0]  _zz_mds_roms_3_port0;
  wire       [254:0]  _zz_mds_roms_4_port0;
  wire       [254:0]  _zz_mds_roms_5_port0;
  wire       [254:0]  _zz_mds_roms_6_port0;
  wire       [254:0]  _zz_mds_roms_7_port0;
  wire       [254:0]  _zz_mds_roms_8_port0;
  wire       [254:0]  _zz_mds_roms_9_port0;
  wire       [254:0]  _zz_mds_roms_10_port0;
  wire       [254:0]  _zz_mds_roms_11_port0;
  (* ram_style = "distributed" *) reg [254:0] mds_roms_0 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_1 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_2 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_3 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_4 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_5 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_6 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_7 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_8 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_9 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_10 [0:11];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_11 [0:11];

  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_8.bin",mds_roms_8);
  end
  assign _zz_mds_roms_8_port0 = mds_roms_8[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_9.bin",mds_roms_9);
  end
  assign _zz_mds_roms_9_port0 = mds_roms_9[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_10.bin",mds_roms_10);
  end
  assign _zz_mds_roms_10_port0 = mds_roms_10[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t12_mds_roms_11.bin",mds_roms_11);
  end
  assign _zz_mds_roms_11_port0 = mds_roms_11[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;
  assign io_data_ports_3 = _zz_mds_roms_3_port0;
  assign io_data_ports_4 = _zz_mds_roms_4_port0;
  assign io_data_ports_5 = _zz_mds_roms_5_port0;
  assign io_data_ports_6 = _zz_mds_roms_6_port0;
  assign io_data_ports_7 = _zz_mds_roms_7_port0;
  assign io_data_ports_8 = _zz_mds_roms_8_port0;
  assign io_data_ports_9 = _zz_mds_roms_9_port0;
  assign io_data_ports_10 = _zz_mds_roms_10_port0;
  assign io_data_ports_11 = _zz_mds_roms_11_port0;

endmodule

module MDSMatrix_2 (
  output     [254:0]  io_data_ports_0,
  output     [254:0]  io_data_ports_1,
  output     [254:0]  io_data_ports_2,
  output     [254:0]  io_data_ports_3,
  output     [254:0]  io_data_ports_4,
  output     [254:0]  io_data_ports_5,
  output     [254:0]  io_data_ports_6,
  output     [254:0]  io_data_ports_7,
  output     [254:0]  io_data_ports_8,
  input      [3:0]    io_address_port
);
  wire       [254:0]  _zz_mds_roms_0_port0;
  wire       [254:0]  _zz_mds_roms_1_port0;
  wire       [254:0]  _zz_mds_roms_2_port0;
  wire       [254:0]  _zz_mds_roms_3_port0;
  wire       [254:0]  _zz_mds_roms_4_port0;
  wire       [254:0]  _zz_mds_roms_5_port0;
  wire       [254:0]  _zz_mds_roms_6_port0;
  wire       [254:0]  _zz_mds_roms_7_port0;
  wire       [254:0]  _zz_mds_roms_8_port0;
  (* ram_style = "distributed" *) reg [254:0] mds_roms_0 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_1 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_2 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_3 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_4 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_5 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_6 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_7 [0:8];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_8 [0:8];

  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t9_mds_roms_8.bin",mds_roms_8);
  end
  assign _zz_mds_roms_8_port0 = mds_roms_8[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;
  assign io_data_ports_3 = _zz_mds_roms_3_port0;
  assign io_data_ports_4 = _zz_mds_roms_4_port0;
  assign io_data_ports_5 = _zz_mds_roms_5_port0;
  assign io_data_ports_6 = _zz_mds_roms_6_port0;
  assign io_data_ports_7 = _zz_mds_roms_7_port0;
  assign io_data_ports_8 = _zz_mds_roms_8_port0;

endmodule

module MDSMatrix_1 (
  output     [254:0]  io_data_ports_0,
  output     [254:0]  io_data_ports_1,
  output     [254:0]  io_data_ports_2,
  output     [254:0]  io_data_ports_3,
  output     [254:0]  io_data_ports_4,
  input      [2:0]    io_address_port
);
  wire       [254:0]  _zz_mds_roms_0_port0;
  wire       [254:0]  _zz_mds_roms_1_port0;
  wire       [254:0]  _zz_mds_roms_2_port0;
  wire       [254:0]  _zz_mds_roms_3_port0;
  wire       [254:0]  _zz_mds_roms_4_port0;
  (* ram_style = "distributed" *) reg [254:0] mds_roms_0 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_1 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_2 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_3 [0:4];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_4 [0:4];

  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t5_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t5_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t5_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t5_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t5_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;
  assign io_data_ports_3 = _zz_mds_roms_3_port0;
  assign io_data_ports_4 = _zz_mds_roms_4_port0;

endmodule

module MDSMatrix (
  output     [254:0]  io_data_ports_0,
  output     [254:0]  io_data_ports_1,
  output     [254:0]  io_data_ports_2,
  input      [1:0]    io_address_port
);
  wire       [254:0]  _zz_mds_roms_0_port0;
  wire       [254:0]  _zz_mds_roms_1_port0;
  wire       [254:0]  _zz_mds_roms_2_port0;
  (* ram_style = "distributed" *) reg [254:0] mds_roms_0 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_1 [0:2];
  (* ram_style = "distributed" *) reg [254:0] mds_roms_2 [0:2];

  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t3_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t3_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("MDSMatrixMultiplier.v_toplevel_mdsMatrix_t3_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;

endmodule
