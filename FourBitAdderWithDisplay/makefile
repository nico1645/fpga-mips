
# Compiler options
IVERILOG = iverilog

# Directories
MODULES_DIR = ../modules
BUILD_DIR = .

# Targets
test: 
	$(IVERILOG) -o $(BUILD_DIR)/FourBitAdder.vvp -I$(MODULES_DIR) ./FourBitAdder_tb.v ./FourBitAdder.v \
	$(MODULES_DIR)/adder/RippleCarryAdder.v $(MODULES_DIR)/adder/FullAdder.v \
	$(MODULES_DIR)/decoder/Decoder_2_4.v $(MODULES_DIR)/display/OneDigitDisplay.v
build:
	mkdir -p ./build
	vivado -mode batch -source generate_bitstream.tcl
clean:
	rm -rf ./build
	rm -f *.vvp 2> /dev/null
	rm -f *.vcd 2> /dev/null

.PHONY: test build clean

