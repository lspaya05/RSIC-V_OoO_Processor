// Name: Leonard Paya
// Date: 11/28/2025

// TODO: Still need to be completed.

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
module regFile_tb();
    parameter int CLOCK_DELAY = 50;
    parameter int DATA_WIDTH = 64;
    parameter int ADDR_WIDTH = 5;
    parameter int NUM_READ = 4;
    parameter int NUM_WRITE = 4;

    logic clk, reset;
    logic [NUM_WRITE - 1 : 0] w_en;
    logic [ADDR_WIDTH - 1 : 0] w_addr [NUM_WRITE - 1 : 0];
    logic [ADDR_WIDTH - 1 : 0] r_addr [NUM_READ - 1 : 0];
	logic [DATA_WIDTH - 1 : 0] w_data [NUM_WRITE - 1 : 0];
	logic [DATA_WIDTH - 1 : 0] r_data [NUM_READ - 1 : 0];

    
    // Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(CLOCK_DELAY/2) clk <= ~clk;
	end

    w_en = '1;

    int i;

    
    initial begin

        // Write a value into each  register.
		$display("%t Writing pattern to all registers.", $time);
        for (i = 0; i < 2**(ADDR_WIDTH); i++) begin
            // Write Control:
            w_en <= '0;
            w_addr[i + 3] <= i + 3; 
            w_addr[i + 2] <= i + 2
            w_addr[i + 1] <= i + 1; 
            w_addr[i] <= i;

            //Writing Data:
            w_data[i + 3] <= i * 4
            w_data[i + 2] <= i * 3
			w_data[i + 1] <= i * 2;
			w_data[i] <= i;
			@(posedge clk);
			
			w_en <= '1;
			@(posedge clk);
        end

        // Verify Registers retained data.
        $display("%t Checking pattern", $time);
        for (i = 0; i < 2**(ADDR_WIDTH); i++) begin
            w_en <= '0;

            //Random Writes
            w_addr[i + 3] <= i; 
            w_addr[i + 2] <= i + 2
            w_addr[i + 1] <= i + 1; 
            w_addr[i] <= i;

            //Writing Data:
            w_data[i + 3] <= i * 4
            w_data[i + 2] <= i * 3
			w_data[i + 1] <= i * 2;
			w_data[i] <= i;
        end

        $stop;
    end
endmodule