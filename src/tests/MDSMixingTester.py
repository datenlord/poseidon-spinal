import cocotb
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge

import random
from queue import Queue

from poseidon_python import basic
from BasicElements import Context, MDSContext
from poseidon_python import poseidon_ff

CASES_NUM = 60  # the number of test cases


class MDSMixingTester:
    def __init__(self, target, size) -> None:
        self.dut = target
        self.ref_outputs = Queue(maxsize=100)  # store reference results
        self.state_size = size

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(3):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    async def drive_input_ports(self):
        """drive input ports"""
        dut = self.dut

        cases_count = 0
        while cases_count < CASES_NUM:
            # get random input
            context_vec = Context.get_context_vec(cases_count,self.state_size)

            for element in context_vec:
                dut.io_input_valid.value = True
                element.set_dut_ports(dut)

                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
                    await RisingEdge(dut.clk)

            # calculate and push the reference outputs
            mds_input_ff = []
            for context in context_vec:
                mds_input_ff.append(context.state_element)
            
            mds_output_ff = poseidon_ff.mds_mixing_ff(mds_input_ff)
            ref_output = MDSContext(
                context_vec[0].round_index, 
                context_vec[0].state_size, 
                context_vec[0].state_id
            )
            ref_output.copy_state_elements(mds_output_ff)
            self.ref_outputs.put(ref_output)

            cases_count += 1

        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0

        while cases_count < CASES_NUM:
            dut.io_output_ready.value = True
            await RisingEdge(dut.clk)
            if (dut.io_output_valid.value & dut.io_output_ready.value) == True:
                # get reference output
                ref_output = self.ref_outputs.get()

                # get dut outputs
                dut_output = MDSContext()
                dut_output.get_dut_ports(dut)
                if not dut_output.check_context_equal(ref_output):
                    print(f"Test Case {cases_count}:")
                    print("REF:")
                    ref_output.print_context_info()
                    print("DUT:")
                    dut_output.print_context_info()
                    raise TestFailure(f"test case {cases_count} failed: ")

                cases_count += 1

        raise TestSuccess(f" pass {CASES_NUM} test cases")


@cocotb.test(timeout_time=500000, timeout_unit="ns")
async def MDSMatrixAddersTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    tester = MDSMixingTester(dut, 12)

    # set default values to all dut input ports
    initial_context = Context()
    initial_context.set_dut_ports(dut)
    dut.io_input_valid.value = False
    dut.io_output_ready.value = False

    # start testing
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)

