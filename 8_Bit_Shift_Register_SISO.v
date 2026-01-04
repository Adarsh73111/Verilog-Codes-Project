`timescale 1ns / 1ps

module siso_shift_register_8bit (
    input clk,
    input rst,
    input din,
    output dout
);

reg [7:0] q;

assign dout = q[7];

always @(posedge clk) begin
    if (rst)
        q <= 8'b00000000;
    else
        q <= {q[6:0], din};
end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module siso_shift_register_8bit_tb;

reg clk;
reg rst;
reg din;
wire dout;

siso_shift_register_8bit uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    din = 0;
    #10;
    rst = 0;

    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 0; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 0; #10;

    $finish;
end

endmodule

