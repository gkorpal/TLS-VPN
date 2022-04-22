#!/usr/bin/python
from scapy.all import *

def print_pkt(pkt):
  print "Source IP:", pkt[IP].src
  print "Destination IP:", pkt[IP].dst
  print "Protocol:", pkt[IP].proto
  print "\n"

pkt = sniff(filter='net 128.230.0.0/16',prn=print_pkt)
