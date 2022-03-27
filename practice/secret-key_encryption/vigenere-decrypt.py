#!/usr/bin/env python3

from sys import argv
from numpy import mod

script, first, second = argv

cn = len(first)
kn = len(second)
cl = [ord(x)-65 for x in first]
kl = [ord(x)-65 for x in second]
pl = [mod(cl[i]-kl[mod(i, kn)], 26) for i in range(cn)]
final = ''.join([chr(int(x)+65) for x in pl])
print(final)
