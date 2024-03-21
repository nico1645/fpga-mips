
module TopLevelModul(input clk, reset, left, right, output [5:0] lights);
wire clk_en;

ClkDiv #(.EXP(20)) clk_div (
    .clk(clk),
    .rst(reset),
    .clk_en(clk_en)
);

DimmedTailLights tail_light(
    .clk_org(clk),
    .clk(clk_en),
    .reset(reset),
    .left(left),
    .right(right),
    .light(lights)
);

endmodule
