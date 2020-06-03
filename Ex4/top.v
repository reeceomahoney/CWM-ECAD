//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dice (
	input clk, rst, button,
	output reg [2:0] throw
	);

always@(posedge clk)begin
	if (rst==0)
		throw <= (throw==(3'd0|3'd6|3'd7)) ? 3'd1: (button==1) ? throw+1: throw;
	else
		throw <= 0;
	end
endmodule

