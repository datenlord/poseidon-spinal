import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import ff, poseidon_ff, basic, constants


ref_inputs = Queue(maxsize=80)
ref_outputs = Queue(maxsize=80)  # store reference results
cases_num = 100


async def reset_dut(dut):
    """reset the dut"""
    dut.reset.value = 0
    await RisingEdge(dut.clk)
    dut.reset.value = 1
    for i in range(2):
        await RisingEdge(dut.clk)

    dut.reset.value = 0


def get_random_values(cases_count):
    """get random input values"""
    size_range = [3, 5, 9, 12]
    # state_size  = size_range[random.randint(0,3)]
    state_size = size_range[int(cases_count / 25)]
    state_elements = []
    for i in range(state_size):
        state_elements.append(ff.PrimeField(random.randint(0, basic.p - 1)))
    return state_elements


async def generate_input(dut):
    """generate input signals"""
    cases_count = 0
    while cases_count < cases_num:
        state_elements = get_random_values(cases_count)

        # assign random valuess to dut io port
        for i in range(len(state_elements)):
            dut.io_input_valid.value = True  # (random.random()>0.2)
            dut.io_input_payload.value = state_elements[i].value
            dut.io_input_last.value = i == (len(state_elements) - 1)

            await RisingEdge(dut.clk)

            while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
                dut.io_input_valid.value = True  # (random.random()>0.2)
                await RisingEdge(dut.clk)
        print("input case {}".format(cases_count))
        cases_count += 1
        ref_inputs.put(state_elements)
        ref_outputs.put(poseidon_ff.poseidon_hash_ff(state_elements))

    dut.io_input_valid.value = False


async def check_output(dut):
    """compare output signals to reference model"""
    count_cases = 0

    while count_cases < cases_num:
        dut.io_output_ready.value = True  # (random.random() > 0.3)
        await RisingEdge(dut.clk)

        if (dut.io_output_ready.value & dut.io_output_valid.value) == True:
            dut_res = int(dut.io_output_payload.value)
            ref_input = ref_inputs.get()
            ref_output = ref_outputs.get()

            if dut_res != ref_output.value:
                # print error info
                print("test case {} failed: ".format(count_cases))
                print("ref input:\n")
                print("lenght of preimage:{}".format(len(ref_input)))
                for element in ref_input:
                    print(hex(element.value))
                print("ref output:\n{}".format(hex(ref_output.value)))
                print("dut res:\n{}".format(hex(dut_res)))

                raise TestFailure(" test failed!!! ")

            print("output case {}".format(count_cases))
            count_cases += 1

    raise TestSuccess(" pass {} test cases".format(cases_num))


@cocotb.test(timeout_time=300000, timeout_unit="ns")
async def PoseidonTopLevelTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to dut ports
    dut.io_input_valid.value = False
    dut.io_input_payload.value = 0
    dut.io_input_last.value = False

    dut.io_output_ready.value = False

    # start testing
    await reset_dut(dut)
    await cocotb.start(generate_input(dut))
    await cocotb.start(check_output(dut))

    while True:
        await RisingEdge(dut.clk)
