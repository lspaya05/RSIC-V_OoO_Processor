onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /booth_mult_tb/clk_i
add wave -noupdate /booth_mult_tb/reset_i
add wave -noupdate /booth_mult_tb/v_i
add wave -noupdate /booth_mult_tb/yumi_i
add wave -noupdate -radix decimal /booth_mult_tb/a_i
add wave -noupdate -radix decimal /booth_mult_tb/b_i
add wave -noupdate /booth_mult_tb/ready_o
add wave -noupdate /booth_mult_tb/v_o
add wave -noupdate -radix decimal /booth_mult_tb/data_o
add wave -noupdate -radix binary /booth_mult_tb/dut/A_r
add wave -noupdate -radix binary /booth_mult_tb/dut/P_r
add wave -noupdate -radix binary /booth_mult_tb/dut/S_r
add wave -noupdate /booth_mult_tb/dut/ps
add wave -noupdate /booth_mult_tb/dut/step_count_r
add wave -noupdate /booth_mult_tb/dut/P_adder_lo
add wave -noupdate /booth_mult_tb/dut/P_idle_hold_lo
add wave -noupdate /booth_mult_tb/dut/P_lsr_lo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {68 ps}
