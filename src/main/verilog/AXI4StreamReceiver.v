// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : AXI4StreamReceiver
// Git hash  : c5fda50d3fb129ecb0d9445587bf2ead1df08842


`define receiver_receiverFSM_enumDefinition_binary_sequential_type [1:0]
`define receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BOOT 2'b00
`define receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_BUSY 2'b01
`define receiver_receiverFSM_enumDefinition_binary_sequential_receiver_receiverFSM_DONE 2'b10


module AXI4StreamReceiver (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_last,
  input      [254:0]  io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [4:0]    io_output_payload_state_id,
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
  reg        [4:0]    receiver_output_payload_state_id;
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
  reg        [4:0]    receiver_idCounter;
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
  wire       [4:0]    receiver_output_m2sPipe_payload_state_id;
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
  reg        [4:0]    receiver_output_rData_state_id;
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
    receiver_output_payload_state_id = 5'h0;
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
      receiver_idCounter <= 5'h0;
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
            receiver_idCounter <= (receiver_idCounter + 5'h01);
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
