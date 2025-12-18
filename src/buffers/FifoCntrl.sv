// Name: Leonard Paya
// Date: 11/29/2025

module ReorderBufferCntrl #(
    parameter int ADDR_WIDTH = , // Will also represent the various tags, must use 1 based indexing
    parameter int NUM_READ = ,
    parameter int NUM_WRITE = ,
) (
    input logic clk, reset, 
    input logic [NUM_READ - 1 : 0] rd, 
    input logic [NUM_WRITE - 1 : 0] wr, 
    output logic [NUM_READ - 1 : 0] numTillEmpty, // NUMREAD bc, our reads are dependent on if almost empty.
    output logic [NUM_WRITE - 1 : 0] numTillFull, //NUMWRITE bc, our write dependent on if almost full.
    output logic [ADDR_WIDTH - 1 : 0] w_addr [NUM_WRITE - 1 : 0],
    output logic [ADDR_WIDTH - 1 : 0] r_addr [NUM_READ - 1 : 0]
);

    logic [ADDR_WIDTH-1:0] rd_ptr, rd_ptr_next;
	logic [ADDR_WIDTH-1:0] wr_ptr, wr_ptr_next;
	logic [] numTillEmpty_next, 
    logic [] numTillFull_next;

    // Output assignments
	assign w_addr = wr_ptr;
	assign r_addr = rd_ptr;

    // Fifo controller logic
	always_ff @(posedge clk) begin
		if (reset) begin
			wr_ptr <= 0;
			rd_ptr <= 0;
			numTillFull <= //TODO;
			numTillEmpty <= //TODO;
		end else begin
			wr_ptr <= wr_ptr_next;
			rd_ptr <= rd_ptr_next;
			numTillFull   <= numTillFull_next;
			numTillEmpty  <= numTillEmpty_next;
		end
	end

    // Next state logic:
    always_comb begin
        rd_ptr_next = rd_ptr;
        wr_ptr_next = wr_ptr;
		numTillEmpty_next = numTillEmpty;
		numTillFull_next = numtillFull;
        // for both read and write

        // subtract numtillEmpty and numtillFull by rd and wr if pos. do nothing. If neg.
        //  then overflow, so we can only write/read a few into it. numTill...  will be an output
        //  so have the outside control deal with the control of the fifo.

      

        // New Attempt:
        if write more than i read -> check if numTillFull - wr. neg? -> write the difference
                                                                pos -> write whatever

        else if read more than i write -> check if numTillEmpty - rd. neg? -> read the difference.
                                                                      pos or 0? -> read whatever
        else 
            write and read whatever.


        end

endmodule