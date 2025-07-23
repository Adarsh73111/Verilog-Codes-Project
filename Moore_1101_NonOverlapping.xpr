`timescale 1ns / 1ps

module moore_1101_nonov(
    input clk,
    input rst,
    input x,
    output reg y
    );

    reg [2:0] state;
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;

    always @(posedge clk) begin
        if (rst)
            state <= S0;
        else begin
            case (state)
                S0: state <= (x) ? S1 : S0;
                S1: state <= (x) ? S2 : S0;
                S2: state <= (!x) ? S3 : S0;
                S3: state <= (x) ? S4 : S0;
                S4: state <= S0;
                default: state <= S0;
            endcase
        end
    end

    always @(*) begin
        y = (state == S4) ? 1'b1 : 1'b0;
    end

endmodule


// TEST - BENCH //

`timescale 1ns / 1ps

module tb_moore_1101_nonov();

    reg clk, rst, x;
    wire y;

    moore_1101_nonov uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; x = 0;
        #10 rst = 0;

        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;

        #20 $stop;
    end

endmodule
