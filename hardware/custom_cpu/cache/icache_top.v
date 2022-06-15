`timescale 10ns / 1ns

`define CACHE_SET	8
`define CACHE_WAY	4
`define TAG_LEN		24
`define LINE_LEN	256

module icache_top (
	input	      clk,
	input	      rst,
	
	//CPU interface
	/** CPU instruction fetch request to Cache: valid signal */
	input         from_cpu_inst_req_valid,
	/** CPU instruction fetch request to Cache: address (4 byte alignment) */
	input  [31:0] from_cpu_inst_req_addr,
	/** Acknowledgement from Cache: ready to receive CPU instruction fetch request */
	output        to_cpu_inst_req_ready,
	
	/** Cache responses to CPU: valid signal */
	output        to_cpu_cache_rsp_valid,
	/** Cache responses to CPU: 32-bit Instruction value */
	output [31:0] to_cpu_cache_rsp_data,
	/** Acknowledgement from CPU: Ready to receive Instruction */
	input	      from_cpu_cache_rsp_ready,

	//Memory interface (32 byte aligned address)
	/** Cache sending memory read request: valid signal */
	output        to_mem_rd_req_valid,
	/** Cache sending memory read request: address (32 byte alignment) */
	output [31:0] to_mem_rd_req_addr,
	/** Acknowledgement from memory: ready to receive memory read request */
	input         from_mem_rd_req_ready,

	/** Memory return read data: valid signal of one data beat */
	input         from_mem_rd_rsp_valid,
	/** Memory return read data: 32-bit one data beat */
	input  [31:0] from_mem_rd_rsp_data,
	/** Memory return read data: if current data beat is the last in this burst data transmission */
	input         from_mem_rd_rsp_last,
	/** Acknowledgement from cache: ready to receive current data beat */
	output        to_mem_rd_rsp_ready
);

//TODO: Please add your I-Cache code here

    /* --- states --- */
    localparam WAIT     = 8'b00000001,
               TAG_RD   = 8'b00000010,
               CACHE_RD = 8'b00000100,
               RESP     = 8'b00001000,
               EVICT    = 8'b00010000,
               MEM_RD   = 8'b00100000,
               RECV     = 8'b01000000,
               REFILL   = 8'b10000000;

    reg [7:0] current_state;
    reg [7:0] next_state;
    // current_state
    always @(posedge clk) begin
        if (rst)
            current_state <= WAIT;
        else
            current_state <= next_state;
    end
    // next_state
    always @(*) begin
        case (current_state)
            WAIT: begin
                if (from_cpu_inst_req_valid)
                    next_state = TAG_RD;
                else
                    next_state = WAIT;
            end
            TAG_RD: begin
                if (read_hit)
                    next_state = CACHE_RD;
                else
                    next_state = EVICT;
            end
            CACHE_RD: begin
                next_state = RESP;
            end
            RESP: begin
                if (from_cpu_cache_rsp_ready)
                    next_state = WAIT;
                else
                    next_state = RESP;
            end
            EVICT: begin
                next_state = MEM_RD;
            end
            MEM_RD: begin
                if (from_mem_rd_req_ready)
                    next_state = RECV;
                else
                    next_state = MEM_RD;
            end
            RECV: begin
                if (from_mem_rd_rsp_valid & from_mem_rd_rsp_last)
                    next_state = REFILL;
                else
                    next_state = RECV;
            end
            REFILL: begin
                next_state = RESP;
            end
            default: begin
                next_state = WAIT;
            end
        endcase
    end



    // --- control ---
    // hit
    wire read_hit;
    wire [3:0] read_hit_way;
    assign read_hit = |read_hit_way;
    assign read_hit_way = {
        tag_rdata[3] == from_cpu_tag & |(valid_array[3] & valid_mask),
        tag_rdata[2] == from_cpu_tag & |(valid_array[2] & valid_mask),
        tag_rdata[1] == from_cpu_tag & |(valid_array[1] & valid_mask),
        tag_rdata[0] == from_cpu_tag & |(valid_array[0] & valid_mask)
    };

    // EVICT: LRU method
    wire [1:0] evict_way, evict_way_tmp[1:0];
    wire [31:0] evict_data[3:0], evict_max_tmp[1:0];
    wire counter_clk = current_state[1] | rst & clk;

    counter counter_0 (
        .clk(counter_clk),
        .rst(rst),
        .clr(read_hit_way[0]),
        .index(from_cpu_index),
        .data(evict_data[0])
    );
    counter counter_1 (
        .clk(counter_clk),
        .rst(rst),
        .clr(read_hit_way[1]),
        .index(from_cpu_index),
        .data(evict_data[1])
    );
    counter counter_2 (
        .clk(counter_clk),
        .rst(rst),
        .clr(read_hit_way[2]),
        .index(from_cpu_index),
        .data(evict_data[2])
    );
    counter counter_3 (
        .clk(counter_clk),
        .rst(rst),
        .clr(read_hit_way[3]),
        .index(from_cpu_index),
        .data(evict_data[3])
    );

    max max_1 (
        .way1(2'b0),
        .way2(2'b1),
        .way(evict_way_tmp[0]),
        .data1(evict_data[0]),
        .data2(evict_data[1]),
        .data(evict_max_tmp[0])
    );
    max max_2 (
        .way1(2'b10),
        .way2(2'b11),
        .way(evict_way_tmp[1]),
        .data1(evict_data[2]),
        .data2(evict_data[3]),
        .data(evict_max_tmp[1])
    );
    max max_final (
        .way1(evict_way_tmp[0]),
        .way2(evict_way_tmp[1]),
        .way(evict_way),
        .data1(evict_max_tmp[0]),
        .data2(evict_max_tmp[1]),
        .data()
    );



    // --- cpu ---
    assign to_cpu_inst_req_ready = current_state[0];  // WAIT

    // req
    wire [23:0] from_cpu_tag;
    wire [2:0] from_cpu_index;
    wire [4:0] from_cpu_offset;
    assign {from_cpu_tag, from_cpu_index, from_cpu_offset} = from_cpu_inst_req_addr;

    // rsp
    wire [255:0] rsp_data;
    assign rsp_data = read_hit_way[0] ? data_rdata[0]
                    : read_hit_way[1] ? data_rdata[1]
                    : read_hit_way[2] ? data_rdata[2]
                    : data_rdata[3];
    assign to_cpu_cache_rsp_data = rsp_data >> {from_cpu_offset, 3'b000};
    assign to_cpu_cache_rsp_valid = current_state[3];  // RESP



    // --- mem ---
    // req
    assign to_mem_rd_req_addr = {from_cpu_inst_req_addr[31:5], 5'b0};
    assign to_mem_rd_req_valid = current_state[5];  // MEM_RD
    
    // rsp
    assign to_mem_rd_rsp_ready = current_state[6];  // RECV

    reg [31:0] buffer [7:0];
    reg [2:0] burst_counter;
    always @(posedge clk) begin
        if (rst | current_state[5])
            burst_counter <= 3'b0;
        else if (to_mem_rd_rsp_ready & from_mem_rd_rsp_valid)
            burst_counter <= burst_counter + 1;
    end

    always @(posedge clk) begin
        if (to_mem_rd_rsp_ready & from_mem_rd_rsp_valid) begin
            buffer[burst_counter] <= from_mem_rd_rsp_data;
        end
    end



    // --- data array ---
    wire [3:0] data_wen;
    wire [255:0] data_wdata, data_rdata[3:0];
    assign data_wdata = {buffer[7], buffer[6], buffer[5], buffer[4], buffer[3], buffer[2], buffer[1], buffer[0]};
    assign data_wen = {
        current_state[7] & &evict_way,
        current_state[7] & evict_way[1] & ~evict_way[0],
        current_state[7] & ~evict_way[1] & evict_way[0],
        current_state[7] & ~|evict_way
    };  // REFILL

    data_array data_way_0 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[0]),
        .wdata(data_wdata),
        .rdata(data_rdata[0])
    );
    data_array data_way_1 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[1]),
        .wdata(data_wdata),
        .rdata(data_rdata[1])
    );
    data_array data_way_2 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[2]),
        .wdata(data_wdata),
        .rdata(data_rdata[2])
    );
    data_array data_way_3 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[3]),
        .wdata(data_wdata),
        .rdata(data_rdata[3])
    );



    // --- tag array ---
    wire [23:0] tag_rdata[3:0];

    tag_array tag_way_0 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[0]),
        .wdata(from_cpu_tag),
        .rdata(tag_rdata[0])
    );
    tag_array tag_way_1 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[1]),
        .wdata(from_cpu_tag),
        .rdata(tag_rdata[1])
    );
    tag_array tag_way_2 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[2]),
        .wdata(from_cpu_tag),
        .rdata(tag_rdata[2])
    );
    tag_array tag_way_3 (
        .clk(clk),
        .waddr(from_cpu_index),
        .raddr(from_cpu_index),
        .wen(data_wen[3]),
        .wdata(from_cpu_tag),
        .rdata(tag_rdata[3])
    );



    // --- valid array ---
    reg [7:0] valid_array[3:0];
    wire [7:0] valid_mask;
    assign valid_mask = 1 << from_cpu_index;
    always @(posedge clk) begin
        if (rst) begin
            valid_array[0] <= 8'b0;
            valid_array[1] <= 8'b0;
            valid_array[2] <= 8'b0;
            valid_array[3] <= 8'b0;
        end
        else if (current_state[4]) begin  // EVICT
            valid_array[evict_way][from_cpu_index] <= 0;
        end
        else if (current_state[7]) begin  // REFILL
            valid_array[evict_way][from_cpu_index] <= 1;
        end
    end

endmodule

module counter(
    input clk,
    input [2:0] index,
    input rst,
    input clr,
    output [31:0] data
);

    reg [31:0] __data[7:0];
    always @(posedge clk) begin
        if (rst) begin
            __data[0] <= 32'b0;
            __data[1] <= 32'b0;
            __data[2] <= 32'b0;
            __data[3] <= 32'b0;
            __data[4] <= 32'b0;
            __data[5] <= 32'b0;
            __data[6] <= 32'b0;
            __data[7] <= 32'b0;
        end
        else if (clr)
            __data[index] <= 32'b0;
        else
            __data[index] <= __data[index] + 1;
    end
    assign data = __data[index];

endmodule

module max(
    input  [1:0]  way1,
    input  [1:0]  way2,
    output [1:0]  way,
    input  [31:0] data1,
    input  [31:0] data2,
    output [31:0] data
);

    wire flag;
    assign flag = way1 > way2;
    assign way  = flag ? way1 : way2;
    assign data = flag ? data1 : data2;

endmodule
