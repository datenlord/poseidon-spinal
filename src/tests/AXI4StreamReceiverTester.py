from math import ceil
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import basic
from BasicElements import Context


CASES_NUM = 2000  # the number of test cases


class AXI4StreamReceiverTester:
    def __init__(self, target, size) -> None:
        self.dut = target
        self.ref_outputs = Queue(maxsize=80)  # store reference results
        self.cases_count = 0
        self.state_size = size

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(3):
            await RisingEdge(dut.clk)

        dut.reset.value = 0
    

    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        while self.cases_count < CASES_NUM:
            # get random values
            dut_input = Context.get_context_vec(self.state_size, 0, self.cases_count)
            for input in dut_input:
                self.ref_outputs.put(input)
            
            # assign random values to dut io port
            for input in dut_input:

                dut.io_input_valid.value = random.random() > 0.3
                dut.io_input_payload_tdata.value = input.state_element.value
                dut.io_input_payload_tlast.value = input.state_index == (input.state_size-1)
                await RisingEdge(dut.clk)

                while (dut.io_input_valid.value & dut.io_input_ready.value) == False:
                    dut.io_input_valid.value = random.random() > 0.3
                    await RisingEdge(dut.clk)
        
            self.cases_count += 1
        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        dut = self.dut
        cases_count = 0
        
        while cases_count < self.state_size*CASES_NUM:
            # get random ready signals
            dut.io_output_ready.value = random.random() > 0.3
            await RisingEdge(dut.clk)
            if (dut.io_output_ready.value & dut.io_output_valid.value) == True:
                ref_output = self.ref_outputs.get()
                dut_output = Context()
                dut_output.get_dut_ports(dut)
                
                if not dut_output.check_context_equal(ref_output):
                    print(f"Test Case {cases_count}:")
                    print("REF:")
                    ref_output.print_context_info()
                    print("DUT:")
                    dut_output.print_context_info()
                    raise TestFailure(f"test case {cases_count} failed: ")
                else:
                    cases_count += 1
                
            
        raise TestSuccess("test case {} success".format(self.cases_count))


@cocotb.test(timeout_time=200000, timeout_unit="ns")
async def AXI4StreamReceiverTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to all dut input ports
    dut.io_input_valid.value = False
    dut.io_input_payload_tlast.value = False
    dut.io_input_payload_tdata.value = 0
    dut.io_output_ready.value = False

    # start testing
    tester = AXI4StreamReceiverTester(dut, size=3)
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)


