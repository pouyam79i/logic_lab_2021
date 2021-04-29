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
---  Module Name: Function Implementation usin Mux 4 to 16
---  Description: Lab 05 Part 3
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module function4x1 (
	input a ,
	input b ,
	input c ,
	input d ,
	output f
);

	// wires
	wire [3:0] in;
	wire [15:0] dout;
	wire en;
	
	// Assigning input pins to 'in' array
	assign in[0] = a;
	assign in[1] = b;
	assign in[2] = c;
	assign in[3] = d;

	// en must be '1' so the decoder4x16 can operate
	assign en = 1'b1;

	// Getting dout, which contains all minterms from decoder!
	decoder4x16 myDecoder(.in(in), .en(en), .dout(dout));

	// having a or gate for all minterms
	or resultGate(f, dout[2], dout[3], dout[5], dout[7], dout[11], dout[13]);


endmodule
