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
---  Module Name: Arithmetic and Logic Unit
---  Description: Lab 08
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module alu (
	input [1:0] A ,
	input [1:0] B ,
	input [1:0]	sel ,
	output [3:0] Y
);

	// container wires
	wire [3:0] sumOut;
	wire [3:0] mulOut;
	wire [3:0] nndOut;
	wire [3:0] invOut;

	// 2-bit adder module - AU
	adder_2bit adderM(A, B, sumOut);

	// 2-bit multiplier module - AU
	multiplier_2bit mulM(A, B, mulOut);
	
	// 2-bit nand module - LU
	nand_2bit nandM(A, B, nndOut);

	// 2-bit inverter module - LU
	inverter_2bit invM(A, invOut);

	// Using 4-bit Mux 4:1 to handle the output
	multiplexer4x4 muxM(invOut, nndOut, sumOut, mulOut, sel, Y);

endmodule
