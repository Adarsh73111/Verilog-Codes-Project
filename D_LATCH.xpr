`timescale 1ns / 1ps

module d_latch(
    input d,
    input en,
    output reg q
    );

always @(*) begin
    if (en)
        q = d;
end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module d_latch_tb;

reg d;
reg en;
wire q;

d_latch uut (
    .d(d),
    .en(en),
    .q(q)
);

initial begin
    d = 0; en = 0;
    #10 d = 1; en = 1;
    #10 d = 0; en = 1;
    #10 en = 0;
    #10 d = 1;
    #10 en = 1;
    #10 $stop;
end

endmodule
