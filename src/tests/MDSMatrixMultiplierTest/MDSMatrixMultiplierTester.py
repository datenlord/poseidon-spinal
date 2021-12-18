import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess,TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import ff,poseidon_ff

ref_outputs = Queue(maxsize = 20) # store reference results
cases_num = 2000

async def reset_dut(dut):
    dut.reset.value = 0
    await RisingEdge(dut.clk)
    dut.reset.value = 1
    for i in range(2):
        await RisingEdge(dut.clk)
    
    dut.reset.value = 0


def random_input():
    rand_valid = (random.random()>0.3)
    rand_value = random.randint(0,ff.p-1)
    t_range = [3,5,9,12]
    rand_size  = t_range[random.randint(0,3)]
    rand_index = random.randint(0,rand_size-1)
    return rand_valid, rand_value,rand_size,rand_index


def check_output_ports(dut,ref_res):
    dut_res = []
    dut_res.append(dut.io_output_payload_state_elements_0.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_1.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_2.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_3.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_4.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_5.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_6.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_7.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_8.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_9.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_10.value.integer)
    dut_res.append(dut.io_output_payload_state_elements_11.value.integer)
    for i in range(12):
        if dut_res[i]!=ref_res[i]: return False,dut_res
    return True,dut_res


async def generate_input(dut):
    ''' generate input signals '''
    cases_count = 0
    while cases_count < cases_num:
        valid, value, size, index = random_input()
        value_ff = ff.PrimeField(value)

        # assign dut io port
        dut.io_input_valid.value = valid
        dut.io_input_payload_state_index.value = index
        dut.io_input_payload_state_size.value = size
        dut.io_input_payload_state_element.value = value_ff.value
        await RisingEdge(dut.clk)

        if dut.io_input_valid.value & dut.io_input_ready.value == True:
            cases_count += 1
            # get reference output 
            mds_input_ff = [ff.PrimeField(0)]*index + [value_ff] + [ff.PrimeField(0)]*(size-index-1)
            mds_output_ff = poseidon_ff.mds_mixing_ff(mds_input_ff)
            
            for i in range(size): mds_output_ff[i] = mds_output_ff[i].value 
            ref_outputs.put([value_ff.value, size, index, mds_output_ff])
    
    dut.io_input_valid.value = False
        
        
async def output_check(dut):
    ''' check output signals '''
    count_cases = 0
    
    while True:
        await RisingEdge(dut.clk)
        ready = (random.random() > 0.5)
        dut.io_output_ready.value = ready

        if(dut.io_output_ready.value & dut.io_output_valid.value == True):
            count_cases += 1
            value, size, index, ref_res = ref_outputs.get()
            ref_res = ref_res + [0]*(12-size)

            passed, dut_res = check_output_ports(dut,ref_res)
            if not passed: 
                print("input: value:{} index:{} size:{}".format(hex(value),index,size))
                print("ref output:")
                for element in ref_res: print(hex(element))
                print("dut output:")
                for element in dut_res: print(hex(element))
                raise TestFailure("test case {} failed: ".format(count_cases))

        if count_cases == cases_num : raise TestSuccess(" pass {} test cases".format(cases_num))


@cocotb.test(timeout_time = 400000,timeout_unit = 'ns')
async def MDSMatrixMultiplierTest(dut):
    await cocotb.start( Clock(dut.clk , 10 , 'ns').start() )

    dut.io_input_valid.value = False
    dut.io_input_payload_state_index.value = 0
    dut.io_input_payload_state_size.value = 0
    dut.io_input_payload_state_element.value = 0
    dut.io_input_payload_round_index.value = 0
    dut.io_input_payload_state_id.value = 0
    dut.io_output_ready.value = False

    await reset_dut(dut)

    await cocotb.start(generate_input(dut))
    await cocotb.start(output_check(dut))

    while True:
        await RisingEdge(dut.clk)