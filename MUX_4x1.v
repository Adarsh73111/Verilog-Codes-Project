`timescale 1ns / 1ps

module mux_4X1(
    input wire sel0,
    input wire sel1,
    input wire d0,
    input wire d1,
    input wire d2,
    input wire d3,
    output wire y
);
    assign y = (sel1 == 0 && sel0 == 0) ? d0 :
               (sel1 == 0 && sel0 == 1) ? d1 :
               (sel1 == 1 && sel0 == 0) ? d2 :
               d3;
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module mux_4X1_tb;
    reg sel0;
    reg sel1;
    reg d0;
    reg d1;
    reg d2;
    reg d3;
    wire y;

    mux_4X1 uut (
        .sel0(sel0),
        .sel1(sel1),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .y(y)
    );

    initial begin
        d0 = 1; d1 = 0; d2 = 0; d3 = 0; sel1 = 0; sel0 = 0; #10;
        d0 = 0; d1 = 1; d2 = 0; d3 = 0; sel1 = 0; sel0 = 1; #10;
        d0 = 0; d1 = 0; d2 = 1; d3 = 0; sel1 = 1; sel0 = 0; #10;
        d0 = 0; d1 = 0; d2 = 0; d3 = 1; sel1 = 1; sel0 = 1; #10;
        $finish;
    end
endmodule





















