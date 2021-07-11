/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 9829039	
--  Student Name: Pouya Mohammadi
--  Student Mail: pouyamohammadyirbu@gmail.com
--  *******************************************************
--  Additional Comments:
--
--	Teamate information:
--	Mehran Aksari
--	9831007
--*/


`timescale 1ns / 1ps

module tb_system;

	// Inputs
	reg rst;
	reg req;
	reg clk;
	reg confirm;
	reg [3:0] din;

	// Outputs
	wire [3:0] dout_left;
	wire [3:0] dout_right;

	// Instantiate the Unit Under Test (UUT)
	system uut (
		.rst(rst), 
		.req(req), 
		.clk(clk), 
		.confirm(confirm), 
		.din(din), 
		.dout_left(dout_left), 
		.dout_right(dout_right)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		req = 0;
		clk = 0;
		confirm = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#50;
		req = 1;
		#200
		din = 4'b0011;
		#400
		confirm = 0;
		#100
		confirm = 1;
		din = 4'b0101;
		#200
		confirm = 1;
		#200
		req = 1;
		confirm = 0;
		#300
		req = 1;
		#200 
		din = 4'b0101;
		#200
		confirm = 1;
		#200
		confirm = 0;
		#200 
		din = 4'b0100;
		#300
		confirm = 1;
		#500
		rst = 1;
		#200
		confirm = 0;
		req = 0; 
		#500 
		rst = 0;
		req = 1;
		#200
		
		$finish; 
        
		// Add stimulus here

	end
	
	initial begin
	repeat(50)
	#100 clk = ~clk;
	end
      
endmodule

