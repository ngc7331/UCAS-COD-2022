`timescale 10ns / 1ns

`define CACHE_SET	8
`define CACHE_WAY	4
`define TAG_LEN		24
`define LINE_LEN	256

module dcache_top (
	input	      clk,
	input	      rst,
  
	//CPU interface
	/** CPU memory/IO access request to Cache: valid signal */
	input         from_cpu_mem_req_valid,
	/** CPU memory/IO access request to Cache: 0 for read; 1 for write (when req_valid is high) */
	input         from_cpu_mem_req,
	/** CPU memory/IO access request to Cache: address (4 byte alignment) */
	input  [31:0] from_cpu_mem_req_addr,
	/** CPU memory/IO access request to Cache: 32-bit write data */
	input  [31:0] from_cpu_mem_req_wdata,
	/** CPU memory/IO access request to Cache: 4-bit write strobe */
	input  [ 3:0] from_cpu_mem_req_wstrb,
	/** Acknowledgement from Cache: ready to receive CPU memory access request */
	output        to_cpu_mem_req_ready,
		
	/** Cache responses to CPU: valid signal */
	output        to_cpu_cache_rsp_valid,
	/** Cache responses to CPU: 32-bit read data */
	output [31:0] to_cpu_cache_rsp_data,
	/** Acknowledgement from CPU: Ready to receive read data */
	input         from_cpu_cache_rsp_ready,
		
	//Memory/IO read interface
	/** Cache sending memory/IO read request: valid signal */
	output        to_mem_rd_req_valid,
	/** Cache sending memory read request: address
	  * 4 byte alignment for I/O read 
	  * 32 byte alignment for cache read miss */
	output [31:0] to_mem_rd_req_addr,
        /** Cache sending memory read request: burst length
	  * 0 for I/O read (read only one data beat)
	  * 7 for cache read miss (read eight data beats) */
	output [ 7:0] to_mem_rd_req_len,
        /** Acknowledgement from memory: ready to receive memory read request */
	input	      from_mem_rd_req_ready,

	/** Memory return read data: valid signal of one data beat */
	input	      from_mem_rd_rsp_valid,
	/** Memory return read data: 32-bit one data beat */
	input  [31:0] from_mem_rd_rsp_data,
	/** Memory return read data: if current data beat is the last in this burst data transmission */
	input	      from_mem_rd_rsp_last,
	/** Acknowledgement from cache: ready to receive current data beat */
	output        to_mem_rd_rsp_ready,

	//Memory/IO write interface
	/** Cache sending memory/IO write request: valid signal */
	output        to_mem_wr_req_valid,
	/** Cache sending memory write request: address
	  * 4 byte alignment for I/O write 
	  * 4 byte alignment for cache write miss
          * 32 byte alignment for cache write-back */
	output [31:0] to_mem_wr_req_addr,
        /** Cache sending memory write request: burst length
          * 0 for I/O write (write only one data beat)
          * 0 for cache write miss (write only one data beat)
          * 7 for cache write-back (write eight data beats) */
	output [ 7:0] to_mem_wr_req_len,
        /** Acknowledgement from memory: ready to receive memory write request */
	input         from_mem_wr_req_ready,

	/** Cache sending memory/IO write data: valid signal for current data beat */
	output        to_mem_wr_data_valid,
	/** Cache sending memory/IO write data: current data beat */
	output [31:0] to_mem_wr_data,
	/** Cache sending memory/IO write data: write strobe
	  * 4'b1111 for cache write-back 
	  * other values for I/O write and cache write miss according to the original CPU request*/ 
	output [ 3:0] to_mem_wr_data_strb,
	/** Cache sending memory/IO write data: if current data beat is the last in this burst data transmission */
	output        to_mem_wr_data_last,
	/** Acknowledgement from memory/IO: ready to receive current data beat */
	input	      from_mem_wr_data_ready
);

  //TODO: Please add your D-Cache code here

    /* --- states --- */
    localparam WAIT   = 10'b0000000001,
               TAG_RD = 10'b0000000010,
               CACHE  = 10'b0000000100,  // cache write and read
               RESP   = 10'b0000001000,
               EVICT  = 10'b0000010000,
               MEM_RD = 10'b0000100000,
               RECV   = 10'b0001000000,
               REFILL = 10'b0010000000,
               MEM_WT = 10'b0100000000,
               SEND   = 10'b1000000000;

    reg [9:0] current_state;
    reg [9:0] next_state;

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
                if (from_cpu_mem_req_valid) begin
                    if (bypass & from_cpu_mem_req)        // bypass write
                        next_state = MEM_WT;
                    else if (bypass & !from_cpu_mem_req)  // bypass read
                        next_state = MEM_RD;
                    else                                  // tag
                        next_state = TAG_RD;
                end
                else                                      // IDLE
                    next_state = WAIT;
            end
            TAG_RD: begin
                if (hit)
                    next_state = CACHE;
                else
                    next_state = EVICT;
            end
            CACHE: begin
                if (__from_cpu_mem_req)  // write -> no need for resp
                    next_state = WAIT;
                else             // read -> resp
                    next_state = RESP;
            end
            RESP: begin
                if (from_cpu_cache_rsp_ready)
                    next_state = WAIT;
                else
                    next_state = RESP;
            end
            EVICT: begin
                if (dirty)
                    next_state = MEM_WT;
                else
                    next_state = MEM_RD;
            end
            MEM_RD: begin
                if (from_mem_rd_req_ready)
                    next_state = RECV;
                else
                    next_state = MEM_RD;
            end
            RECV: begin
                if (from_mem_rd_rsp_valid & from_mem_rd_rsp_last) begin
                    if (bypass)
                        next_state = WAIT;
                    else
                        next_state = REFILL;
                end
                else
                    next_state = RECV;
            end
            REFILL: begin
                if (__from_cpu_mem_req)  // write -> write cache
                    next_state = CACHE;
                else             // read -> no need for write
                    next_state = RESP;
            end
            MEM_WT: begin
                if (from_mem_wr_req_ready)
                    next_state = SEND;
                else
                    next_state = MEM_WT;
            end
            SEND: begin
                if (from_mem_wr_data_ready & to_mem_wr_data_last) begin
                    if (bypass)
                        next_state = WAIT;
                    else
                        next_state = MEM_RD;
                end
                else
                    next_state = SEND;
            end
            default: begin
                next_state = WAIT;
            end
        endcase
    end



    // --- regs ---
    reg [31:0] __from_cpu_mem_req_addr, __from_cpu_mem_req_wdata;
    reg [4:0] __from_cpu_mem_req_wstrb;
    reg __from_cpu_mem_req;
    always @(posedge clk) begin
        if (current_state[0] & from_cpu_mem_req_valid) begin
            __from_cpu_mem_req_addr  <= from_cpu_mem_req_addr;
            __from_cpu_mem_req_wdata <= from_cpu_mem_req_wdata;
            __from_cpu_mem_req_wstrb <= from_cpu_mem_req_wstrb;
            __from_cpu_mem_req       <= from_cpu_mem_req;
        end
    end



    // --- control ---
    // decode
    wire [23:0] from_cpu_tag;
    wire [2:0] from_cpu_index;
    wire [4:0] from_cpu_offset;
    assign {from_cpu_tag, from_cpu_index, from_cpu_offset} = __from_cpu_mem_req_addr;

    wire [7:0] index_mask;
    assign index_mask = 1 << from_cpu_index;

    // bypass?
    wire bypass;
    assign bypass = |__from_cpu_mem_req_addr[31:30] | ~|__from_cpu_mem_req_addr[31:5];  //0x40000000~0xFFFFFFFF | 0x00~0x1F

    // hit?
    wire hit;
    wire [3:0] hit_way;  // one-hot
    wire [1:0] hit_way_num;
    assign hit = |hit_way;
    assign hit_way = {
        tag_rdata[3] == from_cpu_tag & |(valid_array[3] & index_mask),
        tag_rdata[2] == from_cpu_tag & |(valid_array[2] & index_mask),
        tag_rdata[1] == from_cpu_tag & |(valid_array[1] & index_mask),
        tag_rdata[0] == from_cpu_tag & |(valid_array[0] & index_mask)
    };
    assign hit_way_num = {hit_way[3] | hit_way[2], hit_way[3] | hit_way[1]};

    // EVICT: LRU method
    wire [3:0] evict_way;  // one-hot
    wire [1:0] evict_way_num, evict_way_tmp[1:0];
    wire [31:0] evict_counter[3:0], evict_max_tmp[1:0];
    wire counter_clk = current_state[1] | rst & clk;
    assign evict_way = {
        &evict_way_num,
        evict_way_num[1] & ~evict_way_num[0],
        ~evict_way_num[1] & evict_way_num[0],
        ~|evict_way_num
    };

    counter counter_0 (
        .clk(counter_clk),
        .rst(rst),
        .clr(hit_way[0]),
        .index(from_cpu_index),
        .data(evict_counter[0])
    );
    counter counter_1 (
        .clk(counter_clk),
        .rst(rst),
        .clr(hit_way[1]),
        .index(from_cpu_index),
        .data(evict_counter[1])
    );
    counter counter_2 (
        .clk(counter_clk),
        .rst(rst),
        .clr(hit_way[2]),
        .index(from_cpu_index),
        .data(evict_counter[2])
    );
    counter counter_3 (
        .clk(counter_clk),
        .rst(rst),
        .clr(hit_way[3]),
        .index(from_cpu_index),
        .data(evict_counter[3])
    );

    comparator max_0 (
        .way1(2'b0),
        .way2(2'b1),
        .way(evict_way_tmp[0]),
        .data1(evict_counter[0]),
        .data2(evict_counter[1]),
        .data(evict_max_tmp[0])
    );
    comparator max_1 (
        .way1(2'b10),
        .way2(2'b11),
        .way(evict_way_tmp[1]),
        .data1(evict_counter[2]),
        .data2(evict_counter[3]),
        .data(evict_max_tmp[1])
    );
    comparator max_final (
        .way1(evict_way_tmp[0]),
        .way2(evict_way_tmp[1]),
        .way(evict_way_num),
        .data1(evict_max_tmp[0]),
        .data2(evict_max_tmp[1]),
        .data()
    );

    // dirty?
    wire dirty;
    assign dirty = evict_way[3] & |(dirty_array[3] & index_mask)
                 | evict_way[2] & |(dirty_array[2] & index_mask)
                 | evict_way[1] & |(dirty_array[1] & index_mask)
                 | evict_way[0] & |(dirty_array[0] & index_mask);



    // --- cpu ---
    assign to_cpu_mem_req_ready = current_state[0];  // WAIT

    // rsp
    assign to_cpu_cache_rsp_data = bypass ? rd_buffer[0]
                                 : cache_data >> {from_cpu_offset, 3'b0};
    assign to_cpu_cache_rsp_valid = current_state[3];  // RESP



    // --- mem ---
    // read request
    assign to_mem_rd_req_valid = current_state[5];  // MEM_RD
    assign to_mem_rd_req_addr = bypass ? {__from_cpu_mem_req_addr[31:2], 2'b0}
                              : {__from_cpu_mem_req_addr[31:5], 5'b0};
    assign to_mem_rd_req_len = bypass ? 8'b0 : 8'b111;

    // read receive
    assign to_mem_rd_rsp_ready = current_state[6];  // RECV

    reg [31:0] rd_buffer[7:0];
    always @(posedge clk) begin
        if (to_mem_rd_rsp_ready & from_mem_rd_rsp_valid) begin
            rd_buffer[burst_counter] <= from_mem_rd_rsp_data;
        end
    end

    // write request
    assign to_mem_wr_req_valid = current_state[8];  // MEM_WT
    assign to_mem_wr_req_addr = bypass ? {__from_cpu_mem_req_addr[31:2], 2'b0}
                              : {evict_tag, from_cpu_index, 5'b0};
    assign to_mem_wr_req_len = to_mem_rd_req_len;

    // write send
    assign to_mem_wr_data_valid = current_state[9];  // SEND
    assign to_mem_wr_data_strb = bypass ? __from_cpu_mem_req_wstrb : 4'b1111;

    assign to_mem_wr_data = bypass ? __from_cpu_mem_req_wdata
                          : evict_data >> {burst_counter, 5'b0};

    assign to_mem_wr_data_last = burst_counter == to_mem_rd_req_len;

    // burst counter
    reg [7:0] burst_counter;
    always @(posedge clk) begin
        if (rst | current_state[5] | current_state[8])  // reset or MEM_RD or MEM_WT
            burst_counter <= 8'b0;
        else if (to_mem_rd_rsp_ready & from_mem_rd_rsp_valid | from_mem_wr_data_ready & to_mem_wr_data_valid)
            burst_counter <= burst_counter + 1;
    end



    // --- data array ---
    wire cache_write;
    wire [3:0] data_wen;
    wire [255:0] data_wdata, data_rdata[3:0], write_mask;
    assign write_mask = {{8{__from_cpu_mem_req_wstrb[3]}}, {8{__from_cpu_mem_req_wstrb[2]}}, {8{__from_cpu_mem_req_wstrb[1]}}, {8{__from_cpu_mem_req_wstrb[0]}}} << {from_cpu_offset, 3'b000};
    assign cache_write = current_state[2] & __from_cpu_mem_req;
    assign data_wdata = cache_write ? ((__from_cpu_mem_req_wdata) << {from_cpu_offset, 3'b000}) & write_mask | cache_data & ~write_mask // write
                      : {rd_buffer[7], rd_buffer[6], rd_buffer[5], rd_buffer[4], rd_buffer[3], rd_buffer[2], rd_buffer[1], rd_buffer[0]};  // read
    assign data_wen = {4{current_state[7]}} & evict_way | {4{cache_write}} & hit_way;  // REFILL on read / write miss ; CACHE on write hit

    wire [255:0] cache_data;
    assign cache_data = hit_way[0] ? data_rdata[0]
                      : hit_way[1] ? data_rdata[1]
                      : hit_way[2] ? data_rdata[2]
                      : data_rdata[3];
    wire [255:0] evict_data;
    assign evict_data = evict_way[0] ? data_rdata[0]
                      : evict_way[1] ? data_rdata[1]
                      : evict_way[2] ? data_rdata[2]
                      : data_rdata[3];

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
    wire [23:0] evict_tag;
    assign evict_tag = evict_way[0] ? tag_rdata[0]
                     : evict_way[1] ? tag_rdata[1]
                     : evict_way[2] ? tag_rdata[2]
                     : tag_rdata[3];

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
    always @(posedge clk) begin
        if (rst) begin
            valid_array[0] <= 8'b0;
            valid_array[1] <= 8'b0;
            valid_array[2] <= 8'b0;
            valid_array[3] <= 8'b0;
        end
        else if (current_state[4]) begin  // EVICT
            valid_array[evict_way_num][from_cpu_index] <= 0;
        end
        else if (current_state[7]) begin  // REFILL
            valid_array[evict_way_num][from_cpu_index] <= 1;
        end
    end



    // --- dirty array ---
    reg [7:0] dirty_array[3:0];
    always @(posedge clk) begin
        if (rst) begin
            dirty_array[0] <= 8'b0;
            dirty_array[1] <= 8'b0;
            dirty_array[2] <= 8'b0;
            dirty_array[3] <= 8'b0;
        end
        else if (current_state[2] & __from_cpu_mem_req) begin  // CACHE & write
            dirty_array[hit_way_num][from_cpu_index] <= 1;
        end
    end

endmodule
