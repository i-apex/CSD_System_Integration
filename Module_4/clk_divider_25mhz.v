`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 04:16:52 PM
// Design Name: 
// Module Name: clk_divider_25mhz
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


module clk_divider_25mhz (
    input wire clk,     // 100 MHz system clock
    input wire reset,      
    output reg clk25       // 25 MHz pixel clock
);
    reg [1:0] counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk25 <= 0;
        end else begin
            counter <= counter + 1;
            if (counter == 1) begin
                clk25 <= ~clk25;
                counter <= 0;
            end
        end
    end
endmodule

