import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff, basic, constants
from cocotb_test import simulator

CASES_NUM = 50


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

    def ref_poseidon_thread(self, state_size, round_index, state_ff):
        """reference poseidon thread function"""
        roundf = basic.ROUNDFULL
        roundp = basic.ROUNDPARTIAL[state_size]

        round_constants_ff = poseidon_ff.transform_array(
            constants.generate_constants(state_size, roundf, roundp)
        )

        state_ff = poseidon_ff.add_round_constants_ff(
            state_ff,
            round_constants_ff[
                round_index * state_size : (round_index + 1) * state_size
            ],
        )

        if (round_index >= roundf / 2) & (round_index < (roundf / 2 + roundp)):
            state_ff[0] = poseidon_ff.s_box_ff(state_ff[0])
        else:
            state_ff = poseidon_ff.s_boxes_ff(state_ff)

        state_ff = poseidon_ff.mds_mixing_ff(state_ff)

        return state_ff

    def get_random_values(self):
        size_range = [3, 5, 9, 12]
        round_map = {3: 63, 5: 64, 9: 65, 12: 65}
        state_size = size_range[random.randint(0, 3)]
        round_index = random.randint(0, round_map[state_size] - 1)
        state_ff = []
        for i in range(state_size):
            state_ff.append(ff.PrimeField(random.randint(0, basic.P - 1)))
        return round_index, state_size, state_ff

    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            (
                round_index,
                state_size,
                state_elements,
            ) = self.get_random_values()

            # assign dut io port

            for i in range(state_size):
                dut.io_input_valid.value = True  # random.random() > 0.2
                dut.io_input_payload_round_index.value = round_index
                dut.io_input_payload_state_index.value = i
                dut.io_input_payload_state_size.value = state_size
                dut.io_input_payload_state_element.value = state_elements[i].value
                dut.io_input_payload_state_id.value = cases_count % pow(2, 6)
                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
                    dut.io_input_valid.value = True  # random.random() > 0.2
                    await RisingEdge(dut.clk)

            if state_size == 5:
                dut.io_input_valid.value = True
                dut.io_input_payload_state_element.value = 0
                dut.io_input_payload_state_index.value = 5
                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
                    await RisingEdge(dut.clk)

            cases_count += 1
            self.ref_inputs.put([round_index, state_size, state_elements])
            self.ref_outputs.put(
                self.ref_poseidon_thread(state_size, round_index, state_elements)
            )

        dut.io_input_valid.value = False

    async def check_output_ports(self):
        """check output signals"""
        count_cases = 0

        while count_cases < CASES_NUM:
            self.dut.io_output_ready.value = True  # random.random() > 0.4
            await RisingEdge(self.dut.clk)
            if (
                self.dut.io_output_ready.value & self.dut.io_output_valid.value
            ) == True:
                (
                    round_index,
                    state_size,
                    state_elements,
                ) = self.ref_inputs.get()
                ref_res = self.ref_outputs.get()
                dut_res = []
                for i in range(12):
                    exec(
                        f"dut_res.append(int(self.dut.io_output_payload_state_elements_{i}.value))"
                    )

                for i in range(state_size):
                    if ref_res[i].value != dut_res[i]:
                        # print error info
                        print("test case {} failed".format(count_cases))
                        print("input:", round_index, state_size)
                        for element in state_elements:
                            print(hex(element.value))

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

    # set default values to dut input ports
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
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.check_output_ports())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_PoseidonThread():
    simulator.run(
        verilog_sources=[
            "../main/verilog/PoseidonThread.v",
            "../main/verilog/MontMultiplierBasics.v",
            "../main/verilog/ModAdder.v",
        ],
        toplevel="PoseidonThread",
        module="PoseidonThreadTester",
        python_search="./src/reference_model/",
    )
