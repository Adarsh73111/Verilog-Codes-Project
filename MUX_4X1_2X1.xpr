`timescale 1ns / 1ps

module mux_4X1_2X1(
    input i0,
    input i1,
    input i2,
    input i3,
    input s0,
    input s1,
    output y
);

wire y0;
wire y1;

mux2_1 m1(
    .i0(i0),
    .i1(i1),
    .s(s0),
    .y(y0)
);

mux2_1 m2(
    .i0(i2),
    .i1(i3),
    .s(s0),
    .y(y1)
);

mux2_1 m3(
    .i0(y0),
    .i1(y1),
    .s(s1),
    .y(y)
);

endmodule

module mux2_1(
    input i0,
    input i1,
    input s,
    output y
);

assign y = (s == 0) ? i0 : i1;

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module mux_4X1_2X1_tb;

reg i0;
reg i1;
reg i2;
reg i3;
reg s0;
reg s1;
wire y;

mux_4X1_2X1 uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s0(s0),
    .s1(s1),
    .y(y)
);

initial begin
    i0 = 0;
    i1 = 0;
    i2 = 0;
    i3 = 0;
    s0 = 0;
    s1 = 0;

    i0 = 1; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0; #10;
    i0 = 0; i1 = 1; i2 = 0; i3 = 0; s0 = 1; s1 = 0; #10;
    i0 = 0; i1 = 0; i2 = 1; i3 = 0; s0 = 0; s1 = 1; #10;
    i0 = 0; i1 = 0; i2 = 0; i3 = 1; s0 = 1; s1 = 1; #10;

    $finish;
end

endmodule

