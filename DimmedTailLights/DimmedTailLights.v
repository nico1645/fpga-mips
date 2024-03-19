
module TailLights(input clk, input reset, input left, input right, output [5:0] light);
wire [2:0] light_state;
reg [2:0] light_next_state;

wire right_state;
reg right_next_state;

reg [7:0] duty_1;
reg [7:0] duty_2;
reg [7:0] duty_3;

PWM pwm_1(
    .clk(clk),
    .duty_cycle(duty_1),
    .pwm_out(light_state[0])
);
PWM pwm_2(
    .clk(clk),
    .duty_cycle(duty_2),
    .pwm_out(light_state[1])
);
PWM pwm_3(
    .clk(clk),
    .duty_cycle(duty_1),
    .pwm_out(light_state[2])
);


initial begin
    light_next_state = 3'b000;
    right_next_state = 1'b0;
    duty_1 = 8'b00000000;
    duty_2 = 8'b00000000;
    duty_3 = 8'b00000000;
end

wire reset_intern;
assign reset_intern = ~reset;

// State register
PosEdgeFlipFlopAsyncReset #(.BITS(3)) light_flip_flop (
    .clk(clk),
    .reset(reset_intern),
    .p(light_state),
    .n(light_next_state)
);

PosEdgeFlipFlopAsyncReset #(.BITS(1)) right_flip_flop (
    .clk(clk),
    .reset(reset_intern),
    .p(right_state),
    .n(right_next_state)
);

// Next State Logic
always @ (*)
begin
    case(light_state)
        3'b000: 
        begin
            right_next_state = right ? 1 : 0;
            if (left ^ right)
                light_next_state = 3'b001;
            else
                light_next_state = 3'b000;
        end
        3'b001: light_next_state = 3'b011;
        3'b011: light_next_state = 3'b111;
        3'b111: light_next_state = 3'b000;
    endcase
end

// Output Logic
assign light = right_state ? {3'b000, light_state} : {light_state, 3'b000};

endmodule
