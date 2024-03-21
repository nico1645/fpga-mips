# Set number of threads for synthesis
set_param synth.elaboration.threads 8

# Set number of threads for implementation
set_param impl.vivado.impl_1.STEPS.ROUTE_DESIGN.ARGS.DIRECTED_ROUTING_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.PLACE_DESIGN.ARGS.DIRECTED_PLACEMENT_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.OPT_DESIGN.ARGS.DIRECTED_OPTIMIZATION_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTED_PHYSICAL_OPTIMIZATION_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.ROUTE_DESIGN.ARGS.ROUTING_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.PLACE_DESIGN.ARGS.PLACEMENT_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.OPT_DESIGN.ARGS.OPTIMIZATION_MULTI_THREADED 1
set_param impl.vivado.impl_1.STEPS.PHYS_OPT_DESIGN.ARGS.PHYSICAL_OPTIMIZATION_MULTI_THREADED 1

# Create a new Vivado project
create_project basys3_tail_light ./build -part xc7a35tcpg236-1

# Add design source files
add_files {TopLevelModul.v}
add_files {TailLights.v}
add_files {../modules/memory/PosEdgeFlipFlopAsyncReset.v}
add_files {../modules/clk_div/ClkDiv.v}

# Add constraint files
add_files {TailLights_constraints.xdc}

# Set the top-level module
set_property top TailLights [get_files TopLevelModul.v]

# Run synthesis
synth_design -top TailLights 

# Implement design
impl_design

# Generate bitstream
write_bitstream -force ./build/TailLights.bit

# Exit Vivado
exit

