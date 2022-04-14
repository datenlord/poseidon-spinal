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

#PLUSARGS += -fst
ifeq ($(WAVES), 1)
	VERILOG_SOURCES += iverilog_dump.v
	COMPILE_ARGS += -s iverilog_dump
endif

ifeq ($(DUT),MDSMatrixAdders)
	VERILOG_SOURCES += ../main/verilog/ModAdder.v
endif

ifeq ($(DUT), MDSMatrixMultiplier)
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
		VERILOG_SOURCES += ../main/verilog/ModMultiplier.v
endif

ifeq ($(DUT), MontMultiplierPiped)
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
endif

ifeq ($(DUT), MontMultiplierPipedSim)
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
endif

ifeq ($(DUT), PoseidonThread)
		VERILOG_SOURCES += ../main/verilog/ModAdder.v
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
		VERILOG_SOURCES += ../main/verilog/ModMultiplier.v
endif

ifeq ($(DUT), PoseidonTopLevel)
		VERILOG_SOURCES += ../main/verilog/ModAdder.v
		VERILOG_SOURCES += ../main/verilog/MontMultiplierBasics.v
		VERILOG_SOURCES += ../main/verilog/ModMultiplier.v
endif

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = $(DUT)


# MODULE is the basename of the Python test file
MODULE = $(DUT)Tester
ifeq ($(DUT), MontMultiplierPipedSim2)
	MODULE = MontMultiplierPipedTester
endif

ifeq ($(DUT), MontMultiplierPipedSim)
	MODULE = MontMultiplierPipedTester
endif

ifeq ($(DUT), MontgomeryMultStream)
	MODULE = MontMultiplierPipedTester
endif


ifeq ($(DUT), MultiplierIPStream)
	MODULE = MultiplierStreamTester
endif

ifeq ($(DUT), MultiplierIPFlow)
	MODULE = MultiplierFlowTester
endif

ifeq ($(DUT), ModAdderPiped)
	MODULE = ModularAdderFlowTester
endif

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim


iverilog_dump.v:
	echo 'module iverilog_dump();' > $@
	echo 'initial begin' >> $@
	echo '    $$dumpfile("$(TOPLEVEL).vcd");' >> $@
	echo '    $$dumpvars(0, $(TOPLEVEL));' >> $@
	echo 'end' >> $@
	echo 'endmodule' >> $@

# clean
clean::
	@rm -rf __pycache__
	@rm -rf sim_build
	@rm -rf results.xml
	@rm -rf dump.vcd