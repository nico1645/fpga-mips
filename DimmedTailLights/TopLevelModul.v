
module TopLevelModul(input clk, reset, left, right, output [5:0] lights);
wire clk_en;

ClkDiv #(.EXP(25)) clk_div (
    .clk(clk),
    .rst(reset),
    .clk_en(clk_en)
);

TailLights tail_light(
    .clk(clk_en),
    .reset(reset),
    .left(left),
    .right(right),
    .lights(lights)
);

endmodule
