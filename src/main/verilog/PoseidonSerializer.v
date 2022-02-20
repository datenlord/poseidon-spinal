// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : PoseidonSerializer
// Git hash  : c5fda50d3fb129ecb0d9445587bf2ead1df08842


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_BUSY 2'b10
`define fsm_enumDefinition_binary_sequential_fsm_LAST 2'b11


module PoseidonSerializer (
  input               io_parallelInput_valid,
  output reg          io_parallelInput_ready,
  input      [6:0]    io_parallelInput_payload_round_index,
  input      [3:0]    io_parallelInput_payload_state_size,
  input      [4:0]    io_parallelInput_payload_state_id,
  input      [254:0]  io_parallelInput_payload_state_elements_0,
  input      [254:0]  io_parallelInput_payload_state_elements_1,
  input      [254:0]  io_parallelInput_payload_state_elements_2,
  input      [254:0]  io_parallelInput_payload_state_elements_3,
  input      [254:0]  io_parallelInput_payload_state_elements_4,
  input      [254:0]  io_parallelInput_payload_state_elements_5,
  input      [254:0]  io_parallelInput_payload_state_elements_6,
  input      [254:0]  io_parallelInput_payload_state_elements_7,
  input      [254:0]  io_parallelInput_payload_state_elements_8,
  input      [254:0]  io_parallelInput_payload_state_elements_9,
  input      [254:0]  io_parallelInput_payload_state_elements_10,
  input      [254:0]  io_parallelInput_payload_state_elements_11,
  output reg          io_serialOutput_valid,
  input               io_serialOutput_ready,
  output reg [6:0]    io_serialOutput_payload_round_index,
  output reg [3:0]    io_serialOutput_payload_state_index,
  output reg [3:0]    io_serialOutput_payload_state_size,
  output reg [4:0]    io_serialOutput_payload_state_id,
  output reg [254:0]  io_serialOutput_payload_state_element,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz_lastElementIndex;
  reg        [254:0]  _zz__zz_io_serialOutput_payload_state_element;
  wire       [3:0]    _zz_when_PoseidonSerializer_l68;
  reg        [3:0]    stateSize;
  wire       [3:0]    lastElementIndex;
  reg        [6:0]    roundIndex;
  reg        [4:0]    stateID;
  reg        [254:0]  buffer_0;
  reg        [254:0]  buffer_1;
  reg        [254:0]  buffer_2;
  reg        [254:0]  buffer_3;
  reg        [254:0]  buffer_4;
  reg        [254:0]  buffer_5;
  reg        [254:0]  buffer_6;
  reg        [254:0]  buffer_7;
  reg        [254:0]  buffer_8;
  reg        [254:0]  buffer_9;
  reg        [254:0]  buffer_10;
  reg        [254:0]  buffer_11;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [3:0]    fsm_counter;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                io_parallelInput_fire;
  wire       [254:0]  _zz_io_serialOutput_payload_state_element;
  wire                io_serialOutput_fire;
  wire                when_PoseidonSerializer_l68;
  wire                io_serialOutput_fire_1;
  wire                io_parallelInput_fire_1;
  wire                when_StateMachine_l214;
  `ifndef SYNTHESIS
  reg [63:0] fsm_stateReg_string;
  reg [63:0] fsm_stateNext_string;
  `endif


  assign _zz_lastElementIndex = (stateSize - 4'b0001);
  assign _zz_when_PoseidonSerializer_l68 = (lastElementIndex - 4'b0001);
  always @(*) begin
    case(fsm_counter)
      4'b0000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_0;
      end
      4'b0001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_1;
      end
      4'b0010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_2;
      end
      4'b0011 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_3;
      end
      4'b0100 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_4;
      end
      4'b0101 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_5;
      end
      4'b0110 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_6;
      end
      4'b0111 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_7;
      end
      4'b1000 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_8;
      end
      4'b1001 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_9;
      end
      4'b1010 : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_10;
      end
      default : begin
        _zz__zz_io_serialOutput_payload_state_element = buffer_11;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE";
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : fsm_stateReg_string = "fsm_BUSY";
      `fsm_enumDefinition_binary_sequential_fsm_LAST : fsm_stateReg_string = "fsm_LAST";
      default : fsm_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE";
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : fsm_stateNext_string = "fsm_BUSY";
      `fsm_enumDefinition_binary_sequential_fsm_LAST : fsm_stateNext_string = "fsm_LAST";
      default : fsm_stateNext_string = "????????";
    endcase
  end
  `endif

  assign lastElementIndex = ((stateSize == 4'b0101) ? stateSize : _zz_lastElementIndex);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    io_parallelInput_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        io_parallelInput_ready = 1'b1;
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          io_parallelInput_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_valid = 1'b1;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_id = 5'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_id = stateID;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_id = stateID;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_size = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_size = stateSize;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_element = 255'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_element = _zz_io_serialOutput_payload_state_element;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_state_index = 4'b0000;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_state_index = fsm_counter;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_serialOutput_payload_round_index = 7'h0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        io_serialOutput_payload_round_index = roundIndex;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(io_parallelInput_fire) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BUSY;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
        if(io_serialOutput_fire) begin
          if(when_PoseidonSerializer_l68) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_LAST;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
        if(io_serialOutput_fire_1) begin
          if(io_parallelInput_fire_1) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BUSY;
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

  assign io_parallelInput_fire = (io_parallelInput_valid && io_parallelInput_ready);
  assign _zz_io_serialOutput_payload_state_element = _zz__zz_io_serialOutput_payload_state_element;
  assign io_serialOutput_fire = (io_serialOutput_valid && io_serialOutput_ready);
  assign when_PoseidonSerializer_l68 = (fsm_counter == _zz_when_PoseidonSerializer_l68);
  assign io_serialOutput_fire_1 = (io_serialOutput_valid && io_serialOutput_ready);
  assign io_parallelInput_fire_1 = (io_parallelInput_valid && io_parallelInput_ready);
  assign when_StateMachine_l214 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_LAST) && (! (fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_LAST)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateSize <= 4'b0000;
      roundIndex <= 7'h0;
      stateID <= 5'h0;
      buffer_0 <= 255'h0;
      buffer_1 <= 255'h0;
      buffer_2 <= 255'h0;
      buffer_3 <= 255'h0;
      buffer_4 <= 255'h0;
      buffer_5 <= 255'h0;
      buffer_6 <= 255'h0;
      buffer_7 <= 255'h0;
      buffer_8 <= 255'h0;
      buffer_9 <= 255'h0;
      buffer_10 <= 255'h0;
      buffer_11 <= 255'h0;
      fsm_counter <= 4'b0000;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
          if(io_parallelInput_fire) begin
            buffer_0 <= io_parallelInput_payload_state_elements_0;
            buffer_1 <= io_parallelInput_payload_state_elements_1;
            buffer_2 <= io_parallelInput_payload_state_elements_2;
            buffer_3 <= io_parallelInput_payload_state_elements_3;
            buffer_4 <= io_parallelInput_payload_state_elements_4;
            buffer_5 <= io_parallelInput_payload_state_elements_5;
            buffer_6 <= io_parallelInput_payload_state_elements_6;
            buffer_7 <= io_parallelInput_payload_state_elements_7;
            buffer_8 <= io_parallelInput_payload_state_elements_8;
            buffer_9 <= io_parallelInput_payload_state_elements_9;
            buffer_10 <= io_parallelInput_payload_state_elements_10;
            buffer_11 <= io_parallelInput_payload_state_elements_11;
            stateID <= io_parallelInput_payload_state_id;
            stateSize <= io_parallelInput_payload_state_size;
            roundIndex <= io_parallelInput_payload_round_index;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_BUSY : begin
          if(io_serialOutput_fire) begin
            fsm_counter <= (fsm_counter + 4'b0001);
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_LAST : begin
          if(io_serialOutput_fire_1) begin
            if(io_parallelInput_fire_1) begin
              buffer_0 <= io_parallelInput_payload_state_elements_0;
              buffer_1 <= io_parallelInput_payload_state_elements_1;
              buffer_2 <= io_parallelInput_payload_state_elements_2;
              buffer_3 <= io_parallelInput_payload_state_elements_3;
              buffer_4 <= io_parallelInput_payload_state_elements_4;
              buffer_5 <= io_parallelInput_payload_state_elements_5;
              buffer_6 <= io_parallelInput_payload_state_elements_6;
              buffer_7 <= io_parallelInput_payload_state_elements_7;
              buffer_8 <= io_parallelInput_payload_state_elements_8;
              buffer_9 <= io_parallelInput_payload_state_elements_9;
              buffer_10 <= io_parallelInput_payload_state_elements_10;
              buffer_11 <= io_parallelInput_payload_state_elements_11;
              stateID <= io_parallelInput_payload_state_id;
              stateSize <= io_parallelInput_payload_state_size;
              roundIndex <= io_parallelInput_payload_round_index;
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
