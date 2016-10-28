`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:03 12/03/2014 
// Design Name: 
// Module Name:    AlarmBin2Seg 
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
module AlarmBin2Seg(bin, seginvert);
    input [3:0] bin;
    output  [1:7] seginvert;
	 reg [1:7] seg;
always@(bin)
case(bin)
		8,9: seg = 7'b1110111;
		4: seg = 7'b0111110;
		default: seg = 7'b0001110;

endcase
assign seginvert = ~seg;

endmodule
