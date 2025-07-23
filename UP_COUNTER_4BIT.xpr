module up_counter_4bit(
    input clk,
    input rst,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            count <= 4'b0000;
        else
            count <= count + 1;
    end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module tb_up_counter_4bit;

    reg clk;
    reg rst;
    wire [3:0] count;

    up_counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #12 rst = 0;

        #200;
        $stop;
    end

endmodule
