#!/usr/bin/env bash

#terminal 1
./server.py

#terminal 2
./client.py SEEDPKILab2020.com

# We use SEEDPKILab.com for the host name parameter when running the code on the client, so we need to configure the static IP 
# in the local /etc/hosts file and add the  127.0.0.1 SEEDPKILab2020.com entry so that the client will access it locally.
