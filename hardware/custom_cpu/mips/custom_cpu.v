`timescale 10ns / 1ns

module custom_cpu(
	input         clk,
	input         rst,

	//Instruction request channel
	output [31:0] PC,
	output        Inst_Req_Valid,
	input         Inst_Req_Ready,

	//Instruction response channel
	input  [31:0] Instruction,
	input         Inst_Valid,
	output        Inst_Ready,

	//Memory request channel
	output [31:0] Address,
	output        MemWrite,
	output [31:0] Write_data,
	output [ 3:0] Write_strb,
	output        MemRead,
	input         Mem_Req_Ready,

	//Memory data response channel
	input  [31:0] Read_data,
	input         Read_data_Valid,
	output        Read_data_Ready,

	input         intr,

	output [31:0] cpu_perf_cnt_0,
	output [31:0] cpu_perf_cnt_1,
	output [31:0] cpu_perf_cnt_2,
	output [31:0] cpu_perf_cnt_3,
	output [31:0] cpu_perf_cnt_4,
	output [31:0] cpu_perf_cnt_5,
	output [31:0] cpu_perf_cnt_6,
	output [31:0] cpu_perf_cnt_7,
	output [31:0] cpu_perf_cnt_8,
	output [31:0] cpu_perf_cnt_9,
	output [31:0] cpu_perf_cnt_10,
	output [31:0] cpu_perf_cnt_11,
	output [31:0] cpu_perf_cnt_12,
	output [31:0] cpu_perf_cnt_13,
	output [31:0] cpu_perf_cnt_14,
	output [31:0] cpu_perf_cnt_15,

	output [69:0] inst_retire
);

/* The following signal is leveraged for behavioral simulation, 
* which is delivered to testbench.
*
* STUDENTS MUST CONTROL LOGICAL BEHAVIORS of THIS SIGNAL.
*
* inst_retired (70-bit): detailed information of the retired instruction,
* mainly including (in order) 
* { 
*   reg_file write-back enable  (69:69,  1-bit),
*   reg_file write-back address (68:64,  5-bit), 
*   reg_file write-back data    (63:32, 32-bit),  
*   retired PC                  (31: 0, 32-bit)
* }
*
*/
    reg [31:0] retired_PC;
    always @(posedge clk) begin
        if (current_state[2] && Inst_Valid) begin  // IW
            retired_PC <= PC;
        end
    end
    assign inst_retire = {RF_wen, RF_waddr, RF_wdata, retired_PC};

    // TODO: Please add your custom CPU code here

    /* --- performance counter --- */
    // total cycle
    reg [31:0] cycle_cnt;
    always @(posedge clk) begin
        if (rst) begin
            cycle_cnt <= 32'b0;
        end
        else begin
            cycle_cnt <= cycle_cnt + 1;
        end
    end
    assign cpu_perf_cnt_0 = cycle_cnt;

    // memory access
    reg [31:0] mem_cycle_cnt;
    reg [31:0] if_cycle_cnt;
    reg [31:0] wt_cycle_cnt;
    reg [31:0] rd_cycle_cnt;
    always @(posedge clk) begin
        if (rst) begin
            mem_cycle_cnt <= 32'b0;
            if_cycle_cnt <= 32'b0;
            wt_cycle_cnt <= 32'b0;
            rd_cycle_cnt <= 32'b0;
        end
        else if (current_state == IF || current_state == IW) begin
            mem_cycle_cnt <= mem_cycle_cnt + 1;
            if_cycle_cnt <= if_cycle_cnt + 1;
        end
        else if (current_state == ST) begin
            mem_cycle_cnt <= mem_cycle_cnt + 1;
            wt_cycle_cnt <= wt_cycle_cnt + 1;
        end
        else if (current_state == LD || current_state == RDW) begin
            mem_cycle_cnt <= mem_cycle_cnt + 1;
            rd_cycle_cnt <= rd_cycle_cnt + 1;
        end
    end
    assign cpu_perf_cnt_1 = mem_cycle_cnt;
    assign cpu_perf_cnt_4 = if_cycle_cnt;
    assign cpu_perf_cnt_5 = wt_cycle_cnt;
    assign cpu_perf_cnt_6 = rd_cycle_cnt;

    // instruction
    reg [31:0] inst_cnt;
    reg [31:0] nop_cnt;
    reg [31:0] jump_cnt;
    always @(posedge clk) begin
        if (rst) begin
            inst_cnt <= 32'b0;
            nop_cnt <= 32'b0;
            jump_cnt <= 32'b0;
        end
        else if (current_state == ID) begin
            inst_cnt <= inst_cnt + 1;
            if (~|__Instruction) begin
                nop_cnt <= nop_cnt + 1;
            end
            else if (T_R_J | T_J | T_IB) begin
                jump_cnt <= jump_cnt + 1;
            end
        end
    end
    assign cpu_perf_cnt_2 = inst_cnt;
    assign cpu_perf_cnt_3 = nop_cnt;
    assign cpu_perf_cnt_7 = jump_cnt;


    /* --- states --- */
    localparam INIT = 10'b0000000001,  // initial
               IF   = 10'b0000000010,  // inst fetch
               IW   = 10'b0000000100,  // inst fetch wait
               ID   = 10'b0000001000,  // decode
               EX   = 10'b0000010000,  // execute
               ST   = 10'b0000100000,  // mem write
               LD   = 10'b0001000000,  // mem read
               RDW  = 10'b0010000000,  // mem read wait
               WB   = 10'b0100000000,  // write back to reg_file
               INTR = 10'b1000000000;  // interrupt

    reg [9:0] current_state;
    reg [9:0] next_state;
    // current_state
    always @(posedge clk) begin
        if (rst) begin
            current_state <= INIT;
        end
        else begin
            current_state <= next_state;
        end
    end
    // next_state
    always @(*) begin
        case (current_state)
            INIT: begin
                next_state = IF;
            end
            IF: begin
                if (intr & !intr_shield) begin
                    next_state = INTR;
                end
                else if (Inst_Req_Ready) begin
                    next_state = IW;
                end
                else begin
                    next_state = IF;
                end
            end
            IW: begin
                if (Inst_Valid) begin
                    next_state = ID;
                end
                else begin
                    next_state = IW;
                end
            end
            ID: begin
                if (~|__Instruction) begin // __Instruction == 32'b0 -> nop
                     next_state = IF;
                end
                else begin                 // not nop
                    next_state = EX;
                end
            end
            EX: begin
                if (T_RI | T_IB | T_J & !opcode[0] | T_ERET) begin    // REGIMM, I-type branch, J, ERET
                    next_state = IF;
                end
                else if (T_R | T_IC | T_J & opcode[0]) begin // R-type, I-type caculate, JAL
                    next_state = WB;
                end
                else if (opcode[3]) begin                    // I-type store
                    next_state = ST;
                end
                else begin                                   // I-type load
                    next_state = LD;
                end
            end
            ST: begin
                if (Mem_Req_Ready) begin
                    next_state = IF;
                end
                else begin
                    next_state = ST;
                end
            end
            LD: begin
                if (Mem_Req_Ready) begin
                    next_state = RDW;
                end
                else begin
                    next_state = LD;
                end
            end
            RDW: begin
                if (Read_data_Valid) begin
                    next_state = WB;
                end
                else begin
                    next_state = RDW;
                end
            end
            WB: begin
                next_state = IF;
            end
            INTR: begin
                next_state = IF;
            end
            default: begin
                next_state = IF;
            end
        endcase
    end


    /* --- INTR --- */
    reg intr_shield;
    always @(posedge clk) begin
        if (rst | current_state[4] & T_ERET) begin
            intr_shield <= 1'b0;
        end
        else if (intr & current_state[1]) begin
            intr_shield <= 1'b1;
        end
    end

    reg [31:0] __EPC;
    always @(posedge clk) begin
        if (intr & !intr_shield & current_state[1]) begin
            __EPC <= __PC;
        end
    end


    // PC
    reg [31:0] __PC;
    always @(posedge clk) begin
        if (rst) begin
            __PC <= 32'b0;
        end
        else if (current_state[9]) begin  // INTR
            __PC <= 32'h100;
        end
        else if (current_state[2] && Inst_Valid) begin  // IDW
            __PC <= ALU_Res;                            // PC + 4
        end
        else if (current_state[4]) begin                // EX
            if (T_R_J) begin
                __PC <= RF_rdata1;
            end
            else if (T_IB & (opcode[0] ^ ~|__ALU_Res ^ (|RF_rdata1 & opcode[1])) | (T_RI & (|__ALU_Res ^ rt[0]))) begin
                __PC <= ALU_Res;                        // PC + offset
            end
            else if (T_J) begin
                __PC <= {PC[31:28], instr_index, 2'b00};
            end
            else if (T_ERET) begin
                __PC <= __EPC;
            end
        end
    end
    assign PC = __PC;

    // IF: instruction register
    assign Inst_Req_Valid = current_state[1];
    assign Inst_Ready = current_state[2] | current_state[0];
    reg [31:0] __Instruction;
    always @(posedge clk) begin
        if (rst) begin
            __Instruction <= 32'b0;
        end
        else if (current_state[2] && Inst_Valid) begin
            __Instruction <= Instruction;
        end
    end
    // ID: instruction decode
    wire [5:0] opcode, func;
    wire [4:0] rs, rt, rd, shamt;
    wire [31:0] imm;
    wire [25:0] instr_index;
    assign {opcode, rs, rt, rd, shamt, func} = __Instruction;
    assign imm = {{16{__Instruction[15] & ~(ALUop_fl & T_IC)}}, __Instruction[15:0]};
    assign instr_index = __Instruction[26:0];

    // type flags
    wire T_R, T_RI, T_J, T_IB, T_IC, T_IM;
    assign T_R  = opcode == 6'b0;
    assign T_RI = opcode == 6'b1;
    assign T_J  = opcode[5:1] == 5'b1;
    assign T_IB = opcode[5:2] == 4'b1;
    assign T_IC = opcode[5:3] == 3'b1;
    assign T_IM = opcode[5];
    // R-type flags
    wire T_R_A, T_R_S, T_R_J, T_R_M;
    assign T_R_A = T_R && func[5];
    assign T_R_S = T_R && ~|func[5:3];
    assign T_R_J = T_R && {func[5:3], func[1]} == 4'b0010;
    assign T_R_M = T_R && {func[5:3], func[1]} == 4'b0011;
    // lui
    wire T_LUI;
    assign T_LUI = T_IC & &opcode[2:0];
    // eret
    wire T_ERET;
    assign T_ERET = opcode[4];

    // reg file
    wire [4:0]  RF_raddr1, RF_raddr2;
    wire [31:0] RF_rdata1, RF_rdata2;
    wire        RF_wen;
    wire [4:0]  RF_waddr;
    wire [31:0] RF_wdata;
    assign RF_waddr  = T_R ? rd : T_J ? 5'b11111 : rt;
    assign RF_raddr1 = rs;
    assign RF_raddr2 = T_RI ? 0 : rt;
    assign RF_wen    = current_state[8] & (T_R_A | T_R_S | T_R_J & func[0] | T_R_M & (func[0] ^ Zero) | T_J & opcode[0] | T_IC | T_IM & ~opcode[3]);
    assign RF_wdata  = T_R_A | T_R_J | T_J | T_IC & ~T_LUI ? __ALU_Res
                     : T_R_S ? Shifter_Res
                     : T_LUI ? {imm[15:0], 16'b0}
                     : T_IM  ? __Read_data_ext
                     : RF_rdata1;

    reg_file u_reg_file (
        .clk (clk),
        .waddr (RF_waddr),
        .raddr1 (RF_raddr1),
        .raddr2 (RF_raddr2),
        .wen (RF_wen),
        .wdata (RF_wdata),
        .rdata1 (RF_rdata1),
        .rdata2 (RF_rdata2)
    );

    // alu
    reg [31:0] __ALU_Res;
    wire [31:0] ALU_A, ALU_B, ALU_Res;
    wire [2:0] ALUop, ALUop_T_R;
    wire [1:0] ALUop_g;
    wire ALUop_fa, ALUop_fl, ALUop_fc;
    wire Overflow, CarryOut, Zero;

    assign ALU_A = current_state[2] | T_J | T_R_J | current_state[4] & (T_IB | T_RI) ? PC
                 : T_R_M ? 0
                 : RF_rdata1;
    assign ALU_B = current_state[2] | T_J | T_R_J ? 4
                 : current_state[4] & (T_IB | T_RI) ? {imm[29:0], 2'b00}  // caculte PC+offset on EX state
                 : T_IC | T_IM ? imm
                 : RF_rdata2;

    assign ALUop_fa = T_R & (func[3:2] == 2'b00) | T_IC & (opcode[2:1] == 2'b00);
    assign ALUop_fl = T_R & (func[3:2] == 2'b01) | T_IC & (opcode[2] == 1'b1);
    assign ALUop_fc = T_R & (func[3:2] == 2'b10) | T_IC & (opcode[2:1] == 2'b01);

    assign ALUop_g = {2{T_R}} & func[1:0] | {2{T_IC}} & opcode[1:0];
    assign ALUop_T_R = {3{ALUop_fa}} & {ALUop_g[1], 2'b10}
                     | {3{ALUop_fl}} & {ALUop_g[1], 1'b0, ALUop_g[0]}
                     | {3{ALUop_fc}} & {~ALUop_g[0], 2'b11};

    assign ALUop = T_J | T_R_J | T_IM | T_R_M | current_state[2] | current_state[4] & (T_IB | T_RI) ? 3'b010
                 : T_R_A | T_R_S | T_IC ? ALUop_T_R
                 : T_RI                 ? 3'b111
                 : {2'b11, opcode[1]};  // caculate T_IB condition on ID state

    alu m_alu (
        .A (ALU_A),
        .B (ALU_B),
        .ALUop (ALUop),
        .Overflow (Overflow),
        .CarryOut (CarryOut),
        .Zero (Zero),
        .Result (ALU_Res)
    );

    always @(posedge clk) begin
        __ALU_Res <= ALU_Res;
    end

    // main shifter
    wire [31:0] Shifter_A;
    wire [4:0]  Shifter_B;
    wire [1:0]  Shiftop;
    wire [31:0] Shifter_Res;
    assign Shifter_A = T_IM ? (opcode[3] ? RF_rdata2 : Read_data)  // 访存操作用于对齐运算
                     : RF_rdata2;
    assign Shifter_B = T_IM ? ({opcode[2:0] == 3'b010 ? ~ALU_Res[1:0] : ALU_Res[1:0], 3'b000})  // 访存操作用于对齐运算
                     : func[2] ? RF_rdata1[4:0] : shamt;
    assign Shiftop   = T_IM ? mem_Shiftop : // 访存操作用于对齐运算
                       func[1:0];

    shifter main_shifter (
        .A (Shifter_A),
        .B (Shifter_B),
        .Shiftop (Shiftop),
        .Result (Shifter_Res)
    );

    // memory load/store shifter
    wire [31:0] mem_Shifter_A;
    wire [4:0]  mem_Shifter_B;
    wire [1:0]  mem_Shiftop;
    wire [31:0] mem_Shifter_Res;
    assign mem_Shifter_A = opcode[3] ? (opcode[2:0] == 3'b010 ? 32'b1111
                                                             : {{2{opcode[1]}}, opcode[2] ^ opcode[0], (opcode[2] ^ opcode[0]) | ~|opcode[2:0]})
                                    : 32'b11111111111111111111111111111111;
    assign mem_Shifter_B = opcode[2:0] == 3'b010 ? (opcode[3] ? {3'b000, ~ALU_Res[1:0]} : {~ALU_Res[1:0], 3'b000})
                                                 : (opcode[3] ? {3'b000, ALU_Res[1:0]} : {ALU_Res[1:0], 3'b000});
    assign mem_Shiftop = (opcode[2:0] == 3'b010 && opcode[3] || opcode[2:0] != 3'b010 && ~opcode[3]) ? 2'b10 : 2'b00;

    shifter mem_shifter (
        .A (mem_Shifter_A),
        .B (mem_Shifter_B),
        .Shiftop (mem_Shiftop),
        .Result (mem_Shifter_Res)
    );

    // memory
    reg [31:0] __Read_data_ext;
    wire[31:0] Read_mask, Read_data_ext;
    wire Read_sign;
    assign Address = {ALU_Res[31:2], 2'b00};
    assign MemRead = current_state[6];
    assign Read_data_Ready = current_state[7] | current_state[0];
    assign MemWrite = current_state[5];
    assign Write_data = Shifter_Res;
    assign Write_strb = mem_Shifter_Res[3:0];
    assign Read_sign = opcode[1:0] == 2'b00 ? Shifter_Res[7]
                     : opcode[1:0] == 2'b01 ? Shifter_Res[15]
                     : opcode[1:0] == 2'b11 ? Shifter_Res[31]
                     : 0;
    assign Read_mask = opcode[1:0] == 2'b10 ? mem_Shifter_Res
                     : {{16{opcode[1]}} ,{8{opcode[0]}} , 8'b11111111};
    assign Read_data_ext = opcode[1:0] == 2'b10 ? Shifter_Res | ~Read_mask & RF_rdata2
                         : Read_mask & Shifter_Res | ~Read_mask & {32{Read_sign & ~opcode[2]}};

    always @(posedge clk) begin
        if (current_state[7]) begin
            __Read_data_ext <= Read_data_ext;
        end
    end

endmodule
