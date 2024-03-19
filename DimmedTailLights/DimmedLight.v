
module DimmedLight(input fst_clk, input on, output light);
reg [2:0] state;

ClkDiv #(.EXP(5)) clk_change();
ClkDiv #(.EXP(6)) clk_div_20();
ClkDiv #(.EXP(13)) clk_div_40();
ClkDiv #(.EXP(19)) clk_div_60();
ClkDiv #(.EXP(6)) clk_div_80();

always @ (*)
begin
    if (on)
    case(state)
        4'b0000: begin
        end
        4'b0001: ;
        4'b0010: ;
        4'b0100: ;
        4'b1000: light = 1;
        default: state = 4'b0000;
    endcase
    else
    begin
        state = 3'b0000;
        light = 0;
    end
end

endmodule
