import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Empty, Queue

from cocotb_test import simulator
from poseidon_python import basic

from BasicElements import MDSContext, Context


class PoseidonSerializerTester:
    def __init__(self, target, cases_num, size, isFull=None):
        self.dut = target
        self.ref_outputs = Queue(maxsize=50)
        self.input_cases = cases_num
        if isFull:
            self.output_cases = cases_num * size
        else:
            if size < 9:
                self.output_cases = cases_num
            else:
                self.output_cases = cases_num * 2
        self.isFull = isFull
        self.size = size

    def reference_model(self, context: MDSContext):
        context_vec = []
        isFull = context.isFull
        size = context.state_size
        roundf = context.full_round
        roundp = context.partial_round
        id = context.state_id
        if isFull:
            for i in range(size):
                context_vec.append(Context(isFull, roundf, roundp, i, size, id))
                context_vec[i].state_element.value = context.state_elements[i].value
        else:
            context_vec.append(Context(isFull, roundf, roundp, 0, size, id))
            context_vec[0].state_element.value = context.state_elements[0].value
            for i in range(size - 1):
                context_vec[0].state_elements[i].value = context.state_elements[
                    i + 1
                ].value
            if size >= 9:
                context_vec.append(Context(isFull, roundf, roundp, 1, size, id))
                context_vec[1].copy_state_elements(context_vec[0])

        return context_vec

    async def reset_dut(self):
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(2):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    async def drive_input_ports(self):
        dut = self.dut
        """generate input signals"""
        cases_count = 0
        while cases_count < self.input_cases:
            dut_input = MDSContext()
            dut_input.rand_mds_context(
                isFull=self.isFull, size=self.size, id=cases_count
            )

            # assign random values to dut input port
            dut.io_input_valid.value = True  # random.random() > 0.2
            dut_input.set_dut_ports(dut)

            await RisingEdge(dut.clk)
            if (dut.io_input_valid.value & dut.io_input_ready.value) == True:
                cases_count += 1
                ref_outputs = self.reference_model(dut_input)
                for element in ref_outputs:
                    self.ref_outputs.put(element)

        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < self.output_cases:
            dut.io_output_ready.value = True  # random.random() > 0.2
            await RisingEdge(dut.clk)

            if (dut.io_output_ready.value & dut.io_output_valid.value) == True:
                ref_output = self.ref_outputs.get()
                dut_output = Context()
                dut_output.get_dut_ports(dut)

                if not dut_output.check_context_equal(ref_output):
                    print("REF: ")
                    ref_output.print_context_info()
                    print("DUT: ")
                    dut_output.print_context_info()
                    raise TestFailure(f"test case {cases_count} failed!!!")
                cases_count = cases_count + 1

        raise TestSuccess(" pass {} test cases".format(self.input_cases))


@cocotb.test(timeout_time=500000, timeout_unit="ns")
async def PoseidonSerializerTest(dut):

    await cocotb.start(Clock(dut.clk, 10, "ns").start())
    tester = PoseidonSerializerTester(dut, 500, 12, isFull=True)

    # set default value to input ports of dut
    dut.io_input_valid.value = False
    dut.io_output_ready.value = False
    init_context = MDSContext()
    init_context.set_dut_ports(dut)

    await tester.reset_dut()
    # start testing
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)
