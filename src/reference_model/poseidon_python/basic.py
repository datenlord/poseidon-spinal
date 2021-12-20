import math
import os

# Poseidon Parameters

p = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
M = 128
t_range = {3,5,9,12}
s_box_exp = 5

roundfull = 8
roundpartial = {3:55, 5:56, 9:57, 12:57}


# prime field element arithmetic operation

def add(op1, op2):
    return (op1 + op2) % p


def mul(op1, op2):
    return (op1 * op2) % p


def s_box(op1):
    tmp = 1
    for i in range(s_box_exp):
        tmp = mul(tmp,op1)
    return tmp


def s_boxes(op1_list):
    tmp = []
    for i in op1_list:
        tmp.append(s_box(i))
    return tmp


def add_round_constants( state , constant ):
    tmp = []
    for i in range(len(state)):
        tmp.append( add(state[i],constant[i]) )
    return tmp

def init_state(preimage):
    '''get initial state from preimage'''
    domain_tag = [pow(2,len(preimage))-1]
    return domain_tag + preimage


def get_inverse(x):
    ''' get the modular inverse of x (mod p ) '''
    ''' the inverse of x equals to pow(x,p-2) mod p '''
    p_bin = bin(p-2)[2:]
    inverse = 1
    tmp = x % p
    for i in range(len(p_bin)):
        if p_bin[len(p_bin)-i-1]=='1':
            inverse = (inverse * tmp)%p
        tmp = (tmp * tmp)%p
    
    return inverse


def get_mds_matrix(t):

    mds_x = range(0,t)
    mds_y = range(t,2*t)
    mds_matrix = []

    for x in mds_x:
        mds_vec = []
        for y in mds_y:
            mds_vec.append( get_inverse( x+y ) )
        mds_matrix.append(mds_vec)
    
    return mds_matrix


    

def mds_mixing(state):
    t = len(state)
    new_state = []
    mds_matrix = get_mds_matrix(t)
    for i in range(t):
        tmp = 0
        for j in range(t):
            tmp = add( mul( state[j], mds_matrix[j][i] ) , tmp )
        new_state.append(tmp)

    return new_state


def output_mds_matrixs():
    '''generate mds_matrixs and write to files'''
    os.mkdir("mds_matrixs")
    os.chdir("mds_matrixs")
    for t in t_range:
        mds_matrix = get_mds_matrix(t)
        fileobject = open("mds_matrix_{}.txt".format(t),"w")
        for mds_vec in mds_matrix:
            for element in mds_vec:
                fileobject.write(str(element)+'\n')
        
        fileobject.close()
    
                



