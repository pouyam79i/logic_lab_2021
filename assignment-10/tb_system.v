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
---  Module Name: System Testbench
---  Description: Lab 10 Part 4
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module tb_system ();

	// Inputs
	reg  rst ;
	reg  clk ;
	reg  req;
	reg  confirm;
	reg  [3:0] din ;

	// Outputs
	wire [3:0] dout_left ;
	wire [3:0] dout_right ;

	// Instantiate the Unit Under Test (UUT)
	system uut (
		.rst(rst), 
		.clk(clk), 
		.req(req),
		.confirm(confirm), 
		.din(din), 
		.dout_left(dout_left), 
		.dout_right(dout_right)
	);

	// Clock generator
	initial begin
		clk = 0;
		forever begin
		#5 clk = ~clk;
		end
	end

	initial begin
		// Initialize Inputs
		rst = 1;
		req = 0;
		confirm = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#25
		rst = 0;
		#20
		din = 4'b0011;
		#20
		confirm = 0;
		#30
		confirm = 1;
		din = 4'b0101;
		#20
		confirm = 1;
		#20
		req = 1;
		confirm = 0;
		#30
		req = 1;
		#20 
		din = 4'b0101;
		#20
		confirm = 1;
		#20
		confirm = 0;
		#20 
		din = 4'b0100;
		#30
		confirm = 1;
		#50
		rst = 1;
		#20
		confirm = 0;
		req = 0; 
		#50 
		rst = 0;
		req = 1;
		#20
		$finish; 
	end

endmodule
