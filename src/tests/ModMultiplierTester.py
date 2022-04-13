import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from cocotb_test import simulator

CASES_NUM = 3000  # the number of test cases


class ModMultiplierTester:
    def __init__(self, target):
        self.dut = target
        self.ref_outputs = Queue(maxsize=5)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.rst.value = 0
        await RisingEdge(dut.clk)
        dut.rst.value = 1
        for i in range(3):
            await RisingEdge(dut.clk)

        dut.rst.value = 0

    def get_random_values(self):
        rand_valid = random.random() > 0.3
        rand_op1 = ff.PrimeField(random.randint(0, ff.P - 1))
        rand_op2 = ff.PrimeField(random.randint(0, ff.P - 1))
        return rand_valid, rand_op1, rand_op2

    async def generate_input(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            valid, op1, op2 = self.get_random_values()

            # assign random values to dut io port
            dut.op_valid_i.value = valid
            dut.op1_i.value = op1.value
            dut.op2_i.value = op2.value

            await RisingEdge(dut.clk)
            if dut.op_valid_i.value & dut.op_ready_o.value:
                cases_count += 1
                self.ref_outputs.put(
                    [op1.value, op2.value, op1.MonPro(op1.value, op2.value)]
                )

        dut.op_valid_i.value = False

    async def check_output(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:

            ready = random.random() > 0.3
            dut.res_ready_i.value = ready
            await RisingEdge(dut.clk)
            if dut.res_ready_i.value & dut.res_valid_o.value == True:
                cases_count += 1
                op1, op2, ref_res = self.ref_outputs.get()
                dut_res = int(dut.res_o.value)

                assert (
                    dut_res == ref_res
                ), "the result of {} MonPro {} is wrong \n ref:{} \n dut:{}".format(
                    hex(op1), hex(op2), hex(ref_res), hex(dut_res)
                )

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=300000, timeout_unit="ns")
async def ModMultiplierTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.op_valid_i.value = False
    dut.op1_i.value = 0
    dut.op2_i.value = 0
    dut.res_ready_i.value = False

    tester = ModMultiplierTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.check_output())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_ModMultiplier():
    simulator.run(
        verilog_sources=["../main/verilog/ModMultiplier.v"],
        toplevel="ModMultiplier",
        module="ModMultiplierTester",
        python_search="./src/reference_model/",
    )
