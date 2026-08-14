# ALU 8-bit OpenROAD Backend Flow
# Stage 2: Placement

set NETLIST "synthesis/alu_sky130.v"

set TECH_LEF "$::env(PDK_ROOT)/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef"
set CELL_LEF "$::env(PDK_ROOT)/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef"

set LIBERTY "$::env(PDK_ROOT)/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"


# Read technology and cell information
read_lef $TECH_LEF
read_lef $CELL_LEF
read_liberty $LIBERTY

# Read synthesized netlist
read_verilog $NETLIST
link_design alu_8bit

# Floorplan
initialize_floorplan \
    -die_area "0 0 100 100" \
    -core_area "10 10 90 90" \
    -site unithd

# Create routing track
make_tracks

# Place IO pins
place_pins -hor_layers met3 -ver_layers met2

# Global placement
global_placement \
    -density 0.5

# Detailed placement

detailed_placement

# Save placed design

write_def backend/results/alu_placed.def

puts "ALU 8-bit placement completed successfully"
