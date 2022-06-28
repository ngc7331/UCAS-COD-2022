`timescale 10ns / 1ns
// `include "fpga/design/ucas-cod/hardware/sources/reg_file/reg_file.v"
// `include "fpga/design/ucas-cod/hardware/sources/alu/alu.v"
// `include "fpga/design/ucas-cod/hardware/sources/shifter/shifter.v"

module simple_cpu(
	input             clk,
	input             rst,

	output [31:0]     PC,
	input  [31:0]     Instruction,

	output [31:0]     Address,
	output            MemWrite,
	output [31:0]     Write_data,
	output [ 3:0]     Write_strb,

	input  [31:0]     Read_data,
	output            MemRead
);

	localparam IF  = 5'b00001,
	           ID  = 5'b00010,
	           EX  = 5'b00100,
	           MEM = 5'b01000,
	           WB  = 5'b10000;

	reg [4:0] current_state;
	reg [4:0] next_state;
	// current_state
	always @(posedge clk) begin
		if (rst) begin
			current_state <= IF;
		end
		else begin
			current_state <= next_state;
		end
	end
	// next_state
	always @(*) begin
		case (current_state)
			IF: begin
				next_state = ID;
			end
			ID: begin
				if (~|__Instruction) begin // __Instruction == 32'b0 -> nop
				 	next_state = IF;
				end
			    else begin               // not nop
					next_state = EX;
				end
			end
			EX: begin
				if (T_RI | T_IB | T_J & !opcode[0]) begin    // REGIMM, I-type branch, J
					next_state = IF;
				end
				else if (T_R | T_IC | T_J & opcode[0]) begin // R-type, I-type caculate, JAL
					next_state = WB;
				end
				else begin                                   // I-type memory (store/load)
					next_state = MEM;
				end
			end
			MEM: begin
				if (opcode[3]) begin //store
					next_state = IF;
				end
				else begin           // load
					next_state = WB;
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

	// THESE THREE SIGNALS ARE USED IN OUR TESTBENCH
	// PLEASE DO NOT MODIFY SIGNAL NAMES
	// AND PLEASE USE THEM TO CONNECT PORTS
	// OF YOUR INSTANTIATION OF THE REGISTER FILE MODULE
	wire			RF_wen;
	wire [4:0]		RF_waddr;
	wire [31:0]		RF_wdata;

	// PC
	reg [31:0] __PC;
	always @(posedge clk) begin
		if (rst) begin
			__PC <= 32'b0;
		end
		else if (current_state[0]) begin // IF
			__PC <= ALU_Res; // PC + 4
		end
		else if (current_state[2]) begin // EX
			if (T_R_J) begin
				__PC <= RF_rdata1;
			end
			else if (T_IB & (opcode[0] ^ ~|__ALU_Res ^ (|RF_rdata1 & opcode[1]))) begin
				__PC <= ALU_Res; // PC + offset
			end
			else if (T_J) begin
				__PC <= {PC[31:28], instr_index, 2'b00};
			end
		end
	end
	assign PC = __PC;

	// IF: instruction register
	reg [31:0] __Instruction;
	always @(posedge clk) begin
		if (current_state == IF) begin
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
	assign T_IM = opcode[5] == 1;
	// R-type flags
	wire T_R_A, T_R_S, T_R_J, T_R_M;
	assign T_R_A = T_R && func[5];
	assign T_R_S = T_R && ~|func[5:3];
	assign T_R_J = T_R && {func[5:3], func[1]} == 4'b0010;
	assign T_R_M = T_R && {func[5:3], func[1]} == 4'b0011;
	// lui
	wire T_LUI;
	assign T_LUI = opcode == 6'b001111;

	// reg file
	wire [4:0]  RF_raddr1, RF_raddr2;
	wire [31:0] RF_rdata1, RF_rdata2;
	assign RF_waddr  = T_R ? rd : T_J ? 5'b11111 : rt;
	assign RF_raddr1 = rs;
	assign RF_raddr2 = T_RI ? 0 : rt;
	assign RF_wen    = current_state[4] & (T_R_A | T_R_S | T_R_J & func[0] | T_R_M & (func[0] ^ Zero) | T_J & opcode[0] | T_IC | T_IM & ~opcode[3]);
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

	assign ALU_A = current_state[0] | T_J | T_R_J | current_state[2] & T_IB ? PC
	             : T_R_M ? 0
				 : RF_rdata1;
	assign ALU_B = current_state[0] | T_J | T_R_J ? 4
				 : current_state[2] & T_IB ? {imm[29:0], 2'b00} // caculte PC+offset on EX state
	             : T_IC | T_IM ? imm
	             : RF_rdata2;

	assign ALUop_fa = T_R & (func[3:2] == 2'b00) | T_IC & (opcode[2:1] == 2'b00);
	assign ALUop_fl = T_R & (func[3:2] == 2'b01) | T_IC & (opcode[2] == 1'b1);
	assign ALUop_fc = T_R & (func[3:2] == 2'b10) | T_IC & (opcode[2:1] == 2'b01);

	assign ALUop_g = {2{T_R}} & func[1:0] | {2{T_IC}} & opcode[1:0];
	assign ALUop_T_R = {3{ALUop_fa}} & {ALUop_g[1], 2'b10}
	                 | {3{ALUop_fl}} & {ALUop_g[1], 1'b0, ALUop_g[0]}
	                 | {3{ALUop_fc}} & {~ALUop_g[0], 2'b11};

	assign ALUop = T_J | T_R_J | T_IM | T_R_M | current_state[0] | current_state[2] & T_IB ? 3'b010
	             : T_R_A | T_R_S | T_IC ? ALUop_T_R
	             : T_RI                 ? 3'b111
				 : {2'b11, opcode[1]}; // caculate T_IB condition on ID state

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
	assign Shifter_A = T_IM ? (MemWrite ? RF_rdata2 : Read_data) // 访存操作用于对齐运算
	                 : RF_rdata2;
	assign Shifter_B = T_IM ? ({opcode[2:0] == 3'b010 ? ~ALU_Res[1:0] : ALU_Res[1:0], 3'b000}) // 访存操作用于对齐运算
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
	assign mem_Shifter_A = MemWrite ? (opcode[2:0] == 3'b010 ? 32'b1111
	                                                         : {{2{opcode[1]}}, opcode[2] ^ opcode[0], (opcode[2] ^ opcode[0]) | ~|opcode[2:0]})
	                                : 32'b11111111111111111111111111111111;
	assign mem_Shifter_B = opcode[2:0] == 3'b010 ? (MemWrite ? {3'b000, ~ALU_Res[1:0]} : {~ALU_Res[1:0], 3'b000})
	                                             : (MemWrite ? {3'b000, ALU_Res[1:0]} : {ALU_Res[1:0], 3'b000});
	assign mem_Shiftop = (opcode[2:0] == 3'b010 && MemWrite || opcode[2:0] != 3'b010 && MemRead) ? 2'b10 : 2'b00;

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
	assign MemRead = current_state[3] & T_IM & ~opcode[3];
	assign MemWrite = current_state[3] & T_IM & opcode[3];
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
		if (current_state[3]) begin
			__Read_data_ext <= Read_data_ext;
		end
	end

endmodule
