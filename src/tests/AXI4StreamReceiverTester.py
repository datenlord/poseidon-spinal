from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

from cocotb_test import simulator

CASES_NUM = 1000  # the number of test cases


class AXI4StreamReceiverTester:
    def __init__(self, target) -> None:
        self.dut = target
        self.ref_outputs = Queue(maxsize=80)  # store reference results
        self.cases_count = 0

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

        for i in range(12):
            if i < rand_size:
                rand_vec.append(random.randint(0, basic.P - 1))
            else:
                rand_vec.append(0)
        return rand_size, rand_vec

    def check_state_elements(self, ref_res):
        dut = self.dut
        dut_res = []
        for i in range(12):
            exec(
                f"dut_res.append(dut.io_output_payload_state_elements_{i}.value.integer)"
            )
        for i in range(12):
            if dut_res[i] != ref_res[i]:
                return False, dut_res

        return True, dut_res

    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        while self.cases_count < CASES_NUM:
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

            state_id = self.cases_count % pow(2, 5)
            self.ref_outputs.put([state_id, state_size, state_elements])

            self.cases_count += 1

    async def check_output_ports(self):
        """check output signals"""
        dut = self.dut

        while True:
            # get random ready signals
            dut.io_output_ready.value = random.random() > 0.3
            await RisingEdge(dut.clk)
            if (dut.io_output_ready.value & dut.io_output_valid.value) == True:
                id, size, elements = self.ref_outputs.get()
                dut_id = int(dut.io_output_payload_state_id.value)
                dut_size = int(dut.io_output_payload_state_size.value)

                elements_equal, dut_elements = self.check_state_elements(elements)
                if (dut_size != size) | (not elements_equal) | (dut_id != id):
                    print(
                        "reference output: \nstate_size:{}\nstate_id:{}".format(
                            size, id
                        )
                    )
                    print("state_elements:")
                    for i in range(12):
                        print(hex(elements[i]))

                    print(
                        "dut output: \nstate_size:{}\nstate_id:{}".format(
                            dut_size, dut_id
                        )
                    )
                    print("state_elements:")
                    for i in range(12):
                        print(hex(dut_elements[i]))

                    raise TestFailure("test case {} failed".format(self.cases_count))

            if (self.cases_count == CASES_NUM) & self.ref_outputs.empty():
                raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=200000, timeout_unit="ns")
async def AXI4StreamReceiverTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    dut.io_input_valid.value = False
    dut.io_input_last.value = False
    dut.io_input_payload.value = 0
    dut.io_output_ready.value = False

    # start testing
    tester = AXI4StreamReceiverTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.check_output_ports())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_AXI4StreamReceiver():
    simulator.run(
        verilog_sources=["../main/verilog/AXI4StreamReceiver.v"],
        toplevel="AXI4StreamReceiver",
        module="AXI4StreamReceiverTester",
        python_search="./src/reference_model/",
    )
