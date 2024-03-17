`define ALL_ZEROS(BITS) {BITS{1'b0}}

module PosEdgeFlipFlopAsyncReset(input clk, input reset, input [BITS-1:0] n, output reg [BITS-1:0] p);
parameter BITS = 1;

always @ (posedge clk, negedge reset)
begin
    if (reset == 1'b0) p <= `ALL_ZEROS(BITS);
    else p <= n;
end

endmodule

