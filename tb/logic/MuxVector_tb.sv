//Name: Leonard Paya
//Date: 11/14/2025

// This is a testbench for the Vectorized Mux that can work with Multiple Vectors for inputs,
//      and output the selected vector.

// Parameters:
//		- BIT_WIDTH: Bit Width for each of the vectors, should be base 2.
//		- GATE_DELAY: Optional Gate delay to inlcude if want to see delay in waveforms.
//		- NUM_VECTORS: Number of Vectors to choose from, should be base 2.
// Inputs:
//		- in: A 2D bus input that can accept various vector arguements in the form of
//				{V3, V2, V1, V0}, Has NUM_VECTOR inputs, and BIT_WIDTH bit width for ea. vector.
//		- sel: A variable bit input based on NUM_VECTORS, used to select which vector that needs to
//				used.
// Output:
//		- out: Output that provides the selected Vector choosen from sel. Bit size of BIT_WIDTH.
module MuxVector_tb();
	parameter BIT_WIDTH = 8;
    parameter GATE_DELAY = 50;
	parameter NUM_VECTORS = 4;
    
    
    logic [BIT_WIDTH - 1 : 0] v1, v2, v3, v4;
    logic [BIT_WIDTH - 1 : 0] out;
    logic [$clog2(BIT_WIDTH) - 1 : 0] sel;

    MuxVector #(.BIT_WIDTH(BIT_WIDTH), .GATE_DELAY(GATE_DELAY), .NUM_VECTORS(NUM_VECTORS)) dut (
        .in({v1, v2, v3, v4}), .out(out), .sel(sel)
    );

    initial begin
        v1 = 8'd1; v2 = 8'd10; v3 = 8'd20; v4 = 8'd30;

        sel = 8'd0; #(20 * GATE_DELAY);
        sel = 8'd1; #(20 * GATE_DELAY);
        sel = 8'd2; #(20 * GATE_DELAY);
        sel = 8'd3; #(20 * GATE_DELAY);
    end
endmodule