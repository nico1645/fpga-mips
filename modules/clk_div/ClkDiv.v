// The clock rate clk in cycles per secondes gets divided by 2^EXP cycles.
// For example a 100MHz clk with EXP = 25, clk_en will be 0.334Hz.

module ClkDiv(input clk, input rst, output clk_en);
parameter EXP = 25;
reg [EXP-1:0] clk_count; 

always @ (posedge clk) 
begin 
    if (rst) clk_count <= 0; 
    else clk_count <= clk_count + 1; 
end

assign clk_en = &clk_count;
endmodule
