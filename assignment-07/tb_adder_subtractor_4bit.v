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

/*-----------------------------------------------------------
---  Module Name: Decoder Testbench
---  Description: Lab 05 Part 1 Testbench
-----------------------------------------------------------*/
`timescale 1 ns/1 ns


module tb_adder_subtractor_4bit ();

	// regs
	reg [3:0] A;
	reg [3:0] B;
	reg sel;

	// wires
	wire [3:0] sum;
	wire [3:0] sum_delay;
	wire cout;
	wire cout_delay;

	// building from adder_subtractor_4bit module 
	adder_subtractor_4bit test_adder_subtractor_4bit (.A(A), .B(B), .sel(sel), .S(sum), .cout(cout));

	// building from adder_subtractor_4bit_delay module
	adder_subtractor_4bit_delay test_adder_subtractor_4bit_delay (.A(A), .B(B), .sel(sel), .S(sum_delay), .cout(cout_delay));

	// Initialize Inputs
	initial 
		begin
		A = 5;
		B = 10;
		sel = 0;
		#100;
		A = 5;
		B = 10;
		sel = 1;
		#100;
		A = 10;
		B = 10;
		sel = 0;
		#100;
		A = 10;
		B = 10;
		sel = 1;
		#100;
		A = 10;
		B = 5;
		sel = 0;
		#100;
		A = 10;
		B = 5;
		sel = 1;
		#100;
		$finish;
	end

endmodule
