#!/usr/bin/env sh

diff out1.bin out2.bin
md5sum out1.bin
md5sum out2.bin
cat out1.bin out01.bin > out11.bin
cat out2.bin out01.bin > out21.bin
diff out11.bin out21.bin
md5sum out11.bin
md5sum out21.bin
