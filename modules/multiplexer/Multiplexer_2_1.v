
module Multiplexer_2_1(input [1:0] a, input c, output y);
    assign y = c ? a[1] : a[0];
endmodule
