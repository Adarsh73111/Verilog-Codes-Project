`timescale 1ns / 1ps

module half_subtractor(
    input a,
    input b,
    output diff,
    output borrow
    );

    assign diff = a ^ b;
    assign borrow = (~a) & b;

endmodule

// TEST - BENCH //

`timescale 1ns / 1ps

module half_subtractor_tb;

    reg a;
    reg b;
    wire diff;
    wire borrow;

    half_subtractor uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        #10;
        a = 1'b0;
        b = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b0;
        #10;
        a = 1'b1;
        b = 1'b1;
        #10;
        $stop;
    end

endmodule

