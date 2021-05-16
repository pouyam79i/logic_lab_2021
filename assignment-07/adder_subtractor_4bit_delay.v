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
---  Module Name: 4 Bits Adder/Subtractor with Delay
---  Description: Lab 07 Part 2
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module adder_subtractor_4bit_delay (
	input [3:0] A ,
	input [3:0] B ,
	input sel , 		// 0: add, 1: subtract
	output [3:0] S ,
	output cout
);

		// wires
		wire c1, c2, c3;

		// using addsub_delay module
		add_sub_delay add1(A[0], B[0], sel, sel, S[0], c1);
		add_sub_delay add2(A[1], B[1], sel, c1, S[1], c2);
		add_sub_delay add3(A[2], B[2], sel, c2, S[2], c3);
		add_sub_delay add4(A[3], B[3], sel, c3, S[3], cout);

endmodule
