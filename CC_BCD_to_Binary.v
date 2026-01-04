`timescale 1ns / 1ps

module bcd_to_binary (
    input [7:0] bcd,      // 2 BCD digits: bcd[7:4] = tens, bcd[3:0] = ones
    output reg [7:0] binary
);

    always @(*) begin
        binary = (bcd[7:4] * 4'd10) + bcd[3:0];
    end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module bcd_to_binary_tb;

    reg [7:0] bcd;
    wire [7:0] binary;

    bcd_to_binary uut (
        .bcd(bcd),
        .binary(binary)
    );

    initial begin
        bcd = 8'h00; #10;
        bcd = 8'h01; #10;
        bcd = 8'h09; #10;
        bcd = 8'h10; #10;
        bcd = 8'h42; #10;
        bcd = 8'h99; #10;
        bcd = 8'h59; #10;
        bcd = 8'h80; #10;
        $stop;
    end

endmodule

