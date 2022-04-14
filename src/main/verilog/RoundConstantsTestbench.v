`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2022 04:54:40 PM
// Design Name: 
// Module Name: bram_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RoundConstantsTester(

);
  localparam Period = 10;
  
  // generate reset and clk signals
  reg clk;
  initial begin
    clk = 0;
    forever #(Period/2) clk = ~clk;
  end
  
  reg reset;
  initial begin
    reset = 1;
    #(2*Period) reset = 0;
  end
  
  
  // address generation 
  reg [1:0] tIndex_reg;
  reg [5:0] rIndex_reg;
  always @(posedge clk) begin
    if(reset) begin
      tIndex_reg <= 0;
      rIndex_reg <= 0;
    end
    else begin
      tIndex_reg <= tIndex_reg + 1;
      rIndex_reg <= rIndex_reg + 1;
    end

    if(rIndex_reg == 60) $finish();
  end

  
//  reg ena;
//  initial begin
//    ena = 1;
//    forever #(2*Period) ena = ~ena;
//  end
  
  wire [254:0] readData;

  RoundConstants roundConstantsInst(
      .io_readPorts_0_data      ( readData   ),
      .io_readPorts_0_tIndex    ( 0 ),
      .io_readPorts_0_roundIndex( rIndex_reg ),
      .clk                      ( clk        ),
      .reset                    ( reset      )
  );


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, RoundConstantsTester);
  end
    
  
endmodule