# Makefile
# defaults
DUT ?= AXI4StreamReceiver
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

PWD = $(shell pwd)
export PYTHONPATH := $(PWD)/../reference_model:$(PYTHONPATH)
export PYTHONPATH := $(PWD)/../reference_model/poseidon_python:$(PYTHONPATH)

# add verilog sources
VERILOG_SOURCES += ../main/verilog/$(DUT).v

ifeq ($(DUT),MDSMatrixAdders)
	VERILOG_SOURCES += ../main/verilog/ModAdder.v
endif

ifeq ($(DUT), MDSMatrixMultiplier)
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
		VERILOG_SOURCES += ../main/verilog/ModMultiplier.v
endif

ifeq ($(DUT), MonMultiplierPiped)
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
endif

ifeq ($(DUT), PoseidonThread)
		VERILOG_SOURCES += ../main/verilog/ModAdder.v
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
		VERILOG_SOURCES += ../main/verilog/ModMultiplier.v
endif

ifeq ($(DUT), PoseidonToplevel)
		VERILOG_SOURCES += ../main/verilog/ModAdder.v
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
		VERILOG_SOURCES += ../main/verilog/ModMultiplier.v
endif

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = $(DUT)


# MODULE is the basename of the Python test file
MODULE = $(DUT)Tester


# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

# clean
clean::
	@rm -rf __pycache__
	@rm -rf sim_build
	@rm -rf results.xml
	@rm -rf dump.vcd