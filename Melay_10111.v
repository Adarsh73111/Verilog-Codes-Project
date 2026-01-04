// MELAY 10111 NON-OVERLAPPING

`timescale 1ns / 1ps

module fsm_mealy_10111_nonoverlap(
    input clk, rst, x,
    output reg y
);
    reg [2:0] s;
    parameter
        s0 = 3'b000, // start
        s1 = 3'b001, // seen "1"
        s2 = 3'b010, // seen "10"
        s3 = 3'b011, // seen "101"
        s4 = 3'b100; // seen "1011"

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
                    s <= x ? s1 : s2;
                end
                s2: begin
                    y <= 0;
                    s <= x ? s3 : s0;
                end
                s3: begin
                    y <= 0;
                    s <= x ? s4 : s0;
                end
                s4: begin
                    y <= x ? 1 : 0; 
                    s <= s0;        
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

module tb_mealy_10111_nonoverlap;

    reg clk = 0;
    reg rst;
    reg x;
    wire y;

    fsm_mealy_10111_nonoverlap dut (.clk(clk), .rst(rst), .x(x), .y(y));

    always #5 clk = ~clk;

    initial begin

        rst = 1; x = 0; #15 rst = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;  // detect here
        #10 x = 1;  // new possible start
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;  // detect here again

        #20 $finish;
    end
endmodule


// MELAY 10111 OVERLAPPING 

`timescale 1ns / 1ps

module fsm_mealy_10111_overlap(
    input clk, rst, x,
    output reg y
);
    reg [2:0] s;
    parameter
        s0 = 3'b000,
        s1 = 3'b001, // "1"
        s2 = 3'b010, // "10"
        s3 = 3'b011, // "101"
        s4 = 3'b100; // "1011"

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
                    s <= x ? s1 : s2;
                end
                s2: begin
                    y <= 0;
                    s <= x ? s3 : s0;
                end
                s3: begin
                    y <= 0;
                    s <= x ? s4 : s0;
                end
                s4: begin
                    y <= x ? 1 : 0;   // Detected "10111"
                    s <= x ? s1 : s0; // Overlapping support
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

module tb_mealy_10111_overlap;

    reg clk = 0;
    reg rst;
    reg x;
    wire y;

    fsm_mealy_10111_overlap dut (.clk(clk), .rst(rst), .x(x), .y(y));

    always #5 clk = ~clk;

    initial begin
        rst = 1; x = 0; #15 rst = 0;

    
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;  // detect here
        #10 x = 1;  // overlapping detection start
        #10 x = 1;  // continue overlap

        #20 $finish;
    end
endmodule


