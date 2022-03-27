#!/usr/bin/env sh

gcc print_array.c
head -c 4160 a.out > prefix
tail -c +4288 a.out > suffix
md5collgen -p prefix -o file1.bin file2.bin
tail -c 128 file1.bin > P
tail -c 128 file2.bin > Q
cat prefix P suffix > a1.out
cat prefix Q suffix > a2.out
diff a1.out a2.out
md5sum a1.out
md5sum a2.out
chmod a+x a1.out a2.out
./a1.out
./a2.out
