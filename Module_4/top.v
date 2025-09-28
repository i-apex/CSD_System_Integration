module top (
    input  wire clk,   // 100 MHz system clock from ZYBO
    input  wire reset,
    output wire vga_hs,
    output wire vga_vs,
    output wire [4:0] vga_r,
    output wire [5:0] vga_g,
    output wire [4:0] vga_b
);

    wire clk25;

    // Clock divider (you must have clk_divider_25mhz.v)
    clk_divider_25mhz clkgen (
        .clk(clk),
        .reset(reset),
        .clk25(clk25)
    );

    // VGA driver
//    vga_driver vga (
//        .clk25(clk25),
//        .reset(reset),
//        .hsync(vga_hs),
//        .vsync(vga_vs),
//        .vga_r(vga_r),
//        .vga_g(vga_g),
//        .vga_b(vga_b)
//    );


vga_driver_2 vga (
        .clk25(clk25),
        .reset(reset),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b)
    );

endmodule
