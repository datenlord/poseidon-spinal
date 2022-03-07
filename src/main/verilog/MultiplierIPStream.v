// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : MultiplierIPStream
// Git hash  : edd9aa84312d82dcc1302c088dec35f306638af7



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
  wire       [127:0]  simMultiplierIP_1_io_outputP;
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

  SimMultiplierIP simMultiplierIP_1 (
    .io_enable     (io_input_ready                ), //i
    .io_inputA     (io_input_payload_op1          ), //i
    .io_inputB     (io_input_payload_op2          ), //i
    .io_outputP    (simMultiplierIP_1_io_outputP  ), //o
    .clk           (clk                           ), //i
    .reset         (reset                         )  //i
  );
  assign validPipe_0 = io_input_valid;
  assign io_output_valid = validPipe_18;
  assign io_input_ready = ((! io_output_valid) || io_output_ready);
  assign io_output_payload_res = simMultiplierIP_1_io_outputP;
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
