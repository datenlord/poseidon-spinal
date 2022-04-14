from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

from cocotb_test import simulator

from BasicElements import MDSContext

CASES_NUM = 2000  # the number of test cases


class MDSMatrixAddersTester:
    def __init__(self, target) -> None:
        self.dut = target
        self.id_width = 8  # the width of state_id used in MDSMatrixAdders
        self.ref_outputs = Queue(maxsize=30)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(2):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    async def drive_input_ports(self):
        """drive input ports"""
        dut = self.dut
        await RisingEdge(dut.clk)

        cases_count = 0
        while cases_count < CASES_NUM:
            # get random input
            context_vec = MDSContext.get_context_vec()

            for element in context_vec:
                dut.io_input_valid.value = random.random() > 0.3
                element.set_dut_ports(dut)

                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value) == False:
                    dut.io_input_valid.value = random.random() > 0.2
                    await RisingEdge(dut.clk)

            # calculate and push the reference outputs
            for i in range(1, len(context_vec)):
                for j in range(MDSContext.elements_num):
                    context_vec[0].state_elements[j].addassign(
                        context_vec[i].state_elements[j]
                    )

            self.ref_outputs.put(context_vec[0])

            cases_count += 1

        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0

        while cases_count < CASES_NUM:
            await RisingEdge(dut.clk)

            if (dut.io_output_valid.value) == True:
                # get reference output
                ref_context = self.ref_outputs.get()

                # get dut outputs
                dut_context = MDSContext()
                dut_context.get_dut_ports(dut)
                if not dut_context.check_context_equal(ref_context):
                    print("REF:")
                    ref_context.print_context_info()
                    print("DUT:")
                    dut_context.print_context_info()
                    raise TestFailure(f"test case {cases_count} failed: ")

                cases_count += 1

        raise TestSuccess(f" pass {CASES_NUM} test cases")


@cocotb.test(timeout_time=500000, timeout_unit="ns")
async def MDSMatrixAddersTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    tester = MDSMatrixAddersTester(dut)

    # set default values to all dut input ports
    initial_context = MDSContext()
    initial_context.set_dut_ports(dut)

    # start testing
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_MDSMatrixAdders():
    simulator.run(
        verilog_sources=[
            "../main/verilog/MDSMatrixAdders.v",
            "../main/verilog/ModAdder.v",
        ],
        toplevel="MDSMatrixAdders",
        module="MDSMatrixAddersTester",
        python_search="./src/reference_model/",
    )
