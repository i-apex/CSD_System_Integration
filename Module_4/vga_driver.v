module vga_driver (
    input  wire clk25,      // 25 MHz pixel clock
    input  wire reset,
    output reg  hsync,
    output reg  vsync,
    output reg [4:0] vga_r, // 5 bits red
    output reg [5:0] vga_g, // 6 bits green
    output reg [4:0] vga_b  // 5 bits blue
);

    // VGA 640x480 @ 60Hz timing
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

    // Horizontal + vertical counters
    always @(posedge clk25 or posedge reset) begin
        if (reset) begin
            h_count <= 0;
            v_count <= 0;
        end else begin
            if (h_count == H_TOTAL - 1) begin
                h_count <= 0;
                if (v_count == V_TOTAL - 1)
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
        hsync <= ~((h_count >= H_VISIBLE + H_FRONT) &&
                   (h_count <  H_VISIBLE + H_FRONT + H_SYNC));
        vsync <= ~((v_count >= V_VISIBLE + V_FRONT) &&
                   (v_count <  V_VISIBLE + V_FRONT + V_SYNC));
    end

    // RGB test pattern: 3 vertical stripes
    always @(posedge clk25) begin
        if ((h_count < H_VISIBLE) && (v_count < V_VISIBLE)) begin
            if (h_count < 213) begin
                vga_r <= 5'h1F;  // full red
                vga_g <= 6'h00;
                vga_b <= 5'h00;
            end else if (h_count < 426) begin
                vga_r <= 5'h00;
                vga_g <= 6'h3F;  // full green
                vga_b <= 5'h00;
            end else begin
                vga_r <= 5'h00;
                vga_g <= 6'h00;
                vga_b <= 5'h1F;  // full blue
            end
        end else begin
            vga_r <= 5'h00;
            vga_g <= 6'h00;
            vga_b <= 5'h00; // blank
        end
    end
endmodule
