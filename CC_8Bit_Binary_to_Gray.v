`timescale 1ns / 1ps

module binary_to_gray (
    input [7:0] binary,
    output [7:0] gray
);
    assign gray[7] = binary[7];
    assign gray[6] = binary[7] ^ binary[6];
    assign gray[5] = binary[6] ^ binary[5];
    assign gray[4] = binary[5] ^ binary[4];
    assign gray[3] = binary[4] ^ binary[3];
    assign gray[2] = binary[3] ^ binary[2];
    assign gray[1] = binary[2] ^ binary[1];
    assign gray[0] = binary[1] ^ binary[0];
endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module binary_to_gray_tb;

    reg [7:0] binary;
    wire [7:0] gray;

    binary_to_gray uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        binary = 8'b00000000;
        #10 binary = 8'b00000001;
        #10 binary = 8'b00000010;
        #10 binary = 8'b00000011;
        #10 binary = 8'b00000100;
        #10 binary = 8'b00000101;
        #10 binary = 8'b00000110;
        #10 binary = 8'b00000111;
        #10 binary = 8'b00001000;
        #10 binary = 8'b00001001;
        #10 binary = 8'b00001010;
        #10 binary = 8'b00001011;
        #10 binary = 8'b00001100;
        #10 binary = 8'b00001101;
        #10 binary = 8'b00001110;
        #10 binary = 8'b00001111;
        #10 binary = 8'b00010000;
        #10 binary = 8'b00010001;
        #10 binary = 8'b00010010;
        #10 binary = 8'b00010011;
        #10 $stop;
    end

endmodule

