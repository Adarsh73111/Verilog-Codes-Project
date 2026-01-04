`timescale 1ns / 1ps

module gray_to_binary (
    input [7:0] gray,
    output [7:0] binary
);
    assign binary[7] = gray[7];
    assign binary[6] = binary[7] ^ gray[6];
    assign binary[5] = binary[6] ^ gray[5];
    assign binary[4] = binary[5] ^ gray[4];
    assign binary[3] = binary[4] ^ gray[3];
    assign binary[2] = binary[3] ^ gray[2];
    assign binary[1] = binary[2] ^ gray[1];
    assign binary[0] = binary[1] ^ gray[0];
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module gray_to_binary_8bit_tb;

    reg [7:0] gray;
    wire [7:0] binary;

    gray_to_binary uut (
        .gray(gray),
        .binary(binary)
    );

    initial begin
        gray = 8'b00000000;
        #10 gray = 8'b00000001;
        #10 gray = 8'b00000011;
        #10 gray = 8'b00000010;
        #10 gray = 8'b00000110;
        #10 gray = 8'b00000111;
        #10 gray = 8'b00000101;
        #10 gray = 8'b00000100;
        #10 gray = 8'b00001100;
        #10 gray = 8'b00001101;
        #10 gray = 8'b00001111;
        #10 gray = 8'b00001110;
        #10 gray = 8'b00001010;
        #10 gray = 8'b00001011;
        #10 gray = 8'b00001001;
        #10 gray = 8'b00001000;
        #10 $stop;
    end

endmodule

