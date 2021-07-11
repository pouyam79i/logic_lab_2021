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


`timescale 1ns / 1ps
module FSM (
	input            rst ,
	input            req ,
	input            clk ,
	input            confirm ,
	input      [3:0] pass_data ,
	output reg       en_left ,
	output reg       en_right ,
	output reg [3:0] dout,
	output reg [2:0] state 
);

reg [2:0] present = 3'b000;
wire [3:0] pass = 4'b0101;

always @( posedge clk ) begin
	if (req && ~rst ) begin
		case(present) 
			3'b000 : present = 3'b001;
			3'b001 : if (confirm) begin
							present = ((pass == pass_data)? 3'b101 : 3'b111 );
						end
			3'b101 : if (confirm) begin
							if (pass_data[0] == 0) en_right = 1'b1;
							else en_left = 1'b1;
							dout = pass_data;
							present = 3'b110;
						end
		endcase
	end
	else begin
		present = 3'b000;
		en_right = 0;
		en_left = 0;
		dout = 4'b0000;
	end
	state = present;		
end
	
	


endmodule