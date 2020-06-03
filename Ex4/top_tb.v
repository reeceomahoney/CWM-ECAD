//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters    
	parameter CLK_PERIOD = 10;

	//Registers
	reg clk;
	reg rst;
	reg button;
	
	//Wires
	wire [2:0] throw;	

	//Clock generation
	initial
	begin
		clk = 1'b0;
		forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	//User logic
	initial begin
		rst = 1;
		button = 0;
		#10
		rst = 0;
		button = 1;
		#100
		button = 0;
	end

	//Finish test
	initial begin
		#500
		$finish;
	end

	//Instantiate counter module
	dice top (
	.clk (clk),
	.rst (rst),
	.button (button),
	.throw (throw)
	);
 
endmodule 
