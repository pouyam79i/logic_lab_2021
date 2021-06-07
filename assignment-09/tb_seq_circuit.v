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
---  Module Name: Sequential Circuit Testbench
---  Description: Lab 09 Part 1 Testbench
-----------------------------------------------------------*/
`timescale 1 ns/1 ns


module tb_seq_circuit ();

	// Registers
	reg rst;
	reg clk;
	reg a;
	reg b;
	// Output wires
	wire y;
	wire z;

	// Instantiating Unit Under Test
	seq_circuit uut (rst, clk, a, b, y, z);

	// Building the clock generator
	initial begin
		clk = 1'b0;
		forever begin
				#40;
				clk = ~clk;
		end
	end

	// Testing
	initial begin
		rst = 0;
		a = 0;
		b = 0;
		#80;
		b = 1;
		#40;
		a = 1;
		#80;
		a = 0;
		#80;
		b = 0;
		#40;
		a = 1;
		#120;
		b = 1;
		#40;
		a = 0;
		b = 0;
		#120;
		b = 1;
		#40;
		a = 1;
		$finish;	
	end

endmodule
