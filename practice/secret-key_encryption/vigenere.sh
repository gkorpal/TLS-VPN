#!/usr/bin/env sh

echo -n "OBRGXIMYAZZAWCATBNMUYYHAZNVGFCXPVVSIJSVLKIFAVGBIECAZSBWGRGRQWUCHMMOCYE
FLGQQNKFSHQMGYALNKCIJQVEKVWXNFOYFYQBESGOYTXMAYTXSISNBPMSGOJBKFWRUTTMLS
BNQMLLRGFNZUAWHZLBRVZGHUVZMCKJEHSLSWGXCNZYEXRIMLPXRIXNUXRNSNRPHFDHBMAY
WKHTKNGNUXRNJUVGMYNYEYNLYYGPGYFSBNQQWUCHMMSLRWTFDYQRNOJUEWNLVUZIDHWXLH
TLKNEXMALBRQGUMMGXCUFXLHTLLLRTROJYFIDHLIGADLUBVXENSCALVCDFFIQCFAHISILU
XXZXNUAMZAWISRNOJYKMQYECGRSBWHAHLUFBBPDPWLJBRYOCYEAYSVYXSISPRKSNZYPHMM
WKHXMWWMGAZNEOFMDHKORMGOKNUHTAZQRAZPWBRTQXGZFMTJAXUTRNWCAPZLUFRODLFYFL
GUKHRODLTYRGRYWHNLRIUCNMDXOCGAKIFAQXKUQMVGZFDBVLSIJSGADLWCFGNCFMGTMWWI
STBIMHGKXBSPVGFVWHRYHNWXSKNGHLBENHYYQPZLXUEXNHDSBGDQZIXGNQKNUXCCKUFMQI
MMRYEYUNFHEUDIAZVUJWNGQYSFVSDNZYFNOLWGRBLJGLGTMWWISKZJAXVMXCFVEBMAAHTB
SNGUPENMWCGBRIFFLHMYOBBBRNZIEHTAZFLTBKMUVGSYVQVMGNZYROHFKISPZLOBBVZHLB
BKNOYBYRTHVYELSUFXGADJJISBSUTFRPZSGZPTQLQCAZHNGHGADMCCYEEODARGDLSFQHDM
FIGKZCKYNLDWGHQEDPQHRBSBWLNKDBAMFNOJDSJTFIFMYHZXWXZHQYLBNGSQAWRHMWWQNK
HMVYPEZLWXUXVCDFAHSQSMGXOLWWVHTMLCZXHHOUVMHHYZBKQYAHSHQWWGRGSMFIEPHFDB
RMTLFBVLZLESOTBEXIEYQYKBFNOJDCRLAOLWEHRMWMGADYFYZRRZJIAMHYJQVMGIMNQXKU
QNUXUUDORHENAGRMGULCFUDCFANEHNLFRTGYSXBYXIMLBIOIFYAMGUKWBNMNWXSHQGGLRM
GUFYVMGYJHHFDLAWNEROHYEBNLANLHQNZYABBYKNPTKWMFNMHIFMJBSBJYTTQXLIPHLGAM
FTQCSN" > cipher.txt
wc -c < cipher.txt

# letter frequency
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

# bigrams top 10
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=1; i<=(NF-1); i++) print $i $(i+1)}' | sort |  uniq -c | sort -nr | head

# trigrams top 10
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=1; i<=(NF-2); i++) print $i $(i+1) $(i+2)}' | sort | uniq -c | sort -nr | head

# kasiski test
grep -aob "NZY" cipher.txt


#group1 
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i=i+6) printf $i}' > cipher1.txt
awk 1 cipher1.txt
wc -c cipher1.txt
cat cipher1.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

#group2
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=2; i<=NF; i=i+6) printf $i}' > cipher2.txt
awk 1 cipher2.txt
wc -c cipher2.txt
cat cipher2.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

#group3
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=3; i<=NF; i=i+6) printf $i}' > cipher3.txt
awk 1 cipher3.txt
wc -c cipher3.txt
cat cipher3.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

#group4
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=4; i<=NF; i=i+6) printf $i}' > cipher4.txt
awk 1 cipher4.txt
wc -c cipher4.txt
cat cipher4.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

#group5
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=5; i<=NF; i=i+6) printf $i}' > cipher5.txt
awk 1 cipher5.txt
wc -c cipher5.txt
cat cipher5.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr

#group6
cat cipher.txt | awk 'BEGIN {FS=""} {for (i=6; i<=NF; i=i+6) printf $i}' > cipher6.txt
awk 1 cipher6.txt
wc -c cipher6.txt
cat cipher6.txt | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c | sort -nr


./vigenere-decrypt.py $(cat cipher.txt) SUNDZH | tr [:upper:] [:lower:]
./vigenere-decrypt.py $(cat cipher.txt) SUNTZU | tr [:upper:] [:lower:]
