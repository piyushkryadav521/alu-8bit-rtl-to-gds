
# ALU 8-bit - Timing Constraints
# Combinational design

# Virtual clock for I/O timing analysis
create_clock -name virtual_clk -period 10.0

# Input arrival time
set_input_delay 0.0 -clock virtual_clk [get_ports {A[*] B[*] opcode[*]}]

# Output required time
set_output_delay 10.0 -clock virtual_clk [get_ports {result[*] carry zero}]

# Input transition assumptions
set_input_transition 0.1 [get_ports {A[*] B[*] opcode[*]}]

# Output load assumption
set_load 0.05 [get_ports {result[*] carry zero}]
