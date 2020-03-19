module debouncer #(
    parameter width = 1,
    parameter sample_count_max = 25000,
    parameter pulse_count_max = 150,
    parameter wrapping_counter_width = $clog2(sample_count_max),
    parameter saturating_counter_width = $clog2(pulse_count_max))
(
    input clk,
    input [width-1:0] glitchy_signal,
    output [width-1:0] debounced_signal
);
    // Create your debouncer circuit
    // The debouncer takes in a bus of 1-bit synchronized, but glitchy signals
    // and should output a bus of 1-bit signals that hold high when their respective counter saturates
    // Remove this line once you create your synchronizer
    // assign debounced_signal = 0;

    //Sample Pulse Generator block
    //Input:clk. Output: sample_pulse
    reg [wrapping_counter_width-1:0] sample_counter = 0;
    reg sample_pulse = 0;
    /* verilator lint_off WIDTH */
    wire [wrapping_counter_width-1:0] s_count_max = sample_count_max;
    /* lint_on */

    always @(posedge clk) begin
        if (sample_counter == s_count_max) begin
            sample_counter <= 0;
            sample_pulse <= 1;
        end
        else begin
            sample_counter <= sample_counter + 1;
            sample_pulse <= 0;
        end
    end
    
    reg [saturating_counter_width-1:0] s_counters [width-1:0];
    reg [width-1:0] switchOut = 'd0;
    integer k;
    initial begin
        for (k = 0; k < width; k = k + 1) begin
            s_counters[k] = 0;
        end
    end

    genvar i;
    generate
        for (i = 0; i < width; i = i + 1) begin:SATURATE_COUNTER
            always @(posedge clk) begin
                if (s_counters[i] == pulse_count_max && glitchy_signal[i] == 1)
                    switchOut[i] <= 1;
                else  begin
                    if (sample_pulse == 1) begin
                        if (glitchy_signal[i] == 1)
                            s_counters[i] <= s_counters[i] + 1;
                        else
                            s_counters[i] <= 0;
                            switchOut[i] <= 0;
                    end
                end
            end
        end
    endgenerate
    assign debounced_signal = switchOut;
endmodule