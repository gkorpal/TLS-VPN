#!/usr/bin/env bash

echo -n 'I owe you $2000.' | xxd -p  # don't use double quotes with dollar sign
gcc task4.c -lcrypto -o task4
./task4

echo -n 'I owe you $3000.' | xxd -p
gcc task4.c -lcrypto -o task4  # replaced M in task4.c with new message hex code
./task4
