`timescale 1ns / 1ps

module ring_counter_4bit(
    input clk,
    input rst,
    output reg [3:0] count
    );

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'b0001;
    else
        count <= {count[2:0], count[3]};
end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module ring_counter_4bit_tb;

reg clk;
reg rst;
wire [3:0] count;

ring_counter_4bit uut (
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
