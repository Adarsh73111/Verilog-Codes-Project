`timescale 1ns / 1ps

module carry_look_ahead_adder_16bit (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);
    wire [3:0] g, p, c;
    wire [15:0] carry;

    cla_4bit cla0 (a[3:0], b[3:0], cin, sum[3:0], g[0], p[0]);
    cla_4bit cla1 (a[7:4], b[7:4], c[0], sum[7:4], g[1], p[1]);
    cla_4bit cla2 (a[11:8], b[11:8], c[1], sum[11:8], g[2], p[2]);
    cla_4bit cla3 (a[15:12], b[15:12], c[2], sum[15:12], g[3], p[3]);

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
endmodule

module cla_4bit (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output g_out,
    output p_out
);
    wire [3:0] g, p, c;

    assign g = a & b;
    assign p = a ^ b;

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);

    assign sum[0] = p[0] ^ c[0];
    assign sum[1] = p[1] ^ c[1];
    assign sum[2] = p[2] ^ c[2];
    assign sum[3] = p[3] ^ c[3];

    assign g_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign p_out = p[3] & p[2] & p[1] & p[0];
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module carry_look_ahead_adder_16bit_tb;

    reg [15:0] a;
    reg [15:0] b;
    reg cin;
    wire [15:0] sum;
    wire cout;

    carry_look_ahead_adder_16bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 16'h0000; b = 16'h0000; cin = 0; #10;
        a = 16'h0001; b = 16'h0001; cin = 0; #10;
        a = 16'h00FF; b = 16'h0001; cin = 0; #10;
        a = 16'hFFFF; b = 16'h0001; cin = 0; #10;
        a = 16'hAAAA; b = 16'h5555; cin = 0; #10;
        a = 16'h1234; b = 16'h4321; cin = 1; #10;
        $stop;
    end

endmodule


