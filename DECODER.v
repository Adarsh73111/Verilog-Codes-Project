`timescale 1ns / 1ps

module decoder_2X4(
    input a,
    input b,
    output y0,
    output y1,
    output y2,
    output y3
    );

    assign y0 = (~a) & (~b);
    assign y1 = (~a) & b;
    assign y2 = a & (~b);
    assign y3 = a & b;

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module decoder_2X4_tb;

    reg a;
    reg b;
    wire y0;
    wire y1;
    wire y2;
    wire y3;

    decoder_2X4 uut (
        .a(a),
        .b(b),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        #10;
        b = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b0;
        #10;
        b = 1'b1;
        #10;
        $stop;
    end

endmodule

