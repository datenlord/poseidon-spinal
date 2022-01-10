import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess
from cocotb.triggers import RisingEdge
from queue import Queue

from poseidon_python import finite_field as ff

CASES_NUM = 4000


class SBox5Tester:
    def __init__(self, target):
        self.dut = target
        self.ref_outputs = Queue(maxsize=20)

    async def reset_dut(self):
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(2):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    def random_input(self):
        rand_valid = random.random() > 0.3
        rand_value = ff.PrimeField(random.randint(0, ff.P - 1))
        return rand_valid, rand_value

    async def generate_input(self):
        dut = self.dut
        """generate input signals"""
        cases_count = 0
        while cases_count < CASES_NUM:
            valid, state_element = self.random_input()

            # assign random values to dut input port
            dut.io_input_valid.value = valid
            dut.io_input_payload_state_element.value = state_element.value
            dut.io_input_payload_round_index.value = 0
            dut.io_input_payload_state_index.value = 0
            dut.io_input_payload_state_size.value = 0

            await RisingEdge(dut.clk)
            if (dut.io_input_valid.value & dut.io_input_ready.value) == True:
                cases_count += 1
                self.ref_outputs.put(
                    [state_element.value, state_element.ModExp(state_element.value, 5)]
                )

        dut.io_input_valid.value = False

    async def output_check(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0

        while cases_count < CASES_NUM:

            ready = random.random() > 0.3
            dut.io_output_ready.value = ready
            await RisingEdge(dut.clk)
            if dut.io_output_ready.value & dut.io_output_valid.value == True:
                cases_count += 1
                ref_input, ref_res = self.ref_outputs.get()
                dut_res = int(dut.io_output_payload_state_element.value)

                assert (
                    dut_res == ref_res
                ), "case num {}:the result of S-box({}) is wrong\nref:{}\ndut:{}".format(
                    cases_count, hex(ref_input), hex(ref_res), hex(dut_res)
                )

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def SBox5TestTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.io_input_valid.value = False
    dut.io_input_payload_state_element.value = 0
    dut.io_input_payload_round_index.value = 0
    dut.io_input_payload_state_index.value = 0
    dut.io_input_payload_state_size.value = 0
    dut.io_output_ready.value = 0

    tester = SBox5Tester(dut)
    await tester.reset_dut()

    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.output_check())

    while True:
        await RisingEdge(dut.clk)
