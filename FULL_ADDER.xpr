`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
    );

    wire s1;
    wire c1;
    wire c2;

    assign s1 = a ^ b;
    assign sum = s1 ^ cin;
    assign c1 = a & b;
    assign c2 = s1 & cin;
    assign carry = c1 | c2;

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module full_adder_tb;

    reg a;
    reg b;
    reg cin;
    wire sum;
    wire carry;

    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
        #10;
        cin = 1'b1;
        #10;
        b = 1'b1;
        cin = 1'b0;
        #10;
        cin = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b0;
        cin = 1'b0;
        #10;
        cin = 1'b1;
        #10;
        b = 1'b1;
        cin = 1'b0;
        #10;
        cin = 1'b1;
        #10;
        $stop;
    end

endmodule


