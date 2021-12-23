import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import ff

ref_outputs = Queue(maxsize=5)  # store reference results
cases_num = 3000  # the number of test cases


async def reset_dut(dut):
    dut.rst.value = 0
    await RisingEdge(dut.clk)
    dut.rst.value = 1
    for i in range(3):
        await RisingEdge(dut.clk)

    dut.rst.value = 0


def get_random_values():
    rand_valid = random.random() > 0.3
    rand_op1 = ff.PrimeField(random.randint(0, ff.p - 1))
    rand_op2 = ff.PrimeField(random.randint(0, ff.p - 1))
    return rand_valid, rand_op1, rand_op2


async def generate_input(dut):
    """generate input signals"""
    cases_count = 0
    while cases_count < cases_num:
        valid, op1, op2 = get_random_values()

        # assign random values to dut io port
        dut.op_valid_i.value = valid
        dut.op1_i.value = op1.value
        dut.op2_i.value = op2.value

        await RisingEdge(dut.clk)
        if dut.op_valid_i.value & dut.op_ready_o.value:
            cases_count += 1
            ref_outputs.put([op1.value, op2.value, op1.MonPro(op1.value, op2.value)])

    dut.op_valid_i.value = False


async def check_output(dut):
    """check output signals"""
    cases_count = 0
    while cases_count < cases_num:

        ready = random.random() > 0.3
        dut.res_ready_i.value = ready
        await RisingEdge(dut.clk)
        if dut.res_ready_i.value & dut.res_valid_o.value == True:
            cases_count += 1
            op1, op2, ref_res = ref_outputs.get()
            dut_res = int(dut.res_o.value)
            # print("dut mediate_res:")
            # print(hex(int(dut.mediate_res.value)))
            assert (
                dut_res == ref_res
            ), "the result of {} MonPro {} is wrong \n ref:{} \n dut:{}".format(
                hex(op1), hex(op2), hex(ref_res), hex(dut_res)
            )

    raise TestSuccess(" pass {} test cases".format(cases_num))


@cocotb.test(timeout_time=300000, timeout_unit="ns")
async def ModMultiplierTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.op_valid_i.value = False
    dut.op1_i.value = 0
    dut.op2_i.value = 0
    dut.res_ready_i.value = False

    await reset_dut(dut)

    await cocotb.start(generate_input(dut))
    await cocotb.start(check_output(dut))

    while True:
        await RisingEdge(dut.clk)
