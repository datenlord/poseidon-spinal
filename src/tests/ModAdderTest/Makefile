# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

PWD = $(shell pwd)
export PYTHONPATH := $(PWD)/../../reference_model:$(PYTHONPATH)

VERILOG_SOURCES += ../../main/verilog/ModAdder.v
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = ModAdder

# MODULE is the basename of the Python test file
MODULE = ModAdderTester

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim