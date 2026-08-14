# ALU 8-bit OpenROAD Backend Flow
# Routing

# Paths
set PDK_ROOT "$::env(PDK_ROOT)"

set TECH_LEF "$PDK_ROOT/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef"
set CELL_LEF "$PDK_ROOT/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef"

set LIBERTY "$PDK_ROOT/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

set PLACED_DEF "backend/results/alu_placed_clean.def"

# Read Technology 
read_lef $TECH_LEF
read_lef $CELL_LEF
read_liberty $LIBERTY

# Read placed design
read_def $PLACED_DEF

# Global routing
global_route \
    -guide_file backend/results/alu_route.guide \
    -congestion_iterations 30

# Repair design
repair_design

# Detail routing
detailed_route

# Save routed design
write_def backend/results/alu_routed.def

puts "ALU 8-bit detailed routing completed successfully"
