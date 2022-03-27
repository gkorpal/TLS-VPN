#!/usr/bin/env sh

openssl enc -aes-128-ecb -e -in plain.txt -out cipher-ecb.bin -K 00112233445566778899AABBCCDDEEFF
openssl enc -aes-128-ecb -d -in cipher-ecb.bin -out plain1.txt -K 00112233445566778899AABBCCDDEEFF
diff <(xxd plain.txt) <(xxd plain1.txt)

openssl enc -aes-128-cbc -e -in plain.txt -out cipher-cbc.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-cbc -d -in cipher-cbc.bin -out plain2.txt -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
diff <(xxd plain.txt) <(xxd plain2.txt)

openssl enc -aes-128-cfb -e -in plain.txt -out cipher-cfb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-cfb -d -in cipher-cfb.bin -out plain3.txt -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
diff <(xxd plain.txt) <(xxd plain3.txt)

openssl enc -aes-128-ofb -e -in plain.txt -out cipher-ofb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-ofb -d -in cipher-ofb.bin -out plain4.txt -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
diff <(xxd plain.txt) <(xxd plain4.txt)
