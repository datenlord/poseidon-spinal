from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

from cocotb_test import simulator

CASES_NUM = 1  # the number of test cases
BUFFER_SIZE = 9  # the size of buffer in transmitter


class AXI4StreamTransmitter:
    def __init__(self, target) -> None:
        self.ref_outputs = Queue(maxsize=80)  # store reference results
        self.dut = target

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(2):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    async def generate_input(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            # get random values
            inputs = []
            for i in range(BUFFER_SIZE):
                rand_value = random.randint(0, basic.P - 1)
                inputs.append([cases_count % pow(2, 5), rand_value])
                self.ref_outputs.put(rand_value)
                cases_count += 1

            # assign random values to dut io port
            tag = []
            while len(tag) < BUFFER_SIZE:
                valid = random.random() > 0.2
                index = random.randint(0, 4)
                while index in tag:
                    index = random.randint(0, 4)
                dut.io_input_valid.value = valid
                dut.io_input_payload_state_id.value = inputs[index][0]
                dut.io_input_payload_state_element.value = inputs[index][1]
                await RisingEdge(dut.clk)
                if (dut.io_input_valid.value & dut.io_input_ready.value) == True:
                    tag.append(index)

    async def check_output(self):
        """check output signals"""
        cases_count = 0
        dut = self.dut
        while True:
            # get random ready signals
            ready = random.random() > 0.3
            dut.io_output_ready.value = ready
            await RisingEdge(dut.clk)
            if (dut.io_output_ready.value & dut.io_output_valid.value) == True:
                ref_res = self.ref_outputs.get()
                dut_res = int(dut.io_output_payload.value)
                assert ref_res == dut_res, "test case {} failed".format(cases_count)
                cases_count += 1

            if cases_count == CASES_NUM:
                raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=100000, timeout_unit="ns")
async def AXI4StreamTransmitterTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    dut.io_input_valid.value = False
    dut.io_input_payload_state_id.value = 0
    dut.io_input_payload_state_element.value = 0

    dut.io_output_ready.value = False

    # start testing
    tester = AXI4StreamTransmitter(dut)
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.check_output())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_AXI4StreamTransmitter():
    simulator.run(
        verilog_sources=["../main/verilog/AXI4StreamTransmitter.v"],
        toplevel="AXI4StreamTransmitter",
        module="AXI4StreamTransmitterTester",
        python_search="./src/reference_model/",
    )
