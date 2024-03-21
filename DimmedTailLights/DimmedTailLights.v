
module DimmedTailLights(input clk_org, input clk, input reset, input left, input right, output [5:0] light);
wire [2:0] light_state;

wire right_state;
reg right_next_state;

reg [3:0] state;
wire [3:0] state_p;

reg [7:0] duty_1;
reg [7:0] duty_2;
reg [7:0] duty_3;

PWM pwm_1(
    .clk(clk_org),
    .duty_cycle(duty_1),
    .pwm_out(light_state[0])
);
PWM pwm_2(
    .clk(clk_org),
    .duty_cycle(duty_2),
    .pwm_out(light_state[1])
);
PWM pwm_3(
    .clk(clk_org),
    .duty_cycle(duty_1),
    .pwm_out(light_state[2])
);


initial begin
    right_next_state = 1'b0;
    state = 4'b0000;
    duty_1 = 8'b00000000;
    duty_2 = 8'b00000000;
    duty_3 = 8'b00000000;
end

wire reset_intern;
assign reset_intern = ~reset;

// State register
PosEdgeFlipFlopAsyncReset #(.BITS(1)) right_flip_flop (
    .clk(clk),
    .reset(reset_intern),
    .p(right_state),
    .n(right_next_state)
);

PosEdgeFlipFlopAsyncReset #(.BITS(4)) state_flip_flop (
    .clk(clk),
    .reset(reset_intern),
    .p(state_p),
    .n(state)
);

// Next State Logic
always @ (*)
begin
    case(state_p)
        4'b0000: 
        begin
            right_next_state = right ? 1 : 0;
            if (left ^ right)
            begin
                duty_1 = 8'b00000011;
                duty_2 = 8'b00000000;
                duty_3 = 8'b00000000;
                state = 4'b0001;
            end
            else
            begin
                duty_1 = 8'b00000000;
                duty_2 = 8'b00000000;
                duty_3 = 8'b00000000;
            end
        end
        4'b0001: 
        begin
            duty_1 = 8'b00001111;
            state = 4'b0010;
        end
        4'b0010:
        begin
            duty_1 = 8'b00111111;
            state = 4'b0011;
        end
        4'b0011: 
        begin
            duty_1 = 8'b11111111;
            state = 4'b0100;
        end
        4'b0100:
        begin
            duty_2 = 8'b00000011;
            state = 4'b0101;
        end
        4'b0101: 
        begin
            duty_2 = 8'b00001111;
            state = 4'b0110;
        end
        4'b0110: 
        begin
            duty_2 = 8'b00111111;
            state = 4'b0111;
        end
        4'b0111: 
        begin
            duty_2 = 8'b11111111;
            state = 4'b1000;
        end
        4'b1000: 
        begin
            duty_3 = 8'b00000011;
            state = 4'b1001;
        end
        4'b1001: 
        begin
            duty_3 = 8'b00001111;
            state = 4'b1010;
        end
        4'b1010: 
        begin
            duty_3 = 8'b00111111;
            state = 4'b1011;
        end
        4'b1011: 
        begin
            duty_3 = 8'b11111111;
            state = 4'b0000;
        end
    endcase
end

// Output Logic
assign light = right_state ? {3'b000, light_state} : {light_state[0], light_state[1], light_state[2], 3'b000};

endmodule
