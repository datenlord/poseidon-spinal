# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

PWD = $(shell pwd)
export PYTHONPATH := $(PWD)/../../reference_model:$(PYTHONPATH)

VERILOG_SOURCES += ../../main/verilog/ModMultiplier.v
VERILOG_SOURCES += ../../main/verilog/SBox5.v


# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = SBox5

# MODULE is the basename of the Python test file
MODULE = SBox5Tester

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim