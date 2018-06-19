#!/usr/bin/env python

import sys, os, time
install_root = "/automation/VCL_APIs/" + sys.argv[1]
sys.path.insert(0, "%s/lib/python/vcl" % (install_root))

from vcl import *

argc = len(sys.argv)
if argc < 5 or argc % 2 != 1:
    print "Usage: release_ports.py ixveriwave_version ip card1 port1 [card2 port2 ...]"
    sys.exit()

ip = sys.argv[2]
cards = list([int(sys.argv[i]), int(sys.argv[i+1])] for i in range(3, argc, 2))

success = True

if chassis.connect(ip) != 0:
    success = False

for [vw_card,vw_port] in cards:
    if port.releaseBinding(ip, vw_card, vw_port) != 0:
        success = False

if chassis.disconnectAll() != 0:
    success = False

print int(success)
