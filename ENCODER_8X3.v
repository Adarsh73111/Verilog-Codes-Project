`timescale 1ns / 1ps

module encoder_8X3(
    input [7:0] i,
    output reg [2:0] y
    );

always @(*) begin
    casex(i)
        8'b00000001: y = 3'b000;
        8'b0000001x: y = 3'b001;
        8'b000001xx: y = 3'b010;
        8'b00001xxx: y = 3'b011;
        8'b0001xxxx: y = 3'b100;
        8'b001xxxxx: y = 3'b101;
        8'b01xxxxxx: y = 3'b110;
        8'b1xxxxxxx: y = 3'b111;
        default:     y = 3'b000;
    endcase
end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module encoder_8X3_tb;

reg [7:0] i;
wire [2:0] y;

encoder_8X3 uut (
    .i(i),
    .y(y)
);

initial begin
    i = 8'b00000001; #10;
    i = 8'b00000010; #10;
    i = 8'b00000100; #10;
    i = 8'b00001000; #10;
    i = 8'b00010000; #10;
    i = 8'b00100000; #10;
    i = 8'b01000000; #10;
    i = 8'b10000000; #10;
    $stop;
end

endmodule
