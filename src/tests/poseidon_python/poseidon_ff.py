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


def transform_matrix(matrix):
    """transform int matrix into PrimeField matrix"""

    matrix_ff = []
    for array in matrix:
        matrix_ff.append(transform_array(array))
    return matrix_ff


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


def mds_mixing_ff(state_ff, mds_matrix_ff):

    new_state_ff = []
    for i in range(len(state_ff)):
        tmp = ff.PrimeField(0)
        for j in range(len(state_ff)):
            tmp.addassign(state_ff[j].mul(mds_matrix_ff[j][i]))
        new_state_ff.append(tmp)

    return new_state_ff


def sparse_mds_mixing(state_ff, w_vec, v_vec):
    new_state_ff = []
    temp = ff.PrimeField(0)
    for i in range(len(state_ff)):
        temp.addassign(state_ff[i].mul(w_vec[i]))

    new_state_ff.append(temp)

    for i in range(len(state_ff) - 1):
        temp = state_ff[0].mul(v_vec[i])
        temp.addassign(state_ff[i + 1])
        new_state_ff.append(temp)

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
    mds_matrix_ff = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(t))
    state_ff = transform_array(basic.PrimeFieldOps.init_state(preimage))

    for i in range(int(roundf / 2)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    for i in range(int(roundf / 2), int(roundf / 2 + roundp)):

        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff[0] = s_box_ff(state_ff[0])
        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    for i in range(int(roundf / 2 + roundp), int(roundf + roundp)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

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
    mds_matrix_ff = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(t))

    for i in range(int(roundf / 2)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    for i in range(int(roundf / 2), int(roundf / 2 + roundp)):

        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff[0] = s_box_ff(state_ff[0])
        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    for i in range(int(roundf / 2 + roundp), int(roundf + roundp)):
        state_ff = add_round_constants_ff(
            state_ff, round_constants_ff[i * t : (i + 1) * t]
        )
        state_ff = s_boxes_ff(state_ff)
        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    return state_ff[1]


def poseidon_hash_opt(preimage):
    """optimized poseidon hash function"""
    t = len(preimage) + 1
    assert t in basic.T_RANGE, "the length of preimage is out of range"

    roundf = basic.ROUNDFULL
    roundp = basic.ROUNDPARTIAL[t]

    state_ff = transform_array(basic.PrimeFieldOps.init_state(preimage))
    # read constants used in optimized poseidon from files
    cmp_constants, pre_sparse, w_hat, v_rest = read_constants_files(
        t, "./poseidon_constants"
    )
    cmp_constants_ff = transform_array(cmp_constants)
    pre_sparse_ff = transform_matrix(pre_sparse)
    sparse_w_ff = transform_matrix(w_hat)
    sparse_v_ff = transform_matrix(v_rest)
    mds_matrix_ff = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(t))

    # add pre round constants
    state_ff = add_round_constants_ff(state_ff, cmp_constants_ff[0:t])

    # implement the first half full round
    Rf = int(roundf / 2)
    for i in range(Rf):
        state_ff = s_boxes_ff(state_ff)
        state_ff = add_round_constants_ff(
            state_ff, cmp_constants_ff[(i + 1) * t : (i + 2) * t]
        )
        if i == (Rf - 1):
            state_ff = mds_mixing_ff(state_ff, pre_sparse_ff)
        else:
            state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    # implement optimized partial round
    for i in range(roundp):
        state_ff[0] = s_box_ff(state_ff[0])
        state_ff[0].addassign(cmp_constants_ff[(Rf + 1) * t + i])
        state_ff = sparse_mds_mixing(state_ff, sparse_w_ff[i], sparse_v_ff[i])

    # implement the second half full round
    base = (Rf + 1) * t + roundp  # compressed round constants base index
    for i in range(Rf):
        state_ff = s_boxes_ff(state_ff)

        if i < (Rf - 1):
            state_ff = add_round_constants_ff(
                state_ff, cmp_constants_ff[base : base + t]
            )
            base = base + t

        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    return state_ff[1].fromMont()


def poseidon_hash_opt_ff(state_ff):
    """optimized poseidon hash function"""
    t = len(state_ff)
    assert t in basic.T_RANGE, "the length of preimage is out of range"

    roundf = basic.ROUNDFULL
    roundp = basic.ROUNDPARTIAL[t]

    # read constants used in optimized poseidon from files
    cmp_constants, pre_sparse, w_hat, v_rest = read_constants_files(
        t, "../../poseidon_constants"
    )
    cmp_constants_ff = transform_array(cmp_constants)
    pre_sparse_ff = transform_matrix(pre_sparse)
    sparse_w_ff = transform_matrix(w_hat)
    sparse_v_ff = transform_matrix(v_rest)
    mds_matrix_ff = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(t))

    # add pre round constants
    state_ff = add_round_constants_ff(state_ff, cmp_constants_ff[0:t])

    # implement the first half full round
    Rf = int(roundf / 2)
    for i in range(Rf):
        state_ff = s_boxes_ff(state_ff)
        state_ff = add_round_constants_ff(
            state_ff, cmp_constants_ff[(i + 1) * t : (i + 2) * t]
        )
        if i == (Rf - 1):
            state_ff = mds_mixing_ff(state_ff, pre_sparse_ff)
        else:
            state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    # implement optimized partial round
    for i in range(roundp):
        state_ff[0] = s_box_ff(state_ff[0])
        state_ff[0].addassign(cmp_constants_ff[(Rf + 1) * t + i])
        state_ff = sparse_mds_mixing(state_ff, sparse_w_ff[i], sparse_v_ff[i])

    # implement the second half full round
    base = (Rf + 1) * t + roundp  # compressed round constants base index
    for i in range(Rf):
        state_ff = s_boxes_ff(state_ff)

        if i < (Rf - 1):
            state_ff = add_round_constants_ff(
                state_ff, cmp_constants_ff[base : base + t]
            )
            base = base + t

        state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

    return state_ff[1]


def read_pre_sparse_matrix(arity, path):
    file_path = path + f"/pre_sparse_matrix/pre_sparse_matrix_{arity}.txt"
    file = open(file_path, mode="r")
    pre_sparse_elements = file.readlines()
    pre_sparse_matrix = []
    for i in range(arity):
        pre_sparse_vec = []
        for j in range(arity):
            pre_sparse_vec.append(int(pre_sparse_elements[i * arity + j], 16))
        pre_sparse_matrix.append(pre_sparse_vec)
    file.close()
    return pre_sparse_matrix


def read_sparse_matrix(arity, path):
    file_path = path + f"/sparse_matrix/sparse_matrix_{arity}.txt"
    file = open(file_path, mode="r")
    sparse_matrix_elements = file.readlines()
    # w_hat is the first column of sparse matrix. It will be directly multiplied (scalar product) with a row of state elements.
    w_hat = []
    # v_rest contains all but the first (already included in `w_hat`).
    v_rest = []
    for i in range(basic.ROUNDPARTIAL[arity]):
        w_vec = []
        v_vec = []
        for j in range(2 * arity - 1):
            element = int(sparse_matrix_elements[i * (2 * arity - 1) + j], 16)
            if j < arity:
                w_vec.append(element)
            else:
                v_vec.append(element)
        w_hat.append(w_vec)
        v_rest.append(v_vec)
    file.close()
    return w_hat, v_rest


def read_constants_files(arity, path):
    """read constants used in optimized poseidon"""
    assert arity in basic.T_RANGE, "illegal parameter"
    # read compressed round constants from file
    file_path = (
        path + f"/compressed_round_constants/compressed_round_constants_{arity}.txt"
    )
    file = open(file_path, mode="r")
    cmp_round_constants = file.readlines()
    for i in range(len(cmp_round_constants)):
        cmp_round_constants[i] = int(cmp_round_constants[i], 16)
    file.close()

    # read pre sparse matrix from file
    pre_sparse_matrix = read_pre_sparse_matrix(arity, path)

    # read sparse matrix from file
    w_hat, v_rest = read_sparse_matrix(arity, path)

    return cmp_round_constants, pre_sparse_matrix, w_hat, v_rest


def print_random_cases(cases_num, state_size):
    """generate random test case and print"""
    for i in range(cases_num):
        state_elements = [ff.PrimeField(pow(2, state_size - 1) - 1)]
        for index in range(state_size - 1):
            # state_elements.append(ff.PrimeField(random.randint(0, basic.P-1)))
            state_elements.append(ff.PrimeField(index))

        print(f"random input {i}:")
        for element in state_elements:
            print(hex(element.value))

        ref_output = poseidon_hash_ff(state_elements)

        print(f"reference output {i}:")
        print(f"ref_outputs[{i}] = 255'h", hex(ref_output.fromMont()))


def write_random_cases(cases_num, state_size):
    """generate random test case and write to file"""
    # change directory and open target file
    os.mkdir("random_test_cases")
    os.chdir("random_test_cases")
    input_file = open(f"arity_{state_size}_inputs.txt", "w")
    output_file = open(f"arity_{state_size}_outputs.txt", "w")

    if state_size not in basic.T_RANGE:
        print("error: the length of preimage is incorrect")
        exit()

    roundf = basic.ROUNDFULL
    roundp = basic.ROUNDPARTIAL[state_size]

    round_constants_ff = transform_array(
        constants.generate_constants(state_size, roundf, roundp)
    )
    mds_matrix_ff = transform_matrix(basic.PrimeFieldOps.get_mds_matrix(state_size))

    for case_index in range(cases_num):
        state_ff = []
        print(f"random input {case_index}")
        for index in range(state_size):
            state_ff.append(ff.PrimeField(random.randint(0, basic.P - 1)))
            input_str = "{:#066X}".format(state_ff[index].value)
            input_file.write(input_str[2:] + "\n")

        for i in range(int(roundf / 2)):
            state_ff = add_round_constants_ff(
                state_ff, round_constants_ff[i * state_size : (i + 1) * state_size]
            )
            state_ff = s_boxes_ff(state_ff)
            state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

        for i in range(int(roundf / 2), int(roundf / 2 + roundp)):
            state_ff = add_round_constants_ff(
                state_ff, round_constants_ff[i * state_size : (i + 1) * state_size]
            )
            state_ff[0] = s_box_ff(state_ff[0])
            state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

        for i in range(int(roundf / 2 + roundp), int(roundf + roundp)):
            state_ff = add_round_constants_ff(
                state_ff, round_constants_ff[i * state_size : (i + 1) * state_size]
            )
            state_ff = s_boxes_ff(state_ff)
            state_ff = mds_mixing_ff(state_ff, mds_matrix_ff)

        print(f"reference output {case_index}")
        output_str = "{:#066X}".format(state_ff[1].value)
        output_file.write(output_str[2:] + "\n")

    input_file.close()
    output_file.close()


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
                output_str = hex(element.value)
                fileobject.write(output_str[2:] + "\n")

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
            output_str = hex(element.value)
            fileobject.write(output_str[2:] + "\n")
        fileobject.close()


def output_pre_sparse_matrix_ff():
    """get pre sparse matrix in Montgomery domain and write to files"""
    os.mkdir("./poseidon_constants/pre_sparse_matrix_ff")
    os.chdir("./poseidon_constants/pre_sparse_matrix_ff")

    for t in basic.T_RANGE:
        src_file = open(f"../pre_sparse_matrix/pre_sparse_matrix_{t}.txt", "r")
        dest_file = open(f"pre_sparse_matrix_ff_{t}.txt", "w")
        pre_sparse_elements = src_file.readlines()
        for element in pre_sparse_elements:
            element = ff.PrimeField(int(element, 16))
            output_str = hex(element.value)
            dest_file.write(output_str[2:] + "\n")
        dest_file.close()


def output_sparse_matrix_ff():
    os.mkdir("./poseidon_constants/sparse_matrix_ff")
    os.chdir("./poseidon_constants/sparse_matrix_ff")
    for t in basic.T_RANGE:
        src_file = open(f"../sparse_matrix/sparse_matrix_{t}.txt", "r")
        sparse_elements = src_file.readlines()
        if t <= 5:
            dest_file = open(f"sparse_matrix_ff_{t}.txt", "w")
            for i in range(basic.ROUNDPARTIAL[t]):
                element = ff.PrimeField(int(sparse_elements[i * (2 * t - 1)], 16))
                output_str = hex(element.value)
                dest_file.write(output_str[2:] + "\n")
                for j in range(t, 2 * t - 1):
                    element = ff.PrimeField(
                        int(sparse_elements[i * (2 * t - 1) + j], 16)
                    )
                    output_str = hex(element.value)
                    dest_file.write(output_str[2:] + "\n")
                for j in range(1, t):
                    element = ff.PrimeField(
                        int(sparse_elements[i * (2 * t - 1) + j], 16)
                    )
                    output_str = hex(element.value)
                    dest_file.write(output_str[2:] + "\n")
            dest_file.close()

        else:
            what_file = open(f"sparse_matrix_column_ff_{t}.txt", "w")
            vrest_file = open(f"sparse_matrix_row_ff_{t}.txt", "w")
            vec_len = 2 * t - 1
            for i in range(len(sparse_elements)):
                element = ff.PrimeField(int(sparse_elements[i], 16))
                output_str = hex(element.value)
                if i % vec_len == 0:
                    what_file.write(output_str[2:] + "\n")
                    vrest_file.write(output_str[2:] + "\n")
                elif i % vec_len < t:
                    what_file.write(output_str[2:] + "\n")
                else:
                    vrest_file.write(output_str[2:] + "\n")
            what_file.close()
            vrest_file.close()


def output_compressed_round_constants():
    """get compressed round constants in Montgomery domain and write to files"""
    os.mkdir("./poseidon_constants/compressed_round_constants_ff")
    os.chdir("./poseidon_constants/compressed_round_constants_ff")

    for t in basic.T_RANGE:
        Rf = int((basic.ROUNDFULL) / 2)
        roundp = basic.ROUNDPARTIAL[t]

        src_file = open(
            f"../compressed_round_constants/compressed_round_constants_{t}.txt", "r"
        )
        constants_elements = src_file.readlines()
        dest_file1 = open(f"pre_round_constants_ff_{t}.txt", "w")
        dest_file2 = open(f"full_round_constants_ff_{t}.txt", "w")
        dest_file3 = open(f"partial_round_constants_ff_{t}.txt", "w")
        for i in range(len(constants_elements)):
            element = ff.PrimeField(int(constants_elements[i], 16))
            output_str = hex(element.value)
            if i < t:
                dest_file1.write(output_str[2:] + "\n")
            elif i < (Rf + 1) * t:
                dest_file2.write(output_str[2:] + "\n")
            elif i < ((Rf + 1) * t + roundp):
                dest_file3.write(output_str[2:] + "\n")
            else:
                dest_file2.write(output_str[2:] + "\n")

        for i in range(t):
            dest_file2.write("0" * 64 + "\n")

        dest_file1.close()
        dest_file2.close()
        dest_file3.close()


# print(poseidon_hash([0,1,2,3]))
# print(poseidon_hash_opt([0,1,2,3]))
