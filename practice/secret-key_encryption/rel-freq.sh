#!/usr/bin/env sh


# frequency tables for k=2

cat c5.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i=i+2) printf $i}' > c511.txt
total=$(tr -d '\n' < c511.txt | wc -c)
cat c511.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c511_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=2; i<=NF; i=i+2) printf $i}' > c512.txt
total=$(tr -d '\n' < c512.txt | wc -c)
cat c512.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \ 
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c512_rel_freq.txt


# frequency tables for k=3

cat c5.txt| awk 'BEGIN {FS=""} {for (i=1; i<=NF; i=i+3) printf $i}' > c521.txt
total=$(tr -d '\n' < c521.txt | wc -c)
cat c521.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c521_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=2; i<=NF; i=i+3) printf $i}' > c522.txt
total=$(tr -d '\n' < c522.txt | wc -c)
cat c522.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c522_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=3; i<=NF; i=i+3) printf $i}' > c523.txt
total=$(tr -d '\n' < c523.txt | wc -c)
cat c523.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c523_rel_freq.txt


# frequency tables for k=4

cat c5.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i=i+4) printf $i}' > c531.txt
total=$(tr -d '\n' < c531.txt | wc -c)
cat c531.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c531_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=2; i<=NF; i=i+4) printf $i}' > c532.txt
total=$(tr -d '\n' < c532.txt | wc -c)
cat c532.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c532_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=3; i<=NF; i=i+4) printf $i}' > c533.txt
total=$(tr -d '\n' < c533.txt | wc -c)
cat c533.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c533_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=4; i<=NF; i=i+4) printf $i}' > c534.txt
total=$(tr -d '\n' < c534.txt | wc -c)
cat c534.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c534_rel_freq.txt


# frequency tables for k=5

cat c5.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i=i+5) printf $i}' > c541.txt
total=$(tr -d '\n' < c541.txt | wc -c)
cat c541.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \ 
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c541_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=2; i<=NF; i=i+5) printf $i}' > c542.txt
total=$(tr -d '\n' < c542.txt | wc -c)
cat c542.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \ 
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c542_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=3; i<=NF; i=i+5) printf $i}' > c543.txt
total=$(tr -d '\n' < c543.txt | wc -c)
cat c543.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \ 
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c543_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=4; i<=NF; i=i+5) printf $i}' > c544.txt
total=$(tr -d '\n' < c544.txt | wc -c)
cat c544.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \ 
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c544_rel_freq.txt

cat c5.txt | awk 'BEGIN {FS=""} {for (i=5; i<=NF; i=i+5) printf $i}' > c545.txt
total=$(tr -d '\n' < c545.txt | wc -c)
cat c545.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | \ 
> awk '{printf("%6.5f %s\n", $1/'${total}', $2)}' | sort -k2 > c545_rel_freq.txt
