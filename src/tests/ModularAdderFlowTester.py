import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess
from cocotb.result import TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from cocotb_test import simulator

CASES_NUM = 3000  # the number of test cases


class ModularAdderFlowTester:
    def __init__(self, target):
        self.dut = target
        self.ref_outputs = Queue(maxsize=50)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(3):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    def get_random_values(self):
        rand_valid = random.random() > 0.3
        rand_op1 = ff.PrimeField(random.randint(0, ff.P - 1))
        rand_op2 = ff.PrimeField(random.randint(0, ff.P - 1))
        return rand_valid, rand_op1, rand_op2

    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            valid, op1, op2 = self.get_random_values()

            # assign random values to dut io port
            dut.io_input_valid.value = valid
            dut.io_input_payload_op1.value = op1.value
            dut.io_input_payload_op2.value = op2.value

            await RisingEdge(dut.clk)
            if dut.io_input_valid.value == True:
                cases_count += 1
                self.ref_outputs.put(
                    [op1.value, op2.value, op1.ModAdd(op1.value, op2.value)]
                )

        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            await RisingEdge(dut.clk)
            if dut.io_output_valid.value == True:
                cases_count += 1
                op1, op2, ref_res = self.ref_outputs.get()
                dut_res = int(dut.io_output_payload_res.value)

                if dut_res != ref_res:
                    print("INPUT:")
                    print(hex(op1))
                    print(hex(op2))
                    print("REF:\n" + hex(ref_res))
                    print("DUT:\n" + hex(dut_res))
                    raise TestFailure(f"test case {cases_count} failed!!!")

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=300000, timeout_unit="ns")
async def ModularAdderFlowTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.io_input_valid.value = False
    dut.io_input_payload_op1.value = 0
    dut.io_input_payload_op2.value = 0

    tester = ModularAdderFlowTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)
