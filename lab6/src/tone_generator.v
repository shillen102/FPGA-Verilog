`timescale 1ns/1ns
module tone_generator (
    input clk,
    input rst,
    input output_enable,
    input [23:0] tone_switch_period,
    input volume,
    output square_wave_out
);
    // TODO: copy your solution from lab3 here
    reg [23:0] counter;
    reg out;
    reg pwm; // for duty cycle
    reg in_good;

    always @(posedge clk) begin
        if (rst) begin
            counter <= 24'd0;
            out <= 0;
            in_good <= 1;
        end
        else begin
            if (counter >= (tone_switch_period << 1))
                counter <= 0;
            else
                counter <= counter + 1;
            if (tone_switch_period == 0)
                in_good <= 0;
            else begin
                in_good <= 1;
                if (counter == tone_switch_period || counter == 2 * tone_switch_period)
                    out <= ~out;
                else
                    out <= out;
            end
        end
    end

    // pulse width modulation
    //volume = 1, duty cycle = 50%
    //volume = 0, duty cycle = 25%
    always @(posedge clk) begin
        
        if (volume == 1)
            if (counter[1] == 1)
                pwm <= 1;
            else
                pwm <= 0;
        else
            if (counter[1] == 1 && counter[0] == 1)
                pwm <= 1;
            else
                pwm <= 0;
    end
    assign square_wave_out = (output_enable && in_good && pwm) ? out : 1'b0;
endmodule
