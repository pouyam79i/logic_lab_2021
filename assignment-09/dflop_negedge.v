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
---  Module Name: D Flip Flop
---  Description: Lab 09 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module dflop (
	input rst ,
	input clk ,
	input din ,
	output qout ,
	output qbout
);
	// defining outputs as reg
	reg qout, qbout;

	// D-FF main code
	always @ (negedge clk or posedge rst)
	begin
		if (rst == 1'b1) 
		begin
			qout  <= 1'b0;
			qbout <= 1'b1;
		end
		else
		begin
			#5;
			qout  <= din;
			qbout <= ~din;
		end
	end

endmodule
