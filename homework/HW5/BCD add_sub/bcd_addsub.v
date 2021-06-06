// This is coded by Pouya Mohammadi
// CE@AUT - Uni ID: 9829039
// Question 2 - HW 5
// Logic circuit Spring 2021 - Mr. Sedighi 

// BCD adder subtractor
module bcd_addsub(
    input [3:0] A,   // First BCD input
    input [3:0] B,   // Second BCD input
    input Mode,      // Mode of add-sub. if 0 it means add, if 1 it means subtract    
    output [3:0] R,  // Result --> BCD output
    output Cout;     // Carry Out
);  

// getting 9's complement of second input 
    // wires
    wire [3:0] B9sC;
    // using complementor module
    bcd_nines_complementor(B, B9sC);

// Using mux to direct the wanted bcd value: B or B9sC
    // using container wire
    wire [3:0] muxContainer;
    // using mux2x4
    mux2x4(B, B9sC, Mode, muxContainer);

    // Using normal BCD adder to produce output
    bcd_adder(A, muxContainer, Mode, R, Cout);
    
endmodule