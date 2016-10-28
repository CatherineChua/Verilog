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
    input b0, //A
    input b1,//B
	 input b2,//C
    output unlock,
    output [3:0] state
    );
	 
parameter S_INITIAL = 0; // initial state
parameter S_0 = 1; //state if B is pressed
parameter S_01 = 2; //state if C is pressed in correct order B -> C
parameter S_010 = 3; //state if A is pressed in correct order B -> C -> A
parameter S_0101 = 4; //state if C is pressed in correct order B -> C -> A -> C(unlock/unlock light up)

parameter S_ALARM = 5; //if initial input is incorrect ex: initially pressed is A or C
parameter S_A0 = 6; //if initial incorrect or if sequence B -> B/A
parameter S_A01 = 7; //if initial incorrect or if sequence B -> C -> B/C
parameter S_A010 = 8; //if initial incorrect or if sequence b -> C -> A -> B/A
parameter S_A0101 = 9; //if initial incorrect/ intitial inccorect -> S_A010 -> C

//parameter cnt = 0; //counts how often the wrong input has been pressed
reg [3:0] state, next_state;

always @ (posedge clk)
state <= next_state;

always @(*)
if (rst) next_state = S_INITIAL;
else case (state)
S_INITIAL: 
if (b1) next_state = S_0;
else if (b0) next_state = S_ALARM;
else if (b2) next_state = S_ALARM;
else if (rst) next_state = S_INITIAL;
else next_state = S_INITIAL;

S_ALARM:
if(b0) next_state = S_A0;
else if(b1) next_state = S_A0;
else if (b2) next_state = S_A0;
else next_state = S_ALARM;

S_0:
if (b2) next_state = S_01;
else if (b0) next_state = S_A0;
else if (b1) next_state = S_A0;
else if (rst) next_state = S_INITIAL;
else next_state = S_0;

S_A0:
if(b0) next_state = S_A01;
else if(b1) next_state = S_A01;
else if (b2) next_state = S_A01;
else next_state = S_A0;

S_01:
if (b0) next_state = S_010;
else if (b1) next_state = S_A01;
else if (b2) next_state = S_A01;
else if (rst) next_state = S_INITIAL;
else next_state = S_01;

S_A01:
if(b0) next_state = S_A010;
else if(b1) next_state = S_A010;
else if (b2) next_state = S_A010;
else next_state = S_A01;

S_010:
if (b2) next_state = S_0101;
else if (b0) next_state = S_A010;
else if (b1) next_state = S_A010;
else if (rst) next_state = S_INITIAL;
else next_state = S_010;

S_A010:
if(b2) next_state = S_A0101;
else if(b1) next_state = S_A010;
else if (b0) next_state = S_A010;
else next_state = S_A010;


S_0101:
if (b2) next_state = S_INITIAL;
else if (b0) next_state = S_INITIAL;
else if (b1) next_state = S_INITIAL;
else if (rst) next_state = S_INITIAL;
else next_state = S_0101;

S_A0101:
if (b0) next_state = S_INITIAL;
else if (b1) next_state = S_A010;
else if (b2) next_state = S_A010;
else next_state = S_A0101;


default: next_state = S_INITIAL;

endcase

assign unlock = (state == S_0101);

endmodule
