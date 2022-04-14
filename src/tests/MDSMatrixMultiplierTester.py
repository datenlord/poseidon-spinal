import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff

from cocotb_test import simulator

from BasicElements import Context, MDSContext

CASES_NUM = 100


class MDSMatrixMultiplierTester:
    def __init__(self, target):
        self.ref_outputs = Queue(maxsize=100)
        self.ref_inputs = Queue(maxsize=100)
        self.dut = target

    async def reset_dut(self):
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(2):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    async def drive_input_ports(self):
        """generate input signals"""
        cases_count = 0
        while cases_count < CASES_NUM:
            # get random dut inputs
            context = Context()
            context.set_rand_values(cases_count)

            # assign dut io port
            self.dut.io_input_valid.value = random.random() > 0.2
            context.set_dut_ports(self.dut)
            await RisingEdge(self.dut.clk)

            if self.dut.io_input_valid.value == True:
                cases_count += 1
                # get reference output
                mds_input_ff = (
                    [ff.PrimeField(0)] * context.state_index
                    + [context.state_element]
                    + [ff.PrimeField(0)]
                    * (context.state_size - context.state_index - 1)
                )
                mds_output_ff = poseidon_ff.mds_mixing_ff(mds_input_ff)

                ref_output = MDSContext(
                    context.round_index, context.state_size, context.state_id
                )
                ref_output.copy_state_elements(mds_output_ff)

                self.ref_outputs.put(ref_output)
                self.ref_inputs.put(context)

        self.dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        count_cases = 0

        while count_cases < CASES_NUM:
            await RisingEdge(self.dut.clk)

            if self.dut.io_output_valid.value == True:
                count_cases += 1
                ref_output = self.ref_outputs.get()
                ref_input = self.ref_inputs.get()
                dut_output = MDSContext()
                dut_output.get_dut_ports(self.dut)

                if not dut_output.check_context_equal(ref_output):
                    print("INPUT: ")
                    ref_input.print_context_info()
                    print("REF:")
                    ref_output.print_context_info()
                    print("DUT:")
                    dut_output.print_context_info()
                    raise TestFailure("test case {} failed: ".format(count_cases))

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def MDSMatrixMultiplierTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.io_input_valid.value = False
    initial_input = Context()
    initial_input.set_dut_ports(dut)

    tester = MDSMatrixMultiplierTester(dut)

    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_MDSMatrixMultiplier():
    simulator.run(
        verilog_sources=[
            "../main/verilog/MDSMatrixMultiplier.v",
            "../main/verilog/MontMultiplierBasics.v",
        ],
        toplevel="MDSMatrixMultiplier",
        module="MDSMatrixMultiplierTester",
        python_search="./src/reference_model/",
    )
