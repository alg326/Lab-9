`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 01:24:18 PM
// Design Name: 
// Module Name: multiplier_seq
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


module multiplier_seq(clk,rst,op_a,op_b,prod);
    input clk;
    input rst;
    input [3:0] op_a, op_b;
    output reg [7:0] prod;

    // State

    parameter s0_idle=0, s1_multiply=1, s2_update = 2, s3_done = 3;

    reg [1:0] NS, PS;

    reg [7:0] partial_prod;
    reg [7:0] multiplicand;
    reg [3:0] operand_bb;
    reg [2:0] shift_count;

    // State functions

    always @(posedge clk or posedge rst)
        begin
            if (rst)
                PS <= s0_idle;
            else
                PS <= NS;
        end

    // Each state descriptions
    always @(posedge clk)
        begin
            case(PS)
                s0_idle: begin
                    NS <= s1_multiply;
                    partial_prod <= 8'b0;
                    multiplicand <= {4'b0,op_a};
                    operand_bb <= op_b;
                    shift_count <= 3'b0;
                end

                s1_multiply: begin
                    if(operand_bb[0]==0 & shift_count<4)
                    begin
                        partial_prod <= partial_prod;
                        multiplicand <= multiplicand<<1;
                        operand_bb <= operand_bb>>1;
                        shift_count <= shift_count+3'b1;
                    end
                    else if (operand_bb[0]==1 & shift_count<4)
                    begin
                        partial_prod <= partial_prod+multiplicand;
                        multiplicand <= multiplicand<<1;
                        operand_bb <= operand_bb>>1;
                        shift_count <= shift_count+3'b1;
                    end
                    if(shift_count==4)
                    begin
                        NS <= s2_update;
                    end
                    else
                    begin
                        NS <= s1_multiply;
                    end
                end

                s2_update: begin
                    prod <= partial_prod; 
                    NS <= s3_done;
                end

                s3_done: begin
                    NS <= s0_idle;
                end
            endcase
        end


endmodule
