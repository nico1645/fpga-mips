

`timescale 1ns / 1ps
`include "Multiplexer_4_1.v"

module Multiplexer_4_1_tb;
reg [3:0] a;
reg [1:0] s;
wire  y;

Multiplexer_4_1 dut(
    .a(a),
    .c(s),
    .y(y)
);

initial begin
$dumpfile("Multiplexer_4_1.vcd");
$dumpvars(0, Multiplexer_4_1_tb);

a = 4'b0001;
s = 2'b00;
#100;

a = 4'b0010;
s = 2'b01;
#100;

a = 4'b0100;
s = 2'b10;
#100;

a = 4'b1000;
s = 2'b11;
#100;

$display("file generated");

end

endmodule
