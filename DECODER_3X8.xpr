`timescale 1ns / 1ps

module decoder_3X8(
    input [2:0] i,
    output reg [7:0] y
    );
always @(*) begin
    case(i)
        3'b000: y = 8'b00000001;
        3'b001: y = 8'b00000010;
        3'b010: y = 8'b00000100;
        3'b011: y = 8'b00001000;
        3'b100: y = 8'b00010000;
        3'b101: y = 8'b00100000;
        3'b110: y = 8'b01000000;
        3'b111: y = 8'b10000000;
        default: y = 8'b00000000;
    endcase
end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module decoder_3X8_tb;

reg [2:0] i;
wire [7:0] y;

decoder_3X8 uut (
    .i(i),
    .y(y)
);

initial begin
    i = 3'b000; #10;
    i = 3'b001; #10;
    i = 3'b010; #10;
    i = 3'b011; #10;
    i = 3'b100; #10;
    i = 3'b101; #10;
    i = 3'b110; #10;
    i = 3'b111; #10;
    $stop;
end

endmodule

