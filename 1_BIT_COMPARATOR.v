`timescale 1ns / 1ps
module comparator_1bit(
    input a,
    input b,
    output eq,
    output gt,
    output lt
    );
assign eq = (a == b);
assign gt = (a > b);
assign lt = (a < b);
endmodule



`timescale 1ns / 1ps
module comparator_1bit_tb;
reg a, b;
wire eq, gt, lt;
comparator_1bit uut (
    .a(a),
    .b(b),
    .eq(eq),
    .gt(gt),
    .lt(lt)
);
initial begin
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $stop;
end
endmodule

