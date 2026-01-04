`timescale 1ns / 1ps

module ripple_carry_adder_16bit (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);
    wire [14:0] carry;

    full_adder FA0 (a[0], b[0], cin, sum[0], carry[0]);
    full_adder FA1 (a[1], b[1], carry[0], sum[1], carry[1]);
    full_adder FA2 (a[2], b[2], carry[1], sum[2], carry[2]);
    full_adder FA3 (a[3], b[3], carry[2], sum[3], carry[3]);
    full_adder FA4 (a[4], b[4], carry[3], sum[4], carry[4]);
    full_adder FA5 (a[5], b[5], carry[4], sum[5], carry[5]);
    full_adder FA6 (a[6], b[6], carry[5], sum[6], carry[6]);
    full_adder FA7 (a[7], b[7], carry[6], sum[7], carry[7]);
    full_adder FA8 (a[8], b[8], carry[7], sum[8], carry[8]);
    full_adder FA9 (a[9], b[9], carry[8], sum[9], carry[9]);
    full_adder FA10 (a[10], b[10], carry[9], sum[10], carry[10]);
    full_adder FA11 (a[11], b[11], carry[10], sum[11], carry[11]);
    full_adder FA12 (a[12], b[12], carry[11], sum[12], carry[12]);
    full_adder FA13 (a[13], b[13], carry[12], sum[13], carry[13]);
    full_adder FA14 (a[14], b[14], carry[13], sum[14], carry[14]);
    full_adder FA15 (a[15], b[15], carry[14], sum[15], cout);
endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module ripple_carry_adder_16bit_tb;

    reg [15:0] a;
    reg [15:0] b;
    reg cin;
    wire [15:0] sum;
    wire cout;

    ripple_carry_adder_16bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 16'h0000; b = 16'h0000; cin = 1'b0; #10;
        a = 16'h0001; b = 16'h0001; cin = 1'b0; #10;
        a = 16'h00FF; b = 16'h0001; cin = 1'b0; #10;
        a = 16'hFFFF; b = 16'h0001; cin = 1'b0; #10;
        a = 16'hAAAA; b = 16'h5555; cin = 1'b0; #10;
        a = 16'h1234; b = 16'h4321; cin = 1'b1; #10;
        $stop;
    end

endmodule



