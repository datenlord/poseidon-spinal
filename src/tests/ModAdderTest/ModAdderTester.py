import cocotb
from poseidon_python import basic
from cocotb.triggers import Timer
import random


@cocotb.test()
async def ModAdderTest(dut):
    ''' test ModAdder '''

    for i in range(100):
        res = random.randint(1,basic.p-1)
        op1 = random.randint(0,res)
        op2 = res - op1
        dut.op1_i.value = op1
        dut.op2_i.value = op2
        await Timer(5,units="ns")
        assert dut.res_o== res%basic.p,"the result of {} + {} is wrong".format(op1,op2)


    for i in range(100):
        res = random.randint(basic.p,pow(2,255)-1)
        op1 = random.randint(0,res)
        op2 = res - op1
        dut.op1_i.value = op1
        dut.op2_i.value = op2
        await Timer(5,units="ns")
        assert dut.res_o == res%basic.p,"the result of {} + {} is wrong".format(op1,op2)
    
    for i in range(100):
        res = random.randint(pow(2,255),(2*basic.p-2))
        op1 = random.randint((res-pow(2,255)+1),(pow(2,255)-1))
        op2 = res - op1
        dut.op1_i.value = op1
        dut.op2_i.value = op2
        await Timer(5,units="ns")
        assert dut.res_o== res%basic.p,"the result of {} + {} is wrong".format(op1,op2)


