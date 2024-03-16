`include "Multiplexer_2_1.v"

module Multiplexer_4_1(input [3:0] a, input [1:0] c, output y);
    wire [1:0] w;

    Multiplexer_2_1 mux_first(
        .a(a[1:0]),
        .c(c[0]),
        .y(w[0])
    );

    Multiplexer_2_1 mux_second(
        .a(a[3:2]),
        .c(c[0]),
        .y(w[1])
    );
    
    Multiplexer_2_1 mux_last(
        .a(w),
        .c(c[1]),
        .y(y)
    );

endmodule
