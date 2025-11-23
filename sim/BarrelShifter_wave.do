onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /BarrelShifter_tb/dut/in
add wave -noupdate -radix unsigned /BarrelShifter_tb/dut/shiftAmt
add wave -noupdate /BarrelShifter_tb/dut/signExtend
add wave -noupdate /BarrelShifter_tb/dut/shiftLeft
add wave -noupdate -radix decimal /BarrelShifter_tb/dut/out
add wave -noupdate -expand -group Internal /BarrelShifter_tb/dut/signExtender
add wave -noupdate -expand -group Internal /BarrelShifter_tb/dut/rightShiftPossibleValues
add wave -noupdate -expand -group Internal /BarrelShifter_tb/dut/leftShiftPossibleValues
add wave -noupdate -expand -group Internal -radix decimal /BarrelShifter_tb/dut/rightShiftOut
add wave -noupdate -expand -group Internal -radix decimal /BarrelShifter_tb/dut/leftShiftOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {38370 ps} 0}
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
WaveRestoreZoom {0 ps} {134947 ps}
