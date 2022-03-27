#!/usr/bin/env sh

cat ciphertext.txt | awk 'BEGIN {FS=" "} {for (i=1; i<=NF; i++) print $i}' | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

cat ciphertext.txt | awk 'BEGIN {FS=" "} {for (i=1; i<=NF; i++) print $i}' | awk 'BEGIN {FS=""} {for (i=1; i<=(NF-1); i++) print $i $(i+1)}' | sort | uniq -c | sort -nr | head

cat ciphertext.txt | awk 'BEGIN {FS=" "} {for (i=1; i<=NF; i++) print $i}' |  awk 'BEGIN {FS=""} {for (i=1; i<=(NF-2); i++) print $i $(i+1) $(i+2)}' | sort | uniq -c | sort -nr | head

tr nyqhtu ETSRHN < ciphertext.txt

tr nyqhtuvmzxicb ETSRHNAIUOLMF < ciphertext.txt

tr nyqhtuvmzxicbagrsld ETSRHNAIUOLMFCBGKWY < ciphertext.txt

tr nyqhtuvmzxicbagrsldefjkopw ETSRHNAIUOLMFCBGKWYPVQXJDZ < ciphertext.txt
