`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters    
	parameter CLK_PERIOD = 10;

	//Registers
	reg clk;
	reg rst;
	reg sel;
	reg button;
	
	//Wires
	wire [2:0] throw;
	wire [2:0] light;
	wire [2:0] out;	

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
		sel = 0;
		#100
		button = 0;
		sel = 1;
	forever begin
		#10
		out = mux(clk,sel,rst,button);
	end
	end

	//Finish test
	initial begin
		#150
		$finish;
	end

	//Instantiate counter module
	dice dice (
	.clk (clk),
	.rst (rst),
	.button (button),
	.throw (throw)
	);

	traffic traffic (
	.clk (clk),
	.light (light)
	);

	mux top (
	.clk (clk),
	.sel (sel),
	.rst (rst),
	.button (button),
	.out (out)
	);
 
endmodule 
