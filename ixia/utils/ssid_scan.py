#!/usr/bin/env python

#           1  2    3    4              5
#arguments: ip card port frequency(MHz) channel

import sys, os, time

install_root = "/automation/VCL_APIs/" + sys.argv[1]
sys.path.insert(0, "%s/lib/python/vcl" % (install_root))

from vcl import *

chassis_ip = sys.argv[2]
card_num = int(sys.argv[3])
port_num = int(sys.argv[4])
radio_freq = int(sys.argv[5])
radio_channel = int(sys.argv[6])

chassis.connect(chassis_ip)

port.create('tempPort')
port.bind('tempPort', chassis_ip, card_num, port_num)

port.reset('tempPort')
port.read('tempPort')
port.setRadioBand(radio_freq)
port.setRadioChannel(radio_channel)
port.setRadio('on')

port.write('tempPort')

for i in range(3):
    port.read('tempPort') # get BSSIDs found on port
    bssid_list = port.getBssidList()

    if not bssid_list:
        # nothing found, try again
        time.sleep(1)
        continue

    # print out everything we found
    for bssid in bssid_list:
        ssid = port.getBssidSsid(bssid)
        rssi = port.getBssidRssi(bssid)

        print "%s %s %s" % (bssid, ssid, rssi)

    break

port.unbind('tempPort')
port.destroy('tempPort')

chassis.disconnectAll()