# NOTES:
#  - The most important thing is locating where all of the files
#    are and specifying the correct paths (absolute or relative)
#    in the commands below.
#  - You will also need to make sure that your current directory
#    (cd) in ModelSim is the directory containing this .do file.


# Create work library
vlib work


# Compile Verilog
#  - All Verilog files that are part of this design should have
#    their own "vlog" line below.

# Source: vlog "../src/" 
#vlog "../src/" 

    #arithmetic:
#vlog "../src/arithmetic/add/Adder.sv"
#vlog "../src/arithmetic/add/CarryLookAheadAdder.sv"
#vlog "../src/arithmetic/add/FullAdder.sv"
#vlog "../src/arithmetic/add/HalfAdder.sv"
#vlog "../src/arithmetic/add/RippleCarryAdder.sv"
vlog "../src/arithmetic/BarrelShifter.sv"


    #logic
vlog "../src/logic/Mux.sv"
vlog "../src/logic/MuxVector.sv"
vlog "../src/logic/Encoder.sv"

    #packages:
#vlog "../src/packages/RV32A.sv"
#vlog "../src/packages/RV32D.sv"
#vlog "../src/packages/RV32F.sv"
#vlog "../src/packages/RV32G.sv"
#vlog "../src/packages/RV32I.sv"
#vlog "../src/packages/RV32M.sv"

    #predictors
#vlog "../src/predictors/GSharePredictor.sv"
#vlog "../src/predictors/TwoBitPredictor.sv"

    #registers:
vlog "../src/registers/Dff_En.sv"
vlog "../src/registers/Dff.sv"
vlog "../src/registers/RegEnXBit.sv"
vlog "../src/registers/RegXBit.sv"
vlog "../src/registers/ShiftLeftReg.sv"



# Testbench: vlog "../tb/"
#vlog "../tb/"

  #arithmetic:
#vlog "../tb/arithmetic/add/Adder.sv"
#vlog "../tb/arithmetic/add/CarryLookAheadAdder.sv"
#vlog "../tb/arithmetic/add/FullAdder.sv"
#vlog "../tb/arithmetic/add/HalfAdder.sv"
#vlog "../tb/arithmetic/add/RippleCarryAdder.sv"
vlog "../tb/arithmetic/BarrelShifter_tb.sv"

    #logic
vlog "../tb/logic/Mux_tb.sv"
vlog "../tb/logic/MuxVector_tb.sv"
vlog "../tb/logic/Encoder_tb.sv"


    #packages:
#vlog "../tb/packages/RV32A.sv"
#vlog "../tb/packages/RV32D.sv"
#vlog "../tb/packages/RV32F.sv"
#vlog "../tb/packages/RV32G.sv"
#vlog "../tb/packages/RV32I.sv"
#vlog "../tb/packages/RV32M.sv"

    #predictors
#vlog "../tb/predictors/GSharePredictor.sv"
#vlog "../tb/predictors/TwoBitPredictor.sv"

    #registers:
#vlog "../tb/registers/Dff_En_tb.sv"
#vlog "../tb/registers/Dff_tb.sv"
#vlog "../tb/registers/RegEnXBit_tb.sv"
#vlog "../tb/registers/RegXBit_tb.sv"
#vlog "../tb/registers/ShiftLeftReg_tb.sv"


# Call vsim to invoke simulator
#  - Make sure the last item on the line is the correct name of
#    the testbench module you want to execute.
#  - If you need the altera_mf_ver library, add "-Lf altera_mf_lib"
#    (no quotes) to the end of the vsim command
vsim -voptargs="+acc" -t 1ps -lib work Encoder_tb


# Source the wave do file
#  - This should be the file that sets up the signal window for
#    the module you are testing.
do Encoder_wave.do


# Set the window types
view wave
view structure
view signals


# Run the simulation
run -all


# End
