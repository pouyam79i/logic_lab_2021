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


`timescale 1ns / 1ps
module system(
	input        rst ,
	input			 req ,
	input        clk ,
	input        confirm,
	input  [3:0] din ,
	output [3:0] dout_left ,
	output [3:0] dout_right
);
wire en_right;
wire en_left;
wire [3:0] doutFsm;
wire [2:0] state;

FSM fsm(rst,req,clk,confirm,din,en_left,en_right,doutFsm,state);
register_4 rgRight(rst,clk,en_right,doutFsm,dout_right);
register_4 rgLeft(rst,clk,en_left,doutFsm,dout_left);

endmodule