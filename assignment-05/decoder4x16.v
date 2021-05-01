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
---  Module Name: Decoder 4 to 16
---  Description: Lab 05 Part 2
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module decoder4x16 (
	input [3:0] in ,
	input 		en ,
	output [15:0] dout
);
	wire [3:0] w;
	decoder2x4 dec1(.in(in[3:2]), .en(en), .dout(w));
	
	decoder2x4	dec2(.in(in[1:0]), .en(w[0]), .dout(dout[3:0])),
		dec3(.in(in[1:0]), .en(w[1]), .dout(dout[7:4])),
		dec4(.in(in[1:0]), .en(w[2]), .dout(dout[11:8])),
		dec5(.in(in[1:0]), .en(w[3]), .dout(dout[15:12]));

endmodule
