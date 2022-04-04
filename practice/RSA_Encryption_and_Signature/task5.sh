#!/usr/bin/env bash

echo -n 'Launch a missile.' | xxd -u -p
gcc task5.c -lcrypto -o task5
./task5

gcc task5.c -lcrypto -o task5 # after changing 2F to 3F in S in task5.c
./task5
