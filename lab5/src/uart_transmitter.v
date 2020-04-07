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

    reg [3:0] bit_counter;
    reg out;

    assign symbol_edge = clock_counter == (SYMBOL_EDGE_TIME - 1);
    assign tx_running = bit_counter != 4'd0;

    always@(posedge clk) begin
        clock_counter <= (clock_counter == SYMBOL_EDGE_TIME) ? 0: clock_counter + 1;
    end
    
    always@(posedge clk) begin
        if(reset)
            bit_counter <= 0;
        else if (data_in_valid)
            bit_counter <= 4'd10;
        else if (symbol_edge && tx_running)
            bit_counter <= bit_counter - 4'd1;
    end
    
    always@(*) begin
        if (bit_counter == 4'd10)
            out = 0;
        else if (bit_counter <= 4'd1)
            out = 1;
        else
            out = data_in[bit_counter - 1];
    end

    //--|Signal Assignments|------------------------------------------------------
    assign serial_out = out;
    assign data_in_ready = tx_running;



endmodule