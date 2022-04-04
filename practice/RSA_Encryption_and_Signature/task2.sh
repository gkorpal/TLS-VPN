#!/usr/bin/env bash

echo -n "A top secret!" | xxd -p
gcc task2.c -lcrypto -o task2
./task2
