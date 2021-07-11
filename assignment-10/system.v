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
---  Module Name: Sequential System
---  Description: Lab 10 Part 3
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module system (
	input  rst,				 // Reset
	input  clk,				 // Clock
	input  req,	             // Request	
	input  confirm,			 // Confirm
	input  [3:0] din ,		 // Data input
	output [3:0] dout_left , // Even data output
	output [3:0] dout_right	 // Odd data output
);

	// Wires
	wire en_right;
	wire en_left;
	wire [3:0] doutFSM;
	wire [2:0] state;

	// Modules
	fsm fsmModule(rst, clk, req, confirm, din, en_left, en_right, doutFSM);	// FSM module
	register rgLeft(rst, clk, en_left, doutFSM, dout_left);				// Even data container
	register rgRight(rst, clk, en_right, doutFSM, dout_right);			// Odd data container

endmodule
