`timescale 1ns / 1ps

module seven_segment_decoder (
    input [3:0] digit,
    output reg [6:0] seg
);

    always @(*) begin
        case (digit)
            4'd0: seg = 7'b0111111;
            4'd1: seg = 7'b0000110;
            4'd2: seg = 7'b1011011;
            4'd3: seg = 7'b1001111;
            4'd4: seg = 7'b1100110;
            4'd5: seg = 7'b1101101;
            4'd6: seg = 7'b1111101;
            4'd7: seg = 7'b0000111;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1101111;
            default: seg = 7'b0000000;
        endcase
    end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module seven_segment_decoder_tb;

    reg [3:0] digit;
    wire [6:0] seg;

    seven_segment_decoder uut (
        .digit(digit),
        .seg(seg)
    );

    initial begin
        digit = 4'd0; #10;
        digit = 4'd1; #10;
        digit = 4'd2; #10;
        digit = 4'd3; #10;
        digit = 4'd4; #10;
        digit = 4'd5; #10;
        digit = 4'd6; #10;
        digit = 4'd7; #10;
        digit = 4'd8; #10;
        digit = 4'd9; #10;
        digit = 4'd10; #10; // default case
        $stop;
    end

endmodule


