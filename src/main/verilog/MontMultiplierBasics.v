module OneBitFullAdderVec #(
    parameter DATA_WIDTH = 256
)(
    input [DATA_WIDTH-1:0] op1_i,
    input [DATA_WIDTH-1:0] op2_i,
    input [DATA_WIDTH-1:0] op3_i,

    output[DATA_WIDTH-1:0] sum_o,
    output[DATA_WIDTH-1:0] carry_o
);

    genvar i;
    generate
        for(i=0; i<DATA_WIDTH; i=i+1) begin: OneBitAdders
            assign {carry_o[i],sum_o[i]} = op1_i[i] + op2_i[i] + op3_i[i];
        end
    endgenerate
    
endmodule


module OneBitFullAdderArray #(
    parameter MODULUS = 255'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001,
    parameter ROW_NUM = 17,
    parameter DATA_WIDTH = 255
)
(
    input wire [ROW_NUM-1:0]    x_temp_i,
    input wire [DATA_WIDTH-1:0] y_temp_i,
    input wire [DATA_WIDTH  :0] y_add_m_i,
    input wire [DATA_WIDTH  :0] sum_i,
    input wire [DATA_WIDTH  :0] carry_i,

    output wire [DATA_WIDTH :0] sum_o,
    output wire [DATA_WIDTH :0] carry_o
    
    );

    wire [DATA_WIDTH:0] carry_connections [ROW_NUM:0];
    wire [DATA_WIDTH:0] sum_connections   [ROW_NUM:0];
    assign carry_connections[0] = carry_i;
    assign sum_connections[0] = sum_i;


    genvar i;
    generate
        for(i=0; i<ROW_NUM; i=i+1) begin: OneBitFullAdderVecs
            wire [DATA_WIDTH:0] adder_op1, adder_op2, adder_op3;
            assign adder_op1 = {1'b0, sum_connections[i][DATA_WIDTH:1]};
            assign adder_op2 = carry_connections[i];
            wire select_M  = ~x_temp_i[i] &  (adder_op1[0] ^ adder_op2[0]);
            wire select_Y  =  x_temp_i[i] & ~(adder_op1[0] ^ adder_op2[0] ^ y_temp_i[0]);
            wire select_MY =  x_temp_i[i] &  (adder_op1[0] ^ adder_op2[0] ^ y_temp_i[0]);

            assign adder_op3 = {1'b0, { DATA_WIDTH {select_M} } & MODULUS } |
                               {1'b0, { DATA_WIDTH {select_Y} } & y_temp_i} |
                                  ( {DATA_WIDTH+1{select_MY}} & y_add_m_i ) ;  
            
            OneBitFullAdderVec adder_vec_inst(
                .op1_i(adder_op1),
                .op2_i(adder_op2),
                .op3_i(adder_op3),

                .sum_o(sum_connections[i+1]),
                .carry_o(carry_connections[i+1])
            );
        end
    endgenerate
    assign carry_o = carry_connections[ROW_NUM];
    assign sum_o   = sum_connections[ROW_NUM];
    
endmodule


// OneBitFullAdderArraySim used for faster simulation
module OneBitFullAdderArraySim #(
    parameter MODULUS = 255'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001,
    parameter ROW_NUM = 5,
    parameter DATA_WIDTH = 255
)
(
    // input ports
    input wire [ROW_NUM-1:0]    x_temp_i,
    input wire [DATA_WIDTH-1:0] y_temp_i,
    input wire [DATA_WIDTH  :0] y_add_m_i,
    input wire [DATA_WIDTH  :0] adder_res_i,

    // output ports
    output wire [DATA_WIDTH :0] adder_res_o
    
    );

    wire [DATA_WIDTH:0] res_connections [ROW_NUM:0];
    assign res_connections[0] = adder_res_i;


    genvar i;
    generate
        for(i=0; i<ROW_NUM; i=i+1) begin: OneBitFullAdderVecs
            wire [DATA_WIDTH:0] adder_op1, adder_op2;
            wire [DATA_WIDTH+1:0] adder_res;
            assign adder_op1 = res_connections[i];
            wire select_M  = ~x_temp_i[i] & adder_op1[0];
            wire select_Y  =  x_temp_i[i] & ~(adder_op1[0] ^ y_temp_i[0]);
            wire select_MY =  x_temp_i[i] &  (adder_op1[0] ^ y_temp_i[0]);

            assign adder_op2 = {1'b0, { DATA_WIDTH {select_M} } & MODULUS } |
                               {1'b0, { DATA_WIDTH {select_Y} } & y_temp_i} |
                                  ( {DATA_WIDTH+1{select_MY}} & y_add_m_i ) ;  
            assign adder_res = adder_op1 + adder_op2;
            assign res_connections[i+1] = adder_res[DATA_WIDTH+1:1];
        end
    endgenerate
    assign adder_res_o = res_connections[ROW_NUM];
    
endmodule