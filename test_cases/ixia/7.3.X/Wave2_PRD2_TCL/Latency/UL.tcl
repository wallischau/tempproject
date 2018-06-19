
#Auto-generated from: unicast_latency.wml
#At: 2014-02-24 14:07:24.564000
source $ipv6_defaults_tcl
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Direction {Unidirectional}
keylset global_config Source {Wifi2}
keylset global_config Destination {Eth}

#Traffics Global Options

keylset global_config PayloadData None

#TestParameters Global Options
keylset global_config Ipv6PrefFlag 1
keylset global_config RandomSeed 1142638611

#Connection Global Options

#LogsAndResultsInfo Global Options
set Card_24 $card_24_ip
set Card_5 $card_5_ip
set Card_Eth $card_eth_ip
set SSID_24 $ssid_24
set SSID_5 $ssid_5
set VENDORNAME $vendor_name
set VENDORMODEL $vendor_model
set VENDORFW $vendor_firmware
set LANSModel none
set LANSFW none
set ATTN24 off
set ATTN5 off
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir

#Learning Global Options


#Mapping Options
keylset global_config FlowType UDP

#Wireless Group Count
keylset global_config WirelessGroupCount 1

#Tests - you may define more than one in a TCL list.
#Master list
#{LAT_24_20_MG_C1_US LAT_24_20_MG_C1_DS LAT_24_20_M7_C1_US LAT_24_20_M7_C1_DS LAT_24_20_M15_C1_US LAT_24_20_M15_C1_DS LAT_24_20_M23_C1_US LAT_24_20_M23_C1_DS LAT_5_20_MA_C1_US LAT_5_20_MA_C1_DS LAT_5_20_M7_C1_US LAT_5_20_M7_C1_DS LAT_5_20_M15_C1_US LAT_5_20_M15_C1_DS LAT_5_20_M23_C1_US LAT_5_20_M23_C1_DS LAT_5_40_M7_C1_US LAT_5_40_M7_C1_DS LAT_5_40_M15_C1_US LAT_5_40_M15_C1_DS LAT_5_40_M23_C1_US LAT_5_40_M23_C1_DS LAT_MG_C1_DB_US LAT_MG_C1_DB_DS LAT_M7_C1_DB_US LAT_M7_C1_DB_DS LAT_M15_C1_DB_US LAT_M15_C1_DB_DS LAT_M23_C1_DB_US LAT_M23_C1_DB_DS}
keylset global_config TestList ${test_list}

#Group Eth
keylset Eth GroupType 802.3
keylset Eth Dut generic_dut_0

#Group Eth - Client Options
keylset Eth Hops -1
keylset Eth Dhcp Enable
keylset Eth Dhcpv6 Enable
keylset Eth Ipv6Flag 1
keylset Eth GratuitousArp True
keylset Eth MacAddress None
keylset Eth Gateway 192.168.1.1
keylset Eth Qos Disable
keylset Eth BaseIp 192.168.1.11

#Group Eth - Security Options
keylset Eth Method {None}
keylset Eth EnableValidateCertificate off

#Group Ethv6
keylset Ethv6 GroupType 802.3
keylset Ethv6 Dut generic_dut_0

#Group Ethv6 - Client Options
keylset Ethv6 Hops -1
keylset Ethv6 Dhcp Enable
keylset Ethv6 Dhcpv6 Enable
keylset Ethv6 Ipv6Flag 1
keylset Ethv6 GratuitousArp True
keylset Ethv6 MacAddress None
keylset Ethv6 Gateway 192.168.1.1
keylset Ethv6 Qos Disable
keylset Ethv6 BaseIp 192.168.1.10

#Group Ethv6 - Security Options
keylset Ethv6 Method {None}
keylset Ethv6 EnableValidateCertificate off

#Group Wifi2
keylset Wifi2 GroupType 802.11n
keylset Wifi2 Dut generic_dut_2

#Group Wifi2 - Client Options
keylset Wifi2 Ssid $SSID_24
keylset Wifi2 Hops 0
keylset Wifi2 Dhcp Enable
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
keylset Wifi2 Channel 6

ipv6_interface Wifi2 24

#Group Wifi2 - Security Options
keylset Wifi2 Method {WPA2-PSK}
keylset Wifi2 EnableValidateCertificate off
keylset Wifi2 PskAscii charter123

#Group Wifi5
keylset Wifi5 GroupType 802.11ac
keylset Wifi5 Dut generic_dut_5

#Group Wifi5 - Client Options
keylset Wifi5 Ssid $SSID_5
keylset Wifi5 Dhcp Enable
keylset Wifi5 Dhcpv6 Enable
keylset Wifi5 Ipv6Flag 1
keylset Wifi5 GratuitousArp True
keylset Wifi5 MacAddress 00:00:01:00:00:01
keylset Wifi5 MacAddressIncr 1
keylset Wifi5 PlcpConfiguration mixed
keylset Wifi5 ChannelBandwidth 40
keylset Wifi5 EnableAMSDUrxaggregation False
keylset Wifi5 EnableAMSDUtxaggregation False
keylset Wifi5 EnableAMPDUaggregation True
keylset Wifi5 ChannelModel Bypass
keylset Wifi5 KeepAlive True
keylset Wifi5 DataMcsIndex {7}
keylset Wifi5 NumTxAntennas $Num5Antennas
keylset Wifi5 GuardInterval short
keylset Wifi5 Gateway 192.168.1.1
keylset Wifi5 phyInterface 802.11n
keylset Wifi5 MgmtPhyRate 24
keylset Wifi5 Qos Enable
keylset Wifi5 BaseIp 192.168.1.12
keylset Wifi5 Channel 149

ipv6_interface Wifi5 5

#Group Wifi5 - Security Options
keylset Wifi5 Method {WPA2-PSK}
keylset Wifi5 EnableValidateCertificate off
keylset Wifi5 PskAscii charter123

#2.4 20
set Wifi2_7_1CLI ${Wifi2}
keylset Wifi2_7_1CLI DataMcsIndex 7
keylset Wifi2_7_1CLI NumClients 1

set Wifi2_15_1CLI ${Wifi2}
keylset Wifi2_15_1CLI DataMcsIndex 15
keylset Wifi2_15_1CLI NumClients 1

set Wifi2_23_1CLI ${Wifi2}
keylset Wifi2_23_1CLI DataMcsIndex 23
keylset Wifi2_23_1CLI NumClients 1

set Wifi2_31_1CLI ${Wifi2}
keylset Wifi2_31_1CLI DataMcsIndex 31
keylset Wifi2_31_1CLI NumClients 1


#540
set Wifi5_40 ${Wifi5}
keylset Wifi5_40 ChannelBandwidth 40

set Wifi5_40_7_1CLI ${Wifi5_40}
keylset Wifi5_40_7_1CLI DataMcsIndex 7
keylset Wifi5_40_7_1CLI NumClients 1

set Wifi5_40_15_1CLI ${Wifi5_40}
keylset Wifi5_40_15_1CLI DataMcsIndex 15
keylset Wifi5_40_15_1CLI NumClients 1

set Wifi5_40_23_1CLI ${Wifi5_40}
keylset Wifi5_40_23_1CLI DataMcsIndex 23
keylset Wifi5_40_23_1CLI NumClients 1

set Wifi5_40_31_1CLI ${Wifi5_40}
keylset Wifi5_40_31_1CLI DataMcsIndex 31
keylset Wifi5_40_31_1CLI NumClients 1


#580
set Wifi5_80 ${Wifi5}
keylset Wifi5_80 ChannelBandwidth 80
keylset Wifi5_80 phyInterface 802.11ac
keylset Wifi5_80 PlcpConfiguration vht_mixed


set Wifi5_AC_SP1_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP1_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP1_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP1_9_1CLI NumClients 1
keylset Wifi5_AC_SP1_9_1CLI NumSpatialStreams 1

set Wifi5_AC_SP2_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP2_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP2_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP2_9_1CLI NumClients 1
keylset Wifi5_AC_SP2_9_1CLI NumSpatialStreams 2

set Wifi5_AC_SP3_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP3_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP3_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP3_9_1CLI NumClients 1
keylset Wifi5_AC_SP3_9_1CLI NumSpatialStreams 3

set Wifi5_AC_SP4_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP4_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP4_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP4_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP4_9_1CLI NumClients 1
keylset Wifi5_AC_SP4_9_1CLI NumSpatialStreams 4

#############################################
# NOTE: PRD states ILoad = 90% of achieved UDP throughput for similar flow group
#       Please adjust values accordingly
#############################################


# 2.4 GHz Options

#unicast_latency MCS7 US Options
keylset LAT_24_20_M7_C1_US Test unicast_latency
keylset LAT_24_20_M7_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M7_C1_US ILoadList {58082 36954 21391 11611 5994 4065}
keylset LAT_24_20_M7_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M7_C1_US AcceptableMaxLatency 20
keylset LAT_24_20_M7_C1_US Direction {Unidirectional}
keylset LAT_24_20_M7_C1_US Source {Wifi2_7_1CLI}
keylset LAT_24_20_M7_C1_US Destination {Eth}

#unicast_latency MCS15 US Options
keylset LAT_24_20_M15_C1_US Test unicast_latency
keylset LAT_24_20_M15_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M15_C1_US ILoadList {95255 64851 39582 22246 11839 8035}
keylset LAT_24_20_M15_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M15_C1_US AcceptableMaxLatency 0
keylset LAT_24_20_M15_C1_US Direction {Unidirectional}
keylset LAT_24_20_M15_C1_US Source {Wifi2_15_1CLI}
keylset LAT_24_20_M15_C1_US Destination {Eth}

#unicast_latency MCS23 US Options
keylset LAT_24_20_M23_C1_US Test unicast_latency
keylset LAT_24_20_M23_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M23_C1_US ILoadList {119208 85690 54847 31890 17309 11742}
keylset LAT_24_20_M23_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M23_C1_US AcceptableMaxLatency 0
keylset LAT_24_20_M23_C1_US Direction {Unidirectional}
keylset LAT_24_20_M23_C1_US Source {Wifi2_23_1CLI}
keylset LAT_24_20_M23_C1_US Destination {Eth}

#unicast_latency MCS23 US Options
keylset LAT_24_20_M31_C1_US Test unicast_latency
keylset LAT_24_20_M31_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M31_C1_US ILoadList {154216 115778 76851 45951 25392 17232}
keylset LAT_24_20_M31_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M31_C1_US AcceptableMaxLatency 0
keylset LAT_24_20_M31_C1_US Direction {Unidirectional}
keylset LAT_24_20_M31_C1_US Source {Wifi2_31_1CLI}
keylset LAT_24_20_M31_C1_US Destination {Eth}


#unicast_latency MCS7 DS Options
keylset LAT_24_20_M7_C1_DS Test unicast_latency
keylset LAT_24_20_M7_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M7_C1_DS ILoadList {58082 36954 21391 11611 5994 4065}
keylset LAT_24_20_M7_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M7_C1_DS AcceptableMaxLatency 20
keylset LAT_24_20_M7_C1_DS Direction {Unidirectional}
keylset LAT_24_20_M7_C1_DS Source {Eth}
keylset LAT_24_20_M7_C1_DS Destination {Wifi2_7_1CLI}

#unicast_latency MCS15 DS Options
keylset LAT_24_20_M15_C1_DS Test unicast_latency
keylset LAT_24_20_M15_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M15_C1_DS ILoadList {95255 64851 39582 22246 11839 8035}
keylset LAT_24_20_M15_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M15_C1_DS AcceptableMaxLatency 0
keylset LAT_24_20_M15_C1_DS Direction {Unidirectional}
keylset LAT_24_20_M15_C1_DS Source {Eth}
keylset LAT_24_20_M15_C1_DS Destination {Wifi2_15_1CLI}

#unicast_latency MCS23 DS Options
keylset LAT_24_20_M23_C1_DS Test unicast_latency
keylset LAT_24_20_M23_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M23_C1_DS ILoadList {119208 85690 54847 31890 17309 11742}
keylset LAT_24_20_M23_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M23_C1_DS AcceptableMaxLatency 0
keylset LAT_24_20_M23_C1_DS Direction {Unidirectional}
keylset LAT_24_20_M23_C1_DS Source {Eth}
keylset LAT_24_20_M23_C1_DS Destination {Wifi2_23_1CLI}


#unicast_latency MCS31 DS Options
keylset LAT_24_20_M31_C1_DS Test unicast_latency
keylset LAT_24_20_M31_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M31_C1_DS ILoadList {154216 115778 76851 45951 25392 17232}
keylset LAT_24_20_M31_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M31_C1_DS AcceptableMaxLatency 0
keylset LAT_24_20_M31_C1_DS Direction {Unidirectional}
keylset LAT_24_20_M31_C1_DS Source {Eth}
keylset LAT_24_20_M31_C1_DS Destination {Wifi2_31_1CLI}

#unicast_latency MCS7 BI Options
keylset LAT_24_20_M7_C1_BI Test unicast_latency
keylset LAT_24_20_M7_C1_BI FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M7_C1_BI ILoadList {58082 36954 21391 11611 5994 4065}
keylset LAT_24_20_M7_C1_BI AcceptableAvgLatency 0
keylset LAT_24_20_M7_C1_BI AcceptableMaxLatency 20
keylset LAT_24_20_M7_C1_BI Direction {Bidirectional}
keylset LAT_24_20_M7_C1_BI Source {Eth}
keylset LAT_24_20_M7_C1_BI Destination {Wifi2_7_1CLI}

#unicast_latency MCS15 BI Options
keylset LAT_24_20_M15_C1_BI Test unicast_latency
keylset LAT_24_20_M15_C1_BI FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M15_C1_BI ILoadList {95255 64851 39582 22246 11839 8035}
keylset LAT_24_20_M15_C1_BI AcceptableAvgLatency 0
keylset LAT_24_20_M15_C1_BI AcceptableMaxLatency 0
keylset LAT_24_20_M15_C1_BI Direction {Bidirectional}
keylset LAT_24_20_M15_C1_BI Source {Eth}
keylset LAT_24_20_M15_C1_BI Destination {Wifi2_15_1CLI}

#unicast_latency MCS23 BI Options
keylset LAT_24_20_M23_C1_BI Test unicast_latency
keylset LAT_24_20_M23_C1_BI FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M23_C1_BI ILoadList {119208 85690 54847 31890 17309 11742}
keylset LAT_24_20_M23_C1_BI AcceptableAvgLatency 0
keylset LAT_24_20_M23_C1_BI AcceptableMaxLatency 0
keylset LAT_24_20_M23_C1_BI Direction {Bidirectional}
keylset LAT_24_20_M23_C1_BI Source {Eth}
keylset LAT_24_20_M23_C1_BI Destination {Wifi2_23_1CLI}


#unicast_latency MCS31 BI Options
keylset LAT_24_20_M31_C1_BI Test unicast_latency
keylset LAT_24_20_M31_C1_BI FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M31_C1_BI ILoadList {154216 115778 76851 45951 25392 17232}
keylset LAT_24_20_M31_C1_BI AcceptableAvgLatency 0
keylset LAT_24_20_M31_C1_BI AcceptableMaxLatency 0
keylset LAT_24_20_M31_C1_BI Direction {Bidirectional}
keylset LAT_24_20_M31_C1_BI Source {Eth}
keylset LAT_24_20_M31_C1_BI Destination {Wifi2_31_1CLI}



# 5.0GHz 40MHz Options

#unicast_latency MCS7 US Options
keylset LAT_5_40_M7_C1_US Test unicast_latency
keylset LAT_5_40_M7_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M7_C1_US ILoadList {98178 66884 40976 23047 12284 8338}
keylset LAT_5_40_M7_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M7_C1_US AcceptableMaxLatency 20
keylset LAT_5_40_M7_C1_US Direction {Unidirectional}
keylset LAT_5_40_M7_C1_US Source {Wifi5_40_7_1CLI}
keylset LAT_5_40_M7_C1_US Destination {Ethv6}

#unicast_latency MCS15 US Options
keylset LAT_5_40_M15_C1_US Test unicast_latency
keylset LAT_5_40_M15_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M15_C1_US ILoadList {143216 106334 70963 42331 23423 15897}
keylset LAT_5_40_M15_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M15_C1_US AcceptableMaxLatency 0
keylset LAT_5_40_M15_C1_US Direction {Unidirectional}
keylset LAT_5_40_M15_C1_US Source {Wifi5_40_15_1CLI}
keylset LAT_5_40_M15_C1_US Destination {Ethv6}

#unicast_latency MCS23 US Options
keylset LAT_5_40_M23_C1_US Test unicast_latency
keylset LAT_5_40_M23_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M23_C1_US ILoadList {165428 130114 92502 58347 33479 22679}
keylset LAT_5_40_M23_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M23_C1_US AcceptableMaxLatency 0
keylset LAT_5_40_M23_C1_US Direction {Unidirectional}
keylset LAT_5_40_M23_C1_US Source {Wifi5_40_23_1CLI}
keylset LAT_5_40_M23_C1_US Destination {Ethv6}

#unicast_latency MCS31 US Options
keylset LAT_5_40_M31_C1_US Test unicast_latency
keylset LAT_5_40_M31_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M31_C1_US ILoadList {204617 166714 123737 81183 48041 32544}
keylset LAT_5_40_M31_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M31_C1_US AcceptableMaxLatency 0
keylset LAT_5_40_M31_C1_US Direction {Unidirectional}
keylset LAT_5_40_M31_C1_US Source {Wifi5_40_31_1CLI}
keylset LAT_5_40_M31_C1_US Destination {Ethv6}

#unicast_latency MCS7 DS Options
keylset LAT_5_40_M7_C1_DS Test unicast_latency
keylset LAT_5_40_M7_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M7_C1_DS ILoadList {98178 66884 40976 23047 12284 8338}
keylset LAT_5_40_M7_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M7_C1_DS AcceptableMaxLatency 20
keylset LAT_5_40_M7_C1_DS Direction {Unidirectional}
keylset LAT_5_40_M7_C1_DS Source {Ethv6}
keylset LAT_5_40_M7_C1_DS Destination {Wifi5_40_7_1CLI}

#unicast_latency MCS15 DS Options
keylset LAT_5_40_M15_C1_DS Test unicast_latency
keylset LAT_5_40_M15_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M15_C1_DS ILoadList {143216 106334 70963 42331 23423 15897}
keylset LAT_5_40_M15_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M15_C1_DS AcceptableMaxLatency 0
keylset LAT_5_40_M15_C1_DS Direction {Unidirectional}
keylset LAT_5_40_M15_C1_DS Source {Ethv6}
keylset LAT_5_40_M15_C1_DS Destination {Wifi5_40_15_1CLI}

#unicast_latency MCS23 DS Options
keylset LAT_5_40_M23_C1_DS Test unicast_latency
keylset LAT_5_40_M23_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M23_C1_DS ILoadList {165428 130114 92502 58347 33479 22679}
keylset LAT_5_40_M23_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M23_C1_DS AcceptableMaxLatency 0
keylset LAT_5_40_M23_C1_DS Direction {Unidirectional}
keylset LAT_5_40_M23_C1_DS Source {Ethv6}
keylset LAT_5_40_M23_C1_DS Destination {Wifi5_40_23_1CLI}

#unicast_latency MCS23 DS Options
keylset LAT_5_40_M31_C1_DS Test unicast_latency
keylset LAT_5_40_M31_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M31_C1_DS ILoadList {204617 166714 123737 81183 48041 32544}
keylset LAT_5_40_M31_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M31_C1_DS AcceptableMaxLatency 0
keylset LAT_5_40_M31_C1_DS Direction {Unidirectional}
keylset LAT_5_40_M31_C1_DS Source {Ethv6}
keylset LAT_5_40_M31_C1_DS Destination {Wifi5_40_31_1CLI}

#unicast_latency MCS7 BI Options
keylset LAT_5_40_M7_C1_BI Test unicast_latency
keylset LAT_5_40_M7_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M7_C1_BI ILoadList {98178 66884 40976 23047 12284 8338}
keylset LAT_5_40_M7_C1_BI AcceptableAvgLatency 0
keylset LAT_5_40_M7_C1_BI AcceptableMaxLatency 20
keylset LAT_5_40_M7_C1_BI Direction {Bidirectional}
keylset LAT_5_40_M7_C1_BI Source {Ethv6}
keylset LAT_5_40_M7_C1_BI Destination {Wifi5_40_7_1CLI}

#unicast_latency MCS15 BI Options
keylset LAT_5_40_M15_C1_BI Test unicast_latency
keylset LAT_5_40_M15_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M15_C1_BI ILoadList {143216 106334 70963 42331 23423 15897}
keylset LAT_5_40_M15_C1_BI AcceptableAvgLatency 0
keylset LAT_5_40_M15_C1_BI AcceptableMaxLatency 0
keylset LAT_5_40_M15_C1_BI Direction {Bidirectional}
keylset LAT_5_40_M15_C1_BI Source {Ethv6}
keylset LAT_5_40_M15_C1_BI Destination {Wifi5_40_15_1CLI}

#unicast_latency MCS23 BI Options
keylset LAT_5_40_M23_C1_BI Test unicast_latency
keylset LAT_5_40_M23_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M23_C1_BI ILoadList {165428 130114 92502 58347 33479 22679}
keylset LAT_5_40_M23_C1_BI AcceptableAvgLatency 0
keylset LAT_5_40_M23_C1_BI AcceptableMaxLatency 0
keylset LAT_5_40_M23_C1_BI Direction {Bidirectional}
keylset LAT_5_40_M23_C1_BI Source {Ethv6}
keylset LAT_5_40_M23_C1_BI Destination {Wifi5_40_23_1CLI}

#unicast_latency MCS23 BI Options
keylset LAT_5_40_M31_C1_BI Test unicast_latency
keylset LAT_5_40_M31_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M31_C1_BI ILoadList {204617 166714 123737 81183 48041 32544}
keylset LAT_5_40_M31_C1_BI AcceptableAvgLatency 0
keylset LAT_5_40_M31_C1_BI AcceptableMaxLatency 0
keylset LAT_5_40_M31_C1_BI Direction {Bidirectional}
keylset LAT_5_40_M31_C1_BI Source {Ethv6}
keylset LAT_5_40_M31_C1_BI Destination {Wifi5_40_31_1CLI}




# 5.0GHz 80MHz Options


#unicast_latency MCS9 SS1 US Options
keylset LAT_5_80_S1_M9_C1_US Test unicast_latency
keylset LAT_5_80_S1_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M9_C1_US ILoadList {209193 155741 103069 61483 34025 23739}
keylset LAT_5_80_S1_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S1_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S1_M9_C1_US Direction {Unidirectional}
keylset LAT_5_80_S1_M9_C1_US Source {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_S1_M9_C1_US Destination {Ethv6}

#unicast_latency MCS9 SS1 US Options
keylset LAT_5_80_S1_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S1_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M9_C1_DS ILoadList {209193 155741 103069 61483 34025 23739}
keylset LAT_5_80_S1_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S1_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S1_M9_C1_DS Direction {Unidirectional}
keylset LAT_5_80_S1_M9_C1_DS Source {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_S1_M9_C1_DS Destination {Ethv6}

#unicast_latency MCS9 SS1 BI Options
keylset LAT_5_80_S1_M9_C1_BI Test unicast_latency
keylset LAT_5_80_S1_M9_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M9_C1_BI ILoadList {209193 155741 103069 61483 34025 23739}
keylset LAT_5_80_S1_M9_C1_BI AcceptableAvgLatency 0
keylset LAT_5_80_S1_M9_C1_BI AcceptableMaxLatency 0
keylset LAT_5_80_S1_M9_C1_BI Direction {Bidirectional}
keylset LAT_5_80_S1_M9_C1_BI Source {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_S1_M9_C1_BI Destination {Ethv6}


#unicast_latency MCS9 SS2 US Options
keylset LAT_5_80_S2_M9_C1_US Test unicast_latency
keylset LAT_5_80_S2_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M9_C1_US ILoadList {265629 219978 161641 105621 62381 44570}
keylset LAT_5_80_S2_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S2_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S2_M9_C1_US Direction {Unidirectional}
keylset LAT_5_80_S2_M9_C1_US Source {Wifi5_AC_SP2_9_1CLI}
keylset LAT_5_80_S2_M9_C1_US Destination {Ethv6}

#unicast_latency MCS9 SS2 US Options
keylset LAT_5_80_S2_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S2_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M9_C1_DS ILoadList {265629 219978 161641 105621 62381 44570}
keylset LAT_5_80_S2_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S2_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S2_M9_C1_DS Direction {Unidirectional}
keylset LAT_5_80_S2_M9_C1_DS Source {Ethv6}
keylset LAT_5_80_S2_M9_C1_DS Destination {Wifi5_AC_SP2_9_1CLI}

#unicast_latency MCS9 SS2 BI Options
keylset LAT_5_80_S2_M9_C1_BI Test unicast_latency
keylset LAT_5_80_S2_M9_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M9_C1_BI ILoadList {265629 219978 161641 105621 62381 44570}
keylset LAT_5_80_S2_M9_C1_BI AcceptableAvgLatency 0
keylset LAT_5_80_S2_M9_C1_BI AcceptableMaxLatency 0
keylset LAT_5_80_S2_M9_C1_BI Direction {Bidirectional}
keylset LAT_5_80_S2_M9_C1_BI Source {Wifi5_AC_SP2_9_1CLI}
keylset LAT_5_80_S2_M9_C1_BI Destination {Ethv6}

#unicast_latency MCS9 SS3 US Options
keylset LAT_5_80_S3_M9_C1_US Test unicast_latency
keylset LAT_5_80_S3_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M9_C1_US ILoadList {212008 189981 157296 117028 77399 58347}
keylset LAT_5_80_S3_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S3_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S3_M9_C1_US Direction {Unidirectional}
keylset LAT_5_80_S3_M9_C1_US Source {Wifi5_AC_SP3_9_1CLI}
keylset LAT_5_80_S3_M9_C1_US Destination {Ethv6}

#unicast_latency MCS9 SS3 US Options
keylset LAT_5_80_S3_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S3_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M9_C1_DS ILoadList {212008 189981 157296 117028 77399 58347}
keylset LAT_5_80_S3_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S3_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S3_M9_C1_DS Direction {Unidirectional}
keylset LAT_5_80_S3_M9_C1_DS Source {Ethv6}
keylset LAT_5_80_S3_M9_C1_DS Destination {Wifi5_AC_SP3_9_1CLI}

#unicast_latency MCS9 SS3 BI Options
keylset LAT_5_80_S3_M9_C1_BI Test unicast_latency
keylset LAT_5_80_S3_M9_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M9_C1_BI ILoadList {212008 189981 157296 117028 77399 58347}
keylset LAT_5_80_S3_M9_C1_BI AcceptableAvgLatency 0
keylset LAT_5_80_S3_M9_C1_BI AcceptableMaxLatency 0
keylset LAT_5_80_S3_M9_C1_BI Direction {Bidirectional}
keylset LAT_5_80_S3_M9_C1_BI Source {Ethv6}
keylset LAT_5_80_S3_M9_C1_BI Destination {Wifi5_AC_SP3_9_1CLI}

#unicast_latency MCS9 SS4 US Options
keylset LAT_5_80_S4_M9_C1_US Test unicast_latency
keylset LAT_5_80_S4_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S4_M9_C1_US ILoadList {246680 227218 196251 152582 105509 73146}
keylset LAT_5_80_S4_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S4_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S4_M9_C1_US Direction {Unidirectional}
keylset LAT_5_80_S4_M9_C1_US Source {Wifi5_AC_SP4_9_1CLI}
keylset LAT_5_80_S4_M9_C1_US Destination {Ethv6}

#unicast_latency MCS9 SS4 US Options
keylset LAT_5_80_S4_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S4_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S4_M9_C1_DS ILoadList {246680 227218 196251 152582 105509 73146}
keylset LAT_5_80_S4_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S4_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S4_M9_C1_DS Direction {Unidirectional}
keylset LAT_5_80_S4_M9_C1_DS Source {Ethv6}
keylset LAT_5_80_S4_M9_C1_DS Destination {Wifi5_AC_SP4_9_1CLI}

#unicast_latency MCS9 SS4 BI Options
keylset LAT_5_80_S4_M9_C1_BI Test unicast_latency
keylset LAT_5_80_S4_M9_C1_BI FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S4_M9_C1_BI ILoadList {246680 227218 196251 152582 105509 73146}
keylset LAT_5_80_S4_M9_C1_BI AcceptableAvgLatency 0
keylset LAT_5_80_S4_M9_C1_BI AcceptableMaxLatency 0
keylset LAT_5_80_S4_M9_C1_BI Direction {Bidirectional}
keylset LAT_5_80_S4_M9_C1_BI Source {Ethv6}
keylset LAT_5_80_S4_M9_C1_BI Destination {Wifi5_AC_SP4_9_1CLI}


# Dual Band Options


#unicast_latency MCS7 DB_DS Options
keylset LAT_M7_C1_DB_DS Test unicast_latency
keylset LAT_M7_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M7_C1_DB_DS ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_M7_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M7_C1_DB_DS AcceptableMaxLatency 20
keylset LAT_M7_C1_DB_DS Direction {Unidirectional}
keylset LAT_M7_C1_DB_DS Source {Eth}
keylset LAT_M7_C1_DB_DS Destination {Wifi2_7_1CLI Wifi5_40_7_1CLI}

#unicast_latency MCS15 DB_DS Options
keylset LAT_M15_C1_DB_DS Test unicast_latency
keylset LAT_M15_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_C1_DB_DS ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M15_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M15_C1_DB_DS Direction {Unidirectional}
keylset LAT_M15_C1_DB_DS Source {Eth}
keylset LAT_M15_C1_DB_DS Destination {Wifi2_15_1CLI Wifi5_40_15_1CLI}

#unicast_latency MCS23 DB_DS Options
keylset LAT_M23_C1_DB_DS Test unicast_latency
keylset LAT_M23_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M23_C1_DB_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_M23_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M23_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M23_C1_DB_DS Direction {Unidirectional}
keylset LAT_M23_C1_DB_DS Source {Eth}
keylset LAT_M23_C1_DB_DS Destination {Wifi2_23_1CLI Wifi5_40_23_1CLI}

#unicast_latency MCS23 DB_DS Options
keylset LAT_M31_C1_DB_DS Test unicast_latency
keylset LAT_M31_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M31_C1_DB_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_M31_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M31_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M31_C1_DB_DS Direction {Unidirectional}
keylset LAT_M31_C1_DB_DS Source {Eth}
keylset LAT_M31_C1_DB_DS Destination {Wifi2_31_1CLI Wifi5_40_31_1CLI}



#unicast_latency MCS7 DB_US Options
keylset LAT_M7_C1_DB_US Test unicast_latency
keylset LAT_M7_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M7_C1_DB_US ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_M7_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M7_C1_DB_US AcceptableMaxLatency 20
keylset LAT_M7_C1_DB_US Direction {Unidirectional}
keylset LAT_M7_C1_DB_US Source {Wifi2_7_1CLI Wifi5_40_7_1CLI}
keylset LAT_M7_C1_DB_US Destination {Eth}

#unicast_latency MCS15 DB_US Options
keylset LAT_M15_C1_DB_US Test unicast_latency
keylset LAT_M15_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_C1_DB_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M15_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M15_C1_DB_US Direction {Unidirectional}
keylset LAT_M15_C1_DB_US Source {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset LAT_M15_C1_DB_US Destination {Eth}

keylset LAT_M23_C1_DB_US Test unicast_latency
keylset LAT_M23_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M23_C1_DB_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M23_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M23_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M23_C1_DB_US Direction {Unidirectional}
keylset LAT_M23_C1_DB_US Source {Wifi2_23_1CLI Wifi5_40_23_1CLI}
keylset LAT_M23_C1_DB_US Destination {Eth}

keylset LAT_M31_C1_DB_US Test unicast_latency
keylset LAT_M31_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M31_C1_DB_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M31_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M31_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M31_C1_DB_US Direction {Unidirectional}
keylset LAT_M31_C1_DB_US Source {Wifi2_31_1CLI Wifi5_40_31_1CLI}
keylset LAT_M31_C1_DB_US Destination {Eth}

#unicast_latency MCS7 DB_BI Options
keylset LAT_M7_C1_DB_BI Test unicast_latency
keylset LAT_M7_C1_DB_BI FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M7_C1_DB_BI ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_M7_C1_DB_BI AcceptableAvgLatency 0
keylset LAT_M7_C1_DB_BI AcceptableMaxLatency 20
keylset LAT_M7_C1_DB_BI Direction {Bidirectional}
keylset LAT_M7_C1_DB_BI Source {Wifi2_7_1CLI Wifi5_40_7_1CLI}
keylset LAT_M7_C1_DB_BI Destination {Eth}

#unicast_latency MCS15 DB_BI Options
keylset LAT_M15_C1_DB_BI Test unicast_latency
keylset LAT_M15_C1_DB_BI FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_C1_DB_BI ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_C1_DB_BI AcceptableAvgLatency 0
keylset LAT_M15_C1_DB_BI AcceptableMaxLatency 0
keylset LAT_M15_C1_DB_BI Direction {Bidirectional}
keylset LAT_M15_C1_DB_BI Source {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset LAT_M15_C1_DB_BI Destination {Eth}

keylset LAT_M23_C1_DB_BI Test unicast_latency
keylset LAT_M23_C1_DB_BI FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M23_C1_DB_BI ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M23_C1_DB_BI AcceptableAvgLatency 0
keylset LAT_M23_C1_DB_BI AcceptableMaxLatency 0
keylset LAT_M23_C1_DB_BI Direction {Bidirectional}
keylset LAT_M23_C1_DB_BI Source {Wifi2_23_1CLI Wifi5_40_23_1CLI}
keylset LAT_M23_C1_DB_BI Destination {Eth}

keylset LAT_M31_C1_DB_BI Test unicast_latency
keylset LAT_M31_C1_DB_BI FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M31_C1_DB_BI ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M31_C1_DB_BI AcceptableAvgLatency 0
keylset LAT_M31_C1_DB_BI AcceptableMaxLatency 0
keylset LAT_M31_C1_DB_BI Direction {Bidirectional}
keylset LAT_M31_C1_DB_BI Source {Wifi2_31_1CLI Wifi5_40_31_1CLI}
keylset LAT_M31_C1_DB_BI Destination {Eth}


#unicast_latency MCS15_23 DB_US Options
keylset LAT_M15_23_C1_DB_US Test unicast_latency
keylset LAT_M15_23_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_23_C1_DB_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_23_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M15_23_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M15_23_C1_DB_US Direction {Unidirectional}
keylset LAT_M15_23_C1_DB_US Source {Wifi2_15_1CLI Wifi5_40_23_1CLI}
keylset LAT_M15_23_C1_DB_US Destination {Eth}

#unicast_latency MCS15_23 DB_SS Options
keylset LAT_M15_23_C1_DB_DS Test unicast_latency
keylset LAT_M15_23_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_23_C1_DB_DS ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_23_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M15_23_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M15_23_C1_DB_DS Direction {Unidirectional}
keylset LAT_M15_23_C1_DB_DS Destination {Wifi2_15_1CLI Wifi5_40_23_1CLI}
keylset LAT_M15_23_C1_DB_DS Source {Eth}

#unicast_latency MCS15_23 DB_SS_BI Options
keylset LAT_M15_23_C1_DB_BI Test unicast_latency
keylset LAT_M15_23_C1_DB_BI FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_23_C1_DB_BI ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_23_C1_DB_BI AcceptableAvgLatency 0
keylset LAT_M15_23_C1_DB_BI AcceptableMaxLatency 0
keylset LAT_M15_23_C1_DB_BI Direction {Bidirectional}
keylset LAT_M15_23_C1_DB_BI Destination {Wifi2_15_1CLI Wifi5_40_23_1CLI}
keylset LAT_M15_23_C1_DB_BI Source {Eth}


#Port list for port specific options
keylset global_config Ports {generic_dut_0 generic_dut_2 generic_dut_5}

#Generic Dut Definitions

#Generic Dut - generic_dut_0
keylset generic_dut_0 used True
keylset generic_dut_0 Vendor generic
keylset generic_dut_0 WLANSwitchSWVersion $LANSFW
keylset generic_dut_0 APSWVersion $VENDORFW
keylset generic_dut_0 APModel $VENDORMODEL
keylset generic_dut_0 Interface.802_3.BindStatus True
keylset generic_dut_0 Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_0 Interface.802_3.EthernetSpeed 1000
keylset generic_dut_0 Interface.802_3.Duplex full
keylset generic_dut_0 Interface.802_3.Autonegotiation on
keylset generic_dut_0 Interface.802_3.ClientBackoff True
keylset generic_dut_0 Interface.802_3.InterfaceType 802.3
keylset generic_dut_0 Interface.802_3.EnableRxAttenuation on
keylset generic_dut_0 Interface.802_3.SecondaryChannelPlacement defer
keylset generic_dut_0 WLANSwitchModel $LANSModel

#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion $LANSFW
keylset generic_dut_2 APSWVersion $VENDORFW
keylset generic_dut_2 APModel $VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11ac.ClientBackoff True
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11n
keylset generic_dut_2 Interface.802_11ac.EnableRxAttenuation $ATTN24
keylset generic_dut_2 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_2 WLANSwitchModel $LANSModel

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion $LANSFW
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 Interface.802_11ac.ClientBackoff True
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.EnableRxAttenuation $ATTN5
keylset generic_dut_5 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_5 WLANSwitchModel $LANSModel


#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

