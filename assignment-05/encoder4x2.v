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
<<<<<<< HEAD
-- I am Mehran
<<<<<<< HEAD
-- ksfjnlksfjnwlekfnwlekfnwl;ekfknwlefknwwefklvlfrr
=======
-- This is Pouya
>>>>>>> ede9d38af21704bd4c967fa2b26104fd6855f61a
=======
-- 
--	Teamate information:
--	Mehran Aksari
--	9831007
>>>>>>> 23ed48db58eea77c9a413f3d8e3d6596e9e22e5b
--*/

/*-----------------------------------------------------------
---  Module Name: Encoder 4 to 2 Gate Level
---  Description: Lab 05 Part 1
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module encoder4x2 (
	input [3:0] din ,
	output [1:0] qout	
);
	
	// Wires
	wire notDin2, onlyAndGate;
	
	// Pripheral gates
	not gNot(notDin2, din[2]);
	and gAnd(onlyAndGate, notDin2, din[1]);
	
	// Outputs
	or gOr0(qout[0], onlyAndGate, din[3]);
	or gOr1(qout[1], din[2], din[3]);

endmodule
