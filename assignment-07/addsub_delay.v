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
---  Module Name: Single Bit Adder/Subtractor with delay
---  Description: Lab 07 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module add_sub_delay (
	input a ,
	input b ,
	input cin ,
	input sel ,
	output sum ,
	output cout
);

	// Condition of second input 'b'
	wire bc;
	xor #10 bXor(bc, b, sel);

	// Sum
	wire xi;
	xor #10 abXor(xi, a, bc);
	xor #10 sum(sum, cin, xi);

	// Carry out
	wire o1, p1, p2;
	or  #5 abOr(o1, a, bc);
	and #5 ocAnd(p1, o1, cin);
	and #5 abAnd(p2, a, bc);
	or  #5 carryOut(cout, p1, p2);

endmodule
