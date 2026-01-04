`timescale 1ns / 1ps

module pipo_shift_register_8bit (
    input clk,
    input rst,
    input load,
    input [7:0] din,
    output reg [7:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 8'b00000000;
    else if (load)
        q <= din;
end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module pipo_shift_register_8bit_tb;

reg clk;
reg rst;
reg load;
reg [7:0] din;
wire [7:0] q;

pipo_shift_register_8bit uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .din(din),
    .q(q)
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

    din = 8'b11001100;
    load = 1; #10;
    load = 0;

    din = 8'b10101010;
    #10;

    load = 1; #10;
    load = 0;

    #20;

    $finish;
end

endmodule

