
# Compiler options
IVERILOG = iverilog

# Directories
MODULES_DIR = ../modules
BUILD_DIR = .

# Targets
test: 
	$(IVERILOG) -o $(BUILD_DIR)/DimmedTailLights.vvp -I$(MODULES_DIR) ./DimmedTailLights_tb.v ./DimmedTailLights.v \
	./PWM.v $(MODULES_DIR)/memory/PosEdgeFlipFlopAsyncReset.v

build:
	mkdir -p ./build
	vivado -mode batch -source generate_bitstream.tcl
clean:
	rm -rf ./build
	rm -f *.vvp 2> /dev/null
	rm -f *.vcd 2> /dev/null

.PHONY: test build

