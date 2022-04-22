#!/usr/bin/python
from scapy.all import *

def print_pkt(pkt):
  print "Source IP:", pkt[IP].src
  print "Destination IP:", pkt[IP].dst
  print "Protocol:", pkt[IP].proto
  print "Destination port:", pkt[TCP].dport
  print "\n"

pkt = sniff(filter='tcp and src host 10.0.2.5 and dst port 23',prn=print_pkt)
