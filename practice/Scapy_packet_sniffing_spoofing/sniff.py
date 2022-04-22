#!/usr/bin/python
from scapy.all import *

def print_pkt(pkt):
  pkt.show()

pkt = sniff(filter='icmp',prn=print_pkt)

# make sniff.py executable (another way to run python programs)
# $ chmod a+x sniff.py
# $ sudo ./sniff.py
