module fifo #(
    parameter data_width = 8,
    parameter fifo_depth = 32,
    parameter addr_width = $clog2(fifo_depth)
) (
    input clk, rst,

    // Write side
    input wr_en,
    input [data_width-1:0] din,
    output full,

    // Read side
    input rd_en,
    output [data_width-1:0] dout,
    output empty
);

    //Memory
    reg [data_width-1:0] mem [fifo_depth-1:0];
    integer k;
    initial begin
        for (k = 0; k < fifo_depth; k = k + 1) begin
            mem[k] = 0;
        end
    end

    // Read & Write address ptr
    reg [addr_width-1:0] rd_ptr, wr_ptr;
    // Use for memory is full; wr_ptr wraps around
    // TOGGLE when rd_ptr or wr_ptr wraps around
    reg rd_ptr_msb, wr_ptr_msb;

    reg [data_width-1:0] data_out;

    wire check_full, check_empty;
    assign check_full = (rd_ptr == wr_ptr) && (rd_ptr_msb != wr_ptr_msb);
    assign check_empty = (rd_ptr == wr_ptr) && (rd_ptr_msb == wr_ptr_msb);

    always@(posedge clk) begin
        if (rst) begin
            rd_ptr <= 0;
            wr_ptr <= 0;
            rd_ptr_msb <= 0;
            wr_ptr_msb <= 0;
        end
        
        // Not full then write
        // increase wr_ptr and wraps around if needed
        if (!check_full && wr_en) begin
            mem[wr_ptr] <= din;
            if (wr_ptr == fifo_depth - 1) begin
                wr_ptr <= 0;
                wr_ptr_msb <= ~wr_ptr_msb;
            end else
                wr_ptr <= wr_ptr + 1;
            
        end

        //Not Empty then read
        // increase rd_ptr and wraps around if needed
        if (!check_empty && rd_en) begin
            data_out <= mem[rd_ptr];
            if (rd_ptr == fifo_depth - 1) begin
                rd_ptr <= 0;
                rd_ptr_msb <= ~rd_ptr_msb;
            end else
                rd_ptr <= rd_ptr + 1;
        end

    end

    // Outputs
    assign full = check_full;
    assign empty = check_empty;
    assign dout = data_out;
endmodule
