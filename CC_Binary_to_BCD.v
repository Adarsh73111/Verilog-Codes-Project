`timescale 1ns / 1ps

module binary_to_bcd (
    input [7:0] binary,
    output reg [11:0] bcd  // 3 BCD digits (3 x 4 bits)
);

    integer i;
    reg [19:0] shift_reg;

    always @(*) begin
        shift_reg = 0;
        shift_reg[7:0] = binary;
        for (i = 0; i < 8; i = i + 1) begin
            if (shift_reg[11:8] >= 5)
                shift_reg[11:8] = shift_reg[11:8] + 3;
            if (shift_reg[15:12] >= 5)
                shift_reg[15:12] = shift_reg[15:12] + 3;
            if (shift_reg[19:16] >= 5)
                shift_reg[19:16] = shift_reg[19:16] + 3;
            shift_reg = shift_reg << 1;
        end
        bcd = shift_reg[19:8];
    end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module binary_to_bcd_tb;

    reg [7:0] binary;
    wire [11:0] bcd;

    binary_to_bcd uut (
        .binary(binary),
        .bcd(bcd)
    );

    initial begin
        binary = 8'd0;
        #10 binary = 8'd1;
        #10 binary = 8'd9;
        #10 binary = 8'd10;
        #10 binary = 8'd15;
        #10 binary = 8'd42;
        #10 binary = 8'd99;
        #10 binary = 8'd100;
        #10 binary = 8'd127;
        #10 binary = 8'd255;
        #10 $stop;
    end

endmodule
