`timescale 10 ns / 1 ns

`define DATA_WIDTH 32

module alu(
	input  [`DATA_WIDTH - 1:0]  A,
	input  [`DATA_WIDTH - 1:0]  B,
	input  [              2:0]  ALUop,
	output                      Overflow,
	output                      CarryOut,
	output                      Zero,
	output [`DATA_WIDTH - 1:0]  Result
);

	wire [`DATA_WIDTH - 1:0] AND, OR, XOR, CAL, SLT, SLTU;
	wire [`DATA_WIDTH - 1:0] B_Comp;
	wire C;
	wire isSub;

	assign isSub = ALUop[2] | &(~ALUop ^ 3'b011);

	// ALUop[2] 即为 isSub
	// 如果是作减法，B按位取反
	assign B_Comp = {`DATA_WIDTH{isSub}} ^ B;

    // 计算
	assign AND = A & B;
	assign OR  = A | B;
	assign XOR  = A ^ B;
	/* // 双符号位法
	assign {C, CAL} = {A[`DATA_WIDTH - 1], A} + {B_Comp[`DATA_WIDTH - 1], B_Comp} + ALUop[2];
	assign SLT = C;

    // flag
	assign CarryOut = C ^ A[`DATA_WIDTH - 1] ^ B_Comp[`DATA_WIDTH - 1] ^ ALUop[2];
	assign Overflow = CAL[`DATA_WIDTH - 1] ^ C;
	*/
	// 单符号位法
	assign {C, CAL} = A + B_Comp + isSub;
	assign SLT = CAL[`DATA_WIDTH - 1] ^ Overflow;
	assign SLTU = CarryOut;

    // flag
	assign CarryOut = isSub ^ C;
	assign Overflow = ~A[`DATA_WIDTH - 1] & ~B_Comp[`DATA_WIDTH - 1] &  CAL[`DATA_WIDTH - 1] |
					   A[`DATA_WIDTH - 1] &  B_Comp[`DATA_WIDTH - 1] & ~CAL[`DATA_WIDTH - 1] ;
	assign Zero = ~|Result;

	// 数据选择器，结果
	assign Result = {`DATA_WIDTH{&(~ALUop ^ 3'b000)}}		& AND |
					{`DATA_WIDTH{&(~ALUop[1:0] ^ 2'b01)}}	& (OR ^ {32{ALUop[2]}}) |
					{`DATA_WIDTH{&(~ALUop ^ 3'b100)}}		& XOR |
					{`DATA_WIDTH{&(~ALUop[1:0] ^ 2'b10)}}	& CAL |
					{`DATA_WIDTH{&(~ALUop ^ 3'b011)}}		& SLTU |
					{`DATA_WIDTH{&(~ALUop ^ 3'b111)}}		& SLT ;

endmodule
