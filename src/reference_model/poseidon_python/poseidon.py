import basic
import constants

# poseidon hash function


def poseidon_hash(preimage):

    t = len(preimage) + 1
    if t not in basic.T_RANGE:
        print("error: the length of preimage is incorrect")
        exit()

    roundf = basic.ROUNDFULL
    roundp = basic.ROUNDPARTIAL[t]

    round_constants = constants.generate_constants(t, roundf, roundp)

    state = basic.PrimeFieldOps.init_state(preimage)
    for i in range(int(roundf / 2)):
        state = basic.PrimeFieldOps.add_round_constants(
            state, round_constants[i * t : (i + 1) * t]
        )
        state = basic.PrimeFieldOps.s_boxes(state)
        state = basic.PrimeFieldOps.mds_mixing(state)

    for i in range(int(roundf / 2), int(roundf / 2 + roundp)):

        state = basic.PrimeFieldOps.add_round_constants(
            state, round_constants[i * t : (i + 1) * t]
        )
        state[0] = basic.PrimeFieldOps.s_box(state[0])
        state = basic.PrimeFieldOps.mds_mixing(state)

    for i in range(int(roundf / 2 + roundp), int(roundf + roundp)):
        state = basic.PrimeFieldOps.add_round_constants(
            state, round_constants[i * t : (i + 1) * t]
        )
        state = basic.PrimeFieldOps.s_boxes(state)
        state = basic.PrimeFieldOps.mds_mixing(state)

    return state[1]
