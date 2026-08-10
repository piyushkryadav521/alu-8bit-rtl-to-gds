read_liberty /home/piyush/.volare/volare/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog synthesis/alu_sky130.v

link_design alu_8bit

create_clock -name virtual_clk -period 10.0

set_input_delay 0.5 -clock virtual_clk [get_ports {A B opcode}]
set_output_delay 0.5 -clock virtual_clk [get_ports {result carry zero}]

report_checks -path_delay max -fields {slew cap input_pins nets fanout}
report_checks -path_delay min

report_worst_slack
report_tns
