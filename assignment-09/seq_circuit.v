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
---  Module Name: Sequential Circuit
---  Description: Lab 09 Part 2
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module seq_circuit (
	input rst ,
	input clk ,
	input a ,
	input b ,
	output y ,
	output z
);

	// wires used in C. in
	wire andIn, orIn, xnorIn;
	// wires used for present state q and qbout
	wire qout1, qout2, qbout1, qbout2;
	// wires used in C. out
	wire andOut, orOut;
	
	// C. in 
	or	(orIn, a, andIn);
	and (andIn, b, qbout2);
	xnor(xnorIn, orIn, qbout1);

	// Registers (DFFs)
	dflop dff1(rst, clk, orIn, qout1, qbout1);
	dflop dff2(rst, clk, xnorIn, qout2, qbout2);

	// C. out 
	or (orOut, qbout1, andOut);
	and(andOut, qbout2, b);

	// Outputs
	assign 
		y = qout1,
		z = orOut;

endmodule
