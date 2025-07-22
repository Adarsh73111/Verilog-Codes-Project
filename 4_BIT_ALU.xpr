`timescale 1ns / 1ps

module alu_4bit(
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] y,
    output reg c
    );

always @(*) begin
    case(sel)
        3'b000: {c, y} = a + b;
        3'b001: {c, y} = a - b;
        3'b010: y = a & b;
        3'b011: y = a | b;
        3'b100: y = a ^ b;
        3'b101: y = ~a;
        3'b110: y = a << 1;
        3'b111: y = a >> 1;
        default: y = 4'b0000;
    endcase

    if (sel == 3'b000 || sel == 3'b001)
        c = (sel == 3'b000) ? (a + b > 4'b1111) : (a < b);
    else
        c = 0;
end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module alu_4bit_tb;

reg [3:0] a, b;
reg [2:0] sel;
wire [3:0] y;
wire c;

alu_4bit uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y),
    .c(c)
);

initial begin
    a = 4'b0101; b = 4'b0011; sel = 3'b000; #10;
    a = 4'b1000; b = 4'b0100; sel = 3'b001; #10;
    a = 4'b1100; b = 4'b1010; sel = 3'b010; #10;
    a = 4'b0011; b = 4'b0110; sel = 3'b011; #10;
    a = 4'b1111; b = 4'b1010; sel = 3'b100; #10;
    a = 4'b1101; b = 4'b0000; sel = 3'b101; #10;
    a = 4'b0001; b = 4'b0000; sel = 3'b110; #10;
    a = 4'b1000; b = 4'b0000; sel = 3'b111; #10;
    $stop;
end

endmodule




