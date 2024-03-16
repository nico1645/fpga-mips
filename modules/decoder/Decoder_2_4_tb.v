`timescale 1ns / 1ps
`include "Decoder_2_4.v"

module Decoder_2_4_tb;
reg [1:0] a;
wire [3:0] y;

Decoder_2_4 dut(
    .a(a),
    .y(y)
);

initial begin
$dumpfile("Decoder_2_4.vcd");
$dumpvars(0, Decoder_2_4_tb);

a = 2'b00;
#100;

a = 2'b01;
#100;

a = 2'b10;
#100;

a = 2'b11;
#100;

$display("file generated");

end

endmodule
