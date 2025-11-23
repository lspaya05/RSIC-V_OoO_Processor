onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /nrd_div_tb/clk_i
add wave -noupdate /nrd_div_tb/reset_i
add wave -noupdate /nrd_div_tb/signed_i
add wave -noupdate /nrd_div_tb/v_i
add wave -noupdate /nrd_div_tb/yumi_i
add wave -noupdate -radix decimal /nrd_div_tb/a_i
add wave -noupdate -radix decimal /nrd_div_tb/b_i
add wave -noupdate /nrd_div_tb/ready_o
add wave -noupdate /nrd_div_tb/v_o
add wave -noupdate -radix decimal /nrd_div_tb/div_o
add wave -noupdate -radix decimal /nrd_div_tb/rem_o
add wave -noupdate /nrd_div_tb/dut/ps
add wave -noupdate -expand -group {Local Signals} -radix unsigned /nrd_div_tb/dut/count_r
add wave -noupdate -expand -group {Local Signals} /nrd_div_tb/dut/count_eq_zero
add wave -noupdate -expand -group {Local Signals} -radix decimal -childformat {{{/nrd_div_tb/dut/A_r[31]} -radix binary} {{/nrd_div_tb/dut/A_r[30]} -radix binary} {{/nrd_div_tb/dut/A_r[29]} -radix binary} {{/nrd_div_tb/dut/A_r[28]} -radix binary} {{/nrd_div_tb/dut/A_r[27]} -radix binary} {{/nrd_div_tb/dut/A_r[26]} -radix binary} {{/nrd_div_tb/dut/A_r[25]} -radix binary} {{/nrd_div_tb/dut/A_r[24]} -radix binary} {{/nrd_div_tb/dut/A_r[23]} -radix binary} {{/nrd_div_tb/dut/A_r[22]} -radix binary} {{/nrd_div_tb/dut/A_r[21]} -radix binary} {{/nrd_div_tb/dut/A_r[20]} -radix binary} {{/nrd_div_tb/dut/A_r[19]} -radix binary} {{/nrd_div_tb/dut/A_r[18]} -radix binary} {{/nrd_div_tb/dut/A_r[17]} -radix binary} {{/nrd_div_tb/dut/A_r[16]} -radix binary} {{/nrd_div_tb/dut/A_r[15]} -radix binary} {{/nrd_div_tb/dut/A_r[14]} -radix binary} {{/nrd_div_tb/dut/A_r[13]} -radix binary} {{/nrd_div_tb/dut/A_r[12]} -radix binary} {{/nrd_div_tb/dut/A_r[11]} -radix binary} {{/nrd_div_tb/dut/A_r[10]} -radix binary} {{/nrd_div_tb/dut/A_r[9]} -radix binary} {{/nrd_div_tb/dut/A_r[8]} -radix binary} {{/nrd_div_tb/dut/A_r[7]} -radix binary} {{/nrd_div_tb/dut/A_r[6]} -radix binary} {{/nrd_div_tb/dut/A_r[5]} -radix binary} {{/nrd_div_tb/dut/A_r[4]} -radix binary} {{/nrd_div_tb/dut/A_r[3]} -radix binary} {{/nrd_div_tb/dut/A_r[2]} -radix binary} {{/nrd_div_tb/dut/A_r[1]} -radix binary} {{/nrd_div_tb/dut/A_r[0]} -radix binary}} -subitemconfig {{/nrd_div_tb/dut/A_r[31]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[30]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[29]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[28]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[27]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[26]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[25]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[24]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[23]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[22]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[21]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[20]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[19]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[18]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[17]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[16]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[15]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[14]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[13]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[12]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[11]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[10]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[9]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[8]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[7]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[6]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[5]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[4]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[3]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[2]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[1]} {-height 15 -radix binary} {/nrd_div_tb/dut/A_r[0]} {-height 15 -radix binary}} /nrd_div_tb/dut/A_r
add wave -noupdate -expand -group {Local Signals} -radix unsigned /nrd_div_tb/dut/Q_r
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/A_shifted_lo
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/Q_shifted_lo
add wave -noupdate -expand -group {Local Signals} -radix hexadecimal /nrd_div_tb/dut/AQ_n
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/A_n
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/Q_n
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/A_adder_li1
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/A_adder_li2
add wave -noupdate -expand -group {Local Signals} -radix decimal /nrd_div_tb/dut/A_adder_lo
add wave -noupdate -expand -group {Local Signals} /nrd_div_tb/dut/A_shifted_ge_zero
add wave -noupdate -expand -group {Local Signals} /nrd_div_tb/dut/A_n_ge_zero
add wave -noupdate -expand -group {Local Signals} /nrd_div_tb/dut/A_r_ge_zero
add wave -noupdate -expand -group {Local Signals} /nrd_div_tb/dut/retain_A_val
add wave -noupdate -expand -group {Local Signals} /nrd_div_tb/dut/retain_Q_val
add wave -noupdate -expand -group {Signed Related} -radix decimal /nrd_div_tb/dut/b_input
add wave -noupdate -expand -group {Signed Related} -radix decimal /nrd_div_tb/dut/a_input
add wave -noupdate -expand -group {Signed Related} /nrd_div_tb/dut/negate_out_r
add wave -noupdate -expand -group {Signed Related} /nrd_div_tb/dut/a_neg
add wave -noupdate -expand -group {Signed Related} /nrd_div_tb/dut/b_neg
add wave -noupdate -expand -group {Signed Related} -radix decimal /nrd_div_tb/dut/A_out
add wave -noupdate -expand -group {Signed Related} -radix decimal /nrd_div_tb/dut/Q_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1088 ps} 0}
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
WaveRestoreZoom {945 ps} {1945 ps}
