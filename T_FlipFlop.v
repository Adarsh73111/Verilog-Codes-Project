`timescale 1ns / 1ps

module t_flipflop (
    input clk,
    input t,
    input rst,
    output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 0;
    else if (t)
        q <= ~q;
end

endmodule


// test-bench //

`timescale 1ns / 1ps

module t_flipflop_tb;

reg clk;
reg t;
reg rst;
wire q;

t_flipflop uut (
    .clk(clk),
    .t(t),
    .rst(rst),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1; t = 0;
    #10 rst = 0;
    #10 t = 1;
    #10 t = 1;
    #10 t = 0;
    #10 t = 1;
    #10 rst = 1;
    #10 rst = 0; t = 1;
    #20 $finish;
end

endmodule

