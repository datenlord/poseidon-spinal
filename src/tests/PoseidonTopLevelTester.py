import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff, basic


CASES_NUM = 15


class PoseidonTopLevelTester:
    def __init__(self, target):
        self.dut = target
        self.ref_inputs = Queue(maxsize=500)
        self.ref_outputs = Queue(maxsize=500)

    async def reset_dut(self):
        """reset the dut"""
        self.dut.reset.value = 0
        await RisingEdge(self.dut.clk)
        self.dut.reset.value = 1
        for i in range(2):
            await RisingEdge(self.dut.clk)

        self.dut.reset.value = 0

    def get_random_values(self, cases_count):
        """get random input values"""
        size_range = [3, 5, 9, 12]
        # state_size  = size_range[random.randint(0,3)]
        state_size = 3  # size_range[int(cases_count / 25)]
        state_elements = []
        for i in range(state_size):
            state_elements.append(ff.PrimeField(random.randint(0, basic.P - 1)))
        return state_elements

    async def generate_input(self):
        """generate input signals"""
        cases_count = 0
        while cases_count < CASES_NUM:
            state_elements = self.get_random_values(cases_count)

            # assign random valuess to dut io port
            for i in range(len(state_elements)):
                self.dut.io_input_valid.value = True  # (random.random()>0.2)
                self.dut.io_input_payload.value = state_elements[i].value
                self.dut.io_input_last.value = i == (len(state_elements) - 1)

                await RisingEdge(self.dut.clk)

                while (
                    self.dut.io_input_valid.value & self.dut.io_input_ready.value
                ) == False:
                    self.dut.io_input_valid.value = True  # (random.random()>0.2)
                    await RisingEdge(self.dut.clk)
            print("input case {}".format(cases_count))
            cases_count += 1
            self.ref_inputs.put(state_elements)
            self.ref_outputs.put(poseidon_ff.poseidon_hash_opt_ff(state_elements))

        self.dut.io_input_valid.value = False

    async def check_output(self):
        """compare output signals to reference model"""
        count_cases = 0

        while count_cases < CASES_NUM:
            self.dut.io_output_ready.value = True  # (random.random() > 0.3)
            await RisingEdge(self.dut.clk)

            if (
                self.dut.io_output_ready.value & self.dut.io_output_valid.value
            ) == True:
                dut_res = int(self.dut.io_output_payload.value)
                # dut_res = int(self.dut.io_output_payload_state_element.value)
                ref_input = self.ref_inputs.get()
                ref_output = self.ref_outputs.get()

                if dut_res != ref_output.value:
                    # print error info
                    print("test case {} failed: ".format(count_cases))
                    print("ref input:\n")
                    print("lenght of preimage:{}".format(len(ref_input)))
                    for element in ref_input:
                        print(hex(element.value))
                    print("ref output:\n{}".format(hex(ref_output.value)))
                    print("dut res:\n{}".format(hex(dut_res)))

                    raise TestFailure(" test failed!!! ")

                print("output case {}".format(count_cases))
                count_cases += 1

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=60000000000, timeout_unit="ns")
async def PoseidonTopLevelTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to dut ports
    dut.io_input_valid.value = False
    dut.io_input_payload.value = 0
    dut.io_input_last.value = False

    dut.io_output_ready.value = False

    # start testing
    tester = PoseidonTopLevelTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.check_output())
    # rindex = [0,0,0,0]
    round_max = -1
    cycle = 0
    #fifo_count = 0
    while True:
        await RisingEdge(dut.clk)

        # fifo counter
        # temp_count = int(dut.poseidonLoop_1.loopback_fifo_io_occupancy)
        # if(temp_count > fifo_count):
        #     fifo_count = temp_count
        #     print(f"fifo occupancy: {fifo_count}")

        cycle = cycle + 1
        loop = dut.poseidonLoop_1
        #thread = loop.poseidonThread_1
        # # if(loop.modAdderPipedFlow_1_io_output_valid.value):
        # #     print(hex(int(loop.modAdderPipedFlow_1_io_output_payload_res.value)))

        if (
            loop.streamArbiter_2_io_output_valid.value
            & loop.poseidonSerializer_1_io_input_ready.value
        ):
            roundp = (
                int(loop.streamArbiter_2_io_output_payload_fullRound.value)
                + int(loop.streamArbiter_2_io_output_payload_partialRound.value) % 63
            )
            if roundp > round_max:
                round_max = roundp
                print("ID: ", int(loop.streamArbiter_2_io_output_payload_stateID.value))
                print(
                    "isFull: ",
                    bool(loop.streamArbiter_2_io_output_payload_isFull.value),
                )
                print(
                    "fullRound: ",
                    int(loop.streamArbiter_2_io_output_payload_fullRound.value),
                )
                print(
                    "partialRound: ",
                    int(loop.streamArbiter_2_io_output_payload_partialRound.value),
                )

                # print("element0", hex(int(loop.streamArbiter_2_io_output_payload_stateElements_0.value)))
                # print("element1", hex(int(loop.streamArbiter_2_io_output_payload_stateElements_1.value)))
                # print("element2", hex(int(loop.streamArbiter_2_io_output_payload_stateElements_2.value)))
        # file.write(f"cycle: {cycle}\n")
        # if(thread.mDSMatrixMultiplier_1_io_output_valid.value):
        #     file.write("input:  ")
        #     file.write(f"ID:{int(thread.mDSMatrixMultiplier_1_io_output_payload_stateID.value)}  ")
        #     file.write(f"isFull:{bool(thread.mDSMatrixMultiplier_1_io_output_payload_isFull.value)}  ")
        #     file.write(f"fullRound:{int(thread.mDSMatrixMultiplier_1_io_output_payload_fullRound.value)}  ")
        #     file.write(f"partialRound:{int(thread.mDSMatrixMultiplier_1_io_output_payload_partialRound.value)}\n")

        # if(thread.mDSMatrixAdders_1_io_output_valid.value):
        #     file.write("output:  ")
        #     file.write(f"ID:{int(thread.mDSMatrixAdders_1_io_output_payload_stateID.value)}  ")
        #     file.write(f"isFull:{bool(thread.mDSMatrixAdders_1_io_output_payload_isFull.value)}  ")
        #     file.write(f"fullRound:{int(thread.mDSMatrixAdders_1_io_output_payload_fullRound.value)}  ")
        #     file.write(f"partialRound:{int(thread.mDSMatrixAdders_1_io_output_payload_partialRound.value)}\n")

        # file.write("\n")

        # if(loop.poseidonThread_1_io_output_valid.value):
        #     print("element: ", hex(int(loop.poseidonThread_1_io_output_payload_stateElements_0.value)))
        #     print("element: ", hex(int(loop.poseidonThread_1_io_output_payload_stateElements_1.value)))
        #     print("element1: ", hex(int(loop.poseidonThread_1_io_output_payload_stateElements_2.value)))
