`timescale 1ns/1ps

module DimmedTailLights_tb;
reg clk;
reg reset;
reg l;
reg r;
wire [5:0] light;

DimmedTailLights dut(
    .clk(clk),
    .reset(reset),
    .left(l),
    .right(r)
);


always #10 clk = ~clk;

initial begin
    $dumpfile("DimmedTailLights.vcd");
    $dumpvars;
    reset = 0; clk = 0; l = 1; r = 0;
    #180
    l = 0; r = 1;
    #200
    $stop;
end

endmodule
