// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : SBox5



module SBox5 (
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
  output     [3:0]    io_output_payload_state_index,
  output     [3:0]    io_output_payload_state_size,
  output     [3:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element,
  input               reset,
  input               clk
);
  wire                mul_stage0_multiplier0_op_ready_o;
  wire                mul_stage0_multiplier0_res_valid_o;
  wire       [254:0]  mul_stage0_multiplier0_res_o;
  wire                mul_stage1_multiplier1_op_ready_o;
  wire                mul_stage1_multiplier1_res_valid_o;
  wire       [254:0]  mul_stage1_multiplier1_res_o;
  wire                mul_stage2_multiplier2_op_ready_o;
  wire                mul_stage2_multiplier2_res_valid_o;
  wire       [254:0]  mul_stage2_multiplier2_res_o;
  reg        [6:0]    mul_stage0_mulContext_round_index;
  reg        [3:0]    mul_stage0_mulContext_state_index;
  reg        [3:0]    mul_stage0_mulContext_state_size;
  reg        [3:0]    mul_stage0_mulContext_state_id;
  reg        [254:0]  mul_stage0_mulContext_initial_state;
  wire                mul_stage0_output_valid;
  reg                 mul_stage0_output_ready;
  wire       [6:0]    mul_stage0_output_payload_round_index;
  wire       [3:0]    mul_stage0_output_payload_state_index;
  wire       [3:0]    mul_stage0_output_payload_state_size;
  wire       [3:0]    mul_stage0_output_payload_state_id;
  wire       [254:0]  mul_stage0_output_payload_state_element;
  wire       [254:0]  mul_stage0_output_payload_initial_state;
  wire                mul_stage0_multiplier0_cmd_fire;
  wire                mul_stage0_output_input_valid;
  wire                mul_stage0_output_input_ready;
  wire       [6:0]    mul_stage0_output_input_payload_round_index;
  wire       [3:0]    mul_stage0_output_input_payload_state_index;
  wire       [3:0]    mul_stage0_output_input_payload_state_size;
  wire       [3:0]    mul_stage0_output_input_payload_state_id;
  wire       [254:0]  mul_stage0_output_input_payload_state_element;
  wire       [254:0]  mul_stage0_output_input_payload_initial_state;
  reg                 mul_stage0_output_rValid;
  reg        [6:0]    mul_stage0_output_rData_round_index;
  reg        [3:0]    mul_stage0_output_rData_state_index;
  reg        [3:0]    mul_stage0_output_rData_state_size;
  reg        [3:0]    mul_stage0_output_rData_state_id;
  reg        [254:0]  mul_stage0_output_rData_state_element;
  reg        [254:0]  mul_stage0_output_rData_initial_state;
  wire                when_Stream_l342;
  reg        [6:0]    mul_stage1_mulContext_round_index;
  reg        [3:0]    mul_stage1_mulContext_state_index;
  reg        [3:0]    mul_stage1_mulContext_state_size;
  reg        [3:0]    mul_stage1_mulContext_state_id;
  reg        [254:0]  mul_stage1_mulContext_initial_state;
  wire                mul_stage1_output_valid;
  reg                 mul_stage1_output_ready;
  wire       [6:0]    mul_stage1_output_payload_round_index;
  wire       [3:0]    mul_stage1_output_payload_state_index;
  wire       [3:0]    mul_stage1_output_payload_state_size;
  wire       [3:0]    mul_stage1_output_payload_state_id;
  wire       [254:0]  mul_stage1_output_payload_state_element;
  wire       [254:0]  mul_stage1_output_payload_initial_state;
  wire                mul_stage1_multiplier1_cmd_fire;
  wire                mul_stage1_output_input_valid;
  wire                mul_stage1_output_input_ready;
  wire       [6:0]    mul_stage1_output_input_payload_round_index;
  wire       [3:0]    mul_stage1_output_input_payload_state_index;
  wire       [3:0]    mul_stage1_output_input_payload_state_size;
  wire       [3:0]    mul_stage1_output_input_payload_state_id;
  wire       [254:0]  mul_stage1_output_input_payload_state_element;
  wire       [254:0]  mul_stage1_output_input_payload_initial_state;
  reg                 mul_stage1_output_rValid;
  reg        [6:0]    mul_stage1_output_rData_round_index;
  reg        [3:0]    mul_stage1_output_rData_state_index;
  reg        [3:0]    mul_stage1_output_rData_state_size;
  reg        [3:0]    mul_stage1_output_rData_state_id;
  reg        [254:0]  mul_stage1_output_rData_state_element;
  reg        [254:0]  mul_stage1_output_rData_initial_state;
  wire                when_Stream_l342_1;
  reg        [6:0]    mul_stage2_mulContext_round_index;
  reg        [3:0]    mul_stage2_mulContext_state_index;
  reg        [3:0]    mul_stage2_mulContext_state_size;
  reg        [3:0]    mul_stage2_mulContext_state_id;
  reg        [254:0]  mul_stage2_mulContext_initial_state;
  wire                mul_stage2_output_valid;
  reg                 mul_stage2_output_ready;
  wire       [6:0]    mul_stage2_output_payload_round_index;
  wire       [3:0]    mul_stage2_output_payload_state_index;
  wire       [3:0]    mul_stage2_output_payload_state_size;
  wire       [3:0]    mul_stage2_output_payload_state_id;
  wire       [254:0]  mul_stage2_output_payload_state_element;
  wire                mul_stage2_multiplier2_cmd_fire;
  reg                 mul_stage2_is_partial_round;
  wire                mul_stage2_is_pass_sbox5;
  wire                mul_stage2_output_m2sPipe_valid;
  wire                mul_stage2_output_m2sPipe_ready;
  wire       [6:0]    mul_stage2_output_m2sPipe_payload_round_index;
  wire       [3:0]    mul_stage2_output_m2sPipe_payload_state_index;
  wire       [3:0]    mul_stage2_output_m2sPipe_payload_state_size;
  wire       [3:0]    mul_stage2_output_m2sPipe_payload_state_id;
  wire       [254:0]  mul_stage2_output_m2sPipe_payload_state_element;
  reg                 mul_stage2_output_rValid;
  reg        [6:0]    mul_stage2_output_rData_round_index;
  reg        [3:0]    mul_stage2_output_rData_state_index;
  reg        [3:0]    mul_stage2_output_rData_state_size;
  reg        [3:0]    mul_stage2_output_rData_state_id;
  reg        [254:0]  mul_stage2_output_rData_state_element;
  wire                when_Stream_l342_2;

  ModMultiplier mul_stage0_multiplier0 (
    .clk            (clk                                 ), //i
    .rst            (reset                               ), //i
    .op_valid_i     (io_input_valid                      ), //i
    .op_ready_o     (mul_stage0_multiplier0_op_ready_o   ), //o
    .op1_i          (io_input_payload_state_element      ), //i
    .op2_i          (io_input_payload_state_element      ), //i
    .res_valid_o    (mul_stage0_multiplier0_res_valid_o  ), //o
    .res_ready_i    (mul_stage0_output_ready             ), //i
    .res_o          (mul_stage0_multiplier0_res_o        )  //o
  );
  ModMultiplier mul_stage1_multiplier1 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (mul_stage0_output_input_valid                  ), //i
    .op_ready_o     (mul_stage1_multiplier1_op_ready_o              ), //o
    .op1_i          (mul_stage0_output_input_payload_state_element  ), //i
    .op2_i          (mul_stage0_output_input_payload_state_element  ), //i
    .res_valid_o    (mul_stage1_multiplier1_res_valid_o             ), //o
    .res_ready_i    (mul_stage1_output_ready                        ), //i
    .res_o          (mul_stage1_multiplier1_res_o                   )  //o
  );
  ModMultiplier mul_stage2_multiplier2 (
    .clk            (clk                                            ), //i
    .rst            (reset                                          ), //i
    .op_valid_i     (mul_stage1_output_input_valid                  ), //i
    .op_ready_o     (mul_stage2_multiplier2_op_ready_o              ), //o
    .op1_i          (mul_stage1_output_input_payload_initial_state  ), //i
    .op2_i          (mul_stage1_output_input_payload_state_element  ), //i
    .res_valid_o    (mul_stage2_multiplier2_res_valid_o             ), //o
    .res_ready_i    (mul_stage2_output_ready                        ), //i
    .res_o          (mul_stage2_multiplier2_res_o                   )  //o
  );
  assign io_input_ready = mul_stage0_multiplier0_op_ready_o;
  assign mul_stage0_multiplier0_cmd_fire = (io_input_valid && mul_stage0_multiplier0_op_ready_o);
  assign mul_stage0_output_valid = mul_stage0_multiplier0_res_valid_o;
  assign mul_stage0_output_payload_round_index = mul_stage0_mulContext_round_index;
  assign mul_stage0_output_payload_state_index = mul_stage0_mulContext_state_index;
  assign mul_stage0_output_payload_state_size = mul_stage0_mulContext_state_size;
  assign mul_stage0_output_payload_state_id = mul_stage0_mulContext_state_id;
  assign mul_stage0_output_payload_initial_state = mul_stage0_mulContext_initial_state;
  assign mul_stage0_output_payload_state_element = mul_stage0_multiplier0_res_o;
  always @(*) begin
    mul_stage0_output_ready = mul_stage0_output_input_ready;
    if(when_Stream_l342) begin
      mul_stage0_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! mul_stage0_output_input_valid);
  assign mul_stage0_output_input_valid = mul_stage0_output_rValid;
  assign mul_stage0_output_input_payload_round_index = mul_stage0_output_rData_round_index;
  assign mul_stage0_output_input_payload_state_index = mul_stage0_output_rData_state_index;
  assign mul_stage0_output_input_payload_state_size = mul_stage0_output_rData_state_size;
  assign mul_stage0_output_input_payload_state_id = mul_stage0_output_rData_state_id;
  assign mul_stage0_output_input_payload_state_element = mul_stage0_output_rData_state_element;
  assign mul_stage0_output_input_payload_initial_state = mul_stage0_output_rData_initial_state;
  assign mul_stage0_output_input_ready = mul_stage1_multiplier1_op_ready_o;
  assign mul_stage1_multiplier1_cmd_fire = (mul_stage0_output_input_valid && mul_stage1_multiplier1_op_ready_o);
  assign mul_stage1_output_valid = mul_stage1_multiplier1_res_valid_o;
  assign mul_stage1_output_payload_round_index = mul_stage1_mulContext_round_index;
  assign mul_stage1_output_payload_state_index = mul_stage1_mulContext_state_index;
  assign mul_stage1_output_payload_state_size = mul_stage1_mulContext_state_size;
  assign mul_stage1_output_payload_state_id = mul_stage1_mulContext_state_id;
  assign mul_stage1_output_payload_initial_state = mul_stage1_mulContext_initial_state;
  assign mul_stage1_output_payload_state_element = mul_stage1_multiplier1_res_o;
  always @(*) begin
    mul_stage1_output_ready = mul_stage1_output_input_ready;
    if(when_Stream_l342_1) begin
      mul_stage1_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! mul_stage1_output_input_valid);
  assign mul_stage1_output_input_valid = mul_stage1_output_rValid;
  assign mul_stage1_output_input_payload_round_index = mul_stage1_output_rData_round_index;
  assign mul_stage1_output_input_payload_state_index = mul_stage1_output_rData_state_index;
  assign mul_stage1_output_input_payload_state_size = mul_stage1_output_rData_state_size;
  assign mul_stage1_output_input_payload_state_id = mul_stage1_output_rData_state_id;
  assign mul_stage1_output_input_payload_state_element = mul_stage1_output_rData_state_element;
  assign mul_stage1_output_input_payload_initial_state = mul_stage1_output_rData_initial_state;
  assign mul_stage1_output_input_ready = mul_stage2_multiplier2_op_ready_o;
  assign mul_stage2_multiplier2_cmd_fire = (mul_stage1_output_input_valid && mul_stage2_multiplier2_op_ready_o);
  assign mul_stage2_output_valid = mul_stage2_multiplier2_res_valid_o;
  assign mul_stage2_output_payload_round_index = mul_stage2_mulContext_round_index;
  assign mul_stage2_output_payload_state_index = mul_stage2_mulContext_state_index;
  assign mul_stage2_output_payload_state_size = mul_stage2_mulContext_state_size;
  assign mul_stage2_output_payload_state_id = mul_stage2_mulContext_state_id;
  always @(*) begin
    case(mul_stage2_mulContext_state_size)
      4'b0011 : begin
        mul_stage2_is_partial_round = ((7'h04 <= mul_stage2_mulContext_round_index) && (mul_stage2_mulContext_round_index < 7'h3b));
      end
      4'b0101 : begin
        mul_stage2_is_partial_round = ((7'h04 <= mul_stage2_mulContext_round_index) && (mul_stage2_mulContext_round_index < 7'h3c));
      end
      4'b1001 : begin
        mul_stage2_is_partial_round = ((7'h04 <= mul_stage2_mulContext_round_index) && (mul_stage2_mulContext_round_index < 7'h3d));
      end
      4'b1100 : begin
        mul_stage2_is_partial_round = ((7'h04 <= mul_stage2_mulContext_round_index) && (mul_stage2_mulContext_round_index < 7'h3d));
      end
      default : begin
        mul_stage2_is_partial_round = 1'b0;
      end
    endcase
  end

  assign mul_stage2_is_pass_sbox5 = (mul_stage2_is_partial_round && (mul_stage2_mulContext_state_index != 4'b0000));
  assign mul_stage2_output_payload_state_element = (mul_stage2_is_pass_sbox5 ? mul_stage2_mulContext_initial_state : mul_stage2_multiplier2_res_o);
  always @(*) begin
    mul_stage2_output_ready = mul_stage2_output_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      mul_stage2_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! mul_stage2_output_m2sPipe_valid);
  assign mul_stage2_output_m2sPipe_valid = mul_stage2_output_rValid;
  assign mul_stage2_output_m2sPipe_payload_round_index = mul_stage2_output_rData_round_index;
  assign mul_stage2_output_m2sPipe_payload_state_index = mul_stage2_output_rData_state_index;
  assign mul_stage2_output_m2sPipe_payload_state_size = mul_stage2_output_rData_state_size;
  assign mul_stage2_output_m2sPipe_payload_state_id = mul_stage2_output_rData_state_id;
  assign mul_stage2_output_m2sPipe_payload_state_element = mul_stage2_output_rData_state_element;
  assign io_output_valid = mul_stage2_output_m2sPipe_valid;
  assign mul_stage2_output_m2sPipe_ready = io_output_ready;
  assign io_output_payload_round_index = mul_stage2_output_m2sPipe_payload_round_index;
  assign io_output_payload_state_index = mul_stage2_output_m2sPipe_payload_state_index;
  assign io_output_payload_state_size = mul_stage2_output_m2sPipe_payload_state_size;
  assign io_output_payload_state_id = mul_stage2_output_m2sPipe_payload_state_id;
  assign io_output_payload_state_element = mul_stage2_output_m2sPipe_payload_state_element;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mul_stage0_mulContext_state_index <= 4'b0000;
      mul_stage0_mulContext_round_index <= 7'h0;
      mul_stage0_mulContext_state_size <= 4'b0000;
      mul_stage0_mulContext_initial_state <= 255'h0;
      mul_stage0_output_rValid <= 1'b0;
      mul_stage1_mulContext_state_index <= 4'b0000;
      mul_stage1_mulContext_round_index <= 7'h0;
      mul_stage1_mulContext_state_size <= 4'b0000;
      mul_stage1_mulContext_initial_state <= 255'h0;
      mul_stage1_output_rValid <= 1'b0;
      mul_stage2_mulContext_state_index <= 4'b0000;
      mul_stage2_mulContext_round_index <= 7'h0;
      mul_stage2_mulContext_state_size <= 4'b0000;
      mul_stage2_mulContext_initial_state <= 255'h0;
      mul_stage2_output_rValid <= 1'b0;
    end else begin
      if(mul_stage0_multiplier0_cmd_fire) begin
        mul_stage0_mulContext_round_index <= io_input_payload_round_index;
        mul_stage0_mulContext_state_index <= io_input_payload_state_index;
        mul_stage0_mulContext_state_size <= io_input_payload_state_size;
        mul_stage0_mulContext_initial_state <= io_input_payload_state_element;
      end
      if(mul_stage0_output_ready) begin
        mul_stage0_output_rValid <= mul_stage0_output_valid;
      end
      if(mul_stage1_multiplier1_cmd_fire) begin
        mul_stage1_mulContext_round_index <= mul_stage0_output_input_payload_round_index;
        mul_stage1_mulContext_state_index <= mul_stage0_output_input_payload_state_index;
        mul_stage1_mulContext_state_size <= mul_stage0_output_input_payload_state_size;
        mul_stage1_mulContext_initial_state <= mul_stage0_output_input_payload_initial_state;
      end
      if(mul_stage1_output_ready) begin
        mul_stage1_output_rValid <= mul_stage1_output_valid;
      end
      if(mul_stage2_multiplier2_cmd_fire) begin
        mul_stage2_mulContext_round_index <= mul_stage1_output_input_payload_round_index;
        mul_stage2_mulContext_state_index <= mul_stage1_output_input_payload_state_index;
        mul_stage2_mulContext_state_size <= mul_stage1_output_input_payload_state_size;
        mul_stage2_mulContext_initial_state <= mul_stage1_output_input_payload_initial_state;
      end
      if(mul_stage2_output_ready) begin
        mul_stage2_output_rValid <= mul_stage2_output_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(mul_stage0_multiplier0_cmd_fire) begin
      mul_stage0_mulContext_state_id <= io_input_payload_state_id;
    end
    if(mul_stage0_output_ready) begin
      mul_stage0_output_rData_round_index <= mul_stage0_output_payload_round_index;
      mul_stage0_output_rData_state_index <= mul_stage0_output_payload_state_index;
      mul_stage0_output_rData_state_size <= mul_stage0_output_payload_state_size;
      mul_stage0_output_rData_state_id <= mul_stage0_output_payload_state_id;
      mul_stage0_output_rData_state_element <= mul_stage0_output_payload_state_element;
      mul_stage0_output_rData_initial_state <= mul_stage0_output_payload_initial_state;
    end
    if(mul_stage1_multiplier1_cmd_fire) begin
      mul_stage1_mulContext_state_id <= mul_stage0_output_input_payload_state_id;
    end
    if(mul_stage1_output_ready) begin
      mul_stage1_output_rData_round_index <= mul_stage1_output_payload_round_index;
      mul_stage1_output_rData_state_index <= mul_stage1_output_payload_state_index;
      mul_stage1_output_rData_state_size <= mul_stage1_output_payload_state_size;
      mul_stage1_output_rData_state_id <= mul_stage1_output_payload_state_id;
      mul_stage1_output_rData_state_element <= mul_stage1_output_payload_state_element;
      mul_stage1_output_rData_initial_state <= mul_stage1_output_payload_initial_state;
    end
    if(mul_stage2_multiplier2_cmd_fire) begin
      mul_stage2_mulContext_state_id <= mul_stage1_output_input_payload_state_id;
    end
    if(mul_stage2_output_ready) begin
      mul_stage2_output_rData_round_index <= mul_stage2_output_payload_round_index;
      mul_stage2_output_rData_state_index <= mul_stage2_output_payload_state_index;
      mul_stage2_output_rData_state_size <= mul_stage2_output_payload_state_size;
      mul_stage2_output_rData_state_id <= mul_stage2_output_payload_state_id;
      mul_stage2_output_rData_state_element <= mul_stage2_output_payload_state_element;
    end
  end


endmodule
