import math
import logging

P = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001
RWIDTH = 256

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s %(name)s %(levelname)s %(message)s",
    datefmt="%Y-%m-%d  %H:%M:%S %a",
)


def get_gcd(a, b):
    """get the greatest common divisor of a and b"""
    if a == 0:
        return b
    if b == 0:
        return a

    if a < b:
        return get_gcd(a, b % a)
    else:
        return get_gcd(b, a % b)


def getxy(a, b):
    """x*a + y*b = gcd(a,b)"""
    """ input requirement: a > b """
    """ get x for a and y for b"""
    remainder = a % b
    k = a // b

    if b % remainder == 0:
        return 1, -k
    else:
        x1, y1 = getxy(b, remainder)
        return y1, y1 * (-k) + x1


def get_modular_inverse(x, modulus):
    """get the inverse of x mod modulus"""
    """ if the inverse don't exit return 0"""
    if get_gcd(x, modulus) != 1:
        return 0
    else:
        x, y = getxy(x, modulus)
        return (x + modulus) % modulus


class PrimeField:
    N = 0
    R_WIDTH = 0
    R = 0
    N1 = 0

    def toMont(self, x):
        """transform x to montgomery format"""
        return (x << self.R_WIDTH) % self.N

    def __init__(self, value, n=P):
        self.N = n
        self.R_WIDTH = RWIDTH
        self.R = pow(2, self.R_WIDTH)
        x, y = getxy(self.R, self.N)
        self.N1 = -y
        self.value = self.toMont(value)

    def MonPro(self, op1, op2):
        """Montgomery product"""
        t = op1 * op2 % self.R
        m = t * self.N1 % self.R
        u = (op1 * op2 + m * self.N) >> self.R_WIDTH

        while u >= self.N:
            u -= self.N
        return u

    def ModAdd(self, op1, op2):
        tmp = op1 + op2
        while tmp > self.N:
            tmp -= self.N
        return tmp

    def ModExp(self, x, exp):
        """compute pow(x,exp) mod N in Montgomery pattern"""
        exp_bin = bin(exp)[2:]
        tmp = (1 * self.R) % self.N
        for i in exp_bin:
            tmp = self.MonPro(tmp, tmp)
            if i == "1":
                tmp = self.MonPro(x, tmp)
        return tmp

    def expassign(self, exp):
        """self = pow(self,exp)"""
        self.value = self.ModExp(self.value, exp)

    def addassign(self, op1):
        """self = self + op1"""
        assert self.N == op1.N
        self.value = self.ModAdd(self.value, op1.value)

    def mulassign(self, op1):
        """self = self * op1"""
        assert self.N == op1.N
        self.value = self.MonPro(self.value, op1.value)

    def fromMont(self):
        """transform Montgomery pattern into regular pattern"""
        return self.MonPro(self.value, 1)

    def add(self, op1):
        """return op1 + self"""
        assert self.N == op1.N
        tmp = PrimeField(0, self.N)
        tmp.value = self.ModAdd(self.value, op1.value)
        return tmp

    def mul(self, op1):
        """return self * op1"""
        assert self.N == op1.N
        tmp = PrimeField(0, self.N)
        tmp.value = self.MonPro(self.value, op1.value)
        return tmp


# test
def test_mul():
    p1 = PrimeField(100)
    p2 = PrimeField(999)
    p3 = PrimeField(1234567890)

    print(hex(p1.value))
    print(hex(p1.N1))
    print(hex(p1.R))

    p1.mulassign(p2)
    assert (
        p1.fromMont() == (100 * 999) % p1.N
    ), "the result of p1.mulassign(p2) is wrong."
    p2.mulassign(p3)
    assert (
        p2.fromMont() == (999 * 1234567890) % p2.N
    ), "the result of p2.mulassign(p3) is wrong."

    logging.info("pass mul test!!")


def test_add():
    a = 9870765432
    b = 4567432198765430
    c = 3421987654320
    p1 = PrimeField(a)
    p2 = PrimeField(b)
    p3 = PrimeField(c)

    p1.addassign(p2)
    p2.addassign(p3)
    assert p1.fromMont() == (a + b) % p1.N, "the result of p1.addassign(p2) is wrong."
    assert p2.fromMont() == (b + c) % p1.N, "the result of p2.addassign(p3) is wrong."

    logging.info("pass add test")


def test_exp():
    a = 65439870654
    p1 = PrimeField(a)
    p1.expassign(8)
    assert p1.fromMont() == pow(a, 8) % p1.N, "the result of p1.expassign(8) is wrong."

    logging.info("pass exp test!!")
