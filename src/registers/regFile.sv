// Name: Leonard Paya
// Date: 11/28/2025

// This is a parameterized Register File implemented using RTL. This module can have any number
//      of read and write ports. Furthermore, the word size can be changed to match whatever the user decides,
//      as well as the DATA_WIDTH. Priority for writing is given to the 'nth' value written.

// Parameters: 
//      - DATA_WIDTH: Represents the number of data bits stored in each address.
//      - ADDR_WIDTH: The number of address bits. Correlates to word size when this number is
//          the exponent to the number 2.
//      - NUM_READ: Number of read data ports the register file has.
//      - NUM_WRITE: Number of write data ports the register file has. 
// Inputs:
//      - clk: 1-bit clock signal.
//      - reset: 1-bit reset signal.    
//      - w_en: NUM_WRITE-bit write enable signal, each bit maps to a certain write enable.
//      - w_addr: NUM_WRITE number of write addresses, each with ADDR_WIDTH number of bits.
//              Write addresses to write data to.
//      - r_addr: NUM_WRITE number of read addresses, each with ADDR_WIDTH number of bits.
//              Read addresses to read data from.
//      - w_data: NUM_WRITE number of data write signals, each with DATA_WIDTH number of bits.
//              Data to write to the register file.
// Output:
//      - r_data: NUM_READ number of data read signals, each with DATA_WIDTH number of bits.
//              Data to read from the register file.
module regFile #(
    parameter int DATA_WIDTH = 8, 
    parameter int ADDR_WIDTH = 5,
    parameter int NUM_READ = 4, 
    parameter int NUM_WRITE = 4
) (
    input logic clk, reset,
    input logic [NUM_WRITE - 1 : 0] w_en,
    input  logic [ADDR_WIDTH - 1 : 0] w_addr [NUM_WRITE - 1 : 0],
    input logic [ADDR_WIDTH - 1 : 0] r_addr [NUM_READ - 1 : 0],
	input  logic [DATA_WIDTH - 1 : 0] w_data [NUM_WRITE - 1 : 0],
	output logic [DATA_WIDTH - 1 : 0] r_data [NUM_READ - 1 : 0]
);
    // The D Flip Flops:
    logic [DATA_WIDTH - 1 : 0] registers [0:2**ADDR_WIDTH-1];
    
    int i;

    // Write Data Logic:
    always_ff @(posedge clk) begin : WriteLogic
        for (i = 0; i < NUM_WRITE; i++) begin
            if (w_en[i]) begin
                registers[w_addr[i]] <= w_data[i];
            end

            if (reset) begin
                registers <= `0;
            end 
        end
    end

    // Read Data (Ends up being a bunch of Muxes): 
    always_comb begin : ReadLogic
        for (i = 0; i < NUM_READ; i++) begin
            r_data[i] = registers[r_addr[i]];
        end 
    end

endmodule