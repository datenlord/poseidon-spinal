import basic
import constants
# poseidon hash function


def poseidon_hash(preimage):

    t = len(preimage) + 1
    if t not in basic.t_range:
        print("error: the length of preimage is incorrect")
        exit()

    roundf = basic.roundfull
    roundp = basic.roundpartial[t]
    
    round_constants = constants.generate_constants(t,roundf,roundp)
    

    state = basic.init_state(preimage)
    for i in range( int(roundf/2) ):
        state = basic.add_round_constants(state, round_constants[ i*t : (i+1)*t ])
        state = basic.s_boxes(state)
        state = basic.mds_mixing(state)

    for i in range(int(roundf/2), int(roundf/2+roundp)):
        
        state = basic.add_round_constants(state,round_constants[ i*t : (i+1)*t ])
        state[0] = basic.s_box(state[0])
        state = basic.mds_mixing(state)

    for i in range(int( roundf/2+roundp), int(roundf+roundp)):
        state = basic.add_round_constants(state,round_constants[i*t:(i+1)*t])
        state = basic.s_boxes(state)
        state = basic.mds_mixing(state)

    return state[1]
    
#print(poseidon_hash([0,1]))
print(hex(poseidon_hash([0,1,2,3,4,5,6,7])))
                        







