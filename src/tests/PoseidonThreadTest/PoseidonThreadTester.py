import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff, basic, constants

CASES_NUM = 100


class PoseidonThreadTester:
    def __init__(self, target):
        self.dut = target
        self.ref_inputs = Queue(maxsize=80)
        self.ref_outputs = Queue(maxsize=80)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(2):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    def ref_poseidon_thread(self, round_index, state_index, state_size, state_element):
        """reference poseidon thread function"""
        roundf = basic.ROUNDFULL
        roundp = basic.ROUNDPARTIAL[state_size]

        round_constants_ff = poseidon_ff.transform_array(
            constants.generate_constants(state_size, roundf, roundp)
        )
        state_element.addassign(
            round_constants_ff[round_index * state_size + state_index]
        )
        if not (
            (round_index >= roundf / 2)
            & (round_index < (roundf / 2 + roundp))
            & (state_index != 0)
        ):
            state_element = poseidon_ff.s_box_ff(state_element)

        mds_input_ff = (
            [ff.PrimeField(0)] * state_index
            + [state_element]
            + [ff.PrimeField(0)] * (state_size - state_index - 1)
        )
        mds_output_ff = poseidon_ff.mds_mixing_ff(mds_input_ff)
        mds_output_ff += [ff.PrimeField(0)] * (12 - state_size)

        return mds_output_ff

    def get_random_values(self):
        size_range = [3, 5, 9, 12]
        round_range = {3: 63, 5: 64, 9: 65, 12: 65}
        state_size = size_range[random.randint(0, 3)]
        state_index = random.randint(0, state_size - 1)
        round_index = random.randint(0, round_range[state_size] - 1)
        state_element = ff.PrimeField(random.randint(0, basic.P - 1))
        return round_index, state_index, state_size, state_element

    async def generate_input(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            (
                round_index,
                state_index,
                state_size,
                state_element,
            ) = self.get_random_values()

            # assign dut io port
            dut.io_input_valid.value = random.random() > 0.2
            dut.io_input_payload_round_index.value = round_index
            dut.io_input_payload_state_index.value = state_index
            dut.io_input_payload_state_size.value = state_size
            dut.io_input_payload_state_element.value = state_element.value
            dut.io_input_payload_state_id.value = cases_count % pow(2, 6)
            await RisingEdge(dut.clk)

            if (dut.io_input_valid.value & dut.io_input_ready.value) == True:
                cases_count += 1
                self.ref_inputs.put(
                    [round_index, state_index, state_size, state_element.value]
                )
                self.ref_outputs.put(
                    self.ref_poseidon_thread(
                        round_index, state_index, state_size, state_element
                    )
                )

        dut.io_input_valid.value = False

    async def check_output(self):
        """check output signals"""
        count_cases = 0

        while count_cases < CASES_NUM:
            self.dut.io_output_ready.value = random.random() > 0.4
            await RisingEdge(self.dut.clk)
            if (
                self.dut.io_output_ready.value & self.dut.io_output_valid.value
            ) == True:
                (
                    round_index,
                    state_index,
                    state_size,
                    state_element,
                ) = self.ref_inputs.get()
                ref_res = self.ref_outputs.get()
                dut_res = []
                for i in range(12):
                    exec(
                        f"dut_res.append(int(self.dut.io_output_payload_state_elements_{i}.value))"
                    )

                for i in range(12):
                    if ref_res[i].value != dut_res[i]:
                        print("test case {} failed".format(count_cases))
                        print(
                            "input:",
                            round_index,
                            state_index,
                            state_size,
                            state_element,
                        )
                        print("ref res:")
                        for element in ref_res:
                            print(hex(element.value))
                        print("dut res:")
                        print(
                            "state_id:{}".format(
                                int(self.dut.io_output_payload_state_id.value)
                            )
                        )
                        for element in dut_res:
                            print(hex(element))
                        raise TestFailure("test cases {} failed".format(count_cases))
                count_cases += 1

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def PoseidonThreadTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to dut ports
    dut.io_input_valid.value = False
    dut.io_input_payload_round_index.value = 0
    dut.io_input_payload_state_index.value = 0
    dut.io_input_payload_state_size.value = 0
    dut.io_input_payload_state_id.value = 0
    dut.io_input_payload_state_element.value = 0

    dut.io_output_ready.value = False

    # start testing
    tester = PoseidonThreadTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.check_output())

    while True:
        await RisingEdge(dut.clk)
