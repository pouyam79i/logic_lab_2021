// This is coded by Pouya Mohammadi
// CE@AUT - Uni ID: 9829039
// Question 2 - HW 5
// Logic circuit Spring 2021 - Mr. Sedighi 
// In this code - I just wrote a code for bcd 9's complementor, it will be used in bcd adder/subtractor

// BCD 9's complementor
module bcd_nines_complementor(
    input [3:0] In,
    output [3:0] Out
);

// Invertors
    // container wires --- Inoti = not In[i]
    wires Inot3, Inot2, Inot1;
    // invertor gates
    not(Inot3, In[3]);
    not(Inot2, In[2]);
    not(Inot1, In[1]);

// Other gates to handle the circuit job
    // and gate
    and(Out[3], Inot1, Inot2, Inot3);
    // xor gate
    xor(Out[2], In[2], In[1]);
    // assigning other Outputs to relevant input
    assign Out[1] = In[1],
    Out[0] = In[0];
    
endmodule
