import cocotb
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge

import random
from queue import Empty, Queue
from math import ceil

from poseidon_python import basic
from BasicElements import Context, MDSContext

CASES_NUM = 50


class PoseidonSerializerTester:
    def __init__(self, target):
        self.dut = target
        self.ref_outputs = Queue(maxsize=250)
        self.state_size = 9
        self.mds_op_latency = 66
        self.pe_num = 6
        #self.buffer_size = 12  # the size of buffer in serializer
        self.cases_count = 0

    async def reset_dut(self):
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(3):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0


    async def drive_input_ports(self):
        dut = self.dut
        """generate input signals"""
        while self.cases_count < CASES_NUM:
            dut_inputs = []
            inputs_num = ceil(self.mds_op_latency/self.state_size)
            for i in range(inputs_num):
                dut_inputs.append(MDSContext(0, self.state_size, self.cases_count * inputs_num + i))
                dut_inputs[i].rand_state_elements()
            
            # get reference outputs and enqueue
            for input in dut_inputs:
                for i in range(self.state_size):
                    ref_output = Context(0, i, input.state_size, input.state_id)
                    ref_output.state_element.value = input.state_elements[i].value
                    self.ref_outputs.put(ref_output)
            
            if(self.state_size > self.pe_num):
                for input in dut_inputs:
                    for i in range(self.pe_num, self.state_size):
                        ref_output = Context(0, i, input.state_size, input.state_id)
                        ref_output.state_element.value = input.state_elements[i].value
                        self.ref_outputs.put(ref_output)
                
            # drive input ports
            dut.io_parallelInput_valid.value = True
            for input in dut_inputs:
                input.set_dut_ports(dut, "io_parallelInput_payload_")
                await RisingEdge(dut.clk)
                handshake = dut.io_parallelInput_valid.value & dut.io_parallelInput_ready.value
                while (dut.io_parallelInput_valid.value & dut.io_parallelInput_ready.value) == False:
                    await RisingEdge(dut.clk)
                

            self.cases_count += 1
    
        dut.io_parallelInput_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut

        while True:
            dut.io_serialOutput_ready.value = True
            await RisingEdge(dut.clk)
            if(dut.io_serialOutput_valid.value & dut.io_serialOutput_ready.value):
                dut_output = Context()
                dut_output.get_dut_ports(dut, "io_serialOutput_payload_")
                ref_output = self.ref_outputs.get()
                if not dut_output.check_context_equal(ref_output):
                    print("REF:")
                    ref_output.print_context_info()
                    print("DUT:")
                    dut_output.print_context_info()
                    raise TestFailure(" test failed ")
            
            if (self.cases_count == CASES_NUM) & self.ref_outputs.empty():
                raise TestSuccess(" test success!!")
            


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def PoseidonSerializerTest(dut):

    await cocotb.start(Clock(dut.clk, 10, "ns").start())
    tester = PoseidonSerializerTester(dut)

    # set default value to input ports of dut
    dut.io_parallelInput_valid.value = False
    dut.io_serialOutput_ready.value = False
    init_context = MDSContext()
    init_context.set_dut_ports(dut, "io_parallelInput_payload_")


    await tester.reset_dut()
    # start testing
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)



