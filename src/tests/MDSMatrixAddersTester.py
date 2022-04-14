from math import ceil
from typing import List
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue

from poseidon_python import basic

from cocotb_test import simulator

from BasicElements import MDSContext

CASES_NUM = 1000  # the number of test cases


class MDSMatrixAddersTester:
    def __init__(self, target, isFull=None, size=None):
        self.dut = target
        self.id_width = 8  # the width of state_id used in MDSMatrixAdders
        self.ref_outputs = Queue(maxsize=100)  # store reference results
        self.isFull = isFull
        self.size = size

    def reference_model(self, context_vec: List[MDSContext]):
        context = context_vec[0]
        res = MDSContext(
            context.isFull,
            context.full_round,
            context.partial_round,
            context.state_size,
            context.state_id,
        )
        if context.isFull:
            for i in range(context.state_size):
                for j in range(MDSContext.elements_num):
                    res.state_elements[j].addassign(context_vec[i].state_elements[j])
        else:
            if context.state_size < 9:
                res.state_elements[0].value = context.state_elements[0].value
                for i in range(1, 2 * context.state_size - 1):
                    res.state_elements[i].value = context.state_elements[i].value
                for i in range(context.state_size, 2 * context.state_size - 1):
                    res.state_elements[0].addassign(context.state_elements[i])

            else:
                for i in range(MDSContext.elements_num):
                    res.state_elements[0].addassign(context_vec[1].state_elements[i])
                for i in range(1, MDSContext.elements_num):
                    res.state_elements[i].value = context.state_elements[i].value
        return res

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 1
        for i in range(3):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    async def drive_input_ports(self):
        """drive input ports"""
        dut = self.dut
        await RisingEdge(dut.clk)

        cases_count = 0
        while cases_count < CASES_NUM:
            # get random input
            context_vec = MDSContext.get_context_vec(
                isFull=self.isFull, size=self.size, id=cases_count
            )

            for element in context_vec:
                dut.io_input_valid.value = True  # random.random() > 0.3
                element.set_dut_ports(dut)

                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value) == False:
                    dut.io_input_valid.value = random.random() > 0.2
                    await RisingEdge(dut.clk)

            self.ref_outputs.put(self.reference_model(context_vec))

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


@cocotb.test(timeout_time=5000000, timeout_unit="ns")
async def MDSMatrixAddersTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    tester = MDSMatrixAddersTester(dut, size=3)

    # set default values to all dut input ports
    initial_context = MDSContext()
    initial_context.set_dut_ports(dut)

    # start testing
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)
