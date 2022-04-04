#!/usr/bin/env bash

# step 1
openssl s_client -showcerts -connect www.arizona.edu:443 </dev/null > cert.txt
cat cert.txt

# Now we save each of the certificate (the text between the line containing "BEGIN CERTIFICATE"
# and the line containing "END CERTIFICATE", including these two lines) to a file. 
# Let us call the first one c0.pem (server certificate) and the second one c1.pem (CA certificate).

# step 2
openssl x509 -in c1.pem -noout -modulus
openssl x509 -in c1.pem -text -noout

# step 3
openssl x509 -in c0.pem -text -noout

# step 4
openssl asn1parse -i -in c0.pem
openssl asn1parse -i -in c0.pem -strparse 4 -out c0_body.bin -noout
sha256sum c0_body.bin | tr [a-z] [A-Z]

# step 5
gcc task6.c -lcrypto -o task6
./task6
