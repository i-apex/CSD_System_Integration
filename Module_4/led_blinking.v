`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 12:57:33 PM
// Design Name: 
// Module Name: led_blinking
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//     Simple FSM-based LED blinking with delay using a counter
// Dependencies: 
// 
// Revision:
// Revision 0.02 - Fixed counter and state transition logic
//////////////////////////////////////////////////////////////////////////////////

module led_blinking(
    input clk,
    input reset,
    input sw_1,
    output reg [3:0] led_out
    );
    
    reg [3:0] state_reg, state_next;
    reg [25:0] cntr;
    reg cntr_en;
    
    localparam [3:0]
        idle_state  = 0,
        state_1     = 1,
        state_2     = 2,
        state_3     = 3,
        state_4     = 4,
        state_5     = 5,
        state_6     = 6,
        state_7     = 7,
        wait_state  = 8;
        
    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cntr <= 0;
        end else if (cntr_en) begin
            if (cntr == 26'd67108863) // max count for 26-bit counter
                cntr <= 0;
            else
                cntr <= cntr + 1;
        end else begin
            cntr <= 0;
        end
    end
    
    // State register update
    always @(posedge clk or posedge reset) begin
        if (reset)
            state_reg <= idle_state;
        else
            state_reg <= state_next;
    end
    
    // Next state logic and outputs
    always @(*) begin
        // Default assignments
        state_next = state_reg;
        cntr_en = 0;
        led_out = 4'b0000;
        
        case (state_reg)
            idle_state: begin
                led_out = 4'b0000;
                if (sw_1)
                    state_next = state_1;
            end
            
            state_1: begin
                led_out = 4'b0001;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = state_2;
            end
            
            state_2: begin
                led_out = 4'b0010;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = state_3;
            end
            
            state_3: begin
                led_out = 4'b0011;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = state_4;
            end
            
            state_4: begin
                led_out = 4'b0100;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = state_5;
            end
            
            state_5: begin
                led_out = 4'b0101;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = state_6;
            end
            
            state_6: begin
                led_out = 4'b0110;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = state_7;
            end
            
            state_7: begin
                led_out = 4'b0111;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = wait_state;
            end
            
            wait_state: begin
                led_out = 4'b1111;
                cntr_en = 1;
                if (cntr == 26'd67108863)
                    state_next = idle_state;
            end
            
            default: begin
                state_next = idle_state;
            end
        endcase
    end
    
endmodule
