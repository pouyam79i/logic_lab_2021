// This is coded by Pouya Mohammadi
// CE@AUT - Uni ID: 9829039
// Question 2 - HW 5
// Logic circuit Spring 2021 - Mr. Sedighi 
// In this code - I just wrote a code for bcd adder it will be used in bcd adder/subtractor

// BCD adder
module bcd_adder(
    input [3:0] A,      // First BCD input
    input [3:0] B,      // Second BCD input
    input Cin,          // Carry in
    output [3:0] sum,   // Sum -> BCD output
    output Cout         // Carry out
);

    // wire for carray out of first adder 
    wire co0;
    // wire for sum -> output of adder
    wire [3:0] s0; 
    // 4-bit adder module
    cla_adder_4bit(A, B, Cin, s0, co0);

// using and-or gates to handle the bcd addition process
    // Handler wires
    wire h0, h1;
    //and gates
    and (h0, s0[3], s0[2]);
    and (h1, s0[3], s0[1]);
    // or gate --> at this point we have output of bcd adder
    or  (Cout, co0, h0, h1);

// build final bcd output
    // 4-bit container
    wire [3:0] container;
    // assigning related values to contaner
    assign container[0] = 1'b0,
    container[0] = Cout,
    container[0] = Cout,
    container[0] = 1'b0; 
    // useless wire
    wire useless;
    // adder module
    cla_adder_4bit(s0, container, (1'b0), sum, useless);

endmodule
