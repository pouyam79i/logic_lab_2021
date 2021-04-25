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
---  Module Name: Decoder 2 to 4 Gate Level
---  Description: Lab 05 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module decoder2x4 (
	input [1:0] in ,
	input en ,
	output [3:0] dout
);

	// Wires
	wire [1:0] inNot;
	
	// Not gates
	not gNote0(inNot[0], in[0]);
	not gNote1(inNot[1], in[1]);
	
	// Outputs
	and minTermGate0(dout[0], en, inNot[0], inNot[1]);
	and minTermGate1(dout[1], en, in[0], inNot[1]);
	and minTermGate2(dout[2], en, inNot[0], in[1]);
	and minTermGate3(dout[3], en, in[0], in[1]);

endmodule
