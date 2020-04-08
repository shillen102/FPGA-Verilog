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

    reg [CLOCK_COUNTER_WIDTH-1:0] clock_counter;

    wire symbol_edge;
    wire tx_running; 

    reg state; //0: idle  & 1: transfer
    reg [3:0] bit_counter;
    reg [9:0] tx_register;

    // Goes high at every symbol edge
    /* verilator lint_off WIDTH */
    assign symbol_edge = clock_counter == (SYMBOL_EDGE_TIME - 1);
    /* lint_on */

    // Goes high while we are sending a character
    assign tx_running = bit_counter != 4'd0;

    //Outputs
    assign serial_out = tx_running ? tx_register[bit_counter - 1] : 1'b1;
    assign data_in_ready = !tx_running;

    // Counts cycles until a single symbol is done
    always@(posedge clk) begin
        clock_counter <= (reset || symbol_edge) ? 0: clock_counter + 1;
    end

    // Counts down from 10 bits for every character
    always@(posedge clk) begin
        if (reset) begin
            state <= 0;
            bit_counter <= 0;
            tx_register <= 0;
        end
        if (data_in_valid) begin
            state <= 1;
            tx_register <= {1'b1, data_in, 1'b0};
        end
        if (state && symbol_edge)
            if (bit_counter < 9)
                bit_counter <= bit_counter + 4'd1;
            else begin
                bit_counter <= 0;
                state <= 0;
            end
    end

endmodule
    


