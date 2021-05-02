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

module comparator3 (
	input [2:0] A ,
	input [2:0] B ,
	input l ,
	input e ,
	input g ,
	output lt ,
	output et ,
	output gt
);

	// Wires
	wire [2:0] notA;
	wire [2:0] notB;
	wire [2:0] xNorOutput;

	// Inverter gates for A
	not gnotA0(notA[0], A[0]);
	not gnotA1(notA[1], A[1]);
	not gnotA2(notA[2], A[2]);

	// Inverter gates for B
	not gnotB0(notB[0], B[0]);
	not gnotB1(notB[1], B[1]);
	not gnotB2(notB[2], B[2]);

	// xNor Gates
	wire xNorAndResult;
	wire notEqultHandler;
	xnor gxNor0	  (xNorOutput[0], A[0], B[0]); 
	xnor gxNor1   (xNorOutput[1], A[1], B[1]); 
	xnor gxNor2   (xNorOutput[2], A[2], B[2]); 
	and  gxNorAnd (xNorAndResult, xNorOutput[2], xNorOutput[1], xNorOutput[0]);
	not  gNotEqual(notEqultHandler, xNorAndResult); 

	// A_GT_B circuit
	wire A_GT_B_Output;
	wire [2:0] A_GT_B_Holders;
	and gAndA_GT_B_2      (A_GT_B_Holders[2], A[2], notB[2]);
	and gAndA_GT_B_1	  (A_GT_B_Holders[1], A[1], notB[1], xNorOutput[2]);
	and gAndA_GT_B_0	  (A_GT_B_Holders[0], A[0], notB[0], xNorOutput[2], xNorOutput[1]);
	or  A_GT_B_resultGate (A_GT_B_Output, A_GT_B_Holders[2], A_GT_B_Holders[1], A_GT_B_Holders[0]);

	// A_LT_B circuit
	wire A_LT_B_Output;
	wire [2:0] A_LT_B_Holders;
	and gAndA_LT_B_2	  (A_LT_B_Holders[2], notA[2], B[2]);
	and gAndA_LT_B_1	  (A_LT_B_Holders[1], notA[1], B[1], xNorOutput[2]);
	and gAndA_LT_B_0	  (A_LT_B_Holders[0], notA[0], B[0], xNorOutput[2], xNorOutput[1]);
	or  A_LT_B_resultGate (A_LT_B_Output, A_LT_B_Holders[2], A_LT_B_Holders[1], A_LT_B_Holders[0]);

	// Cascading circuit
	wire cLt, cEq, cGt;
	and (cLt, xNorAndResult, l);
	and (cEq, xNorAndResult, e);
	and (cGt, xNorAndResult, g);

	// Lt output handler circuit
	wire handler_Lt_to_cLt;
	and check_Lt(handler_Lt_to_cLt, notEqultHandler, A_LT_B_Output);
	
	// Gt output handler circuit
	wire handler_Gt_to_cGt;
	and check_Gt(handler_Gt_to_cGt, notEqultHandler, A_GT_B_Output);

	// ***  final output of the IC ***
	assign et = cEq;					// Output of et
	or(lt, cLt, handler_Lt_to_cLt);		// Output of lt
	or(gt, cGt, handler_Gt_to_cGt);		// Output of gt

endmodule

