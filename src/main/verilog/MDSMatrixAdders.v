// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : MDSMatrixAdders
// Git hash  : c5fda50d3fb129ecb0d9445587bf2ead1df08842


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_ADDING 2'b10
`define fsm_enumDefinition_binary_sequential_fsm_DONE 2'b11


module MDSMatrixAdders (
  input               io_input_valid,
  output reg          io_input_ready,
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
  output reg          io_output_valid,
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
  wire       [3:0]    _zz_countNum;
  wire       [3:0]    _zz_when_MDSMatrixAdders_l81;
  reg        [6:0]    tempRes_round_index;
  reg        [3:0]    tempRes_state_size;
  reg        [3:0]    tempRes_state_id;
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
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
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
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_binary_sequential_fsm_ADDING : fsm_stateReg_string = "fsm_ADDING";
      `fsm_enumDefinition_binary_sequential_fsm_DONE : fsm_stateReg_string = "fsm_DONE  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_binary_sequential_fsm_ADDING : fsm_stateNext_string = "fsm_ADDING";
      `fsm_enumDefinition_binary_sequential_fsm_DONE : fsm_stateNext_string = "fsm_DONE  ";
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
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_DONE : begin
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
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_ADDING : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_DONE : begin
        io_output_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_input_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_binary_sequential_fsm_ADDING : begin
        io_input_ready = 1'b1;
      end
      `fsm_enumDefinition_binary_sequential_fsm_DONE : begin
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
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(io_input_fire) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_ADDING;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_ADDING : begin
        if(io_input_fire_1) begin
          if(when_MDSMatrixAdders_l81) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_DONE;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_DONE : begin
        if(io_output_fire) begin
          if(io_input_fire_2) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_ADDING;
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

  assign io_input_fire = (io_input_valid && io_input_ready);
  assign io_input_fire_1 = (io_input_valid && io_input_ready);
  assign when_MDSMatrixAdders_l81 = (_zz_when_MDSMatrixAdders_l81 == countNum);
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire_2 = (io_input_valid && io_input_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_ADDING) && (! (fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_ADDING)));
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
      tempRes_state_id <= 4'b0000;
      tempRes_round_index <= 7'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
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
        `fsm_enumDefinition_binary_sequential_fsm_ADDING : begin
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
        `fsm_enumDefinition_binary_sequential_fsm_DONE : begin
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
