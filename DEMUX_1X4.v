`timescale 1ns / 1ps

module demux_1X4(
    input din,
    input s0,
    input s1,
    output y0,
    output y1,
    output y2,
    output y3
    );

    assign y0 = (s1 == 1'b0 && s0 == 1'b0) ? din : 1'b0;
    assign y1 = (s1 == 1'b0 && s0 == 1'b1) ? din : 1'b0;
    assign y2 = (s1 == 1'b1 && s0 == 1'b0) ? din : 1'b0;
    assign y3 = (s1 == 1'b1 && s0 == 1'b1) ? din : 1'b0;

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module demux_1X4_tb;

    reg din;
    reg s0;
    reg s1;
    wire y0;
    wire y1;
    wire y2;
    wire y3;

    demux_1X4 uut (
        .din(din),
        .s0(s0),
        .s1(s1),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        din = 1'b1;
        s1 = 1'b0;
        s0 = 1'b0;
        #10;
        s0 = 1'b1;
        #10;
        s1 = 1'b1;
        s0 = 1'b0;
        #10;
        s0 = 1'b1;
        #10;
        din = 1'b0;
        #10;
        $stop;
    end

endmodule


