`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:12:14 11/16/2020
// Design Name:   comparator8
// Module Name:   C:/Users/Asus/Desktop/ISE/comp/tb_comp8bit.v
// Project Name:  comp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comparator8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_comparator8();

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg l;
	reg e;
	reg g;

	// Outputs
	wire lt;
	wire et;
	wire gt;

	// Instantiate the Unit Under Test (UUT)
	comparator8 uut (
		.A(A), 
		.B(B), 
		.l(l), 
		.e(e), 
		.g(g), 
		.lt(lt), 
		.et(et), 
		.gt(gt)
	); 

	initial begin
		
		A = 8'b11010001; B = 8'b11111111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111111; B = 8'b01111111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b00110101; B = 8'b01101010; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11010011; B = 8'b10011111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111000; B = 8'b11010111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b11111111; B = 8'b11111111; l = 0; e = 1; g = 0;
		#100;
		A = 8'b00010000; B = 8'b00001000; l = 0; e = 1; g = 0;
		#100;


	end
      
endmodule


