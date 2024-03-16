`timescale 1ns / 1ps

module RippleCarryAdder(input [BITS-1:0] a, input [BITS-1:0] b, output [BITS:0] s);
    parameter BITS = 4;

    wire [BITS-1:0] w;

    FullAdder add_first_bit(
    .a(a[0]),
    .b(b[0]),
    .ci(1'b0),
    .s(s[0]),
    .co(w[0])
    );

    genvar i;

    generate
        for (i = 1; i < BITS; i = i + 1) begin
            FullAdder full_adder(
                .a(a[i]),
                .b(b[i]),
                .ci(w[i-1]),
                .s(s[i]),
                .co(w[i])
            );
        end
        assign s[BITS] = w[BITS-1];
    endgenerate
    
endmodule
