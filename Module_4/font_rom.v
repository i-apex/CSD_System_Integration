`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Font ROM for 8x8 lowercase ASCII glyphs
// Only 'a' to 'z' implemented
//////////////////////////////////////////////////////////////////////////////////

module font_rom (
    input  wire [7:0] char_code,  // ASCII code
    input  wire [2:0] row,        // row index (0–7)
    output reg  [7:0] pixels      // pixel row (MSB = leftmost pixel)
);

    always @(*) begin
        case (char_code)

            // ===== Lowercase letters =====
            "a": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01111000;
                    3: pixels = 8'b00001100;
                    4: pixels = 8'b01111100;
                    5: pixels = 8'b11001100;
                    6: pixels = 8'b01110110;
                    7: pixels = 8'b00000000;
                endcase
            "b": case (row)
                    0: pixels = 8'b11100000;
                    1: pixels = 8'b01100000;
                    2: pixels = 8'b01111000;
                    3: pixels = 8'b01101100;
                    4: pixels = 8'b01101100;
                    5: pixels = 8'b01101100;
                    6: pixels = 8'b11111000;
                    7: pixels = 8'b00000000;
                endcase
            "c": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01111000;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11000000;
                    5: pixels = 8'b11001100;
                    6: pixels = 8'b01111000;
                    7: pixels = 8'b00000000;
                endcase
            "d": case (row)
                    0: pixels = 8'b00011100;
                    1: pixels = 8'b00001100;
                    2: pixels = 8'b01111100;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b11001100;
                    6: pixels = 8'b01110110;
                    7: pixels = 8'b00000000;
                endcase
            "e": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01111000;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11111100;
                    5: pixels = 8'b11000000;
                    6: pixels = 8'b01111000;
                    7: pixels = 8'b00000000;
                endcase
            "f": case (row)
                    0: pixels = 8'b00111000;
                    1: pixels = 8'b01101100;
                    2: pixels = 8'b01100000;
                    3: pixels = 8'b11110000;
                    4: pixels = 8'b01100000;
                    5: pixels = 8'b01100000;
                    6: pixels = 8'b11110000;
                    7: pixels = 8'b00000000;
                endcase
            "g": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01110110;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b01111100;
                    6: pixels = 8'b00001100;
                    7: pixels = 8'b11111000;
                endcase
            "h": case (row)
                    0: pixels = 8'b11100000;
                    1: pixels = 8'b01100000;
                    2: pixels = 8'b01111000;
                    3: pixels = 8'b01101100;
                    4: pixels = 8'b01101100;
                    5: pixels = 8'b01101100;
                    6: pixels = 8'b11101100;
                    7: pixels = 8'b00000000;
                endcase
            "i": case (row)
                    0: pixels = 8'b00011000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b00111000;
                    3: pixels = 8'b00011000;
                    4: pixels = 8'b00011000;
                    5: pixels = 8'b00011000;
                    6: pixels = 8'b01111100;
                    7: pixels = 8'b00000000;
                endcase
            "j": case (row)
                    0: pixels = 8'b00000110;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b00000110;
                    3: pixels = 8'b00000110;
                    4: pixels = 8'b00000110;
                    5: pixels = 8'b11000110;
                    6: pixels = 8'b01111100;
                    7: pixels = 8'b00000000;
                endcase
            "k": case (row)
                    0: pixels = 8'b11100000;
                    1: pixels = 8'b01100000;
                    2: pixels = 8'b01101100;
                    3: pixels = 8'b01111000;
                    4: pixels = 8'b01111000;
                    5: pixels = 8'b01101100;
                    6: pixels = 8'b11101100;
                    7: pixels = 8'b00000000;
                endcase
            "l": case (row)
                    0: pixels = 8'b01110000;
                    1: pixels = 8'b00110000;
                    2: pixels = 8'b00110000;
                    3: pixels = 8'b00110000;
                    4: pixels = 8'b00110000;
                    5: pixels = 8'b00110000;
                    6: pixels = 8'b01111000;
                    7: pixels = 8'b00000000;
                endcase
            "m": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11101100;
                    3: pixels = 8'b11111110;
                    4: pixels = 8'b11010110;
                    5: pixels = 8'b11000110;
                    6: pixels = 8'b11000110;
                    7: pixels = 8'b00000000;
                endcase
            "n": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11111000;
                    3: pixels = 8'b01101100;
                    4: pixels = 8'b01101100;
                    5: pixels = 8'b01101100;
                    6: pixels = 8'b01101100;
                    7: pixels = 8'b00000000;
                endcase
            "o": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01111000;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b11001100;
                    6: pixels = 8'b01111000;
                    7: pixels = 8'b00000000;
                endcase
            "p": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11111000;
                    3: pixels = 8'b01101100;
                    4: pixels = 8'b01101100;
                    5: pixels = 8'b01111000;
                    6: pixels = 8'b01100000;
                    7: pixels = 8'b11110000;
                endcase
            "q": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01111100;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b01111100;
                    6: pixels = 8'b00001100;
                    7: pixels = 8'b00011110;
                endcase
            "r": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11111000;
                    3: pixels = 8'b01101100;
                    4: pixels = 8'b01100000;
                    5: pixels = 8'b01100000;
                    6: pixels = 8'b11110000;
                    7: pixels = 8'b00000000;
                endcase
            "s": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b01111100;
                    3: pixels = 8'b11000000;
                    4: pixels = 8'b01111000;
                    5: pixels = 8'b00001100;
                    6: pixels = 8'b11111000;
                    7: pixels = 8'b00000000;
                endcase
            "t": case (row)
                    0: pixels = 8'b00110000;
                    1: pixels = 8'b00110000;
                    2: pixels = 8'b11111100;
                    3: pixels = 8'b00110000;
                    4: pixels = 8'b00110000;
                    5: pixels = 8'b00110000;
                    6: pixels = 8'b00011100;
                    7: pixels = 8'b00000000;
                endcase
            "u": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11001100;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b11001100;
                    6: pixels = 8'b01110110;
                    7: pixels = 8'b00000000;
                endcase
            "v": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11001100;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b01111000;
                    6: pixels = 8'b00110000;
                    7: pixels = 8'b00000000;
                endcase
            "w": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11000110;
                    3: pixels = 8'b11010110;
                    4: pixels = 8'b11111110;
                    5: pixels = 8'b11111110;
                    6: pixels = 8'b01101100;
                    7: pixels = 8'b00000000;
                endcase
            "x": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11001100;
                    3: pixels = 8'b01111000;
                    4: pixels = 8'b00110000;
                    5: pixels = 8'b01111000;
                    6: pixels = 8'b11001100;
                    7: pixels = 8'b00000000;
                endcase
            "y": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11001100;
                    3: pixels = 8'b11001100;
                    4: pixels = 8'b11001100;
                    5: pixels = 8'b01111100;
                    6: pixels = 8'b00001100;
                    7: pixels = 8'b11111000;
                endcase
            "z": case (row)
                    0: pixels = 8'b00000000;
                    1: pixels = 8'b00000000;
                    2: pixels = 8'b11111100;
                    3: pixels = 8'b00011000;
                    4: pixels = 8'b00110000;
                    5: pixels = 8'b01100000;
                    6: pixels = 8'b11111100;
                    7: pixels = 8'b00000000;
                endcase

            default: pixels = 8'b00000000; // blank
        endcase
    end
endmodule
