from functools import partial
from importlib.util import set_loader
from multiprocessing import context
import random
from poseidon_python.finite_field import PrimeField


class Context:
    size_range = [3, 5, 9, 12]
    roundf = 8
    roundp_map = {3: 55, 5: 56, 9: 57, 12: 57}
    modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001
    id_width = 8

    def check_parameter_range(isFull, RF, RP, index, size):

        assert size in Context.size_range, "input size is out of range"
        if isFull:
            assert RF in range(Context.roundf), "full round is illegal"
            assert (index >= 0) & (index < size), "state_index is illegal"
        else:
            assert RF == (Context.roundf / 2 - 1), "full round is illegal"
            assert RP in range(Context.roundp_map[size]), "partial round is illegal"
            assert ((index == 0) & (size < 9)) | (
                (index < 2) & (size >= 9)
            ), "state_index is illegal"

    def __init__(self, isFull=True, RF=0, RP=0, index=0, size=3, id=0):
        Context.check_parameter_range(isFull, RF, RP, index, size)
        self.isFull = isFull
        self.full_round = RF
        self.partial_round = RP
        self.state_index = index
        self.state_size = size
        self.state_id = id % pow(2, Context.id_width)
        self.state_element = PrimeField(0)
        self.state_elements = []
        for i in range(11):
            self.state_elements.append(PrimeField(0))

    def set_rand_values(self, isFull=None, size=None, id=None):
        if isFull == None:
            self.isFull = bool(random.randint(0, 1))
        else:
            self.isFull = isFull
        if size == None:
            self.state_size = Context.size_range[random.randint(0, 3)]
        else:
            self.state_size = size
        if id == None:
            self.state_id = random.randint(0, pow(2, Context.id_width) - 1)
        else:
            self.state_id = id

        self.state_element.value = random.randint(0, Context.modulus - 1)
        if self.isFull:
            self.full_round = random.randint(0, Context.roundf - 1)
            self.state_index = random.randint(0, self.state_size - 1)
        else:
            self.full_round = 3
            self.partial_round = random.randint(
                0, Context.roundp_map[self.state_size] - 1
            )
            for i in range(self.state_size - 1):
                self.state_elements[i].value = random.randint(0, Context.modulus - 1)
            if self.state_size < 9:
                self.state_index = 0
            else:
                self.state_index = random.randint(0, 1)

    def rand_state_elements(self):
        self.state_element.value = random.randint(0, Context.modulus - 1)
        if not self.isFull:
            for i in range(self.state_size - 1):
                self.state_elements[i].value = random.randint(0, Context.modulus - 1)

    def check_context_equal(self, context):
        isFull_eq = self.isFull == context.isFull
        roundp_eq = self.partial_round == context.partial_round
        roundf_eq = self.full_round == context.full_round
        index_eq = self.state_index == context.state_index
        size_eq = self.state_size == context.state_size
        id_eq = self.state_id == context.state_id
        element_eq = self.state_element.value == context.state_element.value
        elements_eq = True
        for i in range(11):
            elements_eq = elements_eq & (
                self.state_elements[i].value == context.state_elements[i].value
            )
        return (
            isFull_eq
            & roundp_eq
            & roundf_eq
            & index_eq
            & size_eq
            & id_eq
            & element_eq
            & elements_eq
        )

    def print_context_info(self):
        print(f"state_id:{self.state_id}")
        print(f"state_size:{self.state_size} state_index:{self.state_index}")
        print(
            f"isFull:{self.isFull} roundf:{self.full_round} roundp:{self.partial_round}"
        )
        print(f"state_element:{hex(self.state_element.value)}")
        print("state_elements:")
        for i in range(11):
            print(hex(self.state_elements[i].value))

    def set_dut_ports(self, dut, prefix="io_input_payload_"):
        """set Context values to dut io ports"""
        exec(f"dut.{prefix}isFull.value = self.isFull")
        exec(f"dut.{prefix}fullRound.value = self.full_round")
        exec(f"dut.{prefix}partialRound.value = self.partial_round")
        exec(f"dut.{prefix}stateIndex.value = self.state_index")
        exec(f"dut.{prefix}stateSize.value = self.state_size")
        exec(f"dut.{prefix}stateID.value = self.state_id")
        exec(f"dut.{prefix}stateElement.value = self.state_element.value")
        for i in range(11):
            exec(
                f"dut.{prefix}stateElements_{i}.value = self.state_elements[{i}].value"
            )

    def get_dut_ports(self, dut, prefix="io_output_payload_"):
        """get Context values from dut io ports"""
        exec(f"self.isFull = dut.{prefix}isFull.value")
        exec(f"self.full_round = int(dut.{prefix}fullRound.value)")
        exec(f"self.partial_round = int(dut.{prefix}partialRound.value)")
        exec(f"self.state_index = int(dut.{prefix}stateIndex.value)")
        exec(f"self.state_size = int(dut.{prefix}stateSize.value)")
        exec(f"self.state_id = int(dut.{prefix}stateID.value)")
        exec(f"self.state_element.value = int(dut.{prefix}stateElement.value)")
        for i in range(11):
            exec(
                f"self.state_elements[{i}].value = int(dut.{prefix}stateElements_{i}.value)"
            )

    def copy_state_elements(self, context):
        self.state_element.value = context.state_element.value
        for i in range(11):
            self.state_elements[i].value = context.state_elements[i].value

    def get_context_vec(isFull=None, size=None, id=None, RF=None, RP=None):
        if isFull == None:
            isFull = bool(random.randint(0, 1))
        else:
            isFull = isFull

        if size == None:
            size = Context.size_range[random.randint(0, 3)]
        else:
            size = size

        if id == None:
            id = random.randint(0, pow(2, Context.id_width) - 1)
        else:
            id = id % pow(2, Context.id_width)

        context_vec = []
        if isFull:
            if RF == None:
                full_round = random.randint(0, Context.roundf - 1)
            else:
                full_round = RF
            for i in range(size):
                context_vec.append(Context(isFull, full_round, 0, i, size, id))
                context_vec[i].rand_state_elements()
        else:
            full_round = int(Context.roundf / 2 - 1)
            if RP == None:
                partial_round = random.randint(0, Context.roundp_map[size] - 1)
            else:
                partial_round = RP
            if size < 9:
                context_vec.append(
                    Context(isFull, full_round, partial_round, 0, size, id)
                )
                context_vec[0].rand_state_elements()
            else:
                context_vec.append(
                    Context(isFull, full_round, partial_round, 0, size, id)
                )
                context_vec.append(
                    Context(isFull, full_round, partial_round, 1, size, id)
                )
                context_vec[0].rand_state_elements()
                context_vec[1].copy_state_elements(context_vec[0])

        return context_vec


class MDSContext:
    size_range = [3, 5, 9, 12]
    roundf = 8
    roundp_map = {3: 55, 5: 56, 9: 57, 12: 57}
    elements_num = 12
    modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001
    id_width = 8

    def check_input_range(isFull, RF, RP, size):
        assert size in MDSContext.size_range, "size is illegal"
        if isFull:
            assert (RP == 0) | (
                RP == (MDSContext.roundp_map[size] - 1)
            ), "partial round is illegal"
            assert RF in range(MDSContext.roundf), "full round is illegal"
        else:
            assert RF == (MDSContext.roundf / 2 - 1), "full round is illegal"
            assert RP in range(MDSContext.roundp_map[size]), "partial round is illegal"

    def __init__(self, isFull=True, RF=0, RP=0, size=3, id=0):
        MDSContext.check_input_range(isFull, RF, RP, size)

        self.isFull = isFull
        self.full_round = RF
        self.partial_round = RP
        self.state_size = size
        self.state_id = id % pow(2, MDSContext.id_width)
        self.state_elements = []
        for i in range(MDSContext.elements_num):
            self.state_elements.append(PrimeField(0))

    def rand_mds_context(self, isFull=None, size=None, id=None):
        if isFull == None:
            self.isFull = bool(random.randint(0, 1))
        else:
            self.isFull = isFull

        if size == None:
            self.state_size = MDSContext.size_range[random.randint(0, 3)]
        else:
            self.state_size = size

        if id == None:
            self.state_id = random.randint(0, pow(2, MDSContext.id_width) - 1)
        else:
            self.state_id = id % pow(2, MDSContext.id_width)

        for i in range(self.state_size):
            self.state_elements[i].value = random.randint(0, MDSContext.modulus - 1)

        if self.isFull:
            self.full_round = random.randint(0, MDSContext.roundf - 1)
        else:
            self.full_round = int(MDSContext.roundf / 2 - 1)
            self.partial_round = random.randint(
                0, MDSContext.roundp_map[self.state_size] - 1
            )

    def rand_state_elements(self):
        for i in range(self.state_size):
            self.state_elements[i].value = random.randint(0, MDSContext.modulus - 1)

    def check_context_equal(self, mds_context):
        isFull_eq = self.isFull == mds_context.isFull
        roundf_eq = self.full_round == mds_context.full_round
        roundp_eq = self.partial_round == mds_context.partial_round
        size_eq = self.state_size == mds_context.state_size
        id_eq = self.state_id == mds_context.state_id
        elements_eq = True
        for i in range(self.state_size):
            elements_eq = elements_eq & (
                self.state_elements[i].value == mds_context.state_elements[i].value
            )
        return isFull_eq & roundf_eq & roundp_eq & size_eq & id_eq & elements_eq

    def print_context_info(self):
        print(f"state_id:{self.state_id}")
        print(f"state_size:{self.state_size}")
        print(
            f"isFull:{self.isFull} roundf:{self.full_round} roundp:{self.partial_round}"
        )
        print("state_elements:")
        for i in range(MDSContext.elements_num):
            print(hex(self.state_elements[i].value))

    def set_dut_ports(self, dut, prefix="io_input_payload_"):
        """set Context values to dut io ports"""
        exec(f"dut.{prefix}isFull.value = self.isFull")
        exec(f"dut.{prefix}fullRound.value = self.full_round")
        exec(f"dut.{prefix}partialRound.value = self.partial_round")
        exec(f"dut.{prefix}stateSize.value = self.state_size")
        exec(f"dut.{prefix}stateID.value = self.state_id")
        for i in range(MDSContext.elements_num):
            exec(
                f"dut.{prefix}stateElements_{i}.value = self.state_elements[{i}].value"
            )

    def get_dut_ports(self, dut, prefix="io_output_payload_"):
        """get Context values from dut io ports"""
        exec(f"self.isFull = dut.{prefix}isFull.value")
        exec(f"self.full_round = int(dut.{prefix}fullRound.value)")
        exec(f"self.partial_round = int(dut.{prefix}partialRound.value)")
        exec(f"self.state_size = int(dut.{prefix}stateSize.value)")
        exec(f"self.state_id = int(dut.{prefix}stateID.value)")
        for i in range(MDSContext.elements_num):
            exec(
                f"self.state_elements[i].value = int(dut.{prefix}stateElements_{i}.value)"
            )

    def get_context_vec(isFull=None, size=None, id=None):
        if isFull == None:
            isFull = bool(random.randint(0, 1))
        else:
            isFull = isFull
        if size == None:
            size = MDSContext.size_range[random.randint(0, 3)]
        else:
            size = size
        if id == None:
            id = random.randint(0, pow(2, MDSContext.id_width) - 1)
        else:
            id = id % pow(2, MDSContext.id_width)

        context_vec = []
        if isFull:
            roundf = random.randint(0, MDSContext.roundf - 1)
            for i in range(size):
                context_vec.append(MDSContext(isFull, roundf, 0, size, id))
                context_vec[i].rand_state_elements()
        else:
            roundf = int(MDSContext.roundf / 2 - 1)
            roundp = random.randint(0, MDSContext.roundp_map[size] - 1)
            if size >= 9:
                context_vec.append(MDSContext(isFull, roundf, roundp, size, id))
                context_vec[0].rand_state_elements()
                context_vec.append(MDSContext(isFull, roundf, roundp, size, id))
                context_vec[1].rand_state_elements()
            else:
                context_vec.append(MDSContext(isFull, roundf, roundp, size, id))
                context_vec[0].rand_state_elements()
                for i in range(size, 2 * size - 1):
                    context_vec[0].state_elements[i].value = random.randint(
                        0, MDSContext.modulus - 1
                    )

        return context_vec

    def copy_state_elements(self, state_elements):
        for i in range(len(state_elements)):
            self.state_elements[i].value = state_elements[i].value


# simple tests
def test_Context():
    myContext = Context()
    myContext.set_rand_values()
    myContext.print_context_info()


def test_mdsContext():
    myContext = MDSContext()
    myContext.rand_mds_context()
    # myContext.rand_state_elements()
    myContext.print_context_info()
