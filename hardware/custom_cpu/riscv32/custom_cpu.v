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
    output [31:0] cpu_perf_cnt_15
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
    wire [69:0] inst_retire;
    assign inst_retire = {RF_wen, RF_waddr, RF_wdata, PC};

    // TODO: Please add your custom CPU code here

    /* --- performance counter --- */
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

    reg [31:0] mem_cycle_cnt;
    always @(posedge clk) begin
        if (rst) begin
            mem_cycle_cnt <= 32'b0;
        end
        else if (current_state == IF || current_state == IW ||
                 current_state == ST || current_state == LD || current_state == RDW) begin
            mem_cycle_cnt <= mem_cycle_cnt + 1;
        end
    end
    assign cpu_perf_cnt_1 = mem_cycle_cnt;

    reg [31:0] nop_cnt;
    always @(posedge clk) begin
        if (rst) begin
            nop_cnt <= 32'b0;
        end
        else if (current_state == ID && ~|IR) begin
            nop_cnt <= nop_cnt + 1;
        end
    end
    assign cpu_perf_cnt_2 = nop_cnt;


    /* --- states --- */
    localparam INIT = 9'b000000001, // initial
               IF   = 9'b000000010, // inst fetch
               IW   = 9'b000000100, // inst fetch wait
               ID   = 9'b000001000, // decode
               EX   = 9'b000010000, // execute
               ST   = 9'b000100000, // mem write
               LD   = 9'b001000000, // mem read
               RDW  = 9'b010000000, // mem read wait
               WB   = 9'b100000000;

    reg [8:0] current_state;
    reg [8:0] next_state;
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
                if (Inst_Req_Ready) begin
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
                next_state = EX;
            end
            EX: begin
                if (T_B) begin        // B-type
                    next_state = IF;
                end
                else if (T_IL) begin  // I-type load
                    next_state = LD;
                end
                else if (T_S) begin   // S-type
                    next_state = ST;
                end 
                else begin            // R-type, I-type caculate, JALR, J-type, U-type
                    next_state = WB;
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
            default: begin
                next_state = IF;
            end 
        endcase
    end


    // PC
    reg [31:0] __PC, __4PC;
    always @(posedge clk) begin
        if (rst) begin
            __PC <= 32'b0;
        end
        else if (current_state[3] && !(T_B & (funct3[0] ^ funct3[2] ^ Zero) | T_J)) begin
            // PC + 4 is caculate in IW, if not branch, update in ID
            __PC <= __4PC;
        end
        else if (current_state[4] && (T_J | T_IJ | T_B & (funct3[0] ^ funct3[2] ^ ~|__ALU_Res))) begin
            // PC + imm is caculate in EX and update here
            __PC <= ALU_Res;
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            __4PC <= 32'b0;
        end
        else if (current_state[2] && Inst_Valid) begin
            __4PC <= __ALU_Res;
        end
    end
    assign PC = __PC;

    // IF: instruction register
    assign Inst_Req_Valid = current_state[1];
    assign Inst_Ready = current_state[2] | current_state[0];
    reg [31:0] IR;
    always @(posedge clk) begin
        if (rst) begin
            IR <= 32'b0;
        end
        else if (current_state[2] && Inst_Valid) begin
            IR <= Instruction;
        end
    end

    // ID: instruction decode
    wire [4:0] rs1, rs2, rd, shamt;
    wire [6:0] funct7, opcode;
    wire [2:0] funct3;
    wire [31:0] imm;
    assign {funct7, rs2, rs1, funct3, rd, opcode} = IR;
    assign shamt = IR[24:20];
    assign imm = T_I ? {{20{IR[31]}}, IR[31:20]}
               : T_S ? {{20{IR[31]}}, IR[31:25], IR[11:7]}
               : T_B ? {{20{IR[31]}}, IR[7], IR[30:25], IR[11:8], 1'b0}
               : T_U ? {IR[31:12], 12'b0}
               : {{12{IR[31]}}, IR[19:12], IR[20], IR[30:21], 1'b0}; // T_J

    // type flags
    wire T_R, T_RS, T_S, T_B, T_U, T_J, T_I, T_IL, T_IC, T_ICS, T_IJ;
    assign T_R  = {opcode[5:4], opcode[2]} == 3'b110;
    assign T_RS = T_R & funct3[1:0] == 2'b01;
    assign T_S  = opcode[6:4] == 3'b010;
    assign T_B  = {opcode[6], opcode[2]} == 2'b10;
    assign T_J  = {opcode[6], opcode[3:2]} == 3'b111;
    assign T_U  = {opcode[6], opcode[3:2]} == 3'b001;
    assign T_I  = T_IL | T_IC | T_IJ;
    assign T_IL = opcode[5:4] == 2'b00;
    assign T_IC = {opcode[5:4], opcode[2]} == 3'b010;
    assign T_ICS = T_IC & funct3[1:0] == 2'b01;
    assign T_IJ = {opcode[6], opcode[3:2]} == 3'b101;

    // reg file
    wire [4:0]  RF_raddr1, RF_raddr2;
    wire [31:0] RF_rdata1, RF_rdata2;
    wire        RF_wen;
    wire [4:0]  RF_waddr;
    wire [31:0] RF_wdata;
    assign RF_waddr  = rd;
    assign RF_raddr1 = rs1;
    assign RF_raddr2 = rs2;
    assign RF_wen    = current_state[8] & (T_R | T_I | T_J | T_U);
    assign RF_wdata  = T_R & ~T_RS | T_IC & ~T_ICS | T_U & ~opcode[5] ? ALU_Res // T_U & ~opcode[5] = AUIPC
                     : T_RS | T_ICS ? Shifter_Res
                     : T_IJ | T_J ? __4PC
                     : T_IL ? __Read_data_ext
                     : imm; // LUI

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
    wire [2:0] ALUop;
    wire [2:0] ALUop_g;
    wire Overflow, CarryOut, Zero;

    assign ALU_A = current_state[2] | current_state[4] & T_B | T_J | T_U & ~opcode[5]? PC
                 : RF_rdata1; // T_B | T_R | T_I 
    assign ALU_B = current_state[2] ? 4
                 : current_state[4] & T_B | T_J | T_U & ~opcode[5]? imm
                 : T_R | T_B ? RF_rdata2
                 : imm; // T_I

    assign ALUop_g = funct3 == 3'b000 ? {funct7[5] & T_R, 2'b10}
                   : funct3 == 3'b010 ? 3'b111
                   : funct3 == 3'b011 | funct3 == 3'b100 ? funct3
                   : ~funct3;
    assign ALUop = current_state[2] | current_state[4] & T_B | T_S | T_IL | T_IJ | T_J | T_U & ~opcode[5]? 3'b010
                 : T_R | T_IC ? ALUop_g
                 : {~funct3[1], 1'b1, funct3[2]}; // T_B

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
    assign Shifter_A = T_R | T_IC ? RF_rdata1
                     : T_S ? RF_rdata2                    // T_S, align
                     : Read_data;                         // T_IL, align
    assign Shifter_B = T_R ? RF_rdata2[4:0]
                     : T_S | T_IL ? {ALU_Res[1:0], 3'b0}  // align
                     : T_IC ? shamt
                     : 0;
    assign Shiftop   = T_S | T_IL ? mem_Shiftop           // align
                     : {funct3[2], funct7[5]};

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
    assign mem_Shifter_A = {28'b0, {2{funct3[1]}}, funct3[1] | funct3[0], 1'b1};  // T_S
    assign mem_Shifter_B = {3'b000, ALU_Res[1:0]};                                // T_S 
    assign mem_Shiftop = {T_IL, 1'b0}; // write<<, read>>

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
    // handshake
    assign MemRead = current_state[6];
    assign MemWrite = current_state[5];
    assign Read_data_Ready = current_state[7] | current_state[0];

    assign Address = {ALU_Res[31:2], 2'b00};
    assign Write_data = Shifter_Res;
    assign Write_strb = mem_Shifter_Res[3:0];
    assign Read_sign = funct3[1:0] == 2'b00 ? Shifter_Res[7]
                     : funct3[1:0] == 2'b01 ? Shifter_Res[15]
                     : Shifter_Res[31];  // funct3[1:0] == 2'b10
    assign Read_mask = {{16{funct3[1]}}, {8{funct3[1] | funct3[0]}}, 8'b11111111};
    assign Read_data_ext = Read_mask & Shifter_Res | ~Read_mask & {32{Read_sign & ~funct3[2]}};

    always @(posedge clk) begin
        if (current_state[7]) begin
            __Read_data_ext <= Read_data_ext;
        end
    end

endmodule
