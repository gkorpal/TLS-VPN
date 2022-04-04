#!/usr/bin/env bash

gcc task3.c -lcrypto -o task3
./task3
echo -n 50617373776F72642069732064656573 | xxd -r -p
