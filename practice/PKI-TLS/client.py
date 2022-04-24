#!/usr/bin/python3

import socket, ssl, sys, pprint

hostname = sys.argv[1]
# port = 443                                          # default port for HTTPS
port = 4433			                                  		# modified to work with server.py
# cadir = '/etc/ssl/certs'
cadir = './certs'                                     # modified to work with server.py

# Set up the TLS context 
context = ssl.SSLContext(ssl.PROTOCOL_TLSv1_2)      # For Ubuntu 16.04 VM

context.load_verify_locations(capath=cadir)
context.verify_mode = ssl.CERT_REQUIRED
context.check_hostname = True

# Create TCP connection 
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((hostname, port))
print("TCP connection ready...")

# Add the TLS
ssock = context.wrap_socket(sock, server_hostname=hostname, 
                            do_handshake_on_connect=False)
ssock.do_handshake()   # Start the handshake
print("=== Cipher used: {}".format(ssock.cipher()))
print("=== Server hostname: {}".format(ssock.server_hostname))
print("=== Server certificate:")
pprint.pprint(ssock.getpeercert())
pprint.pprint(context.get_ca_certs())
print("TLS handshake done...")

# Send HTTP Request to Server
request = b"GET / HTTP/1.0\r\nHost: " + \
    hostname.encode('utf-8') + b"\r\n\r\n"
ssock.sendall(request)
print("Sent HTTP request...")

# Read HTTP Response from Server
print("Reading HTTP response")
response = ssock.recv(2048)
while response:
    pprint.pprint(response.split(b"\r\n"))
    response = ssock.recv(2048)

# Close the TLS Connection
ssock.shutdown(socket.SHUT_RDWR)
ssock.close()

####################
# usage: ./client.py example.com 
