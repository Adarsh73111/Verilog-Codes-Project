`timescale 1ns / 1ps

module jk_flipflop(JK, clk, qin, qout);
    input[1:0] JK;
    input clk, qin;
    output reg qout;
    wire qbar;
    
    assign qbar =~ qout;
    
    always @(posedge clk)
        case(JK)
            2'b00: qout <= qin;
            2'b01: qout <= 0;
            2'b10: qout <= 1;
            2'b11: qout <= qbar;
          endcase
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps
 
 module jk_flipflop_tb();
    reg [1:0] JK;
    reg clk, qin;
    wire qout;
    
    jk_flipflop dut(JK, clk, qin, qout);
    
    always #5 clk =~ clk;
    
    initial begin
        clk = 0;
        qin = 1;
        JK = 2'b00;
        
        #10 JK = 2'b01;
        #10 JK = 2'b10;
        #10 JK = 2'b11;
        #10
        $finish;
      end
     endmodule 


