#!/usr/bin/env sh

echo "Message prefix" > prefix.txt
md5collgen -p prefix.txt -o out1.bin out2.bin
diff out1.bin out2.bin
md5sum out1.bin
md5sum out2.bin

echo "As part of a tutorial on honesty the teacher reads the booklet." > prefix64.txt
md5collgen -p prefix64.txt -o out01.bin out02.bin
diff out01.bin out02.bin
md5sum out01.bin
md5sum out02.bin
