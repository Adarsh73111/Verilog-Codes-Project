`timescale 1ns / 1ps

module nand_gate(
    input wire A,
    input wire B,
    output wire y
    );
    wire a;
    assign a =~ A;
    assign y = (~B & 1'b1) | (B & A);
endmodule
