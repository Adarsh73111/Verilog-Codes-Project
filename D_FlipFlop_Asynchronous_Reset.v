`timescale 1ns / 1ps

module d_ff_async(
    input clk,
    input rst,
    input d,
    output reg q
    );

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module tb_d_ff_async();

    reg clk;
    reg rst;
    reg d;
    wire q;

    d_ff_async uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; d = 0;
        #12 rst = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #3 rst = 1;
        #2 rst = 0;
        #15 $stop;
    end

endmodule
