`timescale 1ns / 1ps

module shift_register_4bit (
    input clk,
    input rst,
    input din,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (rst)
            q <= 4'b0000;
        else
            q <= {q[2:0], din};
    end
endmodule


// TEST - BENCH //


`timescale 1ns / 1ps

module shift_register_4bit_tb;
    reg clk;
    reg rst;
    reg din;
    wire [3:0] q;

    shift_register_4bit uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        din = 0;
        #10 rst = 0;

        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        #20 $finish;
    end
endmodule



