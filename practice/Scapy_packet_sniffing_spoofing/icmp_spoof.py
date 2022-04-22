#!/usr/bin/python
from scapy.all import *

print "SENDING SPOOFED ICMP PACKET"
ip = IP(src="10.0.2.5", dst="1.1.1.1")
icmp = ICMP()
pkt = ip/icmp
pkt.show()
send(pkt)
