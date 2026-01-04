`timescale 1ns / 1ps

module sipo_shift_register_8bit (
    input clk,
    input rst,
    input load,
    input [7:0] din,
    output dout
);

reg [7:0] q;

assign dout = q[7];

always @(posedge clk) begin
    if (rst)
        q <= 8'b00000000;
    else if (load)
        q <= din;
    else
        q <= {q[6:0], 1'b0};
end

endmodule


// TEST-BENCH

`timescale 1ns / 1ps

module sipo_shift_register_8bit_tb;

reg clk;
reg rst;
reg load;
reg [7:0] din;
wire dout;

sipo_shift_register_8bit uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .din(din),
    .dout(dout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    load = 0;
    din = 8'b00000000;
    #10;
    rst = 0;

    din = 8'b10110110;
    load = 1; #10;
    load = 0;

    #80;

    din = 8'b11001100;
    load = 1; #10;
    load = 0;

    #80;

    $finish;
end

endmodule
