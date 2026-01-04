`timescale 1ns / 1ps

module full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output borrow
    );

    wire d1;
    wire b1;
    wire b2;

    assign d1 = a ^ b;
    assign diff = d1 ^ bin;
    assign b1 = (~a) & b;
    assign b2 = (~d1) & bin;
    assign borrow = b1 | b2;

endmodule

// TEST - BENCH //

`timescale 1ns / 1ps


module full_subtractor_tb;

    reg a;
    reg b;
    reg bin;
    wire diff;
    wire borrow;

    full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        bin = 1'b0;
        #10;
        bin = 1'b1;
        #10;
        b = 1'b1;
        bin = 1'b0;
        #10;
        bin = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b0;
        bin = 1'b0;
        #10;
        bin = 1'b1;
        #10;
        b = 1'b1;
        bin = 1'b0;
        #10;
        bin = 1'b1;
        #10;
        $stop;
    end

endmodule

