// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : PoseidonThread



module PoseidonThread (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [5:0]    io_output_payload_state_id,
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
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, PoseidonThread);
    end
  wire       [1:0]    AddRoundConstantStage_roundConstants_t3_io_read_ports_0_t_index;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t3_io_read_ports_0_round_index;
  wire       [2:0]    AddRoundConstantStage_roundConstants_t5_io_read_ports_0_t_index;
  wire       [5:0]    AddRoundConstantStage_roundConstants_t5_io_read_ports_0_round_index;
  reg        [254:0]  AddRoundConstantStage_modAdder_op2_i;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t3_io_read_ports_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t5_io_read_ports_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t9_io_read_ports_0_data;
  wire       [254:0]  AddRoundConstantStage_roundConstants_t12_io_read_ports_0_data;
  wire       [254:0]  AddRoundConstantStage_modAdder_res_o;
  wire                SBox5Stage_SBox5Insts_0_io_input_ready;
  wire                SBox5Stage_SBox5Insts_0_io_output_valid;
  wire       [6:0]    SBox5Stage_SBox5Insts_0_io_output_payload_round_index;
  wire       [3:0]    SBox5Stage_SBox5Insts_0_io_output_payload_state_index;
  wire       [3:0]    SBox5Stage_SBox5Insts_0_io_output_payload_state_size;
  wire       [5:0]    SBox5Stage_SBox5Insts_0_io_output_payload_state_id;
  wire       [254:0]  SBox5Stage_SBox5Insts_0_io_output_payload_state_element;
  wire                SBox5Stage_SBox5Insts_1_io_input_ready;
  wire                SBox5Stage_SBox5Insts_1_io_output_valid;
  wire       [6:0]    SBox5Stage_SBox5Insts_1_io_output_payload_round_index;
  wire       [3:0]    SBox5Stage_SBox5Insts_1_io_output_payload_state_index;
  wire       [3:0]    SBox5Stage_SBox5Insts_1_io_output_payload_state_size;
  wire       [5:0]    SBox5Stage_SBox5Insts_1_io_output_payload_state_id;
  wire       [254:0]  SBox5Stage_SBox5Insts_1_io_output_payload_state_element;
  wire                SBox5Stage_SBox5Insts_2_io_input_ready;
  wire                SBox5Stage_SBox5Insts_2_io_output_valid;
  wire       [6:0]    SBox5Stage_SBox5Insts_2_io_output_payload_round_index;
  wire       [3:0]    SBox5Stage_SBox5Insts_2_io_output_payload_state_index;
  wire       [3:0]    SBox5Stage_SBox5Insts_2_io_output_payload_state_size;
  wire       [5:0]    SBox5Stage_SBox5Insts_2_io_output_payload_state_id;
  wire       [254:0]  SBox5Stage_SBox5Insts_2_io_output_payload_state_element;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_input_ready;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_valid;
  wire       [6:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_size;
  wire       [5:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_element;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_valid;
  wire       [6:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_size;
  wire       [5:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_element;
  wire                streamDemux_2_io_input_ready;
  wire                streamDemux_2_io_outputs_0_valid;
  wire       [6:0]    streamDemux_2_io_outputs_0_payload_round_index;
  wire       [3:0]    streamDemux_2_io_outputs_0_payload_state_index;
  wire       [3:0]    streamDemux_2_io_outputs_0_payload_state_size;
  wire       [5:0]    streamDemux_2_io_outputs_0_payload_state_id;
  wire       [254:0]  streamDemux_2_io_outputs_0_payload_state_element;
  wire                streamDemux_2_io_outputs_1_valid;
  wire       [6:0]    streamDemux_2_io_outputs_1_payload_round_index;
  wire       [3:0]    streamDemux_2_io_outputs_1_payload_state_index;
  wire       [3:0]    streamDemux_2_io_outputs_1_payload_state_size;
  wire       [5:0]    streamDemux_2_io_outputs_1_payload_state_id;
  wire       [254:0]  streamDemux_2_io_outputs_1_payload_state_element;
  wire                streamDemux_2_io_outputs_2_valid;
  wire       [6:0]    streamDemux_2_io_outputs_2_payload_round_index;
  wire       [3:0]    streamDemux_2_io_outputs_2_payload_state_index;
  wire       [3:0]    streamDemux_2_io_outputs_2_payload_state_size;
  wire       [5:0]    streamDemux_2_io_outputs_2_payload_state_id;
  wire       [254:0]  streamDemux_2_io_outputs_2_payload_state_element;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [1:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_payload;
  wire       [4:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire                streamMux_2_io_inputs_0_ready;
  wire                streamMux_2_io_inputs_1_ready;
  wire                streamMux_2_io_inputs_2_ready;
  wire                streamMux_2_io_output_valid;
  wire       [6:0]    streamMux_2_io_output_payload_round_index;
  wire       [3:0]    streamMux_2_io_output_payload_state_index;
  wire       [3:0]    streamMux_2_io_output_payload_state_size;
  wire       [5:0]    streamMux_2_io_output_payload_state_id;
  wire       [254:0]  streamMux_2_io_output_payload_state_element;
  wire                MDSMixStage_matrixMultiplierInsts_0_io_input_ready;
  wire                MDSMixStage_matrixMultiplierInsts_0_io_output_valid;
  wire       [6:0]    MDSMixStage_matrixMultiplierInsts_0_io_output_payload_round_index;
  wire       [3:0]    MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_size;
  wire       [5:0]    MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_id;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_0;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_1;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_2;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_3;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_4;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_5;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_6;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_7;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_8;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_9;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_10;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_11;
  wire                MDSMixStage_matrixMultiplierInsts_1_io_input_ready;
  wire                MDSMixStage_matrixMultiplierInsts_1_io_output_valid;
  wire       [6:0]    MDSMixStage_matrixMultiplierInsts_1_io_output_payload_round_index;
  wire       [3:0]    MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_size;
  wire       [5:0]    MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_id;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_0;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_1;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_2;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_3;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_4;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_5;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_6;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_7;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_8;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_9;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_10;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_11;
  wire                MDSMixStage_matrixMultiplierInsts_2_io_input_ready;
  wire                MDSMixStage_matrixMultiplierInsts_2_io_output_valid;
  wire       [6:0]    MDSMixStage_matrixMultiplierInsts_2_io_output_payload_round_index;
  wire       [3:0]    MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_size;
  wire       [5:0]    MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_id;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_0;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_1;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_2;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_3;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_4;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_5;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_6;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_7;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_8;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_9;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_10;
  wire       [254:0]  MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_11;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_input_ready;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_valid;
  wire       [6:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_size;
  wire       [5:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_element;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_valid;
  wire       [6:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_size;
  wire       [5:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_element;
  wire                streamDemux_3_io_input_ready;
  wire                streamDemux_3_io_outputs_0_valid;
  wire       [6:0]    streamDemux_3_io_outputs_0_payload_round_index;
  wire       [3:0]    streamDemux_3_io_outputs_0_payload_state_index;
  wire       [3:0]    streamDemux_3_io_outputs_0_payload_state_size;
  wire       [5:0]    streamDemux_3_io_outputs_0_payload_state_id;
  wire       [254:0]  streamDemux_3_io_outputs_0_payload_state_element;
  wire                streamDemux_3_io_outputs_1_valid;
  wire       [6:0]    streamDemux_3_io_outputs_1_payload_round_index;
  wire       [3:0]    streamDemux_3_io_outputs_1_payload_state_index;
  wire       [3:0]    streamDemux_3_io_outputs_1_payload_state_size;
  wire       [5:0]    streamDemux_3_io_outputs_1_payload_state_id;
  wire       [254:0]  streamDemux_3_io_outputs_1_payload_state_element;
  wire                streamDemux_3_io_outputs_2_valid;
  wire       [6:0]    streamDemux_3_io_outputs_2_payload_round_index;
  wire       [3:0]    streamDemux_3_io_outputs_2_payload_state_index;
  wire       [3:0]    streamDemux_3_io_outputs_2_payload_state_size;
  wire       [5:0]    streamDemux_3_io_outputs_2_payload_state_id;
  wire       [254:0]  streamDemux_3_io_outputs_2_payload_state_element;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [1:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_payload;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_occupancy;
  wire                streamMux_3_io_inputs_0_ready;
  wire                streamMux_3_io_inputs_1_ready;
  wire                streamMux_3_io_inputs_2_ready;
  wire                streamMux_3_io_output_valid;
  wire       [6:0]    streamMux_3_io_output_payload_round_index;
  wire       [3:0]    streamMux_3_io_output_payload_state_size;
  wire       [5:0]    streamMux_3_io_output_payload_state_id;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_0;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_1;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_2;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_3;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_4;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_5;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_6;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_7;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_8;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_9;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_10;
  wire       [254:0]  streamMux_3_io_output_payload_state_elements_11;
  wire       [2:0]    _zz__zz_SBox5Stage_DemuxSelect_1;
  wire       [2:0]    _zz__zz_MDSMixStage_DemuxSelect_1;
  wire                AddRoundConstantStage_output_valid;
  reg                 AddRoundConstantStage_output_ready;
  wire       [6:0]    AddRoundConstantStage_output_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_payload_state_size;
  wire       [5:0]    AddRoundConstantStage_output_payload_state_id;
  reg        [254:0]  AddRoundConstantStage_output_payload_state_element;
  wire                when_PoseidonThread_l46;
  wire                AddRoundConstantStage_output_m2sPipe_valid;
  wire                AddRoundConstantStage_output_m2sPipe_ready;
  wire       [6:0]    AddRoundConstantStage_output_m2sPipe_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_payload_state_size;
  wire       [5:0]    AddRoundConstantStage_output_m2sPipe_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_m2sPipe_payload_state_element;
  reg                 AddRoundConstantStage_output_rValid;
  reg        [6:0]    AddRoundConstantStage_output_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_rData_state_size;
  reg        [5:0]    AddRoundConstantStage_output_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_rData_state_element;
  wire                when_Stream_l342;
  wire                AddRoundConstantStage_output_m2sPipe_input_valid;
  wire                AddRoundConstantStage_output_m2sPipe_input_ready;
  wire       [6:0]    AddRoundConstantStage_output_m2sPipe_input_payload_round_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_input_payload_state_index;
  wire       [3:0]    AddRoundConstantStage_output_m2sPipe_input_payload_state_size;
  wire       [5:0]    AddRoundConstantStage_output_m2sPipe_input_payload_state_id;
  wire       [254:0]  AddRoundConstantStage_output_m2sPipe_input_payload_state_element;
  reg                 AddRoundConstantStage_output_m2sPipe_rValid;
  reg        [6:0]    AddRoundConstantStage_output_m2sPipe_rData_round_index;
  reg        [3:0]    AddRoundConstantStage_output_m2sPipe_rData_state_index;
  reg        [3:0]    AddRoundConstantStage_output_m2sPipe_rData_state_size;
  reg        [5:0]    AddRoundConstantStage_output_m2sPipe_rData_state_id;
  reg        [254:0]  AddRoundConstantStage_output_m2sPipe_rData_state_element;
  wire       [2:0]    _zz_SBox5Stage_DemuxSelect;
  wire       [2:0]    _zz_SBox5Stage_DemuxSelect_1;
  wire                _zz_SBox5Stage_DemuxSelect_2;
  wire                _zz_SBox5Stage_DemuxSelect_3;
  wire       [1:0]    SBox5Stage_DemuxSelect;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_valid;
  wire                AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_ready;
  wire       [1:0]    AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_payload;
  wire                _zz_SBox5Stage_output_valid;
  wire                _zz_io_pop_ready;
  wire                SBox5Stage_output_valid;
  reg                 SBox5Stage_output_ready;
  wire       [6:0]    SBox5Stage_output_payload_round_index;
  wire       [3:0]    SBox5Stage_output_payload_state_index;
  wire       [3:0]    SBox5Stage_output_payload_state_size;
  wire       [5:0]    SBox5Stage_output_payload_state_id;
  wire       [254:0]  SBox5Stage_output_payload_state_element;
  wire                SBox5Stage_output_m2sPipe_valid;
  wire                SBox5Stage_output_m2sPipe_ready;
  wire       [6:0]    SBox5Stage_output_m2sPipe_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_payload_state_size;
  wire       [5:0]    SBox5Stage_output_m2sPipe_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_payload_state_element;
  reg                 SBox5Stage_output_rValid;
  reg        [6:0]    SBox5Stage_output_rData_round_index;
  reg        [3:0]    SBox5Stage_output_rData_state_index;
  reg        [3:0]    SBox5Stage_output_rData_state_size;
  reg        [5:0]    SBox5Stage_output_rData_state_id;
  reg        [254:0]  SBox5Stage_output_rData_state_element;
  wire                when_Stream_l342_1;
  wire                SBox5Stage_output_m2sPipe_input_valid;
  wire                SBox5Stage_output_m2sPipe_input_ready;
  wire       [6:0]    SBox5Stage_output_m2sPipe_input_payload_round_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_payload_state_index;
  wire       [3:0]    SBox5Stage_output_m2sPipe_input_payload_state_size;
  wire       [5:0]    SBox5Stage_output_m2sPipe_input_payload_state_id;
  wire       [254:0]  SBox5Stage_output_m2sPipe_input_payload_state_element;
  reg                 SBox5Stage_output_m2sPipe_rValid;
  reg        [6:0]    SBox5Stage_output_m2sPipe_rData_round_index;
  reg        [3:0]    SBox5Stage_output_m2sPipe_rData_state_index;
  reg        [3:0]    SBox5Stage_output_m2sPipe_rData_state_size;
  reg        [5:0]    SBox5Stage_output_m2sPipe_rData_state_id;
  reg        [254:0]  SBox5Stage_output_m2sPipe_rData_state_element;
  wire       [2:0]    _zz_MDSMixStage_DemuxSelect;
  wire       [2:0]    _zz_MDSMixStage_DemuxSelect_1;
  wire                _zz_MDSMixStage_DemuxSelect_2;
  wire                _zz_MDSMixStage_DemuxSelect_3;
  wire       [1:0]    MDSMixStage_DemuxSelect;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_valid;
  wire                SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_ready;
  wire       [1:0]    SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_payload;
  wire                _zz_MDSMixStage_output_valid;
  wire                _zz_io_pop_ready_1;
  wire                MDSMixStage_output_valid;
  wire                MDSMixStage_output_ready;
  wire       [6:0]    MDSMixStage_output_payload_round_index;
  wire       [3:0]    MDSMixStage_output_payload_state_size;
  wire       [5:0]    MDSMixStage_output_payload_state_id;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_0;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_1;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_2;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_3;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_4;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_5;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_6;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_7;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_8;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_9;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_10;
  wire       [254:0]  MDSMixStage_output_payload_state_elements_11;

  assign _zz__zz_SBox5Stage_DemuxSelect_1 = (_zz_SBox5Stage_DemuxSelect - 3'b001);
  assign _zz__zz_MDSMixStage_DemuxSelect_1 = (_zz_MDSMixStage_DemuxSelect - 3'b001);
  RoundConstants AddRoundConstantStage_roundConstants_t3 (
    .io_read_ports_0_data           (AddRoundConstantStage_roundConstants_t3_io_read_ports_0_data         ), //o
    .io_read_ports_0_t_index        (AddRoundConstantStage_roundConstants_t3_io_read_ports_0_t_index      ), //i
    .io_read_ports_0_round_index    (AddRoundConstantStage_roundConstants_t3_io_read_ports_0_round_index  )  //i
  );
  RoundConstants_1 AddRoundConstantStage_roundConstants_t5 (
    .io_read_ports_0_data           (AddRoundConstantStage_roundConstants_t5_io_read_ports_0_data         ), //o
    .io_read_ports_0_t_index        (AddRoundConstantStage_roundConstants_t5_io_read_ports_0_t_index      ), //i
    .io_read_ports_0_round_index    (AddRoundConstantStage_roundConstants_t5_io_read_ports_0_round_index  )  //i
  );
  RoundConstants_2 AddRoundConstantStage_roundConstants_t9 (
    .io_read_ports_0_data           (AddRoundConstantStage_roundConstants_t9_io_read_ports_0_data  ), //o
    .io_read_ports_0_t_index        (io_input_payload_state_index                                  ), //i
    .io_read_ports_0_round_index    (io_input_payload_round_index                                  )  //i
  );
  RoundConstants_3 AddRoundConstantStage_roundConstants_t12 (
    .io_read_ports_0_data           (AddRoundConstantStage_roundConstants_t12_io_read_ports_0_data  ), //o
    .io_read_ports_0_t_index        (io_input_payload_state_index                                   ), //i
    .io_read_ports_0_round_index    (io_input_payload_round_index                                   )  //i
  );
  ModAdder AddRoundConstantStage_modAdder (
    .op1_i    (io_input_payload_state_element        ), //i
    .op2_i    (AddRoundConstantStage_modAdder_op2_i  ), //i
    .res_o    (AddRoundConstantStage_modAdder_res_o  )  //o
  );
  SBox5 SBox5Stage_SBox5Insts_0 (
    .io_input_valid                     (streamDemux_2_io_outputs_0_valid                         ), //i
    .io_input_ready                     (SBox5Stage_SBox5Insts_0_io_input_ready                   ), //o
    .io_input_payload_round_index       (streamDemux_2_io_outputs_0_payload_round_index           ), //i
    .io_input_payload_state_index       (streamDemux_2_io_outputs_0_payload_state_index           ), //i
    .io_input_payload_state_size        (streamDemux_2_io_outputs_0_payload_state_size            ), //i
    .io_input_payload_state_id          (streamDemux_2_io_outputs_0_payload_state_id              ), //i
    .io_input_payload_state_element     (streamDemux_2_io_outputs_0_payload_state_element         ), //i
    .io_output_valid                    (SBox5Stage_SBox5Insts_0_io_output_valid                  ), //o
    .io_output_ready                    (streamMux_2_io_inputs_0_ready                            ), //i
    .io_output_payload_round_index      (SBox5Stage_SBox5Insts_0_io_output_payload_round_index    ), //o
    .io_output_payload_state_index      (SBox5Stage_SBox5Insts_0_io_output_payload_state_index    ), //o
    .io_output_payload_state_size       (SBox5Stage_SBox5Insts_0_io_output_payload_state_size     ), //o
    .io_output_payload_state_id         (SBox5Stage_SBox5Insts_0_io_output_payload_state_id       ), //o
    .io_output_payload_state_element    (SBox5Stage_SBox5Insts_0_io_output_payload_state_element  ), //o
    .reset                              (reset                                                    ), //i
    .clk                                (clk                                                      )  //i
  );
  SBox5 SBox5Stage_SBox5Insts_1 (
    .io_input_valid                     (streamDemux_2_io_outputs_1_valid                         ), //i
    .io_input_ready                     (SBox5Stage_SBox5Insts_1_io_input_ready                   ), //o
    .io_input_payload_round_index       (streamDemux_2_io_outputs_1_payload_round_index           ), //i
    .io_input_payload_state_index       (streamDemux_2_io_outputs_1_payload_state_index           ), //i
    .io_input_payload_state_size        (streamDemux_2_io_outputs_1_payload_state_size            ), //i
    .io_input_payload_state_id          (streamDemux_2_io_outputs_1_payload_state_id              ), //i
    .io_input_payload_state_element     (streamDemux_2_io_outputs_1_payload_state_element         ), //i
    .io_output_valid                    (SBox5Stage_SBox5Insts_1_io_output_valid                  ), //o
    .io_output_ready                    (streamMux_2_io_inputs_1_ready                            ), //i
    .io_output_payload_round_index      (SBox5Stage_SBox5Insts_1_io_output_payload_round_index    ), //o
    .io_output_payload_state_index      (SBox5Stage_SBox5Insts_1_io_output_payload_state_index    ), //o
    .io_output_payload_state_size       (SBox5Stage_SBox5Insts_1_io_output_payload_state_size     ), //o
    .io_output_payload_state_id         (SBox5Stage_SBox5Insts_1_io_output_payload_state_id       ), //o
    .io_output_payload_state_element    (SBox5Stage_SBox5Insts_1_io_output_payload_state_element  ), //o
    .reset                              (reset                                                    ), //i
    .clk                                (clk                                                      )  //i
  );
  SBox5 SBox5Stage_SBox5Insts_2 (
    .io_input_valid                     (streamDemux_2_io_outputs_2_valid                         ), //i
    .io_input_ready                     (SBox5Stage_SBox5Insts_2_io_input_ready                   ), //o
    .io_input_payload_round_index       (streamDemux_2_io_outputs_2_payload_round_index           ), //i
    .io_input_payload_state_index       (streamDemux_2_io_outputs_2_payload_state_index           ), //i
    .io_input_payload_state_size        (streamDemux_2_io_outputs_2_payload_state_size            ), //i
    .io_input_payload_state_id          (streamDemux_2_io_outputs_2_payload_state_id              ), //i
    .io_input_payload_state_element     (streamDemux_2_io_outputs_2_payload_state_element         ), //i
    .io_output_valid                    (SBox5Stage_SBox5Insts_2_io_output_valid                  ), //o
    .io_output_ready                    (streamMux_2_io_inputs_2_ready                            ), //i
    .io_output_payload_round_index      (SBox5Stage_SBox5Insts_2_io_output_payload_round_index    ), //o
    .io_output_payload_state_index      (SBox5Stage_SBox5Insts_2_io_output_payload_state_index    ), //o
    .io_output_payload_state_size       (SBox5Stage_SBox5Insts_2_io_output_payload_state_size     ), //o
    .io_output_payload_state_id         (SBox5Stage_SBox5Insts_2_io_output_payload_state_id       ), //o
    .io_output_payload_state_element    (SBox5Stage_SBox5Insts_2_io_output_payload_state_element  ), //o
    .reset                              (reset                                                    ), //i
    .clk                                (clk                                                      )  //i
  );
  StreamFork_3 AddRoundConstantStage_output_m2sPipe_input_fork (
    .io_input_valid                        (AddRoundConstantStage_output_m2sPipe_input_valid                                    ), //i
    .io_input_ready                        (AddRoundConstantStage_output_m2sPipe_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (AddRoundConstantStage_output_m2sPipe_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (AddRoundConstantStage_output_m2sPipe_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (AddRoundConstantStage_output_m2sPipe_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (AddRoundConstantStage_output_m2sPipe_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (AddRoundConstantStage_output_m2sPipe_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (streamDemux_2_io_input_ready                                                        ), //i
    .io_outputs_0_payload_round_index      (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_ready       ), //i
    .io_outputs_1_payload_round_index      (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  StreamDemux streamDemux_2 (
    .io_select                             (SBox5Stage_DemuxSelect                                                              ), //i
    .io_input_valid                        (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_valid                  ), //i
    .io_input_ready                        (streamDemux_2_io_input_ready                                                        ), //o
    .io_input_payload_round_index          (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_round_index    ), //i
    .io_input_payload_state_index          (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_index    ), //i
    .io_input_payload_state_size           (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_size     ), //i
    .io_input_payload_state_id             (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_id       ), //i
    .io_input_payload_state_element        (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_0_payload_state_element  ), //i
    .io_outputs_0_valid                    (streamDemux_2_io_outputs_0_valid                                                    ), //o
    .io_outputs_0_ready                    (SBox5Stage_SBox5Insts_0_io_input_ready                                              ), //i
    .io_outputs_0_payload_round_index      (streamDemux_2_io_outputs_0_payload_round_index                                      ), //o
    .io_outputs_0_payload_state_index      (streamDemux_2_io_outputs_0_payload_state_index                                      ), //o
    .io_outputs_0_payload_state_size       (streamDemux_2_io_outputs_0_payload_state_size                                       ), //o
    .io_outputs_0_payload_state_id         (streamDemux_2_io_outputs_0_payload_state_id                                         ), //o
    .io_outputs_0_payload_state_element    (streamDemux_2_io_outputs_0_payload_state_element                                    ), //o
    .io_outputs_1_valid                    (streamDemux_2_io_outputs_1_valid                                                    ), //o
    .io_outputs_1_ready                    (SBox5Stage_SBox5Insts_1_io_input_ready                                              ), //i
    .io_outputs_1_payload_round_index      (streamDemux_2_io_outputs_1_payload_round_index                                      ), //o
    .io_outputs_1_payload_state_index      (streamDemux_2_io_outputs_1_payload_state_index                                      ), //o
    .io_outputs_1_payload_state_size       (streamDemux_2_io_outputs_1_payload_state_size                                       ), //o
    .io_outputs_1_payload_state_id         (streamDemux_2_io_outputs_1_payload_state_id                                         ), //o
    .io_outputs_1_payload_state_element    (streamDemux_2_io_outputs_1_payload_state_element                                    ), //o
    .io_outputs_2_valid                    (streamDemux_2_io_outputs_2_valid                                                    ), //o
    .io_outputs_2_ready                    (SBox5Stage_SBox5Insts_2_io_input_ready                                              ), //i
    .io_outputs_2_payload_round_index      (streamDemux_2_io_outputs_2_payload_round_index                                      ), //o
    .io_outputs_2_payload_state_index      (streamDemux_2_io_outputs_2_payload_state_index                                      ), //o
    .io_outputs_2_payload_state_size       (streamDemux_2_io_outputs_2_payload_state_size                                       ), //o
    .io_outputs_2_payload_state_id         (streamDemux_2_io_outputs_2_payload_state_id                                         ), //o
    .io_outputs_2_payload_state_element    (streamDemux_2_io_outputs_2_payload_state_element                                    )  //o
  );
  StreamFifoLowLatency AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo (
    .io_push_valid      (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_valid                ), //i
    .io_push_ready      (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_push_ready   ), //o
    .io_push_payload    (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_payload              ), //i
    .io_pop_valid       (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_valid    ), //o
    .io_pop_ready       (_zz_io_pop_ready                                                                             ), //i
    .io_pop_payload     (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_payload  ), //o
    .io_flush           (1'b0                                                                                         ), //i
    .io_occupancy       (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_occupancy    ), //o
    .clk                (clk                                                                                          ), //i
    .reset              (reset                                                                                        )  //i
  );
  StreamMux streamMux_2 (
    .io_select                            (AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_payload  ), //i
    .io_inputs_0_valid                    (SBox5Stage_SBox5Insts_0_io_output_valid                                                      ), //i
    .io_inputs_0_ready                    (streamMux_2_io_inputs_0_ready                                                                ), //o
    .io_inputs_0_payload_round_index      (SBox5Stage_SBox5Insts_0_io_output_payload_round_index                                        ), //i
    .io_inputs_0_payload_state_index      (SBox5Stage_SBox5Insts_0_io_output_payload_state_index                                        ), //i
    .io_inputs_0_payload_state_size       (SBox5Stage_SBox5Insts_0_io_output_payload_state_size                                         ), //i
    .io_inputs_0_payload_state_id         (SBox5Stage_SBox5Insts_0_io_output_payload_state_id                                           ), //i
    .io_inputs_0_payload_state_element    (SBox5Stage_SBox5Insts_0_io_output_payload_state_element                                      ), //i
    .io_inputs_1_valid                    (SBox5Stage_SBox5Insts_1_io_output_valid                                                      ), //i
    .io_inputs_1_ready                    (streamMux_2_io_inputs_1_ready                                                                ), //o
    .io_inputs_1_payload_round_index      (SBox5Stage_SBox5Insts_1_io_output_payload_round_index                                        ), //i
    .io_inputs_1_payload_state_index      (SBox5Stage_SBox5Insts_1_io_output_payload_state_index                                        ), //i
    .io_inputs_1_payload_state_size       (SBox5Stage_SBox5Insts_1_io_output_payload_state_size                                         ), //i
    .io_inputs_1_payload_state_id         (SBox5Stage_SBox5Insts_1_io_output_payload_state_id                                           ), //i
    .io_inputs_1_payload_state_element    (SBox5Stage_SBox5Insts_1_io_output_payload_state_element                                      ), //i
    .io_inputs_2_valid                    (SBox5Stage_SBox5Insts_2_io_output_valid                                                      ), //i
    .io_inputs_2_ready                    (streamMux_2_io_inputs_2_ready                                                                ), //o
    .io_inputs_2_payload_round_index      (SBox5Stage_SBox5Insts_2_io_output_payload_round_index                                        ), //i
    .io_inputs_2_payload_state_index      (SBox5Stage_SBox5Insts_2_io_output_payload_state_index                                        ), //i
    .io_inputs_2_payload_state_size       (SBox5Stage_SBox5Insts_2_io_output_payload_state_size                                         ), //i
    .io_inputs_2_payload_state_id         (SBox5Stage_SBox5Insts_2_io_output_payload_state_id                                           ), //i
    .io_inputs_2_payload_state_element    (SBox5Stage_SBox5Insts_2_io_output_payload_state_element                                      ), //i
    .io_output_valid                      (streamMux_2_io_output_valid                                                                  ), //o
    .io_output_ready                      (_zz_io_pop_ready                                                                             ), //i
    .io_output_payload_round_index        (streamMux_2_io_output_payload_round_index                                                    ), //o
    .io_output_payload_state_index        (streamMux_2_io_output_payload_state_index                                                    ), //o
    .io_output_payload_state_size         (streamMux_2_io_output_payload_state_size                                                     ), //o
    .io_output_payload_state_id           (streamMux_2_io_output_payload_state_id                                                       ), //o
    .io_output_payload_state_element      (streamMux_2_io_output_payload_state_element                                                  )  //o
  );
  MDSMatrixMultiplier MDSMixStage_matrixMultiplierInsts_0 (
    .io_input_valid                         (streamDemux_3_io_outputs_0_valid                                         ), //i
    .io_input_ready                         (MDSMixStage_matrixMultiplierInsts_0_io_input_ready                       ), //o
    .io_input_payload_round_index           (streamDemux_3_io_outputs_0_payload_round_index                           ), //i
    .io_input_payload_state_index           (streamDemux_3_io_outputs_0_payload_state_index                           ), //i
    .io_input_payload_state_size            (streamDemux_3_io_outputs_0_payload_state_size                            ), //i
    .io_input_payload_state_id              (streamDemux_3_io_outputs_0_payload_state_id                              ), //i
    .io_input_payload_state_element         (streamDemux_3_io_outputs_0_payload_state_element                         ), //i
    .io_output_valid                        (MDSMixStage_matrixMultiplierInsts_0_io_output_valid                      ), //o
    .io_output_ready                        (streamMux_3_io_inputs_0_ready                                            ), //i
    .io_output_payload_round_index          (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_11  ), //o
    .reset                                  (reset                                                                    ), //i
    .clk                                    (clk                                                                      )  //i
  );
  MDSMatrixMultiplier_1 MDSMixStage_matrixMultiplierInsts_1 (
    .io_input_valid                         (streamDemux_3_io_outputs_1_valid                                         ), //i
    .io_input_ready                         (MDSMixStage_matrixMultiplierInsts_1_io_input_ready                       ), //o
    .io_input_payload_round_index           (streamDemux_3_io_outputs_1_payload_round_index                           ), //i
    .io_input_payload_state_index           (streamDemux_3_io_outputs_1_payload_state_index                           ), //i
    .io_input_payload_state_size            (streamDemux_3_io_outputs_1_payload_state_size                            ), //i
    .io_input_payload_state_id              (streamDemux_3_io_outputs_1_payload_state_id                              ), //i
    .io_input_payload_state_element         (streamDemux_3_io_outputs_1_payload_state_element                         ), //i
    .io_output_valid                        (MDSMixStage_matrixMultiplierInsts_1_io_output_valid                      ), //o
    .io_output_ready                        (streamMux_3_io_inputs_1_ready                                            ), //i
    .io_output_payload_round_index          (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_11  ), //o
    .reset                                  (reset                                                                    ), //i
    .clk                                    (clk                                                                      )  //i
  );
  MDSMatrixMultiplier_2 MDSMixStage_matrixMultiplierInsts_2 (
    .io_input_valid                         (streamDemux_3_io_outputs_2_valid                                         ), //i
    .io_input_ready                         (MDSMixStage_matrixMultiplierInsts_2_io_input_ready                       ), //o
    .io_input_payload_round_index           (streamDemux_3_io_outputs_2_payload_round_index                           ), //i
    .io_input_payload_state_index           (streamDemux_3_io_outputs_2_payload_state_index                           ), //i
    .io_input_payload_state_size            (streamDemux_3_io_outputs_2_payload_state_size                            ), //i
    .io_input_payload_state_id              (streamDemux_3_io_outputs_2_payload_state_id                              ), //i
    .io_input_payload_state_element         (streamDemux_3_io_outputs_2_payload_state_element                         ), //i
    .io_output_valid                        (MDSMixStage_matrixMultiplierInsts_2_io_output_valid                      ), //o
    .io_output_ready                        (streamMux_3_io_inputs_2_ready                                            ), //i
    .io_output_payload_round_index          (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_round_index        ), //o
    .io_output_payload_state_size           (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_size         ), //o
    .io_output_payload_state_id             (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_id           ), //o
    .io_output_payload_state_elements_0     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_0   ), //o
    .io_output_payload_state_elements_1     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_1   ), //o
    .io_output_payload_state_elements_2     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_2   ), //o
    .io_output_payload_state_elements_3     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_3   ), //o
    .io_output_payload_state_elements_4     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_4   ), //o
    .io_output_payload_state_elements_5     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_5   ), //o
    .io_output_payload_state_elements_6     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_6   ), //o
    .io_output_payload_state_elements_7     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_7   ), //o
    .io_output_payload_state_elements_8     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_8   ), //o
    .io_output_payload_state_elements_9     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_9   ), //o
    .io_output_payload_state_elements_10    (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_10  ), //o
    .io_output_payload_state_elements_11    (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_11  ), //o
    .reset                                  (reset                                                                    ), //i
    .clk                                    (clk                                                                      )  //i
  );
  StreamFork_3 SBox5Stage_output_m2sPipe_input_fork (
    .io_input_valid                        (SBox5Stage_output_m2sPipe_input_valid                                    ), //i
    .io_input_ready                        (SBox5Stage_output_m2sPipe_input_fork_io_input_ready                      ), //o
    .io_input_payload_round_index          (SBox5Stage_output_m2sPipe_input_payload_round_index                      ), //i
    .io_input_payload_state_index          (SBox5Stage_output_m2sPipe_input_payload_state_index                      ), //i
    .io_input_payload_state_size           (SBox5Stage_output_m2sPipe_input_payload_state_size                       ), //i
    .io_input_payload_state_id             (SBox5Stage_output_m2sPipe_input_payload_state_id                         ), //i
    .io_input_payload_state_element        (SBox5Stage_output_m2sPipe_input_payload_state_element                    ), //i
    .io_outputs_0_valid                    (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready                    (streamDemux_3_io_input_ready                                             ), //i
    .io_outputs_0_payload_round_index      (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_round_index    ), //o
    .io_outputs_0_payload_state_index      (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_index    ), //o
    .io_outputs_0_payload_state_size       (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_size     ), //o
    .io_outputs_0_payload_state_id         (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_id       ), //o
    .io_outputs_0_payload_state_element    (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_element  ), //o
    .io_outputs_1_valid                    (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready                    (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_ready       ), //i
    .io_outputs_1_payload_round_index      (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_round_index    ), //o
    .io_outputs_1_payload_state_index      (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_index    ), //o
    .io_outputs_1_payload_state_size       (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_size     ), //o
    .io_outputs_1_payload_state_id         (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_id       ), //o
    .io_outputs_1_payload_state_element    (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_payload_state_element  )  //o
  );
  StreamDemux streamDemux_3 (
    .io_select                             (MDSMixStage_DemuxSelect                                                  ), //i
    .io_input_valid                        (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_valid                  ), //i
    .io_input_ready                        (streamDemux_3_io_input_ready                                             ), //o
    .io_input_payload_round_index          (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_round_index    ), //i
    .io_input_payload_state_index          (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_index    ), //i
    .io_input_payload_state_size           (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_size     ), //i
    .io_input_payload_state_id             (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_id       ), //i
    .io_input_payload_state_element        (SBox5Stage_output_m2sPipe_input_fork_io_outputs_0_payload_state_element  ), //i
    .io_outputs_0_valid                    (streamDemux_3_io_outputs_0_valid                                         ), //o
    .io_outputs_0_ready                    (MDSMixStage_matrixMultiplierInsts_0_io_input_ready                       ), //i
    .io_outputs_0_payload_round_index      (streamDemux_3_io_outputs_0_payload_round_index                           ), //o
    .io_outputs_0_payload_state_index      (streamDemux_3_io_outputs_0_payload_state_index                           ), //o
    .io_outputs_0_payload_state_size       (streamDemux_3_io_outputs_0_payload_state_size                            ), //o
    .io_outputs_0_payload_state_id         (streamDemux_3_io_outputs_0_payload_state_id                              ), //o
    .io_outputs_0_payload_state_element    (streamDemux_3_io_outputs_0_payload_state_element                         ), //o
    .io_outputs_1_valid                    (streamDemux_3_io_outputs_1_valid                                         ), //o
    .io_outputs_1_ready                    (MDSMixStage_matrixMultiplierInsts_1_io_input_ready                       ), //i
    .io_outputs_1_payload_round_index      (streamDemux_3_io_outputs_1_payload_round_index                           ), //o
    .io_outputs_1_payload_state_index      (streamDemux_3_io_outputs_1_payload_state_index                           ), //o
    .io_outputs_1_payload_state_size       (streamDemux_3_io_outputs_1_payload_state_size                            ), //o
    .io_outputs_1_payload_state_id         (streamDemux_3_io_outputs_1_payload_state_id                              ), //o
    .io_outputs_1_payload_state_element    (streamDemux_3_io_outputs_1_payload_state_element                         ), //o
    .io_outputs_2_valid                    (streamDemux_3_io_outputs_2_valid                                         ), //o
    .io_outputs_2_ready                    (MDSMixStage_matrixMultiplierInsts_2_io_input_ready                       ), //i
    .io_outputs_2_payload_round_index      (streamDemux_3_io_outputs_2_payload_round_index                           ), //o
    .io_outputs_2_payload_state_index      (streamDemux_3_io_outputs_2_payload_state_index                           ), //o
    .io_outputs_2_payload_state_size       (streamDemux_3_io_outputs_2_payload_state_size                            ), //o
    .io_outputs_2_payload_state_id         (streamDemux_3_io_outputs_2_payload_state_id                              ), //o
    .io_outputs_2_payload_state_element    (streamDemux_3_io_outputs_2_payload_state_element                         )  //o
  );
  StreamFifoLowLatency_1 SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo (
    .io_push_valid      (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_valid                ), //i
    .io_push_ready      (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_push_ready   ), //o
    .io_push_payload    (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_payload              ), //i
    .io_pop_valid       (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_valid    ), //o
    .io_pop_ready       (_zz_io_pop_ready_1                                                                ), //i
    .io_pop_payload     (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_payload  ), //o
    .io_flush           (1'b0                                                                              ), //i
    .io_occupancy       (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_occupancy    ), //o
    .clk                (clk                                                                               ), //i
    .reset              (reset                                                                             )  //i
  );
  StreamMux_1 streamMux_3 (
    .io_select                                (SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_payload  ), //i
    .io_inputs_0_valid                        (MDSMixStage_matrixMultiplierInsts_0_io_output_valid                               ), //i
    .io_inputs_0_ready                        (streamMux_3_io_inputs_0_ready                                                     ), //o
    .io_inputs_0_payload_round_index          (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_round_index                 ), //i
    .io_inputs_0_payload_state_size           (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_size                  ), //i
    .io_inputs_0_payload_state_id             (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_id                    ), //i
    .io_inputs_0_payload_state_elements_0     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_0            ), //i
    .io_inputs_0_payload_state_elements_1     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_1            ), //i
    .io_inputs_0_payload_state_elements_2     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_2            ), //i
    .io_inputs_0_payload_state_elements_3     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_3            ), //i
    .io_inputs_0_payload_state_elements_4     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_4            ), //i
    .io_inputs_0_payload_state_elements_5     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_5            ), //i
    .io_inputs_0_payload_state_elements_6     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_6            ), //i
    .io_inputs_0_payload_state_elements_7     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_7            ), //i
    .io_inputs_0_payload_state_elements_8     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_8            ), //i
    .io_inputs_0_payload_state_elements_9     (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_9            ), //i
    .io_inputs_0_payload_state_elements_10    (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_10           ), //i
    .io_inputs_0_payload_state_elements_11    (MDSMixStage_matrixMultiplierInsts_0_io_output_payload_state_elements_11           ), //i
    .io_inputs_1_valid                        (MDSMixStage_matrixMultiplierInsts_1_io_output_valid                               ), //i
    .io_inputs_1_ready                        (streamMux_3_io_inputs_1_ready                                                     ), //o
    .io_inputs_1_payload_round_index          (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_round_index                 ), //i
    .io_inputs_1_payload_state_size           (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_size                  ), //i
    .io_inputs_1_payload_state_id             (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_id                    ), //i
    .io_inputs_1_payload_state_elements_0     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_0            ), //i
    .io_inputs_1_payload_state_elements_1     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_1            ), //i
    .io_inputs_1_payload_state_elements_2     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_2            ), //i
    .io_inputs_1_payload_state_elements_3     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_3            ), //i
    .io_inputs_1_payload_state_elements_4     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_4            ), //i
    .io_inputs_1_payload_state_elements_5     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_5            ), //i
    .io_inputs_1_payload_state_elements_6     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_6            ), //i
    .io_inputs_1_payload_state_elements_7     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_7            ), //i
    .io_inputs_1_payload_state_elements_8     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_8            ), //i
    .io_inputs_1_payload_state_elements_9     (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_9            ), //i
    .io_inputs_1_payload_state_elements_10    (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_10           ), //i
    .io_inputs_1_payload_state_elements_11    (MDSMixStage_matrixMultiplierInsts_1_io_output_payload_state_elements_11           ), //i
    .io_inputs_2_valid                        (MDSMixStage_matrixMultiplierInsts_2_io_output_valid                               ), //i
    .io_inputs_2_ready                        (streamMux_3_io_inputs_2_ready                                                     ), //o
    .io_inputs_2_payload_round_index          (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_round_index                 ), //i
    .io_inputs_2_payload_state_size           (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_size                  ), //i
    .io_inputs_2_payload_state_id             (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_id                    ), //i
    .io_inputs_2_payload_state_elements_0     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_0            ), //i
    .io_inputs_2_payload_state_elements_1     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_1            ), //i
    .io_inputs_2_payload_state_elements_2     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_2            ), //i
    .io_inputs_2_payload_state_elements_3     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_3            ), //i
    .io_inputs_2_payload_state_elements_4     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_4            ), //i
    .io_inputs_2_payload_state_elements_5     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_5            ), //i
    .io_inputs_2_payload_state_elements_6     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_6            ), //i
    .io_inputs_2_payload_state_elements_7     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_7            ), //i
    .io_inputs_2_payload_state_elements_8     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_8            ), //i
    .io_inputs_2_payload_state_elements_9     (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_9            ), //i
    .io_inputs_2_payload_state_elements_10    (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_10           ), //i
    .io_inputs_2_payload_state_elements_11    (MDSMixStage_matrixMultiplierInsts_2_io_output_payload_state_elements_11           ), //i
    .io_output_valid                          (streamMux_3_io_output_valid                                                       ), //o
    .io_output_ready                          (_zz_io_pop_ready_1                                                                ), //i
    .io_output_payload_round_index            (streamMux_3_io_output_payload_round_index                                         ), //o
    .io_output_payload_state_size             (streamMux_3_io_output_payload_state_size                                          ), //o
    .io_output_payload_state_id               (streamMux_3_io_output_payload_state_id                                            ), //o
    .io_output_payload_state_elements_0       (streamMux_3_io_output_payload_state_elements_0                                    ), //o
    .io_output_payload_state_elements_1       (streamMux_3_io_output_payload_state_elements_1                                    ), //o
    .io_output_payload_state_elements_2       (streamMux_3_io_output_payload_state_elements_2                                    ), //o
    .io_output_payload_state_elements_3       (streamMux_3_io_output_payload_state_elements_3                                    ), //o
    .io_output_payload_state_elements_4       (streamMux_3_io_output_payload_state_elements_4                                    ), //o
    .io_output_payload_state_elements_5       (streamMux_3_io_output_payload_state_elements_5                                    ), //o
    .io_output_payload_state_elements_6       (streamMux_3_io_output_payload_state_elements_6                                    ), //o
    .io_output_payload_state_elements_7       (streamMux_3_io_output_payload_state_elements_7                                    ), //o
    .io_output_payload_state_elements_8       (streamMux_3_io_output_payload_state_elements_8                                    ), //o
    .io_output_payload_state_elements_9       (streamMux_3_io_output_payload_state_elements_9                                    ), //o
    .io_output_payload_state_elements_10      (streamMux_3_io_output_payload_state_elements_10                                   ), //o
    .io_output_payload_state_elements_11      (streamMux_3_io_output_payload_state_elements_11                                   )  //o
  );
  assign AddRoundConstantStage_roundConstants_t3_io_read_ports_0_t_index = io_input_payload_state_index[1:0];
  assign AddRoundConstantStage_roundConstants_t5_io_read_ports_0_t_index = io_input_payload_state_index[2:0];
  assign AddRoundConstantStage_roundConstants_t3_io_read_ports_0_round_index = io_input_payload_round_index[5:0];
  assign AddRoundConstantStage_roundConstants_t5_io_read_ports_0_round_index = io_input_payload_round_index[5:0];
  always @(*) begin
    case(io_input_payload_state_size)
      4'b0011 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t3_io_read_ports_0_data;
      end
      4'b0101 : begin
        if(when_PoseidonThread_l46) begin
          AddRoundConstantStage_modAdder_op2_i = 255'h0;
        end else begin
          AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t5_io_read_ports_0_data;
        end
      end
      4'b1001 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t9_io_read_ports_0_data;
      end
      4'b1100 : begin
        AddRoundConstantStage_modAdder_op2_i = AddRoundConstantStage_roundConstants_t12_io_read_ports_0_data;
      end
      default : begin
        AddRoundConstantStage_modAdder_op2_i = 255'h0;
      end
    endcase
  end

  assign when_PoseidonThread_l46 = (io_input_payload_state_index == 4'b0101);
  assign AddRoundConstantStage_output_valid = io_input_valid;
  assign io_input_ready = AddRoundConstantStage_output_ready;
  assign AddRoundConstantStage_output_payload_round_index = io_input_payload_round_index;
  assign AddRoundConstantStage_output_payload_state_index = io_input_payload_state_index;
  assign AddRoundConstantStage_output_payload_state_size = io_input_payload_state_size;
  assign AddRoundConstantStage_output_payload_state_id = io_input_payload_state_id;
  always @(*) begin
    AddRoundConstantStage_output_payload_state_element = io_input_payload_state_element;
    AddRoundConstantStage_output_payload_state_element = AddRoundConstantStage_modAdder_res_o;
  end

  always @(*) begin
    AddRoundConstantStage_output_ready = AddRoundConstantStage_output_m2sPipe_ready;
    if(when_Stream_l342) begin
      AddRoundConstantStage_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! AddRoundConstantStage_output_m2sPipe_valid);
  assign AddRoundConstantStage_output_m2sPipe_valid = AddRoundConstantStage_output_rValid;
  assign AddRoundConstantStage_output_m2sPipe_payload_round_index = AddRoundConstantStage_output_rData_round_index;
  assign AddRoundConstantStage_output_m2sPipe_payload_state_index = AddRoundConstantStage_output_rData_state_index;
  assign AddRoundConstantStage_output_m2sPipe_payload_state_size = AddRoundConstantStage_output_rData_state_size;
  assign AddRoundConstantStage_output_m2sPipe_payload_state_id = AddRoundConstantStage_output_rData_state_id;
  assign AddRoundConstantStage_output_m2sPipe_payload_state_element = AddRoundConstantStage_output_rData_state_element;
  assign AddRoundConstantStage_output_m2sPipe_ready = (! AddRoundConstantStage_output_m2sPipe_rValid);
  assign AddRoundConstantStage_output_m2sPipe_input_valid = (AddRoundConstantStage_output_m2sPipe_valid || AddRoundConstantStage_output_m2sPipe_rValid);
  assign AddRoundConstantStage_output_m2sPipe_input_payload_round_index = (AddRoundConstantStage_output_m2sPipe_rValid ? AddRoundConstantStage_output_m2sPipe_rData_round_index : AddRoundConstantStage_output_m2sPipe_payload_round_index);
  assign AddRoundConstantStage_output_m2sPipe_input_payload_state_index = (AddRoundConstantStage_output_m2sPipe_rValid ? AddRoundConstantStage_output_m2sPipe_rData_state_index : AddRoundConstantStage_output_m2sPipe_payload_state_index);
  assign AddRoundConstantStage_output_m2sPipe_input_payload_state_size = (AddRoundConstantStage_output_m2sPipe_rValid ? AddRoundConstantStage_output_m2sPipe_rData_state_size : AddRoundConstantStage_output_m2sPipe_payload_state_size);
  assign AddRoundConstantStage_output_m2sPipe_input_payload_state_id = (AddRoundConstantStage_output_m2sPipe_rValid ? AddRoundConstantStage_output_m2sPipe_rData_state_id : AddRoundConstantStage_output_m2sPipe_payload_state_id);
  assign AddRoundConstantStage_output_m2sPipe_input_payload_state_element = (AddRoundConstantStage_output_m2sPipe_rValid ? AddRoundConstantStage_output_m2sPipe_rData_state_element : AddRoundConstantStage_output_m2sPipe_payload_state_element);
  assign AddRoundConstantStage_output_m2sPipe_input_ready = AddRoundConstantStage_output_m2sPipe_input_fork_io_input_ready;
  assign _zz_SBox5Stage_DemuxSelect = {SBox5Stage_SBox5Insts_2_io_input_ready,{SBox5Stage_SBox5Insts_1_io_input_ready,SBox5Stage_SBox5Insts_0_io_input_ready}};
  assign _zz_SBox5Stage_DemuxSelect_1 = (_zz_SBox5Stage_DemuxSelect & (~ _zz__zz_SBox5Stage_DemuxSelect_1));
  assign _zz_SBox5Stage_DemuxSelect_2 = _zz_SBox5Stage_DemuxSelect_1[1];
  assign _zz_SBox5Stage_DemuxSelect_3 = _zz_SBox5Stage_DemuxSelect_1[2];
  assign SBox5Stage_DemuxSelect = {_zz_SBox5Stage_DemuxSelect_3,_zz_SBox5Stage_DemuxSelect_2};
  assign AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_valid = AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_valid;
  assign AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_payload = SBox5Stage_DemuxSelect;
  assign AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_ready = AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  assign _zz_io_pop_ready = (_zz_SBox5Stage_output_valid && SBox5Stage_output_ready);
  assign _zz_SBox5Stage_output_valid = (streamMux_2_io_output_valid && AddRoundConstantStage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_valid);
  assign SBox5Stage_output_valid = _zz_SBox5Stage_output_valid;
  assign SBox5Stage_output_payload_round_index = streamMux_2_io_output_payload_round_index;
  assign SBox5Stage_output_payload_state_index = streamMux_2_io_output_payload_state_index;
  assign SBox5Stage_output_payload_state_size = streamMux_2_io_output_payload_state_size;
  assign SBox5Stage_output_payload_state_id = streamMux_2_io_output_payload_state_id;
  assign SBox5Stage_output_payload_state_element = streamMux_2_io_output_payload_state_element;
  always @(*) begin
    SBox5Stage_output_ready = SBox5Stage_output_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      SBox5Stage_output_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! SBox5Stage_output_m2sPipe_valid);
  assign SBox5Stage_output_m2sPipe_valid = SBox5Stage_output_rValid;
  assign SBox5Stage_output_m2sPipe_payload_round_index = SBox5Stage_output_rData_round_index;
  assign SBox5Stage_output_m2sPipe_payload_state_index = SBox5Stage_output_rData_state_index;
  assign SBox5Stage_output_m2sPipe_payload_state_size = SBox5Stage_output_rData_state_size;
  assign SBox5Stage_output_m2sPipe_payload_state_id = SBox5Stage_output_rData_state_id;
  assign SBox5Stage_output_m2sPipe_payload_state_element = SBox5Stage_output_rData_state_element;
  assign SBox5Stage_output_m2sPipe_ready = (! SBox5Stage_output_m2sPipe_rValid);
  assign SBox5Stage_output_m2sPipe_input_valid = (SBox5Stage_output_m2sPipe_valid || SBox5Stage_output_m2sPipe_rValid);
  assign SBox5Stage_output_m2sPipe_input_payload_round_index = (SBox5Stage_output_m2sPipe_rValid ? SBox5Stage_output_m2sPipe_rData_round_index : SBox5Stage_output_m2sPipe_payload_round_index);
  assign SBox5Stage_output_m2sPipe_input_payload_state_index = (SBox5Stage_output_m2sPipe_rValid ? SBox5Stage_output_m2sPipe_rData_state_index : SBox5Stage_output_m2sPipe_payload_state_index);
  assign SBox5Stage_output_m2sPipe_input_payload_state_size = (SBox5Stage_output_m2sPipe_rValid ? SBox5Stage_output_m2sPipe_rData_state_size : SBox5Stage_output_m2sPipe_payload_state_size);
  assign SBox5Stage_output_m2sPipe_input_payload_state_id = (SBox5Stage_output_m2sPipe_rValid ? SBox5Stage_output_m2sPipe_rData_state_id : SBox5Stage_output_m2sPipe_payload_state_id);
  assign SBox5Stage_output_m2sPipe_input_payload_state_element = (SBox5Stage_output_m2sPipe_rValid ? SBox5Stage_output_m2sPipe_rData_state_element : SBox5Stage_output_m2sPipe_payload_state_element);
  assign SBox5Stage_output_m2sPipe_input_ready = SBox5Stage_output_m2sPipe_input_fork_io_input_ready;
  assign _zz_MDSMixStage_DemuxSelect = {MDSMixStage_matrixMultiplierInsts_2_io_input_ready,{MDSMixStage_matrixMultiplierInsts_1_io_input_ready,MDSMixStage_matrixMultiplierInsts_0_io_input_ready}};
  assign _zz_MDSMixStage_DemuxSelect_1 = (_zz_MDSMixStage_DemuxSelect & (~ _zz__zz_MDSMixStage_DemuxSelect_1));
  assign _zz_MDSMixStage_DemuxSelect_2 = _zz_MDSMixStage_DemuxSelect_1[1];
  assign _zz_MDSMixStage_DemuxSelect_3 = _zz_MDSMixStage_DemuxSelect_1[2];
  assign MDSMixStage_DemuxSelect = {_zz_MDSMixStage_DemuxSelect_3,_zz_MDSMixStage_DemuxSelect_2};
  assign SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_valid = SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_valid;
  assign SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_payload = MDSMixStage_DemuxSelect;
  assign SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_ready = SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_push_ready;
  assign _zz_io_pop_ready_1 = (_zz_MDSMixStage_output_valid && MDSMixStage_output_ready);
  assign _zz_MDSMixStage_output_valid = (streamMux_3_io_output_valid && SBox5Stage_output_m2sPipe_input_fork_io_outputs_1_translated_fifo_io_pop_valid);
  assign MDSMixStage_output_valid = _zz_MDSMixStage_output_valid;
  assign MDSMixStage_output_payload_round_index = streamMux_3_io_output_payload_round_index;
  assign MDSMixStage_output_payload_state_size = streamMux_3_io_output_payload_state_size;
  assign MDSMixStage_output_payload_state_id = streamMux_3_io_output_payload_state_id;
  assign MDSMixStage_output_payload_state_elements_0 = streamMux_3_io_output_payload_state_elements_0;
  assign MDSMixStage_output_payload_state_elements_1 = streamMux_3_io_output_payload_state_elements_1;
  assign MDSMixStage_output_payload_state_elements_2 = streamMux_3_io_output_payload_state_elements_2;
  assign MDSMixStage_output_payload_state_elements_3 = streamMux_3_io_output_payload_state_elements_3;
  assign MDSMixStage_output_payload_state_elements_4 = streamMux_3_io_output_payload_state_elements_4;
  assign MDSMixStage_output_payload_state_elements_5 = streamMux_3_io_output_payload_state_elements_5;
  assign MDSMixStage_output_payload_state_elements_6 = streamMux_3_io_output_payload_state_elements_6;
  assign MDSMixStage_output_payload_state_elements_7 = streamMux_3_io_output_payload_state_elements_7;
  assign MDSMixStage_output_payload_state_elements_8 = streamMux_3_io_output_payload_state_elements_8;
  assign MDSMixStage_output_payload_state_elements_9 = streamMux_3_io_output_payload_state_elements_9;
  assign MDSMixStage_output_payload_state_elements_10 = streamMux_3_io_output_payload_state_elements_10;
  assign MDSMixStage_output_payload_state_elements_11 = streamMux_3_io_output_payload_state_elements_11;
  assign io_output_valid = MDSMixStage_output_valid;
  assign MDSMixStage_output_ready = io_output_ready;
  assign io_output_payload_round_index = MDSMixStage_output_payload_round_index;
  assign io_output_payload_state_size = MDSMixStage_output_payload_state_size;
  assign io_output_payload_state_id = MDSMixStage_output_payload_state_id;
  assign io_output_payload_state_elements_0 = MDSMixStage_output_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = MDSMixStage_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = MDSMixStage_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = MDSMixStage_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = MDSMixStage_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = MDSMixStage_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = MDSMixStage_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = MDSMixStage_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = MDSMixStage_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = MDSMixStage_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = MDSMixStage_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = MDSMixStage_output_payload_state_elements_11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      AddRoundConstantStage_output_rValid <= 1'b0;
      AddRoundConstantStage_output_m2sPipe_rValid <= 1'b0;
      SBox5Stage_output_rValid <= 1'b0;
      SBox5Stage_output_m2sPipe_rValid <= 1'b0;
    end else begin
      if(AddRoundConstantStage_output_ready) begin
        AddRoundConstantStage_output_rValid <= AddRoundConstantStage_output_valid;
      end
      if(AddRoundConstantStage_output_m2sPipe_valid) begin
        AddRoundConstantStage_output_m2sPipe_rValid <= 1'b1;
      end
      if(AddRoundConstantStage_output_m2sPipe_input_ready) begin
        AddRoundConstantStage_output_m2sPipe_rValid <= 1'b0;
      end
      if(SBox5Stage_output_ready) begin
        SBox5Stage_output_rValid <= SBox5Stage_output_valid;
      end
      if(SBox5Stage_output_m2sPipe_valid) begin
        SBox5Stage_output_m2sPipe_rValid <= 1'b1;
      end
      if(SBox5Stage_output_m2sPipe_input_ready) begin
        SBox5Stage_output_m2sPipe_rValid <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(AddRoundConstantStage_output_ready) begin
      AddRoundConstantStage_output_rData_round_index <= AddRoundConstantStage_output_payload_round_index;
      AddRoundConstantStage_output_rData_state_index <= AddRoundConstantStage_output_payload_state_index;
      AddRoundConstantStage_output_rData_state_size <= AddRoundConstantStage_output_payload_state_size;
      AddRoundConstantStage_output_rData_state_id <= AddRoundConstantStage_output_payload_state_id;
      AddRoundConstantStage_output_rData_state_element <= AddRoundConstantStage_output_payload_state_element;
    end
    if(AddRoundConstantStage_output_m2sPipe_ready) begin
      AddRoundConstantStage_output_m2sPipe_rData_round_index <= AddRoundConstantStage_output_m2sPipe_payload_round_index;
      AddRoundConstantStage_output_m2sPipe_rData_state_index <= AddRoundConstantStage_output_m2sPipe_payload_state_index;
      AddRoundConstantStage_output_m2sPipe_rData_state_size <= AddRoundConstantStage_output_m2sPipe_payload_state_size;
      AddRoundConstantStage_output_m2sPipe_rData_state_id <= AddRoundConstantStage_output_m2sPipe_payload_state_id;
      AddRoundConstantStage_output_m2sPipe_rData_state_element <= AddRoundConstantStage_output_m2sPipe_payload_state_element;
    end
    if(SBox5Stage_output_ready) begin
      SBox5Stage_output_rData_round_index <= SBox5Stage_output_payload_round_index;
      SBox5Stage_output_rData_state_index <= SBox5Stage_output_payload_state_index;
      SBox5Stage_output_rData_state_size <= SBox5Stage_output_payload_state_size;
      SBox5Stage_output_rData_state_id <= SBox5Stage_output_payload_state_id;
      SBox5Stage_output_rData_state_element <= SBox5Stage_output_payload_state_element;
    end
    if(SBox5Stage_output_m2sPipe_ready) begin
      SBox5Stage_output_m2sPipe_rData_round_index <= SBox5Stage_output_m2sPipe_payload_round_index;
      SBox5Stage_output_m2sPipe_rData_state_index <= SBox5Stage_output_m2sPipe_payload_state_index;
      SBox5Stage_output_m2sPipe_rData_state_size <= SBox5Stage_output_m2sPipe_payload_state_size;
      SBox5Stage_output_m2sPipe_rData_state_id <= SBox5Stage_output_m2sPipe_payload_state_id;
      SBox5Stage_output_m2sPipe_rData_state_element <= SBox5Stage_output_m2sPipe_payload_state_element;
    end
  end


endmodule

module StreamMux_1 (
  input      [1:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_round_index,
  input      [3:0]    io_inputs_0_payload_state_size,
  input      [5:0]    io_inputs_0_payload_state_id,
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
  input      [5:0]    io_inputs_1_payload_state_id,
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
  input      [5:0]    io_inputs_2_payload_state_id,
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
  output     [5:0]    io_output_payload_state_id,
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
  output     [254:0]  io_output_payload_state_elements_11
);
  reg                 _zz_io_output_valid;
  reg        [6:0]    _zz_io_output_payload_round_index;
  reg        [3:0]    _zz_io_output_payload_state_size;
  reg        [5:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_elements_0;
  reg        [254:0]  _zz_io_output_payload_state_elements_1;
  reg        [254:0]  _zz_io_output_payload_state_elements_2;
  reg        [254:0]  _zz_io_output_payload_state_elements_3;
  reg        [254:0]  _zz_io_output_payload_state_elements_4;
  reg        [254:0]  _zz_io_output_payload_state_elements_5;
  reg        [254:0]  _zz_io_output_payload_state_elements_6;
  reg        [254:0]  _zz_io_output_payload_state_elements_7;
  reg        [254:0]  _zz_io_output_payload_state_elements_8;
  reg        [254:0]  _zz_io_output_payload_state_elements_9;
  reg        [254:0]  _zz_io_output_payload_state_elements_10;
  reg        [254:0]  _zz_io_output_payload_state_elements_11;

  always @(*) begin
    case(io_select)
      2'b00 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload_round_index = io_inputs_0_payload_round_index;
        _zz_io_output_payload_state_size = io_inputs_0_payload_state_size;
        _zz_io_output_payload_state_id = io_inputs_0_payload_state_id;
        _zz_io_output_payload_state_elements_0 = io_inputs_0_payload_state_elements_0;
        _zz_io_output_payload_state_elements_1 = io_inputs_0_payload_state_elements_1;
        _zz_io_output_payload_state_elements_2 = io_inputs_0_payload_state_elements_2;
        _zz_io_output_payload_state_elements_3 = io_inputs_0_payload_state_elements_3;
        _zz_io_output_payload_state_elements_4 = io_inputs_0_payload_state_elements_4;
        _zz_io_output_payload_state_elements_5 = io_inputs_0_payload_state_elements_5;
        _zz_io_output_payload_state_elements_6 = io_inputs_0_payload_state_elements_6;
        _zz_io_output_payload_state_elements_7 = io_inputs_0_payload_state_elements_7;
        _zz_io_output_payload_state_elements_8 = io_inputs_0_payload_state_elements_8;
        _zz_io_output_payload_state_elements_9 = io_inputs_0_payload_state_elements_9;
        _zz_io_output_payload_state_elements_10 = io_inputs_0_payload_state_elements_10;
        _zz_io_output_payload_state_elements_11 = io_inputs_0_payload_state_elements_11;
      end
      2'b01 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload_round_index = io_inputs_1_payload_round_index;
        _zz_io_output_payload_state_size = io_inputs_1_payload_state_size;
        _zz_io_output_payload_state_id = io_inputs_1_payload_state_id;
        _zz_io_output_payload_state_elements_0 = io_inputs_1_payload_state_elements_0;
        _zz_io_output_payload_state_elements_1 = io_inputs_1_payload_state_elements_1;
        _zz_io_output_payload_state_elements_2 = io_inputs_1_payload_state_elements_2;
        _zz_io_output_payload_state_elements_3 = io_inputs_1_payload_state_elements_3;
        _zz_io_output_payload_state_elements_4 = io_inputs_1_payload_state_elements_4;
        _zz_io_output_payload_state_elements_5 = io_inputs_1_payload_state_elements_5;
        _zz_io_output_payload_state_elements_6 = io_inputs_1_payload_state_elements_6;
        _zz_io_output_payload_state_elements_7 = io_inputs_1_payload_state_elements_7;
        _zz_io_output_payload_state_elements_8 = io_inputs_1_payload_state_elements_8;
        _zz_io_output_payload_state_elements_9 = io_inputs_1_payload_state_elements_9;
        _zz_io_output_payload_state_elements_10 = io_inputs_1_payload_state_elements_10;
        _zz_io_output_payload_state_elements_11 = io_inputs_1_payload_state_elements_11;
      end
      default : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload_round_index = io_inputs_2_payload_round_index;
        _zz_io_output_payload_state_size = io_inputs_2_payload_state_size;
        _zz_io_output_payload_state_id = io_inputs_2_payload_state_id;
        _zz_io_output_payload_state_elements_0 = io_inputs_2_payload_state_elements_0;
        _zz_io_output_payload_state_elements_1 = io_inputs_2_payload_state_elements_1;
        _zz_io_output_payload_state_elements_2 = io_inputs_2_payload_state_elements_2;
        _zz_io_output_payload_state_elements_3 = io_inputs_2_payload_state_elements_3;
        _zz_io_output_payload_state_elements_4 = io_inputs_2_payload_state_elements_4;
        _zz_io_output_payload_state_elements_5 = io_inputs_2_payload_state_elements_5;
        _zz_io_output_payload_state_elements_6 = io_inputs_2_payload_state_elements_6;
        _zz_io_output_payload_state_elements_7 = io_inputs_2_payload_state_elements_7;
        _zz_io_output_payload_state_elements_8 = io_inputs_2_payload_state_elements_8;
        _zz_io_output_payload_state_elements_9 = io_inputs_2_payload_state_elements_9;
        _zz_io_output_payload_state_elements_10 = io_inputs_2_payload_state_elements_10;
        _zz_io_output_payload_state_elements_11 = io_inputs_2_payload_state_elements_11;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 2'b00) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 2'b01) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 2'b10) && io_output_ready);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload_round_index = _zz_io_output_payload_round_index;
  assign io_output_payload_state_size = _zz_io_output_payload_state_size;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_elements_0 = _zz_io_output_payload_state_elements_0;
  assign io_output_payload_state_elements_1 = _zz_io_output_payload_state_elements_1;
  assign io_output_payload_state_elements_2 = _zz_io_output_payload_state_elements_2;
  assign io_output_payload_state_elements_3 = _zz_io_output_payload_state_elements_3;
  assign io_output_payload_state_elements_4 = _zz_io_output_payload_state_elements_4;
  assign io_output_payload_state_elements_5 = _zz_io_output_payload_state_elements_5;
  assign io_output_payload_state_elements_6 = _zz_io_output_payload_state_elements_6;
  assign io_output_payload_state_elements_7 = _zz_io_output_payload_state_elements_7;
  assign io_output_payload_state_elements_8 = _zz_io_output_payload_state_elements_8;
  assign io_output_payload_state_elements_9 = _zz_io_output_payload_state_elements_9;
  assign io_output_payload_state_elements_10 = _zz_io_output_payload_state_elements_10;
  assign io_output_payload_state_elements_11 = _zz_io_output_payload_state_elements_11;

endmodule

module StreamFifoLowLatency_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [1:0]    io_push_payload,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg [1:0]    io_pop_payload,
  input               io_flush,
  output reg [3:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire       [1:0]    _zz_ram_port0;
  wire       [3:0]    _zz_pushPtr_valueNext;
  wire       [0:0]    _zz_pushPtr_valueNext_1;
  wire       [3:0]    _zz_popPtr_valueNext;
  wire       [0:0]    _zz_popPtr_valueNext_1;
  wire       [1:0]    _zz_ram_port;
  wire       [3:0]    _zz_io_occupancy;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [3:0]    pushPtr_valueNext;
  reg        [3:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [3:0]    popPtr_valueNext;
  reg        [3:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                when_Stream_l995;
  wire                when_Stream_l1008;
  wire       [3:0]    ptrDif;
  (* ram_style = "distributed" *) reg [1:0] ram [0:8];

  assign _zz_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign _zz_pushPtr_valueNext = {3'd0, _zz_pushPtr_valueNext_1};
  assign _zz_popPtr_valueNext_1 = popPtr_willIncrement;
  assign _zz_popPtr_valueNext = {3'd0, _zz_popPtr_valueNext_1};
  assign _zz_io_occupancy = (4'b1001 + ptrDif);
  assign _zz_ram_port = io_push_payload;
  assign _zz_ram_port0 = ram[popPtr_value];
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[pushPtr_value] <= _zz_ram_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 4'b1000);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    if(pushPtr_willOverflow) begin
      pushPtr_valueNext = 4'b0000;
    end else begin
      pushPtr_valueNext = (pushPtr_value + _zz_pushPtr_valueNext);
    end
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 4'b1000);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    if(popPtr_willOverflow) begin
      popPtr_valueNext = 4'b0000;
    end else begin
      popPtr_valueNext = (popPtr_value + _zz_popPtr_valueNext);
    end
    if(popPtr_willClear) begin
      popPtr_valueNext = 4'b0000;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign when_Stream_l995 = (! empty);
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload = _zz_ram_port0;
    end else begin
      io_pop_payload = io_push_payload;
    end
  end

  assign when_Stream_l1008 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  always @(*) begin
    if(ptrMatch) begin
      io_occupancy = (risingOccupancy ? 4'b1001 : 4'b0000);
    end else begin
      io_occupancy = ((popPtr_value < pushPtr_value) ? ptrDif : _zz_io_occupancy);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushPtr_value <= 4'b0000;
      popPtr_value <= 4'b0000;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(when_Stream_l1008) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

//StreamDemux replaced by StreamDemux

//StreamFork_3 replaced by StreamFork_3

module MDSMatrixMultiplier_2 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [5:0]    io_output_payload_state_id,
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
  reg        [5:0]    mulContext_state_id;
  wire                io_input_fire;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire       [3059:0] _zz_mulResJoined_translated_payload_state_elements_0;
  wire                mulResJoined_translated_valid;
  reg                 mulResJoined_translated_ready;
  wire       [6:0]    mulResJoined_translated_payload_round_index;
  wire       [3:0]    mulResJoined_translated_payload_state_size;
  wire       [5:0]    mulResJoined_translated_payload_state_id;
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
  wire       [5:0]    mulResJoined_translated_m2sPipe_payload_state_id;
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
  reg        [5:0]    mulResJoined_translated_rData_state_id;
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
  MDSMatrix_8 mdsMatrix_t3 (
    .io_data_ports_0    (mdsMatrix_t3_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t3_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t3_io_data_ports_2  ), //o
    .io_address_port    (mdsMatrix_t3_io_address_port  )  //i
  );
  MDSMatrix_9 mdsMatrix_t5 (
    .io_data_ports_0    (mdsMatrix_t5_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t5_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t5_io_data_ports_2  ), //o
    .io_data_ports_3    (mdsMatrix_t5_io_data_ports_3  ), //o
    .io_data_ports_4    (mdsMatrix_t5_io_data_ports_4  ), //o
    .io_address_port    (mdsMatrix_t5_io_address_port  )  //i
  );
  MDSMatrix_10 mdsMatrix_t9 (
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
  MDSMatrix_11 mdsMatrix_t12 (
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
      mulContext_state_id <= 6'h0;
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

module MDSMatrixMultiplier_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [5:0]    io_output_payload_state_id,
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
  reg        [5:0]    mulContext_state_id;
  wire                io_input_fire;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire       [3059:0] _zz_mulResJoined_translated_payload_state_elements_0;
  wire                mulResJoined_translated_valid;
  reg                 mulResJoined_translated_ready;
  wire       [6:0]    mulResJoined_translated_payload_round_index;
  wire       [3:0]    mulResJoined_translated_payload_state_size;
  wire       [5:0]    mulResJoined_translated_payload_state_id;
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
  wire       [5:0]    mulResJoined_translated_m2sPipe_payload_state_id;
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
  reg        [5:0]    mulResJoined_translated_rData_state_id;
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
  MDSMatrix_4 mdsMatrix_t3 (
    .io_data_ports_0    (mdsMatrix_t3_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t3_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t3_io_data_ports_2  ), //o
    .io_address_port    (mdsMatrix_t3_io_address_port  )  //i
  );
  MDSMatrix_5 mdsMatrix_t5 (
    .io_data_ports_0    (mdsMatrix_t5_io_data_ports_0  ), //o
    .io_data_ports_1    (mdsMatrix_t5_io_data_ports_1  ), //o
    .io_data_ports_2    (mdsMatrix_t5_io_data_ports_2  ), //o
    .io_data_ports_3    (mdsMatrix_t5_io_data_ports_3  ), //o
    .io_data_ports_4    (mdsMatrix_t5_io_data_ports_4  ), //o
    .io_address_port    (mdsMatrix_t5_io_address_port  )  //i
  );
  MDSMatrix_6 mdsMatrix_t9 (
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
  MDSMatrix_7 mdsMatrix_t12 (
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
      mulContext_state_id <= 6'h0;
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

module MDSMatrixMultiplier (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_size,
  output     [5:0]    io_output_payload_state_id,
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
  reg        [5:0]    mulContext_state_id;
  wire                io_input_fire;
  wire                mulResJoined_valid;
  wire                mulResJoined_ready;
  wire                mulResJoined_fire;
  wire       [3059:0] _zz_mulResJoined_translated_payload_state_elements_0;
  wire                mulResJoined_translated_valid;
  reg                 mulResJoined_translated_ready;
  wire       [6:0]    mulResJoined_translated_payload_round_index;
  wire       [3:0]    mulResJoined_translated_payload_state_size;
  wire       [5:0]    mulResJoined_translated_payload_state_id;
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
  wire       [5:0]    mulResJoined_translated_m2sPipe_payload_state_id;
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
  reg        [5:0]    mulResJoined_translated_rData_state_id;
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
      mulContext_state_id <= 6'h0;
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

module StreamMux (
  input      [1:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [6:0]    io_inputs_0_payload_round_index,
  input      [3:0]    io_inputs_0_payload_state_index,
  input      [3:0]    io_inputs_0_payload_state_size,
  input      [5:0]    io_inputs_0_payload_state_id,
  input      [254:0]  io_inputs_0_payload_state_element,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [6:0]    io_inputs_1_payload_round_index,
  input      [3:0]    io_inputs_1_payload_state_index,
  input      [3:0]    io_inputs_1_payload_state_size,
  input      [5:0]    io_inputs_1_payload_state_id,
  input      [254:0]  io_inputs_1_payload_state_element,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [6:0]    io_inputs_2_payload_round_index,
  input      [3:0]    io_inputs_2_payload_state_index,
  input      [3:0]    io_inputs_2_payload_state_size,
  input      [5:0]    io_inputs_2_payload_state_id,
  input      [254:0]  io_inputs_2_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_index,
  output     [3:0]    io_output_payload_state_size,
  output     [5:0]    io_output_payload_state_id,
  output     [254:0]  io_output_payload_state_element
);
  reg                 _zz_io_output_valid;
  reg        [6:0]    _zz_io_output_payload_round_index;
  reg        [3:0]    _zz_io_output_payload_state_index;
  reg        [3:0]    _zz_io_output_payload_state_size;
  reg        [5:0]    _zz_io_output_payload_state_id;
  reg        [254:0]  _zz_io_output_payload_state_element;

  always @(*) begin
    case(io_select)
      2'b00 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload_round_index = io_inputs_0_payload_round_index;
        _zz_io_output_payload_state_index = io_inputs_0_payload_state_index;
        _zz_io_output_payload_state_size = io_inputs_0_payload_state_size;
        _zz_io_output_payload_state_id = io_inputs_0_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_0_payload_state_element;
      end
      2'b01 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload_round_index = io_inputs_1_payload_round_index;
        _zz_io_output_payload_state_index = io_inputs_1_payload_state_index;
        _zz_io_output_payload_state_size = io_inputs_1_payload_state_size;
        _zz_io_output_payload_state_id = io_inputs_1_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_1_payload_state_element;
      end
      default : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload_round_index = io_inputs_2_payload_round_index;
        _zz_io_output_payload_state_index = io_inputs_2_payload_state_index;
        _zz_io_output_payload_state_size = io_inputs_2_payload_state_size;
        _zz_io_output_payload_state_id = io_inputs_2_payload_state_id;
        _zz_io_output_payload_state_element = io_inputs_2_payload_state_element;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 2'b00) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 2'b01) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 2'b10) && io_output_ready);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload_round_index = _zz_io_output_payload_round_index;
  assign io_output_payload_state_index = _zz_io_output_payload_state_index;
  assign io_output_payload_state_size = _zz_io_output_payload_state_size;
  assign io_output_payload_state_id = _zz_io_output_payload_state_id;
  assign io_output_payload_state_element = _zz_io_output_payload_state_element;

endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input      [1:0]    io_push_payload,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg [1:0]    io_pop_payload,
  input               io_flush,
  output reg [4:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire       [1:0]    _zz_ram_port0;
  wire       [4:0]    _zz_pushPtr_valueNext;
  wire       [0:0]    _zz_pushPtr_valueNext_1;
  wire       [4:0]    _zz_popPtr_valueNext;
  wire       [0:0]    _zz_popPtr_valueNext_1;
  wire       [1:0]    _zz_ram_port;
  wire       [4:0]    _zz_io_occupancy;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [4:0]    pushPtr_valueNext;
  reg        [4:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [4:0]    popPtr_valueNext;
  reg        [4:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                when_Stream_l995;
  wire                when_Stream_l1008;
  wire       [4:0]    ptrDif;
  (* ram_style = "distributed" *) reg [1:0] ram [0:19];

  assign _zz_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign _zz_pushPtr_valueNext = {4'd0, _zz_pushPtr_valueNext_1};
  assign _zz_popPtr_valueNext_1 = popPtr_willIncrement;
  assign _zz_popPtr_valueNext = {4'd0, _zz_popPtr_valueNext_1};
  assign _zz_io_occupancy = (5'h14 + ptrDif);
  assign _zz_ram_port = io_push_payload;
  assign _zz_ram_port0 = ram[popPtr_value];
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[pushPtr_value] <= _zz_ram_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 5'h13);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    if(pushPtr_willOverflow) begin
      pushPtr_valueNext = 5'h0;
    end else begin
      pushPtr_valueNext = (pushPtr_value + _zz_pushPtr_valueNext);
    end
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 5'h13);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    if(popPtr_willOverflow) begin
      popPtr_valueNext = 5'h0;
    end else begin
      popPtr_valueNext = (popPtr_value + _zz_popPtr_valueNext);
    end
    if(popPtr_willClear) begin
      popPtr_valueNext = 5'h0;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign when_Stream_l995 = (! empty);
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload = _zz_ram_port0;
    end else begin
      io_pop_payload = io_push_payload;
    end
  end

  assign when_Stream_l1008 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  always @(*) begin
    if(ptrMatch) begin
      io_occupancy = (risingOccupancy ? 5'h14 : 5'h0);
    end else begin
      io_occupancy = ((popPtr_value < pushPtr_value) ? ptrDif : _zz_io_occupancy);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushPtr_value <= 5'h0;
      popPtr_value <= 5'h0;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(when_Stream_l1008) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamDemux (
  input      [1:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [5:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [5:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element,
  output reg          io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [6:0]    io_outputs_2_payload_round_index,
  output     [3:0]    io_outputs_2_payload_state_index,
  output     [3:0]    io_outputs_2_payload_state_size,
  output     [5:0]    io_outputs_2_payload_state_id,
  output     [254:0]  io_outputs_2_payload_state_element
);
  wire                when_Stream_l745;
  wire                when_Stream_l745_1;
  wire                when_Stream_l745_2;

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
  end

  assign io_outputs_0_payload_round_index = io_input_payload_round_index;
  assign io_outputs_0_payload_state_index = io_input_payload_state_index;
  assign io_outputs_0_payload_state_size = io_input_payload_state_size;
  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745 = (2'b00 != io_select);
  always @(*) begin
    if(when_Stream_l745) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_round_index = io_input_payload_round_index;
  assign io_outputs_1_payload_state_index = io_input_payload_state_index;
  assign io_outputs_1_payload_state_size = io_input_payload_state_size;
  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_1 = (2'b01 != io_select);
  always @(*) begin
    if(when_Stream_l745_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  assign io_outputs_2_payload_round_index = io_input_payload_round_index;
  assign io_outputs_2_payload_state_index = io_input_payload_state_index;
  assign io_outputs_2_payload_state_size = io_input_payload_state_size;
  assign io_outputs_2_payload_state_id = io_input_payload_state_id;
  assign io_outputs_2_payload_state_element = io_input_payload_state_element;
  assign when_Stream_l745_2 = (2'b10 != io_select);
  always @(*) begin
    if(when_Stream_l745_2) begin
      io_outputs_2_valid = 1'b0;
    end else begin
      io_outputs_2_valid = io_input_valid;
    end
  end


endmodule

module StreamFork_3 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [6:0]    io_outputs_0_payload_round_index,
  output     [3:0]    io_outputs_0_payload_state_index,
  output     [3:0]    io_outputs_0_payload_state_size,
  output     [5:0]    io_outputs_0_payload_state_id,
  output     [254:0]  io_outputs_0_payload_state_element,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [6:0]    io_outputs_1_payload_round_index,
  output     [3:0]    io_outputs_1_payload_state_index,
  output     [3:0]    io_outputs_1_payload_state_size,
  output     [5:0]    io_outputs_1_payload_state_id,
  output     [254:0]  io_outputs_1_payload_state_element
);

  assign io_input_ready = (io_outputs_0_ready && io_outputs_1_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_0_payload_round_index = io_input_payload_round_index;
  assign io_outputs_0_payload_state_index = io_input_payload_state_index;
  assign io_outputs_0_payload_state_size = io_input_payload_state_size;
  assign io_outputs_0_payload_state_id = io_input_payload_state_id;
  assign io_outputs_0_payload_state_element = io_input_payload_state_element;
  assign io_outputs_1_payload_round_index = io_input_payload_round_index;
  assign io_outputs_1_payload_state_index = io_input_payload_state_index;
  assign io_outputs_1_payload_state_size = io_input_payload_state_size;
  assign io_outputs_1_payload_state_id = io_input_payload_state_id;
  assign io_outputs_1_payload_state_element = io_input_payload_state_element;

endmodule

//SBox5 replaced by SBox5

//SBox5 replaced by SBox5

module SBox5 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload_round_index,
  input      [3:0]    io_input_payload_state_index,
  input      [3:0]    io_input_payload_state_size,
  input      [5:0]    io_input_payload_state_id,
  input      [254:0]  io_input_payload_state_element,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload_round_index,
  output     [3:0]    io_output_payload_state_index,
  output     [3:0]    io_output_payload_state_size,
  output     [5:0]    io_output_payload_state_id,
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
  reg        [5:0]    mul_stage0_mulContext_state_id;
  reg        [254:0]  mul_stage0_mulContext_initial_state;
  wire                mul_stage0_output_valid;
  reg                 mul_stage0_output_ready;
  wire       [6:0]    mul_stage0_output_payload_round_index;
  wire       [3:0]    mul_stage0_output_payload_state_index;
  wire       [3:0]    mul_stage0_output_payload_state_size;
  wire       [5:0]    mul_stage0_output_payload_state_id;
  wire       [254:0]  mul_stage0_output_payload_state_element;
  wire       [254:0]  mul_stage0_output_payload_initial_state;
  wire                mul_stage0_multiplier0_cmd_fire;
  wire                mul_stage0_output_input_valid;
  wire                mul_stage0_output_input_ready;
  wire       [6:0]    mul_stage0_output_input_payload_round_index;
  wire       [3:0]    mul_stage0_output_input_payload_state_index;
  wire       [3:0]    mul_stage0_output_input_payload_state_size;
  wire       [5:0]    mul_stage0_output_input_payload_state_id;
  wire       [254:0]  mul_stage0_output_input_payload_state_element;
  wire       [254:0]  mul_stage0_output_input_payload_initial_state;
  reg                 mul_stage0_output_rValid;
  reg        [6:0]    mul_stage0_output_rData_round_index;
  reg        [3:0]    mul_stage0_output_rData_state_index;
  reg        [3:0]    mul_stage0_output_rData_state_size;
  reg        [5:0]    mul_stage0_output_rData_state_id;
  reg        [254:0]  mul_stage0_output_rData_state_element;
  reg        [254:0]  mul_stage0_output_rData_initial_state;
  wire                when_Stream_l342;
  reg        [6:0]    mul_stage1_mulContext_round_index;
  reg        [3:0]    mul_stage1_mulContext_state_index;
  reg        [3:0]    mul_stage1_mulContext_state_size;
  reg        [5:0]    mul_stage1_mulContext_state_id;
  reg        [254:0]  mul_stage1_mulContext_initial_state;
  wire                mul_stage1_output_valid;
  reg                 mul_stage1_output_ready;
  wire       [6:0]    mul_stage1_output_payload_round_index;
  wire       [3:0]    mul_stage1_output_payload_state_index;
  wire       [3:0]    mul_stage1_output_payload_state_size;
  wire       [5:0]    mul_stage1_output_payload_state_id;
  wire       [254:0]  mul_stage1_output_payload_state_element;
  wire       [254:0]  mul_stage1_output_payload_initial_state;
  wire                mul_stage1_multiplier1_cmd_fire;
  wire                mul_stage1_output_input_valid;
  wire                mul_stage1_output_input_ready;
  wire       [6:0]    mul_stage1_output_input_payload_round_index;
  wire       [3:0]    mul_stage1_output_input_payload_state_index;
  wire       [3:0]    mul_stage1_output_input_payload_state_size;
  wire       [5:0]    mul_stage1_output_input_payload_state_id;
  wire       [254:0]  mul_stage1_output_input_payload_state_element;
  wire       [254:0]  mul_stage1_output_input_payload_initial_state;
  reg                 mul_stage1_output_rValid;
  reg        [6:0]    mul_stage1_output_rData_round_index;
  reg        [3:0]    mul_stage1_output_rData_state_index;
  reg        [3:0]    mul_stage1_output_rData_state_size;
  reg        [5:0]    mul_stage1_output_rData_state_id;
  reg        [254:0]  mul_stage1_output_rData_state_element;
  reg        [254:0]  mul_stage1_output_rData_initial_state;
  wire                when_Stream_l342_1;
  reg        [6:0]    mul_stage2_mulContext_round_index;
  reg        [3:0]    mul_stage2_mulContext_state_index;
  reg        [3:0]    mul_stage2_mulContext_state_size;
  reg        [5:0]    mul_stage2_mulContext_state_id;
  reg        [254:0]  mul_stage2_mulContext_initial_state;
  wire                mul_stage2_output_valid;
  reg                 mul_stage2_output_ready;
  wire       [6:0]    mul_stage2_output_payload_round_index;
  wire       [3:0]    mul_stage2_output_payload_state_index;
  wire       [3:0]    mul_stage2_output_payload_state_size;
  wire       [5:0]    mul_stage2_output_payload_state_id;
  wire       [254:0]  mul_stage2_output_payload_state_element;
  wire                mul_stage2_multiplier2_cmd_fire;
  reg                 mul_stage2_is_partial_round;
  wire                mul_stage2_is_pass_sbox5;
  wire                mul_stage2_output_m2sPipe_valid;
  wire                mul_stage2_output_m2sPipe_ready;
  wire       [6:0]    mul_stage2_output_m2sPipe_payload_round_index;
  wire       [3:0]    mul_stage2_output_m2sPipe_payload_state_index;
  wire       [3:0]    mul_stage2_output_m2sPipe_payload_state_size;
  wire       [5:0]    mul_stage2_output_m2sPipe_payload_state_id;
  wire       [254:0]  mul_stage2_output_m2sPipe_payload_state_element;
  reg                 mul_stage2_output_rValid;
  reg        [6:0]    mul_stage2_output_rData_round_index;
  reg        [3:0]    mul_stage2_output_rData_state_index;
  reg        [3:0]    mul_stage2_output_rData_state_size;
  reg        [5:0]    mul_stage2_output_rData_state_id;
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

module RoundConstants_3 (
  output     [254:0]  io_read_ports_0_data,
  input      [3:0]    io_read_ports_0_t_index,
  input      [6:0]    io_read_ports_0_round_index
);
  wire       [254:0]  _zz_constants_roms_0_port0;
  wire       [254:0]  _zz_constants_roms_1_port0;
  wire       [254:0]  _zz_constants_roms_2_port0;
  wire       [254:0]  _zz_constants_roms_3_port0;
  wire       [254:0]  _zz_constants_roms_4_port0;
  wire       [254:0]  _zz_constants_roms_5_port0;
  wire       [254:0]  _zz_constants_roms_6_port0;
  wire       [254:0]  _zz_constants_roms_7_port0;
  wire       [254:0]  _zz_constants_roms_8_port0;
  wire       [254:0]  _zz_constants_roms_9_port0;
  wire       [254:0]  _zz_constants_roms_10_port0;
  wire       [254:0]  _zz_constants_roms_11_port0;
  reg        [254:0]  _zz_io_read_ports_0_data;
  (* ram_style = "distributed" *) reg [254:0] constants_roms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_8 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_9 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_10 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_11 [0:64];

  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_0.bin",constants_roms_0);
  end
  assign _zz_constants_roms_0_port0 = constants_roms_0[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_1.bin",constants_roms_1);
  end
  assign _zz_constants_roms_1_port0 = constants_roms_1[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_2.bin",constants_roms_2);
  end
  assign _zz_constants_roms_2_port0 = constants_roms_2[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_3.bin",constants_roms_3);
  end
  assign _zz_constants_roms_3_port0 = constants_roms_3[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_4.bin",constants_roms_4);
  end
  assign _zz_constants_roms_4_port0 = constants_roms_4[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_5.bin",constants_roms_5);
  end
  assign _zz_constants_roms_5_port0 = constants_roms_5[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_6.bin",constants_roms_6);
  end
  assign _zz_constants_roms_6_port0 = constants_roms_6[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_7.bin",constants_roms_7);
  end
  assign _zz_constants_roms_7_port0 = constants_roms_7[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_8.bin",constants_roms_8);
  end
  assign _zz_constants_roms_8_port0 = constants_roms_8[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_9.bin",constants_roms_9);
  end
  assign _zz_constants_roms_9_port0 = constants_roms_9[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_10.bin",constants_roms_10);
  end
  assign _zz_constants_roms_10_port0 = constants_roms_10[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t12_constants_roms_11.bin",constants_roms_11);
  end
  assign _zz_constants_roms_11_port0 = constants_roms_11[io_read_ports_0_round_index];
  always @(*) begin
    case(io_read_ports_0_t_index)
      4'b0000 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_0_port0;
      end
      4'b0001 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_1_port0;
      end
      4'b0010 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_2_port0;
      end
      4'b0011 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_3_port0;
      end
      4'b0100 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_4_port0;
      end
      4'b0101 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_5_port0;
      end
      4'b0110 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_6_port0;
      end
      4'b0111 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_7_port0;
      end
      4'b1000 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_8_port0;
      end
      4'b1001 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_9_port0;
      end
      4'b1010 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_10_port0;
      end
      default : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_11_port0;
      end
    endcase
  end

  assign io_read_ports_0_data = _zz_io_read_ports_0_data;

endmodule

module RoundConstants_2 (
  output     [254:0]  io_read_ports_0_data,
  input      [3:0]    io_read_ports_0_t_index,
  input      [6:0]    io_read_ports_0_round_index
);
  wire       [254:0]  _zz_constants_roms_0_port0;
  wire       [254:0]  _zz_constants_roms_1_port0;
  wire       [254:0]  _zz_constants_roms_2_port0;
  wire       [254:0]  _zz_constants_roms_3_port0;
  wire       [254:0]  _zz_constants_roms_4_port0;
  wire       [254:0]  _zz_constants_roms_5_port0;
  wire       [254:0]  _zz_constants_roms_6_port0;
  wire       [254:0]  _zz_constants_roms_7_port0;
  wire       [254:0]  _zz_constants_roms_8_port0;
  reg        [254:0]  _zz_io_read_ports_0_data;
  (* ram_style = "distributed" *) reg [254:0] constants_roms_0 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_1 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_2 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_3 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_4 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_5 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_6 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_7 [0:64];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_8 [0:64];

  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_0.bin",constants_roms_0);
  end
  assign _zz_constants_roms_0_port0 = constants_roms_0[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_1.bin",constants_roms_1);
  end
  assign _zz_constants_roms_1_port0 = constants_roms_1[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_2.bin",constants_roms_2);
  end
  assign _zz_constants_roms_2_port0 = constants_roms_2[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_3.bin",constants_roms_3);
  end
  assign _zz_constants_roms_3_port0 = constants_roms_3[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_4.bin",constants_roms_4);
  end
  assign _zz_constants_roms_4_port0 = constants_roms_4[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_5.bin",constants_roms_5);
  end
  assign _zz_constants_roms_5_port0 = constants_roms_5[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_6.bin",constants_roms_6);
  end
  assign _zz_constants_roms_6_port0 = constants_roms_6[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_7.bin",constants_roms_7);
  end
  assign _zz_constants_roms_7_port0 = constants_roms_7[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t9_constants_roms_8.bin",constants_roms_8);
  end
  assign _zz_constants_roms_8_port0 = constants_roms_8[io_read_ports_0_round_index];
  always @(*) begin
    case(io_read_ports_0_t_index)
      4'b0000 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_0_port0;
      end
      4'b0001 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_1_port0;
      end
      4'b0010 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_2_port0;
      end
      4'b0011 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_3_port0;
      end
      4'b0100 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_4_port0;
      end
      4'b0101 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_5_port0;
      end
      4'b0110 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_6_port0;
      end
      4'b0111 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_7_port0;
      end
      default : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_8_port0;
      end
    endcase
  end

  assign io_read_ports_0_data = _zz_io_read_ports_0_data;

endmodule

module RoundConstants_1 (
  output     [254:0]  io_read_ports_0_data,
  input      [2:0]    io_read_ports_0_t_index,
  input      [5:0]    io_read_ports_0_round_index
);
  wire       [254:0]  _zz_constants_roms_0_port0;
  wire       [254:0]  _zz_constants_roms_1_port0;
  wire       [254:0]  _zz_constants_roms_2_port0;
  wire       [254:0]  _zz_constants_roms_3_port0;
  wire       [254:0]  _zz_constants_roms_4_port0;
  reg        [254:0]  _zz_io_read_ports_0_data;
  (* ram_style = "distributed" *) reg [254:0] constants_roms_0 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_1 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_2 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_3 [0:63];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_4 [0:63];

  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t5_constants_roms_0.bin",constants_roms_0);
  end
  assign _zz_constants_roms_0_port0 = constants_roms_0[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t5_constants_roms_1.bin",constants_roms_1);
  end
  assign _zz_constants_roms_1_port0 = constants_roms_1[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t5_constants_roms_2.bin",constants_roms_2);
  end
  assign _zz_constants_roms_2_port0 = constants_roms_2[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t5_constants_roms_3.bin",constants_roms_3);
  end
  assign _zz_constants_roms_3_port0 = constants_roms_3[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t5_constants_roms_4.bin",constants_roms_4);
  end
  assign _zz_constants_roms_4_port0 = constants_roms_4[io_read_ports_0_round_index];
  always @(*) begin
    case(io_read_ports_0_t_index)
      3'b000 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_0_port0;
      end
      3'b001 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_1_port0;
      end
      3'b010 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_2_port0;
      end
      3'b011 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_3_port0;
      end
      default : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_4_port0;
      end
    endcase
  end

  assign io_read_ports_0_data = _zz_io_read_ports_0_data;

endmodule

module RoundConstants (
  output     [254:0]  io_read_ports_0_data,
  input      [1:0]    io_read_ports_0_t_index,
  input      [5:0]    io_read_ports_0_round_index
);
  wire       [254:0]  _zz_constants_roms_0_port0;
  wire       [254:0]  _zz_constants_roms_1_port0;
  wire       [254:0]  _zz_constants_roms_2_port0;
  reg        [254:0]  _zz_io_read_ports_0_data;
  (* ram_style = "distributed" *) reg [254:0] constants_roms_0 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_1 [0:62];
  (* ram_style = "distributed" *) reg [254:0] constants_roms_2 [0:62];

  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t3_constants_roms_0.bin",constants_roms_0);
  end
  assign _zz_constants_roms_0_port0 = constants_roms_0[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t3_constants_roms_1.bin",constants_roms_1);
  end
  assign _zz_constants_roms_1_port0 = constants_roms_1[io_read_ports_0_round_index];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_AddRoundConstantStage_roundConstants_t3_constants_roms_2.bin",constants_roms_2);
  end
  assign _zz_constants_roms_2_port0 = constants_roms_2[io_read_ports_0_round_index];
  always @(*) begin
    case(io_read_ports_0_t_index)
      2'b00 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_0_port0;
      end
      2'b01 : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_1_port0;
      end
      default : begin
        _zz_io_read_ports_0_data = _zz_constants_roms_2_port0;
      end
    endcase
  end

  assign io_read_ports_0_data = _zz_io_read_ports_0_data;

endmodule

//StreamFork replaced by StreamFork

module MDSMatrix_11 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_8.bin",mds_roms_8);
  end
  assign _zz_mds_roms_8_port0 = mds_roms_8[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_9.bin",mds_roms_9);
  end
  assign _zz_mds_roms_9_port0 = mds_roms_9[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_10.bin",mds_roms_10);
  end
  assign _zz_mds_roms_10_port0 = mds_roms_10[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t12_mds_roms_11.bin",mds_roms_11);
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

module MDSMatrix_10 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t9_mds_roms_8.bin",mds_roms_8);
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

module MDSMatrix_9 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t5_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t5_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t5_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t5_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t5_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;
  assign io_data_ports_3 = _zz_mds_roms_3_port0;
  assign io_data_ports_4 = _zz_mds_roms_4_port0;

endmodule

module MDSMatrix_8 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t3_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t3_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_2_mdsMatrix_t3_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;

endmodule

//StreamFork replaced by StreamFork

module MDSMatrix_7 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_8.bin",mds_roms_8);
  end
  assign _zz_mds_roms_8_port0 = mds_roms_8[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_9.bin",mds_roms_9);
  end
  assign _zz_mds_roms_9_port0 = mds_roms_9[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_10.bin",mds_roms_10);
  end
  assign _zz_mds_roms_10_port0 = mds_roms_10[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t12_mds_roms_11.bin",mds_roms_11);
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

module MDSMatrix_6 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t9_mds_roms_8.bin",mds_roms_8);
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

module MDSMatrix_5 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t5_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t5_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t5_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t5_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t5_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;
  assign io_data_ports_3 = _zz_mds_roms_3_port0;
  assign io_data_ports_4 = _zz_mds_roms_4_port0;

endmodule

module MDSMatrix_4 (
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t3_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t3_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_1_mdsMatrix_t3_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;

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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_8.bin",mds_roms_8);
  end
  assign _zz_mds_roms_8_port0 = mds_roms_8[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_9.bin",mds_roms_9);
  end
  assign _zz_mds_roms_9_port0 = mds_roms_9[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_10.bin",mds_roms_10);
  end
  assign _zz_mds_roms_10_port0 = mds_roms_10[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t12_mds_roms_11.bin",mds_roms_11);
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_4.bin",mds_roms_4);
  end
  assign _zz_mds_roms_4_port0 = mds_roms_4[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_5.bin",mds_roms_5);
  end
  assign _zz_mds_roms_5_port0 = mds_roms_5[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_6.bin",mds_roms_6);
  end
  assign _zz_mds_roms_6_port0 = mds_roms_6[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_7.bin",mds_roms_7);
  end
  assign _zz_mds_roms_7_port0 = mds_roms_7[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t9_mds_roms_8.bin",mds_roms_8);
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t5_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t5_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t5_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t5_mds_roms_3.bin",mds_roms_3);
  end
  assign _zz_mds_roms_3_port0 = mds_roms_3[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t5_mds_roms_4.bin",mds_roms_4);
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
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t3_mds_roms_0.bin",mds_roms_0);
  end
  assign _zz_mds_roms_0_port0 = mds_roms_0[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t3_mds_roms_1.bin",mds_roms_1);
  end
  assign _zz_mds_roms_1_port0 = mds_roms_1[io_address_port];
  initial begin
    $readmemb("PoseidonThread.v_toplevel_MDSMixStage_matrixMultiplierInsts_0_mdsMatrix_t3_mds_roms_2.bin",mds_roms_2);
  end
  assign _zz_mds_roms_2_port0 = mds_roms_2[io_address_port];
  assign io_data_ports_0 = _zz_mds_roms_0_port0;
  assign io_data_ports_1 = _zz_mds_roms_1_port0;
  assign io_data_ports_2 = _zz_mds_roms_2_port0;

endmodule
