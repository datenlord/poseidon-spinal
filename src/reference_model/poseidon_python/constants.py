from asyncio import constants
import basic
import os


def int_to_bin(num_int, length):
    """convert int to binary string of given length"""
    num_str = bin(num_int)[2:]
    str_len = len(num_str)
    if length <= str_len:
        return num_str[str_len - length : str_len]
    else:
        return num_str.zfill(length)


def xor_bit(bit1, bit2):
    """xor operation on char"""
    if bit1 == bit2:
        return "0"
    else:
        return "1"


def shift_and_add(grainstate, bit):
    return (grainstate + bit)[1:]


def get_new_bit(grainstate):
    tmp = xor_bit(grainstate[0], grainstate[13])
    tmp = xor_bit(tmp, grainstate[23])
    tmp = xor_bit(tmp, grainstate[38])
    tmp = xor_bit(tmp, grainstate[51])
    tmp = xor_bit(tmp, grainstate[62])
    return tmp


def generate_constants(t, r_f, r_p):
    """generate roundconstants for Filecoin's poseidon"""
    num_contants = (r_f + r_p) * t

    FieldBits = int_to_bin(num_int=1, length=2)
    SboxBits = int_to_bin(num_int=1, length=4)
    FieldSizeBits = int_to_bin(num_int=255, length=12)
    tBits = int_to_bin(t, 12)
    RfBits = int_to_bin(r_f, 10)
    RpBits = int_to_bin(r_p, 10)
    padBits = 30 * "1"

    GrainState = (
        FieldBits + SboxBits + FieldSizeBits + tBits + RfBits + RpBits + padBits
    )

    for i in range(160):
        tmp_bit = get_new_bit(GrainState)
        GrainState = shift_and_add(GrainState, tmp_bit)

    RoundConstants = []

    while len(RoundConstants) < num_contants:
        tmp_bits = str()
        while len(tmp_bits) < 255:
            bit1 = get_new_bit(GrainState)
            GrainState = shift_and_add(GrainState, bit1)
            bit2 = get_new_bit(GrainState)
            GrainState = shift_and_add(GrainState, bit2)
            if bit1 == "1":
                tmp_bits = tmp_bits + bit2
        c = int(tmp_bits, 2)
        if c < basic.P:
            RoundConstants.append(c)

    return RoundConstants


def output_round_constants():
    """generate round constants and write to files"""

    os.mkdir("round_constants")
    os.chdir("round_constants")
    for t in basic.T_RANGE:
        fileobject = open("round_constants_{}.txt".format(t), "w")
        round_constants = generate_constants(t, basic.ROUNDFULL, basic.ROUNDPARTIAL[t])
        for element in round_constants:
            output_str = hex(element)
            fileobject.write(output_str[2:] + "\n")
        fileobject.close()
