// Name: Leonard Paya
// Date: 11/20/2025

module ReservationStation#( 
    parameter int NUM_SLOTS = 8,
    parameter int NUM_FU = 4;
    parameter int BIT_WIDTH = 32,
    parameter int ALU_OP_WIDTH = 7,
    parameter int TAG_WIDTH = 8, 
    parameter int ADDR_WIDTH = TODO, 
    parameter int NUM_CDB = 8;
    parameter int GATE_DELAY = 0;
) (
    // Input from Instruction Fetch:
    input logic clk, reset,

    // Input logic from Functional unit:
    input logic [TAG_WIDTH - 1 : 0] rvSlot_inTag,
    input logic [ALU_OP_WIDTH - 1 : 0] rvSlot_inOp,
    input logic [TAG_WIDTH - 1 : 0] rvSlot_inQj,
    input logic [TAG_WIDTH - 1 : 0] rvSlot_inQk,
    input logic [BIT_WIDTH - 1 : 0] rvSlot_inVj,
    input logic [BIT_WIDTH - 1 : 0] rvSlot_inVk,
    input logic [ADDR_WIDTH - 1 : 0] rvSlot_inAddr, 

    // Input CBD:
    input logic [TAG_WIDTH - 1 : 0] funcUnitTags [NUM_CDB - 1 : 0],
    input logic [BIT_WIDTH - 1 : 0] funcUnitOut [NUM_CDB - 1 : 0],
    input logic [NUM_CDB - 1 : 0] valueReady,

    //To Functional Units:
    output logic 
);
    // Logic for Control I/O:
    logic [NUM_SLOTS - 1 : 0] rvSlot_wr;
    logic [NUM_SLOTS - 1 : 0] rvSlot_instrRecieved;

    // Datapath Out:
    logic [TAG_WIDTH - 1 : 0] rvSlot_outTag [NUM_SLOTS - 1 : 0];
    logic [ALU_OP_WIDTH - 1 : 0] rvSlot_outOp [NUM_SLOTS - 1 : 0];
    logic [BIT_WIDTH - 1 : 0] rvSlot_outVj [NUM_SLOTS - 1 : 0];
    logic [BIT_WIDTH - 1 : 0] rvSlot_outVk [NUM_SLOTS - 1 : 0];
    logic [ADDR_WIDTH - 1 : 0] rvSlot_outAddr [NUM_SLOTS - 1 : 0];

    // Reservation Station Statuses:
    logic [NUM_SLOTS - 1 : 0] rvSlot_busy, rv_ready;


    genvar i;
    generate 
        for (i = 0; i < NUM_SLOTS; i++) begin : reservationSlot
            ReservationSlot #(.BIT_WIDTH(BIT_WIDTH), .ALU_OP_WIDTH(ALU_OP_WIDTH),
                .TAG_WIDTH(TAG_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .NUM_CDB(NUM_CDB),
                .GATE_DELAY(GATE_DELAY)
            ) rsvpSlot (
                // Control I/O:
                .wr(rvSlot_wr[i]), .instrRecieved(rvSlot_instrRecieved[i]),
                .clk, .reset,
                .busy(rvSlot_busy[i]), .ready(rvSlot_ready[i]),

                // Datapath Input:
                .inTag(rvSlot_inTag),
                .inOp(rvSlot_inOp), 
                .inQj(rvSlot_inQj), .inQk(rvSlot_inQk), 
                .inVj(rvSlot_inVj), .inVk(rvSlot_inVk), 
                .inAddr(rvSlot_inAddr),

                // Datapath Out:
                .outTag(rvSlot_outTag[i]),
                .outOp(rvSlot_outOp[i]), 
                .outVj(rvSlot_outVj[i]), .outVk(rvSlot_outVk[i]),
                .outAddr(rvSlot_outAddr[i]),

                //From CDB:
                .funcUnitTags(funcUnitTags),
                .funcUnitOut(funcUnitOut),
                .valueReady(valueReady)
            );
        end
    endgenerate

    // Mux to Demux combos
    genvar j;
    generate 
        for (j = 0; j < NUM_FU; j++) begin : demux2Mux
        MuxVector #(.BIT_WIDTH(), .GATE_DELAY(GATE_DELAY), .NUM_VECTORS(NUM_SLOTS)) toDemux_tag (
            .in(), .sel(), .out()
        );

        MuxVector #(.BIT_WIDTH(), .GATE_DELAY(GATE_DELAY), .NUM_VECTORS(NUM_SLOTS)) toDemux_op (
            .in(), .sel(), .out()
        );

        MuxVector #(.BIT_WIDTH(), .GATE_DELAY(GATE_DELAY), .NUM_VECTORS(NUM_SLOTS)) toDemux_vj (
            .in(), .sel(), .out()
        );

        MuxVector #(.BIT_WIDTH(), .GATE_DELAY(GATE_DELAY), .NUM_VECTORS(NUM_SLOTS)) toDemux_vk (
            .in(), .sel(), .out()
        );

        MuxVector #(.BIT_WIDTH(), .GATE_DELAY(GATE_DELAY), .NUM_VECTORS(NUM_SLOTS)) toDemux_addr (
            .in(), .sel(), .out()
        );

        Demux #(.BIT_WIDTH(), .NUM_VECTORS()) toFU_tag (
            .in(), .sel(), .out()
        );

        Demux #(.BIT_WIDTH(), .NUM_VECTORS()) toFU_op (
            .in(), .sel(), .out()
        );

        Demux #(.BIT_WIDTH(), .NUM_VECTORS()) toFU_vj (
            .in(), .sel(), .out()
        );

        Demux #(.BIT_WIDTH(), .NUM_VECTORS()) toFU_vk (
            .in(), .sel(), .out()
        );

        Demux #(.BIT_WIDTH(), .NUM_VECTORS()) toFU_ (
            .in(), .sel(), .out()
        );
        end 
    endgenerate

endmodule
