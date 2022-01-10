// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : AXI4StreamTransmitter



module AXI4StreamTransmitter (
  input               io_input_valid,
  output              io_input_ready,
  input      [4:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_last,
  output     [254:0]  io_output_payload,
  input               clk,
  input               reset
);
  wire                streamMux_1_io_output_ready;
  wire                streamDemux_1_io_input_ready;
  wire                streamDemux_1_io_outputs_0_valid;
  wire       [4:0]    streamDemux_1_io_outputs_0_payload_state_id;
  wire       [254:0]  streamDemux_1_io_outputs_0_payload_state_element;
  wire                streamDemux_1_io_outputs_1_valid;
  wire       [4:0]    streamDemux_1_io_outputs_1_payload_state_id;
  wire       [254:0]  streamDemux_1_io_outputs_1_payload_state_element;
  wire                streamDemux_1_io_outputs_2_valid;
  wire       [4:0]    streamDemux_1_io_outputs_2_payload_state_id;
  wire       [254:0]  streamDemux_1_io_outputs_2_payload_state_element;
  wire                streamDemux_1_io_outputs_3_valid;
  wire       [4:0]    streamDemux_1_io_outputs_3_payload_state_id;
  wire       [254:0]  streamDemux_1_io_outputs_3_payload_state_element;
  wire                streamDemux_1_io_outputs_4_valid;
  wire       [4:0]    streamDemux_1_io_outputs_4_payload_state_id;
  wire       [254:0]  streamDemux_1_io_outputs_4_payload_state_element;
  wire                streamMux_1_io_inputs_0_ready;
  wire                streamMux_1_io_inputs_1_ready;
  wire                streamMux_1_io_inputs_2_ready;
  wire                streamMux_1_io_inputs_3_ready;
  wire                streamMux_1_io_inputs_4_ready;
  wire                streamMux_1_io_output_valid;
  wire       [4:0]    streamMux_1_io_output_payload_state_id;
  wire       [254:0]  streamMux_1_io_output_payload_state_element;
  wire       [4:0]    _zz__zz_demux_select_1;
  reg        [4:0]    idCounter;
  wire                when_AXI4StreamInterface_l220;
  wire                input_demux_0_valid;
  reg                 input_demux_0_ready;
  wire       [4:0]    input_demux_0_payload_state_id;
  wire       [254:0]  input_demux_0_payload_state_element;
  wire                input_demux_1_valid;
  reg                 input_demux_1_ready;
  wire       [4:0]    input_demux_1_payload_state_id;
  wire       [254:0]  input_demux_1_payload_state_element;
  wire                input_demux_2_valid;
  reg                 input_demux_2_ready;
  wire       [4:0]    input_demux_2_payload_state_id;
  wire       [254:0]  input_demux_2_payload_state_element;
  wire                input_demux_3_valid;
  reg                 input_demux_3_ready;
  wire       [4:0]    input_demux_3_payload_state_id;
  wire       [254:0]  input_demux_3_payload_state_element;
  wire                input_demux_4_valid;
  reg                 input_demux_4_ready;
  wire       [4:0]    input_demux_4_payload_state_id;
  wire       [254:0]  input_demux_4_payload_state_element;
  wire       [4:0]    _zz_demux_select;
  wire       [4:0]    _zz_demux_select_1;
  wire                _zz_demux_select_2;
  wire                _zz_demux_select_3;
  wire                _zz_demux_select_4;
  wire                _zz_demux_select_5;
  wire       [2:0]    demux_select;
  wire                buffer_0_valid;
  wire                buffer_0_ready;
  wire       [4:0]    buffer_0_payload_state_id;
  wire       [254:0]  buffer_0_payload_state_element;
  reg                 input_demux_0_rValid;
  reg        [4:0]    input_demux_0_rData_state_id;
  reg        [254:0]  input_demux_0_rData_state_element;
  wire                when_Stream_l342;
  wire                buffer_1_valid;
  wire                buffer_1_ready;
  wire       [4:0]    buffer_1_payload_state_id;
  wire       [254:0]  buffer_1_payload_state_element;
  reg                 input_demux_1_rValid;
  reg        [4:0]    input_demux_1_rData_state_id;
  reg        [254:0]  input_demux_1_rData_state_element;
  wire                when_Stream_l342_1;
  wire                buffer_2_valid;
  wire                buffer_2_ready;
  wire       [4:0]    buffer_2_payload_state_id;
  wire       [254:0]  buffer_2_payload_state_element;
  reg                 input_demux_2_rValid;
  reg        [4:0]    input_demux_2_rData_state_id;
  reg        [254:0]  input_demux_2_rData_state_element;
  wire                when_Stream_l342_2;
  wire                buffer_3_valid;
  wire                buffer_3_ready;
  wire       [4:0]    buffer_3_payload_state_id;
  wire       [254:0]  buffer_3_payload_state_element;
  reg                 input_demux_3_rValid;
  reg        [4:0]    input_demux_3_rData_state_id;
  reg        [254:0]  input_demux_3_rData_state_element;
  wire                when_Stream_l342_3;
  wire                buffer_4_valid;
  wire                buffer_4_ready;
  wire       [4:0]    buffer_4_payload_state_id;
  wire       [254:0]  buffer_4_payload_state_element;
  reg                 input_demux_4_rValid;
  reg        [4:0]    input_demux_4_rData_state_id;
  reg        [254:0]  input_demux_4_rData_state_element;
  wire                when_Stream_l342_4;
  wire                _zz_select;
  wire                _zz_select_1;
  wire                _zz_select_2;
  wire                _zz_select_3;
  wire       [2:0]    select_1;

  assign _zz__zz_demux_select_1 = (_zz_demux_select - 5'h01);
  StreamDemux streamDemux_1 (
    .io_select                             (demux_select                                      ), //i
    .io_input_valid                        (io_input_valid                                    ), //i
    .io_input_ready                        (streamDemux_1_io_input_ready                      ), //o
    .io_input_payload_state_id             (io_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (io_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (streamDemux_1_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (input_demux_0_ready                               ), //i
    .io_outputs_0_payload_state_id         (streamDemux_1_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (streamDemux_1_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (streamDemux_1_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (input_demux_1_ready                               ), //i
    .io_outputs_1_payload_state_id         (streamDemux_1_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (streamDemux_1_io_outputs_1_payload_state_element  ), //o
    .io_outputs_2_valid                    (streamDemux_1_io_outputs_2_valid                  ), //o
    .io_outputs_2_ready                    (input_demux_2_ready                               ), //i
    .io_outputs_2_payload_state_id         (streamDemux_1_io_outputs_2_payload_state_id       ), //o
    .io_outputs_2_payload_state_element    (streamDemux_1_io_outputs_2_payload_state_element  ), //o
    .io_outputs_3_valid                    (streamDemux_1_io_outputs_3_valid                  ), //o
    .io_outputs_3_ready                    (input_demux_3_ready                               ), //i
    .io_outputs_3_payload_state_id         (streamDemux_1_io_outputs_3_payload_state_id       ), //o
    .io_outputs_3_payload_state_element    (streamDemux_1_io_outputs_3_payload_state_element  ), //o
    .io_outputs_4_valid                    (streamDemux_1_io_outputs_4_valid                  ), //o
    .io_outputs_4_ready                    (input_demux_4_ready                               ), //i
    .io_outputs_4_payload_state_id         (streamDemux_1_io_outputs_4_payload_state_id       ), //o
    .io_outputs_4_payload_state_element    (streamDemux_1_io_outputs_4_payload_state_element  )  //o
  );
  StreamMux streamMux_1 (
    .io_select                            (select_1                                     ), //i
    .io_inputs_0_valid                    (buffer_0_valid                               ), //i
    .io_inputs_0_ready                    (streamMux_1_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_state_id         (buffer_0_payload_state_id                    ), //i
    .io_inputs_0_payload_state_element    (buffer_0_payload_state_element               ), //i
    .io_inputs_1_valid                    (buffer_1_valid                               ), //i
    .io_inputs_1_ready                    (streamMux_1_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_state_id         (buffer_1_payload_state_id                    ), //i
    .io_inputs_1_payload_state_element    (buffer_1_payload_state_element               ), //i
    .io_inputs_2_valid                    (buffer_2_valid                               ), //i
    .io_inputs_2_ready                    (streamMux_1_io_inputs_2_ready                ), //o
    .io_inputs_2_payload_state_id         (buffer_2_payload_state_id                    ), //i
    .io_inputs_2_payload_state_element    (buffer_2_payload_state_element               ), //i
    .io_inputs_3_valid                    (buffer_3_valid                               ), //i
    .io_inputs_3_ready                    (streamMux_1_io_inputs_3_ready                ), //o
    .io_inputs_3_payload_state_id         (buffer_3_payload_state_id                    ), //i
    .io_inputs_3_payload_state_element    (buffer_3_payload_state_element               ), //i
    .io_inputs_4_valid                    (buffer_4_valid                               ), //i
    .io_inputs_4_ready                    (streamMux_1_io_inputs_4_ready                ), //o
    .io_inputs_4_payload_state_id         (buffer_4_payload_state_id                    ), //i
    .io_inputs_4_payload_state_element    (buffer_4_payload_state_element               ), //i
    .io_output_valid                      (streamMux_1_io_output_valid                  ), //o
    .io_output_ready                      (streamMux_1_io_output_ready                  ), //i
    .io_output_payload_state_id           (streamMux_1_io_output_payload_state_id       ), //o
    .io_output_payload_state_element      (streamMux_1_io_output_payload_state_element  )  //o
  );
  assign when_AXI4StreamInterface_l220 = (io_output_valid && io_output_ready);
  assign _zz_demux_select = {input_demux_4_ready,{input_demux_3_ready,{input_demux_2_ready,{input_demux_1_ready,input_demux_0_ready}}}};
  assign _zz_demux_select_1 = (_zz_demux_select & (~ _zz__zz_demux_select_1));
  assign _zz_demux_select_2 = _zz_demux_select_1[3];
  assign _zz_demux_select_3 = _zz_demux_select_1[4];
  assign _zz_demux_select_4 = (_zz_demux_select_1[1] || _zz_demux_select_2);
  assign _zz_demux_select_5 = (_zz_demux_select_1[2] || _zz_demux_select_2);
  assign demux_select = {_zz_demux_select_3,{_zz_demux_select_5,_zz_demux_select_4}};
  assign io_input_ready = streamDemux_1_io_input_ready;
  assign input_demux_0_valid = streamDemux_1_io_outputs_0_valid;
  assign input_demux_0_payload_state_id = streamDemux_1_io_outputs_0_payload_state_id;
  assign input_demux_0_payload_state_element = streamDemux_1_io_outputs_0_payload_state_element;
  assign input_demux_1_valid = streamDemux_1_io_outputs_1_valid;
  assign input_demux_1_payload_state_id = streamDemux_1_io_outputs_1_payload_state_id;
  assign input_demux_1_payload_state_element = streamDemux_1_io_outputs_1_payload_state_element;
  assign input_demux_2_valid = streamDemux_1_io_outputs_2_valid;
  assign input_demux_2_payload_state_id = streamDemux_1_io_outputs_2_payload_state_id;
  assign input_demux_2_payload_state_element = streamDemux_1_io_outputs_2_payload_state_element;
  assign input_demux_3_valid = streamDemux_1_io_outputs_3_valid;
  assign input_demux_3_payload_state_id = streamDemux_1_io_outputs_3_payload_state_id;
  assign input_demux_3_payload_state_element = streamDemux_1_io_outputs_3_payload_state_element;
  assign input_demux_4_valid = streamDemux_1_io_outputs_4_valid;
  assign input_demux_4_payload_state_id = streamDemux_1_io_outputs_4_payload_state_id;
  assign input_demux_4_payload_state_element = streamDemux_1_io_outputs_4_payload_state_element;
  always @(*) begin
    input_demux_0_ready = buffer_0_ready;
    if(when_Stream_l342) begin
      input_demux_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! buffer_0_valid);
  assign buffer_0_valid = input_demux_0_rValid;
  assign buffer_0_payload_state_id = input_demux_0_rData_state_id;
  assign buffer_0_payload_state_element = input_demux_0_rData_state_element;
  always @(*) begin
    input_demux_1_ready = buffer_1_ready;
    if(when_Stream_l342_1) begin
      input_demux_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! buffer_1_valid);
  assign buffer_1_valid = input_demux_1_rValid;
  assign buffer_1_payload_state_id = input_demux_1_rData_state_id;
  assign buffer_1_payload_state_element = input_demux_1_rData_state_element;
  always @(*) begin
    input_demux_2_ready = buffer_2_ready;
    if(when_Stream_l342_2) begin
      input_demux_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! buffer_2_valid);
  assign buffer_2_valid = input_demux_2_rValid;
  assign buffer_2_payload_state_id = input_demux_2_rData_state_id;
  assign buffer_2_payload_state_element = input_demux_2_rData_state_element;
  always @(*) begin
    input_demux_3_ready = buffer_3_ready;
    if(when_Stream_l342_3) begin
      input_demux_3_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! buffer_3_valid);
  assign buffer_3_valid = input_demux_3_rValid;
  assign buffer_3_payload_state_id = input_demux_3_rData_state_id;
  assign buffer_3_payload_state_element = input_demux_3_rData_state_element;
  always @(*) begin
    input_demux_4_ready = buffer_4_ready;
    if(when_Stream_l342_4) begin
      input_demux_4_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! buffer_4_valid);
  assign buffer_4_valid = input_demux_4_rValid;
  assign buffer_4_payload_state_id = input_demux_4_rData_state_id;
  assign buffer_4_payload_state_element = input_demux_4_rData_state_element;
  assign _zz_select = (buffer_3_valid && (buffer_3_payload_state_id == idCounter));
  assign _zz_select_1 = (buffer_4_valid && (buffer_4_payload_state_id == idCounter));
  assign _zz_select_2 = ((buffer_1_valid && (buffer_1_payload_state_id == idCounter)) || _zz_select);
  assign _zz_select_3 = ((buffer_2_valid && (buffer_2_payload_state_id == idCounter)) || _zz_select);
  assign select_1 = {_zz_select_1,{_zz_select_3,_zz_select_2}};
  assign buffer_0_ready = streamMux_1_io_inputs_0_ready;
  assign buffer_1_ready = streamMux_1_io_inputs_1_ready;
  assign buffer_2_ready = streamMux_1_io_inputs_2_ready;
  assign buffer_3_ready = streamMux_1_io_inputs_3_ready;
  assign buffer_4_ready = streamMux_1_io_inputs_4_ready;
  assign io_output_valid = (streamMux_1_io_output_valid && (streamMux_1_io_output_payload_state_id == idCounter));
  assign io_output_last = 1'b1;
  assign io_output_payload = streamMux_1_io_output_payload_state_element;
  assign streamMux_1_io_output_ready = (io_output_ready && (streamMux_1_io_output_payload_state_id == idCounter));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      idCounter <= 5'h0;
      input_demux_0_rValid <= 1'b0;
      input_demux_1_rValid <= 1'b0;
      input_demux_2_rValid <= 1'b0;
      input_demux_3_rValid <= 1'b0;
      input_demux_4_rValid <= 1'b0;
    end else begin
      if(when_AXI4StreamInterface_l220) begin
        idCounter <= (idCounter + 5'h01);
      end
      if(input_demux_0_ready) begin
        input_demux_0_rValid <= input_demux_0_valid;
      end
      if(input_demux_1_ready) begin
        input_demux_1_rValid <= input_demux_1_valid;
      end
      if(input_demux_2_ready) begin
        input_demux_2_rValid <= input_demux_2_valid;
      end
      if(input_demux_3_ready) begin
        input_demux_3_rValid <= input_demux_3_valid;
      end
      if(input_demux_4_ready) begin
        input_demux_4_rValid <= input_demux_4_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(input_demux_0_ready) begin
      input_demux_0_rData_state_id <= input_demux_0_payload_state_id;
      input_demux_0_rData_state_element <= input_demux_0_payload_state_element;
    end
    if(input_demux_1_ready) begin
      input_demux_1_rData_state_id <= input_demux_1_payload_state_id;
      input_demux_1_rData_state_element <= input_demux_1_payload_state_element;
    end
    if(input_demux_2_ready) begin
      input_demux_2_rData_state_id <= input_demux_2_payload_state_id;
      input_demux_2_rData_state_element <= input_demux_2_payload_state_element;
    end
    if(input_demux_3_ready) begin
      input_demux_3_rData_state_id <= input_demux_3_payload_state_id;
      input_demux_3_rData_state_element <= input_demux_3_payload_state_element;
    end
    if(input_demux_4_ready) begin
      input_demux_4_rData_state_id <= input_demux_4_payload_state_id;
      input_demux_4_rData_state_element <= input_demux_4_payload_state_element;
    end
  end


endmodule

module StreamMux (
  input      [2:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [4:0]    io_inputs_0_payload_state_id,
  input      [254:0]  io_inputs_0_payload_state_element,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [4:0]    io_inputs_1_payload_state_id,
  input      [254:0]  io_inputs_1_payload_state_element,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [4:0]    io_inputs_2_payload_state_id,
  input      [254:0]  io_inputs_2_payload_state_element,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input      [4:0]    io_inputs_3_payload_state_id,
  input      [254:0]  io_inputs_3_payload_state_element,
  input               io_inputs_4_valid,
  output              io_inputs_4_ready,
  input      [4:0]    io_inputs_4_payload_state_id,
  input      [254:0]  io_inputs_4_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [4:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element
);
  reg                 _zz_io_output_valid;
  reg        [4:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_element;

  always @(*) begin
    case(io_select)
      3'b000 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload_state_id = io_inputs_0_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_0_payload_state_element;
      end
      3'b001 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload_state_id = io_inputs_1_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_1_payload_state_element;
      end
      3'b010 : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload_state_id = io_inputs_2_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_2_payload_state_element;
      end
      3'b011 : begin
        _zz_io_output_valid = io_inputs_3_valid;
        _zz_io_output_payload_state_id = io_inputs_3_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_3_payload_state_element;
      end
      default : begin
        _zz_io_output_valid = io_inputs_4_valid;
        _zz_io_output_payload_state_id = io_inputs_4_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_4_payload_state_element;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 3'b000) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 3'b001) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 3'b010) && io_output_ready);
  assign io_inputs_3_ready = ((io_select == 3'b011) && io_output_ready);
  assign io_inputs_4_ready = ((io_select == 3'b100) && io_output_ready);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_element = _zz_io_output_payload_state_element;

endmodule

module StreamDemux (
  input      [2:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [4:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [4:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [4:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element,
  output reg          io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [4:0]    io_outputs_2_payload_state_id,
  output     [254:0]  io_outputs_2_payload_state_element,
  output reg          io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [4:0]    io_outputs_3_payload_state_id,
  output     [254:0]  io_outputs_3_payload_state_element,
  output reg          io_outputs_4_valid,
  input               io_outputs_4_ready,
  output     [4:0]    io_outputs_4_payload_state_id,
  output     [254:0]  io_outputs_4_payload_state_element
);
  wire                when_Stream_l745;
  wire                when_Stream_l745_1;
  wire                when_Stream_l745_2;
  wire                when_Stream_l745_3;
  wire                when_Stream_l745_4;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l745) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l745_1) begin
      io_input_ready = io_outputs_1_ready;
    end
    if(!when_Stream_l745_2) begin
      io_input_ready = io_outputs_2_ready;
    end
    if(!when_Stream_l745_3) begin
      io_input_ready = io_outputs_3_ready;
    end
    if(!when_Stream_l745_4) begin
      io_input_ready = io_outputs_4_ready;
    end
  end

  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745 = (3'b000 != io_select);
  always @(*) begin
    if(when_Stream_l745) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_1 = (3'b001 != io_select);
  always @(*) begin
    if(when_Stream_l745_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  assign io_outputs_2_payload_state_id = io_input_payload_state_id;
  assign io_outputs_2_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_2 = (3'b010 != io_select);
  always @(*) begin
    if(when_Stream_l745_2) begin
      io_outputs_2_valid = 1'b0;
    end else begin
      io_outputs_2_valid = io_input_valid;
    end
  end

  assign io_outputs_3_payload_state_id = io_input_payload_state_id;
  assign io_outputs_3_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_3 = (3'b011 != io_select);
  always @(*) begin
    if(when_Stream_l745_3) begin
      io_outputs_3_valid = 1'b0;
    end else begin
      io_outputs_3_valid = io_input_valid;
    end
  end

  assign io_outputs_4_payload_state_id = io_input_payload_state_id;
  assign io_outputs_4_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_4 = (3'b100 != io_select);
  always @(*) begin
    if(when_Stream_l745_4) begin
      io_outputs_4_valid = 1'b0;
    end else begin
      io_outputs_4_valid = io_input_valid;
    end
  end


endmodule
