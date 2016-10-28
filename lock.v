`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:29 11/19/2014 
// Design Name: 
// Module Name:    lock 
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
module lock(
    input clk,
    input rst,
    input b0,
    input b1,
    output unlock,
    output [2:0] state
    );
parameter S_RESET = 0;
parameter S_0 = 1;
parameter S_01 = 2;
parameter S_010 = 3;
parameter S_0101 = 4;
parameter S_01011 = 5;

reg [2:0] state, next_state;

always @ (posedge clk)
state <= next_state;

always @(*)
if (rst) next_state = S_RESET;
else case (state)
S_RESET: 
if (b1) next_state = S_RESET;
else if (b0) next_state = S_0;
else next_state = S_RESET;

S_0:
if (b0) next_state = S_0;
else if (b1) next_state = S_01;
else next_state = S_0;

S_01:
if (b1) next_state = S_RESET;
else if (b0) next_state = S_010;
else next_state = S_01;

S_010:
if (b0) next_state = S_0;
else if (b1) next_state = S_0101;
else next_state = S_010;

S_0101:
if (b0) next_state = S_010;
else if (b1) next_state = S_01011;
else next_state = S_0101;

S_01011:
if (b0) next_state = S_0;
else if (b1) next_state = S_RESET;
else next_state = S_01011;

default: next_state = S_RESET;

endcase

assign unlock = (state==S_01011);

endmodule
