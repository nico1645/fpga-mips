`timescale 1ns/1ps

module TailLights_tb;
reg clk;
reg reset;
reg l;
reg r;
wire [5:0] light;

TailLights dut(
    .clk(clk),
    .reset(reset),
    .left(l),
    .right(r)
);


always #100 clk = ~clk;

initial begin
    $dumpfile("TailLights.vcd");
    $dumpvars;
    reset = 0; clk = 0; l = 1; r = 0;
    #600
    l = 0; r = 1;
    #600
    $stop;
end

endmodule
