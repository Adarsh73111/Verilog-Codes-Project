`timescale 1ns / 1ps

module half_adder(
    input a,
    input b,
    output sum,
    output carry
    );

    assign sum = a ^ b;
    assign carry = a & b;

endmodule

// TEST - BENCH //

`timescale 1ns / 1ps

module half_adder_tb;

    reg a;
    reg b;
    wire sum;
    wire carry;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
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


