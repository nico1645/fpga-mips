
# Compiler options
IVERILOG = iverilog

# Directories
MODULES_DIR = ./
BUILD_DIR = ./

# Targets
test: 
	$(IVERILOG) -o RippleCarryAdder.vvp -I$(MODULES_DIR) ./RippleCarryAdder_tb.v ./RippleCarryAdder.v ./FullAdder.v

.PHONY: test

