
module Decoder_2_4(input [1:0] a, output [3:0] y);
    wire w1, w2;
    not(w1, a[0]);
    not(w2, a[1]);
    and(y[0], w1, w2);

    wire w3;
    not(w3, a[0]);
    and(y[2], a[1], w3);

    wire w4;
    not(w4, a[1]);
    and(y[1], a[0], w4);

    and(y[3], a[0], a[1]);

endmodule
