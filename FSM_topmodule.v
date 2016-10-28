`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:30 11/19/2014 
// Design Name: 
// Module Name:    FSM_topmodule 
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
module FSM_topmodule(
    input [1:0] b,
    input rst,
    input clk,
	 output unlock,
	 output [1:7] seg
    );
	 wire [25:0] cntClk;
	 wire b0, b1;
	 wire [2:0] state;
	 
progcnt # (.NBITS(26),.MAX(67108863)) xprogcnt (
.rst(rst),
.en(1),
.clk(clk),
.count(cntClk)
);

Level_to_pulse xL2P_1(
.L(b[0]),
.P(b0),
.rst(rst),
.clk(cntClk[25])
);

Level_to_pulse xL2P_2(
.L(b[1]),
.P(b1),
.rst(rst),
.clk(cntClk[25])
);

lock xLock(
.rst(rst),
.clk(cntClk[25]),
.b0(b0),
.b1(b1),
.state(state), //3bits  bin2seg = 4bits
.unlock(unlock)
);

bin2reg xbin2seg(
.bin({1'b0,state}), //1'b = adding an extra 0 in the front of the 3bit state
.seginvert(seg)
);



endmodule
