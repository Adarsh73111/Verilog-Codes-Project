`timescale 1ns / 1ps

module AND_gate(
    input wire a,
    input wire b,
    output wire y
);

assign y = a&b;
endmodule


// TEST BENCH //

`timescale 1ns / 1ps

module AND_Gate_tb;
    reg a;
    reg b;
    wire y;
AND_gate uut(.a(a),.b(b),.y(y));

initial begin
    $monitor("Time = %0t | a = %b, b = %b, y = %b", $time,a,b,y);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
    end
endmodule

