`timescale 1ns / 1ps

module mux_8X1 (
    input d0,
    input d1,
    input d2,
    input d3,
    input d4,
    input d5,
    input d6,
    input d7,
    input s0,
    input s1,
    input s2,
    output y
);
    assign y = (s2 == 0 && s1 == 0 && s0 == 0) ? d0 :
               (s2 == 0 && s1 == 0 && s0 == 1) ? d1 :
               (s2 == 0 && s1 == 1 && s0 == 0) ? d2 :
               (s2 == 0 && s1 == 1 && s0 == 1) ? d3 :
               (s2 == 1 && s1 == 0 && s0 == 0) ? d4 :
               (s2 == 1 && s1 == 0 && s0 == 1) ? d5 :
               (s2 == 1 && s1 == 1 && s0 == 0) ? d6 :
                                                 d7 ;
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module mux_8X1_tb;
    reg d0;
    reg d1;
    reg d2;
    reg d3;
    reg d4;
    reg d5;
    reg d6;
    reg d7;
    reg s0;
    reg s1;
    reg s2;
    wire y;

    mux_8X1 uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .d4(d4),
        .d5(d5),
        .d6(d6),
        .d7(d7),
        .s0(s0),
        .s1(s1),
        .s2(s2),
        .y(y)
    );

    initial begin
        d0 = 0; d1 = 1; d2 = 0; d3 = 1; d4 = 0; d5 = 1; d6 = 0; d7 = 1;
        s2 = 0; s1 = 0; s0 = 0; #10;
        s2 = 0; s1 = 0; s0 = 1; #10;
        s2 = 0; s1 = 1; s0 = 0; #10;
        s2 = 0; s1 = 1; s0 = 1; #10;
        s2 = 1; s1 = 0; s0 = 0; #10;
        s2 = 1; s1 = 0; s0 = 1; #10;
        s2 = 1; s1 = 1; s0 = 0; #10;
        s2 = 1; s1 = 1; s0 = 1; #10;
        $finish;
    end
endmodule


