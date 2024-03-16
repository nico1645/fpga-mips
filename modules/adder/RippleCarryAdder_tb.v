`timescale 1ns/1ps

`include "RippleCarryAdder.v"

module RippleCarryAdder_tb();

    // Declare signals
    reg [7:0] a, b;
    wire [8:0] s;
    
    // Instantiate the FourBitAdder module
    RippleCarryAdder #(8) dut(
        .a(a),
        .b(b),
        .s(s)
    );
    
    // Stimulus
    initial begin
        a = 23;
        b = 12;
        #100; 
        $display("Result of 23 + 12 = %d", s);
        
        a = 8;
        b = 8;
        #100; 
        $display("Result of 8 + 8 = %d", s);
        
        a = 1;
        b = 1;
        #100; 

        $display("Result of 1 + 1 = %d", s);
        a = 3;
        b = 8;
        #100; 

        $display("Result of 3 + 8 = %d", s);
        a = 0;
        b = 0;
        #100; 

        $display("Result of 0 + 0 = %d", s);
        a = 35;
        b = 71;
        #100; 
        $display("Result of 35 + 71 = %d", s);
        $display("Test completed");
    end
    
endmodule
