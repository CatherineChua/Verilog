`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:16 11/05/2014 
// Design Name: 
// Module Name:    progcnt 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module progcnt( clk, rst, en, count);
	 parameter NBITS = 4;
	 parameter MAX = 15;
    input clk;
    input rst;
    input en;
    output reg [NBITS-1:0] count;
    

always @(posedge clk, posedge rst)
  if (rst) begin
     count <= 0;
  end else begin
     if (en)
        if (count == MAX)
           count <= 0;
        else
           count <= count + 1; 
  end


endmodule
