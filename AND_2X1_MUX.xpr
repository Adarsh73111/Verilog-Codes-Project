`timescale 1ns / 1ps

module and_2X1_mux(
    input a,
    input b,
    output y
    );

    wire i0;
    wire i1;
    wire s;

    assign i0 = 1'b0;
    assign i1 = b;
    assign s = a;

    assign y = s ? i1 : i0;

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps


module and_2X1_mux_tb;

    reg a;
    reg b;
    wire y;

    and_2X1_mux uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        #10;
        a = 1'b0;
        b = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b0;
        #10;
        a = 1'b1;
        b = 1'b1;
        #10;
        $stop;
    end

endmodule

