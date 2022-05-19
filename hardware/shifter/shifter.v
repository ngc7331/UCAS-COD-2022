`timescale 10 ns / 1 ns

`define DATA_WIDTH 32

module shifter (
	input  [`DATA_WIDTH - 1:0] A,
	input  [              4:0] B,
	input  [              1:0] Shiftop,
	output [`DATA_WIDTH - 1:0] Result
);
	
	wire [`DATA_WIDTH - 1:0] R, L;
	assign L = A << B;
	assign R = ({{`DATA_WIDTH{A[`DATA_WIDTH - 1] & Shiftop[0]}}, A}) >> B;
	assign Result = Shiftop[1] ? R : L;
	
endmodule
