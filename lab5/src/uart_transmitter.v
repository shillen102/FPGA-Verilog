module uart_transmitter #(
    parameter CLOCK_FREQ = 125_000_000,
    parameter BAUD_RATE = 115_200)
(
    input clk,
    input reset,

    input [7:0] data_in,
    input data_in_valid,
    output data_in_ready,

    output serial_out
);
    // See diagram in the lab guide
    localparam  SYMBOL_EDGE_TIME    =   CLOCK_FREQ / BAUD_RATE;
    localparam  CLOCK_COUNTER_WIDTH =   $clog2(SYMBOL_EDGE_TIME);

    // Remove these assignments when implementing this module
    // assign serial_out = 1'b0;
    // assign data_in_ready = 1'b0;

    reg [CLOCK_COUNTER_WIDTH-1:0] clock_counter;

    assign symbol_edge = clock_counter == (SYMBOL_EDGE_TIME - 1);

    //--|Counters|----------------------------------------------------------------

    // Counts cycles until a single symbol is done
    always @(posedge clk) begin
        clock_counter <= (start || reset || symbol_edge) ? 0 : clock_counter + 1;
    end

    reg data_out;
    reg [3:0] bit_counter;
    wire tx_running;
    
    assign tx_running = bit_counter != 4'b0;
    /// do: start, 

    // Count down from 10 bits for every character
    always @(posedge clk) begin
        if (reset) begin
            bit_counter <= 0;
        end else if (start) begin
            bit_counter <= 10;
        end else if (symbol_edge && tx_running) begin
            bit_counter <= bit_counter - 1;
        end
    end

endmodule
