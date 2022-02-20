import cocotb
from poseidon_python import basic
from cocotb.triggers import Timer
import random
from cocotb_test import simulator


@cocotb.test()
async def ModAdderTest(dut):
    """test ModAdder"""

    for i in range(100):
        res = random.randint(1, basic.P - 1)
        op1 = random.randint(0, res)
        op2 = res - op1
        dut.op1_i.value = op1
        dut.op2_i.value = op2
        await Timer(5, units="ns")
        assert dut.res_o == res % basic.P, "the result of {} + {} is wrong".format(
            op1, op2
        )

    for i in range(100):
        res = random.randint(basic.P, pow(2, 255) - 1)
        op1 = random.randint(0, res)
        op2 = res - op1
        dut.op1_i.value = op1
        dut.op2_i.value = op2
        await Timer(5, units="ns")
        assert dut.res_o == res % basic.P, "the result of {} + {} is wrong".format(
            op1, op2
        )

    for i in range(100):
        res = random.randint(pow(2, 255), (2 * basic.P - 2))
        op1 = random.randint((res - pow(2, 255) + 1), (pow(2, 255) - 1))
        op2 = res - op1
        dut.op1_i.value = op1
        dut.op2_i.value = op2
        await Timer(5, units="ns")
        assert dut.res_o == res % basic.P, "the result of {} + {} is wrong".format(
            op1, op2
        )


# pytest
def test_ModAdder():
    simulator.run(
        verilog_sources=["../main/verilog/ModAdder.v"],
        toplevel="ModAdder",
        module="ModAdderTester",
        python_search="./src/reference_model/",
    )
