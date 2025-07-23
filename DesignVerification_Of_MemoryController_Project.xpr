//[1] RAM Module

`timescale 1ns / 1ps

module ram(
    input clk,
    input rst,
    input req,
    input rw,
    input [3:0] ar,  // row address
    input [3:0] ac,  // column address
    input [7:0] qi,  // data to write
    output reg [7:0] qa, // data read
    output reg valid
);

    reg [7:0] mem [0:15][0:15]; // 16x16 RAM, 8-bit wide

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            qa <= 8'b0;
            valid <= 0;
        end else if (req) begin
            if (rw) begin
                qa <= mem[ar][ac];
                valid <= 1;
            end else begin
                mem[ar][ac] <= qi;
                valid <= 0;
            end
        end else begin
            valid <= 0;
        end
    end
endmodule


//[2] Memory_Controller

`timescale 1ns / 1ps

module memory_controller(
    input clk,
    input rst,
    input chip_en,
    input [7:0] addr,
    input [7:0] data_in,
    input rw,
    output reg [3:0] row,
    output reg [3:0] col,
    output reg [7:0] data_out,
    output reg req,
    output reg [7:0] qi,
    input [7:0] qa,
    input valid
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            row <= 0;
            col <= 0;
            req <= 0;
            data_out <= 0;
        end else if (chip_en) begin
            row <= addr[7:4];
            col <= addr[3:0];
            qi <= data_in;
            req <= 1;
            if (rw && valid) begin
                data_out <= qa;
            end
        end else begin
            req <= 0;
        end
    end
endmodule

//[3] TOP_MODULE

`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    input chip_en,
    input rw,
    input [7:0] addr,
    input [7:0] data_in,
    output [7:0] data_out
);

    wire [3:0] ar, ac;
    wire req;
    wire [7:0] qi, qa;
    wire valid;

    memory_controller mc (
        .clk(clk),
        .rst(rst),
        .chip_en(chip_en),
        .addr(addr),
        .data_in(data_in),
        .rw(rw),
        .row(ar),
        .col(ac),
        .data_out(data_out),
        .req(req),
        .qi(qi),
        .qa(qa),
        .valid(valid)
    );

    ram r (
        .clk(clk),
        .rst(rst),
        .req(req),
        .rw(rw),
        .ar(ar),
        .ac(ac),
        .qi(qi),
        .qa(qa),
        .valid(valid)
    );
endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module tb_top();

    reg clk;
    reg rst;
    reg chip_en;
    reg rw;
    reg [7:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    top dut (
        .clk(clk),
        .rst(rst),
        .chip_en(chip_en),
        .rw(rw),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        clk = 0;
        rst = 1;
        chip_en = 0;
        rw = 0;
        addr = 8'b0;
        data_in = 8'b0;

        #10 rst = 0;

        // Write 0x55 to address 0x0A
        #10 chip_en = 1; rw = 0;
        addr = 8'h0A;
        data_in = 8'h55;
        #10 chip_en = 0;

        // Read from address 0x0A
        #10 chip_en = 1; rw = 1;
        addr = 8'h0A;
        #10 chip_en = 0;

        #20 $finish;
    end
endmodule
