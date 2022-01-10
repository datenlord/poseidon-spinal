from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

CASES_NUM = 1000  # the number of test cases


class AXI4StreamReceiverTester:
    def __init__(self, target) -> None:
        self.dut = target
        self.ref_outputs = Queue(maxsize=80)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(2):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    def get_random_input(self):
        size_range = [3, 5, 9, 12]
        rand_size = size_range[random.randint(0, 3)]
        rand_vec = []

        for i in range(rand_size):
            rand_vec.append(random.randint(0, basic.P - 1))

        return rand_size, rand_vec

    async def generate_input(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count <= CASES_NUM:
            # get random values
            state_size, state_elements = self.get_random_input()
            # assign random values to dut io port
            for state_index in range(state_size):

                dut.io_input_valid.value = random.random() > 0.3
                dut.io_input_payload.value = state_elements[state_index]
                dut.io_input_last.value = state_index == (state_size - 1)
                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
                    dut.io_input_valid.value = random.random() > 0.3
                    await RisingEdge(dut.clk)

                dut.io_input_valid.value = False
                state_id = cases_count % pow(2, 5)
                self.ref_outputs.put(
                    [state_id, state_size, state_index, state_elements[state_index]]
                )
                if (state_index == (state_size - 1)) & (state_size == 5):
                    self.ref_outputs.put([state_id, state_size, 5, 0])

            cases_count += 1

    async def check_output(self):
        """check output signals"""
        cases_count = 0
        dut = self.dut

        while cases_count < CASES_NUM:
            # get random ready signals
            ready = random.random() > 0.4
            dut.io_outputs_0_ready.value = ready
            dut.io_outputs_1_ready.value = ready
            dut.io_outputs_2_ready.value = ready
            await RisingEdge(dut.clk)
            if (dut.io_outputs_0_ready.value & dut.io_outputs_0_valid.value) == True:
                id, size, index, element = self.ref_outputs.get()
                dut_id = int(dut.io_outputs_0_payload_state_id.value)
                dut_size = int(dut.io_outputs_0_payload_state_size.value)
                dut_index = int(dut.io_outputs_0_payload_state_index.value)
                dut_element = int(dut.io_outputs_0_payload_state_element.value)
                if cases_count % pow(2, 5) == id:
                    cases_count += 1
                if (
                    (dut_size != size)
                    | (dut_index != index)
                    | (dut_element != element)
                    | (dut_id != id)
                ):
                    print("reference output: \nstate_size:{}".format(size))
                    print(
                        "state_index:{} \nstate_element:{} \nstate_id:{}".format(
                            index, hex(element), id
                        )
                    )

                    print("dut output: \nstate_size:{}".format(dut_size))
                    print(
                        "state_index:{} \nstate_element:{} \nstate_id:{}".format(
                            dut_index, hex(dut_element), dut_id
                        )
                    )
                    raise TestFailure("test case {} failed".format(cases_count))

            if (dut.io_outputs_1_ready.value & dut.io_outputs_1_valid.value) == True:
                id, size, index, element = self.ref_outputs.get()
                dut_id = int(dut.io_outputs_1_payload_state_id.value)
                dut_size = int(dut.io_outputs_1_payload_state_size.value)
                dut_index = int(dut.io_outputs_1_payload_state_index.value)
                dut_element = int(dut.io_outputs_1_payload_state_element.value)
                if (
                    (dut_size != size)
                    | (dut_index != index)
                    | (dut_element != element)
                    | (dut_id != id)
                ):
                    print("reference output: \nstate_size:{}".format(size))
                    print(
                        "state_index:{} \nstate_element:{}".format(index, hex(element))
                    )

                    print("dut output: \nstate_size:{}".format(dut_size))
                    print(
                        "state_index:{} \nstate_element:{}".format(
                            dut_index, hex(dut_element)
                        )
                    )
                    raise TestFailure("test case {} failed".format(cases_count))

            if (dut.io_outputs_2_ready.value & dut.io_outputs_2_valid.value) == True:
                id, size, index, element = self.ref_outputs.get()

                dut_id = int(dut.io_outputs_2_payload_state_id.value)
                dut_size = int(dut.io_outputs_2_payload_state_size.value)
                dut_index = int(dut.io_outputs_2_payload_state_index.value)
                dut_element = int(dut.io_outputs_2_payload_state_element.value)

                if (
                    (dut_size != size)
                    | (dut_index != index)
                    | (dut_element != element)
                    | (dut_id != id)
                ):
                    print("reference output: \nstate_size:{}".format(size))
                    print(
                        "state_index:{} \nstate_element:{} \nstate_id:{}".format(
                            index, hex(element), id
                        )
                    )

                    print("dut output: \nstate_size:{}".format(dut_size))
                    print(
                        "state_index:{} \nstate_element:{} \nstate_id:{}".format(
                            dut_index, hex(dut_element), dut_id
                        )
                    )
                    raise TestFailure("test case {} failed".format(cases_count))

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=200000, timeout_unit="ns")
async def AXI4StreamReceiverTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    dut.io_input_valid.value = False
    dut.io_input_last.value = 0
    dut.io_input_payload.value = 0

    dut.io_outputs_0_ready.value = False
    dut.io_outputs_1_ready.value = False
    dut.io_outputs_2_ready.value = False

    # start testing
    tester = AXI4StreamReceiverTester(dut)
    await tester.reset_dut(dut)
    await cocotb.start(tester.generate_input(dut))
    await cocotb.start(tester.check_output(dut))

    while True:
        await RisingEdge(dut.clk)
