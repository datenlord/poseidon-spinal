import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff

CASES_NUM = 2000


class MDSMatrixMultiplierTester:
    def __init__(self, target):
        self.ref_outputs = Queue(maxsize=20)
        self.dut = target

    async def reset_dut(self):
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(2):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    def random_input(self):
        rand_valid = random.random() > 0.3
        rand_value = random.randint(0, ff.P - 1)
        t_range = [3, 5, 9, 12]
        rand_size = t_range[random.randint(0, 3)]
        rand_index = random.randint(0, rand_size - 1)
        return rand_valid, rand_value, rand_size, rand_index

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
        cases_count = 0
        while cases_count < CASES_NUM:
            valid, value, size, index = self.random_input()
            value_ff = ff.PrimeField(value)

            # assign dut io port
            self.dut.io_input_valid.value = valid
            self.dut.io_input_payload_state_index.value = index
            self.dut.io_input_payload_state_size.value = size
            self.dut.io_input_payload_state_element.value = value_ff.value
            await RisingEdge(self.dut.clk)

            if self.dut.io_input_valid.value & self.dut.io_input_ready.value == True:
                cases_count += 1
                # get reference output
                mds_input_ff = (
                    [ff.PrimeField(0)] * index
                    + [value_ff]
                    + [ff.PrimeField(0)] * (size - index - 1)
                )
                mds_output_ff = poseidon_ff.mds_mixing_ff(mds_input_ff)

                for i in range(size):
                    mds_output_ff[i] = mds_output_ff[i].value
                self.ref_outputs.put([value_ff.value, size, index, mds_output_ff])

        self.dut.io_input_valid.value = False

    async def output_check(self):
        """check output signals"""
        count_cases = 0

        while True:
            await RisingEdge(self.dut.clk)
            ready = random.random() > 0.5
            self.dut.io_output_ready.value = ready

            if self.dut.io_output_ready.value & (
                self.dut.io_output_valid.value == True
            ):
                count_cases += 1
                value, size, index, ref_res = self.ref_outputs.get()
                ref_res = ref_res + [0] * (12 - size)

                passed, dut_res = self.check_output_ports(ref_res)
                if not passed:
                    print(
                        "input: value:{} index:{} size:{}".format(
                            hex(value), index, size
                        )
                    )
                    print("ref output:")
                    for element in ref_res:
                        print(hex(element))
                    print("dut output:")
                    for element in dut_res:
                        print(hex(element))
                    raise TestFailure("test case {} failed: ".format(count_cases))

            if count_cases == CASES_NUM:
                raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def MDSMatrixMultiplierTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.io_input_valid.value = False
    dut.io_input_payload_state_index.value = 0
    dut.io_input_payload_state_size.value = 0
    dut.io_input_payload_state_element.value = 0
    dut.io_input_payload_round_index.value = 0
    dut.io_input_payload_state_id.value = 0
    dut.io_output_ready.value = False

    tester = MDSMatrixMultiplierTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.output_check())

    while True:
        await RisingEdge(dut.clk)
