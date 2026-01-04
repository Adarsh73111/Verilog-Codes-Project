`timescale 1ns / 1ps


module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [2:0] sel,
    output reg [7:0] y,
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
        default: y = 8'b00000000;
    endcase

    if (sel == 3'b000 || sel == 3'b001)
        c = (sel == 3'b000) ? (a + b > 8'b11111111) : (a < b);
    else
        c = 0;
end

endmodule

// TEST-BENCH //

`timescale 1ns / 1ps

module alu_8bit_tb;

reg [7:0] a, b;
reg [2:0] sel;
wire [7:0] y;
wire c;

alu_8bit uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y),
    .c(c)
);

initial begin
    a = 8'b00001111; b = 8'b00000001; sel = 3'b000; #10;
    a = 8'b10000000; b = 8'b00000001; sel = 3'b001; #10;
    a = 8'b11110000; b = 8'b00001111; sel = 3'b010; #10;
    a = 8'b10101010; b = 8'b01010101; sel = 3'b011; #10;
    a = 8'b11001100; b = 8'b00110011; sel = 3'b100; #10;
    a = 8'b11111111; b = 8'b00000000; sel = 3'b101; #10;
    a = 8'b00001111; b = 8'b00000000; sel = 3'b110; #10;
    a = 8'b11110000; b = 8'b00000000; sel = 3'b111; #10;
    $stop;
end

endmodule



