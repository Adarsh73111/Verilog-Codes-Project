`timescale 1ns / 1ps

module piso_shift_register_4bit (
    input clk,
    input rst,
    input load,
    input [3:0] din,
    output dout
);

reg [3:0] q;

assign dout = q[3];

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else if (load)
        q <= din;
    else
        q <= {q[2:0], 1'b0};
end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module piso_shift_register_4bit_tb;

reg clk;
reg rst;
reg load;
reg [3:0] din;
wire dout;

piso_shift_register_4bit uut (
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
    din = 4'b0000;
    #10;
    rst = 0;

    din = 4'b1101;
    load = 1; #10;
    load = 0;

    #40;

    din = 4'b1010;
    load = 1; #10;
    load = 0;

    #40;

    $finish;
end

endmodule
