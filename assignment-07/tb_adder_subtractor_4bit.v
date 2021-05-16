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
---  Module Name: Decoder Testbench
---  Description: Lab 05 Part 1 Testbench
-----------------------------------------------------------*/
`timescale 1 ns/1 ns


module tb_adder_subtractor_4bit ();

reg [3:0] A;
reg [3:0] B;
reg sel;

wire [3:0] sum;
wire [3:0] sum_delay;
wire cout;
wire cout_delay;

	adder_subtractor_4bit test_adder_subtractor_4bit (.A(A), .B(B), .sel(sel), .S(sum), .cout(cout));
	adder_subtractor_4bit test_adder_subtractor_4bit_delay (.A(A), .B(B), .sel(sel), .S(sum_delay), .cout(cout_delay));


	initial 
		begin
	// Initialize Inputs
		// A>0 & B>0 & add
		A =1;
		B = 2;
		Sell = 0;
		#200;
		A = 2;
		B = 3;
		Sell = 0;
		#200;
		A = 10;
		B = 12;
		Sell = 0;
		#200;
		A = 5;
		B = 6;
		Sell = 0;
		#200;
		// A>0 & B>0 & Subtract
		A = 5;
		B = 2;
		Sell = 1;
		#200;
		A = 2;
		B = 5;
		Sell = 1;
		#200;
		A = 4;
		B = 4;
		Sell = 1;
		#200;
		//A<0 & B>0 & add & subtract
		A = -5;
		B = 2;
		Sell = 0;
		#200;
		A = -3;
		B = 2;
		Sell = 1;
		#200;		
		//A>0 & B<0 & add & subtract
		A = 5;
		B = -2;
		Sell = 0;
		#200;		
		A = 5;
		B = -2;
		Sell = 1;
		#200;
		//A<0 & B<0 & add & subtract
		A = -5;
		B = -2;
		Sell = 0;
		#200;		
		A = -5;
		B = -2;
		Sell = 1;
		#200;		
		$finish;

		
		
		
	end

endmodule
