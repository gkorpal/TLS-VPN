#!/usr/bin/env bash

SECONDS=0

gcc task2.c -o task2
./task2 > keys.txt

input="./keys.txt"
while IFS= read -r line
do
  cipher="$(echo -n '255044462d312e350a25d0d4c5d80a34' | xxd -r -p | \ 
  openssl aes-128-cbc -nopad -e -K  $line -iv 09080706050403020100A2B2C2D2E2F2 -nosalt | xxd -p)"
  if [ "$cipher" == "d06bf9d0dab8e8ef880660d2af65aa82" ]
  then
    echo "The key is $line"
    break
  fi
done < "$input"

duration=$SECONDS
echo "Total time elapsed: $(($duration / 60)) minutes and $(($duration % 60)) seconds."
