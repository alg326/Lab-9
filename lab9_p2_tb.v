`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 02:00:00 PM
// Design Name: 
// Module Name: multiplier_comb_tb
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


module multiplier_comb_tb;
    reg [3:0] a, b;
    wire [7:0] p;

    // Instantiate the combinational multiplier
    multiplier_comb comb_multiplier (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        // Test case 1
        a = 4'b0011; b = 4'b0010; #50;  // Expect p = 6

        // Test case 2
        a = 4'b0101; b = 4'b0011; #50;  // Expect p = 15

        // Test case 3
        a = 4'b1111; b = 4'b0001; #50;  // Expect p = 15

        // Test case 4
        a = 4'b1010; b = 4'b0101; #50;  // Expect p = 50

        // Test case 5
        a = 4'b1001; b = 4'b0011; #50;  // Expect p = 27

        // Test case 6
        a = 4'b1100; b = 4'b1100; #50;  // Expect p = 144

        // Complete the test
        $stop;
    end
endmodule
