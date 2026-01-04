module melay_overlapping(clk,rst,x,y);
input clk,rst,x;
output reg y;
reg[1:0]s;
parameter
s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
always @(posedge clk)
begin
if(rst==1'b1)
begin
s=s0;
end
else
case(s)
s0:begin
y=x?0:0;
s=x?s1:s0;
end
s1:begin
y=x?0:0;
s=x?s1:s2;
end
s2:begin
y=x?0:0;
s=x?s3:s0;
end
s3:begin
y=x?0:1;
s=x?s1:s2;
end
endcase
end
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module melay_overlapping_tb();
reg clk,x,rst;
wire y;
melay_overlapping uut(
    .clk(clk),
    .x(x),
    .rst(rst),
    .y(y)
 );
 always #5 clk =~ clk;
 initial begin
 clk = 1'b0;
 rst = 1'b1;
 x = 0;
 end
 initial
 begin
 #7 rst = 0;
 #10 x = 1; 
 #10 x = 0; 
 #10 x = 1; 
 #10 x = 1; 
 #10 x = 1; 
 #10 x = 1; 
 #10 x = 0; 
 #10 x = 1; 
 #10 x = 1;
 #10 x = 1; 
 #10 x = 0;
 #10 x = 1;
 #10 x = 0;
 #10 x = 1; 
 #10 x = 0;
 #10 x = 0;
 #10 x = 0;
 #10;
 $finish;
 end     
endmodule
