# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

PWD = $(shell pwd)
export PYTHONPATH := $(PWD)/../../reference_model:$(PYTHONPATH)

VERILOG_SOURCES += ../../main/verilog/PoseidonSerializer.v


# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = PoseidonSerializer

# MODULE is the basename of the Python test file
MODULE = PoseidonSerializerTester

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

