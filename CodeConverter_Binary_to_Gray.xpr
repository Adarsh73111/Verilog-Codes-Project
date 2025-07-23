`timescale 1ns / 1ps

module binary_to_gray_cc(
    input [3:0] binary,
    output [3:0] gray
);
    assign gray[3] = binary[3];
    assign gray[2] = binary[3] ^ binary[2];
    assign gray[1] = binary[2] ^ binary[1];
    assign gray[0] = binary[1] ^ binary[0];
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module binary_to_gray_cc_tb;

    reg [3:0] binary;
    wire [3:0] gray;

    binary_to_gray_cc uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        binary = 4'b0000;
        #10 binary = 4'b0001;
        #10 binary = 4'b0010;
        #10 binary = 4'b0011;
        #10 binary = 4'b0100;
        #10 binary = 4'b0101;
        #10 binary = 4'b0110;
        #10 binary = 4'b0111;
        #10 binary = 4'b1000;
        #10 binary = 4'b1001;
        #10 binary = 4'b1010;
        #10 binary = 4'b1011;
        #10 binary = 4'b1100;
        #10 binary = 4'b1101;
        #10 binary = 4'b1110;
        #10 binary = 4'b1111;
        #10 $stop;
    end

endmodule

