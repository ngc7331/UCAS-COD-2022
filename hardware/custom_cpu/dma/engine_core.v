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
    end

    // output
    assign src_base  = __src_base;
    assign dest_base = __dest_base;
    assign tail_ptr  = __tail_ptr;
    assign head_ptr  = __head_ptr;
    assign dma_size  = __dma_size;
    assign ctrl_stat = __ctrl_stat;



    // states
    localparam IDLE = 3'b001,
               REQ  = 3'b010,
               RW   = 3'b100;

    // --- rd ---
    // regs
    reg [2:0] rd_current_state;
    reg [2:0] rd_next_state;

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
                if (wr_current_state == IDLE && head_ptr != tail_ptr) begin
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
                else if (head_ptr == tail_ptr) begin
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

    // read_data



    // --- wr ---
    // regs
    reg [2:0] wr_current_state;
    reg [2:0] wr_next_state;

    // current_state
    always @(posedge clk) begin
        if (rst) begin
            wr_current_state <= IDLE;
        end
        else begin
            wr_current_state <= wr_next_state;
        end
    end

endmodule

