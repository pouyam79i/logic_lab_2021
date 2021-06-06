// This is coded by Pouya Mohammadi
// CE@AUT - Uni ID: 9829039
// Question 1 - HW 5
// Logic circuit Spring 2021 - Mr. Sedighi 


// Carry Look Ahead 4-bit Adder Module
module cla_adder_4bit(
    input [3:0] A,      // First 4-bit input
    input [3:0] B,      // Second 4-bit input
    input Cin,          // Carry in
    output [3:0] sum,   // 4-bit output
    output Cout        // Carry Out
);

    // pi = A[i] xor B[i]  
    wire p0, p1, p2, p3;    // wires
    xor gP0(p0, A[0], B[0]);
    xor gP1(p1, A[1], B[1]);
    xor gP2(p2, A[2], B[2]);
    xor gP3(p3, A[3], B[3]);

    // gi = A[i] and B[i]
    wire g0, g1, g2, g3;    // wires
    and gG0(g0, A[0], B[0]);
    and gG1(g1, A[1], B[1]);
    and gG2(g2, A[2], B[2]);
    and gG3(g3, A[3], B[3]);
    
// ci is carry-out from each bit 

    // ci wires
    wire c1, c2, c3;
    
    // c1 part
    wire c1_container_0;
    and (c1_container_0, Cin, p0);
    or  (c1, g0, c1_container_0);

    // c2 part
    wire c2_container_0, 
         c2_container_1;
    and (c2_container_0, Cin, p0, p1);
    and (c2_container_1, g0, p1);
    or  (c2, g1, c2_container_1, c2_container_0);

    // c3 part
    wire c3_container_0,
         c3_container_1,
         c3_container_2;
    and (c3_container_0, Cin, p0, p1, p2);
    and (c3_container_1, g0, p1, p2);
    and (c3_container_2, g1, p2);
    or  (c3, g2, c3_container_2, c3_container_1, c3_container_0);

    // c4 is Cout (carry out)
    wire c4_container_0,
         c4_container_1,
         c4_container_2,
         c4_container_3;
    and (c4_container_0, Cin, p0, p1, p2, p3);
    and (c4_container_1, g0, p1, p2, p3);
    and (c4_container_2, g1, p2, p3);
    and (c4_container_3, g2, p3);
    or  (Cout, g3, c4_container_0, c4_container_1, c4_container_2, c4_container_3);

    // sum[i] = A[i] xor B[i] xor ci
    xnor(sum[0], A[0], B[0], Cin);
    xnor(sum[1], A[1], B[1], c1);
    xnor(sum[2], A[2], B[2], c2);
    xnor(sum[3], A[3], B[3], c3);

endmodule
