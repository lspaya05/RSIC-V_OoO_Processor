# Project Check List

## Testbenched and Finalized
### *arithmetic*
#### add
- [ ] Adder.sv
- [ ] CarryLookAheadAdder.sv
- [x] FullAdder.sv
- [x] HalfAdder.sv
- [ ] RippleCarryAdder.sv
#### alu
- [ ] ALU_FP.sv
- [ ] ALU_int.sv
#### mul
- [x] booth_mult.sv
- [x] nrd_div.sv
- [x] BarrelShifter.sv

### buffers
- [ ] Fifo.sv
- [ ] FifoCntrl.sv
- [ ] ReorderBuffer.sv

### logic
- [x] Demux.sv
- [x] Encoder.sv
- [x] Mux.sv
- [x] MuxVector.sv

### MemoryUnits
- [ ] AGU.sv

### packages
- [x] ALU_OpCodes.sv
- [ ] RV32A.sv
- [ ] RV32D.sv
- [ ] RV32F.sv
- [ ] RV32G.sv
- [x] RV32I.sv
- [x] RV32M.sv

### predictors
- [ ] GSharePredictor.sv
- [ ] TwoBitPredictor.sv

### registers
- [x] Dff_En.sv
- [x] Dff.sv
- [x] RegEnXBit.sv
- [x] regFile.sv
- [x] RegXBit.sv
- [x] ShiftLeftReg.sv

### reservationStation
- [ ] FUCntrl.sv
- [ ] ReservationSlot.sv
- [ ] ReservationStation.sv
- [ ] RSCntrl.sv

## Module Draft
### arithmetic
#### add
- [x] Adder.sv
- [ ] CarryLookAheadAdder.sv
- [x] FullAdder.sv
- [x] HalfAdder.sv
- [ ] RippleCarryAdder.sv
#### alu
- [ ] ALU_FP.sv
- [ ] ALU_int.sv
#### mul
- [x] booth_mult.sv
- [x] nrd_div.sv

### buffers
- [x] Fifo.sv
- [x] FifoCntrl.sv
- [x] ReorderBuffer.sv

### logic
- [x] Demux.sv
- [x] Encoder.sv
- [x] Mux.sv
- [x] MuxVector.sv

### MemoryUnits
- [ ] AGU.sv

### packages
- [ ] ALU_OpCodes.sv
- [ ] RV32A.sv
- [ ] RV32D.sv
- [ ] RV32F.sv
- [ ] RV32G.sv
- [x] RV32I.sv
- [x] RV32M.sv

### predictors
- [?] GSharePredictor.sv: Need to change method of writing.
- [?] TwoBitPredictor.sv: Need to change method of writing.

### registers
- [x] Dff_En.sv
- [x] Dff.sv
- [x] RegEnXBit.sv
- [x] regFile.sv
- [x] RegXBit.sv
- [x] ShiftLeftReg.sv

### reservationStation
- [x] FUCntrl.sv
- [x] ReservationSlot.sv
- [x] ReservationStation.sv
- [x] RSCntrl.sv

