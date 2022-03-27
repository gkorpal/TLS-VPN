#!/usr/bin/env sh

# known plaintext attack
echo -n "This is a known message!" > P1
C1=a469b1c502c1cab966965e50425438e1bb1b5f9037a4c159
C2=bf73bcd3509299d566c35b5d450337e1bb175f903fafc159
xor.py $C2 $(xor.py $(xxd -p P1) $C1) | xxd -r -p

# chosen plaintext attack
echo -n "Yes" > P1_guess
xxd -p P1_guess
xor.py 5965730d0d0d0d0d0d0d0d0d0d0d0d0d 3132333435363738393031323334353668574039383b3a35343d3c3f3e39383b
xor.py 68574039383b3a35343d3c3f3e39383b 313233343536373839303132333435375965730d0d0d0d0d0d0d0d0d0d0d0d0c
echo -n "5965730d0d0d0d0d0d0d0d0d0d0d0d0c" | xxd -r -p > P2
openssl enc -aes-128-cbc -e -in P2 -out C2 -K 00112233445566778899aabbccddeeff -iv 31323334353637383930313233343537
xxd -p C2
