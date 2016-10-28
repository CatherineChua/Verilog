`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:00 11/26/2014 
// Design Name: 
// Module Name:    DigitalClock 
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
module DigitalClock(
    input [2:0] b,
    input rst,
    input clk,
	 output unlock,
	 output [1:7] seg
    );
	 wire [25:0] cntClk;
	 wire b0, b1, b2;
	 wire [3:0] state;
	 
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

Level_to_pulse xL2P_3(
.L(b[2]),
.P(b2),
.rst(rst),
.clk(cntClk[25])
);

lock xLock(
.rst(rst),
.clk(cntClk[25]),
.b0(b0),
.b1(b1),
.b2(b2),
.state(state), //4bits  bin2seg = 4bits
.unlock(unlock)
);

AlarmBin2Seg xbin2seg(
.bin(state), 
.seginvert(seg)
);





endmodule
