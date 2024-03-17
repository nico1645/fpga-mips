
module PosEdgeFlipFlop(input clk, input [BITS-1:0] n, output reg [BITS-1:0] p);
parameter BITS = 1;

always @ (posedge clk)
begin
    p <= n;
end

endmodule
