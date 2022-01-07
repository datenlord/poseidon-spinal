from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

ref_outputs = Queue(maxsize=20)  # store reference results
cases_num = 2000  # the number of test cases


async def reset_dut(dut):
    dut.reset.value = 0
    await RisingEdge(dut.clk)
    dut.reset.value = 1
    for i in range(2):
        await RisingEdge(dut.clk)

    dut.reset.value = 0


def get_random_input():
    rand_valid = random.random() > 0.3
    size_range = [3, 5, 9, 12]
    rand_size = size_range[random.randint(0, 3)]
    rand_matrix = []

    for i in range(rand_size):
        rand_vec = []
        for j in range(12):
            if j < rand_size:
                rand_vec.append(random.randint(0, basic.p - 1))
            else:
                rand_vec.append(0)
        rand_matrix.append(rand_vec)

    if rand_size == 5:
        rand_matrix.append(12 * [0])
    return rand_valid, rand_size, rand_matrix


def set_input_ports(dut, values0, values1, values2):
    for i in range(3):
        for j in range(12):
            exec(f"dut.io_inputs_{i}_payload_state_elements_{j}.value = values{i}[{j}]")


def check_output_ports(dut, ref_res):
    dut_res = []

    for i in range(12):
        exec(f"dut_res.append(dut.io_output_payload_state_elements_{i}.value.integer)")

    for i in range(12):
        if dut_res[i] != ref_res[i]:
            return False, dut_res
    return True, dut_res


async def generate_input(dut):
    """generate input signals"""
    cases_count = 0
    while cases_count < cases_num:
        # get random values
        valid, size, matrix = get_random_input()
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
                set_input_ports(
                    dut, matrix[i * 3 + 0], matrix[i * 3 + 1], matrix[i * 3 + 2]
                )
                await RisingEdge(dut.clk)
                while dut.io_inputs_0_valid.value & ~(dut.io_inputs_0_ready.value):
                    await RisingEdge(dut.clk)

            # calculate the reference outputs
            ref_res = [0] * 12
            for i in range(size):
                for j in range(12):
                    ref_res[j] = basic.add(ref_res[j], matrix[i][j])

            ref_outputs.put([size, ref_res])


async def output_check(dut):
    """check output signals"""
    cases_count = 0

    while cases_count < cases_num:
        await RisingEdge(dut.clk)
        # get random ready signals
        ready = random.random() > 0.4
        dut.io_output_ready.value = ready

        if (dut.io_output_ready.value & dut.io_output_valid.value) == True:

            cases_count += 1
            size, ref_res = ref_outputs.get()

            passed, dut_res = check_output_ports(dut, ref_res)
            if not passed:
                print(f"failed info: case_num:{cases_count} input size:{size}")
                print("ref output:")
                for element in ref_res:
                    print(hex(element))
                print("dut output:")
                for element in dut_res:
                    print(hex(element))
                raise TestFailure(f"test case {cases_count} failed: ")

    raise TestSuccess(f" pass {cases_num} test cases")


@cocotb.test(timeout_time=100000, timeout_unit="ns")
async def MDSMatrixAddersTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    set_input_ports(dut, [0] * 12, [0] * 12, [0] * 12)
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
    await reset_dut(dut)
    await cocotb.start(generate_input(dut))
    await cocotb.start(output_check(dut))

    while True:
        await RisingEdge(dut.clk)
