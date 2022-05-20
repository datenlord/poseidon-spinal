import random
from poseidon_python.finite_field import PrimeField


class Context:
    size_range = [3, 5, 9, 12]
    round_map = {3: 63, 5: 64, 9: 65, 12: 65}
    modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001
    id_width = 8

    def check_parameter_range(round=0, index=0, size=3):

        assert size in Context.size_range, "input size is out of range"
        index_exception = (size == 5) & (index == 5)
        assert (index >= 0) & (
            (index < size) | index_exception
        ), "state_index is out of range"
        assert (round >= 0) & (
            round < Context.round_map[size]
        ), "round_index is out of range"

    def __init__(self, round=0, index=0, size=3, id=0,element=0):
        Context.check_parameter_range(round, index, size)

        self.round_index = round
        self.state_index = index
        self.state_size = size
        self.state_id = id % pow(2, Context.id_width)
        self.state_element = PrimeField(element)

    def set_rand_values(self):
        self.state_size = Context.size_range[random.randint(0, 3)]
        self.state_index = random.randint(0, self.state_size - 1)
        self.round_index = random.randint(0, Context.round_map[self.state_size] - 1)
        self.state_id = random.randint(0, pow(2, Context.id_width) - 1)
        self.state_element.value = random.randint(0, Context.modulus - 1)

    def set_rand_values(self, cases_num):
        self.state_size = Context.size_range[random.randint(0, 3)]
        self.state_index = random.randint(0, self.state_size - 1)
        self.round_index = random.randint(0, Context.round_map[self.state_size] - 1)
        self.state_id = cases_num % pow(2, Context.id_width)
        self.state_element.value = random.randint(0, Context.modulus - 1)

    def rand_state_element(self):
        self.state_element.value = random.randint(0, Context.modulus - 1)

    def check_context_equal(self, context):
        size_equal = self.state_size == context.state_size
        index_equal = self.state_index == context.state_index
        round_equal = self.round_index == context.round_index
        id_equal = self.state_id == context.state_id
        element_equal = self.state_element.value == context.state_element.value
        return size_equal & index_equal & round_equal & element_equal & id_equal

    def print_context_info(self):
        print(f"state_id:{self.state_id}")
        print(
            f"state_size:{self.state_size} state_index:{self.state_index} round_index:{self.round_index}"
        )
        print(f"state_element:{hex(self.state_element.value)}")

    def set_dut_ports(self, dut, prefix="io_input_payload_"):
        """set Context values to dut io ports"""
        exec(f"dut.{prefix}stateIndex.value = self.state_index")
        exec(f"dut.{prefix}roundIndex.value = self.round_index")
        exec(f"dut.{prefix}stateSize.value = self.state_size")
        exec(f"dut.{prefix}stateElement.value = self.state_element.value")
        exec(f"dut.{prefix}stateId.value = self.state_id")

    def get_dut_ports(self, dut, prefix="io_output_payload_"):
        """get Context values from dut io ports"""
        exec(f"self.state_index = int(dut.{prefix}stateIndex.value)")
        exec(f"self.round_index = int(dut.{prefix}roundIndex.value)")
        exec(f"self.state_size = int(dut.{prefix}stateSize.value)")
        exec(f"self.state_element.value = int(dut.{prefix}stateElement.value)")
        exec(f"self.state_id = int(dut.{prefix}stateId.value)")

    def get_context_vec(state_size=None, round_index=None, state_id=None):
        if state_id == None:
            id = random.randint(0, pow(2,Context.id_width)-1)
        else:
            id = state_id % pow(2, Context.id_width)
        
        if(state_size == None):
            size = Context.size_range[random.randint(0, 3)]
        else:
            size = state_size
        
        if(round_index == None):
            round = random.randint(0, Context.round_map[size] - 1)
        else:
            round = round_index

        context_vec = []
        for i in range(size):
            context_vec.append(Context(round, i, size, id))
            context_vec[i].rand_state_element()
        return context_vec


class MDSContext:
    size_range = [3, 5, 9, 12]
    round_map = {3: 63, 5: 64, 9: 65, 12: 65}
    elements_num = 12
    modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001
    id_width = 8

    def check_input_range(round, size):
        assert size in MDSContext.size_range, "state_size is out of range"
        assert (round >= 0) & (
            round < MDSContext.round_map[size]
        ), "round_index is out of range"


    def __init__(self, round=0, size=3, id=0):
        MDSContext.check_input_range(round, size)

        self.round_index = round
        self.state_size = size
        self.state_id = id % pow(2, MDSContext.id_width)
        self.state_elements = []
        for i in range(MDSContext.elements_num):
            self.state_elements.append(PrimeField(0))

    def rand_mds_context(self):
        self.state_size = MDSContext.size_range[random.randint(0, 3)]
        self.round_index = random.randint(0, MDSContext.round_map[self.state_size] - 1)
        self.state_id = random.randint(0, pow(2, MDSContext.id_width) - 1)
        for i in range(self.state_size):
            self.state_elements[i].value = random.randint(0, MDSContext.modulus - 1)

    def rand_state_elements(self):
        for i in range(self.state_size):
            self.state_elements[i].value = random.randint(0, MDSContext.modulus - 1)

    def check_context_equal(self, mds_context):
        size_equal = self.state_size == mds_context.state_size
        round_equal = self.round_index == mds_context.round_index
        id_equal = self.state_id == mds_context.state_id
        elements_equal = True
        for i in range(MDSContext.elements_num):
            elements_equal = elements_equal & (
                self.state_elements[i].value == mds_context.state_elements[i].value
            )
        return size_equal & round_equal & id_equal & elements_equal

    def print_context_info(self):
        print(f"state_id:{self.state_id}")
        print(f"state_size:{self.state_size} round_index:{self.round_index}")
        print("state_elements:")
        for element in self.state_elements:
            print(hex(element.value))

    def set_dut_ports(self, dut, prefix="io_input_payload_"):
        """set Context values to dut io ports"""
        exec(f"dut.{prefix}roundIndex.value = self.round_index")
        exec(f"dut.{prefix}stateSize.value = self.state_size")
        exec(f"dut.{prefix}stateId.value = self.state_id")
        for i in range(MDSContext.elements_num):
            exec(
                f"dut.{prefix}stateElements_{i}.value = self.state_elements[{i}].value"
            )

    def get_dut_ports(self, dut, prefix="io_output_payload_"):
        """get Context values from dut io ports"""
        exec(f"self.round_index = int(dut.{prefix}roundIndex.value)")
        exec(f"self.state_size  = int(dut.{prefix}stateSize.value)")
        exec(f"self.state_id = int(dut.{prefix}stateId.value)")
        for i in range(MDSContext.elements_num):
            exec(
                f"self.state_elements[i].value = int(dut.{prefix}stateElements_{i}.value)"
            )

    def get_context_vec():
        size = MDSContext.size_range[random.randint(0, 3)]
        round = random.randint(0, MDSContext.round_map[size] - 1)
        id = random.randint(0, pow(2, MDSContext.id_width) - 1)
        context_vec = []
        for i in range(size):
            context_vec.append(MDSContext(round, size, id))
            context_vec[i].rand_state_elements()
        if size == 5:
            context_vec.append(MDSContext(round, size, id))
        return context_vec

    def copy_state_elements(self, state_elements):
        for i in range(len(state_elements)):
            self.state_elements[i].value = state_elements[i].value


# simple tests
def test_Context():
    myContext = Context()
    myContext.set_rand_value()
    myContext.print_context_info()


def test_mdsContext():
    myContext = MDSContext()
    myContext.rand_mds_context()
    # myContext.rand_state_elements()
    myContext.print_context_info()
