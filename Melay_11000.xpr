// MELAY 11000 NON-OVERLAPPING

`timescale 1ns / 1ps

module fsm_mealy_11000_nonoverlap(
    input clk, rst, x,
    output reg y
);
    reg [2:0] s;
    parameter
        s0 = 3'b000, // Start
        s1 = 3'b001, // Seen "1"
        s2 = 3'b010, // Seen "11"
        s3 = 3'b011, // Seen "110"
        s4 = 3'b100; // Seen "1100"

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
                    y <= 0;
                    s <= x ? s1 : s4;
                end
                s4: begin
                    y <= x ? 0 : 1; // Detects final 0
                    s <= s0;        // Non-overlapping resets to s0
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

module tb_mealy_11000_nonoverlap;

    reg clk = 0;
    reg rst;
    reg x;
    wire y;

    fsm_mealy_11000_nonoverlap dut (.clk(clk), .rst(rst), .x(x), .y(y));
    always #5 clk = ~clk;
    initial begin
        rst = 1; x = 0; #15 rst = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;  // Detect here (non-overlapping)
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;  // Detect again
        #20 $finish;
    end
endmodule


// MELAY 11000 OVERLAPPING

`timescale 1ns / 1ps

module fsm_mealy_11000_overlap(
    input clk, rst, x,
    output reg y
);
    reg [2:0] s;
    parameter
        s0 = 3'b000,
        s1 = 3'b001, // "1"
        s2 = 3'b010, // "11"
        s3 = 3'b011, // "110"
        s4 = 3'b100; // "1100"

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
                    y <= 0;
                    s <= x ? s1 : s4;
                end
                s4: begin
                    y <= x ? 0 : 1; // Detects "11000"
                    s <= x ? s1 : s0; // Overlapping: resume based on last bit
                end
                default: begin
                    s <= s0;
                    y <= 0;
                end
            endcase
        end
    end
endmodule


// TEST-BENCH //

`timescale 1ns/1ps

module tb_mealy_11000_overlap;

    reg clk = 0;
    reg rst;
    reg x;
    wire y;

    fsm_mealy_11000_overlap dut (.clk(clk), .rst(rst), .x(x), .y(y));

    always #5 clk = ~clk;

    initial begin

        rst = 1; x = 0; #15 rst = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;  // Detect here
        #10 x = 0;
        #10 x = 0;
        #10 x = 0;
        #20 $finish;
    end
endmodule
