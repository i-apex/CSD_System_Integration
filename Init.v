module led_blink(
    input wire clk,        // 125 MHz clock input
    output reg led = 0     // LED output
);

    reg [26:0] counter = 0;  

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 125000000) begin // ~1 sec delay
            led <= ~led;  // toggle LED
            counter <= 0;
        end
    end
endmodule
