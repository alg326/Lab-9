`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 01:30:23 PM
// Design Name: 
// Module Name: multiplier_seq_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_seq_tb;
    reg clk, rst;
    reg [3:0] op_a, op_b;
    wire [7:0] prod;

    multiplier_seq seq_multiplier (
        .clk(clk),
        .rst(rst),
        .op_a(op_a),
        .op_b(op_b),
        .prod(prod)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; #10;
        rst = 0;

        // Test case 1
        op_a = 4'b0011; op_b = 4'b0010;  // Expect prod = 6
        #500; 
        
        rst = 1; #10;
        rst = 0;
        
        // Test case 2
        op_a = 4'b0101; op_b = 4'b0011; #500;  // Expect prod = 15
        
        rst = 1; #10;
        rst = 0;

        // Test case 3
        op_a = 4'b1111; op_b = 4'b0001; #500;  // Expect prod = 15
        
        rst = 1; #10;
        rst = 0;

        // Test case 4
        op_a = 4'b1010; op_b = 4'b0101; #500;  // Expect prod = 50
        
        rst = 1; #10;
        rst = 0;

        // Test case 5
        op_a = 4'b1001; op_b = 4'b0011; #500;  // Expect prod = 27
        
        // Test case 6
        op_a = 4'b1111; op_b = 4'b1111; #500;  // Expect prod = 27

        $stop;
    end
endmodule
