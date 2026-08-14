# ALU 8-bit Routing Verification

set PDK_ROOT "$::env(PDK_ROOT)"

set TECH_LEF "$PDK_ROOT/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef"
set CELL_LEF "$PDK_ROOT/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef"
set LIBERTY "$PDK_ROOT/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

set ROUTED_DEF "backend/results/alu_routed.def"

read_lef $TECH_LEF
read_lef $CELL_LEF
read_liberty $LIBERTY

read_def $ROUTED_DEF

puts " ALU 8-bit ROUTED DESIGN CHECK"

report_design_area

check_placement

puts " Routing verification completed"
