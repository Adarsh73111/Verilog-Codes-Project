`timescale 1ns / 1ps

module demux_1X2(
    input din,
    input sel,
    output y0,
    output y1
    );

    assign y0 = (sel == 1'b0) ? din : 1'b0;
    assign y1 = (sel == 1'b1) ? din : 1'b0;

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module demux_1X2_tb;

    reg din;
    reg sel;
    wire y0;
    wire y1;

    demux_1X2 uut (
        .din(din),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        din = 1'b0;
        sel = 1'b0;
        #10;
        din = 1'b1;
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;
        din = 1'b0;
        #10;
        $stop;
    end

endmodule
