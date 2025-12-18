onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Mux_tb/MUX_WIDTH
add wave -noupdate /Mux_tb/GATE_DELAY
add wave -noupdate -radix binary -childformat {{{/Mux_tb/dut/in[15]} -radix binary} {{/Mux_tb/dut/in[14]} -radix binary} {{/Mux_tb/dut/in[13]} -radix binary} {{/Mux_tb/dut/in[12]} -radix binary} {{/Mux_tb/dut/in[11]} -radix binary} {{/Mux_tb/dut/in[10]} -radix binary} {{/Mux_tb/dut/in[9]} -radix binary} {{/Mux_tb/dut/in[8]} -radix binary} {{/Mux_tb/dut/in[7]} -radix binary} {{/Mux_tb/dut/in[6]} -radix binary} {{/Mux_tb/dut/in[5]} -radix binary} {{/Mux_tb/dut/in[4]} -radix binary} {{/Mux_tb/dut/in[3]} -radix binary} {{/Mux_tb/dut/in[2]} -radix binary} {{/Mux_tb/dut/in[1]} -radix binary} {{/Mux_tb/dut/in[0]} -radix binary}} -subitemconfig {{/Mux_tb/dut/in[15]} {-height 15 -radix binary} {/Mux_tb/dut/in[14]} {-height 15 -radix binary} {/Mux_tb/dut/in[13]} {-height 15 -radix binary} {/Mux_tb/dut/in[12]} {-height 15 -radix binary} {/Mux_tb/dut/in[11]} {-height 15 -radix binary} {/Mux_tb/dut/in[10]} {-height 15 -radix binary} {/Mux_tb/dut/in[9]} {-height 15 -radix binary} {/Mux_tb/dut/in[8]} {-height 15 -radix binary} {/Mux_tb/dut/in[7]} {-height 15 -radix binary} {/Mux_tb/dut/in[6]} {-height 15 -radix binary} {/Mux_tb/dut/in[5]} {-height 15 -radix binary} {/Mux_tb/dut/in[4]} {-height 15 -radix binary} {/Mux_tb/dut/in[3]} {-height 15 -radix binary} {/Mux_tb/dut/in[2]} {-height 15 -radix binary} {/Mux_tb/dut/in[1]} {-height 15 -radix binary} {/Mux_tb/dut/in[0]} {-height 15 -radix binary}} /Mux_tb/dut/in
add wave -noupdate -radix unsigned /Mux_tb/dut/sel
add wave -noupdate /Mux_tb/dut/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13292553 ps} 0}
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
WaveRestoreZoom {0 ps} {147 us}
