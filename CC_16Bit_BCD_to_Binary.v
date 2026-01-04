`timescale 1ns / 1ps

module bcd_to_binary (
    input [19:0] bcd,
    output reg [15:0] binary
);

    reg [31:0] temp;

    always @(*) begin
        temp = 0;
        temp = temp + bcd[3:0];                   // digit0 * 1
        temp = temp + bcd[7:4] * 10;              // digit1 * 10
        temp = temp + bcd[11:8] * 100;            // digit2 * 100
        temp = temp + bcd[15:12] * 1000;          // digit3 * 1000
        temp = temp + bcd[19:16] * 10000;         // digit4 * 10000
        binary = temp[15:0];
    end

endmodule


// TEST-BENCH

`timescale 1ns / 1ps

module bcd_to_binary_tb;

    reg [19:0] bcd;
    wire [15:0] binary;

    bcd_to_binary uut (
        .bcd(bcd),
        .binary(binary)
    );

    initial begin
        bcd = 20'h00000; #10;
        bcd = 20'h00001; #10;
        bcd = 20'h00009; #10;
        bcd = 20'h00010; #10;
        bcd = 20'h00255; #10;  // 255 decimal
        bcd = 20'h01023; #10;  // 1023 decimal
        bcd = 20'h04096; #10;  // 4096 decimal
        bcd = 20'h09999; #10;  // 9999 decimal
        bcd = 20'h65535; #10;  // 65535 decimal
        $stop;
    end

endmodule

