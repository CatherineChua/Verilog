`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:49 10/27/2014 
// Design Name: 
// Module Name:    bin2reg 
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
module bin2reg(bin, seginvert);
    input [3:0] bin;
    output  [1:7] seginvert;
	 reg [1:7] seg;
always@(bin)
case(bin)
		0: seg = 7'b1111110;
		1: seg = 7'b0110000;
		2: seg = 7'b1101101;
		3: seg = 7'b1111001;
		4: seg = 7'b0110011;
		5: seg = 7'b1011011;
		6: seg = 7'b1011111;
		7: seg = 7'b1110000;
		8: seg = 7'b1111111;
		9: seg = 7'b1111011;
		10: seg = 7'b1110111;
		11: seg = 7'b0011111;
		12: seg = 7'b1001110;
		13: seg = 7'b0111101;
		14: seg = 7'b1001111;
		15: seg = 7'b1000111;
endcase
assign seginvert = ~seg;

endmodule
