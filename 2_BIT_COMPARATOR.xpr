`timescale 1ns / 1ps

module comparator_2bit(
    input [1:0] a,
    input [1:0] b,
    output eq,
    output gt,
    output lt,
    output ge,
    output le
    );

assign eq = (a == b);
assign gt = (a > b);
assign lt = (a < b);
assign ge = (a >= b);
assign le = (a <= b);

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module comparator_2bit_tb;

reg [1:0] a, b;
wire eq, gt, lt, ge, le;

comparator_2bit uut (
    .a(a),
    .b(b),
    .eq(eq),
    .gt(gt),
    .lt(lt),
    .ge(ge),
    .le(le)
);

initial begin
    a = 2'b00; b = 2'b00; #10;
    a = 2'b01; b = 2'b10; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    $stop;
end

endmodule


