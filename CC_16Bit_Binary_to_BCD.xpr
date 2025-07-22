`timescale 1ns / 1ps

module binary_to_bcd_16bit (
    input [15:0] binary,
    output reg [19:0] bcd  // 5 BCD digits (5 x 4 bits)
);

    integer i;
    reg [35:0] shift_reg;

    always @(*) begin
        shift_reg = 0;
        shift_reg[15:0] = binary;
        for (i = 0; i < 16; i = i + 1) begin
            if (shift_reg[19:16] >= 5)
                shift_reg[19:16] = shift_reg[19:16] + 3;
            if (shift_reg[23:20] >= 5)
                shift_reg[23:20] = shift_reg[23:20] + 3;
            if (shift_reg[27:24] >= 5)
                shift_reg[27:24] = shift_reg[27:24] + 3;
            if (shift_reg[31:28] >= 5)
                shift_reg[31:28] = shift_reg[31:28] + 3;
            if (shift_reg[35:32] >= 5)
                shift_reg[35:32] = shift_reg[35:32] + 3;

            shift_reg = shift_reg << 1;
        end
        bcd = shift_reg[35:16];
    end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module binary_to_bcd_16bit_tb;

    reg [15:0] binary;
    wire [19:0] bcd;

    binary_to_bcd_16bit uut (
        .binary(binary),
        .bcd(bcd)
    );

    initial begin
        binary = 16'd0;
        #10 binary = 16'd1;
        #10 binary = 16'd9;
        #10 binary = 16'd10;
        #10 binary = 16'd255;
        #10 binary = 16'd1023;
        #10 binary = 16'd4096;
        #10 binary = 16'd9999;
        #10 binary = 16'd65535;
        #10 $stop;
    end

endmodule
