import cocotb
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge

from queue import Queue
import random
from math import ceil

from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff, basic, constants


from BasicElements import Context, MDSContext

CASES_NUM = 50


class PoseidonThreadTester:
    def __init__(self, target):
        self.dut = target
        self.ref_inputs = Queue(maxsize=300)
        self.ref_outputs = Queue(maxsize=300)  # store reference results
        self.state_size = 12
        self.peNum = 6
        self.mds_op_latency = 66

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(3):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    def ref_poseidon_thread(self, dut_inputs):
        """reference poseidon thread function"""
        state_size = dut_inputs[0].state_size
        round_index = dut_inputs[0].round_index
        state_ff = []
        for i in range(state_size):
            state_ff.append(ff.PrimeField(0))
            state_ff[i].value = dut_inputs[i].state_element.value

        roundf = basic.ROUNDFULL
        roundp = basic.ROUNDPARTIAL[state_size]

        round_constants_ff = poseidon_ff.transform_array(
            constants.generate_constants(state_size, roundf, roundp)
        )

        state_ff = poseidon_ff.add_round_constants_ff(
            state_ff,
            round_constants_ff[
                round_index * state_size : (round_index + 1) * state_size
            ],
        )

        if (round_index >= roundf / 2) & (round_index < (roundf / 2 + roundp)):
            state_ff[0] = poseidon_ff.s_box_ff(state_ff[0])
        else:
            state_ff = poseidon_ff.s_boxes_ff(state_ff)
        

        state_ff = poseidon_ff.mds_mixing_ff(state_ff)


        ref_output = MDSContext(
            dut_inputs[0].round_index,
            dut_inputs[0].state_size,
            dut_inputs[0].state_id,
        )
        ref_output.copy_state_elements(state_ff)
        return ref_output


    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            dut_inputs = []
            for i in range(ceil(self.mds_op_latency/self.state_size)):
                dut_input = Context.get_context_vec(cases_count, self.state_size)
                
                if cases_count < CASES_NUM:
                    dut.io_input_valid.value = True
                    for element in dut_input:
                        element.set_dut_ports(dut)
                        await RisingEdge(dut.clk)
                    dut_inputs.append(dut_input)

                    ref_output = self.ref_poseidon_thread(dut_input)
                    self.ref_outputs.put(ref_output)

                else:
                    dut.io_input_valid.value = False
                    for element in dut_input:
                        element.set_dut_ports(dut)
                        await RisingEdge(dut.clk)
                
                cases_count += 1
                
            
            if(self.state_size > self.peNum):
                for input in dut_inputs:
                    for i in range(self.peNum, self.state_size):
                        dut.io_input_valid.value = True
                        input[i].set_dut_ports(dut)
                        await RisingEdge(dut.clk)
                    for i in range(self.peNum):
                        dut.io_input_valid.value = False
                        await RisingEdge(dut.clk)

        dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        count_cases = 0

        while count_cases < CASES_NUM:
            await RisingEdge(self.dut.clk)
            if (self.dut.io_output_valid.value) == True:
                # get reference output
                ref_output = self.ref_outputs.get()

                # get dut output
                dut_output = MDSContext()
                dut_output.get_dut_ports(self.dut)

                # compare dut output and reference output
                if not dut_output.check_context_equal(ref_output):
                    print("REF:")
                    ref_output.print_context_info()
                    print("DUT:")
                    dut_output.print_context_info()
                    raise TestFailure("test cases {} failed".format(count_cases))
                count_cases += 1

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=400000, timeout_unit="ns")
async def PoseidonThreadTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to dut input ports
    dut.io_input_valid.value = False
    initial_input = Context()
    initial_input.set_dut_ports(dut)

    # start testing
    tester = PoseidonThreadTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)


