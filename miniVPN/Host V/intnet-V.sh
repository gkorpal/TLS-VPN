#!/usr/bin/env bash

sudo ifconfig enp0s3 192.168.60.6/24 up
sudo route add default gw 192.168.60.1 
sudo route add -net 192.168.53.0/24 gw 192.168.60.1 enp0s3