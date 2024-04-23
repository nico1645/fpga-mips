
# Compiler options
IVERILOG = iverilog

# Directories
MODULES_DIR = ../modules
BUILD_DIR = .

# Targets
test: 
	$(IVERILOG) -o $(BUILD_DIR)/ALU.vvp -I$(MODULES_DIR) ./ALU_test.v ./bad_ALU.v ./ALU.v \
	$(MODULES_DIR)/adder/RippleCarryAdder.v $(MODULES_DIR)/adder/FullAdder.v
	vvp $(BUILD_DIR)/ALU.vvp
build:
clean:
	rm -rf ./build
	rm -f *.vvp 2> /dev/null
	rm -f *.vcd 2> /dev/null

.PHONY: test build clean

