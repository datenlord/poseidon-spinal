import random
import basic
import finite_field as ff
import constants
import os

# poseidon hash function


def transform_array(array):
    """transform array of int into array of PrimeField"""
    array_ff = []
    for element in array:
        array_ff.append(ff.PrimeField(element))

    return array_ff


def s_box_ff(op1):
    op1.expassign(5)
    return op1


def s_boxes_ff(array):
    tmp = []
    for element in array:
        element.expassign(5)
        tmp.append(element)
    return tmp


def add_round_constants_ff(states_ff, constants_ff):

    for i in range(len(states_ff)):
        states_ff[i].addassign(constants_ff[i])

    return states_ff


def mds_mixing_ff(state_ff):
    # get mds_matrix and transform it to Primefield pattern
    mds_matrix = basic.PrimeFieldOps.get_mds_matrix(len(state_ff))
    mds_matrix_ff = []

    for element in mds_matrix:
        mds_matrix_ff.append(transform_array(element))

    new_state_ff = []
    for i in range(len(state_ff)):
        tmp = ff.PrimeField(0)
        for j in range(len(state_ff)):
            tmp.addassign(state_ff[j].mul(mds_matrix_ff[j][i]))
        new_state_ff.append(tmp)

    return new_state_ff


def poseidon_hash(preimage):

    t = len(preimage) + 1
    if t not in basic.T_RANGE:
        print("error: the length of preimage is incorrect")
        exit()

    roundf = basic.ROUNDFULL
    roundp = basic.ROUNDPARTIAL[t]

    round_constants_ff = transform_array(
        constants.generate_constants(t, roundf, roundp)
    )
    state_ff = transform_array(basic.PrimeFieldOps.init_state(preimage))

    for i in range(int(roundf / 2)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff)

    for i in range(int(roundf / 2), int(roundf / 2 + roundp)):

        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff[0] = s_box_ff(state_ff[0])
        state_ff = mds_mixing_ff(state_ff)

    for i in range(int(roundf / 2 + roundp), int(roundf + roundp)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff)

    return state_ff[1].fromMont()


def poseidon_hash_ff(state_ff):

    t = len(state_ff)
    if t not in basic.T_RANGE:
        print("error: the length of preimage is incorrect")
        exit()

    roundf = basic.ROUNDFULL
    roundp = basic.ROUNDPARTIAL[t]

    round_constants_ff = transform_array(
        constants.generate_constants(t, roundf, roundp)
    )

    for i in range(int(roundf / 2)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff)

    for i in range(int(roundf / 2), int(roundf / 2 + roundp)):

        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff[0] = s_box_ff(state_ff[0])
        state_ff = mds_mixing_ff(state_ff)

    for i in range(int(roundf / 2 + roundp), int(roundf + roundp)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff)

    return state_ff[1]


def print_random_cases(cases_num, state_size):
    ''' generate random test case and print '''
    for i in range(cases_num):
        state_elements = []
        print(f"random input {i}:")
        for index in range(state_size):
            state_elements.append(ff.PrimeField(random.randint(0, basic.P-1)))
            print(f"random_inputs[{i}][255*{index+1}-1:255*{index}] = 255'h", hex(state_elements[index].value))

        ref_output = poseidon_hash_ff(state_elements)

        print(f"reference output {i}:")
        print(f"ref_outputs[{i}] = 255'h", hex(ref_output.value))



def output_mds_matrix_ff():
    """get all mds_matrix in Montgomery domain and write to files"""
    os.mkdir("mds_matrixs_ff")
    os.chdir("mds_matrixs_ff")
    for t in basic.T_RANGE:
        # get mds matrix and transform to Montgomery domain
        mds_matrix = basic.PrimeFieldOps.get_mds_matrix(t)
        mds_matrix_ff = []
        for element in mds_matrix:
            mds_matrix_ff.append(transform_array(element))

        # write data to files
        fileobject = open("mds_matrix_ff_{}.txt".format(t), "w")
        for mds_vec in mds_matrix_ff:
            for element in mds_vec:
                fileobject.write(str(element.value) + "\n")

        fileobject.close()


def output_round_constants_ff():
    """get all round constants in Montgomery domain and write to files"""
    os.mkdir("round_constants_ff")
    os.chdir("round_constants_ff")
    for t in basic.T_RANGE:
        fileobject = open("round_constants_ff_{}.txt".format(t), "w")
        round_constants = transform_array(
            constants.generate_constants(t, basic.ROUNDFULL, basic.ROUNDPARTIAL[t])
        )
        for element in round_constants:
            fileobject.write(str(element.value) + "\n")
        fileobject.close()


print_random_cases(3,9)