`timescale 1ns / 1ps

module counter_4bit_down(
    input clk,
    input rst,
    output reg [3:0] count
    );

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'd15;
    else
        count <= count - 1;
end

endmodule



// TEST - BENCH //

`timescale 1ns / 1ps

module counter_4bit_down_tb;

reg clk;
reg rst;
wire [3:0] count;

counter_4bit_down uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
end

always #5 clk = ~clk;

initial begin
    #200 $stop;
end

endmodule

