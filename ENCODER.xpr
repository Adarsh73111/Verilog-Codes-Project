`timescale 1ns / 1ps

module encoder(
    input i0,
    input i1,
    input i2,
    input i3,
    output y0,
    output y1
    );

    assign y1 = i2 | i3;
    assign y0 = i1 | i3;

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module encoder_tb;

    reg i0;
    reg i1;
    reg i2;
    reg i3;
    wire y0;
    wire y1;

    encoder uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
        #10;
        i0 = 1'b1;
        #10;
        i0 = 1'b0; i1 = 1'b1;
        #10;
        i1 = 1'b0; i2 = 1'b1;
        #10;
        i2 = 1'b0; i3 = 1'b1;
        #10;
        $stop;
    end

endmodule


