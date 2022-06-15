`timescale 10ns / 1ns

module comparator(
    input  [1:0]  way1,
    input  [1:0]  way2,
    output [1:0]  way,
    input  [31:0] data1,
    input  [31:0] data2,
    output [31:0] data
);

    wire flag;
    assign flag = data1 > data2;
    assign way  = flag ? way1 : way2;
    assign data = flag ? data1 : data2;

endmodule
