module PoseidonTopLevel_wrapper (
    input               io_input_valid,
    output              io_input_ready,
    input               io_input_last,
    input      [255:0]  io_input_payload,
    output              io_output_valid,
    input               io_output_ready,
    output              io_output_last,
    output     [255:0]  io_output_payload,
    input               clk,
    input               reset
);
    wire [254:0] input_payload = io_input_payload[254:0];
    wire [254:0] output_payload;
    assign io_output_payload = {1'b0, output_payload};
    PoseidonTopLevel poseidonInst(
        .io_input_valid    (io_input_valid  ),
        .io_input_ready    (io_input_ready  ),
        .io_input_last     (io_input_last   ),
        .io_input_payload  (io_input_payload),

        .io_output_valid   (io_output_valid ),
        .io_output_ready   (io_output_ready ),
        .io_output_last    (io_output_last  ),
        .io_output_payload (output_payload  ),
        .clk               (clk             ),
        .reset             (reset           )
);
    
endmodule