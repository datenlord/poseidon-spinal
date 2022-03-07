// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : MontgomeryMult
// Git hash  : edd9aa84312d82dcc1302c088dec35f306638af7



module MontgomeryMult (
  input               io_input_valid,
  output              io_input_ready,
  input      [254:0]  io_input_payload_op1,
  input      [254:0]  io_input_payload_op2,
  output              io_output_valid,
  input               io_output_ready,
  output     [254:0]  io_output_payload_res,
  input               reset,
  input               clk
);
  wire                multiplier_3_io_input_ready;
  wire                multiplier_3_io_output_valid;
  wire       [511:0]  multiplier_3_io_output_payload_res;
  wire                multiplier_3_io_output_fork_io_input_ready;
  wire                multiplier_3_io_output_fork_io_outputs_0_valid;
  wire       [511:0]  multiplier_3_io_output_fork_io_outputs_0_payload_res;
  wire                multiplier_3_io_output_fork_io_outputs_1_valid;
  wire       [511:0]  multiplier_3_io_output_fork_io_outputs_1_payload_res;
  wire                multiplier_3_io_output_fork_io_outputs_1_fifo_io_push_ready;
  wire                multiplier_3_io_output_fork_io_outputs_1_fifo_io_pop_valid;
  wire       [511:0]  multiplier_3_io_output_fork_io_outputs_1_fifo_io_pop_payload_res;
  wire       [5:0]    multiplier_3_io_output_fork_io_outputs_1_fifo_io_occupancy;
  wire       [5:0]    multiplier_3_io_output_fork_io_outputs_1_fifo_io_availability;
  wire                multiplier_4_io_input_ready;
  wire                multiplier_4_io_output_valid;
  wire       [511:0]  multiplier_4_io_output_payload_res;
  wire                multiplier_5_io_input_ready;
  wire                multiplier_5_io_output_valid;
  wire       [511:0]  multiplier_5_io_output_payload_res;
  wire       [254:0]  _zz_mulInput1_payload_op1;
  wire       [254:0]  _zz_mulInput2_payload_op1;
  wire       [511:0]  _zz__zz_adderOutput0_payload_res;
  wire       [255:0]  _zz_adderOutput0_translated_payload_res_1;
  wire                mulInput0_valid;
  wire                mulInput0_ready;
  wire       [255:0]  mulInput0_payload_op1;
  wire       [255:0]  mulInput0_payload_op2;
  wire                mulInput1_valid;
  wire                mulInput1_ready;
  wire       [255:0]  mulInput1_payload_op1;
  wire       [255:0]  mulInput1_payload_op2;
  wire                mulInput2_valid;
  wire                mulInput2_ready;
  wire       [255:0]  mulInput2_payload_op1;
  wire       [255:0]  mulInput2_payload_op2;
  wire                _zz_adderOutput0_valid;
  wire                _zz_io_pop_ready;
  reg                 _zz_io_pop_ready_1;
  wire                adderOutput0_valid;
  wire                adderOutput0_ready;
  wire       [255:0]  adderOutput0_payload_res;
  reg                 _zz_adderOutput0_valid_1;
  reg        [255:0]  _zz_adderOutput0_payload_res;
  wire                when_Stream_l342;
  wire       [255:0]  _zz_adderOutput0_translated_payload_res;
  wire                adderOutput0_translated_valid;
  reg                 adderOutput0_translated_ready;
  wire       [254:0]  adderOutput0_translated_payload_res;
  wire                adderOutput0_translated_m2sPipe_valid;
  wire                adderOutput0_translated_m2sPipe_ready;
  wire       [254:0]  adderOutput0_translated_m2sPipe_payload_res;
  reg                 adderOutput0_translated_rValid;
  reg        [254:0]  adderOutput0_translated_rData_res;
  wire                when_Stream_l342_1;

  assign _zz_mulInput1_payload_op1 = multiplier_3_io_output_fork_io_outputs_0_payload_res[254 : 0];
  assign _zz_mulInput2_payload_op1 = multiplier_4_io_output_payload_res[254 : 0];
  assign _zz__zz_adderOutput0_payload_res = (multiplier_5_io_output_payload_res + multiplier_3_io_output_fork_io_outputs_1_fifo_io_pop_payload_res);
  assign _zz_adderOutput0_translated_payload_res_1 = ((_zz_adderOutput0_translated_payload_res[255] || adderOutput0_payload_res[255]) ? _zz_adderOutput0_translated_payload_res : adderOutput0_payload_res);
  Multiplier multiplier_3 (
    .io_input_valid           (mulInput0_valid                             ), //i
    .io_input_ready           (multiplier_3_io_input_ready                 ), //o
    .io_input_payload_op1     (mulInput0_payload_op1                       ), //i
    .io_input_payload_op2     (mulInput0_payload_op2                       ), //i
    .io_output_valid          (multiplier_3_io_output_valid                ), //o
    .io_output_ready          (multiplier_3_io_output_fork_io_input_ready  ), //i
    .io_output_payload_res    (multiplier_3_io_output_payload_res          ), //o
    .reset                    (reset                                       ), //i
    .clk                      (clk                                         )  //i
  );
  StreamFork_15 multiplier_3_io_output_fork (
    .io_input_valid              (multiplier_3_io_output_valid                                 ), //i
    .io_input_ready              (multiplier_3_io_output_fork_io_input_ready                   ), //o
    .io_input_payload_res        (multiplier_3_io_output_payload_res                           ), //i
    .io_outputs_0_valid          (multiplier_3_io_output_fork_io_outputs_0_valid               ), //o
    .io_outputs_0_ready          (mulInput1_ready                                              ), //i
    .io_outputs_0_payload_res    (multiplier_3_io_output_fork_io_outputs_0_payload_res         ), //o
    .io_outputs_1_valid          (multiplier_3_io_output_fork_io_outputs_1_valid               ), //o
    .io_outputs_1_ready          (multiplier_3_io_output_fork_io_outputs_1_fifo_io_push_ready  ), //i
    .io_outputs_1_payload_res    (multiplier_3_io_output_fork_io_outputs_1_payload_res         )  //o
  );
  StreamFifo multiplier_3_io_output_fork_io_outputs_1_fifo (
    .io_push_valid          (multiplier_3_io_output_fork_io_outputs_1_valid                    ), //i
    .io_push_ready          (multiplier_3_io_output_fork_io_outputs_1_fifo_io_push_ready       ), //o
    .io_push_payload_res    (multiplier_3_io_output_fork_io_outputs_1_payload_res              ), //i
    .io_pop_valid           (multiplier_3_io_output_fork_io_outputs_1_fifo_io_pop_valid        ), //o
    .io_pop_ready           (_zz_io_pop_ready                                                  ), //i
    .io_pop_payload_res     (multiplier_3_io_output_fork_io_outputs_1_fifo_io_pop_payload_res  ), //o
    .io_flush               (1'b0                                                              ), //i
    .io_occupancy           (multiplier_3_io_output_fork_io_outputs_1_fifo_io_occupancy        ), //o
    .io_availability        (multiplier_3_io_output_fork_io_outputs_1_fifo_io_availability     ), //o
    .clk                    (clk                                                               ), //i
    .reset                  (reset                                                             )  //i
  );
  Multiplier multiplier_4 (
    .io_input_valid           (mulInput1_valid                     ), //i
    .io_input_ready           (multiplier_4_io_input_ready         ), //o
    .io_input_payload_op1     (mulInput1_payload_op1               ), //i
    .io_input_payload_op2     (mulInput1_payload_op2               ), //i
    .io_output_valid          (multiplier_4_io_output_valid        ), //o
    .io_output_ready          (mulInput2_ready                     ), //i
    .io_output_payload_res    (multiplier_4_io_output_payload_res  ), //o
    .reset                    (reset                               ), //i
    .clk                      (clk                                 )  //i
  );
  Multiplier multiplier_5 (
    .io_input_valid           (mulInput2_valid                     ), //i
    .io_input_ready           (multiplier_5_io_input_ready         ), //o
    .io_input_payload_op1     (mulInput2_payload_op1               ), //i
    .io_input_payload_op2     (mulInput2_payload_op2               ), //i
    .io_output_valid          (multiplier_5_io_output_valid        ), //o
    .io_output_ready          (_zz_io_pop_ready                    ), //i
    .io_output_payload_res    (multiplier_5_io_output_payload_res  ), //o
    .reset                    (reset                               ), //i
    .clk                      (clk                                 )  //i
  );
  assign mulInput0_valid = io_input_valid;
  assign io_input_ready = mulInput0_ready;
  assign mulInput0_payload_op1 = {1'd0, io_input_payload_op1};
  assign mulInput0_payload_op2 = {1'd0, io_input_payload_op2};
  assign mulInput0_ready = multiplier_3_io_input_ready;
  assign mulInput1_valid = multiplier_3_io_output_fork_io_outputs_0_valid;
  assign mulInput1_payload_op1 = {1'd0, _zz_mulInput1_payload_op1};
  assign mulInput1_payload_op2 = 256'h3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff;
  assign mulInput1_ready = multiplier_4_io_input_ready;
  assign mulInput2_valid = multiplier_4_io_output_valid;
  assign mulInput2_payload_op1 = {1'd0, _zz_mulInput2_payload_op1};
  assign mulInput2_payload_op2 = 256'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001;
  assign mulInput2_ready = multiplier_5_io_input_ready;
  assign _zz_io_pop_ready = (_zz_adderOutput0_valid && _zz_io_pop_ready_1);
  assign _zz_adderOutput0_valid = (multiplier_5_io_output_valid && multiplier_3_io_output_fork_io_outputs_1_fifo_io_pop_valid);
  always @(*) begin
    _zz_io_pop_ready_1 = adderOutput0_ready;
    if(when_Stream_l342) begin
      _zz_io_pop_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l342 = (! adderOutput0_valid);
  assign adderOutput0_valid = _zz_adderOutput0_valid_1;
  assign adderOutput0_payload_res = _zz_adderOutput0_payload_res;
  assign _zz_adderOutput0_translated_payload_res = ({1'b0,adderOutput0_payload_res[254 : 0]} + {1'b0,255'h0c1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff});
  assign adderOutput0_translated_valid = adderOutput0_valid;
  assign adderOutput0_ready = adderOutput0_translated_ready;
  assign adderOutput0_translated_payload_res = _zz_adderOutput0_translated_payload_res_1[254:0];
  always @(*) begin
    adderOutput0_translated_ready = adderOutput0_translated_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      adderOutput0_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! adderOutput0_translated_m2sPipe_valid);
  assign adderOutput0_translated_m2sPipe_valid = adderOutput0_translated_rValid;
  assign adderOutput0_translated_m2sPipe_payload_res = adderOutput0_translated_rData_res;
  assign io_output_valid = adderOutput0_translated_m2sPipe_valid;
  assign adderOutput0_translated_m2sPipe_ready = io_output_ready;
  assign io_output_payload_res = adderOutput0_translated_m2sPipe_payload_res;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_adderOutput0_valid_1 <= 1'b0;
      adderOutput0_translated_rValid <= 1'b0;
    end else begin
      if(_zz_io_pop_ready_1) begin
        _zz_adderOutput0_valid_1 <= _zz_adderOutput0_valid;
      end
      if(adderOutput0_translated_ready) begin
        adderOutput0_translated_rValid <= adderOutput0_translated_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_ready_1) begin
      _zz_adderOutput0_payload_res <= _zz__zz_adderOutput0_payload_res[510 : 255];
    end
    if(adderOutput0_translated_ready) begin
      adderOutput0_translated_rData_res <= adderOutput0_translated_payload_res;
    end
  end


endmodule

//Multiplier replaced by Multiplier

//Multiplier replaced by Multiplier

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [511:0]  io_push_payload_res,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [511:0]  io_pop_payload_res,
  input               io_flush,
  output reg [5:0]    io_occupancy,
  output reg [5:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [511:0]  _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload_res;
  wire       [511:0]  _zz_logic_ram_port_1;
  wire       [5:0]    _zz_io_occupancy;
  wire       [5:0]    _zz_io_availability;
  wire       [5:0]    _zz_io_availability_1;
  wire       [5:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [5:0]    logic_ptrDif;
  reg [511:0] logic_ram [0:39];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (6'h28 + logic_ptrDif);
  assign _zz_io_availability = (6'h28 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload_res = 1'b1;
  assign _zz_logic_ram_port_1 = io_push_payload_res;
  always @(posedge clk) begin
    if(_zz_io_pop_payload_res) begin
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h27);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 6'h0;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h27);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 6'h0;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload_res = _zz_logic_ram_port0[511 : 0];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 6'h28 : 6'h0);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 6'h0 : 6'h28);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
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

module StreamFork_15 (
  input               io_input_valid,
  output              io_input_ready,
  input      [511:0]  io_input_payload_res,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [511:0]  io_outputs_0_payload_res,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [511:0]  io_outputs_1_payload_res
);

  assign io_input_ready = (io_outputs_0_ready && io_outputs_1_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload_res = io_input_payload_res;
  assign io_outputs_1_payload_res = io_input_payload_res;

endmodule

module Multiplier (
  input               io_input_valid,
  output              io_input_ready,
  input      [255:0]  io_input_payload_op1,
  input      [255:0]  io_input_payload_op2,
  output              io_output_valid,
  input               io_output_ready,
  output     [511:0]  io_output_payload_res,
  input               reset,
  input               clk
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
  wire                multiplierIPStream_48_io_input_ready;
  wire                multiplierIPStream_48_io_output_valid;
  wire       [127:0]  multiplierIPStream_48_io_output_payload_res;
  wire                multiplierIPStream_49_io_input_ready;
  wire                multiplierIPStream_49_io_output_valid;
  wire       [127:0]  multiplierIPStream_49_io_output_payload_res;
  wire                multiplierIPStream_50_io_input_ready;
  wire                multiplierIPStream_50_io_output_valid;
  wire       [127:0]  multiplierIPStream_50_io_output_payload_res;
  wire                multiplierIPStream_51_io_input_ready;
  wire                multiplierIPStream_51_io_output_valid;
  wire       [127:0]  multiplierIPStream_51_io_output_payload_res;
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
  wire                multiplierIPStream_52_io_input_ready;
  wire                multiplierIPStream_52_io_output_valid;
  wire       [127:0]  multiplierIPStream_52_io_output_payload_res;
  wire                multiplierIPStream_53_io_input_ready;
  wire                multiplierIPStream_53_io_output_valid;
  wire       [127:0]  multiplierIPStream_53_io_output_payload_res;
  wire                multiplierIPStream_54_io_input_ready;
  wire                multiplierIPStream_54_io_output_valid;
  wire       [127:0]  multiplierIPStream_54_io_output_payload_res;
  wire                multiplierIPStream_55_io_input_ready;
  wire                multiplierIPStream_55_io_output_valid;
  wire       [127:0]  multiplierIPStream_55_io_output_payload_res;
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
  wire                multiplierIPStream_56_io_input_ready;
  wire                multiplierIPStream_56_io_output_valid;
  wire       [127:0]  multiplierIPStream_56_io_output_payload_res;
  wire                multiplierIPStream_57_io_input_ready;
  wire                multiplierIPStream_57_io_output_valid;
  wire       [127:0]  multiplierIPStream_57_io_output_payload_res;
  wire                multiplierIPStream_58_io_input_ready;
  wire                multiplierIPStream_58_io_output_valid;
  wire       [127:0]  multiplierIPStream_58_io_output_payload_res;
  wire                multiplierIPStream_59_io_input_ready;
  wire                multiplierIPStream_59_io_output_valid;
  wire       [127:0]  multiplierIPStream_59_io_output_payload_res;
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
  wire                multiplierIPStream_60_io_input_ready;
  wire                multiplierIPStream_60_io_output_valid;
  wire       [127:0]  multiplierIPStream_60_io_output_payload_res;
  wire                multiplierIPStream_61_io_input_ready;
  wire                multiplierIPStream_61_io_output_valid;
  wire       [127:0]  multiplierIPStream_61_io_output_payload_res;
  wire                multiplierIPStream_62_io_input_ready;
  wire                multiplierIPStream_62_io_output_valid;
  wire       [127:0]  multiplierIPStream_62_io_output_payload_res;
  wire                multiplierIPStream_63_io_input_ready;
  wire                multiplierIPStream_63_io_output_valid;
  wire       [127:0]  multiplierIPStream_63_io_output_payload_res;
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
  assign _zz__zz_io_output_payload_res_1 = ({128'd0,multiplierIPStream_48_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_3 = ({64'd0,_zz__zz_io_output_payload_res_4} <<< 64);
  assign _zz__zz_io_output_payload_res_2 = {63'd0, _zz__zz_io_output_payload_res_3};
  assign _zz__zz_io_output_payload_res_4 = ({1'b0,multiplierIPStream_49_io_output_payload_res} + {1'b0,multiplierIPStream_50_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_5 = {128'd0, multiplierIPStream_51_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_1_1 = (_zz__zz_io_output_payload_res_1_2 + _zz__zz_io_output_payload_res_1_3);
  assign _zz__zz_io_output_payload_res_1_2 = ({128'd0,multiplierIPStream_52_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_1_4 = ({64'd0,_zz__zz_io_output_payload_res_1_5} <<< 64);
  assign _zz__zz_io_output_payload_res_1_3 = {63'd0, _zz__zz_io_output_payload_res_1_4};
  assign _zz__zz_io_output_payload_res_1_5 = ({1'b0,multiplierIPStream_53_io_output_payload_res} + {1'b0,multiplierIPStream_54_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_1_6 = {128'd0, multiplierIPStream_55_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_2_1 = (_zz__zz_io_output_payload_res_2_2 + _zz__zz_io_output_payload_res_2_3);
  assign _zz__zz_io_output_payload_res_2_2 = ({128'd0,multiplierIPStream_56_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_2_4 = ({64'd0,_zz__zz_io_output_payload_res_2_5} <<< 64);
  assign _zz__zz_io_output_payload_res_2_3 = {63'd0, _zz__zz_io_output_payload_res_2_4};
  assign _zz__zz_io_output_payload_res_2_5 = ({1'b0,multiplierIPStream_57_io_output_payload_res} + {1'b0,multiplierIPStream_58_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_2_6 = {128'd0, multiplierIPStream_59_io_output_payload_res};
  assign _zz__zz_io_output_payload_res_3_1 = (_zz__zz_io_output_payload_res_3_2 + _zz__zz_io_output_payload_res_3_3);
  assign _zz__zz_io_output_payload_res_3_2 = ({128'd0,multiplierIPStream_60_io_output_payload_res} <<< 128);
  assign _zz__zz_io_output_payload_res_3_4 = ({64'd0,_zz__zz_io_output_payload_res_3_5} <<< 64);
  assign _zz__zz_io_output_payload_res_3_3 = {63'd0, _zz__zz_io_output_payload_res_3_4};
  assign _zz__zz_io_output_payload_res_3_5 = ({1'b0,multiplierIPStream_61_io_output_payload_res} + {1'b0,multiplierIPStream_62_io_output_payload_res});
  assign _zz__zz_io_output_payload_res_3_6 = {128'd0, multiplierIPStream_63_io_output_payload_res};
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
  MultiplierIPStream multiplierIPStream_48 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_48_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_48_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_48_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_49 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_49_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_49_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_49_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_50 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_50_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_50_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_50_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_51 (
    .io_input_valid           (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_51_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_51_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready                                                             ), //i
    .io_output_payload_res    (multiplierIPStream_51_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
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
  MultiplierIPStream multiplierIPStream_52 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_52_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_52_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_52_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_53 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_53_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_53_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_53_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_54 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_54_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_54_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_54_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_55 (
    .io_input_valid           (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_55_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_55_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_2                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_55_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
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
  MultiplierIPStream multiplierIPStream_56 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_56_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_56_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_56_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_57 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_57_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_57_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_57_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_58 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_58_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_58_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_58_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_59 (
    .io_input_valid           (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_59_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_59_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_4                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_59_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
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
  MultiplierIPStream multiplierIPStream_60 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_60_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_60_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_60_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_61 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_61_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_61_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_61_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_62 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_62_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_62_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_62_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
  );
  MultiplierIPStream multiplierIPStream_63 (
    .io_input_valid           (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_valid        ), //i
    .io_input_ready           (multiplierIPStream_63_io_input_ready                                            ), //o
    .io_input_payload_op1     (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op1  ), //i
    .io_input_payload_op2     (io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op2  ), //i
    .io_output_valid          (multiplierIPStream_63_io_output_valid                                           ), //o
    .io_output_ready          (_zz_io_output_ready_6                                                           ), //i
    .io_output_payload_res    (multiplierIPStream_63_io_output_payload_res                                     ), //o
    .reset                    (reset                                                                           ), //i
    .clk                      (clk                                                                             )  //i
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
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_48_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_49_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_50_io_input_ready;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_0_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_0_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_0_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_51_io_input_ready;
  assign _zz_io_output_ready = (_zz_io_output_valid && _zz_io_output_ready_1);
  assign _zz_io_output_valid = (((multiplierIPStream_48_io_output_valid && multiplierIPStream_49_io_output_valid) && multiplierIPStream_50_io_output_valid) && multiplierIPStream_51_io_output_valid);
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
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_52_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_53_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_54_io_input_ready;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_1_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_1_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_1_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_55_io_input_ready;
  assign _zz_io_output_ready_2 = (_zz_io_output_valid_3 && _zz_io_output_ready_3);
  assign _zz_io_output_valid_3 = (((multiplierIPStream_52_io_output_valid && multiplierIPStream_53_io_output_valid) && multiplierIPStream_54_io_output_valid) && multiplierIPStream_55_io_output_valid);
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
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_56_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_57_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_58_io_input_ready;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_2_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_2_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_2_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_59_io_input_ready;
  assign _zz_io_output_ready_4 = (_zz_io_output_valid_6 && _zz_io_output_ready_5);
  assign _zz_io_output_valid_6 = (((multiplierIPStream_56_io_output_valid && multiplierIPStream_57_io_output_valid) && multiplierIPStream_58_io_output_valid) && multiplierIPStream_59_io_output_valid);
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
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_ready = multiplierIPStream_60_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_1_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_ready = multiplierIPStream_61_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_2_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_0_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_ready = multiplierIPStream_62_io_input_ready;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_valid = io_input_fork_io_outputs_3_translated_fork_io_outputs_3_valid;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op1 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_2_translated_payload_op1;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_payload_op2 = _zz_io_input_fork_io_outputs_3_translated_fork_io_outputs_1_translated_payload_op2;
  assign io_input_fork_io_outputs_3_translated_fork_io_outputs_3_translated_ready = multiplierIPStream_63_io_input_ready;
  assign _zz_io_output_ready_6 = (_zz_io_output_valid_9 && _zz_io_output_ready_7);
  assign _zz_io_output_valid_9 = (((multiplierIPStream_60_io_output_valid && multiplierIPStream_61_io_output_valid) && multiplierIPStream_62_io_output_valid) && multiplierIPStream_63_io_output_valid);
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

//MultiplierIPStream replaced by MultiplierIPStream

//StreamFork_1 replaced by StreamFork_1

//StreamFork replaced by StreamFork

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

//MultiplierIPStream replaced by MultiplierIPStream

//StreamFork_1 replaced by StreamFork_1

//StreamFork replaced by StreamFork

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
  input               reset,
  input               clk
);
  wire       [127:0]  multiplierIP_P;
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

  mult_gen_0 multiplierIP (
    .CLK     (clk                   ), //i
    .SCLR    (reset                 ), //i
    .CE      (io_input_ready        ), //i
    .A       (io_input_payload_op1  ), //i
    .B       (io_input_payload_op2  ), //i
    .P       (multiplierIP_P        )  //o
  );
  assign validPipe_0 = io_input_valid;
  assign io_output_valid = validPipe_18;
  assign io_input_ready = ((! io_output_valid) || io_output_ready);
  assign io_output_payload_res = multiplierIP_P;
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
