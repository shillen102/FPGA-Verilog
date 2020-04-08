// Play each note for 1/25th of a second = 0.04s
// cycles of 125 MHz in 0.04s = 0.04 / (1/125MHz) = 5 * 10^6 cycles
`define CYCLES 5000000;

module music_streamer (
    input clk,
    input rst,
    input tempo_up,
    input tempo_down,
    input play_pause,
    input reverse,
    output [2:0] leds,
    output [23:0] tone
);
    reg [23:0] count;
    reg [9:0] address = 10'd0;
    wire [9:0] last_address;
    wire [23:0] data;
    reg [23:0] cycles = 'd5_000_000;

    // tempo_up: decrease the time each tone
    // tempo_down: increase the time each tone
    reg [23:0] temp_diff = 'd1_000_000; 

    //FSM for playing regular, reverse, or pause
    localparam REGULAR_PLAY = 3'b001,
               REVERSE_PLAY = 3'b010,
               PAUSED = 3'b100;
    
    reg [2:0] current_state;
    reg [2:0] next_state;

    rom memory(.address(address),
                .data(data),
                .last_address(last_address));
    
    assign tone = (current_state != PAUSED) ? data : 'd0;
    
    always @(posedge clk) begin
        if (rst) begin
            count <= 24'd0;
            address <= 10'd0;
            cycles <= 'd5_000_000;
        end
        else if (current_state != PAUSED) begin
            if (tempo_up)
                cycles <= cycles - temp_diff;
            else if (tempo_down)
                cycles <= cycles + temp_diff;
            else if (count >= cycles) begin
                count <= 0;
                if (current_state == REGULAR_PLAY)
                    address <= address + 1;
                else if (current_state == REVERSE_PLAY)
                    address <= address - 1;
            end
            else begin
                count <= count + 1;
            end

            if (address >= last_address && current_state == REGULAR_PLAY)
                address <= 0;
            else if(address <= 0 && current_state == REVERSE_PLAY)
                address <= last_address;
        end
    end

    //FSM sequential logic
    always @(posedge clk) begin
        if (rst) current_state <= REGULAR_PLAY;
        else current_state <= next_state;
    end

    //FSM combinatorial logic
    always @(*) begin
        next_state = current_state;
        case(current_state)
            REGULAR_PLAY: begin
                if (play_pause) next_state = PAUSED;
                else if (reverse) next_state = REVERSE_PLAY;
            end
            REVERSE_PLAY: begin
                if (play_pause) next_state = PAUSED;
                else if(reverse) next_state = REGULAR_PLAY;
            end
            PAUSED: begin
                if (play_pause) next_state = REGULAR_PLAY;
            end
            default: begin
                next_state = REGULAR_PLAY;
            end
        endcase
    end

    //LED
    assign leds[0] = (current_state == REGULAR_PLAY) ? 1'b1 : 1'b0;
    assign leds[1] = (current_state == PAUSED) ? 1'b1 : 1'b0;
    assign leds[2] = (current_state == REVERSE_PLAY) ? 1'b1: 1'b0;

endmodule


