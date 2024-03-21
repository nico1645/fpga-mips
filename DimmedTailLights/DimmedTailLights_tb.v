`timescale 1ns/1ps

module DimmedTailLights_tb;
reg clk;
reg clk2;
reg reset;
reg l;
reg r;
wire [5:0] light;

DimmedTailLights dut(
    .clk_org(clk2),
    .clk(clk),
    .reset(reset),
    .left(l),
    .right(r)
);


always #100 clk = ~clk;
always #1 clk2 = ~clk2;

initial begin
    $dumpfile("DimmedTailLights.vcd");
    $dumpvars;
    reset = 0; clk = 0; l = 1; r = 0; clk2 = 0;
    #1800
    l = 0; r = 1;
    #2000
    $stop;
end

endmodule
