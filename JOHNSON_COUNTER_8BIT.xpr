`timescale 1ns / 1ps

module johnson_counter_8bit(
    input clk,
    input rst,
    output reg [7:0] count
    );

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 8'b00000000;
    else
        count <= {~count[7], count[7:1]};
end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module johnson_counter_8bit_tb;

reg clk;
reg rst;
wire [7:0] count;

johnson_counter_8bit uut (
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
    #800 $stop;
end

endmodule
