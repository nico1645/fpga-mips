
module FourBitAdder(
    input [3:0] a, 
    input [3:0] b, 
    input [1:0] c,
    output [6:0] d, 
    output msb, 
    output [3:0] display
);
    wire [4:0] s;
    wire [3:0] w;

    assign msb = s[4];

    Decoder_2_4 dec_2_4(
        .a(c),
        .y(w)
    );

    assign display = ~w;

    RippleCarryAdder #(.BITS(4)) four_bit_adder(
                    .a(a),
                    .b(b),
                    .s(s)
                );
    
    OneDigitDisplay one_digit_display(
                    .d(d),
                    .s(s[3:0])
                );
endmodule
