# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

PWD = $(shell pwd)
export PYTHONPATH := $(PWD)/../../reference_model:$(PYTHONPATH)
export PYTHONPATH := $(PWD)/../../reference_model/poseidon_python:$(PYTHONPATH)

VERILOG_SOURCES += ../../main/verilog/AXI4StreamReceiver.v

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = AXI4StreamReceiver


# MODULE is the basename of the Python test file
MODULE = AXI4StreamReceiverTester


# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim