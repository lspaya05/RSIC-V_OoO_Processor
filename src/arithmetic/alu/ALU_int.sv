import ALU_OpCodes::aluOpCode_int;

module ALU_int #( //Might want to pipeline and add a comparator for SLT/SLTU depending on timing.
	parameter BIT_WIDTH = 64,
	parameter GATE_DELAY = 50
) (
	input logic [BIT_WIDTH - 1 :0] in1,
	input logic [BIT_WIDTH - 1 :0] in2,
	input logic [3:0] aluOpCode,
	output logic [BIT_WIDTH - 1 :0] result
);
	// Datapath Signal Values:
	logic [BIT_WIDTH - 1 : 0] adder_Res, comparator_Res, AND_Res, OR_Res, XOR_Res, shifter_Res;

	//For Adder:
	logic cOut, Cin;

	// Control Logic:
	always_comb case(aluOpCode)
		ALU_ADD:  result = adder_Res;
		ALU_SUB:  result = adder_Res;
        ALU_AND:  result = AND_Res;
        ALU_OR:	  result = OR_Res;
        ALU_XOR:  result = XOR_Res;
        ALU_SLL:  result = shifter_Res;
        ALU_SRL:  result = shifter_Res;
        ALU_SRA:  result = shifter_Res;
        ALU_SLT:  result = (adder_Res[BIT_WIDTH - 1]);
        ALU_SLTU: result = (addr_Res[BIT_WIDTH - 1]);
	endcase

	//Adder:
	Adder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH), .METHOD("RTL")) adderModule (
				.in1, .in2, CIn(), .sum(addr_Res), .cOut());

	//AND:
	AND_Res = in1 & in2;

	//OR:
	OR_Res = in1 | in2;

	//XOR:
	XOR_Res = in1 ^ in2;

	//Shifter:
	BarrelShifter #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH)) shift (
		.in(in1), .shiftAmt(in2[$clog2(BIT_WIDTH) - 1 : 0]), .signExtend(aluOpCode == ALU_SRA), 
		.shiftLeft(aluOpCode == ALU_SLL), .out(shifter_Res) 
	); // Note, this Shifter may have some redundancies, as not all its functionality is used.

endmodule 


	