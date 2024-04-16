
module ALU(input [3:0] op, input [31:0] A, input [31:0] B, output reg [31:0] RES, output ZERO);

reg [31:0] tmp;

assign ZERO = RES == 32'b0 ? 1'b1: 1'b0;


always @ (*)
begin
    case(op)
        //Add
        4'b0000:
        begin
            RES = A + B;
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
            tmp = A[30:0] - B[30:0];
            RES = {tmp[31], 31'b0};
        end
    endcase

end


endmodule
