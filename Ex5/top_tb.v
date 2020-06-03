//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters    
	parameter CLK_PERIOD = 10;

	//Registers
	reg clk;
	
	//Wires
	wire [2:0] light;	

	//Clock generation
	initial
	begin
		clk = 1'b0;
		forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	//Finish test
	initial begin
		#100
		$finish;
	end

	//Instantiate counter module
	traffic top (
	.clk (clk),
	.light(light)
	);
 
endmodule 
	
