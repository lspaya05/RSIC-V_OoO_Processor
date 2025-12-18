# Name: Leonard Paya
# Date: 12/11/2025

# General Script for running and saving waveform configurations.

# ===============================================
#   PARAMETER DECLARATIONS
# ===============================================

# ---------------- EDIT HERE --------------------
set TB_NAME "Mux"
# -----------------------------------------------

set LIB_NAME "work"

# Design and Testbench files
set SRC_FILES "../../src/*.sv"
set TB_FILES "../../tb/*.sv"

# Dir. for wave data and wave configurations.
set WAVE_DIR "../waves"
set CONFIG_DIR "./waveConfigs"

# ===============================================
#   LIB. AND DIR. SETUP
# ===============================================

file mkdir $WAVE_DIR
file mkdir $CONFIG_DIR

# Create the working library if it doesn't exist
if {![file exists $LIB_NAME]} {
    vlib $LIB_NAME
    vmap work $LIB_NAME
}

# ===============================================
#   COMPILE VERILOG
# ===============================================

# Only works in newer versions:
# set all_src [glob -nocomplain -types f -recursive SRC_FILES]
# set all_tb [glob -nocomplain -types f -recursive TB_FILES]


proc glob_recursive {dir pattern} {
    set results {}
    foreach item [glob -nocomplain -directory $dir *] {
        if {[file isdirectory $item]} {
            set results [concat $results [glob_recursive $item $pattern]]
        } elseif {[string match $pattern [file tail $item]]} {
            lappend results $item
        }
    }
    return $results
}

set allSrc [glob_recursive SRC_FILES *.sv]

set allTb [glob_recursive TB_FILES *.sv]


foreach f $allSrc {
    vlog $f
}

foreach f $allTb {
    vlog $f
}

# Call vsim to invoke simulator
#  - Make sure the last item on the line is the correct name of
#    the testbench module you want to execute.
#  - If you need the altera_mf_ver library, add "-Lf altera_mf_lib"
#    (no quotes) to the end of the vsim command

vsim \
    -voptargs="+acc" \
    -t 1ps -wlf ${WAVE_DIR}/${TB_NAME}.wlf \
    ${LIB_NAME}.${TB_NAME}_tb


# =========================================================
# 4. WAVE CONFIGURATION LOADING
# =========================================================

# Check if a specific wave configuration exists for this TB
set wave_file "${CONFIG_DIR}/${TB_NAME}_wave.do"

if {[file exists $wave_file]} {
    # If a saved config exists, load it
    do $wave_file
} else {
    # If no config exists, add all waves recursively by default
    add wave -r /*
}

# =========================================================
# 5. LOGGING AND RUNNING - Optional
# =========================================================

# Log all signals to the WLF file defined in the vsim command
log -r /*

# Set the window types
view wave
view structure
view signals


# Run the simulation (This is not optional)
run -all