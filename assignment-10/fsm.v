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
---  Module Name: FSM
---  Description: Lab 10 Part 2
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module fsm (
	input        rst ,			// Reset 
	input        clk ,			// Clock
	input 		 req,			// Request
	input        confirm ,		// Confirm value
	input  [3:0] pass_data ,	// Password or data input (4-bit)
	output       en_left ,		// Used for even data 	
	output       en_right ,		// Used for odd data
	output [3:0] dout			// Output data (4-bit)
);

	// Outputs as registers
	reg en_left,
	reg en_right,
	reg [3:0] dout,
	// State of machine
	reg [2:0] state;
	// Constant pasword
	reg [3:0] password;

	// Initialing to default values
	initial begin
		// Default values
		en_left = 0;
		en_right = 0;
		dout = 0;			
		state = 3'b000; 
		// Define pasword here
		password = 4'b1010;	 		
	end

	// Sequential circuit
	always @(posedge clk or posedge rst or negedge req) begin
		if ((~req) || (rst)) begin
			en_left = 0;
			en_right = 0;
			state = 3'b000;
		end
		else begin
			if(state == 3'b000) begin
				state = 3'b001;
			end
			else if (state == 3'b001) begin
				if(confirm) begin
					if(pass_data == password) state = 3'b101;
					else state = 3'b111;
				end
			end
			else if (state == 3'b101) begin
				if(confirm) begin
					dout = pass_data;
					state = 3'b110;
					// Even Data
					if(pass_data[0]) begin	
						en_left = 1;
						en_right = 0;
					end
					// Odd data
					else begin
						en_left = 0;
						en_right = 1;
					end
				end
			end
		end
	end

endmodule
