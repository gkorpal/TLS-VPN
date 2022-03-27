#!/usr/bin/env sh

openssl enc -aes-128-ecb -e -in pic_original.bmp -out pic_encrypted_ecb.bmp -K 00112233445566778889aabbccddeeff
head -c 54 pic_original.bmp > header
tail -c +55 pic_encrypted_ecb.bmp > body-ecb
cat header body-ecb > new_encrypted_ecb.bmp

openssl enc -aes-128-cbc -e -in pic_original.bmp -out pic_encrypted_cbc.bmp -K 00112233445566778889aabbccddeeff -iv 0102030405060708
head -c 54 pic_original.bmp > header
tail -c +55 pic_encrypted_cbc.bmp > body-cbc
cat header body-cbc > new_encrypted_cbc.bmp

openssl enc -aes-128-ecb -e -in snail.bmp -out snail_encrypted_ecb.bmp -K 00112233445566778889aabbccddeeff
head -c 54 snail.bmp > header
tail -c +55 snail_encrypted_ecb.bmp > body-ecb
cat header body-ecb > new_snail_ecb.bmp

openssl enc -aes-128-cbc -e -in snail.bmp -out snail_encrypted_cbc.bmp -K 00112233445566778889aabbccddeeff -iv 0102030405060708
head -c 54 snail.bmp > header
tail -c +55 snail_encrypted_cbc.bmp > body-cbc
cat header body-cbc > new_snail_cbc.bmp
