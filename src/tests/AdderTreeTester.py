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
    def __init__(self, target, opNum=12):
        self.opNum = opNum
        self.dut = target
        self.ref_outputs = Queue(maxsize=100)  # store reference results

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
        rand_values = []
        for i in range(self.opNum):
            rand_values.append(ff.PrimeField(random.randint(0, ff.P - 1)))

        return rand_valid, rand_values

    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            valid, operands = self.get_random_values()

            # assign random values to dut io port
            dut.io_input_valid.value = valid
            for i in range(self.opNum):
                exec(f"dut.io_input_payload_{i}.value = operands[{i}].value")

            await RisingEdge(dut.clk)
            if dut.io_input_valid.value == True:
                cases_count += 1
                result = ff.PrimeField(0)
                for i in range(self.opNum):
                    result.addassign(operands[i])
                self.ref_outputs.put([operands, result])

        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            await RisingEdge(dut.clk)
            if dut.io_output_valid.value == True:
                cases_count += 1
                ref_input, ref_res = self.ref_outputs.get()
                dut_res = int(dut.io_output_payload.value)

                if dut_res != ref_res.value:
                    print("INPUT:")
                    for i in range(self.opNum):
                        print(hex(ref_input[i].value))
                    print("REF:\n" + hex(ref_res.value))
                    print("DUT:\n" + hex(dut_res))
                    raise TestFailure(f"test case {cases_count} failed!!!")

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=300000, timeout_unit="ns")
async def ModularAdderFlowTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    tester = ModularAdderFlowTester(dut)
    dut.io_input_valid.value = False
    for i in range(tester.opNum):
        exec(f"dut.io_input_payload_{i}.value = 0")

    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)
