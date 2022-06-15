`timescale 10ns / 1ns

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
