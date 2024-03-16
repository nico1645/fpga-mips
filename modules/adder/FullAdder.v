`timescale 1ns / 1ps

module FullAdder(input a, input b, input ci, output s, output co);
    wire w1;
    
    xor(w1, a, b);
    xor(s, w1, ci);
    
    wire w2, w3;
    
    and(w2, a, b);
    and(w3, w1, ci);
    or(co, w2, w3);
    
endmodule
