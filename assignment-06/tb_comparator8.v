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
`timescale 1ns / 1ns

module tb_comparator8();

	// Regs
	reg [7:0] A;
	reg [7:0] B;
	reg l;
	reg e;
	reg g;
	// Outputs
	wire lt;
	wire et;
	wire gt;

	// test bench module
	comparator8 test_comparator8 (
		.A(A), .B(B), .l(l), .e(e), .g(g), .lt(lt), .et(et), .gt(gt)
	); 

	initial 
		begin
		
		A = 8'b11010001; B = 8'b11111111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111111; B = 8'b01111111; l = 1; e = 1; g = 0;
		#100;
		A = 8'b00110101; B = 8'b01101010; l = 0; e = 0; g = 1;
		#100;
		A = 8'b11010011; B = 8'b10011111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111000; B = 8'b11010111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111111; B = 8'b11111111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b00010000; B = 8'b00001000; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111111; B = 8'b11111111; l = 1; e = 0; g = 1;
		#100;
		$finish;

	end
      
endmodule
