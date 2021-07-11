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


`timescale 1 ns/1 ns

module tb_fsm;

	// Inputs
	reg rst;
	reg clk;
	reg req;
	reg confirm;
	reg [3:0] pass_data;

	// Outputs
	wire en_left;
	wire en_right;
	wire [3:0] dout;
	wire [2:0] state;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.rst(rst),
		.clk(clk), 
		.req(req), 
		.confirm(confirm), 
		.pass_data(pass_data), 
		.en_left(en_left), 
		.en_right(en_right), 
		.dout(dout),
		.state(state)
	);
	
	initial begin
		clk = 1'b0;
		forever begin
		#100 clk = ~clk;
		end
	end

	initial begin
		// Initialize Inputs
		rst = 1; 
		req = 0;
		confirm = 0;
		pass_data = 0;
		// Wait 100 ns for global reset to finish
      	#250;
		rst = 0;
		#200;
		req = 1;
		#200;
		pass_data = 4'b0111;
		#400;
		confirm = 1;
		#100;
		confirm = 0;
		pass_data = 4'b0101;
		#200;
		confirm = 1;
		#200;
		req = 0;
		confirm = 0;
		#300;
		req = 1;
		#200;
		pass_data = 4'b0101;
		#200;
		confirm = 1;
		#200;
		confirm = 0;
		#200;  
		pass_data = 4'b0110;
		#200;
		confirm = 1;
		#500;
		rst = 1;
		#200;
		rst = 0;
		req = 1;
		#100;
		pass_data = 4'b1011;
		#100;
		confirm = 1;
		#200; 
		$finish;     
	end 
	
endmodule
