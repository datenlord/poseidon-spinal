
module ModAdder #(
    // width of modulus
    parameter DATA_WIDTH = 255,
    // the modulus of ModAdder
    parameter MODULUS = 255'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001,
    // R = exp(2, DATA_WIDTH)  MOD_COMPENSATION = R - MODULUS
    parameter MOD_COMPENSATION = 255'hc1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff
)(
    input  wire [DATA_WIDTH-1:0] op1_i,
    input  wire [DATA_WIDTH-1:0] op2_i,

    output wire [DATA_WIDTH-1:0] res_o
    );

    wire carry1,carry2;
    wire [DATA_WIDTH-1:0] res1, res2;
    assign {carry1, res1} = op1_i + op2_i;
    assign {carry2, res2} = res1  + MOD_COMPENSATION;
    assign res_o = (carry1 | carry2) ? res2 : res1;

endmodule