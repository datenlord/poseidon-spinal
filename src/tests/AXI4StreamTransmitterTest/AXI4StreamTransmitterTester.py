from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess,TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic

ref_outputs = Queue(maxsize = 80) # store reference results
cases_num = 5000                  # the number of test cases
buffer_size = 5                   # the size of buffer in transmitter

async def reset_dut(dut):
    dut.reset.value = 0
    await RisingEdge(dut.clk)
    dut.reset.value = 1
    for i in range(2):
        await RisingEdge(dut.clk)
    
    dut.reset.value = 0


async def generate_input(dut):
    ''' generate input signals '''
    
    cases_count = 0
    while cases_count < cases_num :
        # get random values 
        inputs = []
        for i in range(buffer_size): 
            rand_value = random.randint(0,basic.p-1)
            inputs.append( [cases_count%pow(2,5), rand_value] )
            ref_outputs.put(rand_value)
            cases_count += 1
        
        # assign random values to dut io port
        tag = []
        while len(tag) < buffer_size:
            valid = random.random() > 0.2
            index = random.randint(0,4)
            while index in tag:
                index = random.randint(0,4)
            dut.io_input_valid.value = valid
            dut.io_input_payload_state_id.value = inputs[index][0]
            dut.io_input_payload_state_element.value = inputs[index][1]
            await RisingEdge(dut.clk)
            if (dut.io_input_valid.value & dut.io_input_ready.value) == True:
                tag.append(index)
        
        
    
        
        

async def check_output(dut):
    ''' check output signals '''
    cases_count = 0
    
    while True:
        # get random ready signals
        ready = random.random() > 0.3
        dut.io_output_ready.value = ready
        await RisingEdge(dut.clk)
        if (dut.io_output_ready.value & dut.io_output_valid.value) == True:
            ref_res = ref_outputs.get()
            dut_res = int(dut.io_output_payload.value)
            assert ref_res == dut_res,"test case {} failed".format(cases_count)
            cases_count += 1
        
        if cases_count == cases_num: 
            raise TestSuccess(" pass {} test cases".format(cases_num))
        

@cocotb.test(timeout_time = 100000, timeout_unit = 'ns')
async def AXI4StreamTransmitterTest(dut):
    await cocotb.start( Clock(dut.clk , 10 , 'ns').start() )

    # set default values to all dut input ports
    dut.io_input_valid.value = False
    dut.io_input_payload_state_id.value = 0
    dut.io_input_payload_state_element.value = 0

    dut.io_output_ready.value = False


    # start testing
    await reset_dut(dut)
    await cocotb.start(generate_input(dut))
    await cocotb.start(check_output(dut))

    while True:
        await RisingEdge(dut.clk)