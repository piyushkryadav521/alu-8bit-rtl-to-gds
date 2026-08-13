# ALU 8-bit OpenROAD Backend Flow
# Stage 1: Floorplanning

set NETLIST "synthesis/alu_sky130.v"

set TECH_LEF "$::env(PDK_ROOT)/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef"
set CELL_LEF "$::env(PDK_ROOT)/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef"

set LIBERTY "$::env(PDK_ROOT)/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

read_lef $TECH_LEF
read_lef $CELL_LEF
read_liberty $LIBERTY

read_verilog $NETLIST
link_design alu_8bit

initialize_floorplan \
    -die_area "0 0 100 100" \
    -core_area "10 10 90 90" \
    -site unithd

# place_pins will be done after routing tracks are configured

write_def backend/results/alu_floorplan.def

puts "ALU 8-bit floorplan completed successfully"
