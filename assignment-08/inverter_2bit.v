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
---  Module Name: Two bit Not ---> 4bit output
---  Description: Lab 08
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module adder_2bit (
	input [1:0] a,
	output [3:0] out
);

    // nand gates
    not nG0(out[0], a[0]);
    not nG1(out[1], a[1]);

    // assing useless wires to 1'b1
    assign out[2] = 1'b1;
    assign out[3] = 1'b1;

endmodule
