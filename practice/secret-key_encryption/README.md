Useful Linux Commands:

`cat`: Used to concatenate files and print them on the screen.

`tr`: replace certain characters in a file

`grep`: Searches input files for a given pattern and displays the relevant lines
grep can also be used to get frequency of letters or phrases, e.g:
```
grep –o xxx file.txt | uniq –ic
```

`touch`: create a file.

`echo`: send input string(s) to standard output, either save to a file or display text on the screen. E.g.,
```
echo –n “string” > file.txt
```

`gedit`: a text editor to edit the files (can be easier to use than bless).

`xxd`: command line hex viewing tool, allows you to observe the contents of the file in hexadecimal format (as the data may not be directly printable). xxd –p filename allows you to view the file contents in plain hex values without the formatting.
xxd can also be used to convert the ASCII representation of hex values to actual binary content, e.g.:
```
xxd –r –p hexfile.txt > binaryfile.txt
```

`ghex`: open a file using the hex editor to manually change bits in a file.

The task 6.3 asks you to determine P1 (either Yes or No). What is known to the adversary is C1, and you need to construct another plaintext P2 whose corresponding C2 is also available to you (by encrypting it yourself with the key), as well as the knowledge of IV1 and IV2. With all this information (C1, P2, C2 and IVs) you need to find a way to determine what is P1. The key point here is how to construct P2 from P1 and the IVs which are predictable. Exploit the structure of CBC mode (specifically the XOR operation).

Note that, it is important to know what is the padding format added by the CBC algorithm in `openssl`, otherwise you will not obtain the correct result. The padding is NOT 00 but it is 0D repeated in hex (until reaching the block length). If you want to recover and confirm the padding you should try decryption with the -nopad option. You then take you guessed plaintext P2 and ask Bob to encrypt it with the knowledge of IV2 given in the lab, to see whether the ciphertext is the same as C1. Make sure to have -nosalt at the end of the encryption command. Make sure that the key, IVs, and the ciphertexts are all represented in hex or binary format. Plaintexts need to be converted from ASCII code into hex or binary first.
