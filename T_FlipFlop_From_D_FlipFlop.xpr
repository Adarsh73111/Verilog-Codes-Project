`timescale 1ns / 1ps

module d_flipflop (
    input clk,
    input d,
    input rst,
    output reg q
);
    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule

module t_flipflop (
    input clk,
    input t,
    input rst,
    output q
);
    wire q_reg;
    wire d;

    assign d = t ^ q_reg;

    d_flipflop dff (  
        .clk(clk),
        .d(d),
        .rst(rst),
        .q(q_reg)
    );

    assign q = q_reg;  
endmodule


// TEST - BENCH //

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
        forever #5 clk = ~clk;  // 10ns clock
    end

    initial begin
        rst = 1; t = 0;
        #12 rst = 0; t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 t = 0;
        #10 $finish;
    end
endmodule
