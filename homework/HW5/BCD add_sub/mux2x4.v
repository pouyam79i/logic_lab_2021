// This is coded by Pouya Mohammadi
// CE@AUT - Uni ID: 9829039
// Question 2 - HW 5
// Logic circuit Spring 2021 - Mr. Sedighi 
// In this code - I just wrote a code for multiplexer, it will be used in bcd adder/subtractor

// 4-bit multiplexer 2x4

module mux2x4(
    input [3:0] I0,   // first input
    input [3:0] I1,   // second input
    input select,     // select, if 0 it means I0, if 1 it means I1 is output
    output [3:0] Out  // output
);

    // reg
    reg [3:0] Out;

    // directing output to related input
	always @ (I0 or I1 or select) 
	case (select)
        1'b0: Out = I0;
		1'b1: Out = I1;
	endcase
    
endmodule
