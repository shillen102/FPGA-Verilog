`timescale 1ns/1ps

`define CLOCK_PERIOD 8
`define CLOCK_FREQ 125_000_000
`define BAUD_RATE 115_200

/*
    In this testbench, we instantiate 2 UARTs. They are connected via the serial lines (FPGA_SERIAL_RX/TX).
    Our testbench is given access to the 1st UART's transmitter's ready/valid interface and the 2nd UART's
    receiver's ready/valid interface. The testbench then directs the transmitter to send a character and then
    waits for the receiver to acknowlege that data has been sent to it. It then reads the data from the receiver
    and compares it to what was transmitted.
*/
module uart_testbench();
    // Generate 125 MHz clock
    reg clk = 0;
    always #(`CLOCK_PERIOD/2) clk = ~clk;

    // I/O of off-chip and on-chip UART
    wire FPGA_SERIAL_RX, FPGA_SERIAL_TX;
    reg reset;

    reg [7:0] data_in;
    reg data_in_valid;
    wire data_in_ready;

    wire [7:0] data_out;
    wire data_out_valid;
    reg data_out_ready;

    //Test back to back UART
    reg [7:0] on_data_in;
    reg on_data_in_valid;
    wire on_data_in_ready;

    wire [7:0] screen_out;
    wire screen_out_valid;
    reg screen_out_ready;

    uart # (
        .CLOCK_FREQ(`CLOCK_FREQ),
        .BAUD_RATE(`BAUD_RATE)
    ) off_chip_uart (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_in_valid(data_in_valid),
        .data_in_ready(data_in_ready),
        .data_out(screen_out), // We aren't using the receiver of the off-chip UART, only the transmitter
        .data_out_valid(screen_out_valid),
        .data_out_ready(screen_out_ready),
        .serial_in(FPGA_SERIAL_RX),
        .serial_out(FPGA_SERIAL_TX)
    );

    uart # (
        .CLOCK_FREQ(`CLOCK_FREQ),
        .BAUD_RATE(`BAUD_RATE)
    ) on_chip_uart (
        .clk(clk),
        .reset(reset),
        .data_in(on_data_in), // We aren't using the transmitter of the on-chip UART, only the receiver
        .data_in_valid(on_data_in_valid), // added data_in, data_in_valid, data_in_ready for back to back UART
        .data_in_ready(on_data_in_ready), // 
        .data_out(data_out),
        .data_out_valid(data_out_valid),
        .data_out_ready(data_out_ready),
        .serial_in(FPGA_SERIAL_TX), // Notice these lines are connected opposite to the off_chip_uart
        .serial_out(FPGA_SERIAL_RX)
    );

    reg done = 0;
    initial begin
        `ifdef IVERILOG
            $dumpfile("uart_testbench.fst");
            $dumpvars(0,uart_testbench);
        `endif
        `ifndef IVERILOG
            $vcdpluson;
        `endif
        reset = 1'b0;
        data_in = 8'd0;
        data_in_valid = 1'b0;
        data_out_ready = 1'b0;
        repeat (2) @(posedge clk); #1;

        // Reset the UARTs
        reset = 1'b1;
        @(posedge clk); #1;
        reset = 1'b0;

        fork
            begin
                // Wait until the off_chip_uart's transmitter is ready
                while (data_in_ready == 1'b0) @(posedge clk); #1;

                // Send a character to the off chip UART's transmitter to transmit over the serial line
                data_in = 8'h21;
                data_in_valid = 1'b1;
                @(posedge clk); #1;
                data_in_valid = 1'b0;

                // Now, the transmitter should be sending the data_in over the FPGA_SERIAL_TX line to the on chip UART

                // We wait until the on chip UART's receiver indicates that is has valid data it has received
                while (data_out_valid == 1'b0) @(posedge clk); #1;

                // Now, data_out of the on chip UART should contain the data that was sent to it by the off chip UART
                if (data_out !== 8'h21) begin
                    $display("Failure 1: on chip UART got data: %h, but expected: %h", data_out, 8'h21);
                end

                // If we wait a few more clock cycles, the data should still be held by the receiver
                repeat (10) @(posedge clk); #1;
                if (data_out !== 8'h21) begin
                    $display("Failure 2: on chip UART got correct data, but it didn't hold data_out until data_out_ready was asserted");
                end

                // At this point, the off chip UART's transmitter should be idle and the FPGA_SERIAL_TX line should be in the idle state
                if (FPGA_SERIAL_TX !== 1'b1) begin
                    $display("Failure 3: FPGA_SERIAL_TX was not high when the off chip UART's transmitter should be idle");
                end

                // Now, if we assert data_out_ready to the on chip UART's receiver, it should pull its data_out_valid signal low
                data_out_ready = 1'b1;
                @(posedge clk); #1;
                data_out_ready = 1'b0;
                @(posedge clk); #1;
                if (data_out_valid == 1'b1) begin
                    $display("Failure 4: on chip UART didn't clear data_out_valid when data_out_ready was asserted");
                end

                /****** Test back to back UART ******/
                // Wait until the on_chip_uart's transmitter is ready
                while (on_data_in_ready == 1'b0) @(posedge clk); #1;

                // Send a character to the on chip UART's transmitter to transmit over the serial line
                on_data_in = data_out;
                on_data_in_valid = 1'b1;
                @(posedge clk); #1;
                on_data_in_valid = 1'b0;

                // Now, the transmitter should be sending the data_in over the FPGA_SERIAL_RX line to the on chip UART

                // We wait until the off chip UART's receiver indicates that is has valid data it has received
                while (screen_out_valid == 1'b0) @(posedge clk); #1;

                // Now, data_out of the off chip UART should contain the data that was sent to it by the off chip UART
                if (screen_out !== 8'h21) begin
                    $display("Failure b1: on chip UART got data: %h, but expected: %h", screen_out, 8'h21);
                end

                // If we wait a few more clock cycles, the data should still be held by the receiver
                repeat (10) @(posedge clk); #1;
                if (screen_out !== 8'h21) begin
                    $display("Failure b2: on chip UART got correct data, but it didn't hold screen_out until screen_out_ready was asserted");
                end

                // At this point, the on chip UART's transmitter should be idle and the FPGA_SERIAL_RX line should be in the idle state
                if (FPGA_SERIAL_RX !== 1'b1) begin
                    $display("Failure b3: FPGA_SERIAL_RX was not high when the off chip UART's transmitter should be idle");
                end

               
                // Now, if we assert screen_out_ready to the on chip UART's receiver, it should pull its screen_out_valid signal low
                screen_out_ready = 1'b1;
                @(posedge clk); #1;
                screen_out_ready = 1'b0;
                @(posedge clk); #1;
                if (screen_out_valid == 1'b1) begin
                    $display("Failure b4: on chip UART didn't clear screen_out_valid when screen_out_ready was asserted");
                end
                /* End back to back UART */
                
                repeat (50) @(posedge clk); #1;
                
                // Wait until the off_chip_uart's transmitter is ready
                while (data_in_ready == 1'b0) @(posedge clk); #1;

                // Send a character to the off chip UART's transmitter to transmit over the serial line
                data_in = 8'h10;
                data_in_valid = 1'b1;
                @(posedge clk); #1;
                data_in_valid = 1'b0;

                // Now, the transmitter should be sending the data_in over the FPGA_SERIAL_TX line to the on chip UART

                // We wait until the on chip UART's receiver indicates that is has valid data it has received
                while (data_out_valid == 1'b0) @(posedge clk); #1;

                // Now, data_out of the on chip UART should contain the data that was sent to it by the off chip UART
                if (data_out !== 8'h10) begin
                    $display("Failure 1: on chip UART got data: %h, but expected: %h", data_out, 8'h10);
                end

                // If we wait a few more clock cycles, the data should still be held by the receiver
                repeat (10) @(posedge clk); #1;
                if (data_out !== 8'h10) begin
                    $display("Failure 2: on chip UART got correct data, but it didn't hold data_out until data_out_ready was asserted");
                end

                // At this point, the off chip UART's transmitter should be idle and the FPGA_SERIAL_TX line should be in the idle state
                if (FPGA_SERIAL_TX !== 1'b1) begin
                    $display("Failure 3: FPGA_SERIAL_TX was not high when the off chip UART's transmitter should be idle");
                end

                // Now, if we assert data_out_ready to the on chip UART's receiver, it should pull its data_out_valid signal low
                data_out_ready = 1'b1;
                @(posedge clk); #1;
                data_out_ready = 1'b0;
                @(posedge clk); #1;
                if (data_out_valid == 1'b1) begin
                    $display("Failure 4: on chip UART didn't clear data_out_valid when data_out_ready was asserted");
                end
                done = 1;
                

            end
            begin
                repeat (50000) @(posedge clk);
                if (!done) begin
                    $display("Failure: timing out");
                    $finish();
                end
            end
        join

        repeat (20) @(posedge clk);
        $display("Test Successful");
        `ifndef IVERILOG
            $vcdplusoff;
        `endif
        $finish();
    end
endmodule
