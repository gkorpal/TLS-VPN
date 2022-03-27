#!/usr/bin/env sh

echo -n "12345" > 5bytes.txt
echo -n "1234567890" > 10bytes.txt
echo -n "1234567890123456" > 16bytes.txt

openssl enc -aes-128-ecb -e -in 5bytes.txt -out 5bytes_ecb.bin -K 00112233445566778889aabbccddeeff
openssl enc -aes-128-ecb -e -in 10bytes.txt -out 10bytes_ecb.bin -K 00112233445566778889aabbccddeeff
openssl enc -aes-128-ecb -e -in 16bytes.txt -out 16bytes_ecb.bin -K 00112233445566778889aabbccddeeff

openssl enc -aes-128-cbc -e -in 5bytes.txt -out 5bytes_cipher.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-cbc -e -in 10bytes.txt -out 10bytes_cipher.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-cbc -e -in 16bytes.txt -out 16bytes_cipher.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f

openssl enc -aes-128-cfb -e -in 5bytes.txt -out 5bytes_cfb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-cfb -e -in 10bytes.txt -out 10bytes_cfb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-cfb -e -in 16bytes.txt -out 16bytes_cfb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
 
openssl enc -aes-128-ofb -e -in 5bytes.txt -out 5bytes_ofb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-ofb -e -in 10bytes.txt -out 10bytes_ofb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
openssl enc -aes-128-ofb -e -in 16bytes.txt -out 16bytes_ofb.bin -K 00112233445566778899AABBCCDDEEFF -iv 0102030405060708090a0b0c0d0e0f
