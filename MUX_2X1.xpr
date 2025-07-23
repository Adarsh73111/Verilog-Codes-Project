`timescale 1ns / 1ps

module mux_2X1 (
    input wire a,      
    input wire b,      
    input wire sel,    
    output wire y      
);
    assign y = (sel) ? b : a;

endmodule


// TEST-BENCH //

`timescale 1ns / 1ps

module mux_2X1_tb;
    reg a;      
    reg b;      
    reg sel;    
    wire y;   

    mux_2X1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("a b sel | y");
        $display("----------|---");
        a = 0; b = 0; sel = 0;
        #10; // Wait for 10 time units
        $display("%b %b %b | %b", a, b, sel, y);

        a = 0; b = 1; sel = 0;
        #10;
        $display("%b %b %b | %b", a, b, sel, y);
        a = 1; b = 0; sel = 1;
        #10;
        $display("%b %b %b | %b", a, b, sel, y);
        a = 1; b = 1; sel = 1;
        #10;
        $display("%b %b %b | %b", a, b, sel, y);
        
        $finish;
    end

endmodule
