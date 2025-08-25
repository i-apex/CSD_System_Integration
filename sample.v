module simple_blink(
    input wire clk,        // 125 MHz clock input
    output reg out = 0     // Output signal
);

    reg [26:0] counter = 0;  // Enough bits for ~1 second at 125 MHz

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 125_000_000) begin
            out <= ~out;   // Toggle output
            counter <= 0;
        end
    end
endmodule
