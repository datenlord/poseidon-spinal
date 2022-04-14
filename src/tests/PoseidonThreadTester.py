from typing import List
from weakref import ref
import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import basic, constants
from poseidon_python.poseidon_ff import *
from cocotb_test import simulator

from BasicElements import Context, MDSContext

CASES_NUM = 500


class PoseidonThreadTester:
    def __init__(self, target):
        self.dut = target
        self.ref_outputs = Queue(maxsize=300)  # store reference results

    async def reset_dut(self):
        dut = self.dut
        dut.reset.value = 0
        await RisingEdge(dut.clk)
        dut.reset.value = 1
        for i in range(2):
            await RisingEdge(dut.clk)

        dut.reset.value = 0

    def ref_poseidon_thread(self, context_vec: List[Context]):
        """reference poseidon thread function"""
        isFull = context_vec[0].isFull
        rf = context_vec[0].full_round
        rp = context_vec[0].partial_round
        t = context_vec[0].state_size
        id = context_vec[0].state_id
        state_ff = []
        # read constants used in optimized poseidon from files
        cmp_constants, pre_sparse, w_hat, v_rest = read_constants_files(
            t, "../../poseidon_constants"
        )
        rconstants_ff = transform_array(cmp_constants)
        pre_sparse_ff = transform_matrix(pre_sparse)
        sparse_w_ff = transform_matrix(w_hat)
        sparse_v_ff = transform_matrix(v_rest)
        mds_matrix_ff = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(t))
        if isFull:
            for i in range(t):
                state_ff.append(context_vec[i].state_element)
            state_ff = s_boxes_ff(state_ff)
            if rf < 3:
                state_ff = add_round_constants_ff(
                    state_ff, rconstants_ff[(rf + 1) * t : (rf + 2) * t]
                )
                state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)
            elif rf == 3:
                state_ff = add_round_constants_ff(
                    state_ff, rconstants_ff[(rf + 1) * t : (rf + 2) * t]
                )
                state_ff = mds_mixing_ff(state_ff, pre_sparse_ff)
            elif rf < 7:
                base = (rf + 1) * t + MDSContext.roundp_map[t]
                state_ff = add_round_constants_ff(
                    state_ff, rconstants_ff[base : base + t]
                )
                state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)
            else:
                state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)
        else:
            state_ff.append(context_vec[0].state_element)
            for i in range(t - 1):
                state_ff.append(context_vec[0].state_elements[i])
            state_ff[0] = s_box_ff(state_ff[0])
            state_ff[0].addassign(rconstants_ff[5 * t + rp])
            state_ff = sparse_mds_mixing(state_ff, sparse_w_ff[rp], sparse_v_ff[rp])

        res = MDSContext(isFull, rf, rp, t, id)
        res.copy_state_elements(state_ff)
        return res

    async def drive_input_ports(self):
        """generate input signals"""
        dut = self.dut
        cases_count = 0
        while cases_count < CASES_NUM:
            dut_inputs = Context.get_context_vec(isFull=False, size=3, RP=1)

            # assign dut io port

            for input in dut_inputs:
                dut.io_input_valid.value = True  # random.random() > 0.2
                input.set_dut_ports(dut)

                await RisingEdge(dut.clk)
                while (dut.io_input_valid.value) == False:
                    dut.io_input_valid.value = True  # random.random() > 0.2
                    await RisingEdge(dut.clk)

            cases_count += 1
            ref_output = self.ref_poseidon_thread(dut_inputs)
            self.ref_outputs.put(ref_output)

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


# pytest
def test_PoseidonThread():
    simulator.run(
        verilog_sources=[
            "../main/verilog/PoseidonThread.v",
            "../main/verilog/MontMultiplierBasics.v",
            "../main/verilog/ModAdder.v",
        ],
        toplevel="PoseidonThread",
        module="PoseidonThreadTester",
        python_search="./src/reference_model/",
    )
