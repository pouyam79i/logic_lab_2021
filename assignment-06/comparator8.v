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
---  Module Name: 3 Bits Comparator Gate Level
---  Description: Lab 06 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module comparator8 (
	input [7:0] A ,
	input [7:0] B ,
	input 		l ,
	input 		e ,
	input 		g ,
	output 		lt ,
	output 		et ,
	output 		gt
);

	// wires
	wire l1,l2,e1,e2,g1,g2;
	wire [2:0] inA,inB;

	// assignment of wires
	assign inA[1:0] = A[7:6];
	assign inB[1:0] = B[7:6];
	assign inA[2] = 1'b0;
	assign inB[2] = 1'b0;

	// Combining 3-bit comapators
	comparator3 com1(A[2:0],B[2:0],l,e,g,l1,e1,g1);
	comparator3 com2(A[5:3],B[5:3],l1,e1,g1,l2,e2,g2);
	comparator3	com3(inA[2:0],inB[2:0],l2,e2,g2,lt,et,gt);
	
					
	
endmodule
