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
---  Module Name: Two bit adder
---  Description: Lab 08
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module adder_2bit (
	input [1:0] a,
	input [1:0] b,
	output [3:0] sum
);

    // wires
    wire C1;
    
    // 2-bit adder with 4-bit output.
    full_adder fa1(a[0], b[0], 1'b0, sum[0], C1);
    full_adder fa2(a[1], b[1], C1, sum[1], sum[2]);
    assign sum[3] = 1'b0;
    
endmodule
