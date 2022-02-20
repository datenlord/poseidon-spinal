// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : MontMultiplierPipedSim
// Git hash  : c5fda50d3fb129ecb0d9445587bf2ead1df08842



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
  wire       [0:0]    streamDemux_1_io_select;
  wire                streamDemux_1_io_outputs_0_ready;
  wire                streamArbiter_1_io_inputs_0_ready;
  wire                streamArbiter_1_io_inputs_1_ready;
  wire                streamArbiter_1_io_output_valid;
  wire       [254:0]  streamArbiter_1_io_output_payload_xTemp;
  wire       [254:0]  streamArbiter_1_io_output_payload_yTemp;
  wire       [255:0]  streamArbiter_1_io_output_payload_yAddM;
  wire       [255:0]  streamArbiter_1_io_output_payload_adderRes;
  wire       [5:0]    streamArbiter_1_io_output_payload_counter;
  wire       [0:0]    streamArbiter_1_io_chosen;
  wire       [1:0]    streamArbiter_1_io_chosenOH;
  wire       [255:0]  oneBitFullAdderArraySim_1_adder_res_o;
  wire       [255:0]  oneBitFullAdderArraySim_2_adder_res_o;
  wire       [255:0]  oneBitFullAdderArraySim_3_adder_res_o;
  wire                streamDemux_1_io_input_ready;
  wire                streamDemux_1_io_outputs_0_valid;
  wire       [254:0]  streamDemux_1_io_outputs_0_payload_xTemp;
  wire       [254:0]  streamDemux_1_io_outputs_0_payload_yTemp;
  wire       [255:0]  streamDemux_1_io_outputs_0_payload_yAddM;
  wire       [255:0]  streamDemux_1_io_outputs_0_payload_adderRes;
  wire       [5:0]    streamDemux_1_io_outputs_0_payload_counter;
  wire                streamDemux_1_io_outputs_1_valid;
  wire       [254:0]  streamDemux_1_io_outputs_1_payload_xTemp;
  wire       [254:0]  streamDemux_1_io_outputs_1_payload_yTemp;
  wire       [255:0]  streamDemux_1_io_outputs_1_payload_yAddM;
  wire       [255:0]  streamDemux_1_io_outputs_1_payload_adderRes;
  wire       [5:0]    streamDemux_1_io_outputs_1_payload_counter;
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
  wire                streamDemux_1_io_outputs_0_s2mPipe_valid;
  wire                streamDemux_1_io_outputs_0_s2mPipe_ready;
  wire       [254:0]  streamDemux_1_io_outputs_0_s2mPipe_payload_xTemp;
  wire       [254:0]  streamDemux_1_io_outputs_0_s2mPipe_payload_yTemp;
  wire       [255:0]  streamDemux_1_io_outputs_0_s2mPipe_payload_yAddM;
  wire       [255:0]  streamDemux_1_io_outputs_0_s2mPipe_payload_adderRes;
  wire       [5:0]    streamDemux_1_io_outputs_0_s2mPipe_payload_counter;
  reg                 streamDemux_1_io_outputs_0_rValid;
  reg        [254:0]  streamDemux_1_io_outputs_0_rData_xTemp;
  reg        [254:0]  streamDemux_1_io_outputs_0_rData_yTemp;
  reg        [255:0]  streamDemux_1_io_outputs_0_rData_yAddM;
  reg        [255:0]  streamDemux_1_io_outputs_0_rData_adderRes;
  reg        [5:0]    streamDemux_1_io_outputs_0_rData_counter;
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

  assign _zz_resCombination_tempRes = streamDemux_1_io_outputs_1_payload_adderRes[254:0];
  StreamArbiter streamArbiter_1 (
    .io_inputs_0_valid               (adderPipeline_loopback_valid                 ), //i
    .io_inputs_0_ready               (streamArbiter_1_io_inputs_0_ready            ), //o
    .io_inputs_0_payload_xTemp       (adderPipeline_loopback_payload_xTemp         ), //i
    .io_inputs_0_payload_yTemp       (adderPipeline_loopback_payload_yTemp         ), //i
    .io_inputs_0_payload_yAddM       (adderPipeline_loopback_payload_yAddM         ), //i
    .io_inputs_0_payload_adderRes    (adderPipeline_loopback_payload_adderRes      ), //i
    .io_inputs_0_payload_counter     (adderPipeline_loopback_payload_counter       ), //i
    .io_inputs_1_valid               (io_input_translated_output_valid             ), //i
    .io_inputs_1_ready               (streamArbiter_1_io_inputs_1_ready            ), //o
    .io_inputs_1_payload_xTemp       (io_input_translated_output_payload_xTemp     ), //i
    .io_inputs_1_payload_yTemp       (io_input_translated_output_payload_yTemp     ), //i
    .io_inputs_1_payload_yAddM       (io_input_translated_output_payload_yAddM     ), //i
    .io_inputs_1_payload_adderRes    (io_input_translated_output_payload_adderRes  ), //i
    .io_inputs_1_payload_counter     (io_input_translated_output_payload_counter   ), //i
    .io_output_valid                 (streamArbiter_1_io_output_valid              ), //o
    .io_output_ready                 (adderPipeline_tempRes_0_ready                ), //i
    .io_output_payload_xTemp         (streamArbiter_1_io_output_payload_xTemp      ), //o
    .io_output_payload_yTemp         (streamArbiter_1_io_output_payload_yTemp      ), //o
    .io_output_payload_yAddM         (streamArbiter_1_io_output_payload_yAddM      ), //o
    .io_output_payload_adderRes      (streamArbiter_1_io_output_payload_adderRes   ), //o
    .io_output_payload_counter       (streamArbiter_1_io_output_payload_counter    ), //o
    .io_chosen                       (streamArbiter_1_io_chosen                    ), //o
    .io_chosenOH                     (streamArbiter_1_io_chosenOH                  ), //o
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
  StreamDemux streamDemux_1 (
    .io_select                        (streamDemux_1_io_select                      ), //i
    .io_input_valid                   (adderPipeline_tempRes_3_valid                ), //i
    .io_input_ready                   (streamDemux_1_io_input_ready                 ), //o
    .io_input_payload_xTemp           (adderPipeline_tempRes_3_payload_xTemp        ), //i
    .io_input_payload_yTemp           (adderPipeline_tempRes_3_payload_yTemp        ), //i
    .io_input_payload_yAddM           (adderPipeline_tempRes_3_payload_yAddM        ), //i
    .io_input_payload_adderRes        (adderPipeline_tempRes_3_payload_adderRes     ), //i
    .io_input_payload_counter         (adderPipeline_tempRes_3_payload_counter      ), //i
    .io_outputs_0_valid               (streamDemux_1_io_outputs_0_valid             ), //o
    .io_outputs_0_ready               (streamDemux_1_io_outputs_0_ready             ), //i
    .io_outputs_0_payload_xTemp       (streamDemux_1_io_outputs_0_payload_xTemp     ), //o
    .io_outputs_0_payload_yTemp       (streamDemux_1_io_outputs_0_payload_yTemp     ), //o
    .io_outputs_0_payload_yAddM       (streamDemux_1_io_outputs_0_payload_yAddM     ), //o
    .io_outputs_0_payload_adderRes    (streamDemux_1_io_outputs_0_payload_adderRes  ), //o
    .io_outputs_0_payload_counter     (streamDemux_1_io_outputs_0_payload_counter   ), //o
    .io_outputs_1_valid               (streamDemux_1_io_outputs_1_valid             ), //o
    .io_outputs_1_ready               (resCombination_output_ready                  ), //i
    .io_outputs_1_payload_xTemp       (streamDemux_1_io_outputs_1_payload_xTemp     ), //o
    .io_outputs_1_payload_yTemp       (streamDemux_1_io_outputs_1_payload_yTemp     ), //o
    .io_outputs_1_payload_yAddM       (streamDemux_1_io_outputs_1_payload_yAddM     ), //o
    .io_outputs_1_payload_adderRes    (streamDemux_1_io_outputs_1_payload_adderRes  ), //o
    .io_outputs_1_payload_counter     (streamDemux_1_io_outputs_1_payload_counter   )  //o
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
  assign adderPipeline_loopback_ready = streamArbiter_1_io_inputs_0_ready;
  assign io_input_translated_output_ready = streamArbiter_1_io_inputs_1_ready;
  assign adderPipeline_tempRes_0_valid = streamArbiter_1_io_output_valid;
  assign adderPipeline_tempRes_0_payload_xTemp = streamArbiter_1_io_output_payload_xTemp;
  assign adderPipeline_tempRes_0_payload_yTemp = streamArbiter_1_io_output_payload_yTemp;
  assign adderPipeline_tempRes_0_payload_yAddM = streamArbiter_1_io_output_payload_yAddM;
  assign adderPipeline_tempRes_0_payload_adderRes = streamArbiter_1_io_output_payload_adderRes;
  assign adderPipeline_tempRes_0_payload_counter = streamArbiter_1_io_output_payload_counter;
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
  assign adderPipeline_tempRes_3_ready = streamDemux_1_io_input_ready;
  assign streamDemux_1_io_select = adderPipeline_select;
  assign streamDemux_1_io_outputs_0_ready = (! streamDemux_1_io_outputs_0_rValid);
  assign streamDemux_1_io_outputs_0_s2mPipe_valid = (streamDemux_1_io_outputs_0_valid || streamDemux_1_io_outputs_0_rValid);
  assign streamDemux_1_io_outputs_0_s2mPipe_payload_xTemp = (streamDemux_1_io_outputs_0_rValid ? streamDemux_1_io_outputs_0_rData_xTemp : streamDemux_1_io_outputs_0_payload_xTemp);
  assign streamDemux_1_io_outputs_0_s2mPipe_payload_yTemp = (streamDemux_1_io_outputs_0_rValid ? streamDemux_1_io_outputs_0_rData_yTemp : streamDemux_1_io_outputs_0_payload_yTemp);
  assign streamDemux_1_io_outputs_0_s2mPipe_payload_yAddM = (streamDemux_1_io_outputs_0_rValid ? streamDemux_1_io_outputs_0_rData_yAddM : streamDemux_1_io_outputs_0_payload_yAddM);
  assign streamDemux_1_io_outputs_0_s2mPipe_payload_adderRes = (streamDemux_1_io_outputs_0_rValid ? streamDemux_1_io_outputs_0_rData_adderRes : streamDemux_1_io_outputs_0_payload_adderRes);
  assign streamDemux_1_io_outputs_0_s2mPipe_payload_counter = (streamDemux_1_io_outputs_0_rValid ? streamDemux_1_io_outputs_0_rData_counter : streamDemux_1_io_outputs_0_payload_counter);
  assign adderPipeline_loopback_valid = streamDemux_1_io_outputs_0_s2mPipe_valid;
  assign streamDemux_1_io_outputs_0_s2mPipe_ready = adderPipeline_loopback_ready;
  assign adderPipeline_loopback_payload_xTemp = streamDemux_1_io_outputs_0_s2mPipe_payload_xTemp;
  assign adderPipeline_loopback_payload_yTemp = streamDemux_1_io_outputs_0_s2mPipe_payload_yTemp;
  assign adderPipeline_loopback_payload_yAddM = streamDemux_1_io_outputs_0_s2mPipe_payload_yAddM;
  assign adderPipeline_loopback_payload_adderRes = streamDemux_1_io_outputs_0_s2mPipe_payload_adderRes;
  assign adderPipeline_loopback_payload_counter = streamDemux_1_io_outputs_0_s2mPipe_payload_counter;
  assign resCombination_tempRes = ({1'b0,_zz_resCombination_tempRes} + {1'b0,255'h0c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff});
  assign when_MontMultiplierPiped_l236 = (resCombination_tempRes[255] || streamDemux_1_io_outputs_1_payload_adderRes[255]);
  always @(*) begin
    if(when_MontMultiplierPiped_l236) begin
      resCombination_output_payload_res = resCombination_tempRes[254:0];
    end else begin
      resCombination_output_payload_res = streamDemux_1_io_outputs_1_payload_adderRes[254:0];
    end
  end

  assign resCombination_output_valid = streamDemux_1_io_outputs_1_valid;
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
      streamDemux_1_io_outputs_0_rValid <= 1'b0;
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
      if(streamDemux_1_io_outputs_0_valid) begin
        streamDemux_1_io_outputs_0_rValid <= 1'b1;
      end
      if(streamDemux_1_io_outputs_0_s2mPipe_ready) begin
        streamDemux_1_io_outputs_0_rValid <= 1'b0;
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
    if(streamDemux_1_io_outputs_0_ready) begin
      streamDemux_1_io_outputs_0_rData_xTemp <= streamDemux_1_io_outputs_0_payload_xTemp;
      streamDemux_1_io_outputs_0_rData_yTemp <= streamDemux_1_io_outputs_0_payload_yTemp;
      streamDemux_1_io_outputs_0_rData_yAddM <= streamDemux_1_io_outputs_0_payload_yAddM;
      streamDemux_1_io_outputs_0_rData_adderRes <= streamDemux_1_io_outputs_0_payload_adderRes;
      streamDemux_1_io_outputs_0_rData_counter <= streamDemux_1_io_outputs_0_payload_counter;
    end
    if(resCombination_output_ready) begin
      resCombination_output_rData_res <= resCombination_output_payload_res;
    end
  end


endmodule

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
