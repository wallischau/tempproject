
#Auto-generated from: TCP_AC.wml
#At: 2014-02-14 15:30:50.725000
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Direction {Unidirectional}
keylset global_config Source {Eth}
keylset global_config Destination {Wifi5}

#Traffics Global Options
#keylset global_config PassFailUser False
keylset global_config IncrDestPort True
keylset global_config IncrSourcePort True
keylset global_config TrafficType Tcp
keylset global_config PayloadData None
keylset global_config DestinationPort 21024
keylset global_config SourcePort 32024

#TestParameters Global Options
keylset global_config TrialDuration 15
keylset global_config TestDurationSec 15
keylset global_config LossTolerance 0.1
keylset global_config Ipv6PrefFlag 0
keylset global_config RandomSeed 1142638611

#Connection Global Options


#LogsAndResultsInfo Global Options
set Card_24 $card_24_ip
set Card_5 $card_5_ip
set Card_Eth $card_eth_ip
set Card_Eth_2 $card_eth_2_ip
set SSID_24 $ssid_24
set SSID_5 $ssid_5
set VENDORNAME $vendor_name
set VENDORMODEL $vendor_model
set VENDORFW $vendor_firmware
set WLANSwitchModel none
set WLANSwitchFW none
set ATTN24 off
set ATTN5 off
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir


#Learning Global Options


#Mapping Options
keylset global_config FlowType TCP

#Wireless Group Count
keylset global_config WirelessGroupCount 1

#Tests - you may define more than one in a TCL list.
keylset global_config TestList ${test_list}


#Group Eth
keylset Eth GroupType 802.3
keylset Eth Dut generic_dut_0

#Group Eth - Client Options
keylset Eth Hops -1
keylset Eth Dhcp Enable
keylset Eth Dhcpv6 Disable
keylset Eth Ipv6Flag 0
keylset Eth GratuitousArp True
keylset Eth MacAddress None
keylset Eth Gateway 192.168.1.1
keylset Eth Qos Disable
keylset Eth BaseIp 192.168.1.10

#Group Eth - Security Options
keylset Eth Method {None}
keylset Eth EnableValidateCertificate off

# NOTE - IPv6 is enabled for Eth but not enabled for Wifi2 
# This will cause Wifi5 to use IPv6 and Wifi2 to use IPv4

#Group Eth_2
keylset Eth_2 GroupType 802.3
keylset Eth_2 Dut generic_dut_1

#Group Eth_2 - Client Options
keylset Eth_2 Hops -1
keylset Eth_2 Dhcp Enable
keylset Eth_2 GratuitousArp True
keylset Eth_2 MacAddress None
keylset Eth_2 Gateway 192.168.1.1
keylset Eth_2 Qos Disable
keylset Eth_2 BaseIp 192.168.1.10

#Group Eth_2 - Security Options
keylset Eth_2 Method {None}
keylset Eth_2 EnableValidateCertificate off

set Eth_5CLI ${Eth}
keylset Eth_5CLI NumClients 5

set Eth_2_5CLI ${Eth_2}
keylset Eth_2_5CLI NumClients 5


#Group Wifi2
keylset Wifi2 GroupType 802.11n
keylset Wifi2 Dut generic_dut_2

#Group Wifi2 - Client Options
keylset Wifi2 Ssid $SSID_24
keylset Wifi2 Hops 0
keylset Wifi2 MacAddressMode Random
keylset Wifi2 Dhcp Enable
keylset Wifi2 Dhcpv6 Disable
keylset Wifi2 Ipv6Flag 0
keylset Wifi2 GratuitousArp True
keylset Wifi2 MacAddress 00:00:01:00:00:01
keylset Wifi2 MacAddressIncr 1
keylset Wifi2 PlcpConfiguration mixed
keylset Wifi2 ChannelBandwidth 20
keylset Wifi2 EnableAMSDUrxaggregation False
keylset Wifi2 EnableAMSDUtxaggregation False
keylset Wifi2 EnableAMPDUaggregation True
keylset Wifi2 ChannelModel Bypass
keylset Wifi2 DataMcsIndex 23
keylset Wifi2 KeepAlive True
keylset Wifi2 NumTxAntennas $Num24Antennas
keylset Wifi2 GuardInterval standard
keylset Wifi2 Gateway 192.168.1.1
keylset Wifi2 phyInterface 802.11n
keylset Wifi2 MgmtPhyRate 24
keylset Wifi2 Qos Enable
keylset Wifi2 BaseIp 192.168.1.11
keylset Wifi2 Channel $Channel24



#Group Wifi2 - Security Options
keylset Wifi2 Method {WPA2-PSK}
keylset Wifi2 EnableValidateCertificate off
keylset Wifi2 PskAscii charter123

set Wifi2_1CLI ${Wifi2}
keylset Wifi2_1CLI NumClients 1

set Wifi2_10CLI ${Wifi2}
keylset Wifi2_10CLI NumClients 10

set Wifi2_25CLI ${Wifi2}
keylset Wifi2_25CLI NumClients 25

set Wifi2_G_1CLI ${Wifi2_1CLI}
keylset Wifi2_G_1CLI phyInterface 802.11ag
set Wifi2_0_1CLI ${Wifi2_1CLI}
keylset Wifi2_0_1CLI DataMcsIndex 0
set Wifi2_1_1CLI ${Wifi2_1CLI}
keylset Wifi2_1_1CLI DataMcsIndex 1
set Wifi2_2_1CLI ${Wifi2_1CLI}
keylset Wifi2_2_1CLI DataMcsIndex 2
set Wifi2_3_1CLI ${Wifi2_1CLI}
keylset Wifi2_3_1CLI DataMcsIndex 3
set Wifi2_4_1CLI ${Wifi2_1CLI}
keylset Wifi2_4_1CLI DataMcsIndex 4
set Wifi2_5_1CLI ${Wifi2_1CLI}
keylset Wifi2_5_1CLI DataMcsIndex 5
set Wifi2_6_1CLI ${Wifi2_1CLI}
keylset Wifi2_6_1CLI DataMcsIndex 6
set Wifi2_7_1CLI ${Wifi2_1CLI}
keylset Wifi2_7_1CLI DataMcsIndex 7
set Wifi2_8_1CLI ${Wifi2_1CLI}
keylset Wifi2_8_1CLI DataMcsIndex 8
set Wifi2_9_1CLI ${Wifi2_1CLI}
keylset Wifi2_9_1CLI DataMcsIndex 9
set Wifi2_10_1CLI ${Wifi2_1CLI}
keylset Wifi2_10_1CLI DataMcsIndex 10
set Wifi2_11_1CLI ${Wifi2_1CLI}
keylset Wifi2_11_1CLI DataMcsIndex 11
set Wifi2_12_1CLI ${Wifi2_1CLI}
keylset Wifi2_12_1CLI DataMcsIndex 12
set Wifi2_13_1CLI ${Wifi2_1CLI}
keylset Wifi2_13_1CLI DataMcsIndex 13
set Wifi2_14_1CLI ${Wifi2_1CLI}
keylset Wifi2_14_1CLI DataMcsIndex 14
set Wifi2_15_1CLI ${Wifi2_1CLI}
keylset Wifi2_15_1CLI DataMcsIndex 15
set Wifi2_16_1CLI ${Wifi2_1CLI}
keylset Wifi2_16_1CLI DataMcsIndex 16
set Wifi2_17_1CLI ${Wifi2_1CLI}
keylset Wifi2_17_1CLI DataMcsIndex 17
set Wifi2_18_1CLI ${Wifi2_1CLI}
keylset Wifi2_18_1CLI DataMcsIndex 18
set Wifi2_19_1CLI ${Wifi2_1CLI}
keylset Wifi2_19_1CLI DataMcsIndex 19
set Wifi2_20_1CLI ${Wifi2_1CLI}
keylset Wifi2_20_1CLI DataMcsIndex 20
set Wifi2_21_1CLI ${Wifi2_1CLI}
keylset Wifi2_21_1CLI DataMcsIndex 21
set Wifi2_22_1CLI ${Wifi2_1CLI}
keylset Wifi2_22_1CLI DataMcsIndex 22
set Wifi2_23_1CLI ${Wifi2_1CLI}
keylset Wifi2_23_1CLI DataMcsIndex 23
set Wifi2_24_1CLI ${Wifi2_1CLI}
keylset Wifi2_24_1CLI DataMcsIndex 24
set Wifi2_25_1CLI ${Wifi2_1CLI}
keylset Wifi2_25_1CLI DataMcsIndex 25
set Wifi2_26_1CLI ${Wifi2_1CLI}
keylset Wifi2_26_1CLI DataMcsIndex 26
set Wifi2_27_1CLI ${Wifi2_1CLI}
keylset Wifi2_27_1CLI DataMcsIndex 27
set Wifi2_28_1CLI ${Wifi2_1CLI}
keylset Wifi2_28_1CLI DataMcsIndex 28
set Wifi2_29_1CLI ${Wifi2_1CLI}
keylset Wifi2_29_1CLI DataMcsIndex 29
set Wifi2_30_1CLI ${Wifi2_1CLI}
keylset Wifi2_30_1CLI DataMcsIndex 30
set Wifi2_31_1CLI ${Wifi2_1CLI}
keylset Wifi2_31_1CLI DataMcsIndex 31

set Wifi2_G_10CLI ${Wifi2_10CLI}
keylset Wifi2_G_10CLI phyInterface 802.11ag
set Wifi2_0_10CLI ${Wifi2_10CLI}
keylset Wifi2_0_10CLI DataMcsIndex 0
set Wifi2_1_10CLI ${Wifi2_10CLI}
keylset Wifi2_1_10CLI DataMcsIndex 1
set Wifi2_2_10CLI ${Wifi2_10CLI}
keylset Wifi2_2_10CLI DataMcsIndex 2
set Wifi2_3_10CLI ${Wifi2_10CLI}
keylset Wifi2_3_10CLI DataMcsIndex 3
set Wifi2_4_10CLI ${Wifi2_10CLI}
keylset Wifi2_4_10CLI DataMcsIndex 4
set Wifi2_5_10CLI ${Wifi2_10CLI}
keylset Wifi2_5_10CLI DataMcsIndex 5
set Wifi2_6_10CLI ${Wifi2_10CLI}
keylset Wifi2_6_10CLI DataMcsIndex 6
set Wifi2_7_10CLI ${Wifi2_10CLI}
keylset Wifi2_7_10CLI DataMcsIndex 7
set Wifi2_8_10CLI ${Wifi2_10CLI}
keylset Wifi2_8_10CLI DataMcsIndex 8
set Wifi2_9_10CLI ${Wifi2_10CLI}
keylset Wifi2_9_10CLI DataMcsIndex 9
set Wifi2_10_10CLI ${Wifi2_10CLI}
keylset Wifi2_10_10CLI DataMcsIndex 10
set Wifi2_11_10CLI ${Wifi2_10CLI}
keylset Wifi2_11_10CLI DataMcsIndex 11
set Wifi2_12_10CLI ${Wifi2_10CLI}
keylset Wifi2_12_10CLI DataMcsIndex 12
set Wifi2_13_10CLI ${Wifi2_10CLI}
keylset Wifi2_13_10CLI DataMcsIndex 13
set Wifi2_14_10CLI ${Wifi2_10CLI}
keylset Wifi2_14_10CLI DataMcsIndex 14
set Wifi2_15_10CLI ${Wifi2_10CLI}
keylset Wifi2_15_10CLI DataMcsIndex 15
set Wifi2_16_10CLI ${Wifi2_10CLI}
keylset Wifi2_16_10CLI DataMcsIndex 16
set Wifi2_17_10CLI ${Wifi2_10CLI}
keylset Wifi2_17_10CLI DataMcsIndex 17
set Wifi2_18_10CLI ${Wifi2_10CLI}
keylset Wifi2_18_10CLI DataMcsIndex 18
set Wifi2_19_10CLI ${Wifi2_10CLI}
keylset Wifi2_19_10CLI DataMcsIndex 19
set Wifi2_20_10CLI ${Wifi2_10CLI}
keylset Wifi2_20_10CLI DataMcsIndex 20
set Wifi2_21_10CLI ${Wifi2_10CLI}
keylset Wifi2_21_10CLI DataMcsIndex 21
set Wifi2_22_10CLI ${Wifi2_10CLI}
keylset Wifi2_22_10CLI DataMcsIndex 22
set Wifi2_23_10CLI ${Wifi2_10CLI}
keylset Wifi2_23_10CLI DataMcsIndex 23
set Wifi2_24_10CLI ${Wifi2_10CLI}
keylset Wifi2_24_10CLI DataMcsIndex 24
set Wifi2_25_10CLI ${Wifi2_10CLI}
keylset Wifi2_25_10CLI DataMcsIndex 25
set Wifi2_26_10CLI ${Wifi2_10CLI}
keylset Wifi2_26_10CLI DataMcsIndex 26
set Wifi2_27_10CLI ${Wifi2_10CLI}
keylset Wifi2_27_10CLI DataMcsIndex 27
set Wifi2_28_10CLI ${Wifi2_10CLI}
keylset Wifi2_28_10CLI DataMcsIndex 28
set Wifi2_29_10CLI ${Wifi2_10CLI}
keylset Wifi2_29_10CLI DataMcsIndex 29
set Wifi2_30_10CLI ${Wifi2_10CLI}
keylset Wifi2_30_10CLI DataMcsIndex 30
set Wifi2_31_10CLI ${Wifi2_10CLI}
keylset Wifi2_31_10CLI DataMcsIndex 31

set Wifi2_G_25CLI ${Wifi2_25CLI}
keylset Wifi2_G_25CLI phyInterface 802.11ag
set Wifi2_0_25CLI ${Wifi2_25CLI}
keylset Wifi2_0_25CLI DataMcsIndex 0
set Wifi2_1_25CLI ${Wifi2_25CLI}
keylset Wifi2_1_25CLI DataMcsIndex 1
set Wifi2_2_25CLI ${Wifi2_25CLI}
keylset Wifi2_2_25CLI DataMcsIndex 2
set Wifi2_3_25CLI ${Wifi2_25CLI}
keylset Wifi2_3_25CLI DataMcsIndex 3
set Wifi2_4_25CLI ${Wifi2_25CLI}
keylset Wifi2_4_25CLI DataMcsIndex 4
set Wifi2_5_25CLI ${Wifi2_25CLI}
keylset Wifi2_5_25CLI DataMcsIndex 5
set Wifi2_6_25CLI ${Wifi2_25CLI}
keylset Wifi2_6_25CLI DataMcsIndex 6
set Wifi2_7_25CLI ${Wifi2_25CLI}
keylset Wifi2_7_25CLI DataMcsIndex 7
set Wifi2_8_25CLI ${Wifi2_25CLI}
keylset Wifi2_8_25CLI DataMcsIndex 8
set Wifi2_9_25CLI ${Wifi2_25CLI}
keylset Wifi2_9_25CLI DataMcsIndex 9
set Wifi2_10_25CLI ${Wifi2_25CLI}
keylset Wifi2_10_25CLI DataMcsIndex 10
set Wifi2_11_25CLI ${Wifi2_25CLI}
keylset Wifi2_11_25CLI DataMcsIndex 11
set Wifi2_12_25CLI ${Wifi2_25CLI}
keylset Wifi2_12_25CLI DataMcsIndex 12
set Wifi2_13_25CLI ${Wifi2_25CLI}
keylset Wifi2_13_25CLI DataMcsIndex 13
set Wifi2_14_25CLI ${Wifi2_25CLI}
keylset Wifi2_14_25CLI DataMcsIndex 14
set Wifi2_15_25CLI ${Wifi2_25CLI}
keylset Wifi2_15_25CLI DataMcsIndex 15
set Wifi2_16_25CLI ${Wifi2_25CLI}
keylset Wifi2_16_25CLI DataMcsIndex 16
set Wifi2_17_25CLI ${Wifi2_25CLI}
keylset Wifi2_17_25CLI DataMcsIndex 17
set Wifi2_18_25CLI ${Wifi2_25CLI}
keylset Wifi2_18_25CLI DataMcsIndex 18
set Wifi2_19_25CLI ${Wifi2_25CLI}
keylset Wifi2_19_25CLI DataMcsIndex 19
set Wifi2_20_25CLI ${Wifi2_25CLI}
keylset Wifi2_20_25CLI DataMcsIndex 20
set Wifi2_21_25CLI ${Wifi2_25CLI}
keylset Wifi2_21_25CLI DataMcsIndex 21
set Wifi2_22_25CLI ${Wifi2_25CLI}
keylset Wifi2_22_25CLI DataMcsIndex 22
set Wifi2_23_25CLI ${Wifi2_25CLI}
keylset Wifi2_23_25CLI DataMcsIndex 23
set Wifi2_24_25CLI ${Wifi2_25CLI}
keylset Wifi2_24_25CLI DataMcsIndex 24
set Wifi2_25_25CLI ${Wifi2_25CLI}
keylset Wifi2_25_25CLI DataMcsIndex 25
set Wifi2_26_25CLI ${Wifi2_25CLI}
keylset Wifi2_26_25CLI DataMcsIndex 26
set Wifi2_27_25CLI ${Wifi2_25CLI}
keylset Wifi2_27_25CLI DataMcsIndex 27
set Wifi2_28_25CLI ${Wifi2_25CLI}
keylset Wifi2_28_25CLI DataMcsIndex 28
set Wifi2_29_25CLI ${Wifi2_25CLI}
keylset Wifi2_29_25CLI DataMcsIndex 29
set Wifi2_30_25CLI ${Wifi2_25CLI}
keylset Wifi2_30_25CLI DataMcsIndex 30
set Wifi2_31_25CLI ${Wifi2_25CLI}
keylset Wifi2_31_25CLI DataMcsIndex 31

#Group Wifi5
keylset Wifi5 GroupType 802.11ac
keylset Wifi5 Dut generic_dut_5


#Group Wifi5 - Client Options
keylset Wifi5 Ssid $SSID_5
keylset Wifi5 MacAddressMode Random
keylset Wifi5 Dhcp Enable
keylset Wifi5 Dhcpv6 Disable
keylset Wifi5 Ipv6Flag 0
keylset Wifi5 GratuitousArp True
keylset Wifi5 MacAddress 00:00:02:00:00:01
keylset Wifi5 MacAddressIncr 1
keylset Wifi5 PlcpConfiguration mixed
keylset Wifi5 ChannelBandwidth 40
keylset Wifi5 EnableAMSDUrxaggregation False
keylset Wifi5 EnableAMSDUtxaggregation False
keylset Wifi5 EnableAMPDUaggregation True
keylset Wifi5 ChannelModel Bypass
keylset Wifi5 KeepAlive True
keylset Wifi5 NumTxAntennas $Num5Antennas
keylset Wifi5 DataMcsIndex {7}
keylset Wifi5 GuardInterval short
keylset Wifi5 Gateway 192.168.1.1
keylset Wifi5 phyInterface 802.11n
keylset Wifi5 MgmtPhyRate 24
keylset Wifi5 Qos Enable
keylset Wifi5 BaseIp 192.168.1.12
keylset Wifi5 Channel $Channel5

#Group Wifi5 - Security Options
keylset Wifi5 Method {WPA2-PSK}
keylset Wifi5 EnableValidateCertificate off
keylset Wifi5 PskAscii charter123

set Wifi5_20 ${Wifi5}
keylset Wifi5_20 ChannelBandwidth 20

set Wifi5_40 ${Wifi5}
keylset Wifi5_40 ChannelBandwidth 40

set Wifi5_80 ${Wifi5}
keylset Wifi5_80 ChannelBandwidth 80
keylset Wifi5_80 phyInterface 802.11ac
keylset Wifi5_80 PlcpConfiguration vht_mixed

set Wifi5_20_1CLI ${Wifi5_20}
keylset Wifi5_20_1CLI NumClients 1

set Wifi5_20_10CLI ${Wifi5_20}
keylset Wifi5_20_10CLI NumClients 10

set Wifi5_20_25CLI ${Wifi5_20}
keylset Wifi5_20_25CLI NumClients 25

set Wifi5_40_1CLI ${Wifi5_40}
keylset Wifi5_40_1CLI NumClients 1

set Wifi5_40_10CLI ${Wifi5_40}
keylset Wifi5_40_10CLI NumClients 10

set Wifi5_40_25CLI ${Wifi5_40}
keylset Wifi5_40_25CLI NumClients 25

set Wifi5_80_1CLI ${Wifi5_80}
keylset Wifi5_80_1CLI NumClients 1

set Wifi5_80_10CLI ${Wifi5_80}
keylset Wifi5_80_10CLI NumClients 10

set Wifi5_80_25CLI ${Wifi5_80}
keylset Wifi5_80_25CLI NumClients 25



set Wifi5_20_a_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_a_1CLI phyInterface 802.11ag
set Wifi5_20_0_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_0_1CLI DataMcsIndex 0
set Wifi5_20_1_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_1_1CLI DataMcsIndex 1
set Wifi5_20_2_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_2_1CLI DataMcsIndex 2
set Wifi5_20_3_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_3_1CLI DataMcsIndex 3
set Wifi5_20_4_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_4_1CLI DataMcsIndex 4
set Wifi5_20_5_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_5_1CLI DataMcsIndex 5
set Wifi5_20_6_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_6_1CLI DataMcsIndex 6
set Wifi5_20_7_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_7_1CLI DataMcsIndex 7
set Wifi5_20_8_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_8_1CLI DataMcsIndex 8
set Wifi5_20_9_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_9_1CLI DataMcsIndex 9
set Wifi5_20_10_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_10_1CLI DataMcsIndex 10
set Wifi5_20_11_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_11_1CLI DataMcsIndex 11
set Wifi5_20_12_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_12_1CLI DataMcsIndex 12
set Wifi5_20_13_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_13_1CLI DataMcsIndex 13
set Wifi5_20_14_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_14_1CLI DataMcsIndex 14
set Wifi5_20_15_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_15_1CLI DataMcsIndex 15
set Wifi5_20_16_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_16_1CLI DataMcsIndex 16
set Wifi5_20_17_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_17_1CLI DataMcsIndex 17
set Wifi5_20_18_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_18_1CLI DataMcsIndex 18
set Wifi5_20_19_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_19_1CLI DataMcsIndex 19
set Wifi5_20_20_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_20_1CLI DataMcsIndex 20
set Wifi5_20_21_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_21_1CLI DataMcsIndex 21
set Wifi5_20_22_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_22_1CLI DataMcsIndex 22
set Wifi5_20_23_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_23_1CLI DataMcsIndex 23
set Wifi5_20_24_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_24_1CLI DataMcsIndex 24
set Wifi5_20_25_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_25_1CLI DataMcsIndex 25
set Wifi5_20_26_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_26_1CLI DataMcsIndex 26
set Wifi5_20_27_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_27_1CLI DataMcsIndex 27
set Wifi5_20_28_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_28_1CLI DataMcsIndex 28
set Wifi5_20_29_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_29_1CLI DataMcsIndex 29
set Wifi5_20_30_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_30_1CLI DataMcsIndex 30
set Wifi5_20_31_1CLI ${Wifi5_20_1CLI}
keylset Wifi5_20_31_1CLI DataMcsIndex 31


set Wifi5_20_a_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_a_10CLI phyInterface 802.11ag
set Wifi5_20_0_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_0_10CLI DataMcsIndex 0
set Wifi5_20_1_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_1_10CLI DataMcsIndex 1
set Wifi5_20_2_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_2_10CLI DataMcsIndex 2
set Wifi5_20_3_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_3_10CLI DataMcsIndex 3
set Wifi5_20_4_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_4_10CLI DataMcsIndex 4
set Wifi5_20_5_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_5_10CLI DataMcsIndex 5
set Wifi5_20_6_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_6_10CLI DataMcsIndex 6
set Wifi5_20_7_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_7_10CLI DataMcsIndex 7
set Wifi5_20_8_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_8_10CLI DataMcsIndex 8
set Wifi5_20_9_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_9_10CLI DataMcsIndex 9
set Wifi5_20_10_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_10_10CLI DataMcsIndex 10
set Wifi5_20_11_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_11_10CLI DataMcsIndex 11
set Wifi5_20_12_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_12_10CLI DataMcsIndex 12
set Wifi5_20_13_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_13_10CLI DataMcsIndex 13
set Wifi5_20_14_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_14_10CLI DataMcsIndex 14
set Wifi5_20_15_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_15_10CLI DataMcsIndex 15
set Wifi5_20_16_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_16_10CLI DataMcsIndex 16
set Wifi5_20_17_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_17_10CLI DataMcsIndex 17
set Wifi5_20_18_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_18_10CLI DataMcsIndex 18
set Wifi5_20_19_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_19_10CLI DataMcsIndex 19
set Wifi5_20_20_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_20_10CLI DataMcsIndex 20
set Wifi5_20_21_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_21_10CLI DataMcsIndex 21
set Wifi5_20_22_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_22_10CLI DataMcsIndex 22
set Wifi5_20_23_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_23_10CLI DataMcsIndex 23
set Wifi5_20_24_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_24_10CLI DataMcsIndex 24
set Wifi5_20_25_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_25_10CLI DataMcsIndex 25
set Wifi5_20_26_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_26_10CLI DataMcsIndex 26
set Wifi5_20_27_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_27_10CLI DataMcsIndex 27
set Wifi5_20_28_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_28_10CLI DataMcsIndex 28
set Wifi5_20_29_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_29_10CLI DataMcsIndex 29
set Wifi5_20_30_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_30_10CLI DataMcsIndex 30
set Wifi5_20_31_10CLI ${Wifi5_20_10CLI}
keylset Wifi5_20_31_10CLI DataMcsIndex 31

set Wifi5_20_a_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_a_25CLI phyInterface 802.11ag
set Wifi5_20_0_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_0_25CLI DataMcsIndex 0
set Wifi5_20_1_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_1_25CLI DataMcsIndex 1
set Wifi5_20_2_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_2_25CLI DataMcsIndex 2
set Wifi5_20_3_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_3_25CLI DataMcsIndex 3
set Wifi5_20_4_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_4_25CLI DataMcsIndex 4
set Wifi5_20_5_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_5_25CLI DataMcsIndex 5
set Wifi5_20_6_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_6_25CLI DataMcsIndex 6
set Wifi5_20_7_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_7_25CLI DataMcsIndex 7
set Wifi5_20_8_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_8_25CLI DataMcsIndex 8
set Wifi5_20_9_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_9_25CLI DataMcsIndex 9
set Wifi5_20_10_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_10_25CLI DataMcsIndex 10
set Wifi5_20_11_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_11_25CLI DataMcsIndex 11
set Wifi5_20_12_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_12_25CLI DataMcsIndex 12
set Wifi5_20_13_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_13_25CLI DataMcsIndex 13
set Wifi5_20_14_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_14_25CLI DataMcsIndex 14
set Wifi5_20_15_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_15_25CLI DataMcsIndex 15
set Wifi5_20_16_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_16_25CLI DataMcsIndex 16
set Wifi5_20_17_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_17_25CLI DataMcsIndex 17
set Wifi5_20_18_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_18_25CLI DataMcsIndex 18
set Wifi5_20_19_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_19_25CLI DataMcsIndex 19
set Wifi5_20_20_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_20_25CLI DataMcsIndex 20
set Wifi5_20_21_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_21_25CLI DataMcsIndex 21
set Wifi5_20_22_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_22_25CLI DataMcsIndex 22
set Wifi5_20_23_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_23_25CLI DataMcsIndex 23
set Wifi5_20_24_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_24_25CLI DataMcsIndex 24
set Wifi5_20_25_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_25_25CLI DataMcsIndex 25
set Wifi5_20_26_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_26_25CLI DataMcsIndex 26
set Wifi5_20_27_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_27_25CLI DataMcsIndex 27
set Wifi5_20_28_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_28_25CLI DataMcsIndex 28
set Wifi5_20_29_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_29_25CLI DataMcsIndex 29
set Wifi5_20_30_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_30_25CLI DataMcsIndex 30
set Wifi5_20_31_25CLI ${Wifi5_20_25CLI}
keylset Wifi5_20_31_25CLI DataMcsIndex 31


set Wifi5_40_0_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_0_1CLI DataMcsIndex 0
set Wifi5_40_1_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_1_1CLI DataMcsIndex 1
set Wifi5_40_2_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_2_1CLI DataMcsIndex 2
set Wifi5_40_3_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_3_1CLI DataMcsIndex 3
set Wifi5_40_4_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_4_1CLI DataMcsIndex 4
set Wifi5_40_5_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_5_1CLI DataMcsIndex 5
set Wifi5_40_6_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_6_1CLI DataMcsIndex 6
set Wifi5_40_7_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_7_1CLI DataMcsIndex 7
set Wifi5_40_8_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_8_1CLI DataMcsIndex 8
set Wifi5_40_9_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_9_1CLI DataMcsIndex 9
set Wifi5_40_10_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_10_1CLI DataMcsIndex 10
set Wifi5_40_11_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_11_1CLI DataMcsIndex 11
set Wifi5_40_12_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_12_1CLI DataMcsIndex 12
set Wifi5_40_13_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_13_1CLI DataMcsIndex 13
set Wifi5_40_14_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_14_1CLI DataMcsIndex 14
set Wifi5_40_15_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_15_1CLI DataMcsIndex 15
set Wifi5_40_16_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_16_1CLI DataMcsIndex 16
set Wifi5_40_17_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_17_1CLI DataMcsIndex 17
set Wifi5_40_18_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_18_1CLI DataMcsIndex 18
set Wifi5_40_19_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_19_1CLI DataMcsIndex 19
set Wifi5_40_20_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_20_1CLI DataMcsIndex 20
set Wifi5_40_21_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_21_1CLI DataMcsIndex 21
set Wifi5_40_22_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_22_1CLI DataMcsIndex 22
set Wifi5_40_23_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_23_1CLI DataMcsIndex 23
set Wifi5_40_24_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_24_1CLI DataMcsIndex 24
set Wifi5_40_25_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_25_1CLI DataMcsIndex 25
set Wifi5_40_26_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_26_1CLI DataMcsIndex 26
set Wifi5_40_27_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_27_1CLI DataMcsIndex 27
set Wifi5_40_28_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_28_1CLI DataMcsIndex 28
set Wifi5_40_29_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_29_1CLI DataMcsIndex 29
set Wifi5_40_30_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_30_1CLI DataMcsIndex 30
set Wifi5_40_31_1CLI ${Wifi5_40_1CLI}
keylset Wifi5_40_31_1CLI DataMcsIndex 31

set Wifi5_40_0_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_0_10CLI DataMcsIndex 0
set Wifi5_40_1_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_1_10CLI DataMcsIndex 1
set Wifi5_40_2_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_2_10CLI DataMcsIndex 2
set Wifi5_40_3_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_3_10CLI DataMcsIndex 3
set Wifi5_40_4_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_4_10CLI DataMcsIndex 4
set Wifi5_40_5_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_5_10CLI DataMcsIndex 5
set Wifi5_40_6_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_6_10CLI DataMcsIndex 6
set Wifi5_40_7_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_7_10CLI DataMcsIndex 7
set Wifi5_40_8_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_8_10CLI DataMcsIndex 8
set Wifi5_40_9_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_9_10CLI DataMcsIndex 9
set Wifi5_40_10_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_10_10CLI DataMcsIndex 10
set Wifi5_40_11_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_11_10CLI DataMcsIndex 11
set Wifi5_40_12_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_12_10CLI DataMcsIndex 12
set Wifi5_40_13_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_13_10CLI DataMcsIndex 13
set Wifi5_40_14_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_14_10CLI DataMcsIndex 14
set Wifi5_40_15_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_15_10CLI DataMcsIndex 15
set Wifi5_40_16_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_16_10CLI DataMcsIndex 16
set Wifi5_40_17_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_17_10CLI DataMcsIndex 17
set Wifi5_40_18_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_18_10CLI DataMcsIndex 18
set Wifi5_40_19_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_19_10CLI DataMcsIndex 19
set Wifi5_40_20_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_20_10CLI DataMcsIndex 20
set Wifi5_40_21_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_21_10CLI DataMcsIndex 21
set Wifi5_40_22_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_22_10CLI DataMcsIndex 22
set Wifi5_40_23_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_23_10CLI DataMcsIndex 23
set Wifi5_40_24_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_24_10CLI DataMcsIndex 24
set Wifi5_40_25_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_25_10CLI DataMcsIndex 25
set Wifi5_40_26_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_26_10CLI DataMcsIndex 26
set Wifi5_40_27_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_27_10CLI DataMcsIndex 27
set Wifi5_40_28_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_28_10CLI DataMcsIndex 28
set Wifi5_40_29_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_29_10CLI DataMcsIndex 29
set Wifi5_40_30_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_30_10CLI DataMcsIndex 30
set Wifi5_40_31_10CLI ${Wifi5_40_10CLI}
keylset Wifi5_40_31_10CLI DataMcsIndex 31

set Wifi5_40_0_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_0_25CLI DataMcsIndex 0
set Wifi5_40_1_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_1_25CLI DataMcsIndex 1
set Wifi5_40_2_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_2_25CLI DataMcsIndex 2
set Wifi5_40_3_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_3_25CLI DataMcsIndex 3
set Wifi5_40_4_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_4_25CLI DataMcsIndex 4
set Wifi5_40_5_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_5_25CLI DataMcsIndex 5
set Wifi5_40_6_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_6_25CLI DataMcsIndex 6
set Wifi5_40_7_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_7_25CLI DataMcsIndex 7
set Wifi5_40_8_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_8_25CLI DataMcsIndex 8
set Wifi5_40_9_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_9_25CLI DataMcsIndex 9
set Wifi5_40_10_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_10_25CLI DataMcsIndex 10
set Wifi5_40_11_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_11_25CLI DataMcsIndex 11
set Wifi5_40_12_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_12_25CLI DataMcsIndex 12
set Wifi5_40_13_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_13_25CLI DataMcsIndex 13
set Wifi5_40_14_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_14_25CLI DataMcsIndex 14
set Wifi5_40_15_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_15_25CLI DataMcsIndex 15
set Wifi5_40_16_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_16_25CLI DataMcsIndex 16
set Wifi5_40_17_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_17_25CLI DataMcsIndex 17
set Wifi5_40_18_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_18_25CLI DataMcsIndex 18
set Wifi5_40_19_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_19_25CLI DataMcsIndex 19
set Wifi5_40_20_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_20_25CLI DataMcsIndex 20
set Wifi5_40_21_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_21_25CLI DataMcsIndex 21
set Wifi5_40_22_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_22_25CLI DataMcsIndex 22
set Wifi5_40_23_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_23_25CLI DataMcsIndex 23
set Wifi5_40_24_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_24_25CLI DataMcsIndex 24
set Wifi5_40_25_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_25_25CLI DataMcsIndex 25
set Wifi5_40_26_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_26_25CLI DataMcsIndex 26
set Wifi5_40_27_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_27_25CLI DataMcsIndex 27
set Wifi5_40_28_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_28_25CLI DataMcsIndex 28
set Wifi5_40_29_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_29_25CLI DataMcsIndex 29
set Wifi5_40_30_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_30_25CLI DataMcsIndex 30
set Wifi5_40_31_25CLI ${Wifi5_40_25CLI}
keylset Wifi5_40_31_25CLI DataMcsIndex 31


set Wifi5_AC_S1_0_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_0_1CLI USDataMcs 0
keylset Wifi5_AC_S1_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_S1_0_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_1_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_1_1CLI USDataMcs 1
keylset Wifi5_AC_S1_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_S1_1_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_2_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_2_1CLI USDataMcs 2
keylset Wifi5_AC_S1_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_S1_2_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_3_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_3_1CLI USDataMcs 3
keylset Wifi5_AC_S1_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_S1_3_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_4_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_4_1CLI USDataMcs 4
keylset Wifi5_AC_S1_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_S1_4_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_5_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_5_1CLI USDataMcs 5
keylset Wifi5_AC_S1_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_S1_5_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_6_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_6_1CLI USDataMcs 6
keylset Wifi5_AC_S1_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_S1_6_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_7_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_7_1CLI USDataMcs 7
keylset Wifi5_AC_S1_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_S1_7_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_8_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_8_1CLI USDataMcs 8
keylset Wifi5_AC_S1_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_S1_8_1CLI NumSpatialStreams 1
set Wifi5_AC_S1_9_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S1_9_1CLI USDataMcs 9
keylset Wifi5_AC_S1_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_S1_9_1CLI NumSpatialStreams 1

set Wifi5_AC_S1_0_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_0_10CLI USDataMcs 0
keylset Wifi5_AC_S1_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_S1_0_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_1_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_1_10CLI USDataMcs 1
keylset Wifi5_AC_S1_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_S1_1_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_2_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_2_10CLI USDataMcs 2
keylset Wifi5_AC_S1_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_S1_2_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_3_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_3_10CLI USDataMcs 3
keylset Wifi5_AC_S1_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_S1_3_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_4_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_4_10CLI USDataMcs 4
keylset Wifi5_AC_S1_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_S1_4_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_5_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_5_10CLI USDataMcs 5
keylset Wifi5_AC_S1_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_S1_5_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_6_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_6_10CLI USDataMcs 6
keylset Wifi5_AC_S1_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_S1_6_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_7_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_7_10CLI USDataMcs 7
keylset Wifi5_AC_S1_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_S1_7_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_8_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_8_10CLI USDataMcs 8
keylset Wifi5_AC_S1_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_S1_8_10CLI NumSpatialStreams 1
set Wifi5_AC_S1_9_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S1_9_10CLI USDataMcs 9
keylset Wifi5_AC_S1_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_S1_9_10CLI NumSpatialStreams 1

set Wifi5_AC_S1_0_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_0_25CLI USDataMcs 0
keylset Wifi5_AC_S1_0_25CLI VhtDataMcs 0
keylset Wifi5_AC_S1_0_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_1_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_1_25CLI USDataMcs 1
keylset Wifi5_AC_S1_1_25CLI VhtDataMcs 1
keylset Wifi5_AC_S1_1_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_2_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_2_25CLI USDataMcs 2
keylset Wifi5_AC_S1_2_25CLI VhtDataMcs 2
keylset Wifi5_AC_S1_2_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_3_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_3_25CLI USDataMcs 3
keylset Wifi5_AC_S1_3_25CLI VhtDataMcs 3
keylset Wifi5_AC_S1_3_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_4_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_4_25CLI USDataMcs 4
keylset Wifi5_AC_S1_4_25CLI VhtDataMcs 4
keylset Wifi5_AC_S1_4_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_5_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_5_25CLI USDataMcs 5
keylset Wifi5_AC_S1_5_25CLI VhtDataMcs 5
keylset Wifi5_AC_S1_5_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_6_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_6_25CLI USDataMcs 6
keylset Wifi5_AC_S1_6_25CLI VhtDataMcs 6
keylset Wifi5_AC_S1_6_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_7_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_7_25CLI USDataMcs 7
keylset Wifi5_AC_S1_7_25CLI VhtDataMcs 7
keylset Wifi5_AC_S1_7_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_8_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_8_25CLI USDataMcs 8
keylset Wifi5_AC_S1_8_25CLI VhtDataMcs 8
keylset Wifi5_AC_S1_8_25CLI NumSpatialStreams 1
set Wifi5_AC_S1_9_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S1_9_25CLI USDataMcs 9
keylset Wifi5_AC_S1_9_25CLI VhtDataMcs 9
keylset Wifi5_AC_S1_9_25CLI NumSpatialStreams 1

set Wifi5_AC_S2_0_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_0_1CLI USDataMcs 0
keylset Wifi5_AC_S2_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_S2_0_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_1_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_1_1CLI USDataMcs 1
keylset Wifi5_AC_S2_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_S2_1_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_2_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_2_1CLI USDataMcs 2
keylset Wifi5_AC_S2_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_S2_2_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_3_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_3_1CLI USDataMcs 3
keylset Wifi5_AC_S2_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_S2_3_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_4_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_4_1CLI USDataMcs 4
keylset Wifi5_AC_S2_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_S2_4_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_5_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_5_1CLI USDataMcs 5
keylset Wifi5_AC_S2_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_S2_5_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_6_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_6_1CLI USDataMcs 6
keylset Wifi5_AC_S2_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_S2_6_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_7_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_7_1CLI USDataMcs 7
keylset Wifi5_AC_S2_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_S2_7_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_8_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_8_1CLI USDataMcs 8
keylset Wifi5_AC_S2_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_S2_8_1CLI NumSpatialStreams 2
set Wifi5_AC_S2_9_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S2_9_1CLI USDataMcs 9
keylset Wifi5_AC_S2_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_S2_9_1CLI NumSpatialStreams 2

set Wifi5_AC_S2_0_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_0_10CLI USDataMcs 0
keylset Wifi5_AC_S2_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_S2_0_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_1_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_1_10CLI USDataMcs 1
keylset Wifi5_AC_S2_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_S2_1_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_2_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_2_10CLI USDataMcs 2
keylset Wifi5_AC_S2_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_S2_2_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_3_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_3_10CLI USDataMcs 3
keylset Wifi5_AC_S2_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_S2_3_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_4_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_4_10CLI USDataMcs 4
keylset Wifi5_AC_S2_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_S2_4_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_5_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_5_10CLI USDataMcs 5
keylset Wifi5_AC_S2_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_S2_5_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_6_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_6_10CLI USDataMcs 6
keylset Wifi5_AC_S2_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_S2_6_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_7_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_7_10CLI USDataMcs 7
keylset Wifi5_AC_S2_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_S2_7_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_8_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_8_10CLI USDataMcs 8
keylset Wifi5_AC_S2_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_S2_8_10CLI NumSpatialStreams 2
set Wifi5_AC_S2_9_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S2_9_10CLI USDataMcs 9
keylset Wifi5_AC_S2_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_S2_9_10CLI NumSpatialStreams 2

set Wifi5_AC_S2_0_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_0_25CLI USDataMcs 0
keylset Wifi5_AC_S2_0_25CLI VhtDataMcs 0
keylset Wifi5_AC_S2_0_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_1_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_1_25CLI USDataMcs 1
keylset Wifi5_AC_S2_1_25CLI VhtDataMcs 1
keylset Wifi5_AC_S2_1_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_2_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_2_25CLI USDataMcs 2
keylset Wifi5_AC_S2_2_25CLI VhtDataMcs 2
keylset Wifi5_AC_S2_2_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_3_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_3_25CLI USDataMcs 3
keylset Wifi5_AC_S2_3_25CLI VhtDataMcs 3
keylset Wifi5_AC_S2_3_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_4_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_4_25CLI USDataMcs 4
keylset Wifi5_AC_S2_4_25CLI VhtDataMcs 4
keylset Wifi5_AC_S2_4_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_5_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_5_25CLI USDataMcs 5
keylset Wifi5_AC_S2_5_25CLI VhtDataMcs 5
keylset Wifi5_AC_S2_5_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_6_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_6_25CLI USDataMcs 6
keylset Wifi5_AC_S2_6_25CLI VhtDataMcs 6
keylset Wifi5_AC_S2_6_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_7_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_7_25CLI USDataMcs 7
keylset Wifi5_AC_S2_7_25CLI VhtDataMcs 7
keylset Wifi5_AC_S2_7_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_8_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_8_25CLI USDataMcs 8
keylset Wifi5_AC_S2_8_25CLI VhtDataMcs 8
keylset Wifi5_AC_S2_8_25CLI NumSpatialStreams 2
set Wifi5_AC_S2_9_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S2_9_25CLI USDataMcs 9
keylset Wifi5_AC_S2_9_25CLI VhtDataMcs 9
keylset Wifi5_AC_S2_9_25CLI NumSpatialStreams 2

set Wifi5_AC_S3_0_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_0_1CLI USDataMcs 0
keylset Wifi5_AC_S3_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_S3_0_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_1_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_1_1CLI USDataMcs 1
keylset Wifi5_AC_S3_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_S3_1_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_2_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_2_1CLI USDataMcs 2
keylset Wifi5_AC_S3_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_S3_2_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_3_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_3_1CLI USDataMcs 3
keylset Wifi5_AC_S3_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_S3_3_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_4_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_4_1CLI USDataMcs 4
keylset Wifi5_AC_S3_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_S3_4_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_5_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_5_1CLI USDataMcs 5
keylset Wifi5_AC_S3_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_S3_5_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_6_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_6_1CLI USDataMcs 6
keylset Wifi5_AC_S3_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_S3_6_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_7_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_7_1CLI USDataMcs 7
keylset Wifi5_AC_S3_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_S3_7_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_8_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_8_1CLI USDataMcs 8
keylset Wifi5_AC_S3_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_S3_8_1CLI NumSpatialStreams 3
set Wifi5_AC_S3_9_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S3_9_1CLI USDataMcs 9
keylset Wifi5_AC_S3_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_S3_9_1CLI NumSpatialStreams 3

set Wifi5_AC_S3_0_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_0_10CLI USDataMcs 0
keylset Wifi5_AC_S3_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_S3_0_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_1_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_1_10CLI USDataMcs 1
keylset Wifi5_AC_S3_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_S3_1_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_2_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_2_10CLI USDataMcs 2
keylset Wifi5_AC_S3_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_S3_3_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_3_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_3_10CLI USDataMcs 3
keylset Wifi5_AC_S3_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_S3_3_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_4_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_4_10CLI USDataMcs 4
keylset Wifi5_AC_S3_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_S3_4_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_5_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_5_10CLI USDataMcs 5
keylset Wifi5_AC_S3_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_S3_5_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_6_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_6_10CLI USDataMcs 6
keylset Wifi5_AC_S3_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_S3_6_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_7_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_7_10CLI USDataMcs 7
keylset Wifi5_AC_S3_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_S3_7_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_8_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_8_10CLI USDataMcs 8
keylset Wifi5_AC_S3_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_S3_8_10CLI NumSpatialStreams 3
set Wifi5_AC_S3_9_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S3_9_10CLI USDataMcs 9
keylset Wifi5_AC_S3_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_S3_9_10CLI NumSpatialStreams 3

set Wifi5_AC_S3_0_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_0_25CLI USDataMcs 0
keylset Wifi5_AC_S3_0_25CLI VhtDataMcs 0
keylset Wifi5_AC_S3_0_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_1_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_1_25CLI USDataMcs 1
keylset Wifi5_AC_S3_1_25CLI VhtDataMcs 1
keylset Wifi5_AC_S3_1_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_2_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_2_25CLI USDataMcs 2
keylset Wifi5_AC_S3_2_25CLI VhtDataMcs 2
keylset Wifi5_AC_S3_3_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_3_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_3_25CLI USDataMcs 3
keylset Wifi5_AC_S3_3_25CLI VhtDataMcs 3
keylset Wifi5_AC_S3_3_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_4_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_4_25CLI USDataMcs 4
keylset Wifi5_AC_S3_4_25CLI VhtDataMcs 4
keylset Wifi5_AC_S3_4_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_5_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_5_25CLI USDataMcs 5
keylset Wifi5_AC_S3_5_25CLI VhtDataMcs 5
keylset Wifi5_AC_S3_5_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_6_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_6_25CLI USDataMcs 6
keylset Wifi5_AC_S3_6_25CLI VhtDataMcs 6
keylset Wifi5_AC_S3_6_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_7_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_7_25CLI USDataMcs 7
keylset Wifi5_AC_S3_7_25CLI VhtDataMcs 7
keylset Wifi5_AC_S3_7_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_8_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_8_25CLI USDataMcs 8
keylset Wifi5_AC_S3_8_25CLI VhtDataMcs 8
keylset Wifi5_AC_S3_8_25CLI NumSpatialStreams 3
set Wifi5_AC_S3_9_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S3_9_25CLI USDataMcs 9
keylset Wifi5_AC_S3_9_25CLI VhtDataMcs 9
keylset Wifi5_AC_S3_9_25CLI NumSpatialStreams 3

set Wifi5_AC_S4_0_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_0_1CLI USDataMcs 0
keylset Wifi5_AC_S4_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_S4_0_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_1_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_1_1CLI USDataMcs 1
keylset Wifi5_AC_S4_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_S4_1_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_2_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_2_1CLI USDataMcs 2
keylset Wifi5_AC_S4_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_S4_2_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_3_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_3_1CLI USDataMcs 3
keylset Wifi5_AC_S4_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_S4_3_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_4_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_4_1CLI USDataMcs 4
keylset Wifi5_AC_S4_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_S4_4_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_5_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_5_1CLI USDataMcs 5
keylset Wifi5_AC_S4_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_S4_5_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_6_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_6_1CLI USDataMcs 6
keylset Wifi5_AC_S4_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_S4_6_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_7_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_7_1CLI USDataMcs 7
keylset Wifi5_AC_S4_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_S4_7_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_8_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_8_1CLI USDataMcs 8
keylset Wifi5_AC_S4_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_S4_8_1CLI NumSpatialStreams 4
set Wifi5_AC_S4_9_1CLI ${Wifi5_80_1CLI}
keylset Wifi5_AC_S4_9_1CLI USDataMcs 9
keylset Wifi5_AC_S4_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_S4_9_1CLI NumSpatialStreams 4

set Wifi5_AC_S4_0_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_0_10CLI USDataMcs 0
keylset Wifi5_AC_S4_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_S4_0_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_1_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_1_10CLI USDataMcs 1
keylset Wifi5_AC_S4_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_S4_1_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_2_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_2_10CLI USDataMcs 2
keylset Wifi5_AC_S4_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_S4_3_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_3_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_3_10CLI USDataMcs 3
keylset Wifi5_AC_S4_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_S4_3_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_4_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_4_10CLI USDataMcs 4
keylset Wifi5_AC_S4_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_S4_4_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_5_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_5_10CLI USDataMcs 5
keylset Wifi5_AC_S4_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_S4_5_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_6_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_6_10CLI USDataMcs 6
keylset Wifi5_AC_S4_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_S4_6_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_7_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_7_10CLI USDataMcs 7
keylset Wifi5_AC_S4_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_S4_7_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_8_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_8_10CLI USDataMcs 8
keylset Wifi5_AC_S4_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_S4_8_10CLI NumSpatialStreams 4
set Wifi5_AC_S4_9_10CLI ${Wifi5_80_10CLI}
keylset Wifi5_AC_S4_9_10CLI USDataMcs 9
keylset Wifi5_AC_S4_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_S4_9_10CLI NumSpatialStreams 4

set Wifi5_AC_S4_0_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_0_25CLI USDataMcs 0
keylset Wifi5_AC_S4_0_25CLI VhtDataMcs 0
keylset Wifi5_AC_S4_0_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_1_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_1_25CLI USDataMcs 1
keylset Wifi5_AC_S4_1_25CLI VhtDataMcs 1
keylset Wifi5_AC_S4_1_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_2_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_2_25CLI USDataMcs 2
keylset Wifi5_AC_S4_2_25CLI VhtDataMcs 2
keylset Wifi5_AC_S4_2_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_3_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_3_25CLI USDataMcs 3
keylset Wifi5_AC_S4_3_25CLI VhtDataMcs 3
keylset Wifi5_AC_S4_3_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_4_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_4_25CLI USDataMcs 4
keylset Wifi5_AC_S4_4_25CLI VhtDataMcs 4
keylset Wifi5_AC_S4_4_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_5_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_5_25CLI USDataMcs 5
keylset Wifi5_AC_S4_5_25CLI VhtDataMcs 5
keylset Wifi5_AC_S4_5_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_6_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_6_25CLI USDataMcs 6
keylset Wifi5_AC_S4_6_25CLI VhtDataMcs 6
keylset Wifi5_AC_S4_6_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_7_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_7_25CLI USDataMcs 7
keylset Wifi5_AC_S4_7_25CLI VhtDataMcs 7
keylset Wifi5_AC_S4_7_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_8_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_8_25CLI USDataMcs 8
keylset Wifi5_AC_S4_8_25CLI VhtDataMcs 8
keylset Wifi5_AC_S4_8_25CLI NumSpatialStreams 4
set Wifi5_AC_S4_9_25CLI ${Wifi5_80_25CLI}
keylset Wifi5_AC_S4_9_25CLI USDataMcs 9
keylset Wifi5_AC_S4_9_25CLI VhtDataMcs 9
keylset Wifi5_AC_S4_9_25CLI NumSpatialStreams 4




#tcp_goodput Options
keylset tcp_goodput Test tcp_goodput
keylset tcp_goodput FrameSizeList {536 1460}
keylset tcp_goodput AcceptableGoodput 0

#Eth to Eth2 test
set TCP_ETH_ETH2_10CLI ${tcp_goodput}
keylset TCP_ETH_ETH2_10CLI Direction {Unidirectional}
keylset TCP_ETH_ETH2_10CLI Source {Eth_5CLI}
keylset TCP_ETH_ETH2_10CLI Destination {Eth_2_5CLI}




#TCP_24_20_M31_C1_DS
set TCP_24_20_M31_C1_DS ${tcp_goodput}
keylset TCP_24_20_M31_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M31_C1_DS Source {Eth}
keylset TCP_24_20_M31_C1_DS Destination {Wifi2_31_1CLI}
keylset TCP_24_20_M31_C1_DS TrialDuration 15
keylset TCP_24_20_M31_C1_DS TestDurationSec 15
#TCP_24_20_M31_C1_US
set TCP_24_20_M31_C1_US ${tcp_goodput}
keylset TCP_24_20_M31_C1_US Direction {Unidirectional}
keylset TCP_24_20_M31_C1_US Source {Wifi2_31_1CLI}
keylset TCP_24_20_M31_C1_US Destination {Eth}
keylset TCP_24_20_M31_C1_US TrialDuration 15
keylset TCP_24_20_M31_C1_US TestDurationSec 15
#TCP_24_20_M30_C1_DS
set TCP_24_20_M30_C1_DS ${tcp_goodput}
keylset TCP_24_20_M30_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M30_C1_DS Source {Eth}
keylset TCP_24_20_M30_C1_DS Destination {Wifi2_30_1CLI}
#TCP_24_20_M30_C1_US
set TCP_24_20_M30_C1_US ${tcp_goodput}
keylset TCP_24_20_M30_C1_US Direction {Unidirectional}
keylset TCP_24_20_M30_C1_US Source {Wifi2_30_1CLI}
keylset TCP_24_20_M30_C1_US Destination {Eth}
#TCP_24_20_M29_C1_DS
set TCP_24_20_M29_C1_DS ${tcp_goodput}
keylset TCP_24_20_M29_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M29_C1_DS Source {Eth}
keylset TCP_24_20_M29_C1_DS Destination {Wifi2_29_1CLI}
#TCP_24_20_M29_C1_US
set TCP_24_20_M29_C1_US ${tcp_goodput}
keylset TCP_24_20_M29_C1_US Direction {Unidirectional}
keylset TCP_24_20_M29_C1_US Source {Wifi2_29_1CLI}
keylset TCP_24_20_M29_C1_US Destination {Eth}
#TCP_24_20_M28_C1_DS
set TCP_24_20_M28_C1_DS ${tcp_goodput}
keylset TCP_24_20_M28_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M28_C1_DS Source {Eth}
keylset TCP_24_20_M28_C1_DS Destination {Wifi2_28_1CLI}
#TCP_24_20_M28_C1_US
set TCP_24_20_M28_C1_US ${tcp_goodput}
keylset TCP_24_20_M28_C1_US Direction {Unidirectional}
keylset TCP_24_20_M28_C1_US Source {Wifi2_28_1CLI}
keylset TCP_24_20_M28_C1_US Destination {Eth}
#TCP_24_20_M27_C1_DS
set TCP_24_20_M27_C1_DS ${tcp_goodput}
keylset TCP_24_20_M27_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M27_C1_DS Source {Eth}
keylset TCP_24_20_M27_C1_DS Destination {Wifi2_27_1CLI}
#TCP_24_20_M27_C1_US
set TCP_24_20_M27_C1_US ${tcp_goodput}
keylset TCP_24_20_M27_C1_US Direction {Unidirectional}
keylset TCP_24_20_M27_C1_US Source {Wifi2_27_1CLI}
keylset TCP_24_20_M27_C1_US Destination {Eth}
#TCP_24_20_M26_C1_DS
set TCP_24_20_M26_C1_DS ${tcp_goodput}
keylset TCP_24_20_M26_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M26_C1_DS Source {Eth}
keylset TCP_24_20_M26_C1_DS Destination {Wifi2_26_1CLI}
#TCP_24_20_M26_C1_US
set TCP_24_20_M26_C1_US ${tcp_goodput}
keylset TCP_24_20_M26_C1_US Direction {Unidirectional}
keylset TCP_24_20_M26_C1_US Source {Wifi2_26_1CLI}
keylset TCP_24_20_M26_C1_US Destination {Eth}
#TCP_24_20_M25_C1_DS
set TCP_24_20_M25_C1_DS ${tcp_goodput}
keylset TCP_24_20_M25_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M25_C1_DS Source {Eth}
keylset TCP_24_20_M25_C1_DS Destination {Wifi2_25_1CLI}
#TCP_24_20_M25_C1_US
set TCP_24_20_M25_C1_US ${tcp_goodput}
keylset TCP_24_20_M25_C1_US Direction {Unidirectional}
keylset TCP_24_20_M25_C1_US Source {Wifi2_25_1CLI}
keylset TCP_24_20_M25_C1_US Destination {Eth}
#TCP_24_20_M24_C1_DS
set TCP_24_20_M24_C1_DS ${tcp_goodput}
keylset TCP_24_20_M24_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M24_C1_DS Source {Eth}
keylset TCP_24_20_M24_C1_DS Destination {Wifi2_24_1CLI}
#TCP_24_20_M24_C1_US
set TCP_24_20_M24_C1_US ${tcp_goodput}
keylset TCP_24_20_M24_C1_US Direction {Unidirectional}
keylset TCP_24_20_M24_C1_US Source {Wifi2_24_1CLI}
keylset TCP_24_20_M24_C1_US Destination {Eth}
#TCP_24_20_M23_C1_DS
set TCP_24_20_M23_C1_DS ${tcp_goodput}
keylset TCP_24_20_M23_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M23_C1_DS Source {Eth}
keylset TCP_24_20_M23_C1_DS Destination {Wifi2_23_1CLI}
keylset TCP_24_20_M23_C1_DS TrialDuration 15
keylset TCP_24_20_M23_C1_DS TestDurationSec 15
#TCP_24_20_M23_C1_US
set TCP_24_20_M23_C1_US ${tcp_goodput}
keylset TCP_24_20_M23_C1_US Direction {Unidirectional}
keylset TCP_24_20_M23_C1_US Source {Wifi2_23_1CLI}
keylset TCP_24_20_M23_C1_US Destination {Eth}
keylset TCP_24_20_M23_C1_US TrialDuration 15
keylset TCP_24_20_M23_C1_US TestDurationSec 15
#TCP_24_20_M22_C1_DS
set TCP_24_20_M22_C1_DS ${tcp_goodput}
keylset TCP_24_20_M22_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M22_C1_DS Source {Eth}
keylset TCP_24_20_M22_C1_DS Destination {Wifi2_22_1CLI}
#TCP_24_20_M22_C1_US
set TCP_24_20_M22_C1_US ${tcp_goodput}
keylset TCP_24_20_M22_C1_US Direction {Unidirectional}
keylset TCP_24_20_M22_C1_US Source {Wifi2_22_1CLI}
keylset TCP_24_20_M22_C1_US Destination {Eth}
#TCP_24_20_M21_C1_DS
set TCP_24_20_M21_C1_DS ${tcp_goodput}
keylset TCP_24_20_M21_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M21_C1_DS Source {Eth}
keylset TCP_24_20_M21_C1_DS Destination {Wifi2_21_1CLI}
#TCP_24_20_M21_C1_US
set TCP_24_20_M21_C1_US ${tcp_goodput}
keylset TCP_24_20_M21_C1_US Direction {Unidirectional}
keylset TCP_24_20_M21_C1_US Source {Wifi2_21_1CLI}
keylset TCP_24_20_M21_C1_US Destination {Eth}
#TCP_24_20_M20_C1_DS
set TCP_24_20_M20_C1_DS ${tcp_goodput}
keylset TCP_24_20_M20_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M20_C1_DS Source {Eth}
keylset TCP_24_20_M20_C1_DS Destination {Wifi2_20_1CLI}
#TCP_24_20_M20_C1_US
set TCP_24_20_M20_C1_US ${tcp_goodput}
keylset TCP_24_20_M20_C1_US Direction {Unidirectional}
keylset TCP_24_20_M20_C1_US Source {Wifi2_20_1CLI}
keylset TCP_24_20_M20_C1_US Destination {Eth}
#TCP_24_20_M19_C1_DS
set TCP_24_20_M19_C1_DS ${tcp_goodput}
keylset TCP_24_20_M19_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M19_C1_DS Source {Eth}
keylset TCP_24_20_M19_C1_DS Destination {Wifi2_19_1CLI}
#TCP_24_20_M19_C1_US
set TCP_24_20_M19_C1_US ${tcp_goodput}
keylset TCP_24_20_M19_C1_US Direction {Unidirectional}
keylset TCP_24_20_M19_C1_US Source {Wifi2_19_1CLI}
keylset TCP_24_20_M19_C1_US Destination {Eth}
#TCP_24_20_M18_C1_DS
set TCP_24_20_M18_C1_DS ${tcp_goodput}
keylset TCP_24_20_M18_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M18_C1_DS Source {Eth}
keylset TCP_24_20_M18_C1_DS Destination {Wifi2_18_1CLI}
#TCP_24_20_M18_C1_US
set TCP_24_20_M18_C1_US ${tcp_goodput}
keylset TCP_24_20_M18_C1_US Direction {Unidirectional}
keylset TCP_24_20_M18_C1_US Source {Wifi2_18_1CLI}
keylset TCP_24_20_M18_C1_US Destination {Eth}
#TCP_24_20_M17_C1_DS
set TCP_24_20_M17_C1_DS ${tcp_goodput}
keylset TCP_24_20_M17_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M17_C1_DS Source {Eth}
keylset TCP_24_20_M17_C1_DS Destination {Wifi2_17_1CLI}
#TCP_24_20_M17_C1_US
set TCP_24_20_M17_C1_US ${tcp_goodput}
keylset TCP_24_20_M17_C1_US Direction {Unidirectional}
keylset TCP_24_20_M17_C1_US Source {Wifi2_17_1CLI}
keylset TCP_24_20_M17_C1_US Destination {Eth}
#TCP_24_20_M16_C1_DS
set TCP_24_20_M16_C1_DS ${tcp_goodput}
keylset TCP_24_20_M16_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M16_C1_DS Source {Eth}
keylset TCP_24_20_M16_C1_DS Destination {Wifi2_16_1CLI}
#TCP_24_20_M16_C1_US
set TCP_24_20_M16_C1_US ${tcp_goodput}
keylset TCP_24_20_M16_C1_US Direction {Unidirectional}
keylset TCP_24_20_M16_C1_US Source {Wifi2_16_1CLI}
keylset TCP_24_20_M16_C1_US Destination {Eth}
#TCP_24_20_M15_C1_DS
set TCP_24_20_M15_C1_DS ${tcp_goodput}
keylset TCP_24_20_M15_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M15_C1_DS Source {Eth}
keylset TCP_24_20_M15_C1_DS Destination {Wifi2_15_1CLI}
keylset TCP_24_20_M15_C1_DS TrialDuration 15
keylset TCP_24_20_M15_C1_DS TestDurationSec 15
#TCP_24_20_M15_C1_US
set TCP_24_20_M15_C1_US ${tcp_goodput}
keylset TCP_24_20_M15_C1_US Direction {Unidirectional}
keylset TCP_24_20_M15_C1_US Source {Wifi2_15_1CLI}
keylset TCP_24_20_M15_C1_US Destination {Eth}
keylset TCP_24_20_M15_C1_US TrialDuration 15
keylset TCP_24_20_M15_C1_US TestDurationSec 15
#TCP_24_20_M14_C1_DS
set TCP_24_20_M14_C1_DS ${tcp_goodput}
keylset TCP_24_20_M14_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M14_C1_DS Source {Eth}
keylset TCP_24_20_M14_C1_DS Destination {Wifi2_14_1CLI}
#TCP_24_20_M14_C1_US
set TCP_24_20_M14_C1_US ${tcp_goodput}
keylset TCP_24_20_M14_C1_US Direction {Unidirectional}
keylset TCP_24_20_M14_C1_US Source {Wifi2_14_1CLI}
keylset TCP_24_20_M14_C1_US Destination {Eth}
#TCP_24_20_M13_C1_DS
set TCP_24_20_M13_C1_DS ${tcp_goodput}
keylset TCP_24_20_M13_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M13_C1_DS Source {Eth}
keylset TCP_24_20_M13_C1_DS Destination {Wifi2_13_1CLI}
#TCP_24_20_M13_C1_US
set TCP_24_20_M13_C1_US ${tcp_goodput}
keylset TCP_24_20_M13_C1_US Direction {Unidirectional}
keylset TCP_24_20_M13_C1_US Source {Wifi2_13_1CLI}
keylset TCP_24_20_M13_C1_US Destination {Eth}
#TCP_24_20_M12_C1_DS
set TCP_24_20_M12_C1_DS ${tcp_goodput}
keylset TCP_24_20_M12_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M12_C1_DS Source {Eth}
keylset TCP_24_20_M12_C1_DS Destination {Wifi2_12_1CLI}
#TCP_24_20_M12_C1_US
set TCP_24_20_M12_C1_US ${tcp_goodput}
keylset TCP_24_20_M12_C1_US Direction {Unidirectional}
keylset TCP_24_20_M12_C1_US Source {Wifi2_12_1CLI}
keylset TCP_24_20_M12_C1_US Destination {Eth}
#TCP_24_20_M11_C1_DS
set TCP_24_20_M11_C1_DS ${tcp_goodput}
keylset TCP_24_20_M11_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M11_C1_DS Source {Eth}
keylset TCP_24_20_M11_C1_DS Destination {Wifi2_11_1CLI}
#TCP_24_20_M11_C1_US
set TCP_24_20_M11_C1_US ${tcp_goodput}
keylset TCP_24_20_M11_C1_US Direction {Unidirectional}
keylset TCP_24_20_M11_C1_US Source {Wifi2_11_1CLI}
keylset TCP_24_20_M11_C1_US Destination {Eth}
#TCP_24_20_M10_C1_DS
set TCP_24_20_M10_C1_DS ${tcp_goodput}
keylset TCP_24_20_M10_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M10_C1_DS Source {Eth}
keylset TCP_24_20_M10_C1_DS Destination {Wifi2_10_1CLI}
#TCP_24_20_M10_C1_US
set TCP_24_20_M10_C1_US ${tcp_goodput}
keylset TCP_24_20_M10_C1_US Direction {Unidirectional}
keylset TCP_24_20_M10_C1_US Source {Wifi2_10_1CLI}
keylset TCP_24_20_M10_C1_US Destination {Eth}
#TCP_24_20_M9_C1_DS
set TCP_24_20_M9_C1_DS ${tcp_goodput}
keylset TCP_24_20_M9_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M9_C1_DS Source {Eth}
keylset TCP_24_20_M9_C1_DS Destination {Wifi2_9_1CLI}
#TCP_24_20_M9_C1_US
set TCP_24_20_M9_C1_US ${tcp_goodput}
keylset TCP_24_20_M9_C1_US Direction {Unidirectional}
keylset TCP_24_20_M9_C1_US Source {Wifi2_9_1CLI}
keylset TCP_24_20_M9_C1_US Destination {Eth}
#TCP_24_20_M8_C1_DS
set TCP_24_20_M8_C1_DS ${tcp_goodput}
keylset TCP_24_20_M8_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M8_C1_DS Source {Eth}
keylset TCP_24_20_M8_C1_DS Destination {Wifi2_8_1CLI}
#TCP_24_20_M8_C1_US
set TCP_24_20_M8_C1_US ${tcp_goodput}
keylset TCP_24_20_M8_C1_US Direction {Unidirectional}
keylset TCP_24_20_M8_C1_US Source {Wifi2_8_1CLI}
keylset TCP_24_20_M8_C1_US Destination {Eth}
#TCP_24_20_M7_C1_DS
set TCP_24_20_M7_C1_DS ${tcp_goodput}
keylset TCP_24_20_M7_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M7_C1_DS Source {Eth}
keylset TCP_24_20_M7_C1_DS Destination {Wifi2_7_1CLI}
keylset TCP_24_20_M7_C1_DS TrialDuration 15
keylset TCP_24_20_M7_C1_DS TestDurationSec 15
#TCP_24_20_M7_C1_US
set TCP_24_20_M7_C1_US ${tcp_goodput}
keylset TCP_24_20_M7_C1_US Direction {Unidirectional}
keylset TCP_24_20_M7_C1_US Source {Wifi2_7_1CLI}
keylset TCP_24_20_M7_C1_US Destination {Eth}
keylset TCP_24_20_M7_C1_US TrialDuration 15
keylset TCP_24_20_M7_C1_US TestDurationSec 15
#TCP_24_20_M6_C1_DS
set TCP_24_20_M6_C1_DS ${tcp_goodput}
keylset TCP_24_20_M6_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M6_C1_DS Source {Eth}
keylset TCP_24_20_M6_C1_DS Destination {Wifi2_6_1CLI}
#TCP_24_20_M6_C1_US
set TCP_24_20_M6_C1_US ${tcp_goodput}
keylset TCP_24_20_M6_C1_US Direction {Unidirectional}
keylset TCP_24_20_M6_C1_US Source {Wifi2_6_1CLI}
keylset TCP_24_20_M6_C1_US Destination {Eth}
#TCP_24_20_M5_C1_DS
set TCP_24_20_M5_C1_DS ${tcp_goodput}
keylset TCP_24_20_M5_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M5_C1_DS Source {Eth}
keylset TCP_24_20_M5_C1_DS Destination {Wifi2_5_1CLI}
#TCP_24_20_M5_C1_US
set TCP_24_20_M5_C1_US ${tcp_goodput}
keylset TCP_24_20_M5_C1_US Direction {Unidirectional}
keylset TCP_24_20_M5_C1_US Source {Wifi2_5_1CLI}
keylset TCP_24_20_M5_C1_US Destination {Eth}
#TCP_24_20_M4_C1_DS
set TCP_24_20_M4_C1_DS ${tcp_goodput}
keylset TCP_24_20_M4_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M4_C1_DS Source {Eth}
keylset TCP_24_20_M4_C1_DS Destination {Wifi2_4_1CLI}
#TCP_24_20_M4_C1_US
set TCP_24_20_M4_C1_US ${tcp_goodput}
keylset TCP_24_20_M4_C1_US Direction {Unidirectional}
keylset TCP_24_20_M4_C1_US Source {Wifi2_4_1CLI}
keylset TCP_24_20_M4_C1_US Destination {Eth}
#TCP_24_20_M3_C1_DS
set TCP_24_20_M3_C1_DS ${tcp_goodput}
keylset TCP_24_20_M3_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M3_C1_DS Source {Eth}
keylset TCP_24_20_M3_C1_DS Destination {Wifi2_3_1CLI}
#TCP_24_20_M3_C1_US
set TCP_24_20_M3_C1_US ${tcp_goodput}
keylset TCP_24_20_M3_C1_US Direction {Unidirectional}
keylset TCP_24_20_M3_C1_US Source {Wifi2_3_1CLI}
keylset TCP_24_20_M3_C1_US Destination {Eth}
#TCP_24_20_M2_C1_DS
set TCP_24_20_M2_C1_DS ${tcp_goodput}
keylset TCP_24_20_M2_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M2_C1_DS Source {Eth}
keylset TCP_24_20_M2_C1_DS Destination {Wifi2_2_1CLI}
#TCP_24_20_M2_C1_US
set TCP_24_20_M2_C1_US ${tcp_goodput}
keylset TCP_24_20_M2_C1_US Direction {Unidirectional}
keylset TCP_24_20_M2_C1_US Source {Wifi2_2_1CLI}
keylset TCP_24_20_M2_C1_US Destination {Eth}
#TCP_24_20_M1_C1_DS
set TCP_24_20_M1_C1_DS ${tcp_goodput}
keylset TCP_24_20_M1_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M1_C1_DS Source {Eth}
keylset TCP_24_20_M1_C1_DS Destination {Wifi2_1_1CLI}
#TCP_24_20_M1_C1_US
set TCP_24_20_M1_C1_US ${tcp_goodput}
keylset TCP_24_20_M1_C1_US Direction {Unidirectional}
keylset TCP_24_20_M1_C1_US Source {Wifi2_1_1CLI}
keylset TCP_24_20_M1_C1_US Destination {Eth}
#TCP_24_20_M0_C1_DS
set TCP_24_20_M0_C1_DS ${tcp_goodput}
keylset TCP_24_20_M0_C1_DS Direction {Unidirectional}
keylset TCP_24_20_M0_C1_DS Source {Eth}
keylset TCP_24_20_M0_C1_DS Destination {Wifi2_0_1CLI}
#TCP_24_20_M0_C1_US
set TCP_24_20_M0_C1_US ${tcp_goodput}
keylset TCP_24_20_M0_C1_US Direction {Unidirectional}
keylset TCP_24_20_M0_C1_US Source {Wifi2_0_1CLI}
keylset TCP_24_20_M0_C1_US Destination {Eth}
#TCP_24_20_MG_C1_DS
set TCP_24_20_MG_C1_DS ${tcp_goodput}
keylset TCP_24_20_MG_C1_DS Direction {Unidirectional}
keylset TCP_24_20_MG_C1_DS Source {Eth}
keylset TCP_24_20_MG_C1_DS Destination {Wifi2_G_1CLI}
keylset TCP_24_20_MG_C1_DS TrialDuration 15
keylset TCP_24_20_MG_C1_DS TestDurationSec 15
#TCP_24_20_MG_C1_US
set TCP_24_20_MG_C1_US ${tcp_goodput}
keylset TCP_24_20_MG_C1_US Direction {Unidirectional}
keylset TCP_24_20_MG_C1_US Source {Wifi2_G_1CLI}
keylset TCP_24_20_MG_C1_US Destination {Eth}
keylset TCP_24_20_MG_C1_US TrialDuration 15
keylset TCP_24_20_MG_C1_US TestDurationSec 15
#TCP_24_20_M31_C10_DS
set TCP_24_20_M31_C10_DS ${tcp_goodput}
keylset TCP_24_20_M31_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M31_C10_DS Source {Eth}
keylset TCP_24_20_M31_C10_DS Destination {Wifi2_31_10CLI}
keylset TCP_24_20_M31_C10_DS TrialDuration 15
keylset TCP_24_20_M31_C10_DS TestDurationSec 15
#TCP_24_20_M31_C10_US
set TCP_24_20_M31_C10_US ${tcp_goodput}
keylset TCP_24_20_M31_C10_US Direction {Unidirectional}
keylset TCP_24_20_M31_C10_US Source {Wifi2_31_10CLI}
keylset TCP_24_20_M31_C10_US Destination {Eth}
keylset TCP_24_20_M31_C10_US TrialDuration 15
keylset TCP_24_20_M31_C10_US TestDurationSec 15
#TCP_24_20_M30_C10_DS
set TCP_24_20_M30_C10_DS ${tcp_goodput}
keylset TCP_24_20_M30_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M30_C10_DS Source {Eth}
keylset TCP_24_20_M30_C10_DS Destination {Wifi2_30_10CLI}
#TCP_24_20_M30_C10_US
set TCP_24_20_M30_C10_US ${tcp_goodput}
keylset TCP_24_20_M30_C10_US Direction {Unidirectional}
keylset TCP_24_20_M30_C10_US Source {Wifi2_30_10CLI}
keylset TCP_24_20_M30_C10_US Destination {Eth}
#TCP_24_20_M29_C10_DS
set TCP_24_20_M29_C10_DS ${tcp_goodput}
keylset TCP_24_20_M29_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M29_C10_DS Source {Eth}
keylset TCP_24_20_M29_C10_DS Destination {Wifi2_29_10CLI}
#TCP_24_20_M29_C10_US
set TCP_24_20_M29_C10_US ${tcp_goodput}
keylset TCP_24_20_M29_C10_US Direction {Unidirectional}
keylset TCP_24_20_M29_C10_US Source {Wifi2_29_10CLI}
keylset TCP_24_20_M29_C10_US Destination {Eth}
#TCP_24_20_M28_C10_DS
set TCP_24_20_M28_C10_DS ${tcp_goodput}
keylset TCP_24_20_M28_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M28_C10_DS Source {Eth}
keylset TCP_24_20_M28_C10_DS Destination {Wifi2_28_10CLI}
#TCP_24_20_M28_C10_US
set TCP_24_20_M28_C10_US ${tcp_goodput}
keylset TCP_24_20_M28_C10_US Direction {Unidirectional}
keylset TCP_24_20_M28_C10_US Source {Wifi2_28_10CLI}
keylset TCP_24_20_M28_C10_US Destination {Eth}
#TCP_24_20_M27_C10_DS
set TCP_24_20_M27_C10_DS ${tcp_goodput}
keylset TCP_24_20_M27_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M27_C10_DS Source {Eth}
keylset TCP_24_20_M27_C10_DS Destination {Wifi2_27_10CLI}
#TCP_24_20_M27_C10_US
set TCP_24_20_M27_C10_US ${tcp_goodput}
keylset TCP_24_20_M27_C10_US Direction {Unidirectional}
keylset TCP_24_20_M27_C10_US Source {Wifi2_27_10CLI}
keylset TCP_24_20_M27_C10_US Destination {Eth}
#TCP_24_20_M26_C10_DS
set TCP_24_20_M26_C10_DS ${tcp_goodput}
keylset TCP_24_20_M26_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M26_C10_DS Source {Eth}
keylset TCP_24_20_M26_C10_DS Destination {Wifi2_26_10CLI}
#TCP_24_20_M26_C10_US
set TCP_24_20_M26_C10_US ${tcp_goodput}
keylset TCP_24_20_M26_C10_US Direction {Unidirectional}
keylset TCP_24_20_M26_C10_US Source {Wifi2_26_10CLI}
keylset TCP_24_20_M26_C10_US Destination {Eth}
#TCP_24_20_M25_C10_DS
set TCP_24_20_M25_C10_DS ${tcp_goodput}
keylset TCP_24_20_M25_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M25_C10_DS Source {Eth}
keylset TCP_24_20_M25_C10_DS Destination {Wifi2_25_10CLI}
#TCP_24_20_M25_C10_US
set TCP_24_20_M25_C10_US ${tcp_goodput}
keylset TCP_24_20_M25_C10_US Direction {Unidirectional}
keylset TCP_24_20_M25_C10_US Source {Wifi2_25_10CLI}
keylset TCP_24_20_M25_C10_US Destination {Eth}
#TCP_24_20_M24_C10_DS
set TCP_24_20_M24_C10_DS ${tcp_goodput}
keylset TCP_24_20_M24_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M24_C10_DS Source {Eth}
keylset TCP_24_20_M24_C10_DS Destination {Wifi2_24_10CLI}
#TCP_24_20_M24_C10_US
set TCP_24_20_M24_C10_US ${tcp_goodput}
keylset TCP_24_20_M24_C10_US Direction {Unidirectional}
keylset TCP_24_20_M24_C10_US Source {Wifi2_24_10CLI}
keylset TCP_24_20_M24_C10_US Destination {Eth}
#TCP_24_20_M23_C10_DS
set TCP_24_20_M23_C10_DS ${tcp_goodput}
keylset TCP_24_20_M23_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M23_C10_DS Source {Eth}
keylset TCP_24_20_M23_C10_DS Destination {Wifi2_23_10CLI}
keylset TCP_24_20_M23_C10_DS TrialDuration 15
keylset TCP_24_20_M23_C10_DS TestDurationSec 15
#TCP_24_20_M23_C10_US
set TCP_24_20_M23_C10_US ${tcp_goodput}
keylset TCP_24_20_M23_C10_US Direction {Unidirectional}
keylset TCP_24_20_M23_C10_US Source {Wifi2_23_10CLI}
keylset TCP_24_20_M23_C10_US Destination {Eth}
keylset TCP_24_20_M23_C10_US TrialDuration 15
keylset TCP_24_20_M23_C10_US TestDurationSec 15
#TCP_24_20_M22_C10_DS
set TCP_24_20_M22_C10_DS ${tcp_goodput}
keylset TCP_24_20_M22_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M22_C10_DS Source {Eth}
keylset TCP_24_20_M22_C10_DS Destination {Wifi2_22_10CLI}
#TCP_24_20_M22_C10_US
set TCP_24_20_M22_C10_US ${tcp_goodput}
keylset TCP_24_20_M22_C10_US Direction {Unidirectional}
keylset TCP_24_20_M22_C10_US Source {Wifi2_22_10CLI}
keylset TCP_24_20_M22_C10_US Destination {Eth}
#TCP_24_20_M21_C10_DS
set TCP_24_20_M21_C10_DS ${tcp_goodput}
keylset TCP_24_20_M21_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M21_C10_DS Source {Eth}
keylset TCP_24_20_M21_C10_DS Destination {Wifi2_21_10CLI}
#TCP_24_20_M21_C10_US
set TCP_24_20_M21_C10_US ${tcp_goodput}
keylset TCP_24_20_M21_C10_US Direction {Unidirectional}
keylset TCP_24_20_M21_C10_US Source {Wifi2_21_10CLI}
keylset TCP_24_20_M21_C10_US Destination {Eth}
#TCP_24_20_M20_C10_DS
set TCP_24_20_M20_C10_DS ${tcp_goodput}
keylset TCP_24_20_M20_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M20_C10_DS Source {Eth}
keylset TCP_24_20_M20_C10_DS Destination {Wifi2_20_10CLI}
#TCP_24_20_M20_C10_US
set TCP_24_20_M20_C10_US ${tcp_goodput}
keylset TCP_24_20_M20_C10_US Direction {Unidirectional}
keylset TCP_24_20_M20_C10_US Source {Wifi2_20_10CLI}
keylset TCP_24_20_M20_C10_US Destination {Eth}
#TCP_24_20_M19_C10_DS
set TCP_24_20_M19_C10_DS ${tcp_goodput}
keylset TCP_24_20_M19_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M19_C10_DS Source {Eth}
keylset TCP_24_20_M19_C10_DS Destination {Wifi2_19_10CLI}
#TCP_24_20_M19_C10_US
set TCP_24_20_M19_C10_US ${tcp_goodput}
keylset TCP_24_20_M19_C10_US Direction {Unidirectional}
keylset TCP_24_20_M19_C10_US Source {Wifi2_19_10CLI}
keylset TCP_24_20_M19_C10_US Destination {Eth}
#TCP_24_20_M18_C10_DS
set TCP_24_20_M18_C10_DS ${tcp_goodput}
keylset TCP_24_20_M18_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M18_C10_DS Source {Eth}
keylset TCP_24_20_M18_C10_DS Destination {Wifi2_18_10CLI}
#TCP_24_20_M18_C10_US
set TCP_24_20_M18_C10_US ${tcp_goodput}
keylset TCP_24_20_M18_C10_US Direction {Unidirectional}
keylset TCP_24_20_M18_C10_US Source {Wifi2_18_10CLI}
keylset TCP_24_20_M18_C10_US Destination {Eth}
#TCP_24_20_M17_C10_DS
set TCP_24_20_M17_C10_DS ${tcp_goodput}
keylset TCP_24_20_M17_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M17_C10_DS Source {Eth}
keylset TCP_24_20_M17_C10_DS Destination {Wifi2_17_10CLI}
#TCP_24_20_M17_C10_US
set TCP_24_20_M17_C10_US ${tcp_goodput}
keylset TCP_24_20_M17_C10_US Direction {Unidirectional}
keylset TCP_24_20_M17_C10_US Source {Wifi2_17_10CLI}
keylset TCP_24_20_M17_C10_US Destination {Eth}
#TCP_24_20_M16_C10_DS
set TCP_24_20_M16_C10_DS ${tcp_goodput}
keylset TCP_24_20_M16_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M16_C10_DS Source {Eth}
keylset TCP_24_20_M16_C10_DS Destination {Wifi2_16_10CLI}
#TCP_24_20_M16_C10_US
set TCP_24_20_M16_C10_US ${tcp_goodput}
keylset TCP_24_20_M16_C10_US Direction {Unidirectional}
keylset TCP_24_20_M16_C10_US Source {Wifi2_16_10CLI}
keylset TCP_24_20_M16_C10_US Destination {Eth}
#TCP_24_20_M15_C10_DS
set TCP_24_20_M15_C10_DS ${tcp_goodput}
keylset TCP_24_20_M15_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M15_C10_DS Source {Eth}
keylset TCP_24_20_M15_C10_DS Destination {Wifi2_15_10CLI}
keylset TCP_24_20_M15_C10_DS TrialDuration 15
keylset TCP_24_20_M15_C10_DS TestDurationSec 15
#TCP_24_20_M15_C10_US
set TCP_24_20_M15_C10_US ${tcp_goodput}
keylset TCP_24_20_M15_C10_US Direction {Unidirectional}
keylset TCP_24_20_M15_C10_US Source {Wifi2_15_10CLI}
keylset TCP_24_20_M15_C10_US Destination {Eth}
keylset TCP_24_20_M15_C10_US TrialDuration 15
keylset TCP_24_20_M15_C10_US TestDurationSec 15
#TCP_24_20_M14_C10_DS
set TCP_24_20_M14_C10_DS ${tcp_goodput}
keylset TCP_24_20_M14_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M14_C10_DS Source {Eth}
keylset TCP_24_20_M14_C10_DS Destination {Wifi2_14_10CLI}
#TCP_24_20_M14_C10_US
set TCP_24_20_M14_C10_US ${tcp_goodput}
keylset TCP_24_20_M14_C10_US Direction {Unidirectional}
keylset TCP_24_20_M14_C10_US Source {Wifi2_14_10CLI}
keylset TCP_24_20_M14_C10_US Destination {Eth}
#TCP_24_20_M13_C10_DS
set TCP_24_20_M13_C10_DS ${tcp_goodput}
keylset TCP_24_20_M13_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M13_C10_DS Source {Eth}
keylset TCP_24_20_M13_C10_DS Destination {Wifi2_13_10CLI}
#TCP_24_20_M13_C10_US
set TCP_24_20_M13_C10_US ${tcp_goodput}
keylset TCP_24_20_M13_C10_US Direction {Unidirectional}
keylset TCP_24_20_M13_C10_US Source {Wifi2_13_10CLI}
keylset TCP_24_20_M13_C10_US Destination {Eth}
#TCP_24_20_M12_C10_DS
set TCP_24_20_M12_C10_DS ${tcp_goodput}
keylset TCP_24_20_M12_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M12_C10_DS Source {Eth}
keylset TCP_24_20_M12_C10_DS Destination {Wifi2_12_10CLI}
#TCP_24_20_M12_C10_US
set TCP_24_20_M12_C10_US ${tcp_goodput}
keylset TCP_24_20_M12_C10_US Direction {Unidirectional}
keylset TCP_24_20_M12_C10_US Source {Wifi2_12_10CLI}
keylset TCP_24_20_M12_C10_US Destination {Eth}
#TCP_24_20_M11_C10_DS
set TCP_24_20_M11_C10_DS ${tcp_goodput}
keylset TCP_24_20_M11_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M11_C10_DS Source {Eth}
keylset TCP_24_20_M11_C10_DS Destination {Wifi2_11_10CLI}
#TCP_24_20_M11_C10_US
set TCP_24_20_M11_C10_US ${tcp_goodput}
keylset TCP_24_20_M11_C10_US Direction {Unidirectional}
keylset TCP_24_20_M11_C10_US Source {Wifi2_11_10CLI}
keylset TCP_24_20_M11_C10_US Destination {Eth}
#TCP_24_20_M10_C10_DS
set TCP_24_20_M10_C10_DS ${tcp_goodput}
keylset TCP_24_20_M10_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M10_C10_DS Source {Eth}
keylset TCP_24_20_M10_C10_DS Destination {Wifi2_10_10CLI}
#TCP_24_20_M10_C10_US
set TCP_24_20_M10_C10_US ${tcp_goodput}
keylset TCP_24_20_M10_C10_US Direction {Unidirectional}
keylset TCP_24_20_M10_C10_US Source {Wifi2_10_10CLI}
keylset TCP_24_20_M10_C10_US Destination {Eth}
#TCP_24_20_M9_C10_DS
set TCP_24_20_M9_C10_DS ${tcp_goodput}
keylset TCP_24_20_M9_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M9_C10_DS Source {Eth}
keylset TCP_24_20_M9_C10_DS Destination {Wifi2_9_10CLI}
#TCP_24_20_M9_C10_US
set TCP_24_20_M9_C10_US ${tcp_goodput}
keylset TCP_24_20_M9_C10_US Direction {Unidirectional}
keylset TCP_24_20_M9_C10_US Source {Wifi2_9_10CLI}
keylset TCP_24_20_M9_C10_US Destination {Eth}
#TCP_24_20_M8_C10_DS
set TCP_24_20_M8_C10_DS ${tcp_goodput}
keylset TCP_24_20_M8_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M8_C10_DS Source {Eth}
keylset TCP_24_20_M8_C10_DS Destination {Wifi2_8_10CLI}
#TCP_24_20_M8_C10_US
set TCP_24_20_M8_C10_US ${tcp_goodput}
keylset TCP_24_20_M8_C10_US Direction {Unidirectional}
keylset TCP_24_20_M8_C10_US Source {Wifi2_8_10CLI}
keylset TCP_24_20_M8_C10_US Destination {Eth}
#TCP_24_20_M7_C10_DS
set TCP_24_20_M7_C10_DS ${tcp_goodput}
keylset TCP_24_20_M7_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M7_C10_DS Source {Eth}
keylset TCP_24_20_M7_C10_DS Destination {Wifi2_7_10CLI}
keylset TCP_24_20_M7_C10_DS TrialDuration 15
keylset TCP_24_20_M7_C10_DS TestDurationSec 15
#TCP_24_20_M7_C10_US
set TCP_24_20_M7_C10_US ${tcp_goodput}
keylset TCP_24_20_M7_C10_US Direction {Unidirectional}
keylset TCP_24_20_M7_C10_US Source {Wifi2_7_10CLI}
keylset TCP_24_20_M7_C10_US Destination {Eth}
keylset TCP_24_20_M7_C10_US TrialDuration 15
keylset TCP_24_20_M7_C10_US TestDurationSec 15
#TCP_24_20_M6_C10_DS
set TCP_24_20_M6_C10_DS ${tcp_goodput}
keylset TCP_24_20_M6_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M6_C10_DS Source {Eth}
keylset TCP_24_20_M6_C10_DS Destination {Wifi2_6_10CLI}
#TCP_24_20_M6_C10_US
set TCP_24_20_M6_C10_US ${tcp_goodput}
keylset TCP_24_20_M6_C10_US Direction {Unidirectional}
keylset TCP_24_20_M6_C10_US Source {Wifi2_6_10CLI}
keylset TCP_24_20_M6_C10_US Destination {Eth}
#TCP_24_20_M5_C10_DS
set TCP_24_20_M5_C10_DS ${tcp_goodput}
keylset TCP_24_20_M5_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M5_C10_DS Source {Eth}
keylset TCP_24_20_M5_C10_DS Destination {Wifi2_5_10CLI}
#TCP_24_20_M5_C10_US
set TCP_24_20_M5_C10_US ${tcp_goodput}
keylset TCP_24_20_M5_C10_US Direction {Unidirectional}
keylset TCP_24_20_M5_C10_US Source {Wifi2_5_10CLI}
keylset TCP_24_20_M5_C10_US Destination {Eth}
#TCP_24_20_M4_C10_DS
set TCP_24_20_M4_C10_DS ${tcp_goodput}
keylset TCP_24_20_M4_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M4_C10_DS Source {Eth}
keylset TCP_24_20_M4_C10_DS Destination {Wifi2_4_10CLI}
#TCP_24_20_M4_C10_US
set TCP_24_20_M4_C10_US ${tcp_goodput}
keylset TCP_24_20_M4_C10_US Direction {Unidirectional}
keylset TCP_24_20_M4_C10_US Source {Wifi2_4_10CLI}
keylset TCP_24_20_M4_C10_US Destination {Eth}
#TCP_24_20_M3_C10_DS
set TCP_24_20_M3_C10_DS ${tcp_goodput}
keylset TCP_24_20_M3_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M3_C10_DS Source {Eth}
keylset TCP_24_20_M3_C10_DS Destination {Wifi2_3_10CLI}
#TCP_24_20_M3_C10_US
set TCP_24_20_M3_C10_US ${tcp_goodput}
keylset TCP_24_20_M3_C10_US Direction {Unidirectional}
keylset TCP_24_20_M3_C10_US Source {Wifi2_3_10CLI}
keylset TCP_24_20_M3_C10_US Destination {Eth}
#TCP_24_20_M2_C10_DS
set TCP_24_20_M2_C10_DS ${tcp_goodput}
keylset TCP_24_20_M2_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M2_C10_DS Source {Eth}
keylset TCP_24_20_M2_C10_DS Destination {Wifi2_2_10CLI}
#TCP_24_20_M2_C10_US
set TCP_24_20_M2_C10_US ${tcp_goodput}
keylset TCP_24_20_M2_C10_US Direction {Unidirectional}
keylset TCP_24_20_M2_C10_US Source {Wifi2_2_10CLI}
keylset TCP_24_20_M2_C10_US Destination {Eth}
#TCP_24_20_M1_C10_DS
set TCP_24_20_M1_C10_DS ${tcp_goodput}
keylset TCP_24_20_M1_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M1_C10_DS Source {Eth}
keylset TCP_24_20_M1_C10_DS Destination {Wifi2_1_10CLI}
#TCP_24_20_M1_C10_US
set TCP_24_20_M1_C10_US ${tcp_goodput}
keylset TCP_24_20_M1_C10_US Direction {Unidirectional}
keylset TCP_24_20_M1_C10_US Source {Wifi2_1_10CLI}
keylset TCP_24_20_M1_C10_US Destination {Eth}
#TCP_24_20_M0_C10_DS
set TCP_24_20_M0_C10_DS ${tcp_goodput}
keylset TCP_24_20_M0_C10_DS Direction {Unidirectional}
keylset TCP_24_20_M0_C10_DS Source {Eth}
keylset TCP_24_20_M0_C10_DS Destination {Wifi2_0_10CLI}
#TCP_24_20_M0_C10_US
set TCP_24_20_M0_C10_US ${tcp_goodput}
keylset TCP_24_20_M0_C10_US Direction {Unidirectional}
keylset TCP_24_20_M0_C10_US Source {Wifi2_0_10CLI}
keylset TCP_24_20_M0_C10_US Destination {Eth}
#TCP_24_20_MG_C10_DS
set TCP_24_20_MG_C10_DS ${tcp_goodput}
keylset TCP_24_20_MG_C10_DS Direction {Unidirectional}
keylset TCP_24_20_MG_C10_DS Source {Eth}
keylset TCP_24_20_MG_C10_DS Destination {Wifi2_G_10CLI}
keylset TCP_24_20_MG_C10_DS TrialDuration 15
keylset TCP_24_20_MG_C10_DS TestDurationSec 15
#TCP_24_20_MG_C10_US
set TCP_24_20_MG_C10_US ${tcp_goodput}
keylset TCP_24_20_MG_C10_US Direction {Unidirectional}
keylset TCP_24_20_MG_C10_US Source {Wifi2_G_10CLI}
keylset TCP_24_20_MG_C10_US Destination {Eth}
keylset TCP_24_20_MG_C10_US TrialDuration 15
keylset TCP_24_20_MG_C10_US TestDurationSec 15

#TCP_24_20_M31_C25_DS
set TCP_24_20_M31_C25_DS ${tcp_goodput}
keylset TCP_24_20_M31_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M31_C25_DS Source {Eth}
keylset TCP_24_20_M31_C25_DS Destination {Wifi2_31_25CLI}
keylset TCP_24_20_M31_C25_DS TrialDuration 15
keylset TCP_24_20_M31_C25_DS TestDurationSec 15
#TCP_24_20_M31_C25_US
set TCP_24_20_M31_C25_US ${tcp_goodput}
keylset TCP_24_20_M31_C25_US Direction {Unidirectional}
keylset TCP_24_20_M31_C25_US Source {Wifi2_31_25CLI}
keylset TCP_24_20_M31_C25_US Destination {Eth}
keylset TCP_24_20_M31_C25_US TrialDuration 15
keylset TCP_24_20_M31_C25_US TestDurationSec 15
#TCP_24_20_M30_C25_DS
set TCP_24_20_M30_C25_DS ${tcp_goodput}
keylset TCP_24_20_M30_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M30_C25_DS Source {Eth}
keylset TCP_24_20_M30_C25_DS Destination {Wifi2_30_25CLI}
#TCP_24_20_M30_C25_US
set TCP_24_20_M30_C25_US ${tcp_goodput}
keylset TCP_24_20_M30_C25_US Direction {Unidirectional}
keylset TCP_24_20_M30_C25_US Source {Wifi2_30_25CLI}
keylset TCP_24_20_M30_C25_US Destination {Eth}
#TCP_24_20_M29_C25_DS
set TCP_24_20_M29_C25_DS ${tcp_goodput}
keylset TCP_24_20_M29_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M29_C25_DS Source {Eth}
keylset TCP_24_20_M29_C25_DS Destination {Wifi2_29_25CLI}
#TCP_24_20_M29_C25_US
set TCP_24_20_M29_C25_US ${tcp_goodput}
keylset TCP_24_20_M29_C25_US Direction {Unidirectional}
keylset TCP_24_20_M29_C25_US Source {Wifi2_29_25CLI}
keylset TCP_24_20_M29_C25_US Destination {Eth}
#TCP_24_20_M28_C25_DS
set TCP_24_20_M28_C25_DS ${tcp_goodput}
keylset TCP_24_20_M28_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M28_C25_DS Source {Eth}
keylset TCP_24_20_M28_C25_DS Destination {Wifi2_28_25CLI}
#TCP_24_20_M28_C25_US
set TCP_24_20_M28_C25_US ${tcp_goodput}
keylset TCP_24_20_M28_C25_US Direction {Unidirectional}
keylset TCP_24_20_M28_C25_US Source {Wifi2_28_25CLI}
keylset TCP_24_20_M28_C25_US Destination {Eth}
#TCP_24_20_M27_C25_DS
set TCP_24_20_M27_C25_DS ${tcp_goodput}
keylset TCP_24_20_M27_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M27_C25_DS Source {Eth}
keylset TCP_24_20_M27_C25_DS Destination {Wifi2_27_25CLI}
#TCP_24_20_M27_C25_US
set TCP_24_20_M27_C25_US ${tcp_goodput}
keylset TCP_24_20_M27_C25_US Direction {Unidirectional}
keylset TCP_24_20_M27_C25_US Source {Wifi2_27_25CLI}
keylset TCP_24_20_M27_C25_US Destination {Eth}
#TCP_24_20_M26_C25_DS
set TCP_24_20_M26_C25_DS ${tcp_goodput}
keylset TCP_24_20_M26_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M26_C25_DS Source {Eth}
keylset TCP_24_20_M26_C25_DS Destination {Wifi2_26_25CLI}
#TCP_24_20_M26_C25_US
set TCP_24_20_M26_C25_US ${tcp_goodput}
keylset TCP_24_20_M26_C25_US Direction {Unidirectional}
keylset TCP_24_20_M26_C25_US Source {Wifi2_26_25CLI}
keylset TCP_24_20_M26_C25_US Destination {Eth}
#TCP_24_20_M25_C25_DS
set TCP_24_20_M25_C25_DS ${tcp_goodput}
keylset TCP_24_20_M25_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M25_C25_DS Source {Eth}
keylset TCP_24_20_M25_C25_DS Destination {Wifi2_25_25CLI}
#TCP_24_20_M25_C25_US
set TCP_24_20_M25_C25_US ${tcp_goodput}
keylset TCP_24_20_M25_C25_US Direction {Unidirectional}
keylset TCP_24_20_M25_C25_US Source {Wifi2_25_25CLI}
keylset TCP_24_20_M25_C25_US Destination {Eth}
#TCP_24_20_M24_C25_DS
set TCP_24_20_M24_C25_DS ${tcp_goodput}
keylset TCP_24_20_M24_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M24_C25_DS Source {Eth}
keylset TCP_24_20_M24_C25_DS Destination {Wifi2_24_25CLI}
#TCP_24_20_M24_C25_US
set TCP_24_20_M24_C25_US ${tcp_goodput}
keylset TCP_24_20_M24_C25_US Direction {Unidirectional}
keylset TCP_24_20_M24_C25_US Source {Wifi2_24_25CLI}
keylset TCP_24_20_M24_C25_US Destination {Eth}
#TCP_24_20_M23_C25_DS
set TCP_24_20_M23_C25_DS ${tcp_goodput}
keylset TCP_24_20_M23_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M23_C25_DS Source {Eth}
keylset TCP_24_20_M23_C25_DS Destination {Wifi2_23_25CLI}
keylset TCP_24_20_M23_C25_DS TrialDuration 15
keylset TCP_24_20_M23_C25_DS TestDurationSec 15
#TCP_24_20_M23_C25_US
set TCP_24_20_M23_C25_US ${tcp_goodput}
keylset TCP_24_20_M23_C25_US Direction {Unidirectional}
keylset TCP_24_20_M23_C25_US Source {Wifi2_23_25CLI}
keylset TCP_24_20_M23_C25_US Destination {Eth}
keylset TCP_24_20_M23_C25_US TrialDuration 15
keylset TCP_24_20_M23_C25_US TestDurationSec 15
#TCP_24_20_M22_C25_DS
set TCP_24_20_M22_C25_DS ${tcp_goodput}
keylset TCP_24_20_M22_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M22_C25_DS Source {Eth}
keylset TCP_24_20_M22_C25_DS Destination {Wifi2_22_25CLI}
#TCP_24_20_M22_C25_US
set TCP_24_20_M22_C25_US ${tcp_goodput}
keylset TCP_24_20_M22_C25_US Direction {Unidirectional}
keylset TCP_24_20_M22_C25_US Source {Wifi2_22_25CLI}
keylset TCP_24_20_M22_C25_US Destination {Eth}
#TCP_24_20_M21_C25_DS
set TCP_24_20_M21_C25_DS ${tcp_goodput}
keylset TCP_24_20_M21_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M21_C25_DS Source {Eth}
keylset TCP_24_20_M21_C25_DS Destination {Wifi2_21_25CLI}
#TCP_24_20_M21_C25_US
set TCP_24_20_M21_C25_US ${tcp_goodput}
keylset TCP_24_20_M21_C25_US Direction {Unidirectional}
keylset TCP_24_20_M21_C25_US Source {Wifi2_21_25CLI}
keylset TCP_24_20_M21_C25_US Destination {Eth}
#TCP_24_20_M20_C25_DS
set TCP_24_20_M20_C25_DS ${tcp_goodput}
keylset TCP_24_20_M20_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M20_C25_DS Source {Eth}
keylset TCP_24_20_M20_C25_DS Destination {Wifi2_20_25CLI}
#TCP_24_20_M20_C25_US
set TCP_24_20_M20_C25_US ${tcp_goodput}
keylset TCP_24_20_M20_C25_US Direction {Unidirectional}
keylset TCP_24_20_M20_C25_US Source {Wifi2_20_25CLI}
keylset TCP_24_20_M20_C25_US Destination {Eth}
#TCP_24_20_M19_C25_DS
set TCP_24_20_M19_C25_DS ${tcp_goodput}
keylset TCP_24_20_M19_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M19_C25_DS Source {Eth}
keylset TCP_24_20_M19_C25_DS Destination {Wifi2_19_25CLI}
#TCP_24_20_M19_C25_US
set TCP_24_20_M19_C25_US ${tcp_goodput}
keylset TCP_24_20_M19_C25_US Direction {Unidirectional}
keylset TCP_24_20_M19_C25_US Source {Wifi2_19_25CLI}
keylset TCP_24_20_M19_C25_US Destination {Eth}
#TCP_24_20_M18_C25_DS
set TCP_24_20_M18_C25_DS ${tcp_goodput}
keylset TCP_24_20_M18_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M18_C25_DS Source {Eth}
keylset TCP_24_20_M18_C25_DS Destination {Wifi2_18_25CLI}
#TCP_24_20_M18_C25_US
set TCP_24_20_M18_C25_US ${tcp_goodput}
keylset TCP_24_20_M18_C25_US Direction {Unidirectional}
keylset TCP_24_20_M18_C25_US Source {Wifi2_18_25CLI}
keylset TCP_24_20_M18_C25_US Destination {Eth}
#TCP_24_20_M17_C25_DS
set TCP_24_20_M17_C25_DS ${tcp_goodput}
keylset TCP_24_20_M17_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M17_C25_DS Source {Eth}
keylset TCP_24_20_M17_C25_DS Destination {Wifi2_17_25CLI}
#TCP_24_20_M17_C25_US
set TCP_24_20_M17_C25_US ${tcp_goodput}
keylset TCP_24_20_M17_C25_US Direction {Unidirectional}
keylset TCP_24_20_M17_C25_US Source {Wifi2_17_25CLI}
keylset TCP_24_20_M17_C25_US Destination {Eth}
#TCP_24_20_M16_C25_DS
set TCP_24_20_M16_C25_DS ${tcp_goodput}
keylset TCP_24_20_M16_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M16_C25_DS Source {Eth}
keylset TCP_24_20_M16_C25_DS Destination {Wifi2_16_25CLI}
#TCP_24_20_M16_C25_US
set TCP_24_20_M16_C25_US ${tcp_goodput}
keylset TCP_24_20_M16_C25_US Direction {Unidirectional}
keylset TCP_24_20_M16_C25_US Source {Wifi2_16_25CLI}
keylset TCP_24_20_M16_C25_US Destination {Eth}
#TCP_24_20_M15_C25_DS
set TCP_24_20_M15_C25_DS ${tcp_goodput}
keylset TCP_24_20_M15_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M15_C25_DS Source {Eth}
keylset TCP_24_20_M15_C25_DS Destination {Wifi2_15_25CLI}
keylset TCP_24_20_M15_C25_DS TrialDuration 15
keylset TCP_24_20_M15_C25_DS TestDurationSec 15
#TCP_24_20_M15_C25_US
set TCP_24_20_M15_C25_US ${tcp_goodput}
keylset TCP_24_20_M15_C25_US Direction {Unidirectional}
keylset TCP_24_20_M15_C25_US Source {Wifi2_15_25CLI}
keylset TCP_24_20_M15_C25_US Destination {Eth}
keylset TCP_24_20_M15_C25_US TrialDuration 15
keylset TCP_24_20_M15_C25_US TestDurationSec 15
#TCP_24_20_M14_C25_DS
set TCP_24_20_M14_C25_DS ${tcp_goodput}
keylset TCP_24_20_M14_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M14_C25_DS Source {Eth}
keylset TCP_24_20_M14_C25_DS Destination {Wifi2_14_25CLI}
#TCP_24_20_M14_C25_US
set TCP_24_20_M14_C25_US ${tcp_goodput}
keylset TCP_24_20_M14_C25_US Direction {Unidirectional}
keylset TCP_24_20_M14_C25_US Source {Wifi2_14_25CLI}
keylset TCP_24_20_M14_C25_US Destination {Eth}
#TCP_24_20_M13_C25_DS
set TCP_24_20_M13_C25_DS ${tcp_goodput}
keylset TCP_24_20_M13_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M13_C25_DS Source {Eth}
keylset TCP_24_20_M13_C25_DS Destination {Wifi2_13_25CLI}
#TCP_24_20_M13_C25_US
set TCP_24_20_M13_C25_US ${tcp_goodput}
keylset TCP_24_20_M13_C25_US Direction {Unidirectional}
keylset TCP_24_20_M13_C25_US Source {Wifi2_13_25CLI}
keylset TCP_24_20_M13_C25_US Destination {Eth}
#TCP_24_20_M12_C25_DS
set TCP_24_20_M12_C25_DS ${tcp_goodput}
keylset TCP_24_20_M12_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M12_C25_DS Source {Eth}
keylset TCP_24_20_M12_C25_DS Destination {Wifi2_12_25CLI}
#TCP_24_20_M12_C25_US
set TCP_24_20_M12_C25_US ${tcp_goodput}
keylset TCP_24_20_M12_C25_US Direction {Unidirectional}
keylset TCP_24_20_M12_C25_US Source {Wifi2_12_25CLI}
keylset TCP_24_20_M12_C25_US Destination {Eth}
#TCP_24_20_M11_C25_DS
set TCP_24_20_M11_C25_DS ${tcp_goodput}
keylset TCP_24_20_M11_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M11_C25_DS Source {Eth}
keylset TCP_24_20_M11_C25_DS Destination {Wifi2_11_25CLI}
#TCP_24_20_M11_C25_US
set TCP_24_20_M11_C25_US ${tcp_goodput}
keylset TCP_24_20_M11_C25_US Direction {Unidirectional}
keylset TCP_24_20_M11_C25_US Source {Wifi2_11_25CLI}
keylset TCP_24_20_M11_C25_US Destination {Eth}
#TCP_24_20_M10_C25_DS
set TCP_24_20_M10_C25_DS ${tcp_goodput}
keylset TCP_24_20_M10_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M10_C25_DS Source {Eth}
keylset TCP_24_20_M10_C25_DS Destination {Wifi2_10_25CLI}
#TCP_24_20_M10_C25_US
set TCP_24_20_M10_C25_US ${tcp_goodput}
keylset TCP_24_20_M10_C25_US Direction {Unidirectional}
keylset TCP_24_20_M10_C25_US Source {Wifi2_10_25CLI}
keylset TCP_24_20_M10_C25_US Destination {Eth}
#TCP_24_20_M9_C25_DS
set TCP_24_20_M9_C25_DS ${tcp_goodput}
keylset TCP_24_20_M9_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M9_C25_DS Source {Eth}
keylset TCP_24_20_M9_C25_DS Destination {Wifi2_9_25CLI}
#TCP_24_20_M9_C25_US
set TCP_24_20_M9_C25_US ${tcp_goodput}
keylset TCP_24_20_M9_C25_US Direction {Unidirectional}
keylset TCP_24_20_M9_C25_US Source {Wifi2_9_25CLI}
keylset TCP_24_20_M9_C25_US Destination {Eth}
#TCP_24_20_M8_C25_DS
set TCP_24_20_M8_C25_DS ${tcp_goodput}
keylset TCP_24_20_M8_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M8_C25_DS Source {Eth}
keylset TCP_24_20_M8_C25_DS Destination {Wifi2_8_25CLI}
#TCP_24_20_M8_C25_US
set TCP_24_20_M8_C25_US ${tcp_goodput}
keylset TCP_24_20_M8_C25_US Direction {Unidirectional}
keylset TCP_24_20_M8_C25_US Source {Wifi2_8_25CLI}
keylset TCP_24_20_M8_C25_US Destination {Eth}
#TCP_24_20_M7_C25_DS
set TCP_24_20_M7_C25_DS ${tcp_goodput}
keylset TCP_24_20_M7_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M7_C25_DS Source {Eth}
keylset TCP_24_20_M7_C25_DS Destination {Wifi2_7_25CLI}
keylset TCP_24_20_M7_C25_DS TrialDuration 15
keylset TCP_24_20_M7_C25_DS TestDurationSec 15
#TCP_24_20_M7_C25_US
set TCP_24_20_M7_C25_US ${tcp_goodput}
keylset TCP_24_20_M7_C25_US Direction {Unidirectional}
keylset TCP_24_20_M7_C25_US Source {Wifi2_7_25CLI}
keylset TCP_24_20_M7_C25_US Destination {Eth}
keylset TCP_24_20_M7_C25_US TrialDuration 15
keylset TCP_24_20_M7_C25_US TestDurationSec 15
#TCP_24_20_M6_C25_DS
set TCP_24_20_M6_C25_DS ${tcp_goodput}
keylset TCP_24_20_M6_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M6_C25_DS Source {Eth}
keylset TCP_24_20_M6_C25_DS Destination {Wifi2_6_25CLI}
#TCP_24_20_M6_C25_US
set TCP_24_20_M6_C25_US ${tcp_goodput}
keylset TCP_24_20_M6_C25_US Direction {Unidirectional}
keylset TCP_24_20_M6_C25_US Source {Wifi2_6_25CLI}
keylset TCP_24_20_M6_C25_US Destination {Eth}
#TCP_24_20_M5_C25_DS
set TCP_24_20_M5_C25_DS ${tcp_goodput}
keylset TCP_24_20_M5_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M5_C25_DS Source {Eth}
keylset TCP_24_20_M5_C25_DS Destination {Wifi2_5_25CLI}
#TCP_24_20_M5_C25_US
set TCP_24_20_M5_C25_US ${tcp_goodput}
keylset TCP_24_20_M5_C25_US Direction {Unidirectional}
keylset TCP_24_20_M5_C25_US Source {Wifi2_5_25CLI}
keylset TCP_24_20_M5_C25_US Destination {Eth}
#TCP_24_20_M4_C25_DS
set TCP_24_20_M4_C25_DS ${tcp_goodput}
keylset TCP_24_20_M4_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M4_C25_DS Source {Eth}
keylset TCP_24_20_M4_C25_DS Destination {Wifi2_4_25CLI}
#TCP_24_20_M4_C25_US
set TCP_24_20_M4_C25_US ${tcp_goodput}
keylset TCP_24_20_M4_C25_US Direction {Unidirectional}
keylset TCP_24_20_M4_C25_US Source {Wifi2_4_25CLI}
keylset TCP_24_20_M4_C25_US Destination {Eth}
#TCP_24_20_M3_C25_DS
set TCP_24_20_M3_C25_DS ${tcp_goodput}
keylset TCP_24_20_M3_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M3_C25_DS Source {Eth}
keylset TCP_24_20_M3_C25_DS Destination {Wifi2_3_25CLI}
#TCP_24_20_M3_C25_US
set TCP_24_20_M3_C25_US ${tcp_goodput}
keylset TCP_24_20_M3_C25_US Direction {Unidirectional}
keylset TCP_24_20_M3_C25_US Source {Wifi2_3_25CLI}
keylset TCP_24_20_M3_C25_US Destination {Eth}
#TCP_24_20_M2_C25_DS
set TCP_24_20_M2_C25_DS ${tcp_goodput}
keylset TCP_24_20_M2_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M2_C25_DS Source {Eth}
keylset TCP_24_20_M2_C25_DS Destination {Wifi2_2_25CLI}
#TCP_24_20_M2_C25_US
set TCP_24_20_M2_C25_US ${tcp_goodput}
keylset TCP_24_20_M2_C25_US Direction {Unidirectional}
keylset TCP_24_20_M2_C25_US Source {Wifi2_2_25CLI}
keylset TCP_24_20_M2_C25_US Destination {Eth}
#TCP_24_20_M1_C25_DS
set TCP_24_20_M1_C25_DS ${tcp_goodput}
keylset TCP_24_20_M1_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M1_C25_DS Source {Eth}
keylset TCP_24_20_M1_C25_DS Destination {Wifi2_1_25CLI}
#TCP_24_20_M1_C25_US
set TCP_24_20_M1_C25_US ${tcp_goodput}
keylset TCP_24_20_M1_C25_US Direction {Unidirectional}
keylset TCP_24_20_M1_C25_US Source {Wifi2_1_25CLI}
keylset TCP_24_20_M1_C25_US Destination {Eth}
#TCP_24_20_M0_C25_DS
set TCP_24_20_M0_C25_DS ${tcp_goodput}
keylset TCP_24_20_M0_C25_DS Direction {Unidirectional}
keylset TCP_24_20_M0_C25_DS Source {Eth}
keylset TCP_24_20_M0_C25_DS Destination {Wifi2_0_25CLI}
#TCP_24_20_M0_C25_US
set TCP_24_20_M0_C25_US ${tcp_goodput}
keylset TCP_24_20_M0_C25_US Direction {Unidirectional}
keylset TCP_24_20_M0_C25_US Source {Wifi2_0_25CLI}
keylset TCP_24_20_M0_C25_US Destination {Eth}
#TCP_24_20_MG_C25_DS
set TCP_24_20_MG_C25_DS ${tcp_goodput}
keylset TCP_24_20_MG_C25_DS Direction {Unidirectional}
keylset TCP_24_20_MG_C25_DS Source {Eth}
keylset TCP_24_20_MG_C25_DS Destination {Wifi2_G_25CLI}
keylset TCP_24_20_MG_C25_DS TrialDuration 15
keylset TCP_24_20_MG_C25_DS TestDurationSec 15
#TCP_24_20_MG_C25_US
set TCP_24_20_MG_C25_US ${tcp_goodput}
keylset TCP_24_20_MG_C25_US Direction {Unidirectional}
keylset TCP_24_20_MG_C25_US Source {Wifi2_G_25CLI}
keylset TCP_24_20_MG_C25_US Destination {Eth}
keylset TCP_24_20_MG_C25_US TrialDuration 15
keylset TCP_24_20_MG_C25_US TestDurationSec 15

#TCP_5_20_M31_C1_DS
set TCP_5_20_M31_C1_DS ${tcp_goodput}
keylset TCP_5_20_M31_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M31_C1_DS Source {Eth}
keylset TCP_5_20_M31_C1_DS Destination {Wifi5_20_31_1CLI}
keylset TCP_5_20_M31_C1_DS TrialDuration 15
keylset TCP_5_20_M31_C1_DS TestDurationSec 15
#TCP_5_20_M31_C1_US
set TCP_5_20_M31_C1_US ${tcp_goodput}
keylset TCP_5_20_M31_C1_US Direction {Unidirectional}
keylset TCP_5_20_M31_C1_US Source {Wifi5_20_31_1CLI}
keylset TCP_5_20_M31_C1_US Destination {Eth}
keylset TCP_5_20_M31_C1_US TrialDuration 15
keylset TCP_5_20_M31_C1_US TestDurationSec 15
#TCP_5_20_M30_C1_DS
set TCP_5_20_M30_C1_DS ${tcp_goodput}
keylset TCP_5_20_M30_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M30_C1_DS Source {Eth}
keylset TCP_5_20_M30_C1_DS Destination {Wifi5_20_30_1CLI}
#TCP_5_20_M30_C1_US
set TCP_5_20_M30_C1_US ${tcp_goodput}
keylset TCP_5_20_M30_C1_US Direction {Unidirectional}
keylset TCP_5_20_M30_C1_US Source {Wifi5_20_30_1CLI}
keylset TCP_5_20_M30_C1_US Destination {Eth}
#TCP_5_20_M29_C1_DS
set TCP_5_20_M29_C1_DS ${tcp_goodput}
keylset TCP_5_20_M29_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M29_C1_DS Source {Eth}
keylset TCP_5_20_M29_C1_DS Destination {Wifi5_20_29_1CLI}
#TCP_5_20_M29_C1_US
set TCP_5_20_M29_C1_US ${tcp_goodput}
keylset TCP_5_20_M29_C1_US Direction {Unidirectional}
keylset TCP_5_20_M29_C1_US Source {Wifi5_20_29_1CLI}
keylset TCP_5_20_M29_C1_US Destination {Eth}
#TCP_5_20_M28_C1_DS
set TCP_5_20_M28_C1_DS ${tcp_goodput}
keylset TCP_5_20_M28_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M28_C1_DS Source {Eth}
keylset TCP_5_20_M28_C1_DS Destination {Wifi5_20_28_1CLI}
#TCP_5_20_M28_C1_US
set TCP_5_20_M28_C1_US ${tcp_goodput}
keylset TCP_5_20_M28_C1_US Direction {Unidirectional}
keylset TCP_5_20_M28_C1_US Source {Wifi5_20_28_1CLI}
keylset TCP_5_20_M28_C1_US Destination {Eth}
#TCP_5_20_M27_C1_DS
set TCP_5_20_M27_C1_DS ${tcp_goodput}
keylset TCP_5_20_M27_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M27_C1_DS Source {Eth}
keylset TCP_5_20_M27_C1_DS Destination {Wifi5_20_27_1CLI}
#TCP_5_20_M27_C1_US
set TCP_5_20_M27_C1_US ${tcp_goodput}
keylset TCP_5_20_M27_C1_US Direction {Unidirectional}
keylset TCP_5_20_M27_C1_US Source {Wifi5_20_27_1CLI}
keylset TCP_5_20_M27_C1_US Destination {Eth}
#TCP_5_20_M26_C1_DS
set TCP_5_20_M26_C1_DS ${tcp_goodput}
keylset TCP_5_20_M26_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M26_C1_DS Source {Eth}
keylset TCP_5_20_M26_C1_DS Destination {Wifi5_20_26_1CLI}
#TCP_5_20_M26_C1_US
set TCP_5_20_M26_C1_US ${tcp_goodput}
keylset TCP_5_20_M26_C1_US Direction {Unidirectional}
keylset TCP_5_20_M26_C1_US Source {Wifi5_20_26_1CLI}
keylset TCP_5_20_M26_C1_US Destination {Eth}
#TCP_5_20_M25_C1_DS
set TCP_5_20_M25_C1_DS ${tcp_goodput}
keylset TCP_5_20_M25_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M25_C1_DS Source {Eth}
keylset TCP_5_20_M25_C1_DS Destination {Wifi5_20_25_1CLI}
#TCP_5_20_M25_C1_US
set TCP_5_20_M25_C1_US ${tcp_goodput}
keylset TCP_5_20_M25_C1_US Direction {Unidirectional}
keylset TCP_5_20_M25_C1_US Source {Wifi5_20_25_1CLI}
keylset TCP_5_20_M25_C1_US Destination {Eth}
#TCP_5_20_M24_C1_DS
set TCP_5_20_M24_C1_DS ${tcp_goodput}
keylset TCP_5_20_M24_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M24_C1_DS Source {Eth}
keylset TCP_5_20_M24_C1_DS Destination {Wifi5_20_24_1CLI}
#TCP_5_20_M24_C1_US
set TCP_5_20_M24_C1_US ${tcp_goodput}
keylset TCP_5_20_M24_C1_US Direction {Unidirectional}
keylset TCP_5_20_M24_C1_US Source {Wifi5_20_24_1CLI}
keylset TCP_5_20_M24_C1_US Destination {Eth}
#TCP_5_20_M23_C1_DS
set TCP_5_20_M23_C1_DS ${tcp_goodput}
keylset TCP_5_20_M23_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M23_C1_DS Source {Eth}
keylset TCP_5_20_M23_C1_DS Destination {Wifi5_20_23_1CLI}
keylset TCP_5_20_M23_C1_DS TrialDuration 15
keylset TCP_5_20_M23_C1_DS TestDurationSec 15
#TCP_5_20_M23_C1_US
set TCP_5_20_M23_C1_US ${tcp_goodput}
keylset TCP_5_20_M23_C1_US Direction {Unidirectional}
keylset TCP_5_20_M23_C1_US Source {Wifi5_20_23_1CLI}
keylset TCP_5_20_M23_C1_US Destination {Eth}
keylset TCP_5_20_M23_C1_US TrialDuration 15
keylset TCP_5_20_M23_C1_US TestDurationSec 15
#TCP_5_20_M22_C1_DS
set TCP_5_20_M22_C1_DS ${tcp_goodput}
keylset TCP_5_20_M22_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M22_C1_DS Source {Eth}
keylset TCP_5_20_M22_C1_DS Destination {Wifi5_20_22_1CLI}
#TCP_5_20_M22_C1_US
set TCP_5_20_M22_C1_US ${tcp_goodput}
keylset TCP_5_20_M22_C1_US Direction {Unidirectional}
keylset TCP_5_20_M22_C1_US Source {Wifi5_20_22_1CLI}
keylset TCP_5_20_M22_C1_US Destination {Eth}
#TCP_5_20_M21_C1_DS
set TCP_5_20_M21_C1_DS ${tcp_goodput}
keylset TCP_5_20_M21_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M21_C1_DS Source {Eth}
keylset TCP_5_20_M21_C1_DS Destination {Wifi5_20_21_1CLI}
#TCP_5_20_M21_C1_US
set TCP_5_20_M21_C1_US ${tcp_goodput}
keylset TCP_5_20_M21_C1_US Direction {Unidirectional}
keylset TCP_5_20_M21_C1_US Source {Wifi5_20_21_1CLI}
keylset TCP_5_20_M21_C1_US Destination {Eth}
#TCP_5_20_M20_C1_DS
set TCP_5_20_M20_C1_DS ${tcp_goodput}
keylset TCP_5_20_M20_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M20_C1_DS Source {Eth}
keylset TCP_5_20_M20_C1_DS Destination {Wifi5_20_20_1CLI}
#TCP_5_20_M20_C1_US
set TCP_5_20_M20_C1_US ${tcp_goodput}
keylset TCP_5_20_M20_C1_US Direction {Unidirectional}
keylset TCP_5_20_M20_C1_US Source {Wifi5_20_20_1CLI}
keylset TCP_5_20_M20_C1_US Destination {Eth}
#TCP_5_20_M19_C1_DS
set TCP_5_20_M19_C1_DS ${tcp_goodput}
keylset TCP_5_20_M19_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M19_C1_DS Source {Eth}
keylset TCP_5_20_M19_C1_DS Destination {Wifi5_20_19_1CLI}
#TCP_5_20_M19_C1_US
set TCP_5_20_M19_C1_US ${tcp_goodput}
keylset TCP_5_20_M19_C1_US Direction {Unidirectional}
keylset TCP_5_20_M19_C1_US Source {Wifi5_20_19_1CLI}
keylset TCP_5_20_M19_C1_US Destination {Eth}
#TCP_5_20_M18_C1_DS
set TCP_5_20_M18_C1_DS ${tcp_goodput}
keylset TCP_5_20_M18_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M18_C1_DS Source {Eth}
keylset TCP_5_20_M18_C1_DS Destination {Wifi5_20_18_1CLI}
#TCP_5_20_M18_C1_US
set TCP_5_20_M18_C1_US ${tcp_goodput}
keylset TCP_5_20_M18_C1_US Direction {Unidirectional}
keylset TCP_5_20_M18_C1_US Source {Wifi5_20_18_1CLI}
keylset TCP_5_20_M18_C1_US Destination {Eth}
#TCP_5_20_M17_C1_DS
set TCP_5_20_M17_C1_DS ${tcp_goodput}
keylset TCP_5_20_M17_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M17_C1_DS Source {Eth}
keylset TCP_5_20_M17_C1_DS Destination {Wifi5_20_17_1CLI}
#TCP_5_20_M17_C1_US
set TCP_5_20_M17_C1_US ${tcp_goodput}
keylset TCP_5_20_M17_C1_US Direction {Unidirectional}
keylset TCP_5_20_M17_C1_US Source {Wifi5_20_17_1CLI}
keylset TCP_5_20_M17_C1_US Destination {Eth}
#TCP_5_20_M16_C1_DS
set TCP_5_20_M16_C1_DS ${tcp_goodput}
keylset TCP_5_20_M16_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M16_C1_DS Source {Eth}
keylset TCP_5_20_M16_C1_DS Destination {Wifi5_20_16_1CLI}
#TCP_5_20_M16_C1_US
set TCP_5_20_M16_C1_US ${tcp_goodput}
keylset TCP_5_20_M16_C1_US Direction {Unidirectional}
keylset TCP_5_20_M16_C1_US Source {Wifi5_20_16_1CLI}
keylset TCP_5_20_M16_C1_US Destination {Eth}
#TCP_5_20_M15_C1_DS
set TCP_5_20_M15_C1_DS ${tcp_goodput}
keylset TCP_5_20_M15_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M15_C1_DS Source {Eth}
keylset TCP_5_20_M15_C1_DS Destination {Wifi5_20_15_1CLI}
keylset TCP_5_20_M15_C1_DS TrialDuration 15
keylset TCP_5_20_M15_C1_DS TestDurationSec 15
#TCP_5_20_M15_C1_US
set TCP_5_20_M15_C1_US ${tcp_goodput}
keylset TCP_5_20_M15_C1_US Direction {Unidirectional}
keylset TCP_5_20_M15_C1_US Source {Wifi5_20_15_1CLI}
keylset TCP_5_20_M15_C1_US Destination {Eth}
keylset TCP_5_20_M15_C1_US TrialDuration 15
keylset TCP_5_20_M15_C1_US TestDurationSec 15
#TCP_5_20_M14_C1_DS
set TCP_5_20_M14_C1_DS ${tcp_goodput}
keylset TCP_5_20_M14_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M14_C1_DS Source {Eth}
keylset TCP_5_20_M14_C1_DS Destination {Wifi5_20_14_1CLI}
#TCP_5_20_M14_C1_US
set TCP_5_20_M14_C1_US ${tcp_goodput}
keylset TCP_5_20_M14_C1_US Direction {Unidirectional}
keylset TCP_5_20_M14_C1_US Source {Wifi5_20_14_1CLI}
keylset TCP_5_20_M14_C1_US Destination {Eth}
#TCP_5_20_M13_C1_DS
set TCP_5_20_M13_C1_DS ${tcp_goodput}
keylset TCP_5_20_M13_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M13_C1_DS Source {Eth}
keylset TCP_5_20_M13_C1_DS Destination {Wifi5_20_13_1CLI}
#TCP_5_20_M13_C1_US
set TCP_5_20_M13_C1_US ${tcp_goodput}
keylset TCP_5_20_M13_C1_US Direction {Unidirectional}
keylset TCP_5_20_M13_C1_US Source {Wifi5_20_13_1CLI}
keylset TCP_5_20_M13_C1_US Destination {Eth}
#TCP_5_20_M12_C1_DS
set TCP_5_20_M12_C1_DS ${tcp_goodput}
keylset TCP_5_20_M12_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M12_C1_DS Source {Eth}
keylset TCP_5_20_M12_C1_DS Destination {Wifi5_20_12_1CLI}
#TCP_5_20_M12_C1_US
set TCP_5_20_M12_C1_US ${tcp_goodput}
keylset TCP_5_20_M12_C1_US Direction {Unidirectional}
keylset TCP_5_20_M12_C1_US Source {Wifi5_20_12_1CLI}
keylset TCP_5_20_M12_C1_US Destination {Eth}
#TCP_5_20_M11_C1_DS
set TCP_5_20_M11_C1_DS ${tcp_goodput}
keylset TCP_5_20_M11_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M11_C1_DS Source {Eth}
keylset TCP_5_20_M11_C1_DS Destination {Wifi5_20_11_1CLI}
#TCP_5_20_M11_C1_US
set TCP_5_20_M11_C1_US ${tcp_goodput}
keylset TCP_5_20_M11_C1_US Direction {Unidirectional}
keylset TCP_5_20_M11_C1_US Source {Wifi5_20_11_1CLI}
keylset TCP_5_20_M11_C1_US Destination {Eth}
#TCP_5_20_M10_C1_DS
set TCP_5_20_M10_C1_DS ${tcp_goodput}
keylset TCP_5_20_M10_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M10_C1_DS Source {Eth}
keylset TCP_5_20_M10_C1_DS Destination {Wifi5_20_10_1CLI}
#TCP_5_20_M10_C1_US
set TCP_5_20_M10_C1_US ${tcp_goodput}
keylset TCP_5_20_M10_C1_US Direction {Unidirectional}
keylset TCP_5_20_M10_C1_US Source {Wifi5_20_10_1CLI}
keylset TCP_5_20_M10_C1_US Destination {Eth}
#TCP_5_20_M9_C1_DS
set TCP_5_20_M9_C1_DS ${tcp_goodput}
keylset TCP_5_20_M9_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M9_C1_DS Source {Eth}
keylset TCP_5_20_M9_C1_DS Destination {Wifi5_20_9_1CLI}
#TCP_5_20_M9_C1_US
set TCP_5_20_M9_C1_US ${tcp_goodput}
keylset TCP_5_20_M9_C1_US Direction {Unidirectional}
keylset TCP_5_20_M9_C1_US Source {Wifi5_20_9_1CLI}
keylset TCP_5_20_M9_C1_US Destination {Eth}
#TCP_5_20_M8_C1_DS
set TCP_5_20_M8_C1_DS ${tcp_goodput}
keylset TCP_5_20_M8_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M8_C1_DS Source {Eth}
keylset TCP_5_20_M8_C1_DS Destination {Wifi5_20_8_1CLI}
#TCP_5_20_M8_C1_US
set TCP_5_20_M8_C1_US ${tcp_goodput}
keylset TCP_5_20_M8_C1_US Direction {Unidirectional}
keylset TCP_5_20_M8_C1_US Source {Wifi5_20_8_1CLI}
keylset TCP_5_20_M8_C1_US Destination {Eth}
#TCP_5_20_M7_C1_DS
set TCP_5_20_M7_C1_DS ${tcp_goodput}
keylset TCP_5_20_M7_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M7_C1_DS Source {Eth}
keylset TCP_5_20_M7_C1_DS Destination {Wifi5_20_7_1CLI}
keylset TCP_5_20_M7_C1_DS TrialDuration 15
keylset TCP_5_20_M7_C1_DS TestDurationSec 15
#TCP_5_20_M7_C1_US
set TCP_5_20_M7_C1_US ${tcp_goodput}
keylset TCP_5_20_M7_C1_US Direction {Unidirectional}
keylset TCP_5_20_M7_C1_US Source {Wifi5_20_7_1CLI}
keylset TCP_5_20_M7_C1_US Destination {Eth}
keylset TCP_5_20_M7_C1_US TrialDuration 15
keylset TCP_5_20_M7_C1_US TestDurationSec 15
#TCP_5_20_M6_C1_DS
set TCP_5_20_M6_C1_DS ${tcp_goodput}
keylset TCP_5_20_M6_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M6_C1_DS Source {Eth}
keylset TCP_5_20_M6_C1_DS Destination {Wifi5_20_6_1CLI}
#TCP_5_20_M6_C1_US
set TCP_5_20_M6_C1_US ${tcp_goodput}
keylset TCP_5_20_M6_C1_US Direction {Unidirectional}
keylset TCP_5_20_M6_C1_US Source {Wifi5_20_6_1CLI}
keylset TCP_5_20_M6_C1_US Destination {Eth}
#TCP_5_20_M5_C1_DS
set TCP_5_20_M5_C1_DS ${tcp_goodput}
keylset TCP_5_20_M5_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M5_C1_DS Source {Eth}
keylset TCP_5_20_M5_C1_DS Destination {Wifi5_20_5_1CLI}
#TCP_5_20_M5_C1_US
set TCP_5_20_M5_C1_US ${tcp_goodput}
keylset TCP_5_20_M5_C1_US Direction {Unidirectional}
keylset TCP_5_20_M5_C1_US Source {Wifi5_20_5_1CLI}
keylset TCP_5_20_M5_C1_US Destination {Eth}
#TCP_5_20_M4_C1_DS
set TCP_5_20_M4_C1_DS ${tcp_goodput}
keylset TCP_5_20_M4_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M4_C1_DS Source {Eth}
keylset TCP_5_20_M4_C1_DS Destination {Wifi5_20_4_1CLI}
#TCP_5_20_M4_C1_US
set TCP_5_20_M4_C1_US ${tcp_goodput}
keylset TCP_5_20_M4_C1_US Direction {Unidirectional}
keylset TCP_5_20_M4_C1_US Source {Wifi5_20_4_1CLI}
keylset TCP_5_20_M4_C1_US Destination {Eth}
#TCP_5_20_M3_C1_DS
set TCP_5_20_M3_C1_DS ${tcp_goodput}
keylset TCP_5_20_M3_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M3_C1_DS Source {Eth}
keylset TCP_5_20_M3_C1_DS Destination {Wifi5_20_3_1CLI}
#TCP_5_20_M3_C1_US
set TCP_5_20_M3_C1_US ${tcp_goodput}
keylset TCP_5_20_M3_C1_US Direction {Unidirectional}
keylset TCP_5_20_M3_C1_US Source {Wifi5_20_3_1CLI}
keylset TCP_5_20_M3_C1_US Destination {Eth}
#TCP_5_20_M2_C1_DS
set TCP_5_20_M2_C1_DS ${tcp_goodput}
keylset TCP_5_20_M2_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M2_C1_DS Source {Eth}
keylset TCP_5_20_M2_C1_DS Destination {Wifi5_20_2_1CLI}
#TCP_5_20_M2_C1_US
set TCP_5_20_M2_C1_US ${tcp_goodput}
keylset TCP_5_20_M2_C1_US Direction {Unidirectional}
keylset TCP_5_20_M2_C1_US Source {Wifi5_20_2_1CLI}
keylset TCP_5_20_M2_C1_US Destination {Eth}
#TCP_5_20_M1_C1_DS
set TCP_5_20_M1_C1_DS ${tcp_goodput}
keylset TCP_5_20_M1_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M1_C1_DS Source {Eth}
keylset TCP_5_20_M1_C1_DS Destination {Wifi5_20_1_1CLI}
#TCP_5_20_M1_C1_US
set TCP_5_20_M1_C1_US ${tcp_goodput}
keylset TCP_5_20_M1_C1_US Direction {Unidirectional}
keylset TCP_5_20_M1_C1_US Source {Wifi5_20_1_1CLI}
keylset TCP_5_20_M1_C1_US Destination {Eth}
#TCP_5_20_M0_C1_DS
set TCP_5_20_M0_C1_DS ${tcp_goodput}
keylset TCP_5_20_M0_C1_DS Direction {Unidirectional}
keylset TCP_5_20_M0_C1_DS Source {Eth}
keylset TCP_5_20_M0_C1_DS Destination {Wifi5_20_0_1CLI}
#TCP_5_20_M0_C1_US
set TCP_5_20_M0_C1_US ${tcp_goodput}
keylset TCP_5_20_M0_C1_US Direction {Unidirectional}
keylset TCP_5_20_M0_C1_US Source {Wifi5_20_0_1CLI}
keylset TCP_5_20_M0_C1_US Destination {Eth}
#TCP_5_20_MA_C1_DS
set TCP_5_20_MA_C1_DS ${tcp_goodput}
keylset TCP_5_20_MA_C1_DS Direction {Unidirectional}
keylset TCP_5_20_MA_C1_DS Source {Eth}
keylset TCP_5_20_MA_C1_DS Destination {Wifi5_20_a_1CLI}
keylset TCP_5_20_MA_C1_DS TrialDuration 15
keylset TCP_5_20_MA_C1_DS TestDurationSec 15
#TCP_5_20_MA_C1_US
set TCP_5_20_MA_C1_US ${tcp_goodput}
keylset TCP_5_20_MA_C1_US Direction {Unidirectional}
keylset TCP_5_20_MA_C1_US Source {Wifi5_20_a_1CLI}
keylset TCP_5_20_MA_C1_US Destination {Eth}
keylset TCP_5_20_MA_C1_US TrialDuration 15
keylset TCP_5_20_MA_C1_US TestDurationSec 15

#TCP_5_20_M31_C10_DS
set TCP_5_20_M31_C10_DS ${tcp_goodput}
keylset TCP_5_20_M31_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M31_C10_DS Source {Eth}
keylset TCP_5_20_M31_C10_DS Destination {Wifi5_20_31_10CLI}
keylset TCP_5_20_M31_C10_DS TrialDuration 15
keylset TCP_5_20_M31_C10_DS TestDurationSec 15
#TCP_5_20_M31_C10_US
set TCP_5_20_M31_C10_US ${tcp_goodput}
keylset TCP_5_20_M31_C10_US Direction {Unidirectional}
keylset TCP_5_20_M31_C10_US Source {Wifi5_20_31_10CLI}
keylset TCP_5_20_M31_C10_US Destination {Eth}
keylset TCP_5_20_M31_C10_US TrialDuration 15
keylset TCP_5_20_M31_C10_US TestDurationSec 15
#TCP_5_20_M30_C10_DS
set TCP_5_20_M30_C10_DS ${tcp_goodput}
keylset TCP_5_20_M30_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M30_C10_DS Source {Eth}
keylset TCP_5_20_M30_C10_DS Destination {Wifi5_20_30_10CLI}
#TCP_5_20_M30_C10_US
set TCP_5_20_M30_C10_US ${tcp_goodput}
keylset TCP_5_20_M30_C10_US Direction {Unidirectional}
keylset TCP_5_20_M30_C10_US Source {Wifi5_20_30_10CLI}
keylset TCP_5_20_M30_C10_US Destination {Eth}
#TCP_5_20_M29_C10_DS
set TCP_5_20_M29_C10_DS ${tcp_goodput}
keylset TCP_5_20_M29_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M29_C10_DS Source {Eth}
keylset TCP_5_20_M29_C10_DS Destination {Wifi5_20_29_10CLI}
#TCP_5_20_M29_C10_US
set TCP_5_20_M29_C10_US ${tcp_goodput}
keylset TCP_5_20_M29_C10_US Direction {Unidirectional}
keylset TCP_5_20_M29_C10_US Source {Wifi5_20_29_10CLI}
keylset TCP_5_20_M29_C10_US Destination {Eth}
#TCP_5_20_M28_C10_DS
set TCP_5_20_M28_C10_DS ${tcp_goodput}
keylset TCP_5_20_M28_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M28_C10_DS Source {Eth}
keylset TCP_5_20_M28_C10_DS Destination {Wifi5_20_28_10CLI}
#TCP_5_20_M28_C10_US
set TCP_5_20_M28_C10_US ${tcp_goodput}
keylset TCP_5_20_M28_C10_US Direction {Unidirectional}
keylset TCP_5_20_M28_C10_US Source {Wifi5_20_28_10CLI}
keylset TCP_5_20_M28_C10_US Destination {Eth}
#TCP_5_20_M27_C10_DS
set TCP_5_20_M27_C10_DS ${tcp_goodput}
keylset TCP_5_20_M27_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M27_C10_DS Source {Eth}
keylset TCP_5_20_M27_C10_DS Destination {Wifi5_20_27_10CLI}
#TCP_5_20_M27_C10_US
set TCP_5_20_M27_C10_US ${tcp_goodput}
keylset TCP_5_20_M27_C10_US Direction {Unidirectional}
keylset TCP_5_20_M27_C10_US Source {Wifi5_20_27_10CLI}
keylset TCP_5_20_M27_C10_US Destination {Eth}
#TCP_5_20_M26_C10_DS
set TCP_5_20_M26_C10_DS ${tcp_goodput}
keylset TCP_5_20_M26_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M26_C10_DS Source {Eth}
keylset TCP_5_20_M26_C10_DS Destination {Wifi5_20_26_10CLI}
#TCP_5_20_M26_C10_US
set TCP_5_20_M26_C10_US ${tcp_goodput}
keylset TCP_5_20_M26_C10_US Direction {Unidirectional}
keylset TCP_5_20_M26_C10_US Source {Wifi5_20_26_10CLI}
keylset TCP_5_20_M26_C10_US Destination {Eth}
#TCP_5_20_M25_C10_DS
set TCP_5_20_M25_C10_DS ${tcp_goodput}
keylset TCP_5_20_M25_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M25_C10_DS Source {Eth}
keylset TCP_5_20_M25_C10_DS Destination {Wifi5_20_25_10CLI}
#TCP_5_20_M25_C10_US
set TCP_5_20_M25_C10_US ${tcp_goodput}
keylset TCP_5_20_M25_C10_US Direction {Unidirectional}
keylset TCP_5_20_M25_C10_US Source {Wifi5_20_25_10CLI}
keylset TCP_5_20_M25_C10_US Destination {Eth}
#TCP_5_20_M24_C10_DS
set TCP_5_20_M24_C10_DS ${tcp_goodput}
keylset TCP_5_20_M24_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M24_C10_DS Source {Eth}
keylset TCP_5_20_M24_C10_DS Destination {Wifi5_20_24_10CLI}
#TCP_5_20_M24_C10_US
set TCP_5_20_M24_C10_US ${tcp_goodput}
keylset TCP_5_20_M24_C10_US Direction {Unidirectional}
keylset TCP_5_20_M24_C10_US Source {Wifi5_20_24_10CLI}
keylset TCP_5_20_M24_C10_US Destination {Eth}
#TCP_5_20_M23_C10_DS
set TCP_5_20_M23_C10_DS ${tcp_goodput}
keylset TCP_5_20_M23_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M23_C10_DS Source {Eth}
keylset TCP_5_20_M23_C10_DS Destination {Wifi5_20_23_10CLI}
keylset TCP_5_20_M23_C10_DS TrialDuration 15
keylset TCP_5_20_M23_C10_DS TestDurationSec 15
#TCP_5_20_M23_C10_US
set TCP_5_20_M23_C10_US ${tcp_goodput}
keylset TCP_5_20_M23_C10_US Direction {Unidirectional}
keylset TCP_5_20_M23_C10_US Source {Wifi5_20_23_10CLI}
keylset TCP_5_20_M23_C10_US Destination {Eth}
keylset TCP_5_20_M23_C10_US TrialDuration 15
keylset TCP_5_20_M23_C10_US TestDurationSec 15
#TCP_5_20_M22_C10_DS
set TCP_5_20_M22_C10_DS ${tcp_goodput}
keylset TCP_5_20_M22_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M22_C10_DS Source {Eth}
keylset TCP_5_20_M22_C10_DS Destination {Wifi5_20_22_10CLI}
#TCP_5_20_M22_C10_US
set TCP_5_20_M22_C10_US ${tcp_goodput}
keylset TCP_5_20_M22_C10_US Direction {Unidirectional}
keylset TCP_5_20_M22_C10_US Source {Wifi5_20_22_10CLI}
keylset TCP_5_20_M22_C10_US Destination {Eth}
#TCP_5_20_M21_C10_DS
set TCP_5_20_M21_C10_DS ${tcp_goodput}
keylset TCP_5_20_M21_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M21_C10_DS Source {Eth}
keylset TCP_5_20_M21_C10_DS Destination {Wifi5_20_21_10CLI}
#TCP_5_20_M21_C10_US
set TCP_5_20_M21_C10_US ${tcp_goodput}
keylset TCP_5_20_M21_C10_US Direction {Unidirectional}
keylset TCP_5_20_M21_C10_US Source {Wifi5_20_21_10CLI}
keylset TCP_5_20_M21_C10_US Destination {Eth}
#TCP_5_20_M20_C10_DS
set TCP_5_20_M20_C10_DS ${tcp_goodput}
keylset TCP_5_20_M20_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M20_C10_DS Source {Eth}
keylset TCP_5_20_M20_C10_DS Destination {Wifi5_20_20_10CLI}
#TCP_5_20_M20_C10_US
set TCP_5_20_M20_C10_US ${tcp_goodput}
keylset TCP_5_20_M20_C10_US Direction {Unidirectional}
keylset TCP_5_20_M20_C10_US Source {Wifi5_20_20_10CLI}
keylset TCP_5_20_M20_C10_US Destination {Eth}
#TCP_5_20_M19_C10_DS
set TCP_5_20_M19_C10_DS ${tcp_goodput}
keylset TCP_5_20_M19_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M19_C10_DS Source {Eth}
keylset TCP_5_20_M19_C10_DS Destination {Wifi5_20_19_10CLI}
#TCP_5_20_M19_C10_US
set TCP_5_20_M19_C10_US ${tcp_goodput}
keylset TCP_5_20_M19_C10_US Direction {Unidirectional}
keylset TCP_5_20_M19_C10_US Source {Wifi5_20_19_10CLI}
keylset TCP_5_20_M19_C10_US Destination {Eth}
#TCP_5_20_M18_C10_DS
set TCP_5_20_M18_C10_DS ${tcp_goodput}
keylset TCP_5_20_M18_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M18_C10_DS Source {Eth}
keylset TCP_5_20_M18_C10_DS Destination {Wifi5_20_18_10CLI}
#TCP_5_20_M18_C10_US
set TCP_5_20_M18_C10_US ${tcp_goodput}
keylset TCP_5_20_M18_C10_US Direction {Unidirectional}
keylset TCP_5_20_M18_C10_US Source {Wifi5_20_18_10CLI}
keylset TCP_5_20_M18_C10_US Destination {Eth}
#TCP_5_20_M17_C10_DS
set TCP_5_20_M17_C10_DS ${tcp_goodput}
keylset TCP_5_20_M17_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M17_C10_DS Source {Eth}
keylset TCP_5_20_M17_C10_DS Destination {Wifi5_20_17_10CLI}
#TCP_5_20_M17_C10_US
set TCP_5_20_M17_C10_US ${tcp_goodput}
keylset TCP_5_20_M17_C10_US Direction {Unidirectional}
keylset TCP_5_20_M17_C10_US Source {Wifi5_20_17_10CLI}
keylset TCP_5_20_M17_C10_US Destination {Eth}
#TCP_5_20_M16_C10_DS
set TCP_5_20_M16_C10_DS ${tcp_goodput}
keylset TCP_5_20_M16_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M16_C10_DS Source {Eth}
keylset TCP_5_20_M16_C10_DS Destination {Wifi5_20_16_10CLI}
#TCP_5_20_M16_C10_US
set TCP_5_20_M16_C10_US ${tcp_goodput}
keylset TCP_5_20_M16_C10_US Direction {Unidirectional}
keylset TCP_5_20_M16_C10_US Source {Wifi5_20_16_10CLI}
keylset TCP_5_20_M16_C10_US Destination {Eth}
#TCP_5_20_M15_C10_DS
set TCP_5_20_M15_C10_DS ${tcp_goodput}
keylset TCP_5_20_M15_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M15_C10_DS Source {Eth}
keylset TCP_5_20_M15_C10_DS Destination {Wifi5_20_15_10CLI}
keylset TCP_5_20_M15_C10_DS TrialDuration 15
keylset TCP_5_20_M15_C10_DS TestDurationSec 15
#TCP_5_20_M15_C10_US
set TCP_5_20_M15_C10_US ${tcp_goodput}
keylset TCP_5_20_M15_C10_US Direction {Unidirectional}
keylset TCP_5_20_M15_C10_US Source {Wifi5_20_15_10CLI}
keylset TCP_5_20_M15_C10_US Destination {Eth}
keylset TCP_5_20_M15_C10_US TrialDuration 15
keylset TCP_5_20_M15_C10_US TestDurationSec 15
#TCP_5_20_M14_C10_DS
set TCP_5_20_M14_C10_DS ${tcp_goodput}
keylset TCP_5_20_M14_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M14_C10_DS Source {Eth}
keylset TCP_5_20_M14_C10_DS Destination {Wifi5_20_14_10CLI}
#TCP_5_20_M14_C10_US
set TCP_5_20_M14_C10_US ${tcp_goodput}
keylset TCP_5_20_M14_C10_US Direction {Unidirectional}
keylset TCP_5_20_M14_C10_US Source {Wifi5_20_14_10CLI}
keylset TCP_5_20_M14_C10_US Destination {Eth}
#TCP_5_20_M13_C10_DS
set TCP_5_20_M13_C10_DS ${tcp_goodput}
keylset TCP_5_20_M13_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M13_C10_DS Source {Eth}
keylset TCP_5_20_M13_C10_DS Destination {Wifi5_20_13_10CLI}
#TCP_5_20_M13_C10_US
set TCP_5_20_M13_C10_US ${tcp_goodput}
keylset TCP_5_20_M13_C10_US Direction {Unidirectional}
keylset TCP_5_20_M13_C10_US Source {Wifi5_20_13_10CLI}
keylset TCP_5_20_M13_C10_US Destination {Eth}
#TCP_5_20_M12_C10_DS
set TCP_5_20_M12_C10_DS ${tcp_goodput}
keylset TCP_5_20_M12_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M12_C10_DS Source {Eth}
keylset TCP_5_20_M12_C10_DS Destination {Wifi5_20_12_10CLI}
#TCP_5_20_M12_C10_US
set TCP_5_20_M12_C10_US ${tcp_goodput}
keylset TCP_5_20_M12_C10_US Direction {Unidirectional}
keylset TCP_5_20_M12_C10_US Source {Wifi5_20_12_10CLI}
keylset TCP_5_20_M12_C10_US Destination {Eth}
#TCP_5_20_M11_C10_DS
set TCP_5_20_M11_C10_DS ${tcp_goodput}
keylset TCP_5_20_M11_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M11_C10_DS Source {Eth}
keylset TCP_5_20_M11_C10_DS Destination {Wifi5_20_11_10CLI}
#TCP_5_20_M11_C10_US
set TCP_5_20_M11_C10_US ${tcp_goodput}
keylset TCP_5_20_M11_C10_US Direction {Unidirectional}
keylset TCP_5_20_M11_C10_US Source {Wifi5_20_11_10CLI}
keylset TCP_5_20_M11_C10_US Destination {Eth}
#TCP_5_20_M10_C10_DS
set TCP_5_20_M10_C10_DS ${tcp_goodput}
keylset TCP_5_20_M10_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M10_C10_DS Source {Eth}
keylset TCP_5_20_M10_C10_DS Destination {Wifi5_20_10_10CLI}
#TCP_5_20_M10_C10_US
set TCP_5_20_M10_C10_US ${tcp_goodput}
keylset TCP_5_20_M10_C10_US Direction {Unidirectional}
keylset TCP_5_20_M10_C10_US Source {Wifi5_20_10_10CLI}
keylset TCP_5_20_M10_C10_US Destination {Eth}
#TCP_5_20_M9_C10_DS
set TCP_5_20_M9_C10_DS ${tcp_goodput}
keylset TCP_5_20_M9_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M9_C10_DS Source {Eth}
keylset TCP_5_20_M9_C10_DS Destination {Wifi5_20_9_10CLI}
#TCP_5_20_M9_C10_US
set TCP_5_20_M9_C10_US ${tcp_goodput}
keylset TCP_5_20_M9_C10_US Direction {Unidirectional}
keylset TCP_5_20_M9_C10_US Source {Wifi5_20_9_10CLI}
keylset TCP_5_20_M9_C10_US Destination {Eth}
#TCP_5_20_M8_C10_DS
set TCP_5_20_M8_C10_DS ${tcp_goodput}
keylset TCP_5_20_M8_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M8_C10_DS Source {Eth}
keylset TCP_5_20_M8_C10_DS Destination {Wifi5_20_8_10CLI}
#TCP_5_20_M8_C10_US
set TCP_5_20_M8_C10_US ${tcp_goodput}
keylset TCP_5_20_M8_C10_US Direction {Unidirectional}
keylset TCP_5_20_M8_C10_US Source {Wifi5_20_8_10CLI}
keylset TCP_5_20_M8_C10_US Destination {Eth}
#TCP_5_20_M7_C10_DS
set TCP_5_20_M7_C10_DS ${tcp_goodput}
keylset TCP_5_20_M7_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M7_C10_DS Source {Eth}
keylset TCP_5_20_M7_C10_DS Destination {Wifi5_20_7_10CLI}
keylset TCP_5_20_M7_C10_DS TrialDuration 15
keylset TCP_5_20_M7_C10_DS TestDurationSec 15
#TCP_5_20_M7_C10_US
set TCP_5_20_M7_C10_US ${tcp_goodput}
keylset TCP_5_20_M7_C10_US Direction {Unidirectional}
keylset TCP_5_20_M7_C10_US Source {Wifi5_20_7_10CLI}
keylset TCP_5_20_M7_C10_US Destination {Eth}
keylset TCP_5_20_M7_C10_US TrialDuration 15
keylset TCP_5_20_M7_C10_US TestDurationSec 15
#TCP_5_20_M6_C10_DS
set TCP_5_20_M6_C10_DS ${tcp_goodput}
keylset TCP_5_20_M6_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M6_C10_DS Source {Eth}
keylset TCP_5_20_M6_C10_DS Destination {Wifi5_20_6_10CLI}
#TCP_5_20_M6_C10_US
set TCP_5_20_M6_C10_US ${tcp_goodput}
keylset TCP_5_20_M6_C10_US Direction {Unidirectional}
keylset TCP_5_20_M6_C10_US Source {Wifi5_20_6_10CLI}
keylset TCP_5_20_M6_C10_US Destination {Eth}
#TCP_5_20_M5_C10_DS
set TCP_5_20_M5_C10_DS ${tcp_goodput}
keylset TCP_5_20_M5_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M5_C10_DS Source {Eth}
keylset TCP_5_20_M5_C10_DS Destination {Wifi5_20_5_10CLI}
#TCP_5_20_M5_C10_US
set TCP_5_20_M5_C10_US ${tcp_goodput}
keylset TCP_5_20_M5_C10_US Direction {Unidirectional}
keylset TCP_5_20_M5_C10_US Source {Wifi5_20_5_10CLI}
keylset TCP_5_20_M5_C10_US Destination {Eth}
#TCP_5_20_M4_C10_DS
set TCP_5_20_M4_C10_DS ${tcp_goodput}
keylset TCP_5_20_M4_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M4_C10_DS Source {Eth}
keylset TCP_5_20_M4_C10_DS Destination {Wifi5_20_4_10CLI}
#TCP_5_20_M4_C10_US
set TCP_5_20_M4_C10_US ${tcp_goodput}
keylset TCP_5_20_M4_C10_US Direction {Unidirectional}
keylset TCP_5_20_M4_C10_US Source {Wifi5_20_4_10CLI}
keylset TCP_5_20_M4_C10_US Destination {Eth}
#TCP_5_20_M3_C10_DS
set TCP_5_20_M3_C10_DS ${tcp_goodput}
keylset TCP_5_20_M3_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M3_C10_DS Source {Eth}
keylset TCP_5_20_M3_C10_DS Destination {Wifi5_20_3_10CLI}
#TCP_5_20_M3_C10_US
set TCP_5_20_M3_C10_US ${tcp_goodput}
keylset TCP_5_20_M3_C10_US Direction {Unidirectional}
keylset TCP_5_20_M3_C10_US Source {Wifi5_20_3_10CLI}
keylset TCP_5_20_M3_C10_US Destination {Eth}
#TCP_5_20_M2_C10_DS
set TCP_5_20_M2_C10_DS ${tcp_goodput}
keylset TCP_5_20_M2_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M2_C10_DS Source {Eth}
keylset TCP_5_20_M2_C10_DS Destination {Wifi5_20_2_10CLI}
#TCP_5_20_M2_C10_US
set TCP_5_20_M2_C10_US ${tcp_goodput}
keylset TCP_5_20_M2_C10_US Direction {Unidirectional}
keylset TCP_5_20_M2_C10_US Source {Wifi5_20_2_10CLI}
keylset TCP_5_20_M2_C10_US Destination {Eth}
#TCP_5_20_M1_C10_DS
set TCP_5_20_M1_C10_DS ${tcp_goodput}
keylset TCP_5_20_M1_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M1_C10_DS Source {Eth}
keylset TCP_5_20_M1_C10_DS Destination {Wifi5_20_1_10CLI}
#TCP_5_20_M1_C10_US
set TCP_5_20_M1_C10_US ${tcp_goodput}
keylset TCP_5_20_M1_C10_US Direction {Unidirectional}
keylset TCP_5_20_M1_C10_US Source {Wifi5_20_1_10CLI}
keylset TCP_5_20_M1_C10_US Destination {Eth}
#TCP_5_20_M0_C10_DS
set TCP_5_20_M0_C10_DS ${tcp_goodput}
keylset TCP_5_20_M0_C10_DS Direction {Unidirectional}
keylset TCP_5_20_M0_C10_DS Source {Eth}
keylset TCP_5_20_M0_C10_DS Destination {Wifi5_20_0_10CLI}
#TCP_5_20_M0_C10_US
set TCP_5_20_M0_C10_US ${tcp_goodput}
keylset TCP_5_20_M0_C10_US Direction {Unidirectional}
keylset TCP_5_20_M0_C10_US Source {Wifi5_20_0_10CLI}
keylset TCP_5_20_M0_C10_US Destination {Eth}
#TCP_5_20_MA_C10_DS
set TCP_5_20_MA_C10_DS ${tcp_goodput}
keylset TCP_5_20_MA_C10_DS Direction {Unidirectional}
keylset TCP_5_20_MA_C10_DS Source {Eth}
keylset TCP_5_20_MA_C10_DS Destination {Wifi5_20_a_10CLI}
keylset TCP_5_20_MA_C10_DS TrialDuration 15
keylset TCP_5_20_MA_C10_DS TestDurationSec 15
#TCP_5_20_MA_C10_US
set TCP_5_20_MA_C10_US ${tcp_goodput}
keylset TCP_5_20_MA_C10_US Direction {Unidirectional}
keylset TCP_5_20_MA_C10_US Source {Wifi5_20_a_10CLI}
keylset TCP_5_20_MA_C10_US Destination {Eth}
keylset TCP_5_20_MA_C10_US TrialDuration 15
keylset TCP_5_20_MA_C10_US TestDurationSec 15



#TCP_5_20_M31_C25_DS
set TCP_5_20_M31_C25_DS ${tcp_goodput}
keylset TCP_5_20_M31_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M31_C25_DS Source {Eth}
keylset TCP_5_20_M31_C25_DS Destination {Wifi5_20_31_25CLI}
keylset TCP_5_20_M31_C25_DS TrialDuration 15
keylset TCP_5_20_M31_C25_DS TestDurationSec 15
#TCP_5_20_M31_C25_US
set TCP_5_20_M31_C25_US ${tcp_goodput}
keylset TCP_5_20_M31_C25_US Direction {Unidirectional}
keylset TCP_5_20_M31_C25_US Source {Wifi5_20_31_25CLI}
keylset TCP_5_20_M31_C25_US Destination {Eth}
keylset TCP_5_20_M31_C25_US TrialDuration 15
keylset TCP_5_20_M31_C25_US TestDurationSec 15
#TCP_5_20_M30_C25_DS
set TCP_5_20_M30_C25_DS ${tcp_goodput}
keylset TCP_5_20_M30_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M30_C25_DS Source {Eth}
keylset TCP_5_20_M30_C25_DS Destination {Wifi5_20_30_25CLI}
#TCP_5_20_M30_C25_US
set TCP_5_20_M30_C25_US ${tcp_goodput}
keylset TCP_5_20_M30_C25_US Direction {Unidirectional}
keylset TCP_5_20_M30_C25_US Source {Wifi5_20_30_25CLI}
keylset TCP_5_20_M30_C25_US Destination {Eth}
#TCP_5_20_M29_C25_DS
set TCP_5_20_M29_C25_DS ${tcp_goodput}
keylset TCP_5_20_M29_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M29_C25_DS Source {Eth}
keylset TCP_5_20_M29_C25_DS Destination {Wifi5_20_29_25CLI}
#TCP_5_20_M29_C25_US
set TCP_5_20_M29_C25_US ${tcp_goodput}
keylset TCP_5_20_M29_C25_US Direction {Unidirectional}
keylset TCP_5_20_M29_C25_US Source {Wifi5_20_29_25CLI}
keylset TCP_5_20_M29_C25_US Destination {Eth}
#TCP_5_20_M28_C25_DS
set TCP_5_20_M28_C25_DS ${tcp_goodput}
keylset TCP_5_20_M28_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M28_C25_DS Source {Eth}
keylset TCP_5_20_M28_C25_DS Destination {Wifi5_20_28_25CLI}
#TCP_5_20_M28_C25_US
set TCP_5_20_M28_C25_US ${tcp_goodput}
keylset TCP_5_20_M28_C25_US Direction {Unidirectional}
keylset TCP_5_20_M28_C25_US Source {Wifi5_20_28_25CLI}
keylset TCP_5_20_M28_C25_US Destination {Eth}
#TCP_5_20_M27_C25_DS
set TCP_5_20_M27_C25_DS ${tcp_goodput}
keylset TCP_5_20_M27_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M27_C25_DS Source {Eth}
keylset TCP_5_20_M27_C25_DS Destination {Wifi5_20_27_25CLI}
#TCP_5_20_M27_C25_US
set TCP_5_20_M27_C25_US ${tcp_goodput}
keylset TCP_5_20_M27_C25_US Direction {Unidirectional}
keylset TCP_5_20_M27_C25_US Source {Wifi5_20_27_25CLI}
keylset TCP_5_20_M27_C25_US Destination {Eth}
#TCP_5_20_M26_C25_DS
set TCP_5_20_M26_C25_DS ${tcp_goodput}
keylset TCP_5_20_M26_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M26_C25_DS Source {Eth}
keylset TCP_5_20_M26_C25_DS Destination {Wifi5_20_26_25CLI}
#TCP_5_20_M26_C25_US
set TCP_5_20_M26_C25_US ${tcp_goodput}
keylset TCP_5_20_M26_C25_US Direction {Unidirectional}
keylset TCP_5_20_M26_C25_US Source {Wifi5_20_26_25CLI}
keylset TCP_5_20_M26_C25_US Destination {Eth}
#TCP_5_20_M25_C25_DS
set TCP_5_20_M25_C25_DS ${tcp_goodput}
keylset TCP_5_20_M25_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M25_C25_DS Source {Eth}
keylset TCP_5_20_M25_C25_DS Destination {Wifi5_20_25_25CLI}
#TCP_5_20_M25_C25_US
set TCP_5_20_M25_C25_US ${tcp_goodput}
keylset TCP_5_20_M25_C25_US Direction {Unidirectional}
keylset TCP_5_20_M25_C25_US Source {Wifi5_20_25_25CLI}
keylset TCP_5_20_M25_C25_US Destination {Eth}
#TCP_5_20_M24_C25_DS
set TCP_5_20_M24_C25_DS ${tcp_goodput}
keylset TCP_5_20_M24_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M24_C25_DS Source {Eth}
keylset TCP_5_20_M24_C25_DS Destination {Wifi5_20_24_25CLI}
#TCP_5_20_M24_C25_US
set TCP_5_20_M24_C25_US ${tcp_goodput}
keylset TCP_5_20_M24_C25_US Direction {Unidirectional}
keylset TCP_5_20_M24_C25_US Source {Wifi5_20_24_25CLI}
keylset TCP_5_20_M24_C25_US Destination {Eth}
#TCP_5_20_M23_C25_DS
set TCP_5_20_M23_C25_DS ${tcp_goodput}
keylset TCP_5_20_M23_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M23_C25_DS Source {Eth}
keylset TCP_5_20_M23_C25_DS Destination {Wifi5_20_23_25CLI}
keylset TCP_5_20_M23_C25_DS TrialDuration 15
keylset TCP_5_20_M23_C25_DS TestDurationSec 15
#TCP_5_20_M23_C25_US
set TCP_5_20_M23_C25_US ${tcp_goodput}
keylset TCP_5_20_M23_C25_US Direction {Unidirectional}
keylset TCP_5_20_M23_C25_US Source {Wifi5_20_23_25CLI}
keylset TCP_5_20_M23_C25_US Destination {Eth}
keylset TCP_5_20_M23_C25_US TrialDuration 15
keylset TCP_5_20_M23_C25_US TestDurationSec 15
#TCP_5_20_M22_C25_DS
set TCP_5_20_M22_C25_DS ${tcp_goodput}
keylset TCP_5_20_M22_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M22_C25_DS Source {Eth}
keylset TCP_5_20_M22_C25_DS Destination {Wifi5_20_22_25CLI}
#TCP_5_20_M22_C25_US
set TCP_5_20_M22_C25_US ${tcp_goodput}
keylset TCP_5_20_M22_C25_US Direction {Unidirectional}
keylset TCP_5_20_M22_C25_US Source {Wifi5_20_22_25CLI}
keylset TCP_5_20_M22_C25_US Destination {Eth}
#TCP_5_20_M21_C25_DS
set TCP_5_20_M21_C25_DS ${tcp_goodput}
keylset TCP_5_20_M21_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M21_C25_DS Source {Eth}
keylset TCP_5_20_M21_C25_DS Destination {Wifi5_20_21_25CLI}
#TCP_5_20_M21_C25_US
set TCP_5_20_M21_C25_US ${tcp_goodput}
keylset TCP_5_20_M21_C25_US Direction {Unidirectional}
keylset TCP_5_20_M21_C25_US Source {Wifi5_20_21_25CLI}
keylset TCP_5_20_M21_C25_US Destination {Eth}
#TCP_5_20_M20_C25_DS
set TCP_5_20_M20_C25_DS ${tcp_goodput}
keylset TCP_5_20_M20_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M20_C25_DS Source {Eth}
keylset TCP_5_20_M20_C25_DS Destination {Wifi5_20_20_25CLI}
#TCP_5_20_M20_C25_US
set TCP_5_20_M20_C25_US ${tcp_goodput}
keylset TCP_5_20_M20_C25_US Direction {Unidirectional}
keylset TCP_5_20_M20_C25_US Source {Wifi5_20_20_25CLI}
keylset TCP_5_20_M20_C25_US Destination {Eth}
#TCP_5_20_M19_C25_DS
set TCP_5_20_M19_C25_DS ${tcp_goodput}
keylset TCP_5_20_M19_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M19_C25_DS Source {Eth}
keylset TCP_5_20_M19_C25_DS Destination {Wifi5_20_19_25CLI}
#TCP_5_20_M19_C25_US
set TCP_5_20_M19_C25_US ${tcp_goodput}
keylset TCP_5_20_M19_C25_US Direction {Unidirectional}
keylset TCP_5_20_M19_C25_US Source {Wifi5_20_19_25CLI}
keylset TCP_5_20_M19_C25_US Destination {Eth}
#TCP_5_20_M18_C25_DS
set TCP_5_20_M18_C25_DS ${tcp_goodput}
keylset TCP_5_20_M18_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M18_C25_DS Source {Eth}
keylset TCP_5_20_M18_C25_DS Destination {Wifi5_20_18_25CLI}
#TCP_5_20_M18_C25_US
set TCP_5_20_M18_C25_US ${tcp_goodput}
keylset TCP_5_20_M18_C25_US Direction {Unidirectional}
keylset TCP_5_20_M18_C25_US Source {Wifi5_20_18_25CLI}
keylset TCP_5_20_M18_C25_US Destination {Eth}
#TCP_5_20_M17_C25_DS
set TCP_5_20_M17_C25_DS ${tcp_goodput}
keylset TCP_5_20_M17_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M17_C25_DS Source {Eth}
keylset TCP_5_20_M17_C25_DS Destination {Wifi5_20_17_25CLI}
#TCP_5_20_M17_C25_US
set TCP_5_20_M17_C25_US ${tcp_goodput}
keylset TCP_5_20_M17_C25_US Direction {Unidirectional}
keylset TCP_5_20_M17_C25_US Source {Wifi5_20_17_25CLI}
keylset TCP_5_20_M17_C25_US Destination {Eth}
#TCP_5_20_M16_C25_DS
set TCP_5_20_M16_C25_DS ${tcp_goodput}
keylset TCP_5_20_M16_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M16_C25_DS Source {Eth}
keylset TCP_5_20_M16_C25_DS Destination {Wifi5_20_16_25CLI}
#TCP_5_20_M16_C25_US
set TCP_5_20_M16_C25_US ${tcp_goodput}
keylset TCP_5_20_M16_C25_US Direction {Unidirectional}
keylset TCP_5_20_M16_C25_US Source {Wifi5_20_16_25CLI}
keylset TCP_5_20_M16_C25_US Destination {Eth}
#TCP_5_20_M15_C25_DS
set TCP_5_20_M15_C25_DS ${tcp_goodput}
keylset TCP_5_20_M15_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M15_C25_DS Source {Eth}
keylset TCP_5_20_M15_C25_DS Destination {Wifi5_20_15_25CLI}
keylset TCP_5_20_M15_C25_DS TrialDuration 15
keylset TCP_5_20_M15_C25_DS TestDurationSec 15
#TCP_5_20_M15_C25_US
set TCP_5_20_M15_C25_US ${tcp_goodput}
keylset TCP_5_20_M15_C25_US Direction {Unidirectional}
keylset TCP_5_20_M15_C25_US Source {Wifi5_20_15_25CLI}
keylset TCP_5_20_M15_C25_US Destination {Eth}
keylset TCP_5_20_M15_C25_US TrialDuration 15
keylset TCP_5_20_M15_C25_US TestDurationSec 15
#TCP_5_20_M14_C25_DS
set TCP_5_20_M14_C25_DS ${tcp_goodput}
keylset TCP_5_20_M14_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M14_C25_DS Source {Eth}
keylset TCP_5_20_M14_C25_DS Destination {Wifi5_20_14_25CLI}
#TCP_5_20_M14_C25_US
set TCP_5_20_M14_C25_US ${tcp_goodput}
keylset TCP_5_20_M14_C25_US Direction {Unidirectional}
keylset TCP_5_20_M14_C25_US Source {Wifi5_20_14_25CLI}
keylset TCP_5_20_M14_C25_US Destination {Eth}
#TCP_5_20_M13_C25_DS
set TCP_5_20_M13_C25_DS ${tcp_goodput}
keylset TCP_5_20_M13_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M13_C25_DS Source {Eth}
keylset TCP_5_20_M13_C25_DS Destination {Wifi5_20_13_25CLI}
#TCP_5_20_M13_C25_US
set TCP_5_20_M13_C25_US ${tcp_goodput}
keylset TCP_5_20_M13_C25_US Direction {Unidirectional}
keylset TCP_5_20_M13_C25_US Source {Wifi5_20_13_25CLI}
keylset TCP_5_20_M13_C25_US Destination {Eth}
#TCP_5_20_M12_C25_DS
set TCP_5_20_M12_C25_DS ${tcp_goodput}
keylset TCP_5_20_M12_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M12_C25_DS Source {Eth}
keylset TCP_5_20_M12_C25_DS Destination {Wifi5_20_12_25CLI}
#TCP_5_20_M12_C25_US
set TCP_5_20_M12_C25_US ${tcp_goodput}
keylset TCP_5_20_M12_C25_US Direction {Unidirectional}
keylset TCP_5_20_M12_C25_US Source {Wifi5_20_12_25CLI}
keylset TCP_5_20_M12_C25_US Destination {Eth}
#TCP_5_20_M11_C25_DS
set TCP_5_20_M11_C25_DS ${tcp_goodput}
keylset TCP_5_20_M11_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M11_C25_DS Source {Eth}
keylset TCP_5_20_M11_C25_DS Destination {Wifi5_20_11_25CLI}
#TCP_5_20_M11_C25_US
set TCP_5_20_M11_C25_US ${tcp_goodput}
keylset TCP_5_20_M11_C25_US Direction {Unidirectional}
keylset TCP_5_20_M11_C25_US Source {Wifi5_20_11_25CLI}
keylset TCP_5_20_M11_C25_US Destination {Eth}
#TCP_5_20_M10_C25_DS
set TCP_5_20_M10_C25_DS ${tcp_goodput}
keylset TCP_5_20_M10_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M10_C25_DS Source {Eth}
keylset TCP_5_20_M10_C25_DS Destination {Wifi5_20_10_25CLI}
#TCP_5_20_M10_C25_US
set TCP_5_20_M10_C25_US ${tcp_goodput}
keylset TCP_5_20_M10_C25_US Direction {Unidirectional}
keylset TCP_5_20_M10_C25_US Source {Wifi5_20_10_25CLI}
keylset TCP_5_20_M10_C25_US Destination {Eth}
#TCP_5_20_M9_C25_DS
set TCP_5_20_M9_C25_DS ${tcp_goodput}
keylset TCP_5_20_M9_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M9_C25_DS Source {Eth}
keylset TCP_5_20_M9_C25_DS Destination {Wifi5_20_9_25CLI}
#TCP_5_20_M9_C25_US
set TCP_5_20_M9_C25_US ${tcp_goodput}
keylset TCP_5_20_M9_C25_US Direction {Unidirectional}
keylset TCP_5_20_M9_C25_US Source {Wifi5_20_9_25CLI}
keylset TCP_5_20_M9_C25_US Destination {Eth}
#TCP_5_20_M8_C25_DS
set TCP_5_20_M8_C25_DS ${tcp_goodput}
keylset TCP_5_20_M8_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M8_C25_DS Source {Eth}
keylset TCP_5_20_M8_C25_DS Destination {Wifi5_20_8_25CLI}
#TCP_5_20_M8_C25_US
set TCP_5_20_M8_C25_US ${tcp_goodput}
keylset TCP_5_20_M8_C25_US Direction {Unidirectional}
keylset TCP_5_20_M8_C25_US Source {Wifi5_20_8_25CLI}
keylset TCP_5_20_M8_C25_US Destination {Eth}
#TCP_5_20_M7_C25_DS
set TCP_5_20_M7_C25_DS ${tcp_goodput}
keylset TCP_5_20_M7_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M7_C25_DS Source {Eth}
keylset TCP_5_20_M7_C25_DS Destination {Wifi5_20_7_25CLI}
keylset TCP_5_20_M7_C25_DS TrialDuration 15
keylset TCP_5_20_M7_C25_DS TestDurationSec 15
#TCP_5_20_M7_C25_US
set TCP_5_20_M7_C25_US ${tcp_goodput}
keylset TCP_5_20_M7_C25_US Direction {Unidirectional}
keylset TCP_5_20_M7_C25_US Source {Wifi5_20_7_25CLI}
keylset TCP_5_20_M7_C25_US Destination {Eth}
keylset TCP_5_20_M7_C25_US TrialDuration 15
keylset TCP_5_20_M7_C25_US TestDurationSec 15
#TCP_5_20_M6_C25_DS
set TCP_5_20_M6_C25_DS ${tcp_goodput}
keylset TCP_5_20_M6_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M6_C25_DS Source {Eth}
keylset TCP_5_20_M6_C25_DS Destination {Wifi5_20_6_25CLI}
#TCP_5_20_M6_C25_US
set TCP_5_20_M6_C25_US ${tcp_goodput}
keylset TCP_5_20_M6_C25_US Direction {Unidirectional}
keylset TCP_5_20_M6_C25_US Source {Wifi5_20_6_25CLI}
keylset TCP_5_20_M6_C25_US Destination {Eth}
#TCP_5_20_M5_C25_DS
set TCP_5_20_M5_C25_DS ${tcp_goodput}
keylset TCP_5_20_M5_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M5_C25_DS Source {Eth}
keylset TCP_5_20_M5_C25_DS Destination {Wifi5_20_5_25CLI}
#TCP_5_20_M5_C25_US
set TCP_5_20_M5_C25_US ${tcp_goodput}
keylset TCP_5_20_M5_C25_US Direction {Unidirectional}
keylset TCP_5_20_M5_C25_US Source {Wifi5_20_5_25CLI}
keylset TCP_5_20_M5_C25_US Destination {Eth}
#TCP_5_20_M4_C25_DS
set TCP_5_20_M4_C25_DS ${tcp_goodput}
keylset TCP_5_20_M4_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M4_C25_DS Source {Eth}
keylset TCP_5_20_M4_C25_DS Destination {Wifi5_20_4_25CLI}
#TCP_5_20_M4_C25_US
set TCP_5_20_M4_C25_US ${tcp_goodput}
keylset TCP_5_20_M4_C25_US Direction {Unidirectional}
keylset TCP_5_20_M4_C25_US Source {Wifi5_20_4_25CLI}
keylset TCP_5_20_M4_C25_US Destination {Eth}
#TCP_5_20_M3_C25_DS
set TCP_5_20_M3_C25_DS ${tcp_goodput}
keylset TCP_5_20_M3_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M3_C25_DS Source {Eth}
keylset TCP_5_20_M3_C25_DS Destination {Wifi5_20_3_25CLI}
#TCP_5_20_M3_C25_US
set TCP_5_20_M3_C25_US ${tcp_goodput}
keylset TCP_5_20_M3_C25_US Direction {Unidirectional}
keylset TCP_5_20_M3_C25_US Source {Wifi5_20_3_25CLI}
keylset TCP_5_20_M3_C25_US Destination {Eth}
#TCP_5_20_M2_C25_DS
set TCP_5_20_M2_C25_DS ${tcp_goodput}
keylset TCP_5_20_M2_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M2_C25_DS Source {Eth}
keylset TCP_5_20_M2_C25_DS Destination {Wifi5_20_2_25CLI}
#TCP_5_20_M2_C25_US
set TCP_5_20_M2_C25_US ${tcp_goodput}
keylset TCP_5_20_M2_C25_US Direction {Unidirectional}
keylset TCP_5_20_M2_C25_US Source {Wifi5_20_2_25CLI}
keylset TCP_5_20_M2_C25_US Destination {Eth}
#TCP_5_20_M1_C25_DS
set TCP_5_20_M1_C25_DS ${tcp_goodput}
keylset TCP_5_20_M1_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M1_C25_DS Source {Eth}
keylset TCP_5_20_M1_C25_DS Destination {Wifi5_20_1_25CLI}
#TCP_5_20_M1_C25_US
set TCP_5_20_M1_C25_US ${tcp_goodput}
keylset TCP_5_20_M1_C25_US Direction {Unidirectional}
keylset TCP_5_20_M1_C25_US Source {Wifi5_20_1_25CLI}
keylset TCP_5_20_M1_C25_US Destination {Eth}
#TCP_5_20_M0_C25_DS
set TCP_5_20_M0_C25_DS ${tcp_goodput}
keylset TCP_5_20_M0_C25_DS Direction {Unidirectional}
keylset TCP_5_20_M0_C25_DS Source {Eth}
keylset TCP_5_20_M0_C25_DS Destination {Wifi5_20_0_25CLI}
#TCP_5_20_M0_C25_US
set TCP_5_20_M0_C25_US ${tcp_goodput}
keylset TCP_5_20_M0_C25_US Direction {Unidirectional}
keylset TCP_5_20_M0_C25_US Source {Wifi5_20_0_25CLI}
keylset TCP_5_20_M0_C25_US Destination {Eth}
#TCP_5_20_MA_C25_DS
set TCP_5_20_MA_C25_DS ${tcp_goodput}
keylset TCP_5_20_MA_C25_DS Direction {Unidirectional}
keylset TCP_5_20_MA_C25_DS Source {Eth}
keylset TCP_5_20_MA_C25_DS Destination {Wifi5_20_a_25CLI}
keylset TCP_5_20_MA_C25_DS TrialDuration 15
keylset TCP_5_20_MA_C25_DS TestDurationSec 15
#TCP_5_20_MA_C25_US
set TCP_5_20_MA_C25_US ${tcp_goodput}
keylset TCP_5_20_MA_C25_US Direction {Unidirectional}
keylset TCP_5_20_MA_C25_US Source {Wifi5_20_a_25CLI}
keylset TCP_5_20_MA_C25_US Destination {Eth}
keylset TCP_5_20_MA_C25_US TrialDuration 15
keylset TCP_5_20_MA_C25_US TestDurationSec 15


#TCP_5_40_M31_C1_DS
set TCP_5_40_M31_C1_DS ${tcp_goodput}
keylset TCP_5_40_M31_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M31_C1_DS Source {Eth}
keylset TCP_5_40_M31_C1_DS Destination {Wifi5_40_31_1CLI}
keylset TCP_5_40_M31_C1_DS TrialDuration 15
keylset TCP_5_40_M31_C1_DS TestDurationSec 15
#TCP_5_40_M31_C1_US
set TCP_5_40_M31_C1_US ${tcp_goodput}
keylset TCP_5_40_M31_C1_US Direction {Unidirectional}
keylset TCP_5_40_M31_C1_US Source {Wifi5_40_31_1CLI}
keylset TCP_5_40_M31_C1_US Destination {Eth}
keylset TCP_5_40_M31_C1_US TrialDuration 15
keylset TCP_5_40_M31_C1_US TestDurationSec 15
#TCP_5_40_M30_C1_DS
set TCP_5_40_M30_C1_DS ${tcp_goodput}
keylset TCP_5_40_M30_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M30_C1_DS Source {Eth}
keylset TCP_5_40_M30_C1_DS Destination {Wifi5_40_30_1CLI}
#TCP_5_40_M30_C1_US
set TCP_5_40_M30_C1_US ${tcp_goodput}
keylset TCP_5_40_M30_C1_US Direction {Unidirectional}
keylset TCP_5_40_M30_C1_US Source {Wifi5_40_30_1CLI}
keylset TCP_5_40_M30_C1_US Destination {Eth}
#TCP_5_40_M29_C1_DS
set TCP_5_40_M29_C1_DS ${tcp_goodput}
keylset TCP_5_40_M29_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M29_C1_DS Source {Eth}
keylset TCP_5_40_M29_C1_DS Destination {Wifi5_40_29_1CLI}
#TCP_5_40_M29_C1_US
set TCP_5_40_M29_C1_US ${tcp_goodput}
keylset TCP_5_40_M29_C1_US Direction {Unidirectional}
keylset TCP_5_40_M29_C1_US Source {Wifi5_40_29_1CLI}
keylset TCP_5_40_M29_C1_US Destination {Eth}
#TCP_5_40_M28_C1_DS
set TCP_5_40_M28_C1_DS ${tcp_goodput}
keylset TCP_5_40_M28_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M28_C1_DS Source {Eth}
keylset TCP_5_40_M28_C1_DS Destination {Wifi5_40_28_1CLI}
#TCP_5_40_M28_C1_US
set TCP_5_40_M28_C1_US ${tcp_goodput}
keylset TCP_5_40_M28_C1_US Direction {Unidirectional}
keylset TCP_5_40_M28_C1_US Source {Wifi5_40_28_1CLI}
keylset TCP_5_40_M28_C1_US Destination {Eth}
#TCP_5_40_M27_C1_DS
set TCP_5_40_M27_C1_DS ${tcp_goodput}
keylset TCP_5_40_M27_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M27_C1_DS Source {Eth}
keylset TCP_5_40_M27_C1_DS Destination {Wifi5_40_27_1CLI}
#TCP_5_40_M27_C1_US
set TCP_5_40_M27_C1_US ${tcp_goodput}
keylset TCP_5_40_M27_C1_US Direction {Unidirectional}
keylset TCP_5_40_M27_C1_US Source {Wifi5_40_27_1CLI}
keylset TCP_5_40_M27_C1_US Destination {Eth}
#TCP_5_40_M26_C1_DS
set TCP_5_40_M26_C1_DS ${tcp_goodput}
keylset TCP_5_40_M26_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M26_C1_DS Source {Eth}
keylset TCP_5_40_M26_C1_DS Destination {Wifi5_40_26_1CLI}
#TCP_5_40_M26_C1_US
set TCP_5_40_M26_C1_US ${tcp_goodput}
keylset TCP_5_40_M26_C1_US Direction {Unidirectional}
keylset TCP_5_40_M26_C1_US Source {Wifi5_40_26_1CLI}
keylset TCP_5_40_M26_C1_US Destination {Eth}
#TCP_5_40_M25_C1_DS
set TCP_5_40_M25_C1_DS ${tcp_goodput}
keylset TCP_5_40_M25_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M25_C1_DS Source {Eth}
keylset TCP_5_40_M25_C1_DS Destination {Wifi5_40_25_1CLI}
#TCP_5_40_M25_C1_US
set TCP_5_40_M25_C1_US ${tcp_goodput}
keylset TCP_5_40_M25_C1_US Direction {Unidirectional}
keylset TCP_5_40_M25_C1_US Source {Wifi5_40_25_1CLI}
keylset TCP_5_40_M25_C1_US Destination {Eth}
#TCP_5_40_M24_C1_DS
set TCP_5_40_M24_C1_DS ${tcp_goodput}
keylset TCP_5_40_M24_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M24_C1_DS Source {Eth}
keylset TCP_5_40_M24_C1_DS Destination {Wifi5_40_24_1CLI}
#TCP_5_40_M24_C1_US
set TCP_5_40_M24_C1_US ${tcp_goodput}
keylset TCP_5_40_M24_C1_US Direction {Unidirectional}
keylset TCP_5_40_M24_C1_US Source {Wifi5_40_24_1CLI}
keylset TCP_5_40_M24_C1_US Destination {Eth}
#TCP_5_40_M23_C1_DS
set TCP_5_40_M23_C1_DS ${tcp_goodput}
keylset TCP_5_40_M23_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M23_C1_DS Source {Eth}
keylset TCP_5_40_M23_C1_DS Destination {Wifi5_40_23_1CLI}
keylset TCP_5_40_M23_C1_DS TrialDuration 15
keylset TCP_5_40_M23_C1_DS TestDurationSec 15
#TCP_5_40_M23_C1_US
set TCP_5_40_M23_C1_US ${tcp_goodput}
keylset TCP_5_40_M23_C1_US Direction {Unidirectional}
keylset TCP_5_40_M23_C1_US Source {Wifi5_40_23_1CLI}
keylset TCP_5_40_M23_C1_US Destination {Eth}
keylset TCP_5_40_M23_C1_US TrialDuration 15
keylset TCP_5_40_M23_C1_US TestDurationSec 15
#TCP_5_40_M22_C1_DS
set TCP_5_40_M22_C1_DS ${tcp_goodput}
keylset TCP_5_40_M22_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M22_C1_DS Source {Eth}
keylset TCP_5_40_M22_C1_DS Destination {Wifi5_40_22_1CLI}
#TCP_5_40_M22_C1_US
set TCP_5_40_M22_C1_US ${tcp_goodput}
keylset TCP_5_40_M22_C1_US Direction {Unidirectional}
keylset TCP_5_40_M22_C1_US Source {Wifi5_40_22_1CLI}
keylset TCP_5_40_M22_C1_US Destination {Eth}
#TCP_5_40_M21_C1_DS
set TCP_5_40_M21_C1_DS ${tcp_goodput}
keylset TCP_5_40_M21_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M21_C1_DS Source {Eth}
keylset TCP_5_40_M21_C1_DS Destination {Wifi5_40_21_1CLI}
#TCP_5_40_M21_C1_US
set TCP_5_40_M21_C1_US ${tcp_goodput}
keylset TCP_5_40_M21_C1_US Direction {Unidirectional}
keylset TCP_5_40_M21_C1_US Source {Wifi5_40_21_1CLI}
keylset TCP_5_40_M21_C1_US Destination {Eth}
#TCP_5_40_M20_C1_DS
set TCP_5_40_M20_C1_DS ${tcp_goodput}
keylset TCP_5_40_M20_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M20_C1_DS Source {Eth}
keylset TCP_5_40_M20_C1_DS Destination {Wifi5_40_20_1CLI}
#TCP_5_40_M20_C1_US
set TCP_5_40_M20_C1_US ${tcp_goodput}
keylset TCP_5_40_M20_C1_US Direction {Unidirectional}
keylset TCP_5_40_M20_C1_US Source {Wifi5_40_20_1CLI}
keylset TCP_5_40_M20_C1_US Destination {Eth}
#TCP_5_40_M19_C1_DS
set TCP_5_40_M19_C1_DS ${tcp_goodput}
keylset TCP_5_40_M19_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M19_C1_DS Source {Eth}
keylset TCP_5_40_M19_C1_DS Destination {Wifi5_40_19_1CLI}
#TCP_5_40_M19_C1_US
set TCP_5_40_M19_C1_US ${tcp_goodput}
keylset TCP_5_40_M19_C1_US Direction {Unidirectional}
keylset TCP_5_40_M19_C1_US Source {Wifi5_40_19_1CLI}
keylset TCP_5_40_M19_C1_US Destination {Eth}
#TCP_5_40_M18_C1_DS
set TCP_5_40_M18_C1_DS ${tcp_goodput}
keylset TCP_5_40_M18_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M18_C1_DS Source {Eth}
keylset TCP_5_40_M18_C1_DS Destination {Wifi5_40_18_1CLI}
#TCP_5_40_M18_C1_US
set TCP_5_40_M18_C1_US ${tcp_goodput}
keylset TCP_5_40_M18_C1_US Direction {Unidirectional}
keylset TCP_5_40_M18_C1_US Source {Wifi5_40_18_1CLI}
keylset TCP_5_40_M18_C1_US Destination {Eth}
#TCP_5_40_M17_C1_DS
set TCP_5_40_M17_C1_DS ${tcp_goodput}
keylset TCP_5_40_M17_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M17_C1_DS Source {Eth}
keylset TCP_5_40_M17_C1_DS Destination {Wifi5_40_17_1CLI}
#TCP_5_40_M17_C1_US
set TCP_5_40_M17_C1_US ${tcp_goodput}
keylset TCP_5_40_M17_C1_US Direction {Unidirectional}
keylset TCP_5_40_M17_C1_US Source {Wifi5_40_17_1CLI}
keylset TCP_5_40_M17_C1_US Destination {Eth}
#TCP_5_40_M16_C1_DS
set TCP_5_40_M16_C1_DS ${tcp_goodput}
keylset TCP_5_40_M16_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M16_C1_DS Source {Eth}
keylset TCP_5_40_M16_C1_DS Destination {Wifi5_40_16_1CLI}
#TCP_5_40_M16_C1_US
set TCP_5_40_M16_C1_US ${tcp_goodput}
keylset TCP_5_40_M16_C1_US Direction {Unidirectional}
keylset TCP_5_40_M16_C1_US Source {Wifi5_40_16_1CLI}
keylset TCP_5_40_M16_C1_US Destination {Eth}
#TCP_5_40_M15_C1_DS
set TCP_5_40_M15_C1_DS ${tcp_goodput}
keylset TCP_5_40_M15_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M15_C1_DS Source {Eth}
keylset TCP_5_40_M15_C1_DS Destination {Wifi5_40_15_1CLI}
keylset TCP_5_40_M15_C1_DS TrialDuration 15
keylset TCP_5_40_M15_C1_DS TestDurationSec 15
#TCP_5_40_M15_C1_US
set TCP_5_40_M15_C1_US ${tcp_goodput}
keylset TCP_5_40_M15_C1_US Direction {Unidirectional}
keylset TCP_5_40_M15_C1_US Source {Wifi5_40_15_1CLI}
keylset TCP_5_40_M15_C1_US Destination {Eth}
keylset TCP_5_40_M15_C1_US TrialDuration 15
keylset TCP_5_40_M15_C1_US TestDurationSec 15
#TCP_5_40_M14_C1_DS
set TCP_5_40_M14_C1_DS ${tcp_goodput}
keylset TCP_5_40_M14_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M14_C1_DS Source {Eth}
keylset TCP_5_40_M14_C1_DS Destination {Wifi5_40_14_1CLI}
#TCP_5_40_M14_C1_US
set TCP_5_40_M14_C1_US ${tcp_goodput}
keylset TCP_5_40_M14_C1_US Direction {Unidirectional}
keylset TCP_5_40_M14_C1_US Source {Wifi5_40_14_1CLI}
keylset TCP_5_40_M14_C1_US Destination {Eth}
#TCP_5_40_M13_C1_DS
set TCP_5_40_M13_C1_DS ${tcp_goodput}
keylset TCP_5_40_M13_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M13_C1_DS Source {Eth}
keylset TCP_5_40_M13_C1_DS Destination {Wifi5_40_13_1CLI}
#TCP_5_40_M13_C1_US
set TCP_5_40_M13_C1_US ${tcp_goodput}
keylset TCP_5_40_M13_C1_US Direction {Unidirectional}
keylset TCP_5_40_M13_C1_US Source {Wifi5_40_13_1CLI}
keylset TCP_5_40_M13_C1_US Destination {Eth}
#TCP_5_40_M12_C1_DS
set TCP_5_40_M12_C1_DS ${tcp_goodput}
keylset TCP_5_40_M12_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M12_C1_DS Source {Eth}
keylset TCP_5_40_M12_C1_DS Destination {Wifi5_40_12_1CLI}
#TCP_5_40_M12_C1_US
set TCP_5_40_M12_C1_US ${tcp_goodput}
keylset TCP_5_40_M12_C1_US Direction {Unidirectional}
keylset TCP_5_40_M12_C1_US Source {Wifi5_40_12_1CLI}
keylset TCP_5_40_M12_C1_US Destination {Eth}
#TCP_5_40_M11_C1_DS
set TCP_5_40_M11_C1_DS ${tcp_goodput}
keylset TCP_5_40_M11_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M11_C1_DS Source {Eth}
keylset TCP_5_40_M11_C1_DS Destination {Wifi5_40_11_1CLI}
#TCP_5_40_M11_C1_US
set TCP_5_40_M11_C1_US ${tcp_goodput}
keylset TCP_5_40_M11_C1_US Direction {Unidirectional}
keylset TCP_5_40_M11_C1_US Source {Wifi5_40_11_1CLI}
keylset TCP_5_40_M11_C1_US Destination {Eth}
#TCP_5_40_M10_C1_DS
set TCP_5_40_M10_C1_DS ${tcp_goodput}
keylset TCP_5_40_M10_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M10_C1_DS Source {Eth}
keylset TCP_5_40_M10_C1_DS Destination {Wifi5_40_10_1CLI}
#TCP_5_40_M10_C1_US
set TCP_5_40_M10_C1_US ${tcp_goodput}
keylset TCP_5_40_M10_C1_US Direction {Unidirectional}
keylset TCP_5_40_M10_C1_US Source {Wifi5_40_10_1CLI}
keylset TCP_5_40_M10_C1_US Destination {Eth}
#TCP_5_40_M9_C1_DS
set TCP_5_40_M9_C1_DS ${tcp_goodput}
keylset TCP_5_40_M9_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M9_C1_DS Source {Eth}
keylset TCP_5_40_M9_C1_DS Destination {Wifi5_40_9_1CLI}
#TCP_5_40_M9_C1_US
set TCP_5_40_M9_C1_US ${tcp_goodput}
keylset TCP_5_40_M9_C1_US Direction {Unidirectional}
keylset TCP_5_40_M9_C1_US Source {Wifi5_40_9_1CLI}
keylset TCP_5_40_M9_C1_US Destination {Eth}
#TCP_5_40_M8_C1_DS
set TCP_5_40_M8_C1_DS ${tcp_goodput}
keylset TCP_5_40_M8_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M8_C1_DS Source {Eth}
keylset TCP_5_40_M8_C1_DS Destination {Wifi5_40_8_1CLI}
#TCP_5_40_M8_C1_US
set TCP_5_40_M8_C1_US ${tcp_goodput}
keylset TCP_5_40_M8_C1_US Direction {Unidirectional}
keylset TCP_5_40_M8_C1_US Source {Wifi5_40_8_1CLI}
keylset TCP_5_40_M8_C1_US Destination {Eth}
#TCP_5_40_M7_C1_DS
set TCP_5_40_M7_C1_DS ${tcp_goodput}
keylset TCP_5_40_M7_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M7_C1_DS Source {Eth}
keylset TCP_5_40_M7_C1_DS Destination {Wifi5_40_7_1CLI}
keylset TCP_5_40_M7_C1_DS TrialDuration 15
keylset TCP_5_40_M7_C1_DS TestDurationSec 15
#TCP_5_40_M7_C1_US
set TCP_5_40_M7_C1_US ${tcp_goodput}
keylset TCP_5_40_M7_C1_US Direction {Unidirectional}
keylset TCP_5_40_M7_C1_US Source {Wifi5_40_7_1CLI}
keylset TCP_5_40_M7_C1_US Destination {Eth}
keylset TCP_5_40_M7_C1_US TrialDuration 15
keylset TCP_5_40_M7_C1_US TestDurationSec 15
#TCP_5_40_M6_C1_DS
set TCP_5_40_M6_C1_DS ${tcp_goodput}
keylset TCP_5_40_M6_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M6_C1_DS Source {Eth}
keylset TCP_5_40_M6_C1_DS Destination {Wifi5_40_6_1CLI}
#TCP_5_40_M6_C1_US
set TCP_5_40_M6_C1_US ${tcp_goodput}
keylset TCP_5_40_M6_C1_US Direction {Unidirectional}
keylset TCP_5_40_M6_C1_US Source {Wifi5_40_6_1CLI}
keylset TCP_5_40_M6_C1_US Destination {Eth}
#TCP_5_40_M5_C1_DS
set TCP_5_40_M5_C1_DS ${tcp_goodput}
keylset TCP_5_40_M5_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M5_C1_DS Source {Eth}
keylset TCP_5_40_M5_C1_DS Destination {Wifi5_40_5_1CLI}
#TCP_5_40_M5_C1_US
set TCP_5_40_M5_C1_US ${tcp_goodput}
keylset TCP_5_40_M5_C1_US Direction {Unidirectional}
keylset TCP_5_40_M5_C1_US Source {Wifi5_40_5_1CLI}
keylset TCP_5_40_M5_C1_US Destination {Eth}
#TCP_5_40_M4_C1_DS
set TCP_5_40_M4_C1_DS ${tcp_goodput}
keylset TCP_5_40_M4_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M4_C1_DS Source {Eth}
keylset TCP_5_40_M4_C1_DS Destination {Wifi5_40_4_1CLI}
#TCP_5_40_M4_C1_US
set TCP_5_40_M4_C1_US ${tcp_goodput}
keylset TCP_5_40_M4_C1_US Direction {Unidirectional}
keylset TCP_5_40_M4_C1_US Source {Wifi5_40_4_1CLI}
keylset TCP_5_40_M4_C1_US Destination {Eth}
#TCP_5_40_M3_C1_DS
set TCP_5_40_M3_C1_DS ${tcp_goodput}
keylset TCP_5_40_M3_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M3_C1_DS Source {Eth}
keylset TCP_5_40_M3_C1_DS Destination {Wifi5_40_3_1CLI}
#TCP_5_40_M3_C1_US
set TCP_5_40_M3_C1_US ${tcp_goodput}
keylset TCP_5_40_M3_C1_US Direction {Unidirectional}
keylset TCP_5_40_M3_C1_US Source {Wifi5_40_3_1CLI}
keylset TCP_5_40_M3_C1_US Destination {Eth}
#TCP_5_40_M2_C1_DS
set TCP_5_40_M2_C1_DS ${tcp_goodput}
keylset TCP_5_40_M2_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M2_C1_DS Source {Eth}
keylset TCP_5_40_M2_C1_DS Destination {Wifi5_40_2_1CLI}
#TCP_5_40_M2_C1_US
set TCP_5_40_M2_C1_US ${tcp_goodput}
keylset TCP_5_40_M2_C1_US Direction {Unidirectional}
keylset TCP_5_40_M2_C1_US Source {Wifi5_40_2_1CLI}
keylset TCP_5_40_M2_C1_US Destination {Eth}
#TCP_5_40_M1_C1_DS
set TCP_5_40_M1_C1_DS ${tcp_goodput}
keylset TCP_5_40_M1_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M1_C1_DS Source {Eth}
keylset TCP_5_40_M1_C1_DS Destination {Wifi5_40_1_1CLI}
#TCP_5_40_M1_C1_US
set TCP_5_40_M1_C1_US ${tcp_goodput}
keylset TCP_5_40_M1_C1_US Direction {Unidirectional}
keylset TCP_5_40_M1_C1_US Source {Wifi5_40_1_1CLI}
keylset TCP_5_40_M1_C1_US Destination {Eth}
#TCP_5_40_M0_C1_DS
set TCP_5_40_M0_C1_DS ${tcp_goodput}
keylset TCP_5_40_M0_C1_DS Direction {Unidirectional}
keylset TCP_5_40_M0_C1_DS Source {Eth}
keylset TCP_5_40_M0_C1_DS Destination {Wifi5_40_0_1CLI}
#TCP_5_40_M0_C1_US
set TCP_5_40_M0_C1_US ${tcp_goodput}
keylset TCP_5_40_M0_C1_US Direction {Unidirectional}
keylset TCP_5_40_M0_C1_US Source {Wifi5_40_0_1CLI}
keylset TCP_5_40_M0_C1_US Destination {Eth}

#TCP_5_40_M31_C10_DS
set TCP_5_40_M31_C10_DS ${tcp_goodput}
keylset TCP_5_40_M31_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M31_C10_DS Source {Eth}
keylset TCP_5_40_M31_C10_DS Destination {Wifi5_40_31_10CLI}
keylset TCP_5_40_M31_C10_DS TrialDuration 15
keylset TCP_5_40_M31_C10_DS TestDurationSec 15
#TCP_5_40_M31_C10_US
set TCP_5_40_M31_C10_US ${tcp_goodput}
keylset TCP_5_40_M31_C10_US Direction {Unidirectional}
keylset TCP_5_40_M31_C10_US Source {Wifi5_40_31_10CLI}
keylset TCP_5_40_M31_C10_US Destination {Eth}
keylset TCP_5_40_M31_C10_US TrialDuration 15
keylset TCP_5_40_M31_C10_US TestDurationSec 15
#TCP_5_40_M30_C10_DS
set TCP_5_40_M30_C10_DS ${tcp_goodput}
keylset TCP_5_40_M30_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M30_C10_DS Source {Eth}
keylset TCP_5_40_M30_C10_DS Destination {Wifi5_40_30_10CLI}
#TCP_5_40_M30_C10_US
set TCP_5_40_M30_C10_US ${tcp_goodput}
keylset TCP_5_40_M30_C10_US Direction {Unidirectional}
keylset TCP_5_40_M30_C10_US Source {Wifi5_40_30_10CLI}
keylset TCP_5_40_M30_C10_US Destination {Eth}
#TCP_5_40_M29_C10_DS
set TCP_5_40_M29_C10_DS ${tcp_goodput}
keylset TCP_5_40_M29_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M29_C10_DS Source {Eth}
keylset TCP_5_40_M29_C10_DS Destination {Wifi5_40_29_10CLI}
#TCP_5_40_M29_C10_US
set TCP_5_40_M29_C10_US ${tcp_goodput}
keylset TCP_5_40_M29_C10_US Direction {Unidirectional}
keylset TCP_5_40_M29_C10_US Source {Wifi5_40_29_10CLI}
keylset TCP_5_40_M29_C10_US Destination {Eth}
#TCP_5_40_M28_C10_DS
set TCP_5_40_M28_C10_DS ${tcp_goodput}
keylset TCP_5_40_M28_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M28_C10_DS Source {Eth}
keylset TCP_5_40_M28_C10_DS Destination {Wifi5_40_28_10CLI}
#TCP_5_40_M28_C10_US
set TCP_5_40_M28_C10_US ${tcp_goodput}
keylset TCP_5_40_M28_C10_US Direction {Unidirectional}
keylset TCP_5_40_M28_C10_US Source {Wifi5_40_28_10CLI}
keylset TCP_5_40_M28_C10_US Destination {Eth}
#TCP_5_40_M27_C10_DS
set TCP_5_40_M27_C10_DS ${tcp_goodput}
keylset TCP_5_40_M27_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M27_C10_DS Source {Eth}
keylset TCP_5_40_M27_C10_DS Destination {Wifi5_40_27_10CLI}
#TCP_5_40_M27_C10_US
set TCP_5_40_M27_C10_US ${tcp_goodput}
keylset TCP_5_40_M27_C10_US Direction {Unidirectional}
keylset TCP_5_40_M27_C10_US Source {Wifi5_40_27_10CLI}
keylset TCP_5_40_M27_C10_US Destination {Eth}
#TCP_5_40_M26_C10_DS
set TCP_5_40_M26_C10_DS ${tcp_goodput}
keylset TCP_5_40_M26_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M26_C10_DS Source {Eth}
keylset TCP_5_40_M26_C10_DS Destination {Wifi5_40_26_10CLI}
#TCP_5_40_M26_C10_US
set TCP_5_40_M26_C10_US ${tcp_goodput}
keylset TCP_5_40_M26_C10_US Direction {Unidirectional}
keylset TCP_5_40_M26_C10_US Source {Wifi5_40_26_10CLI}
keylset TCP_5_40_M26_C10_US Destination {Eth}
#TCP_5_40_M25_C10_DS
set TCP_5_40_M25_C10_DS ${tcp_goodput}
keylset TCP_5_40_M25_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M25_C10_DS Source {Eth}
keylset TCP_5_40_M25_C10_DS Destination {Wifi5_40_25_10CLI}
#TCP_5_40_M25_C10_US
set TCP_5_40_M25_C10_US ${tcp_goodput}
keylset TCP_5_40_M25_C10_US Direction {Unidirectional}
keylset TCP_5_40_M25_C10_US Source {Wifi5_40_25_10CLI}
keylset TCP_5_40_M25_C10_US Destination {Eth}
#TCP_5_40_M24_C10_DS
set TCP_5_40_M24_C10_DS ${tcp_goodput}
keylset TCP_5_40_M24_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M24_C10_DS Source {Eth}
keylset TCP_5_40_M24_C10_DS Destination {Wifi5_40_10CLI}
#TCP_5_40_M24_C10_US
set TCP_5_40_M24_C10_US ${tcp_goodput}
keylset TCP_5_40_M24_C10_US Direction {Unidirectional}
keylset TCP_5_40_M24_C10_US Source {Wifi5_40_10CLI}
keylset TCP_5_40_M24_C10_US Destination {Eth}
#TCP_5_40_M23_C10_DS
set TCP_5_40_M23_C10_DS ${tcp_goodput}
keylset TCP_5_40_M23_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M23_C10_DS Source {Eth}
keylset TCP_5_40_M23_C10_DS Destination {Wifi5_40_23_10CLI}
keylset TCP_5_40_M23_C10_DS TrialDuration 15
keylset TCP_5_40_M23_C10_DS TestDurationSec 15
#TCP_5_40_M23_C10_US
set TCP_5_40_M23_C10_US ${tcp_goodput}
keylset TCP_5_40_M23_C10_US Direction {Unidirectional}
keylset TCP_5_40_M23_C10_US Source {Wifi5_40_23_10CLI}
keylset TCP_5_40_M23_C10_US Destination {Eth}
keylset TCP_5_40_M23_C10_US TrialDuration 15
keylset TCP_5_40_M23_C10_US TestDurationSec 15
#TCP_5_40_M22_C10_DS
set TCP_5_40_M22_C10_DS ${tcp_goodput}
keylset TCP_5_40_M22_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M22_C10_DS Source {Eth}
keylset TCP_5_40_M22_C10_DS Destination {Wifi5_40_22_10CLI}
#TCP_5_40_M22_C10_US
set TCP_5_40_M22_C10_US ${tcp_goodput}
keylset TCP_5_40_M22_C10_US Direction {Unidirectional}
keylset TCP_5_40_M22_C10_US Source {Wifi5_40_22_10CLI}
keylset TCP_5_40_M22_C10_US Destination {Eth}
#TCP_5_40_M21_C10_DS
set TCP_5_40_M21_C10_DS ${tcp_goodput}
keylset TCP_5_40_M21_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M21_C10_DS Source {Eth}
keylset TCP_5_40_M21_C10_DS Destination {Wifi5_40_21_10CLI}
#TCP_5_40_M21_C10_US
set TCP_5_40_M21_C10_US ${tcp_goodput}
keylset TCP_5_40_M21_C10_US Direction {Unidirectional}
keylset TCP_5_40_M21_C10_US Source {Wifi5_40_21_10CLI}
keylset TCP_5_40_M21_C10_US Destination {Eth}
#TCP_5_40_M20_C10_DS
set TCP_5_40_M20_C10_DS ${tcp_goodput}
keylset TCP_5_40_M20_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M20_C10_DS Source {Eth}
keylset TCP_5_40_M20_C10_DS Destination {Wifi5_40_20_10CLI}
#TCP_5_40_M20_C10_US
set TCP_5_40_M20_C10_US ${tcp_goodput}
keylset TCP_5_40_M20_C10_US Direction {Unidirectional}
keylset TCP_5_40_M20_C10_US Source {Wifi5_40_20_10CLI}
keylset TCP_5_40_M20_C10_US Destination {Eth}
#TCP_5_40_M19_C10_DS
set TCP_5_40_M19_C10_DS ${tcp_goodput}
keylset TCP_5_40_M19_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M19_C10_DS Source {Eth}
keylset TCP_5_40_M19_C10_DS Destination {Wifi5_40_19_10CLI}
#TCP_5_40_M19_C10_US
set TCP_5_40_M19_C10_US ${tcp_goodput}
keylset TCP_5_40_M19_C10_US Direction {Unidirectional}
keylset TCP_5_40_M19_C10_US Source {Wifi5_40_19_10CLI}
keylset TCP_5_40_M19_C10_US Destination {Eth}
#TCP_5_40_M18_C10_DS
set TCP_5_40_M18_C10_DS ${tcp_goodput}
keylset TCP_5_40_M18_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M18_C10_DS Source {Eth}
keylset TCP_5_40_M18_C10_DS Destination {Wifi5_40_18_10CLI}
#TCP_5_40_M18_C10_US
set TCP_5_40_M18_C10_US ${tcp_goodput}
keylset TCP_5_40_M18_C10_US Direction {Unidirectional}
keylset TCP_5_40_M18_C10_US Source {Wifi5_40_18_10CLI}
keylset TCP_5_40_M18_C10_US Destination {Eth}
#TCP_5_40_M17_C10_DS
set TCP_5_40_M17_C10_DS ${tcp_goodput}
keylset TCP_5_40_M17_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M17_C10_DS Source {Eth}
keylset TCP_5_40_M17_C10_DS Destination {Wifi5_40_17_10CLI}
#TCP_5_40_M17_C10_US
set TCP_5_40_M17_C10_US ${tcp_goodput}
keylset TCP_5_40_M17_C10_US Direction {Unidirectional}
keylset TCP_5_40_M17_C10_US Source {Wifi5_40_17_10CLI}
keylset TCP_5_40_M17_C10_US Destination {Eth}
#TCP_5_40_M16_C10_DS
set TCP_5_40_M16_C10_DS ${tcp_goodput}
keylset TCP_5_40_M16_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M16_C10_DS Source {Eth}
keylset TCP_5_40_M16_C10_DS Destination {Wifi5_40_16_10CLI}
#TCP_5_40_M16_C10_US
set TCP_5_40_M16_C10_US ${tcp_goodput}
keylset TCP_5_40_M16_C10_US Direction {Unidirectional}
keylset TCP_5_40_M16_C10_US Source {Wifi5_40_16_10CLI}
keylset TCP_5_40_M16_C10_US Destination {Eth}
#TCP_5_40_M15_C10_DS
set TCP_5_40_M15_C10_DS ${tcp_goodput}
keylset TCP_5_40_M15_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M15_C10_DS Source {Eth}
keylset TCP_5_40_M15_C10_DS Destination {Wifi5_40_15_10CLI}
keylset TCP_5_40_M15_C10_DS TrialDuration 15
keylset TCP_5_40_M15_C10_DS TestDurationSec 15
#TCP_5_40_M15_C10_US
set TCP_5_40_M15_C10_US ${tcp_goodput}
keylset TCP_5_40_M15_C10_US Direction {Unidirectional}
keylset TCP_5_40_M15_C10_US Source {Wifi5_40_15_10CLI}
keylset TCP_5_40_M15_C10_US Destination {Eth}
keylset TCP_5_40_M15_C10_US TrialDuration 15
keylset TCP_5_40_M15_C10_US TestDurationSec 15
#TCP_5_40_M14_C10_DS
set TCP_5_40_M14_C10_DS ${tcp_goodput}
keylset TCP_5_40_M14_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M14_C10_DS Source {Eth}
keylset TCP_5_40_M14_C10_DS Destination {Wifi5_40_14_10CLI}
#TCP_5_40_M14_C10_US
set TCP_5_40_M14_C10_US ${tcp_goodput}
keylset TCP_5_40_M14_C10_US Direction {Unidirectional}
keylset TCP_5_40_M14_C10_US Source {Wifi5_40_14_10CLI}
keylset TCP_5_40_M14_C10_US Destination {Eth}
#TCP_5_40_M13_C10_DS
set TCP_5_40_M13_C10_DS ${tcp_goodput}
keylset TCP_5_40_M13_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M13_C10_DS Source {Eth}
keylset TCP_5_40_M13_C10_DS Destination {Wifi5_40_13_10CLI}
#TCP_5_40_M13_C10_US
set TCP_5_40_M13_C10_US ${tcp_goodput}
keylset TCP_5_40_M13_C10_US Direction {Unidirectional}
keylset TCP_5_40_M13_C10_US Source {Wifi5_40_13_10CLI}
keylset TCP_5_40_M13_C10_US Destination {Eth}
#TCP_5_40_M12_C10_DS
set TCP_5_40_M12_C10_DS ${tcp_goodput}
keylset TCP_5_40_M12_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M12_C10_DS Source {Eth}
keylset TCP_5_40_M12_C10_DS Destination {Wifi5_40_12_10CLI}
#TCP_5_40_M12_C10_US
set TCP_5_40_M12_C10_US ${tcp_goodput}
keylset TCP_5_40_M12_C10_US Direction {Unidirectional}
keylset TCP_5_40_M12_C10_US Source {Wifi5_40_12_10CLI}
keylset TCP_5_40_M12_C10_US Destination {Eth}
#TCP_5_40_M11_C10_DS
set TCP_5_40_M11_C10_DS ${tcp_goodput}
keylset TCP_5_40_M11_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M11_C10_DS Source {Eth}
keylset TCP_5_40_M11_C10_DS Destination {Wifi5_40_11_10CLI}
#TCP_5_40_M11_C10_US
set TCP_5_40_M11_C10_US ${tcp_goodput}
keylset TCP_5_40_M11_C10_US Direction {Unidirectional}
keylset TCP_5_40_M11_C10_US Source {Wifi5_40_11_10CLI}
keylset TCP_5_40_M11_C10_US Destination {Eth}
#TCP_5_40_M10_C10_DS
set TCP_5_40_M10_C10_DS ${tcp_goodput}
keylset TCP_5_40_M10_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M10_C10_DS Source {Eth}
keylset TCP_5_40_M10_C10_DS Destination {Wifi5_40_10_10CLI}
#TCP_5_40_M10_C10_US
set TCP_5_40_M10_C10_US ${tcp_goodput}
keylset TCP_5_40_M10_C10_US Direction {Unidirectional}
keylset TCP_5_40_M10_C10_US Source {Wifi5_40_10_10CLI}
keylset TCP_5_40_M10_C10_US Destination {Eth}
#TCP_5_40_M9_C10_DS
set TCP_5_40_M9_C10_DS ${tcp_goodput}
keylset TCP_5_40_M9_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M9_C10_DS Source {Eth}
keylset TCP_5_40_M9_C10_DS Destination {Wifi5_40_9_10CLI}
#TCP_5_40_M9_C10_US
set TCP_5_40_M9_C10_US ${tcp_goodput}
keylset TCP_5_40_M9_C10_US Direction {Unidirectional}
keylset TCP_5_40_M9_C10_US Source {Wifi5_40_9_10CLI}
keylset TCP_5_40_M9_C10_US Destination {Eth}
#TCP_5_40_M8_C10_DS
set TCP_5_40_M8_C10_DS ${tcp_goodput}
keylset TCP_5_40_M8_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M8_C10_DS Source {Eth}
keylset TCP_5_40_M8_C10_DS Destination {Wifi5_40_8_10CLI}
#TCP_5_40_M8_C10_US
set TCP_5_40_M8_C10_US ${tcp_goodput}
keylset TCP_5_40_M8_C10_US Direction {Unidirectional}
keylset TCP_5_40_M8_C10_US Source {Wifi5_40_8_10CLI}
keylset TCP_5_40_M8_C10_US Destination {Eth}
#TCP_5_40_M7_C10_DS
set TCP_5_40_M7_C10_DS ${tcp_goodput}
keylset TCP_5_40_M7_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M7_C10_DS Source {Eth}
keylset TCP_5_40_M7_C10_DS Destination {Wifi5_40_7_10CLI}
keylset TCP_5_40_M7_C10_DS TrialDuration 15
keylset TCP_5_40_M7_C10_DS TestDurationSec 15
#TCP_5_40_M7_C10_US
set TCP_5_40_M7_C10_US ${tcp_goodput}
keylset TCP_5_40_M7_C10_US Direction {Unidirectional}
keylset TCP_5_40_M7_C10_US Source {Wifi5_40_7_10CLI}
keylset TCP_5_40_M7_C10_US Destination {Eth}
keylset TCP_5_40_M7_C10_US TrialDuration 15
keylset TCP_5_40_M7_C10_US TestDurationSec 15
#TCP_5_40_M6_C10_DS
set TCP_5_40_M6_C10_DS ${tcp_goodput}
keylset TCP_5_40_M6_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M6_C10_DS Source {Eth}
keylset TCP_5_40_M6_C10_DS Destination {Wifi5_40_6_10CLI}
#TCP_5_40_M6_C10_US
set TCP_5_40_M6_C10_US ${tcp_goodput}
keylset TCP_5_40_M6_C10_US Direction {Unidirectional}
keylset TCP_5_40_M6_C10_US Source {Wifi5_40_6_10CLI}
keylset TCP_5_40_M6_C10_US Destination {Eth}
#TCP_5_40_M5_C10_DS
set TCP_5_40_M5_C10_DS ${tcp_goodput}
keylset TCP_5_40_M5_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M5_C10_DS Source {Eth}
keylset TCP_5_40_M5_C10_DS Destination {Wifi5_40_5_10CLI}
#TCP_5_40_M5_C10_US
set TCP_5_40_M5_C10_US ${tcp_goodput}
keylset TCP_5_40_M5_C10_US Direction {Unidirectional}
keylset TCP_5_40_M5_C10_US Source {Wifi5_40_5_10CLI}
keylset TCP_5_40_M5_C10_US Destination {Eth}
#TCP_5_40_M4_C10_DS
set TCP_5_40_M4_C10_DS ${tcp_goodput}
keylset TCP_5_40_M4_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M4_C10_DS Source {Eth}
keylset TCP_5_40_M4_C10_DS Destination {Wifi5_40_4_10CLI}
#TCP_5_40_M4_C10_US
set TCP_5_40_M4_C10_US ${tcp_goodput}
keylset TCP_5_40_M4_C10_US Direction {Unidirectional}
keylset TCP_5_40_M4_C10_US Source {Wifi5_40_4_10CLI}
keylset TCP_5_40_M4_C10_US Destination {Eth}
#TCP_5_40_M3_C10_DS
set TCP_5_40_M3_C10_DS ${tcp_goodput}
keylset TCP_5_40_M3_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M3_C10_DS Source {Eth}
keylset TCP_5_40_M3_C10_DS Destination {Wifi5_40_3_10CLI}
#TCP_5_40_M3_C10_US
set TCP_5_40_M3_C10_US ${tcp_goodput}
keylset TCP_5_40_M3_C10_US Direction {Unidirectional}
keylset TCP_5_40_M3_C10_US Source {Wifi5_40_3_10CLI}
keylset TCP_5_40_M3_C10_US Destination {Eth}
#TCP_5_40_M2_C10_DS
set TCP_5_40_M2_C10_DS ${tcp_goodput}
keylset TCP_5_40_M2_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M2_C10_DS Source {Eth}
keylset TCP_5_40_M2_C10_DS Destination {Wifi5_40_2_10CLI}
#TCP_5_40_M2_C10_US
set TCP_5_40_M2_C10_US ${tcp_goodput}
keylset TCP_5_40_M2_C10_US Direction {Unidirectional}
keylset TCP_5_40_M2_C10_US Source {Wifi5_40_2_10CLI}
keylset TCP_5_40_M2_C10_US Destination {Eth}
#TCP_5_40_M1_C10_DS
set TCP_5_40_M1_C10_DS ${tcp_goodput}
keylset TCP_5_40_M1_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M1_C10_DS Source {Eth}
keylset TCP_5_40_M1_C10_DS Destination {Wifi5_40_1_10CLI}
#TCP_5_40_M1_C10_US
set TCP_5_40_M1_C10_US ${tcp_goodput}
keylset TCP_5_40_M1_C10_US Direction {Unidirectional}
keylset TCP_5_40_M1_C10_US Source {Wifi5_40_1_10CLI}
keylset TCP_5_40_M1_C10_US Destination {Eth}
#TCP_5_40_M0_C10_DS
set TCP_5_40_M0_C10_DS ${tcp_goodput}
keylset TCP_5_40_M0_C10_DS Direction {Unidirectional}
keylset TCP_5_40_M0_C10_DS Source {Eth}
keylset TCP_5_40_M0_C10_DS Destination {Wifi5_40_0_10CLI}
#TCP_5_40_M0_C10_US
set TCP_5_40_M0_C10_US ${tcp_goodput}
keylset TCP_5_40_M0_C10_US Direction {Unidirectional}
keylset TCP_5_40_M0_C10_US Source {Wifi5_40_0_10CLI}
keylset TCP_5_40_M0_C10_US Destination {Eth}

#TCP_5_40_M31_C25_DS
set TCP_5_40_M31_C25_DS ${tcp_goodput}
keylset TCP_5_40_M31_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M31_C25_DS Source {Eth}
keylset TCP_5_40_M31_C25_DS Destination {Wifi5_40_31_25CLI}
keylset TCP_5_40_M31_C25_DS TrialDuration 15
keylset TCP_5_40_M31_C25_DS TestDurationSec 15
#TCP_5_40_M31_C25_US
set TCP_5_40_M31_C25_US ${tcp_goodput}
keylset TCP_5_40_M31_C25_US Direction {Unidirectional}
keylset TCP_5_40_M31_C25_US Source {Wifi5_40_31_25CLI}
keylset TCP_5_40_M31_C25_US Destination {Eth}
keylset TCP_5_40_M31_C25_US TrialDuration 15
keylset TCP_5_40_M31_C25_US TestDurationSec 15
#TCP_5_40_M30_C25_DS
set TCP_5_40_M30_C25_DS ${tcp_goodput}
keylset TCP_5_40_M30_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M30_C25_DS Source {Eth}
keylset TCP_5_40_M30_C25_DS Destination {Wifi5_40_30_25CLI}
#TCP_5_40_M30_C25_US
set TCP_5_40_M30_C25_US ${tcp_goodput}
keylset TCP_5_40_M30_C25_US Direction {Unidirectional}
keylset TCP_5_40_M30_C25_US Source {Wifi5_40_30_25CLI}
keylset TCP_5_40_M30_C25_US Destination {Eth}
#TCP_5_40_M29_C25_DS
set TCP_5_40_M29_C25_DS ${tcp_goodput}
keylset TCP_5_40_M29_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M29_C25_DS Source {Eth}
keylset TCP_5_40_M29_C25_DS Destination {Wifi5_40_29_25CLI}
#TCP_5_40_M29_C25_US
set TCP_5_40_M29_C25_US ${tcp_goodput}
keylset TCP_5_40_M29_C25_US Direction {Unidirectional}
keylset TCP_5_40_M29_C25_US Source {Wifi5_40_29_25CLI}
keylset TCP_5_40_M29_C25_US Destination {Eth}
#TCP_5_40_M28_C25_DS
set TCP_5_40_M28_C25_DS ${tcp_goodput}
keylset TCP_5_40_M28_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M28_C25_DS Source {Eth}
keylset TCP_5_40_M28_C25_DS Destination {Wifi5_40_28_25CLI}
#TCP_5_40_M28_C25_US
set TCP_5_40_M28_C25_US ${tcp_goodput}
keylset TCP_5_40_M28_C25_US Direction {Unidirectional}
keylset TCP_5_40_M28_C25_US Source {Wifi5_40_28_25CLI}
keylset TCP_5_40_M28_C25_US Destination {Eth}
#TCP_5_40_M27_C25_DS
set TCP_5_40_M27_C25_DS ${tcp_goodput}
keylset TCP_5_40_M27_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M27_C25_DS Source {Eth}
keylset TCP_5_40_M27_C25_DS Destination {Wifi5_40_27_25CLI}
#TCP_5_40_M27_C25_US
set TCP_5_40_M27_C25_US ${tcp_goodput}
keylset TCP_5_40_M27_C25_US Direction {Unidirectional}
keylset TCP_5_40_M27_C25_US Source {Wifi5_40_27_25CLI}
keylset TCP_5_40_M27_C25_US Destination {Eth}
#TCP_5_40_M26_C25_DS
set TCP_5_40_M26_C25_DS ${tcp_goodput}
keylset TCP_5_40_M26_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M26_C25_DS Source {Eth}
keylset TCP_5_40_M26_C25_DS Destination {Wifi5_40_26_25CLI}
#TCP_5_40_M26_C25_US
set TCP_5_40_M26_C25_US ${tcp_goodput}
keylset TCP_5_40_M26_C25_US Direction {Unidirectional}
keylset TCP_5_40_M26_C25_US Source {Wifi5_40_26_25CLI}
keylset TCP_5_40_M26_C25_US Destination {Eth}
#TCP_5_40_M25_C25_DS
set TCP_5_40_M25_C25_DS ${tcp_goodput}
keylset TCP_5_40_M25_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M25_C25_DS Source {Eth}
keylset TCP_5_40_M25_C25_DS Destination {Wifi5_40_25_25CLI}
#TCP_5_40_M25_C25_US
set TCP_5_40_M25_C25_US ${tcp_goodput}
keylset TCP_5_40_M25_C25_US Direction {Unidirectional}
keylset TCP_5_40_M25_C25_US Source {Wifi5_40_25_25CLI}
keylset TCP_5_40_M25_C25_US Destination {Eth}
#TCP_5_40_M24_C25_DS
set TCP_5_40_M24_C25_DS ${tcp_goodput}
keylset TCP_5_40_M24_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M24_C25_DS Source {Eth}
keylset TCP_5_40_M24_C25_DS Destination {Wifi5_40_24_25CLI}
#TCP_5_40_M24_C25_US
set TCP_5_40_M24_C25_US ${tcp_goodput}
keylset TCP_5_40_M24_C25_US Direction {Unidirectional}
keylset TCP_5_40_M24_C25_US Source {Wifi5_40_24_25CLI}
keylset TCP_5_40_M24_C25_US Destination {Eth}
#TCP_5_40_M23_C25_DS
set TCP_5_40_M23_C25_DS ${tcp_goodput}
keylset TCP_5_40_M23_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M23_C25_DS Source {Eth}
keylset TCP_5_40_M23_C25_DS Destination {Wifi5_40_23_25CLI}
keylset TCP_5_40_M23_C25_DS TrialDuration 15
keylset TCP_5_40_M23_C25_DS TestDurationSec 15
#TCP_5_40_M23_C25_US
set TCP_5_40_M23_C25_US ${tcp_goodput}
keylset TCP_5_40_M23_C25_US Direction {Unidirectional}
keylset TCP_5_40_M23_C25_US Source {Wifi5_40_23_25CLI}
keylset TCP_5_40_M23_C25_US Destination {Eth}
keylset TCP_5_40_M23_C25_US TrialDuration 15
keylset TCP_5_40_M23_C25_US TestDurationSec 15
#TCP_5_40_M22_C25_DS
set TCP_5_40_M22_C25_DS ${tcp_goodput}
keylset TCP_5_40_M22_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M22_C25_DS Source {Eth}
keylset TCP_5_40_M22_C25_DS Destination {Wifi5_40_22_25CLI}
#TCP_5_40_M22_C25_US
set TCP_5_40_M22_C25_US ${tcp_goodput}
keylset TCP_5_40_M22_C25_US Direction {Unidirectional}
keylset TCP_5_40_M22_C25_US Source {Wifi5_40_22_25CLI}
keylset TCP_5_40_M22_C25_US Destination {Eth}
#TCP_5_40_M21_C25_DS
set TCP_5_40_M21_C25_DS ${tcp_goodput}
keylset TCP_5_40_M21_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M21_C25_DS Source {Eth}
keylset TCP_5_40_M21_C25_DS Destination {Wifi5_40_21_25CLI}
#TCP_5_40_M21_C25_US
set TCP_5_40_M21_C25_US ${tcp_goodput}
keylset TCP_5_40_M21_C25_US Direction {Unidirectional}
keylset TCP_5_40_M21_C25_US Source {Wifi5_40_21_25CLI}
keylset TCP_5_40_M21_C25_US Destination {Eth}
#TCP_5_40_M20_C25_DS
set TCP_5_40_M20_C25_DS ${tcp_goodput}
keylset TCP_5_40_M20_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M20_C25_DS Source {Eth}
keylset TCP_5_40_M20_C25_DS Destination {Wifi5_40_20_25CLI}
#TCP_5_40_M20_C25_US
set TCP_5_40_M20_C25_US ${tcp_goodput}
keylset TCP_5_40_M20_C25_US Direction {Unidirectional}
keylset TCP_5_40_M20_C25_US Source {Wifi5_40_20_25CLI}
keylset TCP_5_40_M20_C25_US Destination {Eth}
#TCP_5_40_M19_C25_DS
set TCP_5_40_M19_C25_DS ${tcp_goodput}
keylset TCP_5_40_M19_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M19_C25_DS Source {Eth}
keylset TCP_5_40_M19_C25_DS Destination {Wifi5_40_19_25CLI}
#TCP_5_40_M19_C25_US
set TCP_5_40_M19_C25_US ${tcp_goodput}
keylset TCP_5_40_M19_C25_US Direction {Unidirectional}
keylset TCP_5_40_M19_C25_US Source {Wifi5_40_19_25CLI}
keylset TCP_5_40_M19_C25_US Destination {Eth}
#TCP_5_40_M18_C25_DS
set TCP_5_40_M18_C25_DS ${tcp_goodput}
keylset TCP_5_40_M18_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M18_C25_DS Source {Eth}
keylset TCP_5_40_M18_C25_DS Destination {Wifi5_40_18_25CLI}
#TCP_5_40_M18_C25_US
set TCP_5_40_M18_C25_US ${tcp_goodput}
keylset TCP_5_40_M18_C25_US Direction {Unidirectional}
keylset TCP_5_40_M18_C25_US Source {Wifi5_40_18_25CLI}
keylset TCP_5_40_M18_C25_US Destination {Eth}
#TCP_5_40_M17_C25_DS
set TCP_5_40_M17_C25_DS ${tcp_goodput}
keylset TCP_5_40_M17_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M17_C25_DS Source {Eth}
keylset TCP_5_40_M17_C25_DS Destination {Wifi5_40_17_25CLI}
#TCP_5_40_M17_C25_US
set TCP_5_40_M17_C25_US ${tcp_goodput}
keylset TCP_5_40_M17_C25_US Direction {Unidirectional}
keylset TCP_5_40_M17_C25_US Source {Wifi5_40_17_25CLI}
keylset TCP_5_40_M17_C25_US Destination {Eth}
#TCP_5_40_M16_C25_DS
set TCP_5_40_M16_C25_DS ${tcp_goodput}
keylset TCP_5_40_M16_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M16_C25_DS Source {Eth}
keylset TCP_5_40_M16_C25_DS Destination {Wifi5_40_16_25CLI}
#TCP_5_40_M16_C25_US
set TCP_5_40_M16_C25_US ${tcp_goodput}
keylset TCP_5_40_M16_C25_US Direction {Unidirectional}
keylset TCP_5_40_M16_C25_US Source {Wifi5_40_16_25CLI}
keylset TCP_5_40_M16_C25_US Destination {Eth}
#TCP_5_40_M15_C25_DS
set TCP_5_40_M15_C25_DS ${tcp_goodput}
keylset TCP_5_40_M15_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M15_C25_DS Source {Eth}
keylset TCP_5_40_M15_C25_DS Destination {Wifi5_40_15_25CLI}
keylset TCP_5_40_M15_C25_DS TrialDuration 15
keylset TCP_5_40_M15_C25_DS TestDurationSec 15
#TCP_5_40_M15_C25_US
set TCP_5_40_M15_C25_US ${tcp_goodput}
keylset TCP_5_40_M15_C25_US Direction {Unidirectional}
keylset TCP_5_40_M15_C25_US Source {Wifi5_40_15_25CLI}
keylset TCP_5_40_M15_C25_US Destination {Eth}
keylset TCP_5_40_M15_C25_US TrialDuration 15
keylset TCP_5_40_M15_C25_US TestDurationSec 15
#TCP_5_40_M14_C25_DS
set TCP_5_40_M14_C25_DS ${tcp_goodput}
keylset TCP_5_40_M14_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M14_C25_DS Source {Eth}
keylset TCP_5_40_M14_C25_DS Destination {Wifi5_40_14_25CLI}
#TCP_5_40_M14_C25_US
set TCP_5_40_M14_C25_US ${tcp_goodput}
keylset TCP_5_40_M14_C25_US Direction {Unidirectional}
keylset TCP_5_40_M14_C25_US Source {Wifi5_40_14_25CLI}
keylset TCP_5_40_M14_C25_US Destination {Eth}
#TCP_5_40_M13_C25_DS
set TCP_5_40_M13_C25_DS ${tcp_goodput}
keylset TCP_5_40_M13_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M13_C25_DS Source {Eth}
keylset TCP_5_40_M13_C25_DS Destination {Wifi5_40_13_25CLI}
#TCP_5_40_M13_C25_US
set TCP_5_40_M13_C25_US ${tcp_goodput}
keylset TCP_5_40_M13_C25_US Direction {Unidirectional}
keylset TCP_5_40_M13_C25_US Source {Wifi5_40_13_25CLI}
keylset TCP_5_40_M13_C25_US Destination {Eth}
#TCP_5_40_M12_C25_DS
set TCP_5_40_M12_C25_DS ${tcp_goodput}
keylset TCP_5_40_M12_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M12_C25_DS Source {Eth}
keylset TCP_5_40_M12_C25_DS Destination {Wifi5_40_12_25CLI}
#TCP_5_40_M12_C25_US
set TCP_5_40_M12_C25_US ${tcp_goodput}
keylset TCP_5_40_M12_C25_US Direction {Unidirectional}
keylset TCP_5_40_M12_C25_US Source {Wifi5_40_12_25CLI}
keylset TCP_5_40_M12_C25_US Destination {Eth}
#TCP_5_40_M11_C25_DS
set TCP_5_40_M11_C25_DS ${tcp_goodput}
keylset TCP_5_40_M11_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M11_C25_DS Source {Eth}
keylset TCP_5_40_M11_C25_DS Destination {Wifi5_40_11_25CLI}
#TCP_5_40_M11_C25_US
set TCP_5_40_M11_C25_US ${tcp_goodput}
keylset TCP_5_40_M11_C25_US Direction {Unidirectional}
keylset TCP_5_40_M11_C25_US Source {Wifi5_40_11_25CLI}
keylset TCP_5_40_M11_C25_US Destination {Eth}
#TCP_5_40_M10_C25_DS
set TCP_5_40_M10_C25_DS ${tcp_goodput}
keylset TCP_5_40_M10_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M10_C25_DS Source {Eth}
keylset TCP_5_40_M10_C25_DS Destination {Wifi5_40_10_25CLI}
#TCP_5_40_M10_C25_US
set TCP_5_40_M10_C25_US ${tcp_goodput}
keylset TCP_5_40_M10_C25_US Direction {Unidirectional}
keylset TCP_5_40_M10_C25_US Source {Wifi5_40_10_25CLI}
keylset TCP_5_40_M10_C25_US Destination {Eth}
#TCP_5_40_M9_C25_DS
set TCP_5_40_M9_C25_DS ${tcp_goodput}
keylset TCP_5_40_M9_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M9_C25_DS Source {Eth}
keylset TCP_5_40_M9_C25_DS Destination {Wifi5_40_9_25CLI}
#TCP_5_40_M9_C25_US
set TCP_5_40_M9_C25_US ${tcp_goodput}
keylset TCP_5_40_M9_C25_US Direction {Unidirectional}
keylset TCP_5_40_M9_C25_US Source {Wifi5_40_9_25CLI}
keylset TCP_5_40_M9_C25_US Destination {Eth}
#TCP_5_40_M8_C25_DS
set TCP_5_40_M8_C25_DS ${tcp_goodput}
keylset TCP_5_40_M8_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M8_C25_DS Source {Eth}
keylset TCP_5_40_M8_C25_DS Destination {Wifi5_40_8_25CLI}
#TCP_5_40_M8_C25_US
set TCP_5_40_M8_C25_US ${tcp_goodput}
keylset TCP_5_40_M8_C25_US Direction {Unidirectional}
keylset TCP_5_40_M8_C25_US Source {Wifi5_40_8_25CLI}
keylset TCP_5_40_M8_C25_US Destination {Eth}
#TCP_5_40_M7_C25_DS
set TCP_5_40_M7_C25_DS ${tcp_goodput}
keylset TCP_5_40_M7_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M7_C25_DS Source {Eth}
keylset TCP_5_40_M7_C25_DS Destination {Wifi5_40_7_25CLI}
keylset TCP_5_40_M7_C25_DS TrialDuration 15
keylset TCP_5_40_M7_C25_DS TestDurationSec 15
#TCP_5_40_M7_C25_US
set TCP_5_40_M7_C25_US ${tcp_goodput}
keylset TCP_5_40_M7_C25_US Direction {Unidirectional}
keylset TCP_5_40_M7_C25_US Source {Wifi5_40_7_25CLI}
keylset TCP_5_40_M7_C25_US Destination {Eth}
keylset TCP_5_40_M7_C25_US TrialDuration 15
keylset TCP_5_40_M7_C25_US TestDurationSec 15
#TCP_5_40_M6_C25_DS
set TCP_5_40_M6_C25_DS ${tcp_goodput}
keylset TCP_5_40_M6_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M6_C25_DS Source {Eth}
keylset TCP_5_40_M6_C25_DS Destination {Wifi5_40_6_25CLI}
#TCP_5_40_M6_C25_US
set TCP_5_40_M6_C25_US ${tcp_goodput}
keylset TCP_5_40_M6_C25_US Direction {Unidirectional}
keylset TCP_5_40_M6_C25_US Source {Wifi5_40_6_25CLI}
keylset TCP_5_40_M6_C25_US Destination {Eth}
#TCP_5_40_M5_C25_DS
set TCP_5_40_M5_C25_DS ${tcp_goodput}
keylset TCP_5_40_M5_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M5_C25_DS Source {Eth}
keylset TCP_5_40_M5_C25_DS Destination {Wifi5_40_5_25CLI}
#TCP_5_40_M5_C25_US
set TCP_5_40_M5_C25_US ${tcp_goodput}
keylset TCP_5_40_M5_C25_US Direction {Unidirectional}
keylset TCP_5_40_M5_C25_US Source {Wifi5_40_5_25CLI}
keylset TCP_5_40_M5_C25_US Destination {Eth}
#TCP_5_40_M4_C25_DS
set TCP_5_40_M4_C25_DS ${tcp_goodput}
keylset TCP_5_40_M4_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M4_C25_DS Source {Eth}
keylset TCP_5_40_M4_C25_DS Destination {Wifi5_40_4_25CLI}
#TCP_5_40_M4_C25_US
set TCP_5_40_M4_C25_US ${tcp_goodput}
keylset TCP_5_40_M4_C25_US Direction {Unidirectional}
keylset TCP_5_40_M4_C25_US Source {Wifi5_40_4_25CLI}
keylset TCP_5_40_M4_C25_US Destination {Eth}
#TCP_5_40_M3_C25_DS
set TCP_5_40_M3_C25_DS ${tcp_goodput}
keylset TCP_5_40_M3_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M3_C25_DS Source {Eth}
keylset TCP_5_40_M3_C25_DS Destination {Wifi5_40_3_25CLI}
#TCP_5_40_M3_C25_US
set TCP_5_40_M3_C25_US ${tcp_goodput}
keylset TCP_5_40_M3_C25_US Direction {Unidirectional}
keylset TCP_5_40_M3_C25_US Source {Wifi5_40_3_25CLI}
keylset TCP_5_40_M3_C25_US Destination {Eth}
#TCP_5_40_M2_C25_DS
set TCP_5_40_M2_C25_DS ${tcp_goodput}
keylset TCP_5_40_M2_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M2_C25_DS Source {Eth}
keylset TCP_5_40_M2_C25_DS Destination {Wifi5_40_2_25CLI}
#TCP_5_40_M2_C25_US
set TCP_5_40_M2_C25_US ${tcp_goodput}
keylset TCP_5_40_M2_C25_US Direction {Unidirectional}
keylset TCP_5_40_M2_C25_US Source {Wifi5_40_2_25CLI}
keylset TCP_5_40_M2_C25_US Destination {Eth}
#TCP_5_40_M1_C25_DS
set TCP_5_40_M1_C25_DS ${tcp_goodput}
keylset TCP_5_40_M1_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M1_C25_DS Source {Eth}
keylset TCP_5_40_M1_C25_DS Destination {Wifi5_40_1_25CLI}
#TCP_5_40_M1_C25_US
set TCP_5_40_M1_C25_US ${tcp_goodput}
keylset TCP_5_40_M1_C25_US Direction {Unidirectional}
keylset TCP_5_40_M1_C25_US Source {Wifi5_40_1_25CLI}
keylset TCP_5_40_M1_C25_US Destination {Eth}
#TCP_5_40_M0_C25_DS
set TCP_5_40_M0_C25_DS ${tcp_goodput}
keylset TCP_5_40_M0_C25_DS Direction {Unidirectional}
keylset TCP_5_40_M0_C25_DS Source {Eth}
keylset TCP_5_40_M0_C25_DS Destination {Wifi5_40_0_25CLI}
#TCP_5_40_M0_C25_US
set TCP_5_40_M0_C25_US ${tcp_goodput}
keylset TCP_5_40_M0_C25_US Direction {Unidirectional}
keylset TCP_5_40_M0_C25_US Source {Wifi5_40_0_25CLI}
keylset TCP_5_40_M0_C25_US Destination {Eth}



#TCP_5_80_S1_M9_C1_DS
set TCP_5_80_S1_M9_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M9_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M9_C1_DS Source {Eth}
keylset TCP_5_80_S1_M9_C1_DS Destination {Wifi5_AC_S1_9_1CLI}
keylset TCP_5_80_S1_M9_C1_DS TrialDuration 15
keylset TCP_5_80_S1_M9_C1_DS TestDurationSec 15
#TCP_5_80_S1_M9_C1_US
set TCP_5_80_S1_M9_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M9_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M9_C1_US Source {Wifi5_AC_S1_9_1CLI}
keylset TCP_5_80_S1_M9_C1_US Destination {Eth}
keylset TCP_5_80_S1_M9_C1_US TrialDuration 15
keylset TCP_5_80_S1_M9_C1_US TestDurationSec 15
#TCP_5_80_S1_M8_C1_DS
set TCP_5_80_S1_M8_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M8_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M8_C1_DS Source {Eth}
keylset TCP_5_80_S1_M8_C1_DS Destination {Wifi5_AC_S1_8_1CLI}
#TCP_5_80_S1_M8_C1_US
set TCP_5_80_S1_M8_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M8_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M8_C1_US Source {Wifi5_AC_S1_8_1CLI}
keylset TCP_5_80_S1_M8_C1_US Destination {Eth}
#TCP_5_80_S1_M7_C1_DS
set TCP_5_80_S1_M7_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M7_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M7_C1_DS Source {Eth}
keylset TCP_5_80_S1_M7_C1_DS Destination {Wifi5_AC_S1_7_1CLI}
#TCP_5_80_S1_M7_C1_US
set TCP_5_80_S1_M7_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M7_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M7_C1_US Source {Wifi5_AC_S1_7_1CLI}
keylset TCP_5_80_S1_M7_C1_US Destination {Eth}
#TCP_5_80_S1_M6_C1_DS
set TCP_5_80_S1_M6_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M6_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M6_C1_DS Source {Eth}
keylset TCP_5_80_S1_M6_C1_DS Destination {Wifi5_AC_S1_6_1CLI}
#TCP_5_80_S1_M6_C1_US
set TCP_5_80_S1_M6_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M6_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M6_C1_US Source {Wifi5_AC_S1_6_1CLI}
keylset TCP_5_80_S1_M6_C1_US Destination {Eth}
#TCP_5_80_S1_M5_C1_DS
set TCP_5_80_S1_M5_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M5_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M5_C1_DS Source {Eth}
keylset TCP_5_80_S1_M5_C1_DS Destination {Wifi5_AC_S1_5_1CLI}
#TCP_5_80_S1_M5_C1_US
set TCP_5_80_S1_M5_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M5_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M5_C1_US Source {Wifi5_AC_S1_5_1CLI}
keylset TCP_5_80_S1_M5_C1_US Destination {Eth}
#TCP_5_80_S1_M4_C1_DS
set TCP_5_80_S1_M4_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M4_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M4_C1_DS Source {Eth}
keylset TCP_5_80_S1_M4_C1_DS Destination {Wifi5_AC_S1_4_1CLI}
keylset TCP_5_80_S1_M4_C1_DS TrialDuration 15
keylset TCP_5_80_S1_M4_C1_DS TestDurationSec 15
#TCP_5_80_S1_M4_C1_US
set TCP_5_80_S1_M4_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M4_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M4_C1_US Source {Wifi5_AC_S1_4_1CLI}
keylset TCP_5_80_S1_M4_C1_US Destination {Eth}
keylset TCP_5_80_S1_M4_C1_US TrialDuration 15
keylset TCP_5_80_S1_M4_C1_US TestDurationSec 15
#TCP_5_80_S1_M3_C1_DS
set TCP_5_80_S1_M3_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M3_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M3_C1_DS Source {Eth}
keylset TCP_5_80_S1_M3_C1_DS Destination {Wifi5_AC_S1_3_1CLI}
#TCP_5_80_S1_M3_C1_US
set TCP_5_80_S1_M3_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M3_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M3_C1_US Source {Wifi5_AC_S1_3_1CLI}
keylset TCP_5_80_S1_M3_C1_US Destination {Eth}
#TCP_5_80_S1_M2_C1_DS
set TCP_5_80_S1_M2_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M2_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M2_C1_DS Source {Eth}
keylset TCP_5_80_S1_M2_C1_DS Destination {Wifi5_AC_S1_2_1CLI}
#TCP_5_80_S1_M2_C1_US
set TCP_5_80_S1_M2_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M2_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M2_C1_US Source {Wifi5_AC_S1_2_1CLI}
keylset TCP_5_80_S1_M2_C1_US Destination {Eth}
#TCP_5_80_S1_M1_C1_DS
set TCP_5_80_S1_M1_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M1_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M1_C1_DS Source {Eth}
keylset TCP_5_80_S1_M1_C1_DS Destination {Wifi5_AC_S1_1_1CLI}
#TCP_5_80_S1_M1_C1_US
set TCP_5_80_S1_M1_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M1_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M1_C1_US Source {Wifi5_AC_S1_1_1CLI}
keylset TCP_5_80_S1_M1_C1_US Destination {Eth}
#TCP_5_80_S1_M0_C1_DS
set TCP_5_80_S1_M0_C1_DS ${tcp_goodput}
keylset TCP_5_80_S1_M0_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M0_C1_DS Source {Eth}
keylset TCP_5_80_S1_M0_C1_DS Destination {Wifi5_AC_S1_0_1CLI}
keylset TCP_5_80_S1_M0_C1_DS TrialDuration 15
keylset TCP_5_80_S1_M0_C1_DS TestDurationSec 15
#TCP_5_80_S1_M0_C1_US
set TCP_5_80_S1_M0_C1_US ${tcp_goodput}
keylset TCP_5_80_S1_M0_C1_US Direction {Unidirectional}
keylset TCP_5_80_S1_M0_C1_US Source {Wifi5_AC_S1_0_1CLI}
keylset TCP_5_80_S1_M0_C1_US Destination {Eth}
keylset TCP_5_80_S1_M0_C1_US TrialDuration 15
keylset TCP_5_80_S1_M0_C1_US TestDurationSec 15




#TCP_5_80_S1_M9_C10_DS
set TCP_5_80_S1_M9_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M9_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M9_C10_DS Source {Eth}
keylset TCP_5_80_S1_M9_C10_DS Destination {Wifi5_AC_S1_9_10CLI}
keylset TCP_5_80_S1_M9_C10_DS TrialDuration 15
keylset TCP_5_80_S1_M9_C10_DS TestDurationSec 15
#TCP_5_80_S1_M9_C10_US
set TCP_5_80_S1_M9_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M9_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M9_C10_US Source {Wifi5_AC_S1_9_10CLI}
keylset TCP_5_80_S1_M9_C10_US Destination {Eth}
keylset TCP_5_80_S1_M9_C10_US TrialDuration 15
keylset TCP_5_80_S1_M9_C10_US TestDurationSec 15
#TCP_5_80_S1_M8_C10_DS
set TCP_5_80_S1_M8_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M8_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M8_C10_DS Source {Eth}
keylset TCP_5_80_S1_M8_C10_DS Destination {Wifi5_AC_S1_8_10CLI}
#TCP_5_80_S1_M8_C10_US
set TCP_5_80_S1_M8_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M8_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M8_C10_US Source {Wifi5_AC_S1_8_10CLI}
keylset TCP_5_80_S1_M8_C10_US Destination {Eth}
#TCP_5_80_S1_M7_C10_DS
set TCP_5_80_S1_M7_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M7_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M7_C10_DS Source {Eth}
keylset TCP_5_80_S1_M7_C10_DS Destination {Wifi5_AC_S1_7_10CLI}
#TCP_5_80_S1_M7_C10_US
set TCP_5_80_S1_M7_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M7_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M7_C10_US Source {Wifi5_AC_S1_7_10CLI}
keylset TCP_5_80_S1_M7_C10_US Destination {Eth}
#TCP_5_80_S1_M6_C10_DS
set TCP_5_80_S1_M6_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M6_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M6_C10_DS Source {Eth}
keylset TCP_5_80_S1_M6_C10_DS Destination {Wifi5_AC_S1_6_10CLI}
#TCP_5_80_S1_M6_C10_US
set TCP_5_80_S1_M6_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M6_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M6_C10_US Source {Wifi5_AC_S1_6_10CLI}
keylset TCP_5_80_S1_M6_C10_US Destination {Eth}
#TCP_5_80_S1_M5_C10_DS
set TCP_5_80_S1_M5_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M5_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M5_C10_DS Source {Eth}
keylset TCP_5_80_S1_M5_C10_DS Destination {Wifi5_AC_S1_5_10CLI}
#TCP_5_80_S1_M5_C10_US
set TCP_5_80_S1_M5_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M5_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M5_C10_US Source {Wifi5_AC_S1_5_10CLI}
keylset TCP_5_80_S1_M5_C10_US Destination {Eth}
#TCP_5_80_S1_M4_C10_DS
set TCP_5_80_S1_M4_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M4_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M4_C10_DS Source {Eth}
keylset TCP_5_80_S1_M4_C10_DS Destination {Wifi5_AC_S1_4_10CLI}
keylset TCP_5_80_S1_M4_C10_DS TrialDuration 15
keylset TCP_5_80_S1_M4_C10_DS TestDurationSec 15
#TCP_5_80_S1_M4_C10_US
set TCP_5_80_S1_M4_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M4_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M4_C10_US Source {Wifi5_AC_S1_4_10CLI}
keylset TCP_5_80_S1_M4_C10_US Destination {Eth}
keylset TCP_5_80_S1_M4_C10_US TrialDuration 15
keylset TCP_5_80_S1_M4_C10_US TestDurationSec 15
#TCP_5_80_S1_M3_C10_DS
set TCP_5_80_S1_M3_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M3_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M3_C10_DS Source {Eth}
keylset TCP_5_80_S1_M3_C10_DS Destination {Wifi5_AC_S1_3_10CLI}
#TCP_5_80_S1_M3_C10_US
set TCP_5_80_S1_M3_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M3_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M3_C10_US Source {Wifi5_AC_S1_3_10CLI}
keylset TCP_5_80_S1_M3_C10_US Destination {Eth}
#TCP_5_80_S1_M2_C10_DS
set TCP_5_80_S1_M2_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M2_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M2_C10_DS Source {Eth}
keylset TCP_5_80_S1_M2_C10_DS Destination {Wifi5_AC_S1_2_10CLI}
#TCP_5_80_S1_M2_C10_US
set TCP_5_80_S1_M2_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M2_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M2_C10_US Source {Wifi5_AC_S1_2_10CLI}
keylset TCP_5_80_S1_M2_C10_US Destination {Eth}
#TCP_5_80_S1_M1_C10_DS
set TCP_5_80_S1_M1_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M1_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M1_C10_DS Source {Eth}
keylset TCP_5_80_S1_M1_C10_DS Destination {Wifi5_AC_S1_1_10CLI}
#TCP_5_80_S1_M1_C10_US
set TCP_5_80_S1_M1_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M1_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M1_C10_US Source {Wifi5_AC_S1_1_10CLI}
keylset TCP_5_80_S1_M1_C10_US Destination {Eth}
#TCP_5_80_S1_M0_C10_DS
set TCP_5_80_S1_M0_C10_DS ${tcp_goodput}
keylset TCP_5_80_S1_M0_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M0_C10_DS Source {Eth}
keylset TCP_5_80_S1_M0_C10_DS Destination {Wifi5_AC_S1_0_10CLI}
keylset TCP_5_80_S1_M0_C10_DS TrialDuration 15
keylset TCP_5_80_S1_M0_C10_DS TestDurationSec 15
#TCP_5_80_S1_M0_C10_US
set TCP_5_80_S1_M0_C10_US ${tcp_goodput}
keylset TCP_5_80_S1_M0_C10_US Direction {Unidirectional}
keylset TCP_5_80_S1_M0_C10_US Source {Wifi5_AC_S1_0_10CLI}
keylset TCP_5_80_S1_M0_C10_US Destination {Eth}
keylset TCP_5_80_S1_M0_C10_US TrialDuration 15
keylset TCP_5_80_S1_M0_C10_US TestDurationSec 15


#TCP_5_80_S1_M9_C25_DS
set TCP_5_80_S1_M9_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M9_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M9_C25_DS Source {Eth}
keylset TCP_5_80_S1_M9_C25_DS Destination {Wifi5_AC_S1_9_25CLI}
keylset TCP_5_80_S1_M9_C25_DS TrialDuration 15
keylset TCP_5_80_S1_M9_C25_DS TestDurationSec 15
#TCP_5_80_S1_M9_C25_US
set TCP_5_80_S1_M9_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M9_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M9_C25_US Source {Wifi5_AC_S1_9_25CLI}
keylset TCP_5_80_S1_M9_C25_US Destination {Eth}
keylset TCP_5_80_S1_M9_C25_US TrialDuration 15
keylset TCP_5_80_S1_M9_C25_US TestDurationSec 15
#TCP_5_80_S1_M8_C25_DS
set TCP_5_80_S1_M8_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M8_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M8_C25_DS Source {Eth}
keylset TCP_5_80_S1_M8_C25_DS Destination {Wifi5_AC_S1_8_25CLI}
#TCP_5_80_S1_M8_C25_US
set TCP_5_80_S1_M8_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M8_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M8_C25_US Source {Wifi5_AC_S1_8_25CLI}
keylset TCP_5_80_S1_M8_C25_US Destination {Eth}
#TCP_5_80_S1_M7_C25_DS
set TCP_5_80_S1_M7_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M7_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M7_C25_DS Source {Eth}
keylset TCP_5_80_S1_M7_C25_DS Destination {Wifi5_AC_S1_7_25CLI}
#TCP_5_80_S1_M7_C25_US
set TCP_5_80_S1_M7_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M7_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M7_C25_US Source {Wifi5_AC_S1_7_25CLI}
keylset TCP_5_80_S1_M7_C25_US Destination {Eth}
#TCP_5_80_S1_M6_C25_DS
set TCP_5_80_S1_M6_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M6_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M6_C25_DS Source {Eth}
keylset TCP_5_80_S1_M6_C25_DS Destination {Wifi5_AC_S1_6_25CLI}
#TCP_5_80_S1_M6_C25_US
set TCP_5_80_S1_M6_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M6_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M6_C25_US Source {Wifi5_AC_S1_6_25CLI}
keylset TCP_5_80_S1_M6_C25_US Destination {Eth}
#TCP_5_80_S1_M5_C25_DS
set TCP_5_80_S1_M5_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M5_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M5_C25_DS Source {Eth}
keylset TCP_5_80_S1_M5_C25_DS Destination {Wifi5_AC_S1_5_25CLI}
#TCP_5_80_S1_M5_C25_US
set TCP_5_80_S1_M5_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M5_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M5_C25_US Source {Wifi5_AC_S1_5_25CLI}
keylset TCP_5_80_S1_M5_C25_US Destination {Eth}
#TCP_5_80_S1_M4_C25_DS
set TCP_5_80_S1_M4_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M4_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M4_C25_DS Source {Eth}
keylset TCP_5_80_S1_M4_C25_DS Destination {Wifi5_AC_S1_4_25CLI}
keylset TCP_5_80_S1_M4_C25_DS TrialDuration 15
keylset TCP_5_80_S1_M4_C25_DS TestDurationSec 15
#TCP_5_80_S1_M4_C25_US
set TCP_5_80_S1_M4_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M4_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M4_C25_US Source {Wifi5_AC_S1_4_25CLI}
keylset TCP_5_80_S1_M4_C25_US Destination {Eth}
keylset TCP_5_80_S1_M4_C25_US TrialDuration 15
keylset TCP_5_80_S1_M4_C25_US TestDurationSec 15
#TCP_5_80_S1_M3_C25_DS
set TCP_5_80_S1_M3_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M3_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M3_C25_DS Source {Eth}
keylset TCP_5_80_S1_M3_C25_DS Destination {Wifi5_AC_S1_3_25CLI}
#TCP_5_80_S1_M3_C25_US
set TCP_5_80_S1_M3_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M3_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M3_C25_US Source {Wifi5_AC_S1_3_25CLI}
keylset TCP_5_80_S1_M3_C25_US Destination {Eth}
#TCP_5_80_S1_M2_C25_DS
set TCP_5_80_S1_M2_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M2_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M2_C25_DS Source {Eth}
keylset TCP_5_80_S1_M2_C25_DS Destination {Wifi5_AC_S1_2_25CLI}
#TCP_5_80_S1_M2_C25_US
set TCP_5_80_S1_M2_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M2_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M2_C25_US Source {Wifi5_AC_S1_2_25CLI}
keylset TCP_5_80_S1_M2_C25_US Destination {Eth}
#TCP_5_80_S1_M1_C25_DS
set TCP_5_80_S1_M1_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M1_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M1_C25_DS Source {Eth}
keylset TCP_5_80_S1_M1_C25_DS Destination {Wifi5_AC_S1_1_25CLI}
#TCP_5_80_S1_M1_C25_US
set TCP_5_80_S1_M1_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M1_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M1_C25_US Source {Wifi5_AC_S1_1_25CLI}
keylset TCP_5_80_S1_M1_C25_US Destination {Eth}
#TCP_5_80_S1_M0_C25_DS
set TCP_5_80_S1_M0_C25_DS ${tcp_goodput}
keylset TCP_5_80_S1_M0_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S1_M0_C25_DS Source {Eth}
keylset TCP_5_80_S1_M0_C25_DS Destination {Wifi5_AC_S1_0_25CLI}
keylset TCP_5_80_S1_M0_C25_DS TrialDuration 15
keylset TCP_5_80_S1_M0_C25_DS TestDurationSec 15
#TCP_5_80_S1_M0_C25_US
set TCP_5_80_S1_M0_C25_US ${tcp_goodput}
keylset TCP_5_80_S1_M0_C25_US Direction {Unidirectional}
keylset TCP_5_80_S1_M0_C25_US Source {Wifi5_AC_S1_0_25CLI}
keylset TCP_5_80_S1_M0_C25_US Destination {Eth}
keylset TCP_5_80_S1_M0_C25_US TrialDuration 15
keylset TCP_5_80_S1_M0_C25_US TestDurationSec 15



#TCP_5_80_S2_M9_C1_DS
set TCP_5_80_S2_M9_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M9_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M9_C1_DS Source {Eth}
keylset TCP_5_80_S2_M9_C1_DS Destination {Wifi5_AC_S2_9_1CLI}
keylset TCP_5_80_S2_M9_C1_DS TrialDuration 15
keylset TCP_5_80_S2_M9_C1_DS TestDurationSec 15
#TCP_5_80_S2_M9_C1_US
set TCP_5_80_S2_M9_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M9_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M9_C1_US Source {Wifi5_AC_S2_9_1CLI}
keylset TCP_5_80_S2_M9_C1_US Destination {Eth}
keylset TCP_5_80_S2_M9_C1_US TrialDuration 15
keylset TCP_5_80_S2_M9_C1_US TestDurationSec 15
#TCP_5_80_S2_M8_C1_DS
set TCP_5_80_S2_M8_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M8_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M8_C1_DS Source {Eth}
keylset TCP_5_80_S2_M8_C1_DS Destination {Wifi5_AC_S2_8_1CLI}
#TCP_5_80_S2_M8_C1_US
set TCP_5_80_S2_M8_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M8_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M8_C1_US Source {Wifi5_AC_S2_8_1CLI}
keylset TCP_5_80_S2_M8_C1_US Destination {Eth}
#TCP_5_80_S2_M7_C1_DS
set TCP_5_80_S2_M7_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M7_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M7_C1_DS Source {Eth}
keylset TCP_5_80_S2_M7_C1_DS Destination {Wifi5_AC_S2_7_1CLI}
#TCP_5_80_S2_M7_C1_US
set TCP_5_80_S2_M7_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M7_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M7_C1_US Source {Wifi5_AC_S2_7_1CLI}
keylset TCP_5_80_S2_M7_C1_US Destination {Eth}
#TCP_5_80_S2_M6_C1_DS
set TCP_5_80_S2_M6_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M6_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M6_C1_DS Source {Eth}
keylset TCP_5_80_S2_M6_C1_DS Destination {Wifi5_AC_S2_6_1CLI}
#TCP_5_80_S2_M6_C1_US
set TCP_5_80_S2_M6_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M6_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M6_C1_US Source {Wifi5_AC_S2_6_1CLI}
keylset TCP_5_80_S2_M6_C1_US Destination {Eth}
#TCP_5_80_S2_M5_C1_DS
set TCP_5_80_S2_M5_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M5_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M5_C1_DS Source {Eth}
keylset TCP_5_80_S2_M5_C1_DS Destination {Wifi5_AC_S2_5_1CLI}
#TCP_5_80_S2_M5_C1_US
set TCP_5_80_S2_M5_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M5_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M5_C1_US Source {Wifi5_AC_S2_5_1CLI}
keylset TCP_5_80_S2_M5_C1_US Destination {Eth}
#TCP_5_80_S2_M4_C1_DS
set TCP_5_80_S2_M4_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M4_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M4_C1_DS Source {Eth}
keylset TCP_5_80_S2_M4_C1_DS Destination {Wifi5_AC_S2_4_1CLI}
keylset TCP_5_80_S2_M4_C1_DS TrialDuration 15
keylset TCP_5_80_S2_M4_C1_DS TestDurationSec 15
#TCP_5_80_S2_M4_C1_US
set TCP_5_80_S2_M4_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M4_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M4_C1_US Source {Wifi5_AC_S2_4_1CLI}
keylset TCP_5_80_S2_M4_C1_US Destination {Eth}
keylset TCP_5_80_S2_M4_C1_US TrialDuration 15
keylset TCP_5_80_S2_M4_C1_US TestDurationSec 15
#TCP_5_80_S2_M3_C1_DS
set TCP_5_80_S2_M3_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M3_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M3_C1_DS Source {Eth}
keylset TCP_5_80_S2_M3_C1_DS Destination {Wifi5_AC_S2_3_1CLI}
#TCP_5_80_S2_M3_C1_US
set TCP_5_80_S2_M3_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M3_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M3_C1_US Source {Wifi5_AC_S2_3_1CLI}
keylset TCP_5_80_S2_M3_C1_US Destination {Eth}
#TCP_5_80_S2_M2_C1_DS
set TCP_5_80_S2_M2_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M2_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M2_C1_DS Source {Eth}
keylset TCP_5_80_S2_M2_C1_DS Destination {Wifi5_AC_S2_2_1CLI}
#TCP_5_80_S2_M2_C1_US
set TCP_5_80_S2_M2_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M2_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M2_C1_US Source {Wifi5_AC_S2_2_1CLI}
keylset TCP_5_80_S2_M2_C1_US Destination {Eth}
#TCP_5_80_S2_M1_C1_DS
set TCP_5_80_S2_M1_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M1_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M1_C1_DS Source {Eth}
keylset TCP_5_80_S2_M1_C1_DS Destination {Wifi5_AC_S2_1_1CLI}
#TCP_5_80_S2_M1_C1_US
set TCP_5_80_S2_M1_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M1_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M1_C1_US Source {Wifi5_AC_S2_1_1CLI}
keylset TCP_5_80_S2_M1_C1_US Destination {Eth}
#TCP_5_80_S2_M0_C1_DS
set TCP_5_80_S2_M0_C1_DS ${tcp_goodput}
keylset TCP_5_80_S2_M0_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M0_C1_DS Source {Eth}
keylset TCP_5_80_S2_M0_C1_DS Destination {Wifi5_AC_S2_0_1CLI}
keylset TCP_5_80_S2_M0_C1_DS TrialDuration 15
keylset TCP_5_80_S2_M0_C1_DS TestDurationSec 15
#TCP_5_80_S2_M0_C1_US
set TCP_5_80_S2_M0_C1_US ${tcp_goodput}
keylset TCP_5_80_S2_M0_C1_US Direction {Unidirectional}
keylset TCP_5_80_S2_M0_C1_US Source {Wifi5_AC_S2_0_1CLI}
keylset TCP_5_80_S2_M0_C1_US Destination {Eth}
keylset TCP_5_80_S2_M0_C1_US TrialDuration 15
keylset TCP_5_80_S2_M0_C1_US TestDurationSec 15



#TCP_5_80_S2_M9_C10_DS
set TCP_5_80_S2_M9_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M9_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M9_C10_DS Source {Eth}
keylset TCP_5_80_S2_M9_C10_DS Destination {Wifi5_AC_S2_9_10CLI}
keylset TCP_5_80_S2_M9_C10_DS TrialDuration 15
keylset TCP_5_80_S2_M9_C10_DS TestDurationSec 15
#TCP_5_80_S2_M9_C10_US
set TCP_5_80_S2_M9_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M9_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M9_C10_US Source {Wifi5_AC_S2_9_10CLI}
keylset TCP_5_80_S2_M9_C10_US Destination {Eth}
keylset TCP_5_80_S2_M9_C10_US TrialDuration 15
keylset TCP_5_80_S2_M9_C10_US TestDurationSec 15
#TCP_5_80_S2_M8_C10_DS
set TCP_5_80_S2_M8_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M8_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M8_C10_DS Source {Eth}
keylset TCP_5_80_S2_M8_C10_DS Destination {Wifi5_AC_S2_8_10CLI}
#TCP_5_80_S2_M8_C10_US
set TCP_5_80_S2_M8_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M8_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M8_C10_US Source {Wifi5_AC_S2_8_10CLI}
keylset TCP_5_80_S2_M8_C10_US Destination {Eth}
#TCP_5_80_S2_M7_C10_DS
set TCP_5_80_S2_M7_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M7_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M7_C10_DS Source {Eth}
keylset TCP_5_80_S2_M7_C10_DS Destination {Wifi5_AC_S2_7_10CLI}
keylset TCP_5_80_S2_M7_C10_DS TrialDuration 15
keylset TCP_5_80_S2_M7_C10_DS TestDurationSec 15
#TCP_5_80_S2_M7_C10_US
set TCP_5_80_S2_M7_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M7_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M7_C10_US Source {Wifi5_AC_S2_7_10CLI}
keylset TCP_5_80_S2_M7_C10_US Destination {Eth}
keylset TCP_5_80_S2_M7_C10_US TrialDuration 15
keylset TCP_5_80_S2_M7_C10_US TestDurationSec 15
#TCP_5_80_S2_M6_C10_DS
set TCP_5_80_S2_M6_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M6_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M6_C10_DS Source {Eth}
keylset TCP_5_80_S2_M6_C10_DS Destination {Wifi5_AC_S2_6_10CLI}
#TCP_5_80_S2_M6_C10_US
set TCP_5_80_S2_M6_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M6_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M6_C10_US Source {Wifi5_AC_S2_6_10CLI}
keylset TCP_5_80_S2_M6_C10_US Destination {Eth}
#TCP_5_80_S2_M5_C10_DS
set TCP_5_80_S2_M5_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M5_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M5_C10_DS Source {Eth}
keylset TCP_5_80_S2_M5_C10_DS Destination {Wifi5_AC_S2_5_10CLI}
#TCP_5_80_S2_M5_C10_US
set TCP_5_80_S2_M5_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M5_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M5_C10_US Source {Wifi5_AC_S2_5_10CLI}
keylset TCP_5_80_S2_M5_C10_US Destination {Eth}
#TCP_5_80_S2_M4_C10_DS
set TCP_5_80_S2_M4_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M4_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M4_C10_DS Source {Eth}
keylset TCP_5_80_S2_M4_C10_DS Destination {Wifi5_AC_S2_4_10CLI}
keylset TCP_5_80_S2_M4_C10_DS TrialDuration 15
keylset TCP_5_80_S2_M4_C10_DS TestDurationSec 15
#TCP_5_80_S2_M4_C10_US
set TCP_5_80_S2_M4_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M4_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M4_C10_US Source {Wifi5_AC_S2_4_10CLI}
keylset TCP_5_80_S2_M4_C10_US Destination {Eth}
keylset TCP_5_80_S2_M4_C10_US TrialDuration 15
keylset TCP_5_80_S2_M4_C10_US TestDurationSec 15
#TCP_5_80_S2_M3_C10_DS
set TCP_5_80_S2_M3_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M3_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M3_C10_DS Source {Eth}
keylset TCP_5_80_S2_M3_C10_DS Destination {Wifi5_AC_S2_3_10CLI}
#TCP_5_80_S2_M3_C10_US
set TCP_5_80_S2_M3_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M3_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M3_C10_US Source {Wifi5_AC_S2_3_10CLI}
keylset TCP_5_80_S2_M3_C10_US Destination {Eth}
#TCP_5_80_S2_M2_C10_DS
set TCP_5_80_S2_M2_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M2_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M2_C10_DS Source {Eth}
keylset TCP_5_80_S2_M2_C10_DS Destination {Wifi5_AC_S2_2_10CLI}
#TCP_5_80_S2_M2_C10_US
set TCP_5_80_S2_M2_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M2_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M2_C10_US Source {Wifi5_AC_S2_2_10CLI}
keylset TCP_5_80_S2_M2_C10_US Destination {Eth}
#TCP_5_80_S2_M1_C10_DS
set TCP_5_80_S2_M1_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M1_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M1_C10_DS Source {Eth}
keylset TCP_5_80_S2_M1_C10_DS Destination {Wifi5_AC_S2_1_10CLI}
#TCP_5_80_S2_M1_C10_US
set TCP_5_80_S2_M1_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M1_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M1_C10_US Source {Wifi5_AC_S2_1_10CLI}
keylset TCP_5_80_S2_M1_C10_US Destination {Eth}
#TCP_5_80_S2_M0_C10_DS
set TCP_5_80_S2_M0_C10_DS ${tcp_goodput}
keylset TCP_5_80_S2_M0_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M0_C10_DS Source {Eth}
keylset TCP_5_80_S2_M0_C10_DS Destination {Wifi5_AC_S2_0_10CLI}
keylset TCP_5_80_S2_M0_C10_DS TrialDuration 15
keylset TCP_5_80_S2_M0_C10_DS TestDurationSec 15
#TCP_5_80_S2_M0_C10_US
set TCP_5_80_S2_M0_C10_US ${tcp_goodput}
keylset TCP_5_80_S2_M0_C10_US Direction {Unidirectional}
keylset TCP_5_80_S2_M0_C10_US Source {Wifi5_AC_S2_0_10CLI}
keylset TCP_5_80_S2_M0_C10_US Destination {Eth}
keylset TCP_5_80_S2_M0_C10_US TrialDuration 15
keylset TCP_5_80_S2_M0_C10_US TestDurationSec 15



#TCP_5_80_S2_M9_C25_DS
set TCP_5_80_S2_M9_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M9_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M9_C25_DS Source {Eth}
keylset TCP_5_80_S2_M9_C25_DS Destination {Wifi5_AC_S2_9_25CLI}
keylset TCP_5_80_S2_M9_C25_DS TrialDuration 15
keylset TCP_5_80_S2_M9_C25_DS TestDurationSec 15
#TCP_5_80_S2_M9_C25_US
set TCP_5_80_S2_M9_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M9_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M9_C25_US Source {Wifi5_AC_S2_9_25CLI}
keylset TCP_5_80_S2_M9_C25_US Destination {Eth}
keylset TCP_5_80_S2_M9_C25_US TrialDuration 15
keylset TCP_5_80_S2_M9_C25_US TestDurationSec 15
#TCP_5_80_S2_M8_C25_DS
set TCP_5_80_S2_M8_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M8_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M8_C25_DS Source {Eth}
keylset TCP_5_80_S2_M8_C25_DS Destination {Wifi5_AC_S2_8_25CLI}
#TCP_5_80_S2_M8_C25_US
set TCP_5_80_S2_M8_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M8_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M8_C25_US Source {Wifi5_AC_S2_8_25CLI}
keylset TCP_5_80_S2_M8_C25_US Destination {Eth}
#TCP_5_80_S2_M7_C25_DS
set TCP_5_80_S2_M7_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M7_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M7_C25_DS Source {Eth}
keylset TCP_5_80_S2_M7_C25_DS Destination {Wifi5_AC_S2_7_25CLI}
keylset TCP_5_80_S2_M7_C25_DS TrialDuration 15
keylset TCP_5_80_S2_M7_C25_DS TestDurationSec 15
#TCP_5_80_S2_M7_C25_US
set TCP_5_80_S2_M7_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M7_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M7_C25_US Source {Wifi5_AC_S2_7_25CLI}
keylset TCP_5_80_S2_M7_C25_US Destination {Eth}
keylset TCP_5_80_S2_M7_C25_US TrialDuration 15
keylset TCP_5_80_S2_M7_C25_US TestDurationSec 15
#TCP_5_80_S2_M6_C25_DS
set TCP_5_80_S2_M6_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M6_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M6_C25_DS Source {Eth}
keylset TCP_5_80_S2_M6_C25_DS Destination {Wifi5_AC_S2_6_25CLI}
#TCP_5_80_S2_M6_C25_US
set TCP_5_80_S2_M6_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M6_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M6_C25_US Source {Wifi5_AC_S2_6_25CLI}
keylset TCP_5_80_S2_M6_C25_US Destination {Eth}
#TCP_5_80_S2_M5_C25_DS
set TCP_5_80_S2_M5_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M5_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M5_C25_DS Source {Eth}
keylset TCP_5_80_S2_M5_C25_DS Destination {Wifi5_AC_S2_5_25CLI}
#TCP_5_80_S2_M5_C25_US
set TCP_5_80_S2_M5_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M5_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M5_C25_US Source {Wifi5_AC_S2_5_25CLI}
keylset TCP_5_80_S2_M5_C25_US Destination {Eth}
#TCP_5_80_S2_M4_C25_DS
set TCP_5_80_S2_M4_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M4_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M4_C25_DS Source {Eth}
keylset TCP_5_80_S2_M4_C25_DS Destination {Wifi5_AC_S2_4_25CLI}
#TCP_5_80_S2_M4_C25_US
set TCP_5_80_S2_M4_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M4_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M4_C25_US Source {Wifi5_AC_S2_4_25CLI}
keylset TCP_5_80_S2_M4_C25_US Destination {Eth}
#TCP_5_80_S2_M3_C25_DS
set TCP_5_80_S2_M3_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M3_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M3_C25_DS Source {Eth}
keylset TCP_5_80_S2_M3_C25_DS Destination {Wifi5_AC_S2_3_25CLI}
#TCP_5_80_S2_M3_C25_US
set TCP_5_80_S2_M3_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M3_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M3_C25_US Source {Wifi5_AC_S2_3_25CLI}
keylset TCP_5_80_S2_M3_C25_US Destination {Eth}
#TCP_5_80_S2_M2_C25_DS
set TCP_5_80_S2_M2_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M2_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M2_C25_DS Source {Eth}
keylset TCP_5_80_S2_M2_C25_DS Destination {Wifi5_AC_S2_2_25CLI}
#TCP_5_80_S2_M2_C25_US
set TCP_5_80_S2_M2_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M2_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M2_C25_US Source {Wifi5_AC_S2_2_25CLI}
keylset TCP_5_80_S2_M2_C25_US Destination {Eth}
#TCP_5_80_S2_M1_C25_DS
set TCP_5_80_S2_M1_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M1_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M1_C25_DS Source {Eth}
keylset TCP_5_80_S2_M1_C25_DS Destination {Wifi5_AC_S2_1_25CLI}
#TCP_5_80_S2_M1_C25_US
set TCP_5_80_S2_M1_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M1_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M1_C25_US Source {Wifi5_AC_S2_1_25CLI}
keylset TCP_5_80_S2_M1_C25_US Destination {Eth}
#TCP_5_80_S2_M0_C25_DS
set TCP_5_80_S2_M0_C25_DS ${tcp_goodput}
keylset TCP_5_80_S2_M0_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S2_M0_C25_DS Source {Eth}
keylset TCP_5_80_S2_M0_C25_DS Destination {Wifi5_AC_S2_0_25CLI}
#TCP_5_80_S2_M0_C25_US
set TCP_5_80_S2_M0_C25_US ${tcp_goodput}
keylset TCP_5_80_S2_M0_C25_US Direction {Unidirectional}
keylset TCP_5_80_S2_M0_C25_US Source {Wifi5_AC_S2_0_25CLI}
keylset TCP_5_80_S2_M0_C25_US Destination {Eth}



#TCP_5_80_S3_M9_C1_DS
set TCP_5_80_S3_M9_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M9_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M9_C1_DS Source {Eth}
keylset TCP_5_80_S3_M9_C1_DS Destination {Wifi5_AC_S3_9_1CLI}
#TCP_5_80_S3_M9_C1_US
set TCP_5_80_S3_M9_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M9_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M9_C1_US Source {Wifi5_AC_S3_9_1CLI}
keylset TCP_5_80_S3_M9_C1_US Destination {Eth}
#TCP_5_80_S3_M8_C1_DS
set TCP_5_80_S3_M8_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M8_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M8_C1_DS Source {Eth}
keylset TCP_5_80_S3_M8_C1_DS Destination {Wifi5_AC_S3_8_1CLI}
#TCP_5_80_S3_M8_C1_US
set TCP_5_80_S3_M8_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M8_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M8_C1_US Source {Wifi5_AC_S3_8_1CLI}
keylset TCP_5_80_S3_M8_C1_US Destination {Eth}
#TCP_5_80_S3_M7_C1_DS
set TCP_5_80_S3_M7_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M7_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M7_C1_DS Source {Eth}
keylset TCP_5_80_S3_M7_C1_DS Destination {Wifi5_AC_S3_7_1CLI}
#TCP_5_80_S3_M7_C1_US
set TCP_5_80_S3_M7_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M7_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M7_C1_US Source {Wifi5_AC_S3_7_1CLI}
keylset TCP_5_80_S3_M7_C1_US Destination {Eth}
##TCP_5_80_S3_M6_C1_DS
#set TCP_5_80_S3_M6_C1_DS ${tcp_goodput}
#keylset TCP_5_80_S3_M6_C1_DS Direction {Unidirectional}
#keylset TCP_5_80_S3_M6_C1_DS Source {Eth}
#keylset TCP_5_80_S3_M6_C1_DS Destination {Wifi5_AC_S3_6_1CLI}
##TCP_5_80_S3_M6_C1_US
#set TCP_5_80_S3_M6_C1_US ${tcp_goodput}
#keylset TCP_5_80_S3_M6_C1_US Direction {Unidirectional}
#keylset TCP_5_80_S3_M6_C1_US Source {Wifi5_AC_S3_6_1CLI}
#keylset TCP_5_80_S3_M6_C1_US Destination {Eth}
#TCP_5_80_S3_M5_C1_DS
set TCP_5_80_S3_M5_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M5_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M5_C1_DS Source {Eth}
keylset TCP_5_80_S3_M5_C1_DS Destination {Wifi5_AC_S3_5_1CLI}
#TCP_5_80_S3_M5_C1_US
set TCP_5_80_S3_M5_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M5_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M5_C1_US Source {Wifi5_AC_S3_5_1CLI}
keylset TCP_5_80_S3_M5_C1_US Destination {Eth}
#TCP_5_80_S3_M4_C1_DS
set TCP_5_80_S3_M4_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M4_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M4_C1_DS Source {Eth}
keylset TCP_5_80_S3_M4_C1_DS Destination {Wifi5_AC_S3_4_1CLI}
#TCP_5_80_S3_M4_C1_US
set TCP_5_80_S3_M4_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M4_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M4_C1_US Source {Wifi5_AC_S3_4_1CLI}
keylset TCP_5_80_S3_M4_C1_US Destination {Eth}
#TCP_5_80_S3_M3_C1_DS
set TCP_5_80_S3_M3_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M3_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M3_C1_DS Source {Eth}
keylset TCP_5_80_S3_M3_C1_DS Destination {Wifi5_AC_S3_3_1CLI}
#TCP_5_80_S3_M3_C1_US
set TCP_5_80_S3_M3_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M3_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M3_C1_US Source {Wifi5_AC_S3_3_1CLI}
keylset TCP_5_80_S3_M3_C1_US Destination {Eth}
#TCP_5_80_S3_M2_C1_DS
set TCP_5_80_S3_M2_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M2_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M2_C1_DS Source {Eth}
keylset TCP_5_80_S3_M2_C1_DS Destination {Wifi5_AC_S3_2_1CLI}
#TCP_5_80_S3_M2_C1_US
set TCP_5_80_S3_M2_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M2_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M2_C1_US Source {Wifi5_AC_S3_2_1CLI}
keylset TCP_5_80_S3_M2_C1_US Destination {Eth}
#TCP_5_80_S3_M1_C1_DS
set TCP_5_80_S3_M1_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M1_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M1_C1_DS Source {Eth}
keylset TCP_5_80_S3_M1_C1_DS Destination {Wifi5_AC_S3_1_1CLI}
#TCP_5_80_S3_M1_C1_US
set TCP_5_80_S3_M1_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M1_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M1_C1_US Source {Wifi5_AC_S3_1_1CLI}
keylset TCP_5_80_S3_M1_C1_US Destination {Eth}
#TCP_5_80_S3_M0_C1_DS
set TCP_5_80_S3_M0_C1_DS ${tcp_goodput}
keylset TCP_5_80_S3_M0_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M0_C1_DS Source {Eth}
keylset TCP_5_80_S3_M0_C1_DS Destination {Wifi5_AC_S3_0_1CLI}
#TCP_5_80_S3_M0_C1_US
set TCP_5_80_S3_M0_C1_US ${tcp_goodput}
keylset TCP_5_80_S3_M0_C1_US Direction {Unidirectional}
keylset TCP_5_80_S3_M0_C1_US Source {Wifi5_AC_S3_0_1CLI}
keylset TCP_5_80_S3_M0_C1_US Destination {Eth}





#TCP_5_80_S3_M9_C10_DS
set TCP_5_80_S3_M9_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M9_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M9_C10_DS Source {Eth}
keylset TCP_5_80_S3_M9_C10_DS Destination {Wifi5_AC_S3_9_10CLI}
#TCP_5_80_S3_M9_C10_US
set TCP_5_80_S3_M9_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M9_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M9_C10_US Source {Wifi5_AC_S3_9_10CLI}
keylset TCP_5_80_S3_M9_C10_US Destination {Eth}
#TCP_5_80_S3_M8_C10_DS
set TCP_5_80_S3_M8_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M8_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M8_C10_DS Source {Eth}
keylset TCP_5_80_S3_M8_C10_DS Destination {Wifi5_AC_S3_8_10CLI}
#TCP_5_80_S3_M8_C10_US
set TCP_5_80_S3_M8_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M8_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M8_C10_US Source {Wifi5_AC_S3_8_10CLI}
keylset TCP_5_80_S3_M8_C10_US Destination {Eth}
#TCP_5_80_S3_M7_C10_DS
set TCP_5_80_S3_M7_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M7_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M7_C10_DS Source {Eth}
keylset TCP_5_80_S3_M7_C10_DS Destination {Wifi5_AC_S3_7_10CLI}
#TCP_5_80_S3_M7_C10_US
set TCP_5_80_S3_M7_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M7_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M7_C10_US Source {Wifi5_AC_S3_7_10CLI}
keylset TCP_5_80_S3_M7_C10_US Destination {Eth}
##TCP_5_80_S3_M6_C10_DS
#set TCP_5_80_S3_M6_C10_DS ${tcp_goodput}
#keylset TCP_5_80_S3_M6_C10_DS Direction {Unidirectional}
#keylset TCP_5_80_S3_M6_C10_DS Source {Eth}
#keylset TCP_5_80_S3_M6_C10_DS Destination {Wifi5_AC_S3_6_10CLI}
##TCP_5_80_S3_M6_C10_US
#set TCP_5_80_S3_M6_C10_US ${tcp_goodput}
#keylset TCP_5_80_S3_M6_C10_US Direction {Unidirectional}
#keylset TCP_5_80_S3_M6_C10_US Source {Wifi5_AC_S3_6_10CLI}
#keylset TCP_5_80_S3_M6_C10_US Destination {Eth}
#TCP_5_80_S3_M5_C10_DS
set TCP_5_80_S3_M5_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M5_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M5_C10_DS Source {Eth}
keylset TCP_5_80_S3_M5_C10_DS Destination {Wifi5_AC_S3_5_10CLI}
#TCP_5_80_S3_M5_C10_US
set TCP_5_80_S3_M5_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M5_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M5_C10_US Source {Wifi5_AC_S3_5_10CLI}
keylset TCP_5_80_S3_M5_C10_US Destination {Eth}
#TCP_5_80_S3_M4_C10_DS
set TCP_5_80_S3_M4_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M4_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M4_C10_DS Source {Eth}
keylset TCP_5_80_S3_M4_C10_DS Destination {Wifi5_AC_S3_4_10CLI}
#TCP_5_80_S3_M4_C10_US
set TCP_5_80_S3_M4_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M4_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M4_C10_US Source {Wifi5_AC_S3_4_10CLI}
keylset TCP_5_80_S3_M4_C10_US Destination {Eth}
#TCP_5_80_S3_M3_C10_DS
set TCP_5_80_S3_M3_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M3_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M3_C10_DS Source {Eth}
keylset TCP_5_80_S3_M3_C10_DS Destination {Wifi5_AC_S3_3_10CLI}
#TCP_5_80_S3_M3_C10_US
set TCP_5_80_S3_M3_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M3_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M3_C10_US Source {Wifi5_AC_S3_3_10CLI}
keylset TCP_5_80_S3_M3_C10_US Destination {Eth}
#TCP_5_80_S3_M2_C10_DS
set TCP_5_80_S3_M2_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M2_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M2_C10_DS Source {Eth}
keylset TCP_5_80_S3_M2_C10_DS Destination {Wifi5_AC_S3_2_10CLI}
#TCP_5_80_S3_M2_C10_US
set TCP_5_80_S3_M2_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M2_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M2_C10_US Source {Wifi5_AC_S3_2_10CLI}
keylset TCP_5_80_S3_M2_C10_US Destination {Eth}
#TCP_5_80_S3_M1_C10_DS
set TCP_5_80_S3_M1_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M1_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M1_C10_DS Source {Eth}
keylset TCP_5_80_S3_M1_C10_DS Destination {Wifi5_AC_S3_1_10CLI}
#TCP_5_80_S3_M1_C10_US
set TCP_5_80_S3_M1_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M1_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M1_C10_US Source {Wifi5_AC_S3_1_10CLI}
keylset TCP_5_80_S3_M1_C10_US Destination {Eth}
#TCP_5_80_S3_M0_C10_DS
set TCP_5_80_S3_M0_C10_DS ${tcp_goodput}
keylset TCP_5_80_S3_M0_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M0_C10_DS Source {Eth}
keylset TCP_5_80_S3_M0_C10_DS Destination {Wifi5_AC_S3_0_10CLI}
#TCP_5_80_S3_M0_C10_US
set TCP_5_80_S3_M0_C10_US ${tcp_goodput}
keylset TCP_5_80_S3_M0_C10_US Direction {Unidirectional}
keylset TCP_5_80_S3_M0_C10_US Source {Wifi5_AC_S3_0_10CLI}
keylset TCP_5_80_S3_M0_C10_US Destination {Eth}



#TCP_5_80_S3_M9_C25_DS
set TCP_5_80_S3_M9_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M9_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M9_C25_DS Source {Eth}
keylset TCP_5_80_S3_M9_C25_DS Destination {Wifi5_AC_S3_9_25CLI}
#TCP_5_80_S3_M9_C25_US
set TCP_5_80_S3_M9_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M9_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M9_C25_US Source {Wifi5_AC_S3_9_25CLI}
keylset TCP_5_80_S3_M9_C25_US Destination {Eth}
#TCP_5_80_S3_M8_C25_DS
set TCP_5_80_S3_M8_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M8_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M8_C25_DS Source {Eth}
keylset TCP_5_80_S3_M8_C25_DS Destination {Wifi5_AC_S3_8_25CLI}
#TCP_5_80_S3_M8_C25_US
set TCP_5_80_S3_M8_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M8_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M8_C25_US Source {Wifi5_AC_S3_8_25CLI}
keylset TCP_5_80_S3_M8_C25_US Destination {Eth}
#TCP_5_80_S3_M7_C25_DS
set TCP_5_80_S3_M7_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M7_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M7_C25_DS Source {Eth}
keylset TCP_5_80_S3_M7_C25_DS Destination {Wifi5_AC_S3_7_25CLI}
#TCP_5_80_S3_M7_C25_US
set TCP_5_80_S3_M7_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M7_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M7_C25_US Source {Wifi5_AC_S3_7_25CLI}
keylset TCP_5_80_S3_M7_C25_US Destination {Eth}
##TCP_5_80_S3_M6_C25_DS
#set TCP_5_80_S3_M6_C25_DS ${tcp_goodput}
#keylset TCP_5_80_S3_M6_C25_DS Direction {Unidirectional}
#keylset TCP_5_80_S3_M6_C25_DS Source {Eth}
#keylset TCP_5_80_S3_M6_C25_DS Destination {Wifi5_AC_S3_6_25CLI}
##TCP_5_80_S3_M6_C25_US
#set TCP_5_80_S3_M6_C25_US ${tcp_goodput}
#keylset TCP_5_80_S3_M6_C25_US Direction {Unidirectional}
#keylset TCP_5_80_S3_M6_C25_US Source {Wifi5_AC_S3_6_25CLI}
#keylset TCP_5_80_S3_M6_C25_US Destination {Eth}
#TCP_5_80_S3_M5_C25_DS
set TCP_5_80_S3_M5_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M5_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M5_C25_DS Source {Eth}
keylset TCP_5_80_S3_M5_C25_DS Destination {Wifi5_AC_S3_5_25CLI}
#TCP_5_80_S3_M5_C25_US
set TCP_5_80_S3_M5_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M5_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M5_C25_US Source {Wifi5_AC_S3_5_25CLI}
keylset TCP_5_80_S3_M5_C25_US Destination {Eth}
#TCP_5_80_S3_M4_C25_DS
set TCP_5_80_S3_M4_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M4_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M4_C25_DS Source {Eth}
keylset TCP_5_80_S3_M4_C25_DS Destination {Wifi5_AC_S3_4_25CLI}
#TCP_5_80_S3_M4_C25_US
set TCP_5_80_S3_M4_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M4_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M4_C25_US Source {Wifi5_AC_S3_4_25CLI}
keylset TCP_5_80_S3_M4_C25_US Destination {Eth}
#TCP_5_80_S3_M3_C25_DS
set TCP_5_80_S3_M3_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M3_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M3_C25_DS Source {Eth}
keylset TCP_5_80_S3_M3_C25_DS Destination {Wifi5_AC_S3_3_25CLI}
#TCP_5_80_S3_M3_C25_US
set TCP_5_80_S3_M3_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M3_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M3_C25_US Source {Wifi5_AC_S3_3_25CLI}
keylset TCP_5_80_S3_M3_C25_US Destination {Eth}
#TCP_5_80_S3_M2_C25_DS
set TCP_5_80_S3_M2_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M2_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M2_C25_DS Source {Eth}
keylset TCP_5_80_S3_M2_C25_DS Destination {Wifi5_AC_S3_2_25CLI}
#TCP_5_80_S3_M2_C25_US
set TCP_5_80_S3_M2_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M2_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M2_C25_US Source {Wifi5_AC_S3_2_25CLI}
keylset TCP_5_80_S3_M2_C25_US Destination {Eth}
#TCP_5_80_S3_M1_C25_DS
set TCP_5_80_S3_M1_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M1_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M1_C25_DS Source {Eth}
keylset TCP_5_80_S3_M1_C25_DS Destination {Wifi5_AC_S3_1_25CLI}
#TCP_5_80_S3_M1_C25_US
set TCP_5_80_S3_M1_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M1_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M1_C25_US Source {Wifi5_AC_S3_1_25CLI}
keylset TCP_5_80_S3_M1_C25_US Destination {Eth}
#TCP_5_80_S3_M0_C25_DS
set TCP_5_80_S3_M0_C25_DS ${tcp_goodput}
keylset TCP_5_80_S3_M0_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S3_M0_C25_DS Source {Eth}
keylset TCP_5_80_S3_M0_C25_DS Destination {Wifi5_AC_S3_0_25CLI}
#TCP_5_80_S3_M0_C25_US
set TCP_5_80_S3_M0_C25_US ${tcp_goodput}
keylset TCP_5_80_S3_M0_C25_US Direction {Unidirectional}
keylset TCP_5_80_S3_M0_C25_US Source {Wifi5_AC_S3_0_25CLI}
keylset TCP_5_80_S3_M0_C25_US Destination {Eth}



#TCP_5_80_S4_M9_C1_DS
set TCP_5_80_S4_M9_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M9_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M9_C1_DS Source {Eth}
keylset TCP_5_80_S4_M9_C1_DS Destination {Wifi5_AC_S4_9_1CLI}
#TCP_5_80_S4_M9_C1_US
set TCP_5_80_S4_M9_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M9_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M9_C1_US Source {Wifi5_AC_S4_9_1CLI}
keylset TCP_5_80_S4_M9_C1_US Destination {Eth}
#TCP_5_80_S4_M8_C1_DS
set TCP_5_80_S4_M8_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M8_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M8_C1_DS Source {Eth}
keylset TCP_5_80_S4_M8_C1_DS Destination {Wifi5_AC_S4_8_1CLI}
#TCP_5_80_S4_M8_C1_US
set TCP_5_80_S4_M8_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M8_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M8_C1_US Source {Wifi5_AC_S4_8_1CLI}
keylset TCP_5_80_S4_M8_C1_US Destination {Eth}
#TCP_5_80_S4_M7_C1_DS
set TCP_5_80_S4_M7_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M7_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M7_C1_DS Source {Eth}
keylset TCP_5_80_S4_M7_C1_DS Destination {Wifi5_AC_S4_7_1CLI}
#TCP_5_80_S4_M7_C1_US
set TCP_5_80_S4_M7_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M7_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M7_C1_US Source {Wifi5_AC_S4_7_1CLI}
keylset TCP_5_80_S4_M7_C1_US Destination {Eth}
#TCP_5_80_S4_M6_C1_DS
set TCP_5_80_S4_M6_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M6_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M6_C1_DS Source {Eth}
keylset TCP_5_80_S4_M6_C1_DS Destination {Wifi5_AC_S4_6_1CLI}
#TCP_5_80_S4_M6_C1_US
set TCP_5_80_S4_M6_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M6_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M6_C1_US Source {Wifi5_AC_S4_6_1CLI}
keylset TCP_5_80_S4_M6_C1_US Destination {Eth}
#TCP_5_80_S4_M5_C1_DS
set TCP_5_80_S4_M5_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M5_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M5_C1_DS Source {Eth}
keylset TCP_5_80_S4_M5_C1_DS Destination {Wifi5_AC_S4_5_1CLI}
#TCP_5_80_S4_M5_C1_US
set TCP_5_80_S4_M5_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M5_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M5_C1_US Source {Wifi5_AC_S4_5_1CLI}
keylset TCP_5_80_S4_M5_C1_US Destination {Eth}
#TCP_5_80_S4_M4_C1_DS
set TCP_5_80_S4_M4_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M4_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M4_C1_DS Source {Eth}
keylset TCP_5_80_S4_M4_C1_DS Destination {Wifi5_AC_S4_4_1CLI}
#TCP_5_80_S4_M4_C1_US
set TCP_5_80_S4_M4_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M4_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M4_C1_US Source {Wifi5_AC_S4_4_1CLI}
keylset TCP_5_80_S4_M4_C1_US Destination {Eth}
#TCP_5_80_S4_M3_C1_DS
set TCP_5_80_S4_M3_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M3_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M3_C1_DS Source {Eth}
keylset TCP_5_80_S4_M3_C1_DS Destination {Wifi5_AC_S4_3_1CLI}
#TCP_5_80_S4_M3_C1_US
set TCP_5_80_S4_M3_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M3_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M3_C1_US Source {Wifi5_AC_S4_3_1CLI}
keylset TCP_5_80_S4_M3_C1_US Destination {Eth}
#TCP_5_80_S4_M2_C1_DS
set TCP_5_80_S4_M2_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M2_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M2_C1_DS Source {Eth}
keylset TCP_5_80_S4_M2_C1_DS Destination {Wifi5_AC_S4_2_1CLI}
#TCP_5_80_S4_M2_C1_US
set TCP_5_80_S4_M2_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M2_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M2_C1_US Source {Wifi5_AC_S4_2_1CLI}
keylset TCP_5_80_S4_M2_C1_US Destination {Eth}
#TCP_5_80_S4_M1_C1_DS
set TCP_5_80_S4_M1_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M1_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M1_C1_DS Source {Eth}
keylset TCP_5_80_S4_M1_C1_DS Destination {Wifi5_AC_S4_1_1CLI}
#TCP_5_80_S4_M1_C1_US
set TCP_5_80_S4_M1_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M1_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M1_C1_US Source {Wifi5_AC_S4_1_1CLI}
keylset TCP_5_80_S4_M1_C1_US Destination {Eth}
#TCP_5_80_S4_M0_C1_DS
set TCP_5_80_S4_M0_C1_DS ${tcp_goodput}
keylset TCP_5_80_S4_M0_C1_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M0_C1_DS Source {Eth}
keylset TCP_5_80_S4_M0_C1_DS Destination {Wifi5_AC_S4_0_1CLI}
#TCP_5_80_S4_M0_C1_US
set TCP_5_80_S4_M0_C1_US ${tcp_goodput}
keylset TCP_5_80_S4_M0_C1_US Direction {Unidirectional}
keylset TCP_5_80_S4_M0_C1_US Source {Wifi5_AC_S4_0_1CLI}
keylset TCP_5_80_S4_M0_C1_US Destination {Eth}





#TCP_5_80_S4_M9_C10_DS
set TCP_5_80_S4_M9_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M9_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M9_C10_DS Source {Eth}
keylset TCP_5_80_S4_M9_C10_DS Destination {Wifi5_AC_S4_9_10CLI}
#TCP_5_80_S4_M9_C10_US
set TCP_5_80_S4_M9_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M9_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M9_C10_US Source {Wifi5_AC_S4_9_10CLI}
keylset TCP_5_80_S4_M9_C10_US Destination {Eth}
#TCP_5_80_S4_M8_C10_DS
set TCP_5_80_S4_M8_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M8_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M8_C10_DS Source {Eth}
keylset TCP_5_80_S4_M8_C10_DS Destination {Wifi5_AC_S4_8_10CLI}
#TCP_5_80_S4_M8_C10_US
set TCP_5_80_S4_M8_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M8_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M8_C10_US Source {Wifi5_AC_S4_8_10CLI}
keylset TCP_5_80_S4_M8_C10_US Destination {Eth}
#TCP_5_80_S4_M7_C10_DS
set TCP_5_80_S4_M7_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M7_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M7_C10_DS Source {Eth}
keylset TCP_5_80_S4_M7_C10_DS Destination {Wifi5_AC_S4_7_10CLI}
#TCP_5_80_S4_M7_C10_US
set TCP_5_80_S4_M7_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M7_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M7_C10_US Source {Wifi5_AC_S4_7_10CLI}
keylset TCP_5_80_S4_M7_C10_US Destination {Eth}
#TCP_5_80_S4_M6_C10_DS
set TCP_5_80_S4_M6_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M6_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M6_C10_DS Source {Eth}
keylset TCP_5_80_S4_M6_C10_DS Destination {Wifi5_AC_S4_6_10CLI}
#TCP_5_80_S4_M6_C10_US
set TCP_5_80_S4_M6_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M6_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M6_C10_US Source {Wifi5_AC_S4_6_10CLI}
keylset TCP_5_80_S4_M6_C10_US Destination {Eth}
#TCP_5_80_S4_M5_C10_DS
set TCP_5_80_S4_M5_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M5_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M5_C10_DS Source {Eth}
keylset TCP_5_80_S4_M5_C10_DS Destination {Wifi5_AC_S4_5_10CLI}
#TCP_5_80_S4_M5_C10_US
set TCP_5_80_S4_M5_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M5_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M5_C10_US Source {Wifi5_AC_S4_5_10CLI}
keylset TCP_5_80_S4_M5_C10_US Destination {Eth}
#TCP_5_80_S4_M4_C10_DS
set TCP_5_80_S4_M4_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M4_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M4_C10_DS Source {Eth}
keylset TCP_5_80_S4_M4_C10_DS Destination {Wifi5_AC_S4_4_10CLI}
#TCP_5_80_S4_M4_C10_US
set TCP_5_80_S4_M4_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M4_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M4_C10_US Source {Wifi5_AC_S4_4_10CLI}
keylset TCP_5_80_S4_M4_C10_US Destination {Eth}
#TCP_5_80_S4_M3_C10_DS
set TCP_5_80_S4_M3_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M3_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M3_C10_DS Source {Eth}
keylset TCP_5_80_S4_M3_C10_DS Destination {Wifi5_AC_S4_3_10CLI}
#TCP_5_80_S4_M3_C10_US
set TCP_5_80_S4_M3_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M3_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M3_C10_US Source {Wifi5_AC_S4_3_10CLI}
keylset TCP_5_80_S4_M3_C10_US Destination {Eth}
#TCP_5_80_S4_M2_C10_DS
set TCP_5_80_S4_M2_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M2_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M2_C10_DS Source {Eth}
keylset TCP_5_80_S4_M2_C10_DS Destination {Wifi5_AC_S4_2_10CLI}
#TCP_5_80_S4_M2_C10_US
set TCP_5_80_S4_M2_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M2_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M2_C10_US Source {Wifi5_AC_S4_2_10CLI}
keylset TCP_5_80_S4_M2_C10_US Destination {Eth}
#TCP_5_80_S4_M1_C10_DS
set TCP_5_80_S4_M1_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M1_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M1_C10_DS Source {Eth}
keylset TCP_5_80_S4_M1_C10_DS Destination {Wifi5_AC_S4_1_10CLI}
#TCP_5_80_S4_M1_C10_US
set TCP_5_80_S4_M1_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M1_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M1_C10_US Source {Wifi5_AC_S4_1_10CLI}
keylset TCP_5_80_S4_M1_C10_US Destination {Eth}
#TCP_5_80_S4_M0_C10_DS
set TCP_5_80_S4_M0_C10_DS ${tcp_goodput}
keylset TCP_5_80_S4_M0_C10_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M0_C10_DS Source {Eth}
keylset TCP_5_80_S4_M0_C10_DS Destination {Wifi5_AC_S4_0_10CLI}

#TCP_5_80_S4_M0_C10_US
set TCP_5_80_S4_M0_C10_US ${tcp_goodput}
keylset TCP_5_80_S4_M0_C10_US Direction {Unidirectional}
keylset TCP_5_80_S4_M0_C10_US Source {Wifi5_AC_S4_0_10CLI}
keylset TCP_5_80_S4_M0_C10_US Destination {Eth}




#TCP_5_80_S4_M9_C25_DS
set TCP_5_80_S4_M9_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M9_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M9_C25_DS Source {Eth}
keylset TCP_5_80_S4_M9_C25_DS Destination {Wifi5_AC_S4_9_25CLI}

#TCP_5_80_S4_M9_C25_US
set TCP_5_80_S4_M9_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M9_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M9_C25_US Source {Wifi5_AC_S4_9_25CLI}
keylset TCP_5_80_S4_M9_C25_US Destination {Eth}

#TCP_5_80_S4_M8_C25_DS
set TCP_5_80_S4_M8_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M8_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M8_C25_DS Source {Eth}
keylset TCP_5_80_S4_M8_C25_DS Destination {Wifi5_AC_S4_8_25CLI}
#TCP_5_80_S4_M8_C25_US
set TCP_5_80_S4_M8_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M8_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M8_C25_US Source {Wifi5_AC_S4_8_25CLI}
keylset TCP_5_80_S4_M8_C25_US Destination {Eth}
#TCP_5_80_S4_M7_C25_DS
set TCP_5_80_S4_M7_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M7_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M7_C25_DS Source {Eth}
keylset TCP_5_80_S4_M7_C25_DS Destination {Wifi5_AC_S4_7_25CLI}
#TCP_5_80_S4_M7_C25_US
set TCP_5_80_S4_M7_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M7_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M7_C25_US Source {Wifi5_AC_S4_7_25CLI}
keylset TCP_5_80_S4_M7_C25_US Destination {Eth}
#TCP_5_80_S4_M6_C25_DS
set TCP_5_80_S4_M6_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M6_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M6_C25_DS Source {Eth}
keylset TCP_5_80_S4_M6_C25_DS Destination {Wifi5_AC_S4_6_25CLI}
#TCP_5_80_S4_M6_C25_US
set TCP_5_80_S4_M6_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M6_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M6_C25_US Source {Wifi5_AC_S4_6_25CLI}
keylset TCP_5_80_S4_M6_C25_US Destination {Eth}
#TCP_5_80_S4_M5_C25_DS
set TCP_5_80_S4_M5_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M5_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M5_C25_DS Source {Eth}
keylset TCP_5_80_S4_M5_C25_DS Destination {Wifi5_AC_S4_5_25CLI}
#TCP_5_80_S4_M5_C25_US
set TCP_5_80_S4_M5_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M5_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M5_C25_US Source {Wifi5_AC_S4_5_25CLI}
keylset TCP_5_80_S4_M5_C25_US Destination {Eth}
#TCP_5_80_S4_M4_C25_DS
set TCP_5_80_S4_M4_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M4_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M4_C25_DS Source {Eth}
keylset TCP_5_80_S4_M4_C25_DS Destination {Wifi5_AC_S4_4_25CLI}

#TCP_5_80_S4_M4_C25_US
set TCP_5_80_S4_M4_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M4_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M4_C25_US Source {Wifi5_AC_S4_4_25CLI}
keylset TCP_5_80_S4_M4_C25_US Destination {Eth}

#TCP_5_80_S4_M3_C25_DS
set TCP_5_80_S4_M3_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M3_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M3_C25_DS Source {Eth}
keylset TCP_5_80_S4_M3_C25_DS Destination {Wifi5_AC_S4_3_25CLI}
#TCP_5_80_S4_M3_C25_US
set TCP_5_80_S4_M3_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M3_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M3_C25_US Source {Wifi5_AC_S4_3_25CLI}
keylset TCP_5_80_S4_M3_C25_US Destination {Eth}
#TCP_5_80_S4_M2_C25_DS
set TCP_5_80_S4_M2_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M2_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M2_C25_DS Source {Eth}
keylset TCP_5_80_S4_M2_C25_DS Destination {Wifi5_AC_S4_2_25CLI}
#TCP_5_80_S4_M2_C25_US
set TCP_5_80_S4_M2_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M2_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M2_C25_US Source {Wifi5_AC_S4_2_25CLI}
keylset TCP_5_80_S4_M2_C25_US Destination {Eth}
#TCP_5_80_S4_M1_C25_DS
set TCP_5_80_S4_M1_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M1_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M1_C25_DS Source {Eth}
keylset TCP_5_80_S4_M1_C25_DS Destination {Wifi5_AC_S4_1_25CLI}
#TCP_5_80_S4_M1_C25_US
set TCP_5_80_S4_M1_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M1_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M1_C25_US Source {Wifi5_AC_S4_1_25CLI}
keylset TCP_5_80_S4_M1_C25_US Destination {Eth}
#TCP_5_80_S4_M0_C25_DS
set TCP_5_80_S4_M0_C25_DS ${tcp_goodput}
keylset TCP_5_80_S4_M0_C25_DS Direction {Unidirectional}
keylset TCP_5_80_S4_M0_C25_DS Source {Eth}
keylset TCP_5_80_S4_M0_C25_DS Destination {Wifi5_AC_S4_0_25CLI}

#TCP_5_80_S4_M0_C25_US
set TCP_5_80_S4_M0_C25_US ${tcp_goodput}
keylset TCP_5_80_S4_M0_C25_US Direction {Unidirectional}
keylset TCP_5_80_S4_M0_C25_US Source {Wifi5_AC_S4_0_25CLI}
keylset TCP_5_80_S4_M0_C25_US Destination {Eth}





############ OLD


#TCP_DB_M31_C1_DS
set TCP_DB_M31_C1_DS ${tcp_goodput}
keylset TCP_DB_M31_C1_DS Direction {Unidirectional}
keylset TCP_DB_M31_C1_DS Source {Eth}
keylset TCP_DB_M31_C1_DS Destination {Wifi2_31_1CLI Wifi5_40_31_1CLI}
keylset TCP_DB_M31_C1_DS TrialDuration 15
keylset TCP_DB_M31_C1_DS TestDurationSec 15
#TCP_DB_M31_C1_US
set TCP_DB_M31_C1_US ${tcp_goodput}
keylset TCP_DB_M31_C1_US Direction {Unidirectional}
keylset TCP_DB_M31_C1_US Source {Wifi2_31_1CLI Wifi5_40_31_1CLI}
keylset TCP_DB_M31_C1_US Destination {Eth}
keylset TCP_DB_M31_C1_US TrialDuration 15
keylset TCP_DB_M31_C1_US TestDurationSec 15
#TCP_DB_M30_C1_DS
set TCP_DB_M30_C1_DS ${tcp_goodput}
keylset TCP_DB_M30_C1_DS Direction {Unidirectional}
keylset TCP_DB_M30_C1_DS Source {Eth}
keylset TCP_DB_M30_C1_DS Destination {Wifi2_30_1CLI Wifi5_40_30_1CLI}
#TCP_DB_M30_C1_US
set TCP_DB_M30_C1_US ${tcp_goodput}
keylset TCP_DB_M30_C1_US Direction {Unidirectional}
keylset TCP_DB_M30_C1_US Source {Wifi2_30_1CLI Wifi5_40_30_1CLI}
keylset TCP_DB_M30_C1_US Destination {Eth}
#TCP_DB_M29_C1_DS
set TCP_DB_M29_C1_DS ${tcp_goodput}
keylset TCP_DB_M29_C1_DS Direction {Unidirectional}
keylset TCP_DB_M29_C1_DS Source {Eth}
keylset TCP_DB_M29_C1_DS Destination {Wifi2_29_1CLI Wifi5_40_29_1CLI}
#TCP_DB_M29_C1_US
set TCP_DB_M29_C1_US ${tcp_goodput}
keylset TCP_DB_M29_C1_US Direction {Unidirectional}
keylset TCP_DB_M29_C1_US Source {Wifi2_29_1CLI Wifi5_40_29_1CLI}
keylset TCP_DB_M29_C1_US Destination {Eth}
#TCP_DB_M28_C1_DS
set TCP_DB_M28_C1_DS ${tcp_goodput}
keylset TCP_DB_M28_C1_DS Direction {Unidirectional}
keylset TCP_DB_M28_C1_DS Source {Eth}
keylset TCP_DB_M28_C1_DS Destination {Wifi2_28_1CLI Wifi5_40_28_1CLI}
#TCP_DB_M28_C1_US
set TCP_DB_M28_C1_US ${tcp_goodput}
keylset TCP_DB_M28_C1_US Direction {Unidirectional}
keylset TCP_DB_M28_C1_US Source {Wifi2_28_1CLI Wifi5_40_28_1CLI}
keylset TCP_DB_M28_C1_US Destination {Eth}
#TCP_DB_M27_C1_DS
set TCP_DB_M27_C1_DS ${tcp_goodput}
keylset TCP_DB_M27_C1_DS Direction {Unidirectional}
keylset TCP_DB_M27_C1_DS Source {Eth}
keylset TCP_DB_M27_C1_DS Destination {Wifi2_27_1CLI Wifi5_40_27_1CLI}
#TCP_DB_M27_C1_US
set TCP_DB_M27_C1_US ${tcp_goodput}
keylset TCP_DB_M27_C1_US Direction {Unidirectional}
keylset TCP_DB_M27_C1_US Source {Wifi2_27_1CLI Wifi5_40_27_1CLI}
keylset TCP_DB_M27_C1_US Destination {Eth}
#TCP_DB_M26_C1_DS
set TCP_DB_M26_C1_DS ${tcp_goodput}
keylset TCP_DB_M26_C1_DS Direction {Unidirectional}
keylset TCP_DB_M26_C1_DS Source {Eth}
keylset TCP_DB_M26_C1_DS Destination {Wifi2_26_1CLI Wifi5_40_26_1CLI}
#TCP_DB_M26_C1_US
set TCP_DB_M26_C1_US ${tcp_goodput}
keylset TCP_DB_M26_C1_US Direction {Unidirectional}
keylset TCP_DB_M26_C1_US Source {Wifi2_26_1CLI Wifi5_40_26_1CLI}
keylset TCP_DB_M26_C1_US Destination {Eth}
#TCP_DB_M25_C1_DS
set TCP_DB_M25_C1_DS ${tcp_goodput}
keylset TCP_DB_M25_C1_DS Direction {Unidirectional}
keylset TCP_DB_M25_C1_DS Source {Eth}
keylset TCP_DB_M25_C1_DS Destination {Wifi2_25_1CLI Wifi5_40_25_1CLI}
#TCP_DB_M25_C1_US
set TCP_DB_M25_C1_US ${tcp_goodput}
keylset TCP_DB_M25_C1_US Direction {Unidirectional}
keylset TCP_DB_M25_C1_US Source {Wifi2_25_1CLI Wifi5_40_25_1CLI}
keylset TCP_DB_M25_C1_US Destination {Eth}
#TCP_DB_M24_C1_DS
set TCP_DB_M24_C1_DS ${tcp_goodput}
keylset TCP_DB_M24_C1_DS Direction {Unidirectional}
keylset TCP_DB_M24_C1_DS Source {Eth}
keylset TCP_DB_M24_C1_DS Destination {Wifi2_24_1CLI Wifi5_40_24_1CLI}
#TCP_DB_M24_C1_US
set TCP_DB_M24_C1_US ${tcp_goodput}
keylset TCP_DB_M24_C1_US Direction {Unidirectional}
keylset TCP_DB_M24_C1_US Source {Wifi2_24_1CLI Wifi5_40_24_1CLI}
keylset TCP_DB_M24_C1_US Destination {Eth}
#TCP_DB_M23_C1_DS
set TCP_DB_M23_C1_DS ${tcp_goodput}
keylset TCP_DB_M23_C1_DS Direction {Unidirectional}
keylset TCP_DB_M23_C1_DS Source {Eth}
keylset TCP_DB_M23_C1_DS Destination {Wifi2_23_1CLI Wifi5_40_23_1CLI}
keylset TCP_DB_M23_C1_DS TrialDuration 15
keylset TCP_DB_M23_C1_DS TestDurationSec 15
#TCP_DB_M23_C1_US
set TCP_DB_M23_C1_US ${tcp_goodput}
keylset TCP_DB_M23_C1_US Direction {Unidirectional}
keylset TCP_DB_M23_C1_US Source {Wifi2_23_1CLI Wifi5_40_23_1CLI}
keylset TCP_DB_M23_C1_US Destination {Eth}
keylset TCP_DB_M23_C1_US TrialDuration 15
keylset TCP_DB_M23_C1_US TestDurationSec 15
#TCP_DB_M23_C1_BI
set TCP_DB_M23_C1_BI ${tcp_goodput}
keylset TCP_DB_M23_C1_BI Direction {Bidirectional}
keylset TCP_DB_M23_C1_BI Source {Eth}
keylset TCP_DB_M23_C1_BI Destination {Wifi2_23_1CLI Wifi5_40_23_1CLI}
keylset TCP_DB_M23_C1_BI TrialDuration 15
keylset TCP_DB_M23_C1_BI TestDurationSec 15
#TCP_DB_M22_C1_DS
set TCP_DB_M22_C1_DS ${tcp_goodput}
keylset TCP_DB_M22_C1_DS Direction {Unidirectional}
keylset TCP_DB_M22_C1_DS Source {Eth}
keylset TCP_DB_M22_C1_DS Destination {Wifi2_22_1CLI Wifi5_40_22_1CLI}
#TCP_DB_M22_C1_US
set TCP_DB_M22_C1_US ${tcp_goodput}
keylset TCP_DB_M22_C1_US Direction {Unidirectional}
keylset TCP_DB_M22_C1_US Source {Wifi2_22_1CLI Wifi5_40_22_1CLI}
keylset TCP_DB_M22_C1_US Destination {Eth}
#TCP_DB_M22_C1_BI
set TCP_DB_M22_C1_BI ${tcp_goodput}
keylset TCP_DB_M22_C1_BI Direction {Bidirectional}
keylset TCP_DB_M22_C1_BI Source {Eth}
keylset TCP_DB_M22_C1_BI Destination {Wifi2_22_1CLI Wifi5_40_22_1CLI}
#TCP_DB_M21_C1_DS
set TCP_DB_M21_C1_DS ${tcp_goodput}
keylset TCP_DB_M21_C1_DS Direction {Unidirectional}
keylset TCP_DB_M21_C1_DS Source {Eth}
keylset TCP_DB_M21_C1_DS Destination {Wifi2_21_1CLI Wifi5_40_21_1CLI}
#TCP_DB_M21_C1_US
set TCP_DB_M21_C1_US ${tcp_goodput}
keylset TCP_DB_M21_C1_US Direction {Unidirectional}
keylset TCP_DB_M21_C1_US Source {Wifi2_21_1CLI Wifi5_40_21_1CLI}
keylset TCP_DB_M21_C1_US Destination {Eth}
#TCP_DB_M21_C1_BI
set TCP_DB_M21_C1_BI ${tcp_goodput}
keylset TCP_DB_M21_C1_BI Direction {Bidirectional}
keylset TCP_DB_M21_C1_BI Source {Eth}
keylset TCP_DB_M21_C1_BI Destination {Wifi2_21_1CLI Wifi5_40_21_1CLI}
#TCP_DB_M20_C1_DS
set TCP_DB_M20_C1_DS ${tcp_goodput}
keylset TCP_DB_M20_C1_DS Direction {Unidirectional}
keylset TCP_DB_M20_C1_DS Source {Eth}
keylset TCP_DB_M20_C1_DS Destination {Wifi2_20_1CLI Wifi5_40_20_1CLI}
#TCP_DB_M20_C1_US
set TCP_DB_M20_C1_US ${tcp_goodput}
keylset TCP_DB_M20_C1_US Direction {Unidirectional}
keylset TCP_DB_M20_C1_US Source {Wifi2_20_1CLI Wifi5_40_20_1CLI}
keylset TCP_DB_M20_C1_US Destination {Eth}
#TCP_DB_M20_C1_BI
set TCP_DB_M20_C1_BI ${tcp_goodput}
keylset TCP_DB_M20_C1_BI Direction {Bidirectional}
keylset TCP_DB_M20_C1_BI Source {Eth}
keylset TCP_DB_M20_C1_BI Destination {Wifi2_20_1CLI Wifi5_40_20_1CLI}
#TCP_DB_M19_C1_DS
set TCP_DB_M19_C1_DS ${tcp_goodput}
keylset TCP_DB_M19_C1_DS Direction {Unidirectional}
keylset TCP_DB_M19_C1_DS Source {Eth}
keylset TCP_DB_M19_C1_DS Destination {Wifi2_19_1CLI Wifi5_40_19_1CLI}
#TCP_DB_M19_C1_US
set TCP_DB_M19_C1_US ${tcp_goodput}
keylset TCP_DB_M19_C1_US Direction {Unidirectional}
keylset TCP_DB_M19_C1_US Source {Wifi2_19_1CLI Wifi5_40_19_1CLI}
keylset TCP_DB_M19_C1_US Destination {Eth}
#TCP_DB_M19_C1_BI
set TCP_DB_M19_C1_BI ${tcp_goodput}
keylset TCP_DB_M19_C1_BI Direction {Bidirectional}
keylset TCP_DB_M19_C1_BI Source {Eth}
keylset TCP_DB_M19_C1_BI Destination {Wifi2_19_1CLI Wifi5_40_19_1CLI}
#TCP_DB_M18_C1_DS
set TCP_DB_M18_C1_DS ${tcp_goodput}
keylset TCP_DB_M18_C1_DS Direction {Unidirectional}
keylset TCP_DB_M18_C1_DS Source {Eth}
keylset TCP_DB_M18_C1_DS Destination {Wifi2_18_1CLI Wifi5_40_18_1CLI}
#TCP_DB_M18_C1_US
set TCP_DB_M18_C1_US ${tcp_goodput}
keylset TCP_DB_M18_C1_US Direction {Unidirectional}
keylset TCP_DB_M18_C1_US Source {Wifi2_18_1CLI Wifi5_40_18_1CLI}
keylset TCP_DB_M18_C1_US Destination {Eth}
#TCP_DB_M18_C1_BI
set TCP_DB_M18_C1_BI ${tcp_goodput}
keylset TCP_DB_M18_C1_BI Direction {Bidirectional}
keylset TCP_DB_M18_C1_BI Source {Eth}
keylset TCP_DB_M18_C1_BI Destination {Wifi2_18_1CLI Wifi5_40_18_1CLI}
#TCP_DB_M17_C1_DS
set TCP_DB_M17_C1_DS ${tcp_goodput}
keylset TCP_DB_M17_C1_DS Direction {Unidirectional}
keylset TCP_DB_M17_C1_DS Source {Eth}
keylset TCP_DB_M17_C1_DS Destination {Wifi2_17_1CLI Wifi5_40_17_1CLI}
#TCP_DB_M17_C1_US
set TCP_DB_M17_C1_US ${tcp_goodput}
keylset TCP_DB_M17_C1_US Direction {Unidirectional}
keylset TCP_DB_M17_C1_US Source {Wifi2_17_1CLI Wifi5_40_17_1CLI}
keylset TCP_DB_M17_C1_US Destination {Eth}
#TCP_DB_M17_C1_BI
set TCP_DB_M17_C1_BI ${tcp_goodput}
keylset TCP_DB_M17_C1_BI Direction {Bidirectional}
keylset TCP_DB_M17_C1_BI Source {Eth}
keylset TCP_DB_M17_C1_BI Destination {Wifi2_17_1CLI Wifi5_40_17_1CLI}
#TCP_DB_M16_C1_DS
set TCP_DB_M16_C1_DS ${tcp_goodput}
keylset TCP_DB_M16_C1_DS Direction {Unidirectional}
keylset TCP_DB_M16_C1_DS Source {Eth}
keylset TCP_DB_M16_C1_DS Destination {Wifi2_16_1CLI Wifi5_40_16_1CLI}
#TCP_DB_M16_C1_US
set TCP_DB_M16_C1_US ${tcp_goodput}
keylset TCP_DB_M16_C1_US Direction {Unidirectional}
keylset TCP_DB_M16_C1_US Source {Wifi2_16_1CLI Wifi5_40_16_1CLI}
keylset TCP_DB_M16_C1_US Destination {Eth}
#TCP_DB_M16_C1_BI
set TCP_DB_M16_C1_BI ${tcp_goodput}
keylset TCP_DB_M16_C1_BI Direction {Bidirectional}
keylset TCP_DB_M16_C1_BI Source {Eth}
keylset TCP_DB_M16_C1_BI Destination {Wifi2_16_1CLI Wifi5_40_16_1CLI}
#TCP_DB_M15_C1_DS
set TCP_DB_M15_C1_DS ${tcp_goodput}
keylset TCP_DB_M15_C1_DS Direction {Unidirectional}
keylset TCP_DB_M15_C1_DS Source {Eth}
keylset TCP_DB_M15_C1_DS Destination {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset TCP_DB_M15_C1_DS TrialDuration 15
keylset TCP_DB_M15_C1_DS TestDurationSec 15
#TCP_DB_M15_C1_US
set TCP_DB_M15_C1_US ${tcp_goodput}
keylset TCP_DB_M15_C1_US Direction {Unidirectional}
keylset TCP_DB_M15_C1_US Source {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset TCP_DB_M15_C1_US Destination {Eth}
keylset TCP_DB_M15_C1_US TrialDuration 15
keylset TCP_DB_M15_C1_US TestDurationSec 15
#TCP_DB_M15_C1_BI
set TCP_DB_M15_C1_BI ${tcp_goodput}
keylset TCP_DB_M15_C1_BI Direction {Bidirectional}
keylset TCP_DB_M15_C1_BI Source {Eth}
keylset TCP_DB_M15_C1_BI Destination {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset TCP_DB_M15_C1_BI TrialDuration 15
keylset TCP_DB_M15_C1_BI TestDurationSec 15
#TCP_DB_M14_C1_DS
set TCP_DB_M14_C1_DS ${tcp_goodput}
keylset TCP_DB_M14_C1_DS Direction {Unidirectional}
keylset TCP_DB_M14_C1_DS Source {Eth}
keylset TCP_DB_M14_C1_DS Destination {Wifi2_14_1CLI Wifi5_40_14_1CLI}
#TCP_DB_M14_C1_US
set TCP_DB_M14_C1_US ${tcp_goodput}
keylset TCP_DB_M14_C1_US Direction {Unidirectional}
keylset TCP_DB_M14_C1_US Source {Wifi2_14_1CLI Wifi5_40_14_1CLI}
keylset TCP_DB_M14_C1_US Destination {Eth}
#TCP_DB_M14_C1_BI
set TCP_DB_M14_C1_BI ${tcp_goodput}
keylset TCP_DB_M14_C1_BI Direction {Bidirectional}
keylset TCP_DB_M14_C1_BI Source {Eth}
keylset TCP_DB_M14_C1_BI Destination {Wifi2_14_1CLI Wifi5_40_14_1CLI}
#TCP_DB_M13_C1_DS
set TCP_DB_M13_C1_DS ${tcp_goodput}
keylset TCP_DB_M13_C1_DS Direction {Unidirectional}
keylset TCP_DB_M13_C1_DS Source {Eth}
keylset TCP_DB_M13_C1_DS Destination {Wifi2_13_1CLI Wifi5_40_13_1CLI}
#TCP_DB_M13_C1_US
set TCP_DB_M13_C1_US ${tcp_goodput}
keylset TCP_DB_M13_C1_US Direction {Unidirectional}
keylset TCP_DB_M13_C1_US Source {Wifi2_13_1CLI Wifi5_40_13_1CLI}
keylset TCP_DB_M13_C1_US Destination {Eth}
#TCP_DB_M13_C1_BI
set TCP_DB_M13_C1_BI ${tcp_goodput}
keylset TCP_DB_M13_C1_BI Direction {Bidirectional}
keylset TCP_DB_M13_C1_BI Source {Eth}
keylset TCP_DB_M13_C1_BI Destination {Wifi2_13_1CLI Wifi5_40_13_1CLI}
#TCP_DB_M12_C1_DS
set TCP_DB_M12_C1_DS ${tcp_goodput}
keylset TCP_DB_M12_C1_DS Direction {Unidirectional}
keylset TCP_DB_M12_C1_DS Source {Eth}
keylset TCP_DB_M12_C1_DS Destination {Wifi2_12_1CLI Wifi5_40_12_1CLI}
#TCP_DB_M12_C1_US
set TCP_DB_M12_C1_US ${tcp_goodput}
keylset TCP_DB_M12_C1_US Direction {Unidirectional}
keylset TCP_DB_M12_C1_US Source {Wifi2_12_1CLI Wifi5_40_12_1CLI}
keylset TCP_DB_M12_C1_US Destination {Eth}
#TCP_DB_M12_C1_BI
set TCP_DB_M12_C1_BI ${tcp_goodput}
keylset TCP_DB_M12_C1_BI Direction {Bidirectional}
keylset TCP_DB_M12_C1_BI Source {Eth}
keylset TCP_DB_M12_C1_BI Destination {Wifi2_12_1CLI Wifi5_40_12_1CLI}
#TCP_DB_M11_C1_DS
set TCP_DB_M11_C1_DS ${tcp_goodput}
keylset TCP_DB_M11_C1_DS Direction {Unidirectional}
keylset TCP_DB_M11_C1_DS Source {Eth}
keylset TCP_DB_M11_C1_DS Destination {Wifi2_11_1CLI Wifi5_40_11_1CLI}
#TCP_DB_M11_C1_US
set TCP_DB_M11_C1_US ${tcp_goodput}
keylset TCP_DB_M11_C1_US Direction {Unidirectional}
keylset TCP_DB_M11_C1_US Source {Wifi2_11_1CLI Wifi5_40_11_1CLI}
keylset TCP_DB_M11_C1_US Destination {Eth}
#TCP_DB_M11_C1_BI
set TCP_DB_M11_C1_BI ${tcp_goodput}
keylset TCP_DB_M11_C1_BI Direction {Bidirectional}
keylset TCP_DB_M11_C1_BI Source {Eth}
keylset TCP_DB_M11_C1_BI Destination {Wifi2_11_1CLI Wifi5_40_11_1CLI}
#TCP_DB_M10_C1_DS
set TCP_DB_M10_C1_DS ${tcp_goodput}
keylset TCP_DB_M10_C1_DS Direction {Unidirectional}
keylset TCP_DB_M10_C1_DS Source {Eth}
keylset TCP_DB_M10_C1_DS Destination {Wifi2_10_1CLI Wifi5_40_10_1CLI}
#TCP_DB_M10_C1_US
set TCP_DB_M10_C1_US ${tcp_goodput}
keylset TCP_DB_M10_C1_US Direction {Unidirectional}
keylset TCP_DB_M10_C1_US Source {Wifi2_10_1CLI Wifi5_40_10_1CLI}
keylset TCP_DB_M10_C1_US Destination {Eth}
#TCP_DB_M10_C1_BI
set TCP_DB_M10_C1_BI ${tcp_goodput}
keylset TCP_DB_M10_C1_BI Direction {Bidirectional}
keylset TCP_DB_M10_C1_BI Source {Eth}
keylset TCP_DB_M10_C1_BI Destination {Wifi2_10_1CLI Wifi5_40_10_1CLI}
#TCP_DB_M9_C1_DS
set TCP_DB_M9_C1_DS ${tcp_goodput}
keylset TCP_DB_M9_C1_DS Direction {Unidirectional}
keylset TCP_DB_M9_C1_DS Source {Eth}
keylset TCP_DB_M9_C1_DS Destination {Wifi2_9_1CLI Wifi5_40_9_1CLI}
#TCP_DB_M9_C1_US
set TCP_DB_M9_C1_US ${tcp_goodput}
keylset TCP_DB_M9_C1_US Direction {Unidirectional}
keylset TCP_DB_M9_C1_US Source {Wifi2_9_1CLI Wifi5_40_9_1CLI}
keylset TCP_DB_M9_C1_US Destination {Eth}
#TCP_DB_M9_C1_BI
set TCP_DB_M9_C1_BI ${tcp_goodput}
keylset TCP_DB_M9_C1_BI Direction {Bidirectional}
keylset TCP_DB_M9_C1_BI Source {Eth}
keylset TCP_DB_M9_C1_BI Destination {Wifi2_9_1CLI Wifi5_40_9_1CLI}
#TCP_DB_M8_C1_DS
set TCP_DB_M8_C1_DS ${tcp_goodput}
keylset TCP_DB_M8_C1_DS Direction {Unidirectional}
keylset TCP_DB_M8_C1_DS Source {Eth}
keylset TCP_DB_M8_C1_DS Destination {Wifi2_8_1CLI Wifi5_40_8_1CLI}
#TCP_DB_M8_C1_US
set TCP_DB_M8_C1_US ${tcp_goodput}
keylset TCP_DB_M8_C1_US Direction {Unidirectional}
keylset TCP_DB_M8_C1_US Source {Wifi2_8_1CLI Wifi5_40_8_1CLI}
keylset TCP_DB_M8_C1_US Destination {Eth}
#TCP_DB_M8_C1_BI
set TCP_DB_M8_C1_BI ${tcp_goodput}
keylset TCP_DB_M8_C1_BI Direction {Bidirectional}
keylset TCP_DB_M8_C1_BI Source {Eth}
keylset TCP_DB_M8_C1_BI Destination {Wifi2_8_1CLI Wifi5_40_8_1CLI}
#TCP_DB_M7_C1_DS
set TCP_DB_M7_C1_DS ${tcp_goodput}
keylset TCP_DB_M7_C1_DS Direction {Unidirectional}
keylset TCP_DB_M7_C1_DS Source {Eth}
keylset TCP_DB_M7_C1_DS Destination {Wifi2_7_1CLI Wifi5_40_7_1CLI}
keylset TCP_DB_M7_C1_DS TrialDuration 15
keylset TCP_DB_M7_C1_DS TestDurationSec 15
#TCP_DB_M7_C1_US
set TCP_DB_M7_C1_US ${tcp_goodput}
keylset TCP_DB_M7_C1_US Direction {Unidirectional}
keylset TCP_DB_M7_C1_US Source {Wifi2_7_1CLI Wifi5_40_7_1CLI}
keylset TCP_DB_M7_C1_US Destination {Eth}
keylset TCP_DB_M7_C1_US TrialDuration 15
keylset TCP_DB_M7_C1_US TestDurationSec 15
#TCP_DB_M7_C1_BI
set TCP_DB_M7_C1_BI ${tcp_goodput}
keylset TCP_DB_M7_C1_BI Direction {Bidirectional}
keylset TCP_DB_M7_C1_BI Source {Eth}
keylset TCP_DB_M7_C1_BI Destination {Wifi2_7_1CLI Wifi5_40_7_1CLI}
keylset TCP_DB_M7_C1_BI TrialDuration 15
keylset TCP_DB_M7_C1_BI TestDurationSec 15
#TCP_DB_M6_C1_DS
set TCP_DB_M6_C1_DS ${tcp_goodput}
keylset TCP_DB_M6_C1_DS Direction {Unidirectional}
keylset TCP_DB_M6_C1_DS Source {Eth}
keylset TCP_DB_M6_C1_DS Destination {Wifi2_6_1CLI Wifi5_40_6_1CLI}
#TCP_DB_M6_C1_US
set TCP_DB_M6_C1_US ${tcp_goodput}
keylset TCP_DB_M6_C1_US Direction {Unidirectional}
keylset TCP_DB_M6_C1_US Source {Wifi2_6_1CLI Wifi5_40_6_1CLI}
keylset TCP_DB_M6_C1_US Destination {Eth}
#TCP_DB_M6_C1_BI
set TCP_DB_M6_C1_BI ${tcp_goodput}
keylset TCP_DB_M6_C1_BI Direction {Bidirectional}
keylset TCP_DB_M6_C1_BI Source {Eth}
keylset TCP_DB_M6_C1_BI Destination {Wifi2_6_1CLI Wifi5_40_6_1CLI}
#TCP_DB_M5_C1_DS
set TCP_DB_M5_C1_DS ${tcp_goodput}
keylset TCP_DB_M5_C1_DS Direction {Unidirectional}
keylset TCP_DB_M5_C1_DS Source {Eth}
keylset TCP_DB_M5_C1_DS Destination {Wifi2_5_1CLI Wifi5_40_5_1CLI}
#TCP_DB_M5_C1_US
set TCP_DB_M5_C1_US ${tcp_goodput}
keylset TCP_DB_M5_C1_US Direction {Unidirectional}
keylset TCP_DB_M5_C1_US Source {Wifi2_5_1CLI Wifi5_40_5_1CLI}
keylset TCP_DB_M5_C1_US Destination {Eth}
#TCP_DB_M5_C1_BI
set TCP_DB_M5_C1_BI ${tcp_goodput}
keylset TCP_DB_M5_C1_BI Direction {Bidirectional}
keylset TCP_DB_M5_C1_BI Source {Eth}
keylset TCP_DB_M5_C1_BI Destination {Wifi2_5_1CLI Wifi5_40_5_1CLI}
#TCP_DB_M4_C1_DS
set TCP_DB_M4_C1_DS ${tcp_goodput}
keylset TCP_DB_M4_C1_DS Direction {Unidirectional}
keylset TCP_DB_M4_C1_DS Source {Eth}
keylset TCP_DB_M4_C1_DS Destination {Wifi2_4_1CLI Wifi5_40_4_1CLI}
#TCP_DB_M4_C1_US
set TCP_DB_M4_C1_US ${tcp_goodput}
keylset TCP_DB_M4_C1_US Direction {Unidirectional}
keylset TCP_DB_M4_C1_US Source {Wifi2_4_1CLI Wifi5_40_4_1CLI}
keylset TCP_DB_M4_C1_US Destination {Eth}
#TCP_DB_M4_C1_BI
set TCP_DB_M4_C1_BI ${tcp_goodput}
keylset TCP_DB_M4_C1_BI Direction {Bidirectional}
keylset TCP_DB_M4_C1_BI Source {Eth}
keylset TCP_DB_M4_C1_BI Destination {Wifi2_4_1CLI Wifi5_40_4_1CLI}
#TCP_DB_M3_C1_DS
set TCP_DB_M3_C1_DS ${tcp_goodput}
keylset TCP_DB_M3_C1_DS Direction {Unidirectional}
keylset TCP_DB_M3_C1_DS Source {Eth}
keylset TCP_DB_M3_C1_DS Destination {Wifi2_3_1CLI Wifi5_40_3_1CLI}
#TCP_DB_M3_C1_US
set TCP_DB_M3_C1_US ${tcp_goodput}
keylset TCP_DB_M3_C1_US Direction {Unidirectional}
keylset TCP_DB_M3_C1_US Source {Wifi2_3_1CLI Wifi5_40_3_1CLI}
keylset TCP_DB_M3_C1_US Destination {Eth}
#TCP_DB_M3_C1_BI
set TCP_DB_M3_C1_BI ${tcp_goodput}
keylset TCP_DB_M3_C1_BI Direction {Bidirectional}
keylset TCP_DB_M3_C1_BI Source {Eth}
keylset TCP_DB_M3_C1_BI Destination {Wifi2_3_1CLI Wifi5_40_3_1CLI}
#TCP_DB_M2_C1_DS
set TCP_DB_M2_C1_DS ${tcp_goodput}
keylset TCP_DB_M2_C1_DS Direction {Unidirectional}
keylset TCP_DB_M2_C1_DS Source {Eth}
keylset TCP_DB_M2_C1_DS Destination {Wifi2_2_1CLI Wifi5_40_2_1CLI}
#TCP_DB_M2_C1_US
set TCP_DB_M2_C1_US ${tcp_goodput}
keylset TCP_DB_M2_C1_US Direction {Unidirectional}
keylset TCP_DB_M2_C1_US Source {Wifi2_2_1CLI Wifi5_40_2_1CLI}
keylset TCP_DB_M2_C1_US Destination {Eth}
#TCP_DB_M2_C1_BI
set TCP_DB_M2_C1_BI ${tcp_goodput}
keylset TCP_DB_M2_C1_BI Direction {Bidirectional}
keylset TCP_DB_M2_C1_BI Source {Eth}
keylset TCP_DB_M2_C1_BI Destination {Wifi2_2_1CLI Wifi5_40_2_1CLI}
#TCP_DB_M1_C1_DS
set TCP_DB_M1_C1_DS ${tcp_goodput}
keylset TCP_DB_M1_C1_DS Direction {Unidirectional}
keylset TCP_DB_M1_C1_DS Source {Eth}
keylset TCP_DB_M1_C1_DS Destination {Wifi2_1_1CLI Wifi5_40_1_1CLI}
#TCP_DB_M1_C1_US
set TCP_DB_M1_C1_US ${tcp_goodput}
keylset TCP_DB_M1_C1_US Direction {Unidirectional}
keylset TCP_DB_M1_C1_US Source {Wifi2_1_1CLI Wifi5_40_1_1CLI}
keylset TCP_DB_M1_C1_US Destination {Eth}
#TCP_DB_M1_C1_BI
set TCP_DB_M1_C1_BI ${tcp_goodput}
keylset TCP_DB_M1_C1_BI Direction {Bidirectional}
keylset TCP_DB_M1_C1_BI Source {Eth}
keylset TCP_DB_M1_C1_BI Destination {Wifi2_1_1CLI Wifi5_40_1_1CLI}
#TCP_DB_M0_C1_DS
set TCP_DB_M0_C1_DS ${tcp_goodput}
keylset TCP_DB_M0_C1_DS Direction {Unidirectional}
keylset TCP_DB_M0_C1_DS Source {Eth}
keylset TCP_DB_M0_C1_DS Destination {Wifi2_0_1CLI Wifi5_40_0_1CLI}
#TCP_DB_M0_C1_US
set TCP_DB_M0_C1_US ${tcp_goodput}
keylset TCP_DB_M0_C1_US Direction {Unidirectional}
keylset TCP_DB_M0_C1_US Source {Wifi2_0_1CLI Wifi5_40_0_1CLI}
keylset TCP_DB_M0_C1_US Destination {Eth}
#TCP_DB_M0_C1_BI
set TCP_DB_M0_C1_BI ${tcp_goodput}
keylset TCP_DB_M0_C1_BI Direction {Bidirectional}
keylset TCP_DB_M0_C1_BI Source {Eth}
keylset TCP_DB_M0_C1_BI Destination {Wifi2_0_1CLI Wifi5_40_0_1CLI}
#TCP_DB_MG_C1_DS
set TCP_DB_MG_C1_DS ${tcp_goodput}
keylset TCP_DB_MG_C1_DS Direction {Unidirectional}
keylset TCP_DB_MG_C1_DS Source {Eth}
keylset TCP_DB_MG_C1_DS Destination {Wifi2_G_1CLI Wifi5_20_a_1CLI}
keylset TCP_DB_MG_C1_DS TrialDuration 15
keylset TCP_DB_MG_C1_DS TestDurationSec 15
#TCP_DB_MG_C1_US
set TCP_DB_MG_C1_US ${tcp_goodput}
keylset TCP_DB_MG_C1_US Direction {Unidirectional}
keylset TCP_DB_MG_C1_US Source {Wifi2_G_1CLI Wifi5_20_a_1CLI}
keylset TCP_DB_MG_C1_US Destination {Eth}
keylset TCP_DB_MG_C1_US TrialDuration 15
keylset TCP_DB_MG_C1_US TestDurationSec 15
#TCP_DB_MG_C1_BI
set TCP_DB_MG_C1_BI ${tcp_goodput}
keylset TCP_DB_MG_C1_BI Direction {Bidirectional}
keylset TCP_DB_MG_C1_BI Source {Eth}
keylset TCP_DB_MG_C1_BI Destination {Wifi2_G_1CLI Wifi5_20_a_1CLI}
keylset TCP_DB_MG_C1_BI TrialDuration 15
keylset TCP_DB_MG_C1_BI TestDurationSec 15

#TCP_DB_M31_C10_DS
set TCP_DB_M31_C10_DS ${tcp_goodput}
keylset TCP_DB_M31_C10_DS Direction {Unidirectional}
keylset TCP_DB_M31_C10_DS Source {Eth}
keylset TCP_DB_M31_C10_DS Destination {Wifi2_31_10CLI Wifi5_40_31_10CLI}
keylset TCP_DB_M31_C10_DS TrialDuration 15
keylset TCP_DB_M31_C10_DS TestDurationSec 15
#TCP_DB_M31_C10_US
set TCP_DB_M31_C10_US ${tcp_goodput}
keylset TCP_DB_M31_C10_US Direction {Unidirectional}
keylset TCP_DB_M31_C10_US Source {Wifi2_31_10CLI Wifi5_40_31_10CLI}
keylset TCP_DB_M31_C10_US Destination {Eth}
keylset TCP_DB_M31_C10_US TrialDuration 15
keylset TCP_DB_M31_C10_US TestDurationSec 15
#TCP_DB_M30_C10_DS
set TCP_DB_M30_C10_DS ${tcp_goodput}
keylset TCP_DB_M30_C10_DS Direction {Unidirectional}
keylset TCP_DB_M30_C10_DS Source {Eth}
keylset TCP_DB_M30_C10_DS Destination {Wifi2_30_10CLI Wifi5_40_30_10CLI}
#TCP_DB_M30_C10_US
set TCP_DB_M30_C10_US ${tcp_goodput}
keylset TCP_DB_M30_C10_US Direction {Unidirectional}
keylset TCP_DB_M30_C10_US Source {Wifi2_30_10CLI Wifi5_40_30_10CLI}
keylset TCP_DB_M30_C10_US Destination {Eth}
#TCP_DB_M29_C10_DS
set TCP_DB_M29_C10_DS ${tcp_goodput}
keylset TCP_DB_M29_C10_DS Direction {Unidirectional}
keylset TCP_DB_M29_C10_DS Source {Eth}
keylset TCP_DB_M29_C10_DS Destination {Wifi2_29_10CLI Wifi5_40_29_10CLI}
#TCP_DB_M29_C10_US
set TCP_DB_M29_C10_US ${tcp_goodput}
keylset TCP_DB_M29_C10_US Direction {Unidirectional}
keylset TCP_DB_M29_C10_US Source {Wifi2_29_10CLI Wifi5_40_29_10CLI}
keylset TCP_DB_M29_C10_US Destination {Eth}
#TCP_DB_M28_C10_DS
set TCP_DB_M28_C10_DS ${tcp_goodput}
keylset TCP_DB_M28_C10_DS Direction {Unidirectional}
keylset TCP_DB_M28_C10_DS Source {Eth}
keylset TCP_DB_M28_C10_DS Destination {Wifi2_28_10CLI Wifi5_40_28_10CLI}
#TCP_DB_M28_C10_US
set TCP_DB_M28_C10_US ${tcp_goodput}
keylset TCP_DB_M28_C10_US Direction {Unidirectional}
keylset TCP_DB_M28_C10_US Source {Wifi2_28_10CLI Wifi5_40_28_10CLI}
keylset TCP_DB_M28_C10_US Destination {Eth}
#TCP_DB_M27_C10_DS
set TCP_DB_M27_C10_DS ${tcp_goodput}
keylset TCP_DB_M27_C10_DS Direction {Unidirectional}
keylset TCP_DB_M27_C10_DS Source {Eth}
keylset TCP_DB_M27_C10_DS Destination {Wifi2_27_10CLI Wifi5_40_27_10CLI}
#TCP_DB_M27_C10_US
set TCP_DB_M27_C10_US ${tcp_goodput}
keylset TCP_DB_M27_C10_US Direction {Unidirectional}
keylset TCP_DB_M27_C10_US Source {Wifi2_27_10CLI Wifi5_40_27_10CLI}
keylset TCP_DB_M27_C10_US Destination {Eth}
#TCP_DB_M26_C10_DS
set TCP_DB_M26_C10_DS ${tcp_goodput}
keylset TCP_DB_M26_C10_DS Direction {Unidirectional}
keylset TCP_DB_M26_C10_DS Source {Eth}
keylset TCP_DB_M26_C10_DS Destination {Wifi2_26_10CLI Wifi5_40_26_10CLI}
#TCP_DB_M26_C10_US
set TCP_DB_M26_C10_US ${tcp_goodput}
keylset TCP_DB_M26_C10_US Direction {Unidirectional}
keylset TCP_DB_M26_C10_US Source {Wifi2_26_10CLI Wifi5_40_26_10CLI}
keylset TCP_DB_M26_C10_US Destination {Eth}
#TCP_DB_M25_C10_DS
set TCP_DB_M25_C10_DS ${tcp_goodput}
keylset TCP_DB_M25_C10_DS Direction {Unidirectional}
keylset TCP_DB_M25_C10_DS Source {Eth}
keylset TCP_DB_M25_C10_DS Destination {Wifi2_25_10CLI Wifi5_40_25_10CLI}
#TCP_DB_M25_C10_US
set TCP_DB_M25_C10_US ${tcp_goodput}
keylset TCP_DB_M25_C10_US Direction {Unidirectional}
keylset TCP_DB_M25_C10_US Source {Wifi2_25_10CLI Wifi5_40_25_10CLI}
keylset TCP_DB_M25_C10_US Destination {Eth}
#TCP_DB_M24_C10_DS
set TCP_DB_M24_C10_DS ${tcp_goodput}
keylset TCP_DB_M24_C10_DS Direction {Unidirectional}
keylset TCP_DB_M24_C10_DS Source {Eth}
keylset TCP_DB_M24_C10_DS Destination {Wifi2_24_10CLI Wifi5_40_24_10CLI}
#TCP_DB_M24_C10_US
set TCP_DB_M24_C10_US ${tcp_goodput}
keylset TCP_DB_M24_C10_US Direction {Unidirectional}
keylset TCP_DB_M24_C10_US Source {Wifi2_24_10CLI Wifi5_40_24_10CLI}
keylset TCP_DB_M24_C10_US Destination {Eth}
#TCP_DB_M23_C10_DS
set TCP_DB_M23_C10_DS ${tcp_goodput}
keylset TCP_DB_M23_C10_DS Direction {Unidirectional}
keylset TCP_DB_M23_C10_DS Source {Eth}
keylset TCP_DB_M23_C10_DS Destination {Wifi2_23_10CLI Wifi5_40_23_10CLI}
keylset TCP_DB_M23_C10_DS TrialDuration 15
keylset TCP_DB_M23_C10_DS TestDurationSec 15
#TCP_DB_M23_C10_US
set TCP_DB_M23_C10_US ${tcp_goodput}
keylset TCP_DB_M23_C10_US Direction {Unidirectional}
keylset TCP_DB_M23_C10_US Source {Wifi2_23_10CLI Wifi5_40_23_10CLI}
keylset TCP_DB_M23_C10_US Destination {Eth}
keylset TCP_DB_M23_C10_US TrialDuration 15
keylset TCP_DB_M23_C10_US TestDurationSec 15
#TCP_DB_M22_C10_DS
set TCP_DB_M22_C10_DS ${tcp_goodput}
keylset TCP_DB_M22_C10_DS Direction {Unidirectional}
keylset TCP_DB_M22_C10_DS Source {Eth}
keylset TCP_DB_M22_C10_DS Destination {Wifi2_22_10CLI Wifi5_40_22_10CLI}
#TCP_DB_M22_C10_US
set TCP_DB_M22_C10_US ${tcp_goodput}
keylset TCP_DB_M22_C10_US Direction {Unidirectional}
keylset TCP_DB_M22_C10_US Source {Wifi2_22_10CLI Wifi5_40_22_10CLI}
keylset TCP_DB_M22_C10_US Destination {Eth}
#TCP_DB_M21_C10_DS
set TCP_DB_M21_C10_DS ${tcp_goodput}
keylset TCP_DB_M21_C10_DS Direction {Unidirectional}
keylset TCP_DB_M21_C10_DS Source {Eth}
keylset TCP_DB_M21_C10_DS Destination {Wifi2_21_10CLI Wifi5_40_21_10CLI}
#TCP_DB_M21_C10_US
set TCP_DB_M21_C10_US ${tcp_goodput}
keylset TCP_DB_M21_C10_US Direction {Unidirectional}
keylset TCP_DB_M21_C10_US Source {Wifi2_21_10CLI Wifi5_40_21_10CLI}
keylset TCP_DB_M21_C10_US Destination {Eth}
#TCP_DB_M20_C10_DS
set TCP_DB_M20_C10_DS ${tcp_goodput}
keylset TCP_DB_M20_C10_DS Direction {Unidirectional}
keylset TCP_DB_M20_C10_DS Source {Eth}
keylset TCP_DB_M20_C10_DS Destination {Wifi2_20_10CLI Wifi5_40_20_10CLI}
#TCP_DB_M20_C10_US
set TCP_DB_M20_C10_US ${tcp_goodput}
keylset TCP_DB_M20_C10_US Direction {Unidirectional}
keylset TCP_DB_M20_C10_US Source {Wifi2_20_10CLI Wifi5_40_20_10CLI}
keylset TCP_DB_M20_C10_US Destination {Eth}
#TCP_DB_M19_C10_DS
set TCP_DB_M19_C10_DS ${tcp_goodput}
keylset TCP_DB_M19_C10_DS Direction {Unidirectional}
keylset TCP_DB_M19_C10_DS Source {Eth}
keylset TCP_DB_M19_C10_DS Destination {Wifi2_19_10CLI Wifi5_40_19_10CLI}
#TCP_DB_M19_C10_US
set TCP_DB_M19_C10_US ${tcp_goodput}
keylset TCP_DB_M19_C10_US Direction {Unidirectional}
keylset TCP_DB_M19_C10_US Source {Wifi2_19_10CLI Wifi5_40_19_10CLI}
keylset TCP_DB_M19_C10_US Destination {Eth}
#TCP_DB_M18_C10_DS
set TCP_DB_M18_C10_DS ${tcp_goodput}
keylset TCP_DB_M18_C10_DS Direction {Unidirectional}
keylset TCP_DB_M18_C10_DS Source {Eth}
keylset TCP_DB_M18_C10_DS Destination {Wifi2_18_10CLI Wifi5_40_18_10CLI}
#TCP_DB_M18_C10_US
set TCP_DB_M18_C10_US ${tcp_goodput}
keylset TCP_DB_M18_C10_US Direction {Unidirectional}
keylset TCP_DB_M18_C10_US Source {Wifi2_18_10CLI Wifi5_40_18_10CLI}
keylset TCP_DB_M18_C10_US Destination {Eth}
#TCP_DB_M17_C10_DS
set TCP_DB_M17_C10_DS ${tcp_goodput}
keylset TCP_DB_M17_C10_DS Direction {Unidirectional}
keylset TCP_DB_M17_C10_DS Source {Eth}
keylset TCP_DB_M17_C10_DS Destination {Wifi2_17_10CLI Wifi5_40_17_10CLI}
#TCP_DB_M17_C10_US
set TCP_DB_M17_C10_US ${tcp_goodput}
keylset TCP_DB_M17_C10_US Direction {Unidirectional}
keylset TCP_DB_M17_C10_US Source {Wifi2_17_10CLI Wifi5_40_17_10CLI}
keylset TCP_DB_M17_C10_US Destination {Eth}
#TCP_DB_M16_C10_DS
set TCP_DB_M16_C10_DS ${tcp_goodput}
keylset TCP_DB_M16_C10_DS Direction {Unidirectional}
keylset TCP_DB_M16_C10_DS Source {Eth}
keylset TCP_DB_M16_C10_DS Destination {Wifi2_16_10CLI Wifi5_40_16_10CLI}
#TCP_DB_M16_C10_US
set TCP_DB_M16_C10_US ${tcp_goodput}
keylset TCP_DB_M16_C10_US Direction {Unidirectional}
keylset TCP_DB_M16_C10_US Source {Wifi2_16_10CLI Wifi5_40_16_10CLI}
keylset TCP_DB_M16_C10_US Destination {Eth}
#TCP_DB_M15_C10_DS
set TCP_DB_M15_C10_DS ${tcp_goodput}
keylset TCP_DB_M15_C10_DS Direction {Unidirectional}
keylset TCP_DB_M15_C10_DS Source {Eth}
keylset TCP_DB_M15_C10_DS Destination {Wifi2_15_10CLI Wifi5_40_15_10CLI}
keylset TCP_DB_M15_C10_DS TrialDuration 15
keylset TCP_DB_M15_C10_DS TestDurationSec 15
#TCP_DB_M15_C10_US
set TCP_DB_M15_C10_US ${tcp_goodput}
keylset TCP_DB_M15_C10_US Direction {Unidirectional}
keylset TCP_DB_M15_C10_US Source {Wifi2_15_10CLI Wifi5_40_15_10CLI}
keylset TCP_DB_M15_C10_US Destination {Eth}
keylset TCP_DB_M15_C10_US TrialDuration 15
keylset TCP_DB_M15_C10_US TestDurationSec 15
#TCP_DB_M14_C10_DS
set TCP_DB_M14_C10_DS ${tcp_goodput}
keylset TCP_DB_M14_C10_DS Direction {Unidirectional}
keylset TCP_DB_M14_C10_DS Source {Eth}
keylset TCP_DB_M14_C10_DS Destination {Wifi2_14_10CLI Wifi5_40_14_10CLI}
#TCP_DB_M14_C10_US
set TCP_DB_M14_C10_US ${tcp_goodput}
keylset TCP_DB_M14_C10_US Direction {Unidirectional}
keylset TCP_DB_M14_C10_US Source {Wifi2_14_10CLI Wifi5_40_14_10CLI}
keylset TCP_DB_M14_C10_US Destination {Eth}
#TCP_DB_M13_C10_DS
set TCP_DB_M13_C10_DS ${tcp_goodput}
keylset TCP_DB_M13_C10_DS Direction {Unidirectional}
keylset TCP_DB_M13_C10_DS Source {Eth}
keylset TCP_DB_M13_C10_DS Destination {Wifi2_13_10CLI Wifi5_40_13_10CLI}
#TCP_DB_M13_C10_US
set TCP_DB_M13_C10_US ${tcp_goodput}
keylset TCP_DB_M13_C10_US Direction {Unidirectional}
keylset TCP_DB_M13_C10_US Source {Wifi2_13_10CLI Wifi5_40_13_10CLI}
keylset TCP_DB_M13_C10_US Destination {Eth}
#TCP_DB_M12_C10_DS
set TCP_DB_M12_C10_DS ${tcp_goodput}
keylset TCP_DB_M12_C10_DS Direction {Unidirectional}
keylset TCP_DB_M12_C10_DS Source {Eth}
keylset TCP_DB_M12_C10_DS Destination {Wifi2_12_10CLI Wifi5_40_12_10CLI}
#TCP_DB_M12_C10_US
set TCP_DB_M12_C10_US ${tcp_goodput}
keylset TCP_DB_M12_C10_US Direction {Unidirectional}
keylset TCP_DB_M12_C10_US Source {Wifi2_12_10CLI Wifi5_40_12_10CLI}
keylset TCP_DB_M12_C10_US Destination {Eth}
#TCP_DB_M11_C10_DS
set TCP_DB_M11_C10_DS ${tcp_goodput}
keylset TCP_DB_M11_C10_DS Direction {Unidirectional}
keylset TCP_DB_M11_C10_DS Source {Eth}
keylset TCP_DB_M11_C10_DS Destination {Wifi2_11_10CLI Wifi5_40_11_10CLI}
#TCP_DB_M11_C10_US
set TCP_DB_M11_C10_US ${tcp_goodput}
keylset TCP_DB_M11_C10_US Direction {Unidirectional}
keylset TCP_DB_M11_C10_US Source {Wifi2_11_10CLI Wifi5_40_11_10CLI}
keylset TCP_DB_M11_C10_US Destination {Eth}
#TCP_DB_M10_C10_DS
set TCP_DB_M10_C10_DS ${tcp_goodput}
keylset TCP_DB_M10_C10_DS Direction {Unidirectional}
keylset TCP_DB_M10_C10_DS Source {Eth}
keylset TCP_DB_M10_C10_DS Destination {Wifi2_10_10CLI Wifi5_40_10_10CLI}
#TCP_DB_M10_C10_US
set TCP_DB_M10_C10_US ${tcp_goodput}
keylset TCP_DB_M10_C10_US Direction {Unidirectional}
keylset TCP_DB_M10_C10_US Source {Wifi2_10_10CLI Wifi5_40_10_10CLI}
keylset TCP_DB_M10_C10_US Destination {Eth}
#TCP_DB_M9_C10_DS
set TCP_DB_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_M9_C10_DS Source {Eth}
keylset TCP_DB_M9_C10_DS Destination {Wifi2_9_10CLI Wifi5_40_9_10CLI}
#TCP_DB_M9_C10_US
set TCP_DB_M9_C10_US ${tcp_goodput}
keylset TCP_DB_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_M9_C10_US Source {Wifi2_9_10CLI Wifi5_40_9_10CLI}
#TCP_DB_M8_C10_DS
set TCP_DB_M8_C10_DS ${tcp_goodput}
keylset TCP_DB_M8_C10_DS Direction {Unidirectional}
keylset TCP_DB_M8_C10_DS Source {Eth}
keylset TCP_DB_M8_C10_DS Destination {Wifi2_8_10CLI Wifi5_40_8_10CLI}
#TCP_DB_M8_C10_US
set TCP_DB_M8_C10_US ${tcp_goodput}
keylset TCP_DB_M8_C10_US Direction {Unidirectional}
keylset TCP_DB_M8_C10_US Source {Wifi2_8_10CLI Wifi5_40_8_10CLI}
keylset TCP_DB_M8_C10_US Destination {Eth}
#TCP_DB_M7_C10_DS
set TCP_DB_M7_C10_DS ${tcp_goodput}
keylset TCP_DB_M7_C10_DS Direction {Unidirectional}
keylset TCP_DB_M7_C10_DS Source {Eth}
keylset TCP_DB_M7_C10_DS Destination {Wifi2_7_10CLI Wifi5_40_7_10CLI}
keylset TCP_DB_M7_C10_DS TrialDuration 15
keylset TCP_DB_M7_C10_DS TestDurationSec 15
#TCP_DB_M7_C10_US
set TCP_DB_M7_C10_US ${tcp_goodput}
keylset TCP_DB_M7_C10_US Direction {Unidirectional}
keylset TCP_DB_M7_C10_US Source {Wifi2_7_10CLI Wifi5_40_7_10CLI}
keylset TCP_DB_M7_C10_US Destination {Eth}
keylset TCP_DB_M7_C10_US TrialDuration 15
keylset TCP_DB_M7_C10_US TestDurationSec 15
#TCP_DB_M6_C10_DS
set TCP_DB_M6_C10_DS ${tcp_goodput}
keylset TCP_DB_M6_C10_DS Direction {Unidirectional}
keylset TCP_DB_M6_C10_DS Source {Eth}
keylset TCP_DB_M6_C10_DS Destination {Wifi2_6_10CLI Wifi5_40_6_10CLI}
#TCP_DB_M6_C10_US
set TCP_DB_M6_C10_US ${tcp_goodput}
keylset TCP_DB_M6_C10_US Direction {Unidirectional}
keylset TCP_DB_M6_C10_US Source {Wifi2_6_10CLI Wifi5_40_6_10CLI}
keylset TCP_DB_M6_C10_US Destination {Eth}
#TCP_DB_M5_C10_DS
set TCP_DB_M5_C10_DS ${tcp_goodput}
keylset TCP_DB_M5_C10_DS Direction {Unidirectional}
keylset TCP_DB_M5_C10_DS Source {Eth}
keylset TCP_DB_M5_C10_DS Destination {Wifi2_5_10CLI Wifi5_40_5_10CLI}
#TCP_DB_M5_C10_US
set TCP_DB_M5_C10_US ${tcp_goodput}
keylset TCP_DB_M5_C10_US Direction {Unidirectional}
keylset TCP_DB_M5_C10_US Source {Wifi2_5_10CLI Wifi5_40_5_10CLI}
keylset TCP_DB_M5_C10_US Destination {Eth}
#TCP_DB_M4_C10_DS
set TCP_DB_M4_C10_DS ${tcp_goodput}
keylset TCP_DB_M4_C10_DS Direction {Unidirectional}
keylset TCP_DB_M4_C10_DS Source {Eth}
keylset TCP_DB_M4_C10_DS Destination {Wifi2_4_10CLI Wifi5_40_4_10CLI}
#TCP_DB_M4_C10_US
set TCP_DB_M4_C10_US ${tcp_goodput}
keylset TCP_DB_M4_C10_US Direction {Unidirectional}
keylset TCP_DB_M4_C10_US Source {Wifi2_4_10CLI Wifi5_40_4_10CLI}
keylset TCP_DB_M4_C10_US Destination {Eth}
#TCP_DB_M3_C10_DS
set TCP_DB_M3_C10_DS ${tcp_goodput}
keylset TCP_DB_M3_C10_DS Direction {Unidirectional}
keylset TCP_DB_M3_C10_DS Source {Eth}
keylset TCP_DB_M3_C10_DS Destination {Wifi2_3_10CLI Wifi5_40_3_10CLI}
#TCP_DB_M3_C10_US
set TCP_DB_M3_C10_US ${tcp_goodput}
keylset TCP_DB_M3_C10_US Direction {Unidirectional}
keylset TCP_DB_M3_C10_US Source {Wifi2_3_10CLI Wifi5_40_3_10CLI}
keylset TCP_DB_M3_C10_US Destination {Eth}
#TCP_DB_M2_C10_DS
set TCP_DB_M2_C10_DS ${tcp_goodput}
keylset TCP_DB_M2_C10_DS Direction {Unidirectional}
keylset TCP_DB_M2_C10_DS Source {Eth}
keylset TCP_DB_M2_C10_DS Destination {Wifi2_2_10CLI Wifi5_40_2_10CLI}
#TCP_DB_M2_C10_US
set TCP_DB_M2_C10_US ${tcp_goodput}
keylset TCP_DB_M2_C10_US Direction {Unidirectional}
keylset TCP_DB_M2_C10_US Source {Wifi2_2_10CLI Wifi5_40_2_10CLI}
keylset TCP_DB_M2_C10_US Destination {Eth}
#TCP_DB_M1_C10_DS
set TCP_DB_M1_C10_DS ${tcp_goodput}
keylset TCP_DB_M1_C10_DS Direction {Unidirectional}
keylset TCP_DB_M1_C10_DS Source {Eth}
keylset TCP_DB_M1_C10_DS Destination {Wifi2_1_10CLI Wifi5_40_1_10CLI}
#TCP_DB_M1_C10_US
set TCP_DB_M1_C10_US ${tcp_goodput}
keylset TCP_DB_M1_C10_US Direction {Unidirectional}
keylset TCP_DB_M1_C10_US Source {Wifi2_1_10CLI Wifi5_40_1_10CLI}
keylset TCP_DB_M1_C10_US Destination {Eth}
#TCP_DB_M0_C10_DS
set TCP_DB_M0_C10_DS ${tcp_goodput}
keylset TCP_DB_M0_C10_DS Direction {Unidirectional}
keylset TCP_DB_M0_C10_DS Source {Eth}
keylset TCP_DB_M0_C10_DS Destination {Wifi2_0_10CLI Wifi5_40_0_10CLI}
#TCP_DB_M0_C10_US
set TCP_DB_M0_C10_US ${tcp_goodput}
keylset TCP_DB_M0_C10_US Direction {Unidirectional}
keylset TCP_DB_M0_C10_US Source {Wifi2_0_10CLI Wifi5_40_0_10CLI}
keylset TCP_DB_M0_C10_US Destination {Eth}
#TCP_DB_MG_C10_DS
set TCP_DB_MG_C10_DS ${tcp_goodput}
keylset TCP_DB_MG_C10_DS Direction {Unidirectional}
keylset TCP_DB_MG_C10_DS Source {Eth}
keylset TCP_DB_MG_C10_DS Destination {Wifi2_G_10CLI Wifi5_20_a_10CLI}
keylset TCP_DB_MG_C10_DS TrialDuration 15
keylset TCP_DB_MG_C10_DS TestDurationSec 15
#TCP_DB_MG_C10_US
set TCP_DB_MG_C10_US ${tcp_goodput}
keylset TCP_DB_MG_C10_US Direction {Unidirectional}
keylset TCP_DB_MG_C10_US Source {Wifi2_G_10CLI Wifi5_20_a_10CLI}
keylset TCP_DB_MG_C10_US Destination {Eth}
keylset TCP_DB_MG_C10_US TrialDuration 15
keylset TCP_DB_MG_C10_US TestDurationSec 15

#TCP_DB_M31_C25_DS
set TCP_DB_M31_C25_DS ${tcp_goodput}
keylset TCP_DB_M31_C25_DS Direction {Unidirectional}
keylset TCP_DB_M31_C25_DS Source {Eth}
keylset TCP_DB_M31_C25_DS Destination {Wifi2_31_25CLI Wifi5_40_31_25CLI}
keylset TCP_DB_M31_C25_DS TrialDuration 15
keylset TCP_DB_M31_C25_DS TestDurationSec 15
#TCP_DB_M31_C25_US
set TCP_DB_M31_C25_US ${tcp_goodput}
keylset TCP_DB_M31_C25_US Direction {Unidirectional}
keylset TCP_DB_M31_C25_US Source {Wifi2_31_25CLI Wifi5_40_31_25CLI}
keylset TCP_DB_M31_C25_US Destination {Eth}
keylset TCP_DB_M31_C25_US TrialDuration 15
keylset TCP_DB_M31_C25_US TestDurationSec 15
#TCP_DB_M30_C25_DS
set TCP_DB_M30_C25_DS ${tcp_goodput}
keylset TCP_DB_M30_C25_DS Direction {Unidirectional}
keylset TCP_DB_M30_C25_DS Source {Eth}
keylset TCP_DB_M30_C25_DS Destination {Wifi2_30_25CLI Wifi5_40_30_25CLI}
#TCP_DB_M30_C25_US
set TCP_DB_M30_C25_US ${tcp_goodput}
keylset TCP_DB_M30_C25_US Direction {Unidirectional}
keylset TCP_DB_M30_C25_US Source {Wifi2_30_25CLI Wifi5_40_30_25CLI}
keylset TCP_DB_M30_C25_US Destination {Eth}
#TCP_DB_M29_C25_DS
set TCP_DB_M29_C25_DS ${tcp_goodput}
keylset TCP_DB_M29_C25_DS Direction {Unidirectional}
keylset TCP_DB_M29_C25_DS Source {Eth}
keylset TCP_DB_M29_C25_DS Destination {Wifi2_29_25CLI Wifi5_40_29_25CLI}
#TCP_DB_M29_C25_US
set TCP_DB_M29_C25_US ${tcp_goodput}
keylset TCP_DB_M29_C25_US Direction {Unidirectional}
keylset TCP_DB_M29_C25_US Source {Wifi2_29_25CLI Wifi5_40_29_25CLI}
keylset TCP_DB_M29_C25_US Destination {Eth}
#TCP_DB_M28_C25_DS
set TCP_DB_M28_C25_DS ${tcp_goodput}
keylset TCP_DB_M28_C25_DS Direction {Unidirectional}
keylset TCP_DB_M28_C25_DS Source {Eth}
keylset TCP_DB_M28_C25_DS Destination {Wifi2_28_25CLI Wifi5_40_28_25CLI}
#TCP_DB_M28_C25_US
set TCP_DB_M28_C25_US ${tcp_goodput}
keylset TCP_DB_M28_C25_US Direction {Unidirectional}
keylset TCP_DB_M28_C25_US Source {Wifi2_28_25CLI Wifi5_40_28_25CLI}
keylset TCP_DB_M28_C25_US Destination {Eth}
#TCP_DB_M27_C25_DS
set TCP_DB_M27_C25_DS ${tcp_goodput}
keylset TCP_DB_M27_C25_DS Direction {Unidirectional}
keylset TCP_DB_M27_C25_DS Source {Eth}
keylset TCP_DB_M27_C25_DS Destination {Wifi2_27_25CLI Wifi5_40_27_25CLI}
#TCP_DB_M27_C25_US
set TCP_DB_M27_C25_US ${tcp_goodput}
keylset TCP_DB_M27_C25_US Direction {Unidirectional}
keylset TCP_DB_M27_C25_US Source {Wifi2_27_25CLI Wifi5_40_27_25CLI}
keylset TCP_DB_M27_C25_US Destination {Eth}
#TCP_DB_M26_C25_DS
set TCP_DB_M26_C25_DS ${tcp_goodput}
keylset TCP_DB_M26_C25_DS Direction {Unidirectional}
keylset TCP_DB_M26_C25_DS Source {Eth}
keylset TCP_DB_M26_C25_DS Destination {Wifi2_26_25CLI Wifi5_40_26_25CLI}
#TCP_DB_M26_C25_US
set TCP_DB_M26_C25_US ${tcp_goodput}
keylset TCP_DB_M26_C25_US Direction {Unidirectional}
keylset TCP_DB_M26_C25_US Source {Wifi2_26_25CLI Wifi5_40_26_25CLI}
keylset TCP_DB_M26_C25_US Destination {Eth}
#TCP_DB_M25_C25_DS
set TCP_DB_M25_C25_DS ${tcp_goodput}
keylset TCP_DB_M25_C25_DS Direction {Unidirectional}
keylset TCP_DB_M25_C25_DS Source {Eth}
keylset TCP_DB_M25_C25_DS Destination {Wifi2_25_25CLI Wifi5_40_25_25CLI}
#TCP_DB_M25_C25_US
set TCP_DB_M25_C25_US ${tcp_goodput}
keylset TCP_DB_M25_C25_US Direction {Unidirectional}
keylset TCP_DB_M25_C25_US Source {Wifi2_25_25CLI Wifi5_40_25_25CLI}
keylset TCP_DB_M25_C25_US Destination {Eth}
#TCP_DB_M24_C25_DS
set TCP_DB_M24_C25_DS ${tcp_goodput}
keylset TCP_DB_M24_C25_DS Direction {Unidirectional}
keylset TCP_DB_M24_C25_DS Source {Eth}
keylset TCP_DB_M24_C25_DS Destination {Wifi2_24_25CLI Wifi5_40_24_25CLI}
#TCP_DB_M24_C25_US
set TCP_DB_M24_C25_US ${tcp_goodput}
keylset TCP_DB_M24_C25_US Direction {Unidirectional}
keylset TCP_DB_M24_C25_US Source {Wifi2_24_25CLI Wifi5_40_24_25CLI}
keylset TCP_DB_M24_C25_US Destination {Eth}
#TCP_DB_M23_C25_DS
set TCP_DB_M23_C25_DS ${tcp_goodput}
keylset TCP_DB_M23_C25_DS Direction {Unidirectional}
keylset TCP_DB_M23_C25_DS Source {Eth}
keylset TCP_DB_M23_C25_DS Destination {Wifi2_23_25CLI Wifi5_40_23_25CLI}
keylset TCP_DB_M23_C25_DS TrialDuration 15
keylset TCP_DB_M23_C25_DS TestDurationSec 15
#TCP_DB_M23_C25_US
set TCP_DB_M23_C25_US ${tcp_goodput}
keylset TCP_DB_M23_C25_US Direction {Unidirectional}
keylset TCP_DB_M23_C25_US Source {Wifi2_23_25CLI Wifi5_40_23_25CLI}
keylset TCP_DB_M23_C25_US Destination {Eth}
keylset TCP_DB_M23_C25_US TrialDuration 15
keylset TCP_DB_M23_C25_US TestDurationSec 15
#TCP_DB_M22_C25_DS
set TCP_DB_M22_C25_DS ${tcp_goodput}
keylset TCP_DB_M22_C25_DS Direction {Unidirectional}
keylset TCP_DB_M22_C25_DS Source {Eth}
keylset TCP_DB_M22_C25_DS Destination {Wifi2_22_25CLI Wifi5_40_22_25CLI}
#TCP_DB_M22_C25_US
set TCP_DB_M22_C25_US ${tcp_goodput}
keylset TCP_DB_M22_C25_US Direction {Unidirectional}
keylset TCP_DB_M22_C25_US Source {Wifi2_22_25CLI Wifi5_40_22_25CLI}
keylset TCP_DB_M22_C25_US Destination {Eth}
#TCP_DB_M21_C25_DS
set TCP_DB_M21_C25_DS ${tcp_goodput}
keylset TCP_DB_M21_C25_DS Direction {Unidirectional}
keylset TCP_DB_M21_C25_DS Source {Eth}
keylset TCP_DB_M21_C25_DS Destination {Wifi2_21_25CLI Wifi5_40_21_25CLI}
#TCP_DB_M21_C25_US
set TCP_DB_M21_C25_US ${tcp_goodput}
keylset TCP_DB_M21_C25_US Direction {Unidirectional}
keylset TCP_DB_M21_C25_US Source {Wifi2_21_25CLI Wifi5_40_21_25CLI}
keylset TCP_DB_M21_C25_US Destination {Eth}
#TCP_DB_M20_C25_DS
set TCP_DB_M20_C25_DS ${tcp_goodput}
keylset TCP_DB_M20_C25_DS Direction {Unidirectional}
keylset TCP_DB_M20_C25_DS Source {Eth}
keylset TCP_DB_M20_C25_DS Destination {Wifi2_20_25CLI Wifi5_40_20_25CLI}
#TCP_DB_M20_C25_US
set TCP_DB_M20_C25_US ${tcp_goodput}
keylset TCP_DB_M20_C25_US Direction {Unidirectional}
keylset TCP_DB_M20_C25_US Source {Wifi2_20_25CLI Wifi5_40_20_25CLI}
keylset TCP_DB_M20_C25_US Destination {Eth}
#TCP_DB_M19_C25_DS
set TCP_DB_M19_C25_DS ${tcp_goodput}
keylset TCP_DB_M19_C25_DS Direction {Unidirectional}
keylset TCP_DB_M19_C25_DS Source {Eth}
keylset TCP_DB_M19_C25_DS Destination {Wifi2_19_25CLI Wifi5_40_19_25CLI}
#TCP_DB_M19_C25_US
set TCP_DB_M19_C25_US ${tcp_goodput}
keylset TCP_DB_M19_C25_US Direction {Unidirectional}
keylset TCP_DB_M19_C25_US Source {Wifi2_19_25CLI Wifi5_40_19_25CLI}
keylset TCP_DB_M19_C25_US Destination {Eth}
#TCP_DB_M18_C25_DS
set TCP_DB_M18_C25_DS ${tcp_goodput}
keylset TCP_DB_M18_C25_DS Direction {Unidirectional}
keylset TCP_DB_M18_C25_DS Source {Eth}
keylset TCP_DB_M18_C25_DS Destination {Wifi2_18_25CLI Wifi5_40_18_25CLI}
#TCP_DB_M18_C25_US
set TCP_DB_M18_C25_US ${tcp_goodput}
keylset TCP_DB_M18_C25_US Direction {Unidirectional}
keylset TCP_DB_M18_C25_US Source {Wifi2_18_25CLI Wifi5_40_18_25CLI}
keylset TCP_DB_M18_C25_US Destination {Eth}
#TCP_DB_M17_C25_DS
set TCP_DB_M17_C25_DS ${tcp_goodput}
keylset TCP_DB_M17_C25_DS Direction {Unidirectional}
keylset TCP_DB_M17_C25_DS Source {Eth}
keylset TCP_DB_M17_C25_DS Destination {Wifi2_17_25CLI Wifi5_40_17_25CLI}
#TCP_DB_M17_C25_US
set TCP_DB_M17_C25_US ${tcp_goodput}
keylset TCP_DB_M17_C25_US Direction {Unidirectional}
keylset TCP_DB_M17_C25_US Source {Wifi2_17_25CLI Wifi5_40_17_25CLI}
keylset TCP_DB_M17_C25_US Destination {Eth}
#TCP_DB_M16_C25_DS
set TCP_DB_M16_C25_DS ${tcp_goodput}
keylset TCP_DB_M16_C25_DS Direction {Unidirectional}
keylset TCP_DB_M16_C25_DS Source {Eth}
keylset TCP_DB_M16_C25_DS Destination {Wifi2_16_25CLI Wifi5_40_16_25CLI}
#TCP_DB_M16_C25_US
set TCP_DB_M16_C25_US ${tcp_goodput}
keylset TCP_DB_M16_C25_US Direction {Unidirectional}
keylset TCP_DB_M16_C25_US Source {Wifi2_16_25CLI Wifi5_40_16_25CLI}
keylset TCP_DB_M16_C25_US Destination {Eth}
#TCP_DB_M15_C25_DS
set TCP_DB_M15_C25_DS ${tcp_goodput}
keylset TCP_DB_M15_C25_DS Direction {Unidirectional}
keylset TCP_DB_M15_C25_DS Source {Eth}
keylset TCP_DB_M15_C25_DS Destination {Wifi2_15_25CLI Wifi5_40_15_25CLI}
keylset TCP_DB_M15_C25_DS TrialDuration 15
keylset TCP_DB_M15_C25_DS TestDurationSec 15
#TCP_DB_M15_C25_US
set TCP_DB_M15_C25_US ${tcp_goodput}
keylset TCP_DB_M15_C25_US Direction {Unidirectional}
keylset TCP_DB_M15_C25_US Source {Wifi2_15_25CLI Wifi5_40_15_25CLI}
keylset TCP_DB_M15_C25_US Destination {Eth}
keylset TCP_DB_M15_C25_US TrialDuration 15
keylset TCP_DB_M15_C25_US TestDurationSec 15
#TCP_DB_M14_C25_DS
set TCP_DB_M14_C25_DS ${tcp_goodput}
keylset TCP_DB_M14_C25_DS Direction {Unidirectional}
keylset TCP_DB_M14_C25_DS Source {Eth}
keylset TCP_DB_M14_C25_DS Destination {Wifi2_14_25CLI Wifi5_40_14_25CLI}
#TCP_DB_M14_C25_US
set TCP_DB_M14_C25_US ${tcp_goodput}
keylset TCP_DB_M14_C25_US Direction {Unidirectional}
keylset TCP_DB_M14_C25_US Source {Wifi2_14_25CLI Wifi5_40_14_25CLI}
keylset TCP_DB_M14_C25_US Destination {Eth}
#TCP_DB_M13_C25_DS
set TCP_DB_M13_C25_DS ${tcp_goodput}
keylset TCP_DB_M13_C25_DS Direction {Unidirectional}
keylset TCP_DB_M13_C25_DS Source {Eth}
keylset TCP_DB_M13_C25_DS Destination {Wifi2_13_25CLI Wifi5_40_13_25CLI}
#TCP_DB_M13_C25_US
set TCP_DB_M13_C25_US ${tcp_goodput}
keylset TCP_DB_M13_C25_US Direction {Unidirectional}
keylset TCP_DB_M13_C25_US Source {Wifi2_13_25CLI Wifi5_40_13_25CLI}
keylset TCP_DB_M13_C25_US Destination {Eth}
#TCP_DB_M12_C25_DS
set TCP_DB_M12_C25_DS ${tcp_goodput}
keylset TCP_DB_M12_C25_DS Direction {Unidirectional}
keylset TCP_DB_M12_C25_DS Source {Eth}
keylset TCP_DB_M12_C25_DS Destination {Wifi2_12_25CLI Wifi5_40_12_25CLI}
#TCP_DB_M12_C25_US
set TCP_DB_M12_C25_US ${tcp_goodput}
keylset TCP_DB_M12_C25_US Direction {Unidirectional}
keylset TCP_DB_M12_C25_US Source {Wifi2_12_25CLI Wifi5_40_12_25CLI}
keylset TCP_DB_M12_C25_US Destination {Eth}
#TCP_DB_M11_C25_DS
set TCP_DB_M11_C25_DS ${tcp_goodput}
keylset TCP_DB_M11_C25_DS Direction {Unidirectional}
keylset TCP_DB_M11_C25_DS Source {Eth}
keylset TCP_DB_M11_C25_DS Destination {Wifi2_11_25CLI Wifi5_40_11_25CLI}
#TCP_DB_M11_C25_US
set TCP_DB_M11_C25_US ${tcp_goodput}
keylset TCP_DB_M11_C25_US Direction {Unidirectional}
keylset TCP_DB_M11_C25_US Source {Wifi2_11_25CLI Wifi5_40_11_25CLI}
keylset TCP_DB_M11_C25_US Destination {Eth}
#TCP_DB_M10_C25_DS
set TCP_DB_M10_C25_DS ${tcp_goodput}
keylset TCP_DB_M10_C25_DS Direction {Unidirectional}
keylset TCP_DB_M10_C25_DS Source {Eth}
keylset TCP_DB_M10_C25_DS Destination {Wifi2_10_25CLI Wifi5_40_10_25CLI}
#TCP_DB_M10_C25_US
set TCP_DB_M10_C25_US ${tcp_goodput}
keylset TCP_DB_M10_C25_US Direction {Unidirectional}
keylset TCP_DB_M10_C25_US Source {Wifi2_10_25CLI Wifi5_40_10_25CLI}
keylset TCP_DB_M10_C25_US Destination {Eth}
#TCP_DB_M9_C25_DS
set TCP_DB_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_M9_C25_DS Source {Eth}
keylset TCP_DB_M9_C25_DS Destination {Wifi2_9_25CLI Wifi5_40_9_25CLI}
#TCP_DB_M9_C25_US
set TCP_DB_M9_C25_US ${tcp_goodput}
keylset TCP_DB_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_M9_C25_US Source {Wifi2_9_25CLI Wifi5_40_9_25CLI}
#TCP_DB_M8_C25_DS
set TCP_DB_M8_C25_DS ${tcp_goodput}
keylset TCP_DB_M8_C25_DS Direction {Unidirectional}
keylset TCP_DB_M8_C25_DS Source {Eth}
keylset TCP_DB_M8_C25_DS Destination {Wifi2_8_25CLI Wifi5_40_8_25CLI}
#TCP_DB_M8_C25_US
set TCP_DB_M8_C25_US ${tcp_goodput}
keylset TCP_DB_M8_C25_US Direction {Unidirectional}
keylset TCP_DB_M8_C25_US Source {Wifi2_8_25CLI Wifi5_40_8_25CLI}
keylset TCP_DB_M8_C25_US Destination {Eth}
#TCP_DB_M7_C25_DS
set TCP_DB_M7_C25_DS ${tcp_goodput}
keylset TCP_DB_M7_C25_DS Direction {Unidirectional}
keylset TCP_DB_M7_C25_DS Source {Eth}
keylset TCP_DB_M7_C25_DS Destination {Wifi2_7_25CLI Wifi5_40_7_25CLI}
keylset TCP_DB_M7_C25_DS TrialDuration 15
keylset TCP_DB_M7_C25_DS TestDurationSec 15
#TCP_DB_M7_C25_US
set TCP_DB_M7_C25_US ${tcp_goodput}
keylset TCP_DB_M7_C25_US Direction {Unidirectional}
keylset TCP_DB_M7_C25_US Source {Wifi2_7_25CLI Wifi5_40_7_25CLI}
keylset TCP_DB_M7_C25_US Destination {Eth}
keylset TCP_DB_M7_C25_US TrialDuration 15
keylset TCP_DB_M7_C25_US TestDurationSec 15
#TCP_DB_M6_C25_DS
set TCP_DB_M6_C25_DS ${tcp_goodput}
keylset TCP_DB_M6_C25_DS Direction {Unidirectional}
keylset TCP_DB_M6_C25_DS Source {Eth}
keylset TCP_DB_M6_C25_DS Destination {Wifi2_6_25CLI Wifi5_40_6_25CLI}
#TCP_DB_M6_C25_US
set TCP_DB_M6_C25_US ${tcp_goodput}
keylset TCP_DB_M6_C25_US Direction {Unidirectional}
keylset TCP_DB_M6_C25_US Source {Wifi2_6_25CLI Wifi5_40_6_25CLI}
keylset TCP_DB_M6_C25_US Destination {Eth}
#TCP_DB_M5_C25_DS
set TCP_DB_M5_C25_DS ${tcp_goodput}
keylset TCP_DB_M5_C25_DS Direction {Unidirectional}
keylset TCP_DB_M5_C25_DS Source {Eth}
keylset TCP_DB_M5_C25_DS Destination {Wifi2_5_25CLI Wifi5_40_5_25CLI}
#TCP_DB_M5_C25_US
set TCP_DB_M5_C25_US ${tcp_goodput}
keylset TCP_DB_M5_C25_US Direction {Unidirectional}
keylset TCP_DB_M5_C25_US Source {Wifi2_5_25CLI Wifi5_40_5_25CLI}
keylset TCP_DB_M5_C25_US Destination {Eth}
#TCP_DB_M4_C25_DS
set TCP_DB_M4_C25_DS ${tcp_goodput}
keylset TCP_DB_M4_C25_DS Direction {Unidirectional}
keylset TCP_DB_M4_C25_DS Source {Eth}
keylset TCP_DB_M4_C25_DS Destination {Wifi2_4_25CLI Wifi5_40_4_25CLI}
#TCP_DB_M4_C25_US
set TCP_DB_M4_C25_US ${tcp_goodput}
keylset TCP_DB_M4_C25_US Direction {Unidirectional}
keylset TCP_DB_M4_C25_US Source {Wifi2_4_25CLI Wifi5_40_4_25CLI}
keylset TCP_DB_M4_C25_US Destination {Eth}
#TCP_DB_M3_C25_DS
set TCP_DB_M3_C25_DS ${tcp_goodput}
keylset TCP_DB_M3_C25_DS Direction {Unidirectional}
keylset TCP_DB_M3_C25_DS Source {Eth}
keylset TCP_DB_M3_C25_DS Destination {Wifi2_3_25CLI Wifi5_40_3_25CLI}
#TCP_DB_M3_C25_US
set TCP_DB_M3_C25_US ${tcp_goodput}
keylset TCP_DB_M3_C25_US Direction {Unidirectional}
keylset TCP_DB_M3_C25_US Source {Wifi2_3_25CLI Wifi5_40_3_25CLI}
keylset TCP_DB_M3_C25_US Destination {Eth}
#TCP_DB_M2_C25_DS
set TCP_DB_M2_C25_DS ${tcp_goodput}
keylset TCP_DB_M2_C25_DS Direction {Unidirectional}
keylset TCP_DB_M2_C25_DS Source {Eth}
keylset TCP_DB_M2_C25_DS Destination {Wifi2_2_25CLI Wifi5_40_2_25CLI}
#TCP_DB_M2_C25_US
set TCP_DB_M2_C25_US ${tcp_goodput}
keylset TCP_DB_M2_C25_US Direction {Unidirectional}
keylset TCP_DB_M2_C25_US Source {Wifi2_2_25CLI Wifi5_40_2_25CLI}
keylset TCP_DB_M2_C25_US Destination {Eth}
#TCP_DB_M1_C25_DS
set TCP_DB_M1_C25_DS ${tcp_goodput}
keylset TCP_DB_M1_C25_DS Direction {Unidirectional}
keylset TCP_DB_M1_C25_DS Source {Eth}
keylset TCP_DB_M1_C25_DS Destination {Wifi2_1_25CLI Wifi5_40_1_25CLI}
#TCP_DB_M1_C25_US
set TCP_DB_M1_C25_US ${tcp_goodput}
keylset TCP_DB_M1_C25_US Direction {Unidirectional}
keylset TCP_DB_M1_C25_US Source {Wifi2_1_25CLI Wifi5_40_1_25CLI}
keylset TCP_DB_M1_C25_US Destination {Eth}
#TCP_DB_M0_C25_DS
set TCP_DB_M0_C25_DS ${tcp_goodput}
keylset TCP_DB_M0_C25_DS Direction {Unidirectional}
keylset TCP_DB_M0_C25_DS Source {Eth}
keylset TCP_DB_M0_C25_DS Destination {Wifi2_0_25CLI Wifi5_40_0_25CLI}
#TCP_DB_M0_C25_US
set TCP_DB_M0_C25_US ${tcp_goodput}
keylset TCP_DB_M0_C25_US Direction {Unidirectional}
keylset TCP_DB_M0_C25_US Source {Wifi2_0_25CLI Wifi5_40_0_25CLI}
keylset TCP_DB_M0_C25_US Destination {Eth}
#TCP_DB_MG_C25_DS
set TCP_DB_MG_C25_DS ${tcp_goodput}
keylset TCP_DB_MG_C25_DS Direction {Unidirectional}
keylset TCP_DB_MG_C25_DS Source {Eth}
keylset TCP_DB_MG_C25_DS Destination {Wifi2_G_25CLI Wifi5_20_a_25CLI}
keylset TCP_DB_MG_C25_DS TrialDuration 15
keylset TCP_DB_MG_C25_DS TestDurationSec 15
#TCP_DB_MG_C25_US
set TCP_DB_MG_C25_US ${tcp_goodput}
keylset TCP_DB_MG_C25_US Direction {Unidirectional}
keylset TCP_DB_MG_C25_US Source {Wifi2_G_25CLI Wifi5_20_a_25CLI}
keylset TCP_DB_MG_C25_US Destination {Eth}
keylset TCP_DB_MG_C25_US TrialDuration 15
keylset TCP_DB_MG_C25_US TestDurationSec 15






################# NEW

#TCP 24 and 540 tests
#### TCP_DB_MCS5G_MCS24G_Clients_Direction


#2.4 set at MCS 7 - 5 sweeping through major MCS Levels


#TCP_DB_M7_M7_C10_DS
set TCP_DB_M7_M7_C10_DS ${tcp_goodput}
keylset TCP_DB_M7_M7_C10_DS Direction {Unidirectional}
keylset TCP_DB_M7_M7_C10_DS Source {Eth}
keylset TCP_DB_M7_M7_C10_DS Destination {Wifi2_7_10CLI Wifi5_40_7_10CLI}
#TCP_DB_M7_M7_C10_US
set TCP_DB_M7_M7_C10_US ${tcp_goodput}
keylset TCP_DB_M7_M7_C10_US Direction {Unidirectional}
keylset TCP_DB_M7_M7_C10_US Source {Wifi2_7_10CLI Wifi5_40_7_10CLI}
keylset TCP_DB_M7_M7_C10_US Destination {Eth}
#TCP_DB_M7_M7_C25_DS
set TCP_DB_M7_M7_C25_DS ${tcp_goodput}
keylset TCP_DB_M7_M7_C25_DS Direction {Unidirectional}
keylset TCP_DB_M7_M7_C25_DS Source {Eth}
keylset TCP_DB_M7_M7_C25_DS Destination {Wifi2_7_25CLI Wifi5_40_7_25CLI}
#TCP_DB_M7_M7_C25_US
set TCP_DB_M7_M7_C25_US ${tcp_goodput}
keylset TCP_DB_M7_M7_C25_US Direction {Unidirectional}
keylset TCP_DB_M7_M7_C25_US Source {Wifi2_7_25CLI Wifi5_40_7_25CLI}
keylset TCP_DB_M7_M7_C25_US Destination {Eth}


#TCP_DB_M7_M15_C10_DS
set TCP_DB_M7_M15_C10_DS ${tcp_goodput}
keylset TCP_DB_M7_M15_C10_DS Direction {Unidirectional}
keylset TCP_DB_M7_M15_C10_DS Source {Eth}
keylset TCP_DB_M7_M15_C10_DS Destination {Wifi2_7_10CLI Wifi5_40_15_10CLI}
#TCP_DB_M7_M15_C10_US
set TCP_DB_M7_M15_C10_US ${tcp_goodput}
keylset TCP_DB_M7_M15_C10_US Direction {Unidirectional}
keylset TCP_DB_M7_M15_C10_US Source {Wifi2_7_10CLI Wifi5_40_15_10CLI}
keylset TCP_DB_M7_M15_C10_US Destination {Eth}
#TCP_DB_M7_M15_C25_DS
set TCP_DB_M7_M15_C25_DS ${tcp_goodput}
keylset TCP_DB_M7_M15_C25_DS Direction {Unidirectional}
keylset TCP_DB_M7_M15_C25_DS Source {Eth}
keylset TCP_DB_M7_M15_C25_DS Destination {Wifi2_7_25CLI Wifi5_40_15_25CLI}
#TCP_DB_M7_M15_C25_US
set TCP_DB_M7_M15_C25_US ${tcp_goodput}
keylset TCP_DB_M7_M15_C25_US Direction {Unidirectional}
keylset TCP_DB_M7_M15_C25_US Source {Wifi2_7_25CLI Wifi5_40_15_25CLI}
keylset TCP_DB_M7_M15_C25_US Destination {Eth}



#TCP_DB_M7_M23_C10_DS
set TCP_DB_M7_M23_C10_DS ${tcp_goodput}
keylset TCP_DB_M7_M23_C10_DS Direction {Unidirectional}
keylset TCP_DB_M7_M23_C10_DS Source {Eth}
keylset TCP_DB_M7_M23_C10_DS Destination {Wifi2_7_10CLI Wifi5_40_23_10CLI}
#TCP_DB_M7_M23_C10_US
set TCP_DB_M7_M23_C10_US ${tcp_goodput}
keylset TCP_DB_M7_M23_C10_US Direction {Unidirectional}
keylset TCP_DB_M7_M23_C10_US Source {Wifi2_7_10CLI Wifi5_40_23_10CLI}
keylset TCP_DB_M7_M23_C10_US Destination {Eth}
#TCP_DB_M7_M23_C25_DS
set TCP_DB_M7_M23_C25_DS ${tcp_goodput}
keylset TCP_DB_M7_M23_C25_DS Direction {Unidirectional}
keylset TCP_DB_M7_M23_C25_DS Source {Eth}
keylset TCP_DB_M7_M23_C25_DS Destination {Wifi2_7_25CLI Wifi5_40_23_25CLI}
#TCP_DB_M7_M23_C25_US
set TCP_DB_M7_M23_C25_US ${tcp_goodput}
keylset TCP_DB_M7_M23_C25_US Direction {Unidirectional}
keylset TCP_DB_M7_M23_C25_US Source {Wifi2_7_25CLI Wifi5_40_23_25CLI}
keylset TCP_DB_M7_M23_C25_US Destination {Eth}



#TCP_DB_M7_M31_C10_DS
set TCP_DB_M7_M31_C10_DS ${tcp_goodput}
keylset TCP_DB_M7_M31_C10_DS Direction {Unidirectional}
keylset TCP_DB_M7_M31_C10_DS Source {Eth}
keylset TCP_DB_M7_M31_C10_DS Destination {Wifi2_7_10CLI Wifi5_40_31_10CLI}
#TCP_DB_M7_M31_C10_US
set TCP_DB_M7_M31_C10_US ${tcp_goodput}
keylset TCP_DB_M7_M31_C10_US Direction {Unidirectional}
keylset TCP_DB_M7_M31_C10_US Source {Wifi2_7_10CLI Wifi5_40_31_10CLI}
keylset TCP_DB_M7_M31_C10_US Destination {Eth}
#TCP_DB_M7_M31_C25_DS
set TCP_DB_M7_M31_C25_DS ${tcp_goodput}
keylset TCP_DB_M7_M31_C25_DS Direction {Unidirectional}
keylset TCP_DB_M7_M31_C25_DS Source {Eth}
keylset TCP_DB_M7_M31_C25_DS Destination {Wifi2_7_25CLI Wifi5_40_31_25CLI}
#TCP_DB_M7_M31_C25_US
set TCP_DB_M7_M31_C25_US ${tcp_goodput}
keylset TCP_DB_M7_M31_C25_US Direction {Unidirectional}
keylset TCP_DB_M7_M31_C25_US Source {Wifi2_7_25CLI Wifi5_40_31_25CLI}
keylset TCP_DB_M7_M31_C25_US Destination {Eth}



#2.4 set at MCS 15 - 5 sweeping through major MCS Levels

#TCP_DB_M7_M7_C10_DS
set TCP_DB_M15_M7_C10_DS ${tcp_goodput}
keylset TCP_DB_M15_M7_C10_DS Direction {Unidirectional}
keylset TCP_DB_M15_M7_C10_DS Source {Eth}
keylset TCP_DB_M15_M7_C10_DS Destination {Wifi2_15_10CLI Wifi5_40_7_10CLI}
#TCP_DB_M15_M7_C10_US
set TCP_DB_M15_M7_C10_US ${tcp_goodput}
keylset TCP_DB_M15_M7_C10_US Direction {Unidirectional}
keylset TCP_DB_M15_M7_C10_US Source {Wifi2_15_10CLI Wifi5_40_7_10CLI}
keylset TCP_DB_M15_M7_C10_US Destination {Eth}
#TCP_DB_M15_M7_C25_DS
set TCP_DB_M15_M7_C25_DS ${tcp_goodput}
keylset TCP_DB_M15_M7_C25_DS Direction {Unidirectional}
keylset TCP_DB_M15_M7_C25_DS Source {Eth}
keylset TCP_DB_M15_M7_C25_DS Destination {Wifi2_15_25CLI Wifi5_40_7_25CLI}
#TCP_DB_M15_M7_C25_US
set TCP_DB_M15_M7_C25_US ${tcp_goodput}
keylset TCP_DB_M15_M7_C25_US Direction {Unidirectional}
keylset TCP_DB_M15_M7_C25_US Source {Wifi2_15_25CLI Wifi5_40_7_25CLI}
keylset TCP_DB_M15_M7_C25_US Destination {Eth}


#TCP_DB_M15_M15_C10_DS
set TCP_DB_M15_M15_C10_DS ${tcp_goodput}
keylset TCP_DB_M15_M15_C10_DS Direction {Unidirectional}
keylset TCP_DB_M15_M15_C10_DS Source {Eth}
keylset TCP_DB_M15_M15_C10_DS Destination {Wifi2_15_10CLI Wifi5_40_15_10CLI}
#TCP_DB_M15_M15_C10_US
set TCP_DB_M15_M15_C10_US ${tcp_goodput}
keylset TCP_DB_M15_M15_C10_US Direction {Unidirectional}
keylset TCP_DB_M15_M15_C10_US Source {Wifi2_15_10CLI Wifi5_40_15_10CLI}
keylset TCP_DB_M15_M15_C10_US Destination {Eth}
#TCP_DB_M15_M15_C25_DS
set TCP_DB_M15_M15_C25_DS ${tcp_goodput}
keylset TCP_DB_M15_M15_C25_DS Direction {Unidirectional}
keylset TCP_DB_M15_M15_C25_DS Source {Eth}
keylset TCP_DB_M15_M15_C25_DS Destination {Wifi2_15_25CLI Wifi5_40_15_25CLI}
#TCP_DB_M15_M15_C25_US
set TCP_DB_M15_M15_C25_US ${tcp_goodput}
keylset TCP_DB_M15_M15_C25_US Direction {Unidirectional}
keylset TCP_DB_M15_M15_C25_US Source {Wifi2_15_25CLI Wifi5_40_15_25CLI}
keylset TCP_DB_M15_M15_C25_US Destination {Eth}



#TCP_DB_M15_M23_C10_DS
set TCP_DB_M15_M23_C10_DS ${tcp_goodput}
keylset TCP_DB_M15_M23_C10_DS Direction {Unidirectional}
keylset TCP_DB_M15_M23_C10_DS Source {Eth}
keylset TCP_DB_M15_M23_C10_DS Destination {Wifi2_15_10CLI Wifi5_40_23_10CLI}
#TCP_DB_M15_M23_C10_US
set TCP_DB_M15_M23_C10_US ${tcp_goodput}
keylset TCP_DB_M15_M23_C10_US Direction {Unidirectional}
keylset TCP_DB_M15_M23_C10_US Source {Wifi2_15_10CLI Wifi5_40_23_10CLI}
keylset TCP_DB_M15_M23_C10_US Destination {Eth}
#TCP_DB_M15_M23_C25_DS
set TCP_DB_M15_M23_C25_DS ${tcp_goodput}
keylset TCP_DB_M15_M23_C25_DS Direction {Unidirectional}
keylset TCP_DB_M15_M23_C25_DS Source {Eth}
keylset TCP_DB_M15_M23_C25_DS Destination {Wifi2_15_25CLI Wifi5_40_23_25CLI}
#TCP_DB_M15_M23_C25_US
set TCP_DB_M15_M23_C25_US ${tcp_goodput}
keylset TCP_DB_M15_M23_C25_US Direction {Unidirectional}
keylset TCP_DB_M15_M23_C25_US Source {Wifi2_15_25CLI Wifi5_40_23_25CLI}
keylset TCP_DB_M15_M23_C25_US Destination {Eth}



#TCP_DB_M15_M31_C10_DS
set TCP_DB_M15_M31_C10_DS ${tcp_goodput}
keylset TCP_DB_M15_M31_C10_DS Direction {Unidirectional}
keylset TCP_DB_M15_M31_C10_DS Source {Eth}
keylset TCP_DB_M15_M31_C10_DS Destination {Wifi2_15_10CLI Wifi5_40_31_10CLI}
#TCP_DB_M15_M31_C10_US
set TCP_DB_M15_M31_C10_US ${tcp_goodput}
keylset TCP_DB_M15_M31_C10_US Direction {Unidirectional}
keylset TCP_DB_M15_M31_C10_US Source {Wifi2_15_10CLI Wifi5_40_31_10CLI}
keylset TCP_DB_M15_M31_C10_US Destination {Eth}
#TCP_DB_M15_M31_C25_DS
set TCP_DB_M15_M31_C25_DS ${tcp_goodput}
keylset TCP_DB_M15_M31_C25_DS Direction {Unidirectional}
keylset TCP_DB_M15_M31_C25_DS Source {Eth}
keylset TCP_DB_M15_M31_C25_DS Destination {Wifi2_15_25CLI Wifi5_40_31_25CLI}
#TCP_DB_M15_M31_C25_US
set TCP_DB_M15_M31_C25_US ${tcp_goodput}
keylset TCP_DB_M15_M31_C25_US Direction {Unidirectional}
keylset TCP_DB_M15_M31_C25_US Source {Wifi2_15_25CLI Wifi5_40_31_25CLI}
keylset TCP_DB_M15_M31_C25_US Destination {Eth}



#2.4 set at MCS 23 - 5 sweeping through major MCS Levels

#TCP_DB_M23_M7_C10_DS
set TCP_DB_M23_M7_C10_DS ${tcp_goodput}
keylset TCP_DB_M23_M7_C10_DS Direction {Unidirectional}
keylset TCP_DB_M23_M7_C10_DS Source {Eth}
keylset TCP_DB_M23_M7_C10_DS Destination {Wifi2_23_10CLI Wifi5_40_7_10CLI}
#TCP_DB_M23_M7_C10_US
set TCP_DB_M23_M7_C10_US ${tcp_goodput}
keylset TCP_DB_M23_M7_C10_US Direction {Unidirectional}
keylset TCP_DB_M23_M7_C10_US Source {Wifi2_23_10CLI Wifi5_40_7_10CLI}
keylset TCP_DB_M23_M7_C10_US Destination {Eth}
#TCP_DB_M23_M7_C25_DS
set TCP_DB_M23_M7_C25_DS ${tcp_goodput}
keylset TCP_DB_M23_M7_C25_DS Direction {Unidirectional}
keylset TCP_DB_M23_M7_C25_DS Source {Eth}
keylset TCP_DB_M23_M7_C25_DS Destination {Wifi2_23_25CLI Wifi5_40_7_25CLI}
#TCP_DB_M23_M7_C25_US
set TCP_DB_M23_M7_C25_US ${tcp_goodput}
keylset TCP_DB_M23_M7_C25_US Direction {Unidirectional}
keylset TCP_DB_M23_M7_C25_US Source {Wifi2_23_25CLI Wifi5_40_7_25CLI}
keylset TCP_DB_M23_M7_C25_US Destination {Eth}


#TCP_DB_M15_M15_C10_DS
set TCP_DB_M23_M15_C10_DS ${tcp_goodput}
keylset TCP_DB_M23_M15_C10_DS Direction {Unidirectional}
keylset TCP_DB_M23_M15_C10_DS Source {Eth}
keylset TCP_DB_M23_M15_C10_DS Destination {Wifi2_23_10CLI Wifi5_40_15_10CLI}
#TCP_DB_M23_M15_C10_US
set TCP_DB_M23_M15_C10_US ${tcp_goodput}
keylset TCP_DB_M23_M15_C10_US Direction {Unidirectional}
keylset TCP_DB_M23_M15_C10_US Source {Wifi2_23_10CLI Wifi5_40_15_10CLI}
keylset TCP_DB_M23_M15_C10_US Destination {Eth}
#TCP_DB_M23_M15_C25_DS
set TCP_DB_M23_M15_C25_DS ${tcp_goodput}
keylset TCP_DB_M23_M15_C25_DS Direction {Unidirectional}
keylset TCP_DB_M23_M15_C25_DS Source {Eth}
keylset TCP_DB_M23_M15_C25_DS Destination {Wifi2_23_25CLI Wifi5_40_15_25CLI}
#TCP_DB_M23_M15_C25_US
set TCP_DB_M23_M15_C25_US ${tcp_goodput}
keylset TCP_DB_M23_M15_C25_US Direction {Unidirectional}
keylset TCP_DB_M23_M15_C25_US Source {Wifi2_23_25CLI Wifi5_40_15_25CLI}
keylset TCP_DB_M23_M15_C25_US Destination {Eth}



#TCP_DB_M23_M23_C10_DS
set TCP_DB_M23_M23_C10_DS ${tcp_goodput}
keylset TCP_DB_M23_M23_C10_DS Direction {Unidirectional}
keylset TCP_DB_M23_M23_C10_DS Source {Eth}
keylset TCP_DB_M23_M23_C10_DS Destination {Wifi2_23_10CLI Wifi5_40_23_10CLI}
#TCP_DB_M23_M23_C10_US
set TCP_DB_M23_M23_C10_US ${tcp_goodput}
keylset TCP_DB_M23_M23_C10_US Direction {Unidirectional}
keylset TCP_DB_M23_M23_C10_US Source {Wifi2_23_10CLI Wifi5_40_23_10CLI}
keylset TCP_DB_M23_M23_C10_US Destination {Eth}
#TCP_DB_M23_M23_C25_DS
set TCP_DB_M23_M23_C25_DS ${tcp_goodput}
keylset TCP_DB_M23_M23_C25_DS Direction {Unidirectional}
keylset TCP_DB_M23_M23_C25_DS Source {Eth}
keylset TCP_DB_M23_M23_C25_DS Destination {Wifi2_23_25CLI Wifi5_40_23_25CLI}
#TCP_DB_M23_M23_C25_US
set TCP_DB_M23_M23_C25_US ${tcp_goodput}
keylset TCP_DB_M23_M23_C25_US Direction {Unidirectional}
keylset TCP_DB_M23_M23_C25_US Source {Wifi2_23_25CLI Wifi5_40_23_25CLI}
keylset TCP_DB_M23_M23_C25_US Destination {Eth}



#TCP_DB_M23_M31_C10_DS
set TCP_DB_M23_M31_C10_DS ${tcp_goodput}
keylset TCP_DB_M23_M31_C10_DS Direction {Unidirectional}
keylset TCP_DB_M23_M31_C10_DS Source {Eth}
keylset TCP_DB_M23_M31_C10_DS Destination {Wifi2_23_10CLI Wifi5_40_31_10CLI}
#TCP_DB_M23_M31_C10_US
set TCP_DB_M23_M31_C10_US ${tcp_goodput}
keylset TCP_DB_M23_M31_C10_US Direction {Unidirectional}
keylset TCP_DB_M23_M31_C10_US Source {Wifi2_23_10CLI Wifi5_40_31_10CLI}
keylset TCP_DB_M23_M31_C10_US Destination {Eth}
#TCP_DB_M23_M31_C25_DS
set TCP_DB_M23_M31_C25_DS ${tcp_goodput}
keylset TCP_DB_M23_M31_C25_DS Direction {Unidirectional}
keylset TCP_DB_M23_M31_C25_DS Source {Eth}
keylset TCP_DB_M23_M31_C25_DS Destination {Wifi2_23_25CLI Wifi5_40_31_25CLI}
#TCP_DB_M23_M31_C25_US
set TCP_DB_M23_M31_C25_US ${tcp_goodput}
keylset TCP_DB_M23_M31_C25_US Direction {Unidirectional}
keylset TCP_DB_M23_M31_C25_US Source {Wifi2_23_25CLI Wifi5_40_31_25CLI}
keylset TCP_DB_M23_M31_C25_US Destination {Eth}


#2.4 set at MCS 31 - 5 sweeping through major MCS Levels

#TCP_DB_M31_M7_C10_DS
set TCP_DB_M31_M7_C10_DS ${tcp_goodput}
keylset TCP_DB_M31_M7_C10_DS Direction {Unidirectional}
keylset TCP_DB_M31_M7_C10_DS Source {Eth}
keylset TCP_DB_M31_M7_C10_DS Destination {Wifi2_31_10CLI Wifi5_40_7_10CLI}
#TCP_DB_M31_M7_C10_US
set TCP_DB_M31_M7_C10_US ${tcp_goodput}
keylset TCP_DB_M31_M7_C10_US Direction {Unidirectional}
keylset TCP_DB_M31_M7_C10_US Source {Wifi2_31_10CLI Wifi5_40_7_10CLI}
keylset TCP_DB_M31_M7_C10_US Destination {Eth}
#TCP_DB_M31_M7_C25_DS
set TCP_DB_M31_M7_C25_DS ${tcp_goodput}
keylset TCP_DB_M31_M7_C25_DS Direction {Unidirectional}
keylset TCP_DB_M31_M7_C25_DS Source {Eth}
keylset TCP_DB_M31_M7_C25_DS Destination {Wifi2_31_25CLI Wifi5_40_7_25CLI}
#TCP_DB_M31_M7_C25_US
set TCP_DB_M31_M7_C25_US ${tcp_goodput}
keylset TCP_DB_M31_M7_C25_US Direction {Unidirectional}
keylset TCP_DB_M31_M7_C25_US Source {Wifi2_31_25CLI Wifi5_40_7_25CLI}
keylset TCP_DB_M31_M7_C25_US Destination {Eth}


#TCP_DB_M15_M15_C10_DS
set TCP_DB_M31_M15_C10_DS ${tcp_goodput}
keylset TCP_DB_M31_M15_C10_DS Direction {Unidirectional}
keylset TCP_DB_M31_M15_C10_DS Source {Eth}
keylset TCP_DB_M31_M15_C10_DS Destination {Wifi2_31_10CLI Wifi5_40_15_10CLI}
#TCP_DB_M31_M15_C10_US
set TCP_DB_M31_M15_C10_US ${tcp_goodput}
keylset TCP_DB_M31_M15_C10_US Direction {Unidirectional}
keylset TCP_DB_M31_M15_C10_US Source {Wifi2_31_10CLI Wifi5_40_15_10CLI}
keylset TCP_DB_M31_M15_C10_US Destination {Eth}
#TCP_DB_M31_M15_C25_DS
set TCP_DB_M31_M15_C25_DS ${tcp_goodput}
keylset TCP_DB_M31_M15_C25_DS Direction {Unidirectional}
keylset TCP_DB_M31_M15_C25_DS Source {Eth}
keylset TCP_DB_M31_M15_C25_DS Destination {Wifi2_31_25CLI Wifi5_40_15_25CLI}
#TCP_DB_M31_M15_C25_US
set TCP_DB_M31_M15_C25_US ${tcp_goodput}
keylset TCP_DB_M31_M15_C25_US Direction {Unidirectional}
keylset TCP_DB_M31_M15_C25_US Source {Wifi2_31_25CLI Wifi5_40_15_25CLI}
keylset TCP_DB_M31_M15_C25_US Destination {Eth}



#TCP_DB_M31_M23_C10_DS
set TCP_DB_M31_M23_C10_DS ${tcp_goodput}
keylset TCP_DB_M31_M23_C10_DS Direction {Unidirectional}
keylset TCP_DB_M31_M23_C10_DS Source {Eth}
keylset TCP_DB_M31_M23_C10_DS Destination {Wifi2_31_10CLI Wifi5_40_23_10CLI}
#TCP_DB_M31_M23_C10_US
set TCP_DB_M31_M23_C10_US ${tcp_goodput}
keylset TCP_DB_M31_M23_C10_US Direction {Unidirectional}
keylset TCP_DB_M31_M23_C10_US Source {Wifi2_31_10CLI Wifi5_40_23_10CLI}
keylset TCP_DB_M31_M23_C10_US Destination {Eth}
#TCP_DB_M31_M23_C25_DS
set TCP_DB_M31_M23_C25_DS ${tcp_goodput}
keylset TCP_DB_M31_M23_C25_DS Direction {Unidirectional}
keylset TCP_DB_M31_M23_C25_DS Source {Eth}
keylset TCP_DB_M31_M23_C25_DS Destination {Wifi2_31_25CLI Wifi5_40_23_25CLI}
#TCP_DB_M31_M23_C25_US
set TCP_DB_M31_M23_C25_US ${tcp_goodput}
keylset TCP_DB_M31_M23_C25_US Direction {Unidirectional}
keylset TCP_DB_M31_M23_C25_US Source {Wifi2_31_25CLI Wifi5_40_23_25CLI}
keylset TCP_DB_M31_M23_C25_US Destination {Eth}



#TCP_DB_M31_M31_C10_DS
set TCP_DB_M31_M31_C10_DS ${tcp_goodput}
keylset TCP_DB_M31_M31_C10_DS Direction {Unidirectional}
keylset TCP_DB_M31_M31_C10_DS Source {Eth}
keylset TCP_DB_M31_M31_C10_DS Destination {Wifi2_31_10CLI Wifi5_40_31_10CLI}
#TCP_DB_M31_M31_C10_US
set TCP_DB_M31_M31_C10_US ${tcp_goodput}
keylset TCP_DB_M31_M31_C10_US Direction {Unidirectional}
keylset TCP_DB_M31_M31_C10_US Source {Wifi2_31_10CLI Wifi5_40_31_10CLI}
keylset TCP_DB_M31_M31_C10_US Destination {Eth}
#TCP_DB_M31_M31_C25_DS
set TCP_DB_M31_M31_C25_DS ${tcp_goodput}
keylset TCP_DB_M31_M31_C25_DS Direction {Unidirectional}
keylset TCP_DB_M31_M31_C25_DS Source {Eth}
keylset TCP_DB_M31_M31_C25_DS Destination {Wifi2_31_25CLI Wifi5_40_31_25CLI}
#TCP_DB_M31_M31_C25_US
set TCP_DB_M31_M31_C25_US ${tcp_goodput}
keylset TCP_DB_M31_M31_C25_US Direction {Unidirectional}
keylset TCP_DB_M31_M31_C25_US Source {Wifi2_31_25CLI Wifi5_40_31_25CLI}
keylset TCP_DB_M31_M31_C25_US Destination {Eth}


#TCP 24 and 580 AC tests
#### TCP_DB_SS_MCS5G_MCS24G_Clients_Direction


#2.4 set at MCS 7 - 5 sweeping through major spatial stream and MCS levels

#TCP_DB_S1_M7_M9_C10_DS
set TCP_DB_S1_M7_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S1_M7_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S1_M7_M9_C10_DS Source {Eth}
keylset TCP_DB_S1_M7_M9_C10_DS Destination {Wifi2_7_10CLI Wifi5_AC_S1_9_10CLI}
#TCP_DB_S1_M7_M9_C10_US
set TCP_DB_S1_M7_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S1_M7_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S1_M7_M9_C10_US Source {Wifi2_7_10CLI Wifi5_AC_S1_9_10CLI}
keylset TCP_DB_S1_M7_M9_C10_US Destination {Eth}
#TCP_DB_S1_M7_M9_C25_DS
set TCP_DB_S1_M7_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S1_M7_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S1_M7_M9_C25_DS Source {Eth}
keylset TCP_DB_S1_M7_M9_C25_DS Destination {Wifi2_7_25CLI Wifi5_AC_S1_9_25CLI}
#TCP_DB_S1_M7_M9_C25_US
set TCP_DB_S1_M7_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S1_M7_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S1_M7_M9_C25_US Source {Wifi2_7_25CLI Wifi5_AC_S1_9_25CLI}
keylset TCP_DB_S1_M7_M9_C25_US Destination {Eth}


#TCP_DB_S2_M7_M9_C10_DS
set TCP_DB_S2_M7_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S2_M7_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S2_M7_M9_C10_DS Source {Eth}
keylset TCP_DB_S2_M7_M9_C10_DS Destination {Wifi2_7_10CLI Wifi5_AC_S2_9_10CLI}
#TCP_DB_S2_M7_M9_C10_US
set TCP_DB_S2_M7_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S2_M7_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S2_M7_M9_C10_US Source {Wifi2_7_10CLI Wifi5_AC_S2_9_10CLI}
keylset TCP_DB_S2_M7_M9_C10_US Destination {Eth}
#TCP_DB_S2_M7_M9_C25_DS
set TCP_DB_S2_M7_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S2_M7_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S2_M7_M9_C25_DS Source {Eth}
keylset TCP_DB_S2_M7_M9_C25_DS Destination {Wifi2_7_25CLI Wifi5_AC_S2_9_25CLI}
#TCP_DB_S2_M7_M9_C25_US
set TCP_DB_S2_M7_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S2_M7_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S2_M7_M9_C25_US Source {Wifi2_7_25CLI Wifi5_AC_S2_9_25CLI}
keylset TCP_DB_S2_M7_M9_C25_US Destination {Eth}



#TCP_DB_S3_M7_M9_C10_DS
set TCP_DB_S3_M7_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S3_M7_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S3_M7_M9_C10_DS Source {Eth}
keylset TCP_DB_S3_M7_M9_C10_DS Destination {Wifi2_7_10CLI Wifi5_AC_S3_9_10CLI}
#TCP_DB_S3_M7_M9_C10_US
set TCP_DB_S3_M7_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S3_M7_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S3_M7_M9_C10_US Source {Wifi2_7_10CLI Wifi5_AC_S3_9_10CLI}
keylset TCP_DB_S3_M7_M9_C10_US Destination {Eth}
#TCP_DB_S3_M7_M9_C25_DS
set TCP_DB_S3_M7_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S3_M7_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S3_M7_M9_C25_DS Source {Eth}
keylset TCP_DB_S3_M7_M9_C25_DS Destination {Wifi2_7_25CLI Wifi5_AC_S3_9_25CLI}
#TCP_DB_S3_M7_M9_C25_US
set TCP_DB_S3_M7_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S3_M7_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S3_M7_M9_C25_US Source {Wifi2_7_25CLI Wifi5_AC_S3_9_25CLI}
keylset TCP_DB_S3_M7_M9_C25_US Destination {Eth}


#TCP_DB_S4_M7_M9_C10_DS
set TCP_DB_S4_M7_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S4_M7_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S4_M7_M9_C10_DS Source {Eth}
keylset TCP_DB_S4_M7_M9_C10_DS Destination {Wifi2_7_10CLI Wifi5_AC_S4_9_10CLI}
#TCP_DB_S4_M7_M9_C10_US
set TCP_DB_S4_M7_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S4_M7_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S4_M7_M9_C10_US Source {Wifi2_7_10CLI Wifi5_AC_S4_9_10CLI}
keylset TCP_DB_S4_M7_M9_C10_US Destination {Eth}
#TCP_DB_S4_M7_M9_C25_DS
set TCP_DB_S4_M7_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S4_M7_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S4_M7_M9_C25_DS Source {Eth}
keylset TCP_DB_S4_M7_M9_C25_DS Destination {Wifi2_7_25CLI Wifi5_AC_S4_9_25CLI}
#TCP_DB_S4_M7_M9_C25_US
set TCP_DB_S4_M7_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S4_M7_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S4_M7_M9_C25_US Source {Wifi2_7_25CLI Wifi5_AC_S4_9_25CLI}
keylset TCP_DB_S4_M7_M9_C25_US Destination {Eth}




#2.4 set at MCS 15 - 5 sweeping through major spatial stream and MCS levels

#TCP_DB_S1_M15_M9_C10_DS
set TCP_DB_S1_M15_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S1_M15_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S1_M15_M9_C10_DS Source {Eth}
keylset TCP_DB_S1_M15_M9_C10_DS Destination {Wifi2_15_10CLI Wifi5_AC_S1_9_10CLI}
#TCP_DB_S1_M15_M9_C10_US
set TCP_DB_S1_M15_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S1_M15_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S1_M15_M9_C10_US Source {Wifi2_15_10CLI Wifi5_AC_S1_9_10CLI}
keylset TCP_DB_S1_M15_M9_C10_US Destination {Eth}
#TCP_DB_S1_M15_M9_C25_DS
set TCP_DB_S1_M15_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S1_M15_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S1_M15_M9_C25_DS Source {Eth}
keylset TCP_DB_S1_M15_M9_C25_DS Destination {Wifi2_15_25CLI Wifi5_AC_S1_9_25CLI}
#TCP_DB_S1_M15_M9_C25_US
set TCP_DB_S1_M15_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S1_M15_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S1_M15_M9_C25_US Source {Wifi2_15_25CLI Wifi5_AC_S1_9_25CLI}
keylset TCP_DB_S1_M15_M9_C25_US Destination {Eth}


#TCP_DB_S2_M15_M9_C10_DS
set TCP_DB_S2_M15_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S2_M15_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S2_M15_M9_C10_DS Source {Eth}
keylset TCP_DB_S2_M15_M9_C10_DS Destination {Wifi2_15_10CLI Wifi5_AC_S2_9_10CLI}
#TCP_DB_S2_M15_M9_C10_US
set TCP_DB_S2_M15_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S2_M15_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S2_M15_M9_C10_US Source {Wifi2_15_10CLI Wifi5_AC_S2_9_10CLI}
keylset TCP_DB_S2_M15_M9_C10_US Destination {Eth}
#TCP_DB_S2_M15_M9_C25_DS
set TCP_DB_S2_M15_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S2_M15_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S2_M15_M9_C25_DS Source {Eth}
keylset TCP_DB_S2_M15_M9_C25_DS Destination {Wifi2_15_25CLI Wifi5_AC_S2_9_25CLI}
#TCP_DB_S2_M15_M9_C25_US
set TCP_DB_S2_M15_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S2_M15_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S2_M15_M9_C25_US Source {Wifi2_15_25CLI Wifi5_AC_S2_9_25CLI}
keylset TCP_DB_S2_M15_M9_C25_US Destination {Eth}



#TCP_DB_S3_M15_M9_C10_DS
set TCP_DB_S3_M15_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S3_M15_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S3_M15_M9_C10_DS Source {Eth}
keylset TCP_DB_S3_M15_M9_C10_DS Destination {Wifi2_15_10CLI Wifi5_AC_S3_9_10CLI}
#TCP_DB_S3_M15_M9_C10_US
set TCP_DB_S3_M15_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S3_M15_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S3_M15_M9_C10_US Source {Wifi2_15_10CLI Wifi5_AC_S3_9_10CLI}
keylset TCP_DB_S3_M15_M9_C10_US Destination {Eth}
#TCP_DB_S3_M15_M9_C25_DS
set TCP_DB_S3_M15_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S3_M15_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S3_M15_M9_C25_DS Source {Eth}
keylset TCP_DB_S3_M15_M9_C25_DS Destination {Wifi2_15_25CLI Wifi5_AC_S3_9_25CLI}
#TCP_DB_S3_M15_M9_C25_US
set TCP_DB_S3_M15_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S3_M15_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S3_M15_M9_C25_US Source {Wifi2_15_25CLI Wifi5_AC_S3_9_25CLI}
keylset TCP_DB_S3_M15_M9_C25_US Destination {Eth}


#TCP_DB_S4_M15_M9_C10_DS
set TCP_DB_S4_M15_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S4_M15_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S4_M15_M9_C10_DS Source {Eth}
keylset TCP_DB_S4_M15_M9_C10_DS Destination {Wifi2_15_10CLI Wifi5_AC_S4_9_10CLI}
#TCP_DB_S4_M15_M9_C10_US
set TCP_DB_S4_M15_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S4_M15_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S4_M15_M9_C10_US Source {Wifi2_15_10CLI Wifi5_AC_S4_9_10CLI}
keylset TCP_DB_S4_M15_M9_C10_US Destination {Eth}
#TCP_DB_S4_M15_M9_C25_DS
set TCP_DB_S4_M15_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S4_M15_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S4_M15_M9_C25_DS Source {Eth}
keylset TCP_DB_S4_M15_M9_C25_DS Destination {Wifi2_15_25CLI Wifi5_AC_S4_9_25CLI}
#TCP_DB_S4_M15_M9_C25_US
set TCP_DB_S4_M15_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S4_M15_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S4_M15_M9_C25_US Source {Wifi2_15_25CLI Wifi5_AC_S4_9_25CLI}
keylset TCP_DB_S4_M15_M9_C25_US Destination {Eth}



#2.4 set at MCS 23 - 5 sweeping through major spatial stream and MCS levels

#TCP_DB_S1_M23_M9_C10_DS
set TCP_DB_S1_M23_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S1_M23_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S1_M23_M9_C10_DS Source {Eth}
keylset TCP_DB_S1_M23_M9_C10_DS Destination {Wifi2_23_10CLI Wifi5_AC_S1_9_10CLI}
#TCP_DB_S1_M23_M9_C10_US
set TCP_DB_S1_M23_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S1_M23_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S1_M23_M9_C10_US Source {Wifi2_23_10CLI Wifi5_AC_S1_9_10CLI}
keylset TCP_DB_S1_M23_M9_C10_US Destination {Eth}
#TCP_DB_S1_M23_M9_C25_DS
set TCP_DB_S1_M23_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S1_M23_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S1_M23_M9_C25_DS Source {Eth}
keylset TCP_DB_S1_M23_M9_C25_DS Destination {Wifi2_23_25CLI Wifi5_AC_S1_9_25CLI}
#TCP_DB_S1_M23_M9_C25_US
set TCP_DB_S1_M23_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S1_M23_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S1_M23_M9_C25_US Source {Wifi2_23_25CLI Wifi5_AC_S1_9_25CLI}
keylset TCP_DB_S1_M23_M9_C25_US Destination {Eth}


#TCP_DB_S2_M23_M9_C10_DS
set TCP_DB_S2_M23_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S2_M23_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S2_M23_M9_C10_DS Source {Eth}
keylset TCP_DB_S2_M23_M9_C10_DS Destination {Wifi2_23_10CLI Wifi5_AC_S2_9_10CLI}
#TCP_DB_S2_M23_M9_C10_US
set TCP_DB_S2_M23_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S2_M23_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S2_M23_M9_C10_US Source {Wifi2_23_10CLI Wifi5_AC_S2_9_10CLI}
keylset TCP_DB_S2_M23_M9_C10_US Destination {Eth}
#TCP_DB_S2_M23_M9_C25_DS
set TCP_DB_S2_M23_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S2_M23_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S2_M23_M9_C25_DS Source {Eth}
keylset TCP_DB_S2_M23_M9_C25_DS Destination {Wifi2_23_25CLI Wifi5_AC_S2_9_25CLI}
#TCP_DB_S2_M23_M9_C25_US
set TCP_DB_S2_M23_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S2_M23_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S2_M23_M9_C25_US Source {Wifi2_23_25CLI Wifi5_AC_S2_9_25CLI}
keylset TCP_DB_S2_M23_M9_C25_US Destination {Eth}



#TCP_DB_S3_M23_M9_C10_DS
set TCP_DB_S3_M23_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S3_M23_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S3_M23_M9_C10_DS Source {Eth}
keylset TCP_DB_S3_M23_M9_C10_DS Destination {Wifi2_23_10CLI Wifi5_AC_S3_9_10CLI}
#TCP_DB_S3_M23_M9_C10_US
set TCP_DB_S3_M23_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S3_M23_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S3_M23_M9_C10_US Source {Wifi2_23_10CLI Wifi5_AC_S3_9_10CLI}
keylset TCP_DB_S3_M23_M9_C10_US Destination {Eth}
#TCP_DB_S3_M23_M9_C25_DS
set TCP_DB_S3_M23_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S3_M23_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S3_M23_M9_C25_DS Source {Eth}
keylset TCP_DB_S3_M23_M9_C25_DS Destination {Wifi2_23_25CLI Wifi5_AC_S3_9_25CLI}
#TCP_DB_S3_M23_M9_C25_US
set TCP_DB_S3_M23_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S3_M23_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S3_M23_M9_C25_US Source {Wifi2_23_25CLI Wifi5_AC_S3_9_25CLI}
keylset TCP_DB_S3_M23_M9_C25_US Destination {Eth}


#TCP_DB_S4_M23_M9_C10_DS
set TCP_DB_S4_M23_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S4_M23_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S4_M23_M9_C10_DS Source {Eth}
keylset TCP_DB_S4_M23_M9_C10_DS Destination {Wifi2_23_10CLI Wifi5_AC_S4_9_10CLI}
#TCP_DB_S4_M23_M9_C10_US
set TCP_DB_S4_M23_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S4_M23_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S4_M23_M9_C10_US Source {Wifi2_23_10CLI Wifi5_AC_S4_9_10CLI}
keylset TCP_DB_S4_M23_M9_C10_US Destination {Eth}
#TCP_DB_S4_M23_M9_C25_DS
set TCP_DB_S4_M23_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S4_M23_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S4_M23_M9_C25_DS Source {Eth}
keylset TCP_DB_S4_M23_M9_C25_DS Destination {Wifi2_23_25CLI Wifi5_AC_S4_9_25CLI}
#TCP_DB_S4_M23_M9_C25_US
set TCP_DB_S4_M23_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S4_M23_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S4_M23_M9_C25_US Source {Wifi2_23_25CLI Wifi5_AC_S4_9_25CLI}
keylset TCP_DB_S4_M23_M9_C25_US Destination {Eth}



#2.4 set at MCS 31 - 5 sweeping through major spatial stream and MCS levels

#TCP_DB_S1_M31_M9_C10_DS
set TCP_DB_S1_M31_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S1_M31_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S1_M31_M9_C10_DS Source {Eth}
keylset TCP_DB_S1_M31_M9_C10_DS Destination {Wifi2_31_10CLI Wifi5_AC_S1_9_10CLI}
#TCP_DB_S1_M31_M9_C10_US
set TCP_DB_S1_M31_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S1_M31_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S1_M31_M9_C10_US Source {Wifi2_31_10CLI Wifi5_AC_S1_9_10CLI}
keylset TCP_DB_S1_M31_M9_C10_US Destination {Eth}
#TCP_DB_S1_M31_M9_C25_DS
set TCP_DB_S1_M31_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S1_M31_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S1_M31_M9_C25_DS Source {Eth}
keylset TCP_DB_S1_M31_M9_C25_DS Destination {Wifi2_31_25CLI Wifi5_AC_S1_9_25CLI}
#TCP_DB_S1_M31_M9_C25_US
set TCP_DB_S1_M31_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S1_M31_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S1_M31_M9_C25_US Source {Wifi2_31_25CLI Wifi5_AC_S1_9_25CLI}
keylset TCP_DB_S1_M31_M9_C25_US Destination {Eth}


#TCP_DB_S2_M31_M9_C10_DS
set TCP_DB_S2_M31_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S2_M31_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S2_M31_M9_C10_DS Source {Eth}
keylset TCP_DB_S2_M31_M9_C10_DS Destination {Wifi2_31_10CLI Wifi5_AC_S2_9_10CLI}
#TCP_DB_S2_M31_M9_C10_US
set TCP_DB_S2_M31_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S2_M31_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S2_M31_M9_C10_US Source {Wifi2_31_10CLI Wifi5_AC_S2_9_10CLI}
keylset TCP_DB_S2_M31_M9_C10_US Destination {Eth}
#TCP_DB_S2_M31_M9_C25_DS
set TCP_DB_S2_M31_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S2_M31_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S2_M31_M9_C25_DS Source {Eth}
keylset TCP_DB_S2_M31_M9_C25_DS Destination {Wifi2_31_25CLI Wifi5_AC_S2_9_25CLI}
#TCP_DB_S2_M31_M9_C25_US
set TCP_DB_S2_M31_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S2_M31_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S2_M31_M9_C25_US Source {Wifi2_31_25CLI Wifi5_AC_S2_9_25CLI}
keylset TCP_DB_S2_M31_M9_C25_US Destination {Eth}



#TCP_DB_S3_M31_M9_C10_DS
set TCP_DB_S3_M31_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S3_M31_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S3_M31_M9_C10_DS Source {Eth}
keylset TCP_DB_S3_M31_M9_C10_DS Destination {Wifi2_31_10CLI Wifi5_AC_S3_9_10CLI}
#TCP_DB_S3_M31_M9_C10_US
set TCP_DB_S3_M31_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S3_M31_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S3_M31_M9_C10_US Source {Wifi2_31_10CLI Wifi5_AC_S3_9_10CLI}
keylset TCP_DB_S3_M31_M9_C10_US Destination {Eth}
#TCP_DB_S3_M31_M9_C25_DS
set TCP_DB_S3_M31_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S3_M31_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S3_M31_M9_C25_DS Source {Eth}
keylset TCP_DB_S3_M31_M9_C25_DS Destination {Wifi2_31_25CLI Wifi5_AC_S3_9_25CLI}
#TCP_DB_S3_M31_M9_C25_US
set TCP_DB_S3_M31_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S3_M31_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S3_M31_M9_C25_US Source {Wifi2_31_25CLI Wifi5_AC_S3_9_25CLI}
keylset TCP_DB_S3_M31_M9_C25_US Destination {Eth}


#TCP_DB_S4_M31_M9_C10_DS
set TCP_DB_S4_M31_M9_C10_DS ${tcp_goodput}
keylset TCP_DB_S4_M31_M9_C10_DS Direction {Unidirectional}
keylset TCP_DB_S4_M31_M9_C10_DS Source {Eth}
keylset TCP_DB_S4_M31_M9_C10_DS Destination {Wifi2_31_10CLI Wifi5_AC_S4_9_10CLI}
#TCP_DB_S4_M31_M9_C10_US
set TCP_DB_S4_M31_M9_C10_US ${tcp_goodput}
keylset TCP_DB_S4_M31_M9_C10_US Direction {Unidirectional}
keylset TCP_DB_S4_M31_M9_C10_US Source {Wifi2_31_10CLI Wifi5_AC_S4_9_10CLI}
keylset TCP_DB_S4_M31_M9_C10_US Destination {Eth}
#TCP_DB_S4_M31_M9_C25_DS
set TCP_DB_S4_M31_M9_C25_DS ${tcp_goodput}
keylset TCP_DB_S4_M31_M9_C25_DS Direction {Unidirectional}
keylset TCP_DB_S4_M31_M9_C25_DS Source {Eth}
keylset TCP_DB_S4_M31_M9_C25_DS Destination {Wifi2_31_25CLI Wifi5_AC_S4_9_25CLI}
#TCP_DB_S4_M31_M9_C25_US
set TCP_DB_S4_M31_M9_C25_US ${tcp_goodput}
keylset TCP_DB_S4_M31_M9_C25_US Direction {Unidirectional}
keylset TCP_DB_S4_M31_M9_C25_US Source {Wifi2_31_25CLI Wifi5_AC_S4_9_25CLI}
keylset TCP_DB_S4_M31_M9_C25_US Destination {Eth}








#Port list for port specific options
keylset global_config Ports {generic_dut_0 generic_dut_1 generic_dut_2 generic_dut_5}

#Generic Dut Definitions

#Generic Dut - generic_dut_0
keylset generic_dut_0 used True
keylset generic_dut_0 Vendor generic
keylset generic_dut_0 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_0 APSWVersion $VENDORFW
keylset generic_dut_0 APModel $VENDORMODEL
keylset generic_dut_0 Interface.802_3.BindStatus True
keylset generic_dut_0 Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_0 Interface.802_3.EthernetSpeed 1000
keylset generic_dut_0 Interface.802_3.Duplex full
keylset generic_dut_0 Interface.802_3.Autonegotiation on
# 7.3 Update:
keylset generic_dut_0 Interface.802_3.ClientBackoff True
keylset generic_dut_0 Interface.802_3.InterfaceType 802.3
keylset generic_dut_0 Interface.802_3.EnableRxAttenuation on
keylset generic_dut_0 Interface.802_3.SecondaryChannelPlacement defer
keylset generic_dut_0 WLANSwitchModel $WLANSwitchModel

#Generic Dut - generic_dut_1
keylset generic_dut_1 used True
keylset generic_dut_1 Vendor generic
keylset generic_dut_1 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_1 APSWVersion $VENDORFW
keylset generic_dut_1 APModel $VENDORMODEL
keylset generic_dut_1 Interface.802_3.BindStatus True
keylset generic_dut_1 Interface.802_3.WavetestPort $Card_Eth_2
keylset generic_dut_1 Interface.802_3.EthernetSpeed 1000
keylset generic_dut_1 Interface.802_3.Duplex full
keylset generic_dut_1 Interface.802_3.Autonegotiation on
# 7.3 Update:
keylset generic_dut_1 Interface.802_3.ClientBackoff True
keylset generic_dut_1 Interface.802_3.InterfaceType 802.3
keylset generic_dut_1 Interface.802_3.EnableRxAttenuation on
keylset generic_dut_1 Interface.802_3.SecondaryChannelPlacement defer
keylset generic_dut_1 WLANSwitchModel $WLANSwitchModel


#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_2 APSWVersion $VENDORFW
keylset generic_dut_2 APModel $VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
# 7.3 Update:
keylset generic_dut_2 Interface.802_11ac.ClientBackoff True
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11n
keylset generic_dut_2 Interface.802_11ac.EnableRxAttenuation $ATTN24
keylset generic_dut_2 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_2 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_2 WLANSwitchModel $WLANSwitchModel
keylset generic_dut_2 Interface.802_11ac.ChannelBandwidth 40

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
# 7.3 Update:
keylset generic_dut_5 Interface.802_11ac.ClientBackoff True
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.EnableRxAttenuation $ATTN5
keylset generic_dut_5 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel $WLANSwitchModel
keylset generic_dut_5 Interface.802_11ac.ChannelBandwidth 80


#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

