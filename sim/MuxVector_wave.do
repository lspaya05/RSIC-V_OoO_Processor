onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -childformat {{{/MuxVector_tb/dut/in[3]} -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {{/MuxVector_tb/dut/in[2]} -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {{/MuxVector_tb/dut/in[1]} -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {{/MuxVector_tb/dut/in[0]} -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}}} -expand -subitemconfig {{/MuxVector_tb/dut/in[3]} {-height 15 -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {/MuxVector_tb/dut/in[3][7]} {-radix unsigned} {/MuxVector_tb/dut/in[3][6]} {-radix unsigned} {/MuxVector_tb/dut/in[3][5]} {-radix unsigned} {/MuxVector_tb/dut/in[3][4]} {-radix unsigned} {/MuxVector_tb/dut/in[3][3]} {-radix unsigned} {/MuxVector_tb/dut/in[3][2]} {-radix unsigned} {/MuxVector_tb/dut/in[3][1]} {-radix unsigned} {/MuxVector_tb/dut/in[3][0]} {-radix unsigned} {/MuxVector_tb/dut/in[2]} {-height 15 -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {/MuxVector_tb/dut/in[2][7]} {-radix unsigned} {/MuxVector_tb/dut/in[2][6]} {-radix unsigned} {/MuxVector_tb/dut/in[2][5]} {-radix unsigned} {/MuxVector_tb/dut/in[2][4]} {-radix unsigned} {/MuxVector_tb/dut/in[2][3]} {-radix unsigned} {/MuxVector_tb/dut/in[2][2]} {-radix unsigned} {/MuxVector_tb/dut/in[2][1]} {-radix unsigned} {/MuxVector_tb/dut/in[2][0]} {-radix unsigned} {/MuxVector_tb/dut/in[1]} {-height 15 -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {/MuxVector_tb/dut/in[1][7]} {-radix unsigned} {/MuxVector_tb/dut/in[1][6]} {-radix unsigned} {/MuxVector_tb/dut/in[1][5]} {-radix unsigned} {/MuxVector_tb/dut/in[1][4]} {-radix unsigned} {/MuxVector_tb/dut/in[1][3]} {-radix unsigned} {/MuxVector_tb/dut/in[1][2]} {-radix unsigned} {/MuxVector_tb/dut/in[1][1]} {-radix unsigned} {/MuxVector_tb/dut/in[1][0]} {-radix unsigned} {/MuxVector_tb/dut/in[0]} {-height 15 -radix unsigned -childformat {{{[7]} -radix unsigned} {{[6]} -radix unsigned} {{[5]} -radix unsigned} {{[4]} -radix unsigned} {{[3]} -radix unsigned} {{[2]} -radix unsigned} {{[1]} -radix unsigned} {{[0]} -radix unsigned}}} {/MuxVector_tb/dut/in[0][7]} {-radix unsigned} {/MuxVector_tb/dut/in[0][6]} {-radix unsigned} {/MuxVector_tb/dut/in[0][5]} {-radix unsigned} {/MuxVector_tb/dut/in[0][4]} {-radix unsigned} {/MuxVector_tb/dut/in[0][3]} {-radix unsigned} {/MuxVector_tb/dut/in[0][2]} {-radix unsigned} {/MuxVector_tb/dut/in[0][1]} {-radix unsigned} {/MuxVector_tb/dut/in[0][0]} {-radix unsigned}} /MuxVector_tb/dut/in
add wave -noupdate -radix unsigned /MuxVector_tb/dut/sel
add wave -noupdate /MuxVector_tb/dut/out
add wave -noupdate {/MuxVector_tb/dut/Muxes[0]/muxVec/in}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {441 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1508 ps}
