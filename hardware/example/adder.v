`timescale 10ns / 1ns

module adder (
	input  [7:0] operand0,
	input  [7:0] operand1,
	output [7:0] result
);

	/*TODO: Please add your logic design here*/
	wire cout;
	assign {cout, result} = operand0 + operand1;

endmodule
