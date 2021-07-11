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
---  Module Name: Register 4 bit
---  Description: Lab 10 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module register (
	input        rst ,
	input        clk ,
	input        en ,
	input  [3:0] din ,
	output [3:0] qout
);
	
	reg [3:0] qout;

	// sequentioal_circuit of 4-bit register
	always @ (posedge clk) begin
		// Writes data when en = 1 and rst = 0
		if (en && ~rst) qout = din;	 		
		// Reset bits when rst = 1
		else if (rst) qout = 4'b0000;
	end

endmodule
