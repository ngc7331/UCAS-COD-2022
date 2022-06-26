`timescale 1ns / 1ps

module engine_core #(
	parameter integer  DATA_WIDTH       = 32
)
(
	input    clk,
	input    rst,
	
	output [31:0]       src_base,
	output [31:0]       dest_base,
	output [31:0]       tail_ptr,
	output [31:0]       head_ptr,
	output [31:0]       dma_size,
	output [31:0]       ctrl_stat,

	input  [31:0]	    reg_wr_data,
	input  [ 5:0]       reg_wr_en,
  
	output              intr,
  
	output [31:0]       rd_req_addr,
	output [ 4:0]       rd_req_len,
	output              rd_req_valid,
	
	input               rd_req_ready,
	input  [31:0]       rd_rdata,
	input               rd_last,
	input               rd_valid,
	output              rd_ready,
	
	output [31:0]       wr_req_addr,
	output [ 4:0]       wr_req_len,
	output              wr_req_valid,
	input               wr_req_ready,
	output [31:0]       wr_data,
	output              wr_valid,
	input               wr_ready,
	output              wr_last,
	
	output              fifo_rden,
	output [31:0]       fifo_wdata,
	output              fifo_wen,
	
	input  [31:0]       fifo_rdata,
	input               fifo_is_empty,
	input               fifo_is_full
);
	// TODO: Please add your logic design here

    // --- ctrl & stat ---
    // regs
    reg [31:0] __src_base, __dest_base, __tail_ptr, __head_ptr, __dma_size, __ctrl_stat;
    always @(posedge clk) begin
        if (reg_wr_en[0]) begin
            __src_base <= reg_wr_data;
        end
    end
    always @(posedge clk) begin
        if (reg_wr_en[1]) begin
            __dest_base <= reg_wr_data;
        end
    end
    always @(posedge clk) begin
        if (reg_wr_en[2]) begin
            __tail_ptr <= reg_wr_data;
        end
        else if (rd_last_burst & wr_last_burst & wr_current_state[0] & rd_current_state[0]) begin
            __tail_ptr <= __tail_ptr + dma_size;
        end
    end
    always @(posedge clk) begin
        if (reg_wr_en[3]) begin
            __head_ptr <= reg_wr_data;
        end
    end
    always @(posedge clk) begin
        if (reg_wr_en[4]) begin
            __dma_size <= reg_wr_data;
        end
    end
    always @(posedge clk) begin
        if (reg_wr_en[5]) begin
            __ctrl_stat <= reg_wr_data;
        end
        if (en & rd_last_burst & wr_last_burst & wr_current_state[0] & rd_current_state[0]) begin
            __ctrl_stat[31] <= 1'b1;
        end
    end

    // cpu output
    assign src_base  = __src_base;
    assign dest_base = __dest_base;
    assign tail_ptr  = __tail_ptr;
    assign head_ptr  = __head_ptr;
    assign dma_size  = __dma_size;
    assign ctrl_stat = __ctrl_stat;
    assign intr = ctrl_stat[31];

    // en
    wire en;
    assign en = ctrl_stat[0];

    //
    wire rd_last_burst, wr_last_burst;
    assign rd_last_burst = rd_burst_counter == burst_total;
    assign wr_last_burst = wr_burst_counter == burst_total;


    // burst control
    wire [31:0] burst_total;
    wire [2:0] last_burst_len = dma_size[4:2] - 1;
    assign burst_total = {5'b0, dma_size[31:5]} + ~&last_burst_len;


    // --- states ---
    localparam IDLE = 4'b0001,
               REQ  = 4'b0010,
               RW   = 4'b0100,
               FIFO = 4'b1000;


    // --- rd ---
    // state regs
    reg [3:0] rd_current_state;
    reg [3:0] rd_next_state;

    // current_state
    always @(posedge clk) begin
        if (rst) begin
            rd_current_state <= IDLE;
        end
        else begin
            rd_current_state <= rd_next_state;
        end
    end

    // next_state
    always @(*) begin
        case (rd_current_state)
            IDLE: begin
                if (en & wr_current_state[0] & head_ptr != tail_ptr & !(rd_last_burst & wr_last_burst)) begin
                    rd_next_state = REQ;
                end
                else begin
                    rd_next_state = IDLE;
                end
            end
            REQ: begin
                if (rd_req_ready) begin
                    rd_next_state = RW;
                end
                else if (rd_last_burst) begin
                    rd_next_state = IDLE;
                end
                else begin
                    rd_next_state = REQ;
                end
            end
            RW: begin
                if (rd_valid & rd_last & !fifo_is_full) begin
                    rd_next_state = REQ;
                end
                else begin
                    rd_next_state = RW;
                end
            end
            default: begin
                rd_next_state = IDLE;
            end
        endcase
    end

    // read mem
    reg [31:0] rd_burst_counter;
    always @(posedge clk) begin
        if (rst | rd_current_state[0] & wr_current_state[0] & en & head_ptr != tail_ptr) begin  // rst or INIT
            rd_burst_counter <= 0;
        end
        else if (rd_current_state[2] & rd_valid & rd_last & !fifo_is_full) begin  // RW
            rd_burst_counter <= rd_burst_counter + 1;
        end
    end

    assign rd_req_valid = rd_current_state[1] & !fifo_is_full;
    assign rd_req_addr = src_base + tail_ptr + {rd_burst_counter, 5'b0};
    assign rd_req_len = burst_total == rd_burst_counter ? {2'b0, last_burst_len} : 5'b111;
    assign rd_ready = rd_current_state[2] & !fifo_is_full;

    // write fifo
    assign fifo_wen = rd_ready & rd_valid;
    assign fifo_wdata = rd_rdata;


    // --- wr ---
    // state regs
    reg [3:0] wr_current_state;
    reg [3:0] wr_next_state;

    // current_state
    always @(posedge clk) begin
        if (rst) begin
            wr_current_state <= IDLE;
        end
        else begin
            wr_current_state <= wr_next_state;
        end
    end

    // next_state
    always @(*) begin
        case (wr_current_state)
            IDLE: begin
                if (en & rd_current_state[0] & head_ptr != tail_ptr & !(rd_last_burst & wr_last_burst)) begin
                    wr_next_state = REQ;
                end
                else begin
                    wr_next_state = IDLE;
                end
            end
            REQ: begin
                if (wr_req_ready & !fifo_is_empty) begin
                    wr_next_state = FIFO;
                end
                else if (wr_last_burst) begin
                    wr_next_state = IDLE;
                end
                else begin
                    wr_next_state = REQ;
                end
            end
            RW: begin
                if (wr_ready & wr_last) begin
                    wr_next_state = REQ;
                end
                else if (wr_ready & !fifo_is_empty) begin
                    wr_next_state = FIFO;
                end
                else begin
                    wr_next_state = RW;
                end
            end
            FIFO: begin
                wr_next_state = RW;
            end
            default: begin
                wr_next_state = IDLE;
            end
        endcase
    end

    // read fifo
    reg [31:0] fifo_rd_buffer;
    assign fifo_rden = !fifo_is_empty & (wr_current_state[1] & wr_req_ready | wr_current_state[2] & wr_ready & !wr_last);  // read a new data from fifo when memory is ready
    always @(posedge clk) begin
        if (wr_current_state[3]) begin  // FIFO
            fifo_rd_buffer <= fifo_rdata;
        end
    end

    // write mem
    reg [31:0] wr_burst_counter;
    always @(posedge clk) begin
        if (rst | wr_current_state[0] & rd_current_state[0] & en & head_ptr != tail_ptr) begin  // rst or INIT
            wr_burst_counter <= 0;
        end
        else if (wr_current_state[2] & wr_ready & wr_last) begin  // RW
            wr_burst_counter <= wr_burst_counter + 1;
        end
    end

    reg [2:0] wr_size;
    always @(posedge clk) begin
        if (rst | wr_current_state[1]) begin  // rst or REQ
            wr_size <= 3'b0;
        end
        else if (wr_current_state[2] & wr_ready) begin  // RW
            wr_size <= wr_size + 1;
        end
    end

    assign wr_req_valid = wr_current_state[1] & !fifo_is_empty;
    assign wr_req_addr = dest_base + tail_ptr + {wr_burst_counter, 5'b0};
    assign wr_req_len = wr_burst_counter == burst_total ? {2'b0, last_burst_len} : 5'b111;
    assign wr_valid = wr_current_state[2];
    assign wr_data = fifo_rd_buffer;
    assign wr_last = wr_size == wr_req_len[2:0];

endmodule

