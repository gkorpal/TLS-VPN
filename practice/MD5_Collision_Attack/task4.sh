#!/usr/bin/env sh

gcc good_evil.c
./a.out

#use GHex to get values
head -c 4160 a.out > prefix
tail -c +4288 a.out > suffix

md5collgen -p prefix -o file1.bin file2.bin

tail -c 128 file1.bin > P
tail -c 128 file2.bin > Q

head -c 288 suffix > suffix_1
tail -c +416 suffix > suffix_2

chmod a+x a1.out a2.out
./a1.out
./a2.out
