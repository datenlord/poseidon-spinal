module MontMultiplier #(
    // the width of modulus
    parameter DATA_WIDTH = 255,
    // the modulus of MontMultiplier
    parameter MODULUS = 255'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
)(
    input wire clk,
    input wire rst,

    input  wire op_valid_i,
    output wire op_ready_o,

    input wire [DATA_WIDTH-1:0] op1_i,
    input wire [DATA_WIDTH-1:0] op2_i,

    output wire res_valid_o,
    input  wire res_ready_i,
    output wire [DATA_WIDTH-1:0] res_o
    );
    

    
endmodule