
#!/bin/bash
##############################################################################
#
# Code: Classical Crypto Operations
# Project: Security
#
# Author: Steven Gordon
#         Sirindhorn International Institute of Technology
#         Thammasat University
#         Bangkok, Thailand
#         steven.gordon@ieee.org
# URL: source: https://sandilands.info/sgordon/classical-ciphers-frequency-analysis-examples 
#
# Description:
# Set of classical cryptographic operations for demonstrate principles
# of ciphers.
#
# $URL $
# $Revision: 483 $
# $Author: sgordon $
# $Date: 2012-11-18 09:52:52 +0700 (Sun, 18 Nov 2012) $
# 
##############################################################################

# Shift negative number (-26 to -1) to the right by 26 positions (0 to 25)
# @param Integer $1 n
# @return Integer 
function abs26 {
	 if [ $1 -lt 0 ]
	 then
		expr $1 + 26
	 else
		echo $1
	 fi
}

# Calculate ceiling of x divided by y
# @param Integer $1 x
# @param Integer $2 y
# @return Integer ceil(x/y)
function ceildiv {
    rem=`expr $1 % $2`;
    quot=`expr $1 / $2`;
    if [ ${rem} -eq 0 ]
    then
	expr ${quot}
    else
	expr ${quot} + 1;
    fi
}

# Generate a random letter
# @return String rl
function randletter {
        rn=`echo $RANDOM`;
        if [ $rn -le 1260 ]; then
                rl='a';
        elif [ $rn -le 2520 ]; then
                rl='b';
        elif [ $rn -le 3780 ]; then
                rl='c';
        elif [ $rn -le 5040 ]; then
                rl='d';
        elif [ $rn -le 6300 ]; then
                rl='e';
        elif [ $rn -le 7560 ]; then
                rl='f';
        elif [ $rn -le 8820 ]; then
                rl='g';
        elif [ $rn -le 10080 ]; then
                rl='h';
        elif [ $rn -le 11340 ]; then
                rl='i';
        elif [ $rn -le 12600 ]; then
                rl='j';
        elif [ $rn -le 13860 ]; then
                rl='k';
        elif [ $rn -le 15120 ]; then
                rl='l';
        elif [ $rn -le 16380 ]; then
                rl='m';
        elif [ $rn -le 17640 ]; then
                rl='n';
        elif [ $rn -le 18900 ]; then
                rl='o';
        elif [ $rn -le 20160 ]; then
                rl='p';
        elif [ $rn -le 21420 ]; then
                rl='q';
        elif [ $rn -le 22680 ]; then
                rl='r';
        elif [ $rn -le 23940 ]; then
                rl='s';
        elif [ $rn -le 25200 ]; then
                rl='t';
        elif [ $rn -le 26460 ]; then
                rl='u';
        elif [ $rn -le 27720 ]; then
                rl='v';
        elif [ $rn -le 28980 ]; then
                rl='w';
        elif [ $rn -le 30240 ]; then
                rl='x';
        elif [ $rn -le 31500 ]; then
                rl='y';
        else
                rl='z';
        fi
        echo $rl
} 

# Generate a random word
# @param Integer $1
# @Return String rw
function randword {
    numchars=$1
    rw="";
    for i in `seq 1 $numchars`
    do
        rw=$rw`randletter`
    done
    echo $rw
}

# Convert English characters into integers from 0 to 25
# @param String $1 
# @return Array of Integers  
# Bug: will not convert the string 'help' (instead prints help)
function eng2int {
    if [ ${1} = help ]
    then
	echo 'Usage: crypto eng2int CHARACTERS'
	echo 'Convert English characters into integers'
	echo 'Example: '
	echo '$ crypto eng2int abc'
	echo '0 1 2'
    else
	echo $1 | \
	sed 's/a/0 /g' | \
	sed 's/b/1 /g' | \
	sed 's/c/2 /g' | \
	sed 's/d/3 /g' | \
	sed 's/e/4 /g' | \
	sed 's/f/5 /g' | \
	sed 's/g/6 /g' | \
	sed 's/h/7 /g' | \
	sed 's/i/8 /g' | \
	sed 's/j/9 /g' | \
	sed 's/k/10 /g' | \
	sed 's/l/11 /g' | \
	sed 's/m/12 /g' | \
	sed 's/n/13 /g' | \
	sed 's/o/14 /g' | \
	sed 's/p/15 /g' | \
	sed 's/q/16 /g' | \
	sed 's/r/17 /g' | \
	sed 's/s/18 /g' | \
	sed 's/t/19 /g' | \
	sed 's/u/20 /g' | \
	sed 's/v/21 /g' | \
	sed 's/w/22 /g' | \
	sed 's/x/23 /g' | \
	sed 's/y/24 /g' | \
	sed 's/z/25 /g'
     fi
}

# Convert list of integers integer English characters
# @param List of Integers $* (e.g. '1 2 3 4')
# @return String
function int2eng {
    if [ ${1} = help ]
    then
	echo "Usage: crypto int2eng 'INT1 INT2 INT3'"
	echo 'Convert list of integers into English characters'
	echo 'Example: '
	echo "$ crypto int2eng '1 2 3 4 5'"
	echo "bcdef"
    else
	echo $* | \
	sed 's/25/z/g' | \
	sed 's/24/y/g' | \
        sed 's/23/x/g' | \
	sed 's/22/w/g' | \
        sed 's/21/v/g' | \
        sed 's/20/u/g' | \
        sed 's/19/t/g' | \
        sed 's/18/s/g' | \
        sed 's/17/r/g' | \
        sed 's/16/q/g' | \
        sed 's/15/p/g' | \
        sed 's/14/o/g' | \
        sed 's/13/n/g' | \
        sed 's/12/m/g' | \
        sed 's/11/l/g' | \
        sed 's/10/k/g' | \
        sed 's/9/j/g' | \
        sed 's/8/i/g' | \
        sed 's/7/h/g' | \
        sed 's/6/g/g' | \
        sed 's/5/f/g' | \
        sed 's/4/e/g' | \
        sed 's/3/d/g' | \
        sed 's/2/c/g' | \
        sed 's/1/b/g' | \
        sed 's/0/a/g' | \
        sed 's/ //g'
    fi
}

# General Caesar cipher
# @param String $1 operation
# @param String $2 text or filename
# @param Integer $3 key
# @param String $4 "file" to indicate to read from file
# @return String plaintext or ciphertext
function caesar {
    if [ $# -ne 3 -a $# -ne 4 ]
    then
        op=help
    else
        op=$1
    fi
    if [ $op != enc -a $op != dec ]
    then
	echo 'General Caesar cipher'
	echo 'Usage: crypto caesar op text key'
	echo ' op = enc | dec | help'
	echo ' text = [string]'
	echo ' key = [integer]'
	echo 'The text must be strings comprised only of characters'
	echo 'from the language used by crypto (default: English). '
	echo 'The key must be an integer.'
	echo ''
	echo 'Examples:'
	echo ' $ crypto caesar enc abcde 1'
	echo ' bcdef'
	echo ' $ crypto caesar dec rovvy 10'
	echo ' hello'
	exit
    fi

    # Prepare input
    if [ $# -eq 4 ]
    then
	if [ $4 = file ]
	then
	    in=`cat $2 | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | tr -d ' '`
	    text=`eng2int $in`
	else
	    text=`eng2int $2`
	fi
    else
	text=`eng2int $2`
    fi
    key=`eng2int $3`

    out='';
    # Decryption
    if [ ${op} = dec ]
    then
	for i in ${text}
	do
	    sum=`expr ${i} - ${key}`;
	    sum=`abs26 $sum`;
	    mod=`expr ${sum} % 26`;
	    out=`echo -n $out $mod`
	done    
    # Encryption
    else
	for i in ${text}
	do
	    sum=`expr ${i} + ${key}`;
	    mod=`expr ${sum} % 26`;
	    out=`echo -n $out $mod`
	done
    fi
    int2eng ${out}
}

function mono {
    if [ $# -ne 3 -a $# -ne 4 ]
    then
        op=help
    else
        op=$1
    fi
    if [ $op != enc -a $op != dec ]
    then
	echo 'Monoalphabetic cipher'
	echo 'Usage: crypto mono op text key'
	echo ' op = enc | dec | help'
	echo ' text = [string]'
	echo ' key = [string]'
	echo 'The text must be strings comprised only of characters'
	echo 'from the language used by crypto (default: English). '
	echo 'The key must be an integer.'
	exit
    fi

    # Prepare input
    if [ $# -eq 4 ]
    then
	if [ $4 = file ]
	then
	    in=`cat $2 | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | tr -d ' '`
	    text_length=`expr length ${in}`;
	    text=`eng2int $in`
	else
	    text_length=`expr length ${2}`;
	    text=`eng2int $2`
	fi
    else
	text_length=`expr length ${2}`;
	text=`eng2int $2`
    fi
    key=`echo $3 | tr [:upper:] [:lower:]`;
    key=`eng2int $key`;

    key_length=`expr length ${3}`;

    # Convert text and key to arrays
    for i in `seq 1 ${text_length}`
    do
	text_array[${i}]=`echo ${text} | cut -d " " -f ${i}`;
    done
    for i in `seq 1 ${key_length}`
    do
	key_array[${i}]=`echo ${key} | cut -d " " -f ${i}`;
    done
    
    # Decryption
    if [ ${op} = dec ]
    then
	for j in `seq 1 ${key_length}`
	do
	    key_array2[${key_array[${j}]}]=`expr $j - 1`;
	done

	for i in `seq 1 ${text_length}`
	do
	    textletter=${text_array[${i}]};
	    index=`expr ${textletter}`
	    keyletter=${key_array2[${index}]};
	    out=`echo -n $out $keyletter`
	done    
    # Encryption
    else
	for i in `seq 1 ${text_length}`
	do
	    textletter=${text_array[${i}]};
	    index=`expr ${textletter} + 1`
	    keyletter=${key_array[${index}]};
	    out=`echo -n $out $keyletter`
	done
    fi
    int2eng ${out}
}

function vigenere {
    if [ $# -ne 3 -a $# -ne 4 ]
    then
        op=help
    else
        op=$1
    fi
    if [ $op != enc -a $op != dec ]
    then
	echo 'Polyalphabetic cipher (e.g. Vigenere, One Time Pad).'
	echo ''
	echo 'Usage: crypto vigenere op text key'
	echo ' op = enc | dec | help'
	echo ' text = [string]'
	echo ' key = [string]'
	echo 'The text and key must be strings comprised only of characters'
	echo 'from the language used by crypto (default: English). '
	echo ''
	echo 'Examples:'
	echo ' $ crypto vigenere enc abcdef xy'
	echo ' xzzbbd'
	echo ' $ crypto vigenere dec xzzbbd xy'
	echo ' abcdef'
	exit
    fi

    # Prepare input
    if [ $# -eq 4 ]
    then
	if [ $4 = file ]
	then
	    in=`cat $2 | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | tr -d ' '`
	    text=$in
	else
	    text=$2
	fi
    else
	text=$2
    fi
    key=$3
    text_length=`expr length ${text}`;
    key_length=`expr length ${key}`;

    # Encrypt/decrypt
    out='';
    for i in `seq 1 ${text_length}`
    do
	text_array[${i}]=`echo ${text} | cut -c ${i}`;
	j=`expr ${i} - 1`;
	k=`expr ${j} % ${key_length}`;
	l=`expr ${k} + 1`
	key_array[${i}]=`echo ${key} | cut -c ${l}`;
	c=`caesar ${op} ${text_array[${i}]} ${key_array[${i}]}`;
	out=`echo -n $out$c`
    done
    echo ${out}
}

function railfence {
    if [ $# -ne 3 -a $# -ne 4 ]
    then
        op=help
    else
        op=$1
    fi
    if [ $op != enc -a $op != dec ]
    then
	echo 'Rail Fence Transposition Cipher'
	exit
    fi

    # Prepare input
    if [ $# -eq 4 ]
    then
	if [ $4 = file ]
	then
	    in=`cat $2 | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | tr -d ' '`
	    text=$in
	else
	    text=$2
	fi
    else
	text=$2
    fi
    key=$3
    text_length=`expr length ${text}`;

    # Read text into array
    for i in `seq 1 ${text_length}`
    do
	text_array[${i}]=`echo ${text} | cut -c ${i}`;
    done

    # Decryption
    out='';
    if [ ${op} = dec ]
    then
	row_length=`expr ${text_length} / ${key}`
	row_length=`expr ${row_length} + 1`
	for i in `seq 1 ${row_length}`
	do
	    for j in `seq ${i} ${row_length} ${text_length}`
	    do
		c=${text_array[${j}]};
		out=`echo -n $out$c`;
	    done
	done
    # Encryption
    else
	for i in `seq 1 ${key}`
	do
	    for j in `seq ${i} ${key} ${text_length}`
	    do
		c=${text_array[${j}]};
		out=`echo -n $out$c`;
	    done
	done
    fi	
    echo ${out}
}

function rowscols {
    if [ $# -ne 3 -a $# -ne 4 ]
    then
        op=help
    else
        op=$1
    fi
    if [ $op != enc -a $op != dec ]
    then
	echo 'Rows/Columns Transposition Cipher'
	exit
    fi

    # Prepare input
    if [ $# -eq 4 ]
    then
	if [ $4 = file ]
	then
	    in=`cat $2 | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | tr -d ' '`
	    text=$in
	else
	    text=$2
	fi
    else
	text=$2
    fi
    key=$3
    text_length=`expr length ${text}`;
    key_length=`expr length ${key}`;
    rows=`ceildiv ${text_length} ${key_length}`;

    # Read text into array
    for i in `seq 1 ${text_length}`
    do
	text_array[${i}]=`echo ${text} | cut -c ${i}`;
    done

    # Read key into array
    for i in `seq 1 ${key_length}`
    do
	key_array[${i}]=`echo ${key} | cut -c ${i}`;
    done

    # Fill out text array with letter x if needed
    rem=`expr ${text_length} % ${key_length}`
    if [ ${rem} -ne 0 ]
    then
	extra=`expr ${key_length} - ${rem}`;
	for i in `seq 1 ${extra}`
	do
	    j=`expr ${i} + ${text_length}`;
	    text_array[${j}]=`echo -n x`;
	done
	text_length=`expr ${text_length} + ${extra}`;
    fi

    # Decryption
    out='';
    if [ ${op} = dec ]
    then
	for i in `seq 1 ${key_length}`
	do
	    k=`expr ${key_array[${i}]} - 1`;
	    l=`expr ${k} \* ${rows}`
	    for j in `seq 1 ${rows}`
	    do
		n=`expr ${l} + ${j}`
		o=`expr ${j} - 1`
		p=`expr ${o} \* ${key_length}`
		q=`expr ${p} + ${i}`
		c=${text_array[${n}]};
		out_array[${q}]=${c};
	    done
	done
    # Encryption
    else
	for i in `seq 1 ${key_length}`
	do
	    k=`expr ${key_array[${i}]} - 1`;
	    l=`expr ${k} \* ${rows}`
	    m=`expr ${l} + 1`
	    for j in `seq ${i} ${key_length} ${text_length}`
	    do
		c=${text_array[${j}]};
		out_array[${m}]=${c};
		m=`expr ${m} + 1`;
	    done
	done
    fi

    for i in `seq 1 ${text_length}`
    do
	echo -n ${out_array[${i}]};
    done
    echo ''
}

function playfair {
    if [ $# -ne 3 -a $# -ne 4 ]
    then
        op=help
    else
        op=$1
    fi
    if [ $op != enc -a $op != dec ]
    then
	echo 'Playfair cipher'
	exit
    fi

    # Prepare input
    if [ $# -eq 4 ]
    then
	if [ $4 = file ]
	then
	    in=`cat $2 | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | tr -d ' '`
	    text=$in
	else
	    text=$2
	fi
    else
	text=$2
    fi
    key=$3
    
    echo '*******************'
    echo 'Not yet implemented'
    echo '*******************'

}

function count {
    if [ $# -ne 2 -a $# -ne 3 ]
    then
        op=help
    else
        op=$1
	file=$2
	process='none'
	if [ $# -eq 3 ]
	then
	    process=$3
	fi
    fi
    if [ $op != letters -a $op != digrams -a $op != trigrams ]
    then
	echo 'Count the occurrences of sequences of letters/digrams/trigrams in an input'
	exit
    fi

    tmpfile=`mktemp`

    if [ ${op} = letters ]
    then
	cat ${file} | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | awk 'BEGIN {FS=" "} {for (i=1; i<=NF; i++) print $i}' | awk 'BEGIN {FS=""} {for (i=1; i<=NF; i++) print $i}' | sort | uniq -c > ${tmpfile}
    elif [ ${op} = digrams ]
    then
	cat ${file} | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | awk 'BEGIN {FS=" "} {for (i=1; i<=NF; i++) print $i}' | awk 'BEGIN {FS=""} {for (i=1; i<NF; i++) print $i $(i+1)}' | sort | uniq -c > ${tmpfile}
    elif [ ${op} = trigrams ]
    then
	cat ${file} | tr [:upper:] [:lower:] | tr -c '[:lower:]' ' ' | awk 'BEGIN {FS=" "} {for (i=1; i<=NF; i++) print $i}' | awk 'BEGIN {FS=""} {for (i=1; i<(NF-1); i++) print $i $(i+1) $(i+2)}' | sort | uniq -c > ${tmpfile}
    fi

    if [ ${process} = sort ]
    then
	sort -r -n --key=1,8 ${tmpfile}
    elif [ ${process} = percent ]
    then
	total=`awk 'BEGIN {total=0} {total = total + $1} END {print total}' ${tmpfile}`
	echo ${total}
	awk '{printf("%6.2f %s\n", $1/'${total}'*100, $2)}' ${tmpfile} | head -15
    elif [ ${process} = percentsort ]
    then
	total=`awk 'BEGIN {total=0} {total = total + $1} END {print total}' ${tmpfile}`
	echo ${total}
	awk '{printf("%6.2f %s\n", $1/'${total}'*100, $2)}' ${tmpfile} | sort -r -n --key=1,8 | head -15
    else
	cat ${tmpfile}
    fi

    rm ${tmpfile}
}

function validate {
# Validate crypto script

i=1
echo -n "Test ${i}";
time {
in1p='securityandcryptography';
in1c='vhfxulwbdqgfubswrjudskb';
in1k='d';

c=`caesar enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 1 encrypt";
fi

p=`caesar dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 1 decrypt";
fi
}


# Vigenere

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='internettechnologies'
in1c='avkmeqlhkrupewyrnwvf'
in1k='sirindhorn'
c=`vigenere enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 2 encrypt";
fi
p=`vigenere dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 2 decrypt";
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='stevengo'
in1c='kbmowvoh'
in1k='siit'
c=`vigenere enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 3 encrypt";
fi
p=`vigenere dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 3 decrypt";
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='steven'
in1c='kxgpvr'
in1k='secure'
c=`vigenere enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 4 encrypt";
fi
p=`vigenere dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 4 decrypt";
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='steven'
in1c='ukckxb'
in1k='crypto'
c=`vigenere enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 5 encrypt";
fi
p=`vigenere dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 5 decrypt";
fi
}
# One time pad

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='steven'
in1c='pyuwnf'
in1k='xfqbjs'
c=`vigenere enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 6 encrypt";
    echo $c
fi
p=`vigenere dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 6 decrypt";
    echo $p
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='steven'
in1c='ihtzkx'
in1k='qopegk'
c=`vigenere enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 7 encrypt";
fi
p=`vigenere dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 7 decrypt";
fi
}

# Rail Fence

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='internettechnologiesandapplications'
in1c='ieeenoenpitnnrtcogsdpcistnthliaalao'
in1k=3
c=`railfence enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 8 encrypt";
    echo $c
fi
p=`railfence dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 8 decrypt";
    echo $p
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='thisquizistooeasyx'
in1c='uoxhzesssqtytioiia'
in1k='526341'
c=`rowscols enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 9 encrypt";
    echo $c
fi
p=`rowscols dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 9 decrypt";
    echo $p
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='securityandcryptographya'
in1c='eyyardoystrricgacappunth'
in1k='315624'
c=`rowscols enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 10 encrypt";
echo $c
fi
p=`rowscols dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 10 decrypt";
echo $p
fi
}

i=`expr $i + 1`
echo -n "Test ${i}";
time {
in1p='eyyardoystrricgacappunth'
in1c='yycprrcteoipdrahysguatan'
in1k='315624'
c=`rowscols enc ${in1p} ${in1k}`
if [ ${c} != ${in1c} ]
then
    echo "Failed ${i} 11 encrypt";
fi
p=`rowscols dec ${in1c} ${in1k}`
if [ ${p} != ${in1p} ]
then
    echo "Failed ${i} 11 decrypt";
fi
}
# Playfair

# steven
# zeazbs
# crypto

# steven
# rnswso
# secure


}

function help_general {
    echo 'Cryptographic operations.'
    echo 'Usage: crypto <ciphername> <operation> <text> <key>'
    echo 'For list of supported ciphers and operations run:'
    echo ' crypto list'
    echo 'For help on a specific cipher run:'
    echo ' crypto <ciphername> help'
}

function help_list {
    echo 'List of ciphers and commands supported by crypto'
    echo 'Classical Ciphers:'
    echo ' caesar    - General Caesar cipher'
    echo ' mono      - Monoalphabetic chiper'
    echo ' vigenere  - Polyalphabetic cipher (Vigenere/One-time Pad)'
    echo ' railfence - Rail Fence transposition cipher'
    echo ' rowscols  - Rows/Columns transposition cipher'
    echo ' playfair  - Playfair cipher'
    echo ' '
    echo 'Conversions:'
    echo ' eng2int   - Convert English characters to integers'
    echo ' int2eng   - Convert integers to English characters'
    echo ' '
    echo 'Statistics:'
    echo ' count     - Count frequency of letters, digrams and trigrams'
    echo ' '
    echo 'Other:'
    echo ' random    - Generate a random word of n letters'
    echo ' validate  - Validate the ciphers against known plaintext/ciphertexts'
    echo ' help      - Display the help'
}

cipher=$1
op=$2
text=$3
key=$4
fileopt=$5

if [ ${cipher} = caesar ]
then
	caesar ${op} ${text} ${key} ${fileopt}
elif [ ${cipher} = mono ]
then
    mono ${op} ${text} ${key} ${fileopt}
elif [ ${cipher} = vigenere ]
then
    vigenere ${op} ${text} ${key} ${fileopt}
elif [ ${cipher} = railfence ]
then
    railfence ${op} ${text} ${key} ${fileopt}
elif [ ${cipher} = rowscols ]
then
    rowscols ${op} ${text} ${key} ${fileopt}
elif [ ${cipher} = playfair ]
then
    playfair ${op} ${text} ${key}
elif [ ${cipher} = eng2int ]
then
    eng2int ${op}
elif [ ${cipher} = int2eng ]
then
    int2eng ${op}
elif [ ${cipher} = count ]
then
    count ${op} ${text} ${key}
elif [ ${cipher} = random ]
then
    randword ${op}
elif [ ${cipher} = validate ]
then
    validate
elif [ ${cipher} = list ]
then
    help_list
else
    help_general
    exit
fi
