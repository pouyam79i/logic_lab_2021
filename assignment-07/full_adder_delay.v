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
---  Module Name: Full Adder Gate Level with delay
---  Description: Lab 07 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module full_adder_delay (
	input a ,
	input b ,
	input ci ,
	output s ,
	output co
);

	// Sum
	wire xi;
	xor #10 abXor(xi, a, b);
	xor #10 sum(s, ci, xi);

	// Carry out
	wire o1, p1, p2;
	or  #5 abOr(o1, a, b);
	and #5 ocAnd(p1, o1, ci);
	and #5 abAnd(p2, a, b);
	or  #5 carryOut(co, p1, p2);

endmodule
