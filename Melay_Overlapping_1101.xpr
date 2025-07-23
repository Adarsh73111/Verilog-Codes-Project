// MELAY 1101 OVERLAPPING

`timescale 1ns / 1ps

module fsm_mealy_1101_overlap(
    input clk, rst, x,
    output reg y
);
    reg [1:0] s;
    parameter
        s0 = 2'b00,
        s1 = 2'b01, // "1"
        s2 = 2'b10, // "11"
        s3 = 2'b11; // "110"
    always @(posedge clk) begin
        if (rst) begin
            s <= s0;
            y <= 0;
        end else begin
            case (s)
                s0: begin
                    y <= 0;
                    s <= x ? s1 : s0;
                end
                s1: begin
                    y <= 0;
                    s <= x ? s2 : s0;
                end
                s2: begin
                    y <= 0;
                    s <= x ? s2 : s3;
                end
                s3: begin
                    y <= x ? 1 : 0;
                    s <= x ? s2 : s0;  // overlapping: reuse "11" if x=1
                end
                default: begin
                    s <= s0;
                    y <= 0;
                end
            endcase
        end
    end
endmodule

// TEST - BENCH //

`timescale 1ns/1ps

module tb_mealy_1101_overlap;

    reg clk = 0;
    reg rst;
    reg x;
    wire y;
    fsm_mealy_1101_overlap dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        x = 0;
        #15 rst = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // detect
        #10 x = 1;  // overlapping start
        #10 x = 0;
        #10 x = 1;  // detect again due to overlap
        #20 $finish;
    end

endmodule


// MELAY 1101 NON-OVERLAPPING

`timescale 1ns / 1ps

module fsm_mealy_1101_nonoverlap(
    input clk, rst, x,
    output reg y
);
    reg [1:0] s;
    parameter
        s0 = 2'b00,
        s1 = 2'b01, // seen "1"
        s2 = 2'b10, // seen "11"
        s3 = 2'b11; // seen "110"
    always @(posedge clk) begin
        if (rst) begin
            s <= s0;
            y <= 0;
        end else begin
            case (s)
                s0: begin
                    y <= 0;
                    s <= x ? s1 : s0;
                end
                s1: begin
                    y <= 0;
                    s <= x ? s2 : s0;
                end
                s2: begin
                    y <= 0;
                    s <= x ? s2 : s3; // x=0 ? "110"
                end
                s3: begin
                    y <= x ? 1 : 0;   // x=1 ? "1101" detected
                    s <= s0;          // non-overlapping reset
                end
                default: begin
                    s <= s0;
                    y <= 0;
                end
            endcase
        end
    end
endmodule

// TEST - BENCH //

`timescale 1ns/1ps

module tb_mealy_1101_nonoverlap;

    reg clk = 0;
    reg rst;
    reg x;
    wire y;
    fsm_mealy_1101_nonoverlap dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        x = 0;
        #15 rst = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // detect here
        #10 x = 1;  // start new sequence
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // detect here
        #20 $finish;
    end

endmodule

