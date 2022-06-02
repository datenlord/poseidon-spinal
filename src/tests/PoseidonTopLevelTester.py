import cocotb
import random
from cocotb.clock import Clock
from cocotb.result import TestSuccess, TestFailure
from cocotb.triggers import RisingEdge
from queue import Queue
from poseidon_python import finite_field as ff
from poseidon_python import poseidon_ff, basic

CASES_NUM = 200


class PoseidonTopLevelTester:
    def __init__(self, target):
        self.dut = target
        self.ref_inputs = Queue(maxsize=300)
        self.ref_outputs = Queue(maxsize=300)

    async def reset_dut(self):
        """reset the dut"""
        self.dut.resetn.value = 0
        for i in range(3):
            await RisingEdge(self.dut.clk)

        self.dut.resetn.value = 1

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
                self.dut.io_input_payload_tdata.value = state_elements[i].value
                self.dut.io_input_payload_tlast.value = i == (len(state_elements) - 1)

                await RisingEdge(self.dut.clk)

                while (
                    self.dut.io_input_valid.value & self.dut.io_input_ready.value
                ) == False:
                    self.dut.io_input_valid.value = True  # (random.random()>0.2)
                    await RisingEdge(self.dut.clk)
            print("input case {}\n".format(cases_count))
            cases_count += 1
            self.ref_inputs.put(state_elements)
            self.ref_outputs.put(poseidon_ff.poseidon_hash_ff(state_elements))

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
                dut_res = int(self.dut.io_output_payload_tdata.value)
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

                print("output case {}\n".format(count_cases))
                count_cases += 1

        raise TestSuccess(" pass {} test cases".format(CASES_NUM))


@cocotb.test(timeout_time=60000000000, timeout_unit="ns")
async def PoseidonTopLevelTest(dut):
    await cocotb.start(Clock(dut.clk, 10, "ns").start())

    # set default values to dut ports
    dut.io_input_valid.value = False
    dut.io_input_payload_tdata.value = 0
    dut.io_input_payload_tlast.value = False

    dut.io_output_ready.value = False

    # start testing
    tester = PoseidonTopLevelTester(dut)
    await tester.reset_dut()
    await cocotb.start(tester.generate_input())
    await cocotb.start(tester.check_output())
    
    loop2_file = open("loop2_log.txt","w")
    loop3_file = open("loop3_log.txt", "w")
    trans_log = open("trans_log.txt","w")
    loop2 = dut.poseidonLoop_2
    loop3 = dut.poseidonLoop_3
    id2 = 1
    id3 = 1
    while True:
        await RisingEdge(dut.clk)
        # Loop Input Signals
        
        # if(dut.poseidonDispatcher_1_io_outputs_0_valid.value&dut.poseidonLoop_2_io_input_ready.value):
        #     index = dut.poseidonDispatcher_1_io_outputs_0_payload_stateIndex.value
        #     id = dut.poseidonDispatcher_1_io_outputs_0_payload_stateId.value
        #     print(f"loop2: \nid:{int(id)} \nindex:{int(index)}\n")
        #     cases_count += 1
            
        # if(dut.poseidonDispatcher_1_io_outputs_1_valid.value&dut.poseidonLoop_3_io_input_ready.value):
        #     index = dut.poseidonDispatcher_1_io_outputs_1_payload_stateIndex.value
        #     id = dut.poseidonDispatcher_1_io_outputs_1_payload_stateId.value
        #     print(f"loop3: \nid:{int(id)} \nindex:{int(index)}\n")
        #     cases_count += 1
        
        valid = loop2.streamArbiter_6_io_output_valid
        ready = loop2.streamArbiter_6_io_output_ready
        if(valid.value & ready.value):
            sIndex = loop2.streamArbiter_6_io_output_payload_stateIndex.value
            rIndex = loop2.streamArbiter_6_io_output_payload_roundIndex.value
            id = loop2.streamArbiter_6_io_output_payload_stateId.value
            loop2_file.write(f"id{int(id)} state_index:{int(sIndex)} round_index:{int(rIndex)}\n")
            if(id != id2):
                id2 = id
                print("loop 2 arbiter output: ")
                print(f"id:{int(id)}")
                print(f"state_index:{int(sIndex)}")
                print(f"round_index:{int(rIndex)}"+"\n")
        
        valid = loop3.streamArbiter_6_io_output_valid
        ready = loop3.streamArbiter_6_io_output_ready
        if(valid.value & ready.value):
            sIndex = loop3.streamArbiter_6_io_output_payload_stateIndex.value
            rIndex = loop3.streamArbiter_6_io_output_payload_roundIndex.value
            id = loop3.streamArbiter_6_io_output_payload_stateId.value
            loop3_file.write(f"id{int(id)} state_index:{int(sIndex)} round_index:{int(rIndex)}\n")
            if(id != id3):
                id3 = id
                print("loop 3 arbiter output: ")
                print(f"id:{int(id)}")
                print(f"state_index:{int(sIndex)}")
                print(f"round_index:{int(rIndex)}"+"\n")
        
        # transmitter Input
        valid = dut.transmitterInput_valid
        ready = dut.aXI4StreamTransmitter_1_io_input_ready
        if(valid.value & ready.value):
            trans_log.write(f"transmitter input id:{id}\n")
            id = int(dut.transmitterInput_payload_stateId.value)
            print(f"transmitter input id:{id}\n")
        




