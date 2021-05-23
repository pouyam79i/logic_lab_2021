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
---  Module Name: Two bit multiplier
---  Description: Lab 08
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module multiplier_2bit (
	input [1:0] a,
	input [1:0] b,
	output [3:0] mul
);

    // wires
    wire carry;
    wire [2:0] container;
    
    // and gates
    and andGate0(mul[0], a[0], b[0]);
    and andGate1(container[0], a[1], b[0]);
    and andGate2(container[1], a[0], b[1]);
    and andGate3(container[2], a[1], b[1]);
    
    // full adders
    full_adder(container[0], container[1], (1'b0), mul[1], carry);
    full_adder(container[2], carry, (1'b0), mul[2], mul[3]);

endmodule
