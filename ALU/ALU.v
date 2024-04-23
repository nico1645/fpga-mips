
module ALU(input [3:0] op, input [31:0] A, input [31:0] B, output reg [31:0] RES, output ZERO);

reg [31:0] tmp;

//LAB REPORT ADDITION sum[32] is the overflow bit
wire [32:0] sum;
RippleCarryAdder #(.BITS(32)) ripple_carry_adder(.a(A), .b(B), .s(sum));

assign ZERO = RES == 32'b0 ? 1'b1: 1'b0;


always @ (*)
begin
    case(op)
        //Add
        4'b0000:
        begin
            RES = sum[31:0];
        end
        //Subtract
        4'b0010:
        begin
            RES = A - B;
        end
        //AND
        4'b0100:
        begin
            RES = A & B;
        end
        //OR
        4'b0101:
        begin
            RES = A | B;
        end
        //XOR
        4'b0110:
        begin
            RES = A ^ B;
        end
        //NOR
        4'b0111:
        begin
            RES = ~(A | B);
        end
        //slt
        4'b1010:
        begin
            tmp = A - B;
            RES = {31'b0, tmp[31]};
        end
    endcase

end


endmodule
