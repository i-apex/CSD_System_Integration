`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// VGA driver with text rendering using font_rom
//////////////////////////////////////////////////////////////////////////////////

module vga_driver_2 (
    input  wire clk25,       // 25 MHz pixel clock
    input  wire reset,
    output reg  vga_hs,
    output reg  vga_vs,
    output reg  [4:0] vga_r,
    output reg  [5:0] vga_g,
    output reg  [4:0] vga_b
);

    // VGA 640x480 @60Hz
    parameter H_VISIBLE = 640;
    parameter H_FRONT   = 16;
    parameter H_SYNC    = 96;
    parameter H_BACK    = 48;
    parameter H_TOTAL   = 800;

    parameter V_VISIBLE = 480;
    parameter V_FRONT   = 10;
    parameter V_SYNC    = 2;
    parameter V_BACK    = 33;
    parameter V_TOTAL   = 525;

    reg [9:0] h_count = 0;
    reg [9:0] v_count = 0;

    integer i;   
    integer r,c;

    // Horizontal and vertical counters
    always @(posedge clk25 or posedge reset) begin
        if (reset) begin
            h_count <= 0;
            v_count <= 0;
        end else begin
            if (h_count == H_TOTAL-1) begin
                h_count <= 0;
                if (v_count == V_TOTAL-1)
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
            end else begin
                h_count <= h_count + 1;
            end
        end
    end

    // Sync signals (active low)
    always @(posedge clk25) begin
        vga_hs <= ~((h_count >= H_VISIBLE + H_FRONT) &&
                    (h_count <  H_VISIBLE + H_FRONT + H_SYNC));
        vga_vs <= ~((v_count >= V_VISIBLE + V_FRONT) &&
                    (v_count <  V_VISIBLE + V_FRONT + V_SYNC));
    end

    // -----------------------------
    // Text Rendering
    // -----------------------------

    // Character grid: 80 cols x 30 rows (8x16 font)
    wire [6:0] char_col = h_count[9:3]; // divide by 8
    wire [4:0] char_row = v_count[8:4]; // divide by 16

    // Pixel inside character cell
    wire [2:0] font_x = h_count[2:0];
    wire [3:0] font_y = v_count[3:0];

    // Example: define a string buffer (HELLO WORLD)
    reg [7:0] text_mem [0:29][0:79];  

initial begin
    // Row 0 = "hello world"
    text_mem[0][0]  = "h";
    text_mem[0][1]  = "e";
    text_mem[0][2]  = "l";
    text_mem[0][3]  = "l";
    text_mem[0][4]  = "o";
    text_mem[0][5]  = " ";
    text_mem[0][6]  = "w";
    text_mem[0][7]  = "o";
    text_mem[0][8]  = "r";
    text_mem[0][9]  = "l";
    text_mem[0][10] = "d";

    // Fill row 0 remainder with spaces
    for (i = 11; i < 80; i = i+1) begin
        text_mem[0][i] = " ";
    end

    // Fill all other rows with spaces
  
    for (r = 1; r < 30; r = r+1) begin
        for (c = 0; c < 80; c = c+1) begin
            text_mem[r][c] = " ";
        end
    end
    
  end
    // Current character code
    wire [7:0] char_code = text_mem[char_row][char_col];

    // Get font bitmap for this char_code and row
    wire [7:0] font_row_bits;

    font_rom font_inst (
        .char_code(char_code),
        .row(font_y),
        .pixels(font_row_bits)
    );

    // Select pixel bit
    wire pixel_on = font_row_bits[7 - font_x]; // MSB left

    // -----------------------------
    // RGB Output
    // -----------------------------
    always @(posedge clk25) begin
        if ((h_count < H_VISIBLE) && (v_count < V_VISIBLE)) begin
            if (pixel_on) begin
                // White text
                vga_r <= 5'b11111;
                vga_g <= 6'b111111;
                vga_b <= 5'b11111;
            end else begin
                // Blue background
                vga_r <= 5'b00000;
                vga_g <= 6'b000000;
                vga_b <= 5'b11111;
            end
        end else begin
            // Outside visible area = black
            vga_r <= 0;
            vga_g <= 0;
            vga_b <= 0;
        end
    end

endmodule
