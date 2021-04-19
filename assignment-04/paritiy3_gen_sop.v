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
--*/

/*-----------------------------------------------------------
---  Module Name: Paritiy Generator Sum of Products
---  Description: Lab 04 Part 4
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module paritiy3_gen_sop (
	input a,
	input b,
	input c,
	output f	
);
	
	wire w, x, y, z
	wire aNot, bNot, cNot

	not gNotA(aNot, a)
	not gNotB(bNot, b)
	not gNotC(cNot, c)

	and gAnd1(w, aNot, bNot, cNot)
	and gAnd1(x, aNot, b, c)
	and gAnd1(y, a, bNot, c)
	and gAnd1(z, a, b, cNot)

	or gOr(f, w, x, y, z)

endmodule
