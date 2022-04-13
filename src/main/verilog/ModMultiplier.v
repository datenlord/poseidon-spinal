
module ModMultiplier #(
    // the width of modulus
    parameter DATA_WIDTH  = 255,
    // the modulus of ModMultiplier
    parameter MODULUS = 255'h73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001,
    // the inverse of modulus (mod R)  R = exp(2,DATA_WIDTH)
    parameter M_INVERSE = 255'h3d443ab0d7bf2839181b2c170004ec0653ba5bfffffe5bfdfffffffeffffffff,
    // R = exp(2, DATA_WIDTH)  MOD_COMPENSATION = R - MODULUS
    parameter MOD_COMPENSATION = 255'hc1258acd66282b7ccc627f7f65e27faac425bfd0001a40100000000ffffffff

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

    parameter IDLE = 2'b00, MUL_T = 2'b01, MUL_M = 2'b10, MUL_U = 2'b11;
    reg  [1:0] state, next_state;

    // generate next state
    wire op_handshake  = op_valid_i  && op_ready_o;
    wire res_handshake = res_valid_o && res_ready_i; 
    always @(*) begin
        case (state)
            IDLE : next_state = op_handshake ? MUL_T : IDLE;
            MUL_T: next_state = MUL_M;
            MUL_M: next_state = MUL_U;
            MUL_U: next_state = !res_handshake ? MUL_U : 
                                 op_handshake  ? MUL_T :
                                                  IDLE ;
        endcase        
    end

    // state transistion
    always @(posedge clk) begin
        if(rst) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    // generate output signals
    assign op_ready_o  = (state == IDLE) || ((state == MUL_U) && res_handshake);
    assign res_valid_o = state == MUL_U;


    // DATA_WIDTH bits * DATA_WIDTH bits multiplier
    wire [DATA_WIDTH-1  :0] mul_operand1, mul_operand2;
    wire [2*DATA_WIDTH-1:0] mul_res = mul_operand1 * mul_operand2;
    reg  [2*DATA_WIDTH-1:0] op1_mul_op2 , mul_res_tmp;

    assign mul_operand1 = (state == MUL_T) ? op1_mul_op2[DATA_WIDTH-1:0] :
                          (state == MUL_M) ? mul_res_tmp[DATA_WIDTH-1:0] :
                                                                   op1_i ;
    assign mul_operand2 = (state == MUL_T) ? M_INVERSE :
                          (state == MUL_M) ? MODULUS   :
                                             op2_i     ;

    always @(posedge clk) begin
        if(rst) begin
            op1_mul_op2 <= 0;
        end
        else if(op_handshake)begin
            op1_mul_op2 <= mul_res;
        end
    end

    always @(posedge clk) begin
        if(rst) begin
            mul_res_tmp <= 0;
        end
        else if(state == MUL_T || state == MUL_M) begin
            mul_res_tmp <= mul_res;
        end
    end

    // (op1_mul_op2 + t_mul_inverse ) >> DATA_WIDTH mod MODULUS
    wire [2*DATA_WIDTH-1:0] res1;
    wire [  DATA_WIDTH-1:0] res2;
    wire carry1,carry2;
    assign {carry1 , res1} = op1_mul_op2 + mul_res_tmp;
    assign {carry2 , res2} = res1[2*DATA_WIDTH-1: DATA_WIDTH] + MOD_COMPENSATION;
    assign res_o = (carry1 || carry2) ? res2 : res1[2*DATA_WIDTH-1: DATA_WIDTH];
    
    wire [2*DATA_WIDTH:0] mediate_res = {carry1,res1};

    // Dump waves
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, ModMultiplier);
    end

    
endmodule