from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

CASES_NUM = 2000  # the number of test cases


class MDSMatrixAddersTester:
    def __init__(self, target) -> None:
        self.dut = target
        self.ref_outputs = Queue(maxsize=20)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(2):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    def get_random_input(self):
        rand_valid = random.random() > 0.3
        size_range = [3, 5, 9, 12]
        rand_size = size_range[random.randint(0, 3)]
        rand_matrix = []

        for i in range(rand_size):
            rand_vec = []
            for j in range(12):
                if j < rand_size:
                    rand_vec.append(random.randint(0, basic.P - 1))
                else:
                    rand_vec.append(0)
            rand_matrix.append(rand_vec)

        if rand_size == 5:
            rand_matrix.append(12 * [0])
        return rand_valid, rand_size, rand_matrix

    def set_input_ports(self, values0, values1, values2):
        for i in range(3):
            for j in range(12):
                exec(
                    f"self.dut.io_inputs_{i}_payload_state_elements_{j}.value = values{i}[{j}]"
                )

    def check_output_ports(self, ref_res):
        dut_res = []

        for i in range(12):
            exec(
                f"dut_res.append(self.dut.io_output_payload_state_elements_{i}.value.integer)"
            )

        for i in range(12):
            if dut_res[i] != ref_res[i]:
                return False, dut_res
        return True, dut_res

    async def generate_input(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            # get random values
            valid, size, matrix = self.get_random_input()
            # assign random values to dut input ports
            dut.io_inputs_0_valid.value = valid
            dut.io_inputs_1_valid.value = valid
            dut.io_inputs_2_valid.value = valid
            dut.io_inputs_0_payload_state_size.value = size
            dut.io_inputs_1_payload_state_size.value = size
            dut.io_inputs_2_payload_state_size.value = size

            if valid == False:
                await RisingEdge(dut.clk)

            if valid == True:
                cases_count += 1
                for i in range(ceil(size / 3)):
                    self.set_input_ports(
                        matrix[i * 3 + 0], matrix[i * 3 + 1], matrix[i * 3 + 2]
                    )
                    await RisingEdge(dut.clk)
                    while dut.io_inputs_0_valid.value & (
                        dut.io_inputs_0_ready.value == False
                    ):
                        await RisingEdge(dut.clk)

                # calculate the reference outputs
                ref_res = [0] * 12
                for i in range(size):
                    for j in range(12):
                        ref_res[j] = basic.PrimeFieldOps.add(ref_res[j], matrix[i][j])

                self.ref_outputs.put([size, ref_res])

    async def output_check(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0

        while cases_count < CASES_NUM:
            await RisingEdge(dut.clk)
            # get random ready signals
            ready = random.random() > 0.4
            dut.io_output_ready.value = ready

            if (dut.io_output_ready.value & dut.io_output_valid.value) == True:

                cases_count += 1
                size, ref_res = self.ref_outputs.get()

                passed, dut_res = self.check_output_ports(ref_res)
                if not passed:
                    print(f"failed info: case_num:{cases_count} input size:{size}")
                    print("ref output:")
                    for element in ref_res:
                        print(hex(element))
                    print("dut output:")
                    for element in dut_res:
                        print(hex(element))
                    raise TestFailure(f"test case {cases_count} failed: ")

        raise TestSuccess(f" pass {CASES_NUM} test cases")


@cocotb.test(timeout_time=100000, timeout_unit="ns")
async def MDSMatrixAddersTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    tester = MDSMatrixAddersTester(dut)
    tester.set_input_ports([0] * 12, [0] * 12, [0] * 12)

    dut.io_inputs_0_valid.value = False
    dut.io_inputs_0_payload_state_id.value = 0
    dut.io_inputs_0_payload_round_index.value = 0

    dut.io_inputs_1_valid.value = False
    dut.io_inputs_1_payload_state_id.value = 0
    dut.io_inputs_1_payload_round_index.value = 0

    dut.io_inputs_2_valid.value = False
    dut.io_inputs_2_payload_state_id.value = 0
    dut.io_inputs_2_payload_round_index.value = 0

    dut.io_output_ready.value = False

    # start testing
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.output_check())

    while True:
        await RisingEdge(dut.clk)
