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
module register_4(

	input        rst ,
	input        clk ,
	input        en ,
	input  [3:0] din ,
	output reg [3:0] qout
);
	always @ (posedge clk) begin
		if (en && ~rst) qout = din;
		
		if (rst) qout = 4'b0000;
	end

endmodule