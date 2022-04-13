import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess
from cocotb.triggers import RisingEdge
from queue import Empty, Queue

from cocotb_test import simulator
from poseidon_python import basic

CASES_NUM = 500


class PoseidonSerializerTester:
    def __init__(self, target):
        self.dut = target
        self.ref_outputs = Queue(maxsize=30)
        self.buffer_size = 12  # the size of buffer in serializer
        self.cases_count = 0

    async def reset_dut(self):
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(2):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    def get_random_input(self):
        round_index = random.randint(1, 65)
        state_size = random.randint(3, self.buffer_size)
        state_id = random.randint(0, 31)
        rand_vector = []
        for i in range(self.buffer_size):
            if i < state_size:
                rand_vector.append(random.randint(0, basic.P - 1))
            else:
                rand_vector.append(0)
        return round_index, state_size, state_id, rand_vector

    async def drive_input_ports(self):
        dut = self.dut
        """generate input signals"""
        while self.cases_count < CASES_NUM:
            round_index, state_size, state_id, state_elements = self.get_random_input()

            # assign random values to dut input port
            dut.io_parallelInput_valid.value = random.random() > 0.2
            dut.io_parallelInput_payload_round_index.value = round_index
            dut.io_parallelInput_payload_state_size.value = state_size
            dut.io_parallelInput_payload_state_id.value = state_id

            for i in range(self.buffer_size):
                exec(
                    "dut.io_parallelInput_payload_state_elements_{}.value = state_elements[{}]".format(
                        i, i
                    )
                )

            await RisingEdge(dut.clk)
            if (
                dut.io_parallelInput_valid.value & dut.io_parallelInput_ready.value
            ) == True:
                self.cases_count += 1
                for i in range(state_size):
                    self.ref_outputs.put(
                        [round_index, i, state_size, state_id, state_elements[i]]
                    )
                if state_size == 5:
                    self.ref_outputs.put([round_index, 5, state_size, state_id, 0])

        dut.io_parallelInput_valid.value = False

    async def check_output_ports(self):
        """check output signals"""
        dut = self.dut

        while True:
            dut.io_serialOutput_ready.value = random.random() > 0.2
            await RisingEdge(dut.clk)

            if (
                dut.io_serialOutput_ready.value & dut.io_serialOutput_valid.value
                == True
            ):
                rindex, sindex, size, id, element = self.ref_outputs.get()
                dut_rindex = int(dut.io_serialOutput_payload_round_index.value)
                dut_sindex = int(dut.io_serialOutput_payload_state_index.value)
                dut_size = int(dut.io_serialOutput_payload_state_size.value)
                dut_id = int(dut.io_serialOutput_payload_state_id.value)
                dut_element = int(dut.io_serialOutput_payload_state_element.value)
                assert (
                    dut_rindex == rindex
                ), "case num {}: round_index is wrong\nref:{}\ndut:{}".format(
                    self.cases_count, rindex, dut_rindex
                )

                assert (
                    dut_sindex == sindex
                ), "case num {}: state_index is wrong\nref:{}\ndut:{}".format(
                    self.cases_count, sindex, dut_rindex
                )

                assert (
                    dut_size == size
                ), "case num {}: state_size is wrong\nref:{}\ndut:{}".format(
                    self.cases_count, size, dut_size
                )

                assert (
                    dut_id == id
                ), "case num {}: state_id is wrong\nref:{}\ndut:{}".format(
                    self.cases_count, id, dut_id
                )

                assert (
                    dut_element == element
                ), "case num {}: state_element is wrong\nref:{}\ndut:{}".format(
                    self.cases_count, hex(element), hex(dut_element)
                )

            if (self.cases_count == CASES_NUM) & self.ref_outputs.empty():
                raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def PoseidonSerializerTest(dut):

    await cocotb.start(Clock(dut.clk, 10, "ns").start())
    tester = PoseidonSerializerTester(dut)

    # set default value to input ports of dut
    dut.io_parallelInput_valid.value = False
    dut.io_parallelInput_payload_round_index.value = 0
    dut.io_parallelInput_payload_state_size.value = 0
    dut.io_parallelInput_payload_state_id.value = 0
    dut.io_serialOutput_ready.value = False
    for i in range(tester.buffer_size):
        exec("dut.io_parallelInput_payload_state_elements_{}.value = 0".format(i))

    await tester.reset_dut()

    # start testing
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.check_output_ports())

    while True:
        await RisingEdge(dut.clk)


# pytest
def test_PoseidonSerializer():
    simulator.run(
        verilog_sources=["../main/verilog/PoseidonSerializer.v"],
        toplevel="PoseidonSerializer",
        module="PoseidonSerializerTester",
        python_search="./src/reference_model/",
    )
