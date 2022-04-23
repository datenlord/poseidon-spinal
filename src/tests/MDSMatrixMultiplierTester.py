import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue


from poseidon_python import finite_field as ff
from poseidon_python import basic
from poseidon_python.poseidon_ff import *

from BasicElements import Context, MDSContext

CASES_NUM = 2000


class MDSMatrixMultiplierTester:
    def __init__(self, target, isFull=None, size=None, id=None):
        self.dut = target
        self.ref_outputs = Queue(maxsize=100)
        self.ref_inputs = Queue(maxsize=100)
        self.isFull = isFull
        self.size = size
        self.id = id

    def reference_model(self, context: Context):
        size = context.state_size
        ref_output = MDSContext(
            context.isFull,
            context.full_round,
            context.partial_round,
            context.state_size,
            context.state_id,
        )
        if context.isFull:
            mds_input_ff = (
                [ff.PrimeField(0)] * context.state_index
                + [context.state_element]
                + [ff.PrimeField(0)] * (context.state_size - context.state_index - 1)
            )
            if context.full_round == (Context.roundf / 2 - 1):
                matrix = transform_matrix(
                    read_pre_sparse_matrix(size, "../../poseidon_constants")
                )
            else:
                matrix = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(size))
            ref_output.copy_state_elements(mds_mixing_ff(mds_input_ff, matrix))
        else:
            w_hat, v_rest = read_sparse_matrix(size, "../../poseidon_constants")
            sparse_w_ff = transform_matrix(w_hat)[context.partial_round]
            sparse_v_ff = transform_matrix(v_rest)[context.partial_round]
            res = []
            if size < 9:
                res.append(context.state_element.mul(sparse_w_ff[0]))
                for i in range(1, size):
                    res.append(context.state_element.mul(sparse_v_ff[i - 1]))
                    res[i].addassign(context.state_elements[i - 1])
                for i in range(size - 1):
                    res.append(context.state_elements[i].mul(sparse_w_ff[i + 1]))
            else:
                res.append(context.state_element.mul(sparse_w_ff[0]))
                if context.state_index == 0:
                    for i in range(1, size):
                        res.append(context.state_element.mul(sparse_v_ff[i - 1]))
                        res[i].addassign(context.state_elements[i - 1])
                else:
                    for i in range(size - 1):
                        res.append(context.state_elements[i].mul(sparse_w_ff[i + 1]))
            ref_output.copy_state_elements(res)
        return ref_output

    async def reset_dut(self):
        self.dut.reset.value = 1
        for i in range(3):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    async def drive_input_ports(self):
        """generate input signals"""
        cases_count = 0
        while cases_count < CASES_NUM:
            # get random dut inputs
            context = Context()
            context.set_rand_values(isFull=self.isFull, size=self.size, id=self.id)

            # assign dut io port
            self.dut.io_input_valid.value = True  # random.random()>0.2
            context.set_dut_ports(self.dut)
            await RisingEdge(self.dut.clk)

            if self.dut.io_input_valid.value == True:
                cases_count += 1
                # get reference output
                ref_output = self.reference_model(context)

                self.ref_outputs.put(ref_output)
                self.ref_inputs.put(context)

        self.dut.io_input_valid.value = False

    async def monitor_output_ports(self):
        """check output signals"""
        count_cases = 0

        while count_cases < CASES_NUM:
            await RisingEdge(self.dut.clk)

            if self.dut.io_output_valid.value == True:
                count_cases += 1
                ref_output = self.ref_outputs.get()
                ref_input = self.ref_inputs.get()
                dut_output = MDSContext()
                dut_output.get_dut_ports(self.dut)

                if not dut_output.check_context_equal(ref_output):
                    print("INPUT: ")
                    ref_input.print_context_info()
                    print("REF:")
                    ref_output.print_context_info()
                    print("DUT:")
                    dut_output.print_context_info()
                    raise TestFailure("test case {} failed: ".format(count_cases))

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=4000000, timeout_unit="ns")
async def MDSMatrixMultiplierTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    dut.io_input_valid.value = False
    initial_input = Context()
    initial_input.set_dut_ports(dut)

    tester = MDSMatrixMultiplierTester(dut)

    await tester.reset_dut()
    await cocotb.start(tester.drive_input_ports())
    await cocotb.start(tester.monitor_output_ports())

    while True:
        await RisingEdge(dut.clk)
