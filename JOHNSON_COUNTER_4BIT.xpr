`timescale 1ns / 1ps

module johnson_counter_4bit(
    input clk,
    input rst,
    output reg [3:0] count
    );

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'b0000;
    else
        count <= {~count[3], count[3:1]};
end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module johnson_counter_4bit_tb;

reg clk;
reg rst;
wire [3:0] count;

johnson_counter_4bit uut (
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
    #400 $stop;
end

endmodule

