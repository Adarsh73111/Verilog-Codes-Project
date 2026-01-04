`timescale 1ns / 1ps

module mux_8X1_2X1(
    input i0,
    input i1,
    input i2,
    input i3,
    input i4,
    input i5,
    input i6,
    input i7,
    input s0,
    input s1,
    input s2,
    output y
);

wire y0;
wire y1;
wire y2;
wire y3;
wire y4;
wire y5;
wire y6;

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
    .i0(i4),
    .i1(i5),
    .s(s0),
    .y(y2)
);

mux2_1 m4(
    .i0(i6),
    .i1(i7),
    .s(s0),
    .y(y3)
);

mux2_1 m5(
    .i0(y0),
    .i1(y1),
    .s(s1),
    .y(y4)
);

mux2_1 m6(
    .i0(y2),
    .i1(y3),
    .s(s1),
    .y(y5)
);

mux2_1 m7(
    .i0(y4),
    .i1(y5),
    .s(s2),
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

module mux_8X1_2X1_tb;

reg i0;
reg i1;
reg i2;
reg i3;
reg i4;
reg i5;
reg i6;
reg i7;
reg s0;
reg s1;
reg s2;
wire y;

mux_8X1_2X1 uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .i4(i4),
    .i5(i5),
    .i6(i6),
    .i7(i7),
    .s0(s0),
    .s1(s1),
    .s2(s2),
    .y(y)
);

initial begin
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    s0 = 0; s1 = 0; s2 = 0;

    i0 = 1; s0 = 0; s1 = 0; s2 = 0; #10;
    i1 = 1; s0 = 1; s1 = 0; s2 = 0; #10;
    i2 = 1; s0 = 0; s1 = 1; s2 = 0; #10;
    i3 = 1; s0 = 1; s1 = 1; s2 = 0; #10;
    i4 = 1; s0 = 0; s1 = 0; s2 = 1; #10;
    i5 = 1; s0 = 1; s1 = 0; s2 = 1; #10;
    i6 = 1; s0 = 0; s1 = 1; s2 = 1; #10;
    i7 = 1; s0 = 1; s1 = 1; s2 = 1; #10;

    $finish;
end

endmodule

