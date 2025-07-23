// MOORE 1011 NON-OVERLAPPING

module moore_1011(
    input clk,
    input rst,
    input x,
    output reg y
);

    typedef enum reg [2:0] {
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        s4 = 3'b100
    } state_t;

    state_t state, next_state;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

    always @(*)
    begin
        case(state)
            s0: next_state = (x == 1'b1) ? s1 : s0;
            s1: next_state = (x == 1'b0) ? s2 : s1;
            s2: next_state = (x == 1'b1) ? s3 : s0;
            s3: next_state = (x == 1'b1) ? s4 : s2;
            s4: next_state = (x == 1'b0) ? s2 : s1;
            default: next_state = s0;
        endcase
    end

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            y <= 0;
        else if (state == s4)
            y <= 1;
        else
            y <= 0;
    end

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module tb_moore_1011;

    reg clk;
    reg rst;
    reg x;
    wire y;

    moore_1011 uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        x = 0;
        #12 rst = 0;

        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;

        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 1; #10;

        x = 0; #10;
        $stop;
    end

endmodule


// MOORE 1011 OVERLAPPING

module moore_1011(
    input clk,
    input rst,
    input x,
    output reg y
);

    typedef enum reg [2:0] {
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        s4 = 3'b100
    } state_t;

    state_t state, next_state;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

    always @(*)
    begin
        case(state)
            s0: next_state = (x == 1'b1) ? s1 : s0;
            s1: next_state = (x == 1'b0) ? s2 : s1;
            s2: next_state = (x == 1'b1) ? s3 : s0;
            s3: next_state = (x == 1'b1) ? s4 : s2;
            s4: next_state = (x == 1'b1) ? s1 : s2;
            default: next_state = s0;
        endcase
    end

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            y <= 0;
        else if (state == s4)
            y <= 1;
        else
            y <= 0;
    end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module tb_moore_1011;

    reg clk;
    reg rst;
    reg x;
    wire y;

    moore_1011 uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        x = 0;
        #12 rst = 0;

        x = 1; #10;  // 1
        x = 0; #10;  // 0
        x = 1; #10;  // 1
        x = 1; #10;  // 1 --> First 1011

        x = 1; #10;  // 1
        x = 0; #10;  // 0
        x = 1; #10;  // 1
        x = 1; #10;  // 1 --> Second 1011 (overlapping)

        x = 0; #10;  // 0
        x = 0; #10;  // 0
        x = 1; #10;  // 1
        x = 1; #10;  // 1

        $stop;
    end

endmodule
