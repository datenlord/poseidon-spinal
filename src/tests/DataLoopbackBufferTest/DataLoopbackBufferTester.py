from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

ref_outputs = Queue(maxsize=80)  # store reference results
cases_num = 1000  # the number of test cases


async def reset_dut(dut):
    dut.reset.value = 0
    await RisingEdge(dut.clk)
    dut.reset.value = 1
    for i in range(2):
        await RisingEdge(dut.clk)

    dut.reset.value = 0


def get_random_input():
    size_range = [3, 5, 9, 12]
    rand_size = size_range[random.randint(0, 3)]
    rand_vec = []

    for i in range(12):
        if i < rand_size:
            rand_vec.append(random.randint(0, basic.p - 1))
        else:
            rand_vec.append(0)

    return rand_size, rand_vec


async def generate_input(dut):
    """generate input signals"""
    cases_count = 0
    while cases_count <= cases_num:
        # get random values
        state_size, state_elements = get_random_input()
        # assign random values to dut io port
        for i in range(ceil(state_size / 3) - 1):
            await RisingEdge(dut.clk)

        dut.io_input_valid.value = random.random() > 0.2
        dut.io_input_payload_state_size.value = state_size
        dut.io_input_payload_state_id.value = cases_count % pow(2, 4)
        for j in range(12):
            exec(
                "dut.io_input_payload_state_elements_{}.value = state_elements[{}]".format(
                    j, j
                )
            )

        await RisingEdge(dut.clk)
        # wait handshake
        while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
            dut.io_input_valid.value = random.random() > 0.2
            await RisingEdge(dut.clk)
        dut.io_input_valid.value = False

        if state_size == 5:
            ref_outputs.put([cases_count, state_size, 5, 0])

        for index in range(state_size - 1, -1, -1):
            ref_outputs.put([cases_count, state_size, index, state_elements[index]])
        cases_count += 1


async def check_output(dut):
    """check output signals"""
    cases_count = 0
    while True:
        # get random ready signals
        ready = True  # random.random() > 0.3
        dut.io_outputs_0_ready.value = ready
        dut.io_outputs_1_ready.value = ready
        dut.io_outputs_2_ready.value = ready
        await RisingEdge(dut.clk)

        if (dut.io_outputs_2_ready.value & dut.io_outputs_2_valid.value) == True:
            cases_count, size, index, element = ref_outputs.get()
            # print(cases_count,size,index)
            dut_size = int(dut.io_outputs_2_payload_state_size.value)
            dut_element = int(dut.io_outputs_2_payload_state_element.value)
            dut_index = int(dut.io_outputs_2_payload_state_index.value)
            if (dut_size != size) | (dut_element != element) | (dut_index != index):
                print("cases_num:{}".format(cases_count))
                print("reference output:")
                print(
                    "state_index:{} \nstate_size:{} \nstate_element:{}".format(
                        index, size, hex(element)
                    )
                )

                print("dut output:")
                print(
                    "state_index:{} \nstate_size:{} \nstate_element:{}".format(
                        dut_index, dut_size, hex(dut_element)
                    )
                )
                print(
                    "port1,state_id:{}".format(
                        int(dut.io_outputs_2_payload_state_id.value)
                    )
                )
                raise TestFailure("test case {} failed".format(cases_count))

        if (dut.io_outputs_1_ready.value & dut.io_outputs_1_valid.value) == True:
            cases_count, size, index, element = ref_outputs.get()
            dut_size = int(dut.io_outputs_1_payload_state_size.value)
            dut_element = int(dut.io_outputs_1_payload_state_element.value)
            dut_index = int(dut.io_outputs_1_payload_state_index.value)
            if (dut_size != size) | (dut_element != element) | (dut_index != index):
                print("cases_num:{}".format(cases_count))
                print("reference output:")
                print(
                    "state_index:{} \nstate_size:{} \nstate_element:{}".format(
                        index, size, hex(element)
                    )
                )

                print("dut output:")
                print(
                    "state_index:{} \nstate_size:{} \nstate_element:{}".format(
                        dut_index, dut_size, hex(dut_element)
                    )
                )
                print(
                    "state_id:{}".format(int(dut.io_outputs_1_payload_state_id.value))
                )
                raise TestFailure("test case {} failed".format(cases_count))

        if (dut.io_outputs_0_ready.value & dut.io_outputs_0_valid.value) == True:
            cases_count, size, index, element = ref_outputs.get()
            dut_size = int(dut.io_outputs_0_payload_state_size.value)
            dut_element = int(dut.io_outputs_0_payload_state_element.value)
            dut_index = int(dut.io_outputs_0_payload_state_index.value)
            if (dut_size != size) | (dut_element != element) | (dut_index != index):
                print("cases_num:{}".format(cases_count))
                print("reference output:".format(cases_count))
                print(
                    "state_index:{} \nstate_size:{} \nstate_element:{}".format(
                        index, size, hex(element)
                    )
                )

                print("dut output:".format(cases_count))
                print(
                    "state_index:{} \nstate_size:{} \nstate_element:{}".format(
                        dut_index, dut_size, hex(dut_element)
                    )
                )
                print(
                    "state_id:{}".format(int(dut.io_outputs_0_payload_state_id.value))
                )
                raise TestFailure("test case {} failed".format(cases_count))

        if (cases_count == cases_num) & ref_outputs.empty():
            raise TestSuccess(" pass {} test cases".format(cases_num))


@cocotb.test(timeout_time=200000, timeout_unit="ns")
async def DataLoopbackBufferTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    dut.io_input_valid.value = False
    dut.io_input_payload_round_index.value = 0
    dut.io_input_payload_state_size.value = 0
    dut.io_input_payload_state_id.value = 0

    for j in range(12):
        exec("dut.io_input_payload_state_elements_{}.value = 0".format(j))

    dut.io_outputs_0_ready.value = False
    dut.io_outputs_1_ready.value = False
    dut.io_outputs_2_ready.value = False

    # start testing
    await reset_dut(dut)
    await cocotb.start(generate_input(dut))
    await cocotb.start(check_output(dut))

    while True:
        await RisingEdge(dut.clk)
