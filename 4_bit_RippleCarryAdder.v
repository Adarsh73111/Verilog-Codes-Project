`timescale 1ns / 1ps

module ripple_carry_adder(
    input [3:0]A,B,
    input Cin,
    output [3:0]Sum,
    output Cout
    );
    wire [2:0]carry;
    
    full_adder_1 FA0(A[0],B[0],Cin,Sum[0],carry[0]);
    full_adder_1 FA1(A[1],B[1],carry[0],Sum[1],carry[1]);
    full_adder_1 FA2(A[2],B[2],carry[1],Sum[2],carry[2]);
    full_adder_1 FA3(A[3],B[3],carry[2],Sum[3],Cout);
    
    
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module ripple_carry_adder_tb;
    reg[3:0]A,B;
    reg Cin;
    wire [3:0]Sum;
    wire Cout;
    
    ripple_carry_adder uut(A,B,Cin,Sum,Cout);
    
    initial begin
        $display("A B Cin | Sum Cout");
        $monitor("%b%b %b | %b %b",A,B,Cin,Sum,Cout);
        
        A = 4'b0101;B = 4'b0011; Cin=0; #10;
        A = 4'b1111;B = 4'b0001; Cin=0; #10;
        A = 4'b1010;B = 4'b0101; Cin=1; #10;
        $finish;
    end
endmodule


