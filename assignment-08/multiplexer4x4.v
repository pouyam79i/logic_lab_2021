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
---  Module Name: Multiplexer 4bit 4 to 1
---  Description: Lab 08 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module multiplexer4x4 (
	input [3:0] w3 ,
	input [3:0] w2 ,
	input [3:0] w1 ,
	input [3:0] w0 ,
	input [1:0]	sel ,
	output [3:0] y
); 
   
    // regs
    reg [3:0] y;

    // directing output to related input
	always @ (w3 or w2 or w1 or w0 or sel) 
	case (sel)
        2'b00: y = w0;
		2'b01: y = w1;
		2'b10: y = w2;
		2'b11: y = w3;
	endcase
		
endmodule
