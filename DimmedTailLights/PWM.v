module PWM(
    input clk,            // Clock input
    input [7:0] duty_cycle,   // Duty cycle input (0-255)
    output reg pwm_out        // PWM output
);

reg [7:0] counter = 0;        // Counter for PWM

always @(posedge clk) begin
    if (counter < duty_cycle)
        pwm_out <= 1;          // Output high if counter < duty_cycle
    else
        pwm_out <= 0;          // Output low otherwise

    counter <= counter + 1;
end

endmodule

