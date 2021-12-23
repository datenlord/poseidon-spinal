from finite_field import PrimeField


def add(a, b):
    a.addassign(b)
    return a


c = PrimeField(10)
d = PrimeField(12)

c = add(c, d)

print(c.fromMont())
print(d.fromMont())

a = [1, 2, 3, 4, 5]
for i in range(len(a)):
    a[i] += 1

for element in a:
    element += 1
print(a)
