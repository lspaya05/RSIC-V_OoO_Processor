module ReorderBuffer #(
	parameter DATA_WIDTH=8,
	parameter ADDR_WIDTH=4
) (
	input  logic clk, reset, rd, wr,
	output logic empty, full,
	input  logic [DATA_WIDTH-1:0] w_data,
	output logic [DATA_WIDTH-1:0] r_data
);
	
	// signal declarations
	logic [ADDR_WIDTH-1:0] w_addr, r_addr;
	logic w_en;
	
	// enable write only when FIFO is not full
	// or if reading and writing simultaneously
	assign w_en = wr & (~full | rd);
	
	// instantiate FIFO controller and register file
	fifo_ctrl #(ADDR_WIDTH) c_unit (.*);
	reg_file #(DATA_WIDTH, ADDR_WIDTH) r_unit (.*);
	
endmodule  // fifo