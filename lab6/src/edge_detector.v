module edge_detector #(
    parameter width = 1
)(
    input clk,
    input [width-1:0] signal_in,
    output [width-1:0] edge_detect_pulse
);
    // The edge detector takes a bus of 1-bit signals and looks for a low to high (0 -> 1)
    // logic transition. It outputs a 1 clock cycle wide pulse if a transition is detected.

    reg [width-1:0] prev = 'd0;
    always @(posedge clk)
        prev <= signal_in;
    
    assign edge_detect_pulse = ~prev & signal_in;

endmodule


