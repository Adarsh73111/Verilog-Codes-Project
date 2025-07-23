`timescale 1ns / 1ps

module comparator_nbit #(
    parameter n = 4
)
    (
    input [n-1:0] a,
    input [n-1:0] b,
    output eq,
    output gt,
    output lt
    );

assign eq = (a == b);
assign gt = (a > b);
assign lt = (a < b);

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module comparator_nbit_tb;

reg [3:0] a, b;
wire eq, gt, lt;

comparator_nbit #(.n(4)) uut (
    .a(a),
    .b(b),
    .eq(eq),
    .gt(gt),
    .lt(lt)
);

initial begin
    a = 4'b0000; b = 4'b0000; #10;
    a = 4'b1010; b = 4'b1001; #10;
    a = 4'b0011; b = 4'b0100; #10;
    a = 4'b1111; b = 4'b1111; #10;
    $stop;
end

endmodule



