# ==========================================
# Parameterized ModelSim TCL Simulation Script
# ==========================================

# Usage:
#   vsim -c -do runsim.tcl -- <testbench_name>"


# ==========================================
# Parse arguments
# ==========================================
if {$argc < 1} {
    puts "Error: No testbench specified."
    puts "Usage: vsim -do \"run_sim.tcl <tb_name>\""
    exit
}
set tb_name [lindex $argv 0]
puts "Selected testbench: $tb_name"


# ==========================================
# Create / map libraries
# ==========================================
if {![file exists work]} {
    vlib work
}
vmap work work


# ==========================================
# Collect RTL & TB files
# ==========================================

# Recursively collect all .sv files in src/ and tb/
set rtl_files [glob -types f -nocomplain ../src/**/*.sv]
set tb_files  [glob -types f -nocomplain ../tb/**/*.sv]


# ==========================================
# Compile RTL files
# ==========================================
foreach f $rtl_files {
    puts "Compiling RTL: $f"
    vlog +acc $f
}


# ==========================================
# Compile Testbench files
# ==========================================
foreach f $tb_files {
    puts "Compiling TB: $f"
    vlog +acc $f
}


# ==========================================
# Run selected testbench
# ==========================================
puts "Starting simulation for testbench: $tb_name"
vsim -voptargs "+acc" -t 1ps -lib work $tb_name


# ==========================================
# Waveform file support
# ==========================================
# Look for: wave_<tb_name>.do   e.g., wave_BarrelShifter_tb.do
set wavefile "wave_${tb_name}.do"

if {[file exists $wavefile]} {
    puts "Loading waveform file: $wavefile"
    do $wavefile
} else {
    puts "Waveform file not found. Adding default waves."
    add wave -r /*
}


# ==========================================
# Open windows
# ==========================================
view wave
view structure
view signals


# ==========================================
# Run simulation
# ==========================================
run -all

quit -f