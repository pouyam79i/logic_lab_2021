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
---  Module Name: Multiplexer 4 to 1
---  Description: Lab 05 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module multiplexer4x1 (
	input [3:0] w ,
	input [1:0]	sel ,
	output y
);
	
	// wires to connect
	wire [1:0] notSel;
	wire [3:0] connector;
	
	// Not gates
	not gNots0(notSel[0], sel[0]);
	not gNots1(notSel[1], sel[1]);
	
	// Minterms
	and m0(connector[0], w[0], notSel[1], notSel[0]); 
	and m1(connector[1], w[1], notSel[1], sel[0]); 
	and m2(connector[2], w[2], sel[1], notSel[0]); 
	and m3(connector[3], w[3], sel[1], sel[0]); 
	
	// Or gate to produce SoP for output
	or outputGate(y, connector[0], connector[1], connector[2], connector[3]);

endmodule

