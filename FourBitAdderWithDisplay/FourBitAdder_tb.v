`timescale 1ns / 1ps

module FourBitAdder_tb;
reg [3:0] a;
reg [3:0] b;
reg [1:0] c;
wire [3:0] display;
wire msb;
wire [6:0] d;

FourBitAdder dut(a, b, c, d, msb, display);

initial begin
$dumpfile("FourBitAdder.vcd");
$dumpvars(0, FourBitAdder_tb);

a = 4'b0001;
b = 4'b0001;
c = 2'b00;
#100;

a = 4'b1001;
b = 4'b0101;
#100;

a = 4'b0101;
b = 4'b0001;
c = 2'b01;
#100;

a = 4'b0011;
b = 4'b0101;
#100;

a = 4'b1111;
b = 4'b1111;
c = 2'b10;
#100;

a = 4'b1011;
b = 4'b1111;
#100;

a = 4'b1001;
b = 4'b0101;
c = 2'b11;
#100;

$display("File generated");
end

endmodule
