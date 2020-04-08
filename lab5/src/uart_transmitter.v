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
    wire start;

    reg [3:0] bit_counter;
    reg [9:0] tx_register;
    reg [3:0] sent;

    /* verilator lint_off WIDTH */
    assign symbol_edge = clock_counter == (SYMBOL_EDGE_TIME - 1);
    /* lint_on */
    assign tx_running = bit_counter != 4'd0;

    always@(posedge clk) begin
        clock_counter <= (reset || symbol_edge) ? 0: clock_counter + 1;
    end

    // always@(posedge clk) begin
    //     if (reset) begin
    //         bit_counter <= 0;
    //         tx_register <= 0;
    //         sent <= 0;
    //     end else if (data_in_valid) begin
    //         tx_register <= {1'b1, data_in, 1'b0};
    //         sent <= 0;
    //     end else if (symbol_edge && sent < 10) begin
    //         bit_counter <= (bit_counter >= 4'd9) ? 4'd0 : bit_counter + 4'd1;
    //         sent <= sent + 4'd1;
    //     end
    // end

    always@(posedge clk) begin
        if(reset) begin
            bit_counter <= 0;
            tx_register <= 0;
        end else if (data_in_valid && !tx_running) begin
            bit_counter <= 4'd10;
            tx_register <= {1'b1, data_in, 1'b0};
        end else if (symbol_edge && tx_running) begin
            bit_counter <= bit_counter - 4'd1;
            tx_register <= tx_register >> 1;
        end
    end


    //--|Signal Assignments|------------------------------------------------------
    // assign serial_out = (bit_counter == 0) ? 1'b1 : tx_register[bit_counter - 1];
    assign serial_out = (bit_counter == 0) ? 1'b1 : tx_register[0];
    assign data_in_ready = !tx_running;

endmodule
    


