
# Compiler options
IVERILOG = iverilog

# Directories
MODULES_DIR = ../modules
BUILD_DIR = .

# Targets
test: 
	$(IVERILOG) -o $(BUILD_DIR)/TailLights.vvp -I$(MODULES_DIR) ./TailLights_tb.v ./TailLights.v \
	$(MODULES_DIR)/memory/PosEdgeFlipFlopAsyncReset.v

.PHONY: test

