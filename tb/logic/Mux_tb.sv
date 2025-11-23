// Name: Leonard Paya
// Date: 10/06/2025

// This is a Variable size Mux that can take any amount of input where log base 2 is equal to an
//  integer. The selector must be equal to log base 2 of the input bits. There is no error checking
//  in this module.

// Parameters:
//      - MUX_WIDTH: Variable bit length for possible choices to choose from in the Mux. Must be log
//              base 2.
//      - GATE_DELAY: Variable Integer value to control the Gate Delay of all logic gates instatiated.
// Input:
//      - in: Variable bit length, these are the possible choices that can be choosen from.
//      - sel: Variable bit length, selects the input to output. Must be log base 2 of the MUX_WIDTH.
// Output:
//      - out: A one bit output that contains the value that we selected.

module Mux_tb();
    parameter MUX_WIDTH = 16;
    parameter int GATE_DELAY = 50;
    parameter int DELAY = 5000000;

    logic [MUX_WIDTH - 1 : 0] in;
    logic [$clog2(MUX_WIDTH) - 1 : 0] sel;
    logic out;

    Mux #(.MUX_WIDTH(MUX_WIDTH), .GATE_DELAY(GATE_DELAY)) dut (.*);
    
    initial begin
        in = 16'hF0F0; sel = 4'd63; #(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);
        

        in = 16'h0001; sel = 4'd63; #(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);

        in = 16'h0002; sel = 6'd63;#(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);

        in = 16'h0003; sel = 6'd63;#(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);

        in = 16'h0004; sel = 6'd63;#(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);

        in = 16'h0005; sel = 6'd63;#(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);

        in = 16'h1000; sel = 6'd63;#(DELAY);
        sel = 4'd15; #(DELAY);
        sel = 4'd8; #(DELAY);
        sel = 4'd0; #(DELAY);
    end 
endmodule
