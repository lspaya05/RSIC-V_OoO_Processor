// Name: Leonard Paya
// Date: 11/07/2025

// Testbench for the encoder One hot Encoder module.

// Parameter: 
//      - BIT_WIDTH: Number of input terminals, or max binary number the user wishes to output.
//      - MAX_IN_SUPPORTED: Internal Parameter, represents the max number that is represented by
//          the module.
// Inputs:
//      - in: BIT_WIDTH amount of bits, for valid output only 1 input can be true at a time.
// Outputs:
//      - out: Log base 2 of BIT_WIDTH number of bits, this is the binary representation of the 
//          the one-hot input.
module Encoder_tb ();

    //Testbench Delay:
    parameter int DELAY = 100;

    parameter int BIT_WIDTH = 8;
    logic [BIT_WIDTH - 1 : 0] in;
    logic [$clog2(BIT_WIDTH) - 1 : 0] out;

    Encoder #(.BIT_WIDTH(BIT_WIDTH)) dut (.*);

    initial begin
        in <= 8'b00000001; #(DELAY);
        in <= 8'b00000010; #(DELAY);
        in <= 8'b00000100; #(DELAY);
        in <= 8'b00001000; #(DELAY);
        in <= 8'b00010000; #(DELAY);
        in <= 8'b00100000; #(DELAY);
        in <= 8'b01000000; #(DELAY);
        in <= 8'b10000000; #(DELAY);
    end 
endmodule 