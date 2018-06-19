
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

keylset global_config RandomSeed $random_int

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

#Group Wifi2
keylset Wifi2 GroupType 802.11n
keylset Wifi2 Dut generic_dut_2

#Group Wifi2 - Client Options
keylset Wifi2 Ssid $SSID_24
keylset Wifi2 Hops 0
keylset Wifi2 Dhcp Enable
keylset Wifi2 GratuitousArp True
keylset Wifi2 MacAddress None
keylset Wifi2 PlcpConfiguration mixed
keylset Wifi2 ChannelBandwidth 20
keylset Wifi2 EnableAMSDUrxaggregation False 
keylset Wifi2 EnableAMSDUtxaggregation False
keylset Wifi2 EnableAMPDUaggregation True
keylset Wifi2 ChannelModel Bypass
keylset Wifi2 DataMcsIndex 23
keylset Wifi2 NumTxAntennas $Num24Antennas
keylset Wifi2 GuardInterval standard
keylset Wifi2 Gateway 192.168.1.1
keylset Wifi2 phyInterface 802.11n
keylset Wifi2 MgmtPhyRate 24
keylset Wifi2 Qos Enable
keylset Wifi2 BaseIp 192.168.1.11
keylset Wifi2 Channel 6

#Group Wifi2 - Security Options
keylset Wifi2 Method {WPA2-PSK}
keylset Wifi2 EnableValidateCertificate off
keylset Wifi2 PskAscii charter123

ipv6_interface Wifi2 24

#Group Wifi5
keylset Wifi5 GroupType 802.11ac
keylset Wifi5 Dut generic_dut_5

#Group Wifi5 - Client Options
keylset Wifi5 Ssid $SSID_5
keylset Wifi5 Dhcp Enable
keylset Wifi5 GratuitousArp True
keylset Wifi5 MacAddress None
keylset Wifi5 PlcpConfiguration mixed
keylset Wifi5 ChannelBandwidth 40
keylset Wifi5 EnableAMSDUrxaggregation False
keylset Wifi5 EnableAMSDUtxaggregation False
keylset Wifi5 EnableAMPDUaggregation True
keylset Wifi5 ChannelModel Bypass
keylset Wifi5 DataMcsIndex {7}
keylset Wifi5 NumTxAntennas $Num5Antennas
keylset Wifi5 GuardInterval standard
keylset Wifi5 Gateway 192.168.1.1
keylset Wifi5 phyInterface 802.11n
keylset Wifi5 MgmtPhyRate 24
keylset Wifi5 Qos Enable
keylset Wifi5 BaseIp 192.168.1.12
keylset Wifi5 Channel 149

#Group Wifi5 - Security Options
keylset Wifi5 Method {WPA2-PSK}
keylset Wifi5 EnableValidateCertificate off
keylset Wifi5 PskAscii charter123

ipv6_interface Wifi5 5


set Wifi2_g_1CLI ${Wifi2}
keylset Wifi2_g_1CLI phyInterface 802.11ag
keylset Wifi2_g_1CLI NumClients 1

set Wifi2_0_1CLI ${Wifi2}
keylset Wifi2_0_1CLI DataMcsIndex 0
keylset Wifi2_0_1CLI NumClients 1

set Wifi2_1_1CLI ${Wifi2}
keylset Wifi2_1_1CLI DataMcsIndex 1
keylset Wifi2_1_1CLI NumClients 1

set Wifi2_2_1CLI ${Wifi2}
keylset Wifi2_2_1CLI DataMcsIndex 2
keylset Wifi2_2_1CLI NumClients 1

set Wifi2_3_1CLI ${Wifi2}
keylset Wifi2_3_1CLI DataMcsIndex 3
keylset Wifi2_3_1CLI NumClients 1

set Wifi2_4_1CLI ${Wifi2}
keylset Wifi2_4_1CLI DataMcsIndex 4
keylset Wifi2_4_1CLI NumClients 1

set Wifi2_5_1CLI ${Wifi2}
keylset Wifi2_5_1CLI DataMcsIndex 5
keylset Wifi2_5_1CLI NumClients 1

set Wifi2_6_1CLI ${Wifi2}
keylset Wifi2_6_1CLI DataMcsIndex 6
keylset Wifi2_6_1CLI NumClients 1

set Wifi2_7_1CLI ${Wifi2}
keylset Wifi2_7_1CLI DataMcsIndex 7
keylset Wifi2_7_1CLI NumClients 1

set Wifi2_8_1CLI ${Wifi2}
keylset Wifi2_8_1CLI DataMcsIndex 8
keylset Wifi2_8_1CLI NumClients 1

set Wifi2_9_1CLI ${Wifi2}
keylset Wifi2_9_1CLI DataMcsIndex 9
keylset Wifi2_9_1CLI NumClients 1

set Wifi2_10_1CLI ${Wifi2}
keylset Wifi2_10_1CLI DataMcsIndex 10
keylset Wifi2_10_1CLI NumClients 1

set Wifi2_11_1CLI ${Wifi2}
keylset Wifi2_11_1CLI DataMcsIndex 11
keylset Wifi2_11_1CLI NumClients 1

set Wifi2_12_1CLI ${Wifi2}
keylset Wifi2_12_1CLI DataMcsIndex 12
keylset Wifi2_12_1CLI NumClients 1

set Wifi2_13_1CLI ${Wifi2}
keylset Wifi2_13_1CLI DataMcsIndex 13
keylset Wifi2_13_1CLI NumClients 1

set Wifi2_14_1CLI ${Wifi2}
keylset Wifi2_14_1CLI DataMcsIndex 14
keylset Wifi2_14_1CLI NumClients 1

set Wifi2_15_1CLI ${Wifi2}
keylset Wifi2_15_1CLI DataMcsIndex 15
keylset Wifi2_15_1CLI NumClients 1

set Wifi2_16_1CLI ${Wifi2}
keylset Wifi2_16_1CLI DataMcsIndex 16
keylset Wifi2_16_1CLI NumClients 1

set Wifi2_17_1CLI ${Wifi2}
keylset Wifi2_17_1CLI DataMcsIndex 17
keylset Wifi2_17_1CLI NumClients 1

set Wifi2_18_1CLI ${Wifi2}
keylset Wifi2_18_1CLI DataMcsIndex 18
keylset Wifi2_18_1CLI NumClients 1

set Wifi2_19_1CLI ${Wifi2}
keylset Wifi2_19_1CLI DataMcsIndex 19
keylset Wifi2_19_1CLI NumClients 1

set Wifi2_20_1CLI ${Wifi2}
keylset Wifi2_20_1CLI DataMcsIndex 20
keylset Wifi2_20_1CLI NumClients 1

set Wifi2_21_1CLI ${Wifi2}
keylset Wifi2_21_1CLI DataMcsIndex 21
keylset Wifi2_21_1CLI NumClients 1

set Wifi2_22_1CLI ${Wifi2}
keylset Wifi2_22_1CLI DataMcsIndex 22
keylset Wifi2_22_1CLI NumClients 1

set Wifi2_23_1CLI ${Wifi2}
keylset Wifi2_23_1CLI DataMcsIndex 23
keylset Wifi2_23_1CLI NumClients 1

set Wifi2_31_1CLI ${Wifi2}
keylset Wifi2_31_1CLI DataMcsIndex 31
keylset Wifi2_31_1CLI NumClients 1

set Wifi2_g_10CLI ${Wifi2}
keylset Wifi2_g_10CLI phyInterface 802.11ag
keylset Wifi2_g_10CLI NumClients 10

set Wifi2_0_10CLI ${Wifi2}
keylset Wifi2_0_10CLI DataMcsIndex 0
keylset Wifi2_0_10CLI NumClients 10

set Wifi2_1_10CLI ${Wifi2}
keylset Wifi2_1_10CLI DataMcsIndex 1
keylset Wifi2_1_10CLI NumClients 10

set Wifi2_2_10CLI ${Wifi2}
keylset Wifi2_2_10CLI DataMcsIndex 2
keylset Wifi2_2_10CLI NumClients 10

set Wifi2_3_10CLI ${Wifi2}
keylset Wifi2_3_10CLI DataMcsIndex 3
keylset Wifi2_3_10CLI NumClients 10

set Wifi2_4_10CLI ${Wifi2}
keylset Wifi2_4_10CLI DataMcsIndex 4
keylset Wifi2_4_10CLI NumClients 10

set Wifi2_5_10CLI ${Wifi2}
keylset Wifi2_5_10CLI DataMcsIndex 5
keylset Wifi2_5_10CLI NumClients 10

set Wifi2_6_10CLI ${Wifi2}
keylset Wifi2_6_10CLI DataMcsIndex 6
keylset Wifi2_6_10CLI NumClients 10

set Wifi2_7_10CLI ${Wifi2}
keylset Wifi2_7_10CLI DataMcsIndex 7
keylset Wifi2_7_10CLI NumClients 10

set Wifi2_8_10CLI ${Wifi2}
keylset Wifi2_8_10CLI DataMcsIndex 8
keylset Wifi2_8_10CLI NumClients 10

set Wifi2_9_10CLI ${Wifi2}
keylset Wifi2_9_10CLI DataMcsIndex 9
keylset Wifi2_9_10CLI NumClients 10

set Wifi2_10_10CLI ${Wifi2}
keylset Wifi2_10_10CLI DataMcsIndex 10
keylset Wifi2_10_10CLI NumClients 10

set Wifi2_11_10CLI ${Wifi2}
keylset Wifi2_11_10CLI DataMcsIndex 11
keylset Wifi2_11_10CLI NumClients 10

set Wifi2_12_10CLI ${Wifi2}
keylset Wifi2_12_10CLI DataMcsIndex 12
keylset Wifi2_12_10CLI NumClients 10

set Wifi2_13_10CLI ${Wifi2}
keylset Wifi2_13_10CLI DataMcsIndex 13
keylset Wifi2_13_10CLI NumClients 10

set Wifi2_14_10CLI ${Wifi2}
keylset Wifi2_14_10CLI DataMcsIndex 14
keylset Wifi2_14_10CLI NumClients 10

set Wifi2_15_10CLI ${Wifi2}
keylset Wifi2_15_10CLI DataMcsIndex 15
keylset Wifi2_15_10CLI NumClients 10

set Wifi2_16_10CLI ${Wifi2}
keylset Wifi2_16_10CLI DataMcsIndex 16
keylset Wifi2_16_10CLI NumClients 10

set Wifi2_17_10CLI ${Wifi2}
keylset Wifi2_17_10CLI DataMcsIndex 17
keylset Wifi2_17_10CLI NumClients 10

set Wifi2_18_10CLI ${Wifi2}
keylset Wifi2_18_10CLI DataMcsIndex 18
keylset Wifi2_18_10CLI NumClients 10

set Wifi2_19_10CLI ${Wifi2}
keylset Wifi2_19_10CLI DataMcsIndex 19
keylset Wifi2_19_10CLI NumClients 10

set Wifi2_20_10CLI ${Wifi2}
keylset Wifi2_20_10CLI DataMcsIndex 20
keylset Wifi2_20_10CLI NumClients 10

set Wifi2_21_10CLI ${Wifi2}
keylset Wifi2_21_10CLI DataMcsIndex 21
keylset Wifi2_21_10CLI NumClients 10

set Wifi2_22_10CLI ${Wifi2}
keylset Wifi2_22_10CLI DataMcsIndex 22
keylset Wifi2_22_10CLI NumClients 10

set Wifi2_23_10CLI ${Wifi2}
keylset Wifi2_23_10CLI DataMcsIndex 23
keylset Wifi2_23_10CLI NumClients 10


set Wifi5_20 ${Wifi5}
keylset Wifi5_20 ChannelBandwidth 20

set Wifi5_40 ${Wifi5}
keylset Wifi5_40 ChannelBandwidth 40

set Wifi5_80 ${Wifi5}
keylset Wifi5_80 ChannelBandwidth 80
keylset Wifi5_80 phyInterface 802.11ac
keylset Wifi5_80 PlcpConfiguration vht_mixed

set Wifi5_20_a_1CLI ${Wifi5_20}
keylset Wifi5_20_a_1CLI NumClients 1
keylset Wifi5_20_a_1CLI phyInterface 802.11ag

set Wifi5_20_0_1CLI ${Wifi5_20}
keylset Wifi5_20_0_1CLI DataMcsIndex 0
keylset Wifi5_20_0_1CLI NumClients 1

set Wifi5_20_1_1CLI ${Wifi5_20}
keylset Wifi5_20_1_1CLI DataMcsIndex 1
keylset Wifi5_20_1_1CLI NumClients 1

set Wifi5_20_2_1CLI ${Wifi5_20}
keylset Wifi5_20_2_1CLI DataMcsIndex 2
keylset Wifi5_20_2_1CLI NumClients 1

set Wifi5_20_3_1CLI ${Wifi5_20}
keylset Wifi5_20_3_1CLI DataMcsIndex 3
keylset Wifi5_20_3_1CLI NumClients 1

set Wifi5_20_4_1CLI ${Wifi5_20}
keylset Wifi5_20_4_1CLI DataMcsIndex 4
keylset Wifi5_20_4_1CLI NumClients 1

set Wifi5_20_5_1CLI ${Wifi5_20}
keylset Wifi5_20_5_1CLI DataMcsIndex 5
keylset Wifi5_20_5_1CLI NumClients 1

set Wifi5_20_6_1CLI ${Wifi5_20}
keylset Wifi5_20_6_1CLI DataMcsIndex 6
keylset Wifi5_20_6_1CLI NumClients 1

set Wifi5_20_7_1CLI ${Wifi5_20}
keylset Wifi5_20_7_1CLI DataMcsIndex 7
keylset Wifi5_20_7_1CLI NumClients 1

set Wifi5_20_8_1CLI ${Wifi5_20}
keylset Wifi5_20_8_1CLI DataMcsIndex 8
keylset Wifi5_20_8_1CLI NumClients 1

set Wifi5_20_9_1CLI ${Wifi5_20}
keylset Wifi5_20_9_1CLI DataMcsIndex 9
keylset Wifi5_20_9_1CLI NumClients 1

set Wifi5_20_10_1CLI ${Wifi5_20}
keylset Wifi5_20_10_1CLI DataMcsIndex 10
keylset Wifi5_20_10_1CLI NumClients 1

set Wifi5_20_11_1CLI ${Wifi5_20}
keylset Wifi5_20_11_1CLI DataMcsIndex 11
keylset Wifi5_20_11_1CLI NumClients 1

set Wifi5_20_12_1CLI ${Wifi5_20}
keylset Wifi5_20_12_1CLI DataMcsIndex 12
keylset Wifi5_20_12_1CLI NumClients 1

set Wifi5_20_13_1CLI ${Wifi5_20}
keylset Wifi5_20_13_1CLI DataMcsIndex 13
keylset Wifi5_20_13_1CLI NumClients 1

set Wifi5_20_14_1CLI ${Wifi5_20}
keylset Wifi5_20_14_1CLI DataMcsIndex 14
keylset Wifi5_20_14_1CLI NumClients 1

set Wifi5_20_15_1CLI ${Wifi5_20}
keylset Wifi5_20_15_1CLI DataMcsIndex 15
keylset Wifi5_20_15_1CLI NumClients 1

set Wifi5_20_16_1CLI ${Wifi5_20}
keylset Wifi5_20_16_1CLI DataMcsIndex 16
keylset Wifi5_20_16_1CLI NumClients 1

set Wifi5_20_17_1CLI ${Wifi5_20}
keylset Wifi5_20_17_1CLI DataMcsIndex 17
keylset Wifi5_20_17_1CLI NumClients 1

set Wifi5_20_18_1CLI ${Wifi5_20}
keylset Wifi5_20_18_1CLI DataMcsIndex 18
keylset Wifi5_20_18_1CLI NumClients 1

set Wifi5_20_19_1CLI ${Wifi5_20}
keylset Wifi5_20_19_1CLI DataMcsIndex 19
keylset Wifi5_20_19_1CLI NumClients 1

set Wifi5_20_20_1CLI ${Wifi5_20}
keylset Wifi5_20_20_1CLI DataMcsIndex 20
keylset Wifi5_20_20_1CLI NumClients 1

set Wifi5_20_21_1CLI ${Wifi5_20}
keylset Wifi5_20_21_1CLI DataMcsIndex 21
keylset Wifi5_20_21_1CLI NumClients 1

set Wifi5_20_22_1CLI ${Wifi5_20}
keylset Wifi5_20_22_1CLI DataMcsIndex 22
keylset Wifi5_20_22_1CLI NumClients 1

set Wifi5_20_23_1CLI ${Wifi5_20}
keylset Wifi5_20_23_1CLI DataMcsIndex 23
keylset Wifi5_20_23_1CLI NumClients 1

set Wifi5_20_a_10CLI ${Wifi5_20}
keylset Wifi5_20_a_10CLI NumClients 10
keylset Wifi5_20_a_10CLI phyInterface 802.11ag

set Wifi5_20_0_10CLI ${Wifi5_20}
keylset Wifi5_20_0_10CLI DataMcsIndex 0
keylset Wifi5_20_0_10CLI NumClients 10

set Wifi5_20_1_10CLI ${Wifi5_20}
keylset Wifi5_20_1_10CLI DataMcsIndex 1
keylset Wifi5_20_1_10CLI NumClients 10

set Wifi5_20_2_10CLI ${Wifi5_20}
keylset Wifi5_20_2_10CLI DataMcsIndex 2
keylset Wifi5_20_2_10CLI NumClients 10

set Wifi5_20_3_10CLI ${Wifi5_20}
keylset Wifi5_20_3_10CLI DataMcsIndex 3
keylset Wifi5_20_3_10CLI NumClients 10

set Wifi5_20_4_10CLI ${Wifi5_20}
keylset Wifi5_20_4_10CLI DataMcsIndex 4
keylset Wifi5_20_4_10CLI NumClients 10

set Wifi5_20_5_10CLI ${Wifi5_20}
keylset Wifi5_20_5_10CLI DataMcsIndex 5
keylset Wifi5_20_5_10CLI NumClients 10

set Wifi5_20_6_10CLI ${Wifi5_20}
keylset Wifi5_20_6_10CLI DataMcsIndex 6
keylset Wifi5_20_6_10CLI NumClients 10

set Wifi5_20_7_10CLI ${Wifi5_20}
keylset Wifi5_20_7_10CLI DataMcsIndex 7
keylset Wifi5_20_7_10CLI NumClients 10

set Wifi5_20_8_10CLI ${Wifi5_20}
keylset Wifi5_20_8_10CLI DataMcsIndex 8
keylset Wifi5_20_8_10CLI NumClients 10

set Wifi5_20_9_10CLI ${Wifi5_20}
keylset Wifi5_20_9_10CLI DataMcsIndex 9
keylset Wifi5_20_9_10CLI NumClients 10

set Wifi5_20_10_10CLI ${Wifi5_20}
keylset Wifi5_20_10_10CLI DataMcsIndex 10
keylset Wifi5_20_10_10CLI NumClients 10

set Wifi5_20_11_10CLI ${Wifi5_20}
keylset Wifi5_20_11_10CLI DataMcsIndex 11
keylset Wifi5_20_11_10CLI NumClients 10

set Wifi5_20_12_10CLI ${Wifi5_20}
keylset Wifi5_20_12_10CLI DataMcsIndex 12
keylset Wifi5_20_12_10CLI NumClients 10

set Wifi5_20_13_10CLI ${Wifi5_20}
keylset Wifi5_20_13_10CLI DataMcsIndex 13
keylset Wifi5_20_13_10CLI NumClients 10

set Wifi5_20_14_10CLI ${Wifi5_20}
keylset Wifi5_20_14_10CLI DataMcsIndex 14
keylset Wifi5_20_14_10CLI NumClients 10

set Wifi5_20_15_10CLI ${Wifi5_20}
keylset Wifi5_20_15_10CLI DataMcsIndex 15
keylset Wifi5_20_15_10CLI NumClients 10

set Wifi5_20_16_10CLI ${Wifi5_20}
keylset Wifi5_20_16_10CLI DataMcsIndex 16
keylset Wifi5_20_16_10CLI NumClients 10

set Wifi5_20_17_10CLI ${Wifi5_20}
keylset Wifi5_20_17_10CLI DataMcsIndex 17
keylset Wifi5_20_17_10CLI NumClients 10

set Wifi5_20_18_10CLI ${Wifi5_20}
keylset Wifi5_20_18_10CLI DataMcsIndex 18
keylset Wifi5_20_18_10CLI NumClients 10

set Wifi5_20_19_10CLI ${Wifi5_20}
keylset Wifi5_20_19_10CLI DataMcsIndex 19
keylset Wifi5_20_19_10CLI NumClients 10

set Wifi5_20_20_10CLI ${Wifi5_20}
keylset Wifi5_20_20_10CLI DataMcsIndex 20
keylset Wifi5_20_20_10CLI NumClients 10

set Wifi5_20_21_10CLI ${Wifi5_20}
keylset Wifi5_20_21_10CLI DataMcsIndex 21
keylset Wifi5_20_21_10CLI NumClients 10

set Wifi5_20_22_10CLI ${Wifi5_20}
keylset Wifi5_20_22_10CLI DataMcsIndex 22
keylset Wifi5_20_22_10CLI NumClients 10

set Wifi5_20_23_10CLI ${Wifi5_20}
keylset Wifi5_20_23_10CLI DataMcsIndex 23
keylset Wifi5_20_23_10CLI NumClients 10


set Wifi5_40_0_1CLI ${Wifi5_40}
keylset Wifi5_40_0_1CLI DataMcsIndex 0
keylset Wifi5_40_0_1CLI NumClients 1

set Wifi5_40_1_1CLI ${Wifi5_40}
keylset Wifi5_40_1_1CLI DataMcsIndex 1
keylset Wifi5_40_1_1CLI NumClients 1

set Wifi5_40_2_1CLI ${Wifi5_40}
keylset Wifi5_40_2_1CLI DataMcsIndex 2
keylset Wifi5_40_2_1CLI NumClients 1

set Wifi5_40_3_1CLI ${Wifi5_40}
keylset Wifi5_40_3_1CLI DataMcsIndex 3
keylset Wifi5_40_3_1CLI NumClients 1

set Wifi5_40_4_1CLI ${Wifi5_40}
keylset Wifi5_40_4_1CLI DataMcsIndex 4
keylset Wifi5_40_4_1CLI NumClients 1

set Wifi5_40_5_1CLI ${Wifi5_40}
keylset Wifi5_40_5_1CLI DataMcsIndex 5
keylset Wifi5_40_5_1CLI NumClients 1

set Wifi5_40_6_1CLI ${Wifi5_40}
keylset Wifi5_40_6_1CLI DataMcsIndex 6
keylset Wifi5_40_6_1CLI NumClients 1

set Wifi5_40_7_1CLI ${Wifi5_40}
keylset Wifi5_40_7_1CLI DataMcsIndex 7
keylset Wifi5_40_7_1CLI NumClients 1

set Wifi5_40_8_1CLI ${Wifi5_40}
keylset Wifi5_40_8_1CLI DataMcsIndex 8
keylset Wifi5_40_8_1CLI NumClients 1

set Wifi5_40_9_1CLI ${Wifi5_40}
keylset Wifi5_40_9_1CLI DataMcsIndex 9
keylset Wifi5_40_9_1CLI NumClients 1

set Wifi5_40_10_1CLI ${Wifi5_40}
keylset Wifi5_40_10_1CLI DataMcsIndex 10
keylset Wifi5_40_10_1CLI NumClients 1

set Wifi5_40_11_1CLI ${Wifi5_40}
keylset Wifi5_40_11_1CLI DataMcsIndex 11
keylset Wifi5_40_11_1CLI NumClients 1

set Wifi5_40_12_1CLI ${Wifi5_40}
keylset Wifi5_40_12_1CLI DataMcsIndex 12
keylset Wifi5_40_12_1CLI NumClients 1

set Wifi5_40_13_1CLI ${Wifi5_40}
keylset Wifi5_40_13_1CLI DataMcsIndex 13
keylset Wifi5_40_13_1CLI NumClients 1

set Wifi5_40_14_1CLI ${Wifi5_40}
keylset Wifi5_40_14_1CLI DataMcsIndex 14
keylset Wifi5_40_14_1CLI NumClients 1

set Wifi5_40_15_1CLI ${Wifi5_40}
keylset Wifi5_40_15_1CLI DataMcsIndex 15
keylset Wifi5_40_15_1CLI NumClients 1

set Wifi5_40_16_1CLI ${Wifi5_40}
keylset Wifi5_40_16_1CLI DataMcsIndex 16
keylset Wifi5_40_16_1CLI NumClients 1

set Wifi5_40_17_1CLI ${Wifi5_40}
keylset Wifi5_40_17_1CLI DataMcsIndex 17
keylset Wifi5_40_17_1CLI NumClients 1

set Wifi5_40_18_1CLI ${Wifi5_40}
keylset Wifi5_40_18_1CLI DataMcsIndex 18
keylset Wifi5_40_18_1CLI NumClients 1

set Wifi5_40_19_1CLI ${Wifi5_40}
keylset Wifi5_40_19_1CLI DataMcsIndex 19
keylset Wifi5_40_19_1CLI NumClients 1

set Wifi5_40_20_1CLI ${Wifi5_40}
keylset Wifi5_40_20_1CLI DataMcsIndex 20
keylset Wifi5_40_20_1CLI NumClients 1

set Wifi5_40_21_1CLI ${Wifi5_40}
keylset Wifi5_40_21_1CLI DataMcsIndex 21
keylset Wifi5_40_21_1CLI NumClients 1

set Wifi5_40_22_1CLI ${Wifi5_40}
keylset Wifi5_40_22_1CLI DataMcsIndex 22
keylset Wifi5_40_22_1CLI NumClients 1

set Wifi5_40_23_1CLI ${Wifi5_40}
keylset Wifi5_40_23_1CLI DataMcsIndex 23
keylset Wifi5_40_23_1CLI NumClients 1

set Wifi5_40_31_1CLI ${Wifi5_40}
keylset Wifi5_40_31_1CLI DataMcsIndex 31
keylset Wifi5_40_31_1CLI NumClients 1

set Wifi5_40_0_10CLI ${Wifi5_40}
keylset Wifi5_40_0_10CLI DataMcsIndex 0
keylset Wifi5_40_0_10CLI NumClients 10

set Wifi5_40_1_10CLI ${Wifi5_40}
keylset Wifi5_40_1_10CLI DataMcsIndex 1
keylset Wifi5_40_1_10CLI NumClients 10

set Wifi5_40_2_10CLI ${Wifi5_40}
keylset Wifi5_40_2_10CLI DataMcsIndex 2
keylset Wifi5_40_2_10CLI NumClients 10

set Wifi5_40_3_10CLI ${Wifi5_40}
keylset Wifi5_40_3_10CLI DataMcsIndex 3
keylset Wifi5_40_3_10CLI NumClients 10

set Wifi5_40_4_10CLI ${Wifi5_40}
keylset Wifi5_40_4_10CLI DataMcsIndex 4
keylset Wifi5_40_4_10CLI NumClients 10

set Wifi5_40_5_10CLI ${Wifi5_40}
keylset Wifi5_40_5_10CLI DataMcsIndex 5
keylset Wifi5_40_5_10CLI NumClients 10

set Wifi5_40_6_10CLI ${Wifi5_40}
keylset Wifi5_40_6_10CLI DataMcsIndex 6
keylset Wifi5_40_6_10CLI NumClients 10

set Wifi5_40_7_10CLI ${Wifi5_40}
keylset Wifi5_40_7_10CLI DataMcsIndex 7
keylset Wifi5_40_7_10CLI NumClients 10

set Wifi5_40_8_10CLI ${Wifi5_40}
keylset Wifi5_40_8_10CLI DataMcsIndex 8
keylset Wifi5_40_8_10CLI NumClients 10

set Wifi5_40_9_10CLI ${Wifi5_40}
keylset Wifi5_40_9_10CLI DataMcsIndex 9
keylset Wifi5_40_9_10CLI NumClients 10

set Wifi5_40_10_10CLI ${Wifi5_40}
keylset Wifi5_40_10_10CLI DataMcsIndex 10
keylset Wifi5_40_10_10CLI NumClients 10

set Wifi5_40_11_10CLI ${Wifi5_40}
keylset Wifi5_40_11_10CLI DataMcsIndex 11
keylset Wifi5_40_11_10CLI NumClients 10

set Wifi5_40_12_10CLI ${Wifi5_40}
keylset Wifi5_40_12_10CLI DataMcsIndex 12
keylset Wifi5_40_12_10CLI NumClients 10

set Wifi5_40_13_10CLI ${Wifi5_40}
keylset Wifi5_40_13_10CLI DataMcsIndex 13
keylset Wifi5_40_13_10CLI NumClients 10

set Wifi5_40_14_10CLI ${Wifi5_40}
keylset Wifi5_40_14_10CLI DataMcsIndex 14
keylset Wifi5_40_14_10CLI NumClients 10

set Wifi5_40_15_10CLI ${Wifi5_40}
keylset Wifi5_40_15_10CLI DataMcsIndex 15
keylset Wifi5_40_15_10CLI NumClients 10

set Wifi5_40_16_10CLI ${Wifi5_40}
keylset Wifi5_40_16_10CLI DataMcsIndex 16
keylset Wifi5_40_16_10CLI NumClients 10

set Wifi5_40_17_10CLI ${Wifi5_40}
keylset Wifi5_40_17_10CLI DataMcsIndex 17
keylset Wifi5_40_17_10CLI NumClients 10

set Wifi5_40_18_10CLI ${Wifi5_40}
keylset Wifi5_40_18_10CLI DataMcsIndex 18
keylset Wifi5_40_18_10CLI NumClients 10

set Wifi5_40_19_10CLI ${Wifi5_40}
keylset Wifi5_40_19_10CLI DataMcsIndex 19
keylset Wifi5_40_19_10CLI NumClients 10

set Wifi5_40_20_10CLI ${Wifi5_40}
keylset Wifi5_40_20_10CLI DataMcsIndex 20
keylset Wifi5_40_20_10CLI NumClients 10

set Wifi5_40_21_10CLI ${Wifi5_40}
keylset Wifi5_40_21_10CLI DataMcsIndex 21
keylset Wifi5_40_21_10CLI NumClients 10

set Wifi5_40_22_10CLI ${Wifi5_40}
keylset Wifi5_40_22_10CLI DataMcsIndex 22
keylset Wifi5_40_22_10CLI NumClients 10

set Wifi5_40_23_10CLI ${Wifi5_40}
keylset Wifi5_40_23_10CLI DataMcsIndex 23
keylset Wifi5_40_23_10CLI NumClients 10

set Wifi5_AC_SP1_0_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_SP1_0_1CLI NumClients 1
keylset Wifi5_AC_SP1_0_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_1_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_SP1_1_1CLI NumClients 1
keylset Wifi5_AC_SP1_1_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_2_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_SP1_2_1CLI NumClients 1
keylset Wifi5_AC_SP1_2_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_3_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_SP1_3_1CLI NumClients 1
keylset Wifi5_AC_SP1_3_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_4_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_SP1_4_1CLI NumClients 1
keylset Wifi5_AC_SP1_4_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_5_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_SP1_5_1CLI NumClients 1
keylset Wifi5_AC_SP1_5_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_6_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_SP1_6_1CLI NumClients 1
keylset Wifi5_AC_SP1_6_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_7_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_SP1_7_1CLI NumClients 1
keylset Wifi5_AC_SP1_7_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_8_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_SP1_8_1CLI NumClients 1
keylset Wifi5_AC_SP1_8_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP1_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP1_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP1_9_1CLI NumClients 1
keylset Wifi5_AC_SP1_9_1CLI NumSpatialStreams 1

set Wifi5_AC_SP1_0_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_SP1_0_10CLI NumClients 10
keylset Wifi5_AC_SP1_0_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_1_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_SP1_1_10CLI NumClients 10
keylset Wifi5_AC_SP1_1_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_2_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_SP1_2_10CLI NumClients 10
keylset Wifi5_AC_SP1_2_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_3_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_SP1_3_10CLI NumClients 10
keylset Wifi5_AC_SP1_3_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_4_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_SP1_4_10CLI NumClients 10
keylset Wifi5_AC_SP1_4_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_5_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_SP1_5_10CLI NumClients 10
keylset Wifi5_AC_SP1_5_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_6_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_SP1_6_10CLI NumClients 10
keylset Wifi5_AC_SP1_6_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_7_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_SP1_7_10CLI NumClients 10
keylset Wifi5_AC_SP1_7_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_8_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_SP1_8_10CLI NumClients 10
keylset Wifi5_AC_SP1_8_10CLI NumSpatialStreams 1

set Wifi5_AC_SP1_9_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_SP1_9_10CLI NumClients 10
keylset Wifi5_AC_SP1_9_10CLI NumSpatialStreams 1

set Wifi5_AC_SP2_0_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_SP2_0_1CLI NumClients 1
keylset Wifi5_AC_SP2_0_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_1_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_SP2_1_1CLI NumClients 1
keylset Wifi5_AC_SP2_1_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_2_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_SP2_2_1CLI NumClients 1
keylset Wifi5_AC_SP2_2_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_3_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_SP2_3_1CLI NumClients 1
keylset Wifi5_AC_SP2_3_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_4_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_SP2_4_1CLI NumClients 1
keylset Wifi5_AC_SP2_4_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_5_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_SP2_5_1CLI NumClients 1
keylset Wifi5_AC_SP2_5_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_6_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_SP2_6_1CLI NumClients 1
keylset Wifi5_AC_SP2_6_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_7_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_SP2_7_1CLI NumClients 1
keylset Wifi5_AC_SP2_7_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_8_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_SP2_8_1CLI NumClients 1
keylset Wifi5_AC_SP2_8_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP2_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP2_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP2_9_1CLI NumClients 1
keylset Wifi5_AC_SP2_9_1CLI NumSpatialStreams 2

set Wifi5_AC_SP2_0_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_SP2_0_10CLI NumClients 10
keylset Wifi5_AC_SP2_0_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_1_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_SP2_1_10CLI NumClients 10
keylset Wifi5_AC_SP2_1_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_2_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_SP2_2_10CLI NumClients 10
keylset Wifi5_AC_SP2_2_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_3_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_SP2_3_10CLI NumClients 10
keylset Wifi5_AC_SP2_3_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_4_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_SP2_4_10CLI NumClients 10
keylset Wifi5_AC_SP2_4_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_5_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_SP2_5_10CLI NumClients 10
keylset Wifi5_AC_SP2_5_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_6_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_SP2_6_10CLI NumClients 10
keylset Wifi5_AC_SP2_6_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_7_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_SP2_7_10CLI NumClients 10
keylset Wifi5_AC_SP2_7_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_8_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_SP2_8_10CLI NumClients 10
keylset Wifi5_AC_SP2_8_10CLI NumSpatialStreams 2

set Wifi5_AC_SP2_9_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_SP2_9_10CLI NumClients 10
keylset Wifi5_AC_SP2_9_10CLI NumSpatialStreams 2

set Wifi5_AC_SP3_0_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_0_1CLI VhtDataMcs 0
keylset Wifi5_AC_SP3_0_1CLI NumClients 1
keylset Wifi5_AC_SP3_0_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_1_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_1_1CLI VhtDataMcs 1
keylset Wifi5_AC_SP3_1_1CLI NumClients 1
keylset Wifi5_AC_SP3_1_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_2_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_2_1CLI VhtDataMcs 2
keylset Wifi5_AC_SP3_2_1CLI NumClients 1
keylset Wifi5_AC_SP3_2_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_3_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_3_1CLI VhtDataMcs 3
keylset Wifi5_AC_SP3_3_1CLI NumClients 1
keylset Wifi5_AC_SP3_3_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_4_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_4_1CLI VhtDataMcs 4
keylset Wifi5_AC_SP3_4_1CLI NumClients 1
keylset Wifi5_AC_SP3_4_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_5_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_5_1CLI VhtDataMcs 5
keylset Wifi5_AC_SP3_5_1CLI NumClients 1
keylset Wifi5_AC_SP3_5_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_6_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_6_1CLI VhtDataMcs 6
keylset Wifi5_AC_SP3_6_1CLI NumClients 1
keylset Wifi5_AC_SP3_6_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_7_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_7_1CLI VhtDataMcs 7
keylset Wifi5_AC_SP3_7_1CLI NumClients 1
keylset Wifi5_AC_SP3_7_1CLI NumSpatialStreams 3

set Wifi5_AC_SP3_8_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_8_1CLI VhtDataMcs 8
keylset Wifi5_AC_SP3_8_1CLI NumClients 1
keylset Wifi5_AC_SP3_8_1CLI NumSpatialStreams 3

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


set Wifi5_AC_SP3_0_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_0_10CLI VhtDataMcs 0
keylset Wifi5_AC_SP3_0_10CLI NumClients 10
keylset Wifi5_AC_SP3_0_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_1_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_1_10CLI VhtDataMcs 1
keylset Wifi5_AC_SP3_1_10CLI NumClients 10
keylset Wifi5_AC_SP3_1_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_2_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_2_10CLI VhtDataMcs 2
keylset Wifi5_AC_SP3_2_10CLI NumClients 10
keylset Wifi5_AC_SP3_3_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_3_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_3_10CLI VhtDataMcs 3
keylset Wifi5_AC_SP3_3_10CLI NumClients 10
keylset Wifi5_AC_SP3_3_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_4_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_4_10CLI VhtDataMcs 4
keylset Wifi5_AC_SP3_4_10CLI NumClients 10
keylset Wifi5_AC_SP3_4_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_5_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_5_10CLI VhtDataMcs 5
keylset Wifi5_AC_SP3_5_10CLI NumClients 10
keylset Wifi5_AC_SP3_5_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_6_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_6_10CLI VhtDataMcs 6
keylset Wifi5_AC_SP3_6_10CLI NumClients 10
keylset Wifi5_AC_SP3_6_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_7_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_7_10CLI VhtDataMcs 7
keylset Wifi5_AC_SP3_7_10CLI NumClients 10
keylset Wifi5_AC_SP3_7_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_8_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_8_10CLI VhtDataMcs 8
keylset Wifi5_AC_SP3_8_10CLI NumClients 10
keylset Wifi5_AC_SP3_8_10CLI NumSpatialStreams 3

set Wifi5_AC_SP3_9_10CLI ${Wifi5_80}
keylset Wifi5_AC_SP3_9_10CLI VhtDataMcs 9
keylset Wifi5_AC_SP3_9_10CLI NumClients 10
keylset Wifi5_AC_SP3_9_10CLI NumSpatialStreams 3



#unicast_latency MCSG US Options
keylset LAT_24_20_MG_C1_US Test unicast_latency
keylset LAT_24_20_MG_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_MG_C1_US ILoadList {4407.71	4221.64	3818.62	3258.66	2488.34	2033.04}
keylset LAT_24_20_MG_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_MG_C1_US AcceptableMaxLatency 20
keylset LAT_24_20_MG_C1_US Source {Wifi2_g_1CLI}
keylset LAT_24_20_MG_C1_US Destination {Eth}

#unicast_latency MCS7 US Options
keylset LAT_24_20_M7_C1_US Test unicast_latency
keylset LAT_24_20_M7_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M7_C1_US ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_24_20_M7_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M7_C1_US AcceptableMaxLatency 20
keylset LAT_24_20_M7_C1_US Source {Wifi2_7_1CLI}
keylset LAT_24_20_M7_C1_US Destination {Eth}

#unicast_latency MCS15 US Options
keylset LAT_24_20_M15_C1_US Test unicast_latency
keylset LAT_24_20_M15_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M15_C1_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_24_20_M15_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M15_C1_US AcceptableMaxLatency 0
keylset LAT_24_20_M15_C1_US Source {Wifi2_15_1CLI}
keylset LAT_24_20_M15_C1_US Destination {Eth}

#unicast_latency MCS23 US Options
keylset LAT_24_20_M23_C1_US Test unicast_latency
keylset LAT_24_20_M23_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M23_C1_US ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_24_20_M23_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M23_C1_US AcceptableMaxLatency 0
keylset LAT_24_20_M23_C1_US Source {Wifi2_23_1CLI}
keylset LAT_24_20_M23_C1_US Destination {Eth}

#unicast_latency MCS31 US Options
keylset LAT_24_20_M31_C1_US Test unicast_latency
keylset LAT_24_20_M31_C1_US FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M31_C1_US ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_24_20_M31_C1_US AcceptableAvgLatency 0
keylset LAT_24_20_M31_C1_US AcceptableMaxLatency 0
keylset LAT_24_20_M31_C1_US Source {Wifi2_31_1CLI}
keylset LAT_24_20_M31_C1_US Destination {Eth}

#unicast_latency MCSA US Options
keylset LAT_5_20_MA_C1_US Test unicast_latency
keylset LAT_5_20_MA_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_MA_C1_US ILoadList {4407.71	4221.64	3818.62	3258.66	2488.34	2033.04}
keylset LAT_5_20_MA_C1_US AcceptableAvgLatency 0
keylset LAT_5_20_MA_C1_US AcceptableMaxLatency 20
keylset LAT_5_20_MA_C1_US Source {Wifi5_20_a_1CLI}
keylset LAT_5_20_MA_C1_US Destination {Eth}

#unicast_latency MCS7 US Options
keylset LAT_5_20_M7_C1_US Test unicast_latency
keylset LAT_5_20_M7_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_M7_C1_US ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_5_20_M7_C1_US AcceptableAvgLatency 0
keylset LAT_5_20_M7_C1_US AcceptableMaxLatency 20
keylset LAT_5_20_M7_C1_US Source {Wifi5_20_7_1CLI}
keylset LAT_5_20_M7_C1_US Destination {Eth}

#unicast_latency MCS15 US Options
keylset LAT_5_20_M15_C1_US Test unicast_latency
keylset LAT_5_20_M15_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_M15_C1_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_5_20_M15_C1_US AcceptableAvgLatency 0
keylset LAT_5_20_M15_C1_US AcceptableMaxLatency 0
keylset LAT_5_20_M15_C1_US Source {Wifi5_20_15_1CLI}
keylset LAT_5_20_M15_C1_US Destination {Eth}

#unicast_latency MCS23 US Options
keylset LAT_5_20_M23_C1_US Test unicast_latency
keylset LAT_5_20_M23_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_M23_C1_US ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_5_20_M23_C1_US AcceptableAvgLatency 0
keylset LAT_5_20_M23_C1_US AcceptableMaxLatency 0
keylset LAT_5_20_M23_C1_US Source {Wifi5_20_23_1CLI}
keylset LAT_5_20_M23_C1_US Destination {Eth}

#unicast_latency MCS7 US Options
keylset LAT_5_40_M7_C1_US Test unicast_latency
keylset LAT_5_40_M7_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M7_C1_US ILoadList {98178.33 66884.39 40976.39 23047.49 12284.83 8338.5}
keylset LAT_5_40_M7_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M7_C1_US AcceptableMaxLatency 20
keylset LAT_5_40_M7_C1_US Source {Wifi5_40_7_1CLI}
keylset LAT_5_40_M7_C1_US Destination {Eth}

#unicast_latency MCS15 US Options
keylset LAT_5_40_M15_C1_US Test unicast_latency
keylset LAT_5_40_M15_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M15_C1_US ILoadList {143216.78 106334.37 70963.27 42331.54 23423.85 15897.8}
keylset LAT_5_40_M15_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M15_C1_US AcceptableMaxLatency 0
keylset LAT_5_40_M15_C1_US Source {Wifi5_40_15_1CLI}
keylset LAT_5_40_M15_C1_US Destination {Eth}

#unicast_latency MCS23 US Options
keylset LAT_5_40_M23_C1_US Test unicast_latency
keylset LAT_5_40_M23_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M23_C1_US ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_40_M23_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M23_C1_US AcceptableMaxLatency 0
keylset LAT_5_40_M23_C1_US Source {Wifi5_40_23_1CLI}
keylset LAT_5_40_M23_C1_US Destination {Eth}

#unicast_latency MCS31 US Options
keylset LAT_5_40_M31_C1_US Test unicast_latency
keylset LAT_5_40_M31_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M31_C1_US ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_40_M31_C1_US AcceptableAvgLatency 0
keylset LAT_5_40_M31_C1_US AcceptableMaxLatency 0
keylset LAT_5_40_M31_C1_US Source {Wifi5_40_31_1CLI}
keylset LAT_5_40_M31_C1_US Destination {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_1S_C1_US Test unicast_latency
keylset LAT_5_80_M9_1S_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_1S_C1_US ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_1S_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_M9_1S_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_M9_1S_C1_US Source {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_M9_1S_C1_US Destination {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_1S_C1_DS Test unicast_latency
keylset LAT_5_80_M9_1S_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_1S_C1_DS ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_1S_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_M9_1S_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_M9_1S_C1_DS Destination {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_M9_1S_C1_DS Source {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_2S_C1_US Test unicast_latency
keylset LAT_5_80_M9_2S_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_2S_C1_US ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_2S_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_M9_2S_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_M9_2S_C1_US Source {Wifi5_AC_SP2_9_1CLI}
keylset LAT_5_80_M9_2S_C1_US Destination {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_2S_C1_DS Test unicast_latency
keylset LAT_5_80_M9_2S_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_2S_C1_DS ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_2S_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_M9_2S_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_M9_2S_C1_DS Destination {Wifi5_AC_SP2_9_1CLI}
keylset LAT_5_80_M9_2S_C1_DS Source {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_3S_C1_US Test unicast_latency
keylset LAT_5_80_M9_3S_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_3S_C1_US ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_3S_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_M9_3S_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_M9_3S_C1_US Source {Wifi5_AC_SP3_9_1CLI}
keylset LAT_5_80_M9_3S_C1_US Destination {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_3S_C1_DS Test unicast_latency
keylset LAT_5_80_M9_3S_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_3S_C1_DS ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_3S_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_M9_3S_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_M9_3S_C1_DS Destination {Wifi5_AC_SP3_9_1CLI}
keylset LAT_5_80_M9_3S_C1_DS Source {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_4S_C1_US Test unicast_latency
keylset LAT_5_80_M9_4S_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_4S_C1_US ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_4S_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_M9_4S_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_M9_4S_C1_US Source {Wifi5_AC_SP4_9_1CLI}
keylset LAT_5_80_M9_4S_C1_US Destination {Eth}

#unicast_latency MCS9 US 580 Options
keylset LAT_5_80_M9_4S_C1_DS Test unicast_latency
keylset LAT_5_80_M9_4S_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_M9_4S_C1_DS ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_80_M9_4S_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_M9_4S_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_M9_4S_C1_DS Destination {Wifi5_AC_SP4_9_1CLI}
keylset LAT_5_80_M9_4S_C1_DS Source {Eth}


#unicast_latency MCSG DS Options
keylset LAT_24_20_MG_C1_DS Test unicast_latency
keylset LAT_24_20_MG_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_MG_C1_DS ILoadList {4407.71	4221.64	3818.62	3258.66	2488.34	2033.04}
keylset LAT_24_20_MG_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_MG_C1_DS AcceptableMaxLatency 20
keylset LAT_24_20_MG_C1_DS Source {Eth}
keylset LAT_24_20_MG_C1_DS Destination {Wifi2_g_1CLI}

#unicast_latency MCS7 DS Options
keylset LAT_24_20_M7_C1_DS Test unicast_latency
keylset LAT_24_20_M7_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M7_C1_DS ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_24_20_M7_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M7_C1_DS AcceptableMaxLatency 20
keylset LAT_24_20_M7_C1_DS Source {Eth}
keylset LAT_24_20_M7_C1_DS Destination {Wifi2_7_1CLI}

#unicast_latency MCS15 DS Options
keylset LAT_24_20_M15_C1_DS Test unicast_latency
keylset LAT_24_20_M15_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M15_C1_DS ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_24_20_M15_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M15_C1_DS AcceptableMaxLatency 0
keylset LAT_24_20_M15_C1_DS Source {Eth}
keylset LAT_24_20_M15_C1_DS Destination {Wifi2_15_1CLI}

#unicast_latency MCS23 DS Options
keylset LAT_24_20_M23_C1_DS Test unicast_latency
keylset LAT_24_20_M23_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M23_C1_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_24_20_M23_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M23_C1_DS AcceptableMaxLatency 0
keylset LAT_24_20_M23_C1_DS Source {Eth}
keylset LAT_24_20_M23_C1_DS Destination {Wifi2_23_1CLI}

#unicast_latency MCS31 DS Options
keylset LAT_24_20_M31_C1_DS Test unicast_latency
keylset LAT_24_20_M31_C1_DS FrameSizeList {$ipv6_24_min_frame_size 128 256 512 1024 1518}
keylset LAT_24_20_M31_C1_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_24_20_M31_C1_DS AcceptableAvgLatency 0
keylset LAT_24_20_M31_C1_DS AcceptableMaxLatency 0
keylset LAT_24_20_M31_C1_DS Source {Eth}
keylset LAT_24_20_M31_C1_DS Destination {Wifi2_31_1CLI}

#unicast_latency MCSA DS Options
keylset LAT_5_20_MA_C1_DS Test unicast_latency
keylset LAT_5_20_MA_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_MA_C1_DS ILoadList {4407.71	4221.64	3818.62	3258.66	2488.34	2033.04}
keylset LAT_5_20_MA_C1_DS AcceptableAvgLatency 0
keylset LAT_5_20_MA_C1_DS AcceptableMaxLatency 20
keylset LAT_5_20_MA_C1_DS Source {Eth}
keylset LAT_5_20_MA_C1_DS Destination {Wifi5_20_a_1CLI}

#unicast_latency MCS7 DS Options
keylset LAT_5_20_M7_C1_DS Test unicast_latency
keylset LAT_5_20_M7_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_M7_C1_DS ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_5_20_M7_C1_DS AcceptableAvgLatency 0
keylset LAT_5_20_M7_C1_DS AcceptableMaxLatency 20
keylset LAT_5_20_M7_C1_DS Source {Eth}
keylset LAT_5_20_M7_C1_DS Destination {Wifi5_20_7_1CLI}

#unicast_latency MCS15 DS Options
keylset LAT_5_20_M15_C1_DS Test unicast_latency
keylset LAT_5_20_M15_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_M15_C1_DS ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_5_20_M15_C1_DS AcceptableAvgLatency 0
keylset LAT_5_20_M15_C1_DS AcceptableMaxLatency 0
keylset LAT_5_20_M15_C1_DS Source {Eth}
keylset LAT_5_20_M15_C1_DS Destination {Wifi5_20_15_1CLI}

#unicast_latency MCS23 DS Options
keylset LAT_5_20_M23_C1_DS Test unicast_latency
keylset LAT_5_20_M23_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_20_M23_C1_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_5_20_M23_C1_DS AcceptableAvgLatency 0
keylset LAT_5_20_M23_C1_DS AcceptableMaxLatency 0
keylset LAT_5_20_M23_C1_DS Source {Eth}
keylset LAT_5_20_M23_C1_DS Destination {Wifi5_20_23_1CLI}

#unicast_latency MCS7 DS Options
keylset LAT_5_40_M7_C1_DS Test unicast_latency
keylset LAT_5_40_M7_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M7_C1_DS ILoadList {98178.33 66884.39 40976.39 23047.49 12284.83 8338.5}
keylset LAT_5_40_M7_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M7_C1_DS AcceptableMaxLatency 20
keylset LAT_5_40_M7_C1_DS Source {Eth}
keylset LAT_5_40_M7_C1_DS Destination {Wifi5_40_7_1CLI}

#unicast_latency MCS15 DS Options
keylset LAT_5_40_M15_C1_DS Test unicast_latency
keylset LAT_5_40_M15_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M15_C1_DS ILoadList {143216.78 106334.37 70963.27 42331.54 23423.85 15897.8}
keylset LAT_5_40_M15_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M15_C1_DS AcceptableMaxLatency 0
keylset LAT_5_40_M15_C1_DS Source {Eth}
keylset LAT_5_40_M15_C1_DS Destination {Wifi5_40_15_1CLI}

#unicast_latency MCS23 DS Options
keylset LAT_5_40_M23_C1_DS Test unicast_latency
keylset LAT_5_40_M23_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M23_C1_DS ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_40_M23_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M23_C1_DS AcceptableMaxLatency 0
keylset LAT_5_40_M23_C1_DS Source {Eth}
keylset LAT_5_40_M23_C1_DS Destination {Wifi5_40_23_1CLI}

#unicast_latency MCS31 DS Options
keylset LAT_5_40_M31_C1_DS Test unicast_latency
keylset LAT_5_40_M31_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_40_M31_C1_DS ILoadList {165428.11 130114.36 92502.26 58347.58 33479.58 22679.72}
keylset LAT_5_40_M31_C1_DS AcceptableAvgLatency 0
keylset LAT_5_40_M31_C1_DS AcceptableMaxLatency 0
keylset LAT_5_40_M31_C1_DS Source {Eth}
keylset LAT_5_40_M31_C1_DS Destination {Wifi5_40_31_1CLI}


#unicast_latency MCSG DB_DS Options
keylset LAT_MG_C1_DB_DS Test unicast_latency
keylset LAT_MG_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_MG_C1_DB_DS ILoadList {4407.71	4221.64	3818.62	3258.66	2488.34	2033.04}
keylset LAT_MG_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_MG_C1_DB_DS AcceptableMaxLatency 20
keylset LAT_MG_C1_DB_DS Source {Eth}
keylset LAT_MG_C1_DB_DS Destination {Wifi2_g_1CLI Wifi5_20_a_1CLI}

#unicast_latency MCS7 DB_DS Options
keylset LAT_M7_C1_DB_DS Test unicast_latency
keylset LAT_M7_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M7_C1_DB_DS ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_M7_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M7_C1_DB_DS AcceptableMaxLatency 20
keylset LAT_M7_C1_DB_DS Source {Eth}
keylset LAT_M7_C1_DB_DS Destination {Wifi2_7_1CLI Wifi5_40_7_1CLI}

#unicast_latency MCS15 DB_DS Options
keylset LAT_M15_C1_DB_DS Test unicast_latency
keylset LAT_M15_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_C1_DB_DS ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M15_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M15_C1_DB_DS Source {Eth}
keylset LAT_M15_C1_DB_DS Destination {Wifi2_15_1CLI Wifi5_40_15_1CLI}

#unicast_latency MCS23 DB_DS Options
keylset LAT_M23_C1_DB_DS Test unicast_latency
keylset LAT_M23_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M23_C1_DB_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_M23_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M23_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M23_C1_DB_DS Source {Eth}
keylset LAT_M23_C1_DB_DS Destination {Wifi2_23_1CLI Wifi5_40_23_1CLI}

#unicast_latency MCS31 DB_DS Options
keylset LAT_M31_C1_DB_DS Test unicast_latency
keylset LAT_M31_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M31_C1_DB_DS ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_M31_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M31_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M31_C1_DB_DS Source {Eth}
keylset LAT_M31_C1_DB_DS Destination {Wifi2_31_1CLI Wifi5_40_31_1CLI}


#unicast_latency MCSG DB_US Options
keylset LAT_MG_C1_DB_US Test unicast_latency
keylset LAT_MG_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_MG_C1_DB_US ILoadList {4407.71	4221.64	3818.62	3258.66	2488.34	2033.04}
keylset LAT_MG_C1_DB_US AcceptableAvgLatency 0
keylset LAT_MG_C1_DB_US AcceptableMaxLatency 20
keylset LAT_MG_C1_DB_US Source {Wifi2_g_1CLI Wifi5_20_a_1CLI}
keylset LAT_MG_C1_DB_US Destination {Eth}

#unicast_latency MCS7 DB_US Options
keylset LAT_M7_C1_DB_US Test unicast_latency
keylset LAT_M7_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M7_C1_DB_US ILoadList {58082.81 36954.17 21391.27 11611.29 5994.11 4065.7}
keylset LAT_M7_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M7_C1_DB_US AcceptableMaxLatency 20
keylset LAT_M7_C1_DB_US Source {Wifi2_7_1CLI Wifi5_40_7_1CLI}
keylset LAT_M7_C1_DB_US Destination {Eth}

#unicast_latency MCS15 DB_US Options
keylset LAT_M15_C1_DB_US Test unicast_latency
keylset LAT_M15_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_C1_DB_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M15_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M15_C1_DB_US Source {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset LAT_M15_C1_DB_US Destination {Eth}


#unicast_latency MCS15_23 DB_US Options
keylset LAT_M15_23_C1_DB_US Test unicast_latency
keylset LAT_M15_23_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_23_C1_DB_US ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_23_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M15_23_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M15_23_C1_DB_US Source {Wifi2_15_1CLI Wifi5_40_15_1CLI}
keylset LAT_M15_23_C1_DB_US Destination {Eth}

#unicast_latency MCS15_23 DB_SS Options
keylset LAT_M15_23_C1_DB_DS Test unicast_latency
keylset LAT_M15_23_C1_DB_DS FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M15_23_C1_DB_DS ILoadList {95255.81 64851.17 39582.53 22246.36 11839.12 8035.39}
keylset LAT_M15_23_C1_DB_DS AcceptableAvgLatency 0
keylset LAT_M15_23_C1_DB_DS AcceptableMaxLatency 0
keylset LAT_M15_23_C1_DB_DS Destination {Wifi2_15_1CLI Wifi5_40_23_1CLI}
keylset LAT_M15_23_C1_DB_DS Source {Eth}


#unicast_latency MCS23 DB_US Options
keylset LAT_M23_C1_DB_US Test unicast_latency
keylset LAT_M23_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M23_C1_DB_US ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_M23_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M23_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M23_C1_DB_US Source {Wifi2_23_1CLI Wifi5_40_23_1CLI}
keylset LAT_M23_C1_DB_US Destination {Eth}

#unicast_latency MCS31 DB_US Options
keylset LAT_M31_C1_DB_US Test unicast_latency
keylset LAT_M31_C1_DB_US FrameSizeList {$ipv6_db_min_frame_size 128 256 512 1024 1518}
keylset LAT_M31_C1_DB_US ILoadList {119208.38 85690.38 54847.35 31890.38 17309.37 11742.09}
keylset LAT_M31_C1_DB_US AcceptableAvgLatency 0
keylset LAT_M31_C1_DB_US AcceptableMaxLatency 0
keylset LAT_M31_C1_DB_US Source {Wifi2_31_1CLI Wifi5_40_31_1CLI}
keylset LAT_M31_C1_DB_US Destination {Eth}


#unicast_latency MCS0 SS1 US Options
keylset LAT_5_80_S1_M0_C1_US Test unicast_latency
keylset LAT_5_80_S1_M0_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M0_C1_US ILoadList {28934.73 17719.33 9981.48 5235.69 2671.86 1813.54}
keylset LAT_5_80_S1_M0_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S1_M0_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S1_M0_C1_US Source {Wifi5_AC_SP1_0_1CLI}
keylset LAT_5_80_S1_M0_C1_US Destination {Eth}

#unicast_latency MCS0 SS1 US Options
keylset LAT_5_80_S1_M0_C1_DS Test unicast_latency
keylset LAT_5_80_S1_M0_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M0_C1_DS ILoadList {28934.73 17719.33 9981.48 5235.69 2671.86 1813.54}
keylset LAT_5_80_S1_M0_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S1_M0_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S1_M0_C1_DS Source {Wifi5_AC_SP1_0_1CLI}
keylset LAT_5_80_S1_M0_C1_DS Destination {Eth}


#unicast_latency MCS4 SS1 US Options
keylset LAT_5_80_S1_M4_C1_US Test unicast_latency
keylset LAT_5_80_S1_M4_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M4_C1_US ILoadList {131704.18 89393.28 53965.74 30246.64 16056.45 11042.22}
keylset LAT_5_80_S1_M4_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S1_M4_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S1_M4_C1_US Source {Wifi5_AC_SP1_4_1CLI}
keylset LAT_5_80_S1_M4_C1_US Destination {Eth}

#unicast_latency MCS4 SS1 US Options
keylset LAT_5_80_S1_M4_C1_DS Test unicast_latency
keylset LAT_5_80_S1_M4_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M4_C1_DS ILoadList {131704.18 89393.28 53965.74 30246.64 16056.45 11042.22}
keylset LAT_5_80_S1_M4_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S1_M4_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S1_M4_C1_DS Source {Wifi5_AC_SP1_4_1CLI}
keylset LAT_5_80_S1_M4_C1_DS Destination {Eth}

#unicast_latency MCS9 SS1 US Options
keylset LAT_5_80_S1_M9_C1_US Test unicast_latency
keylset LAT_5_80_S1_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M9_C1_US ILoadList {209193.05 155741.44 103069.95 61483.04 34025.59 23739.42}
keylset LAT_5_80_S1_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S1_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S1_M9_C1_US Source {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_S1_M9_C1_US Destination {Eth}

#unicast_latency MCS9 SS1 US Options
keylset LAT_5_80_S1_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S1_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S1_M9_C1_DS ILoadList {209193.05 155741.44 103069.95 61483.04 34025.59 23739.42}
keylset LAT_5_80_S1_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S1_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S1_M9_C1_DS Source {Wifi5_AC_SP1_9_1CLI}
keylset LAT_5_80_S1_M9_C1_DS Destination {Eth}

#unicast_latency MCS0 SS2 US Options
keylset LAT_5_80_S2_M0_C1_US Test unicast_latency
keylset LAT_5_80_S2_M0_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M0_C1_US ILoadList {54424.66 34116.28 19536.39 10533.35 5408.62 3670.57}
keylset LAT_5_80_S2_M0_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S2_M0_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S2_M0_C1_US Source {Wifi5_AC_SP2_0_1CLI}
keylset LAT_5_80_S2_M0_C1_US Destination {Eth}

#unicast_latency MCS0 SS2 US Options
keylset LAT_5_80_S2_M0_C1_DS Test unicast_latency
keylset LAT_5_80_S2_M0_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M0_C1_DS ILoadList {54424.66 34116.28 19536.39 10533.35 5408.62 3670.57}
keylset LAT_5_80_S2_M0_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S2_M0_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S2_M0_C1_DS Source {Wifi5_AC_SP2_0_1CLI}
keylset LAT_5_80_S2_M0_C1_DS Destination {Eth}

#unicast_latency MCS4 SS2 US Options
keylset LAT_5_80_S2_M4_C1_US Test unicast_latency
keylset LAT_5_80_S2_M4_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M4_C1_US ILoadList {193389.99 143517.87 93988.07 55849.47 30755.37 21433.80}
keylset LAT_5_80_S2_M4_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S2_M4_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S2_M4_C1_US Source {Wifi5_AC_SP2_4_1CLI}
keylset LAT_5_80_S2_M4_C1_US Destination {Eth}

#unicast_latency MCS4 SS2 US Options
keylset LAT_5_80_S2_M4_C1_DS Test unicast_latency
keylset LAT_5_80_S2_M4_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M4_C1_DS ILoadList {193389.99 143517.87 93988.07 55849.47 30755.37 21433.80}
keylset LAT_5_80_S2_M4_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S2_M4_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S2_M4_C1_DS Source {Wifi5_AC_SP2_4_1CLI}
keylset LAT_5_80_S2_M4_C1_DS Destination {Eth}

#unicast_latency MCS9 SS2 US Options
keylset LAT_5_80_S2_M9_C1_US Test unicast_latency
keylset LAT_5_80_S2_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M9_C1_US ILoadList {265629.05 219978.52 161641.67 105621.45 62381.97 44570.18}
keylset LAT_5_80_S2_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S2_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S2_M9_C1_US Source {Wifi5_AC_SP2_9_1CLI}
keylset LAT_5_80_S2_M9_C1_US Destination {Eth}

#unicast_latency MCS9 SS2 US Options
keylset LAT_5_80_S2_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S2_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S2_M9_C1_DS ILoadList {265629.05 219978.52 161641.67 105621.45 62381.97 44570.18}
keylset LAT_5_80_S2_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S2_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S2_M9_C1_DS Source {Wifi5_AC_SP2_9_1CLI}
keylset LAT_5_80_S2_M9_C1_DS Destination {Eth}

#unicast_latency MCS0 SS3 US Options
keylset LAT_5_80_S3_M0_C1_US Test unicast_latency
keylset LAT_5_80_S3_M0_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M0_C1_US ILoadList {73908.34 48086.40 28244.38 15492.85 8103.10 5498.53}
keylset LAT_5_80_S3_M0_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S3_M0_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S3_M0_C1_US Source {Wifi5_AC_SP3_0_1CLI}
keylset LAT_5_80_S3_M0_C1_US Destination {Eth}

#unicast_latency MCS0 SS3 US Options
keylset LAT_5_80_S3_M0_C1_DS Test unicast_latency
keylset LAT_5_80_S3_M0_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M0_C1_DS ILoadList {73908.34 48086.40 28244.38 15492.85 8103.10 5498.53}
keylset LAT_5_80_S3_M0_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S3_M0_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S3_M0_C1_DS Source {Wifi5_AC_SP3_0_1CLI}
keylset LAT_5_80_S3_M0_C1_DS Destination {Eth}

#unicast_latency MCS4 SS3 US Options
keylset LAT_5_80_S3_M4_C1_US Test unicast_latency
keylset LAT_5_80_S3_M4_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M4_C1_US ILoadList {176856.65 146494.99 92627.77 55366.32 30608.28 21362.26}
keylset LAT_5_80_S3_M4_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S3_M4_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S3_M4_C1_US Source {Wifi5_AC_SP3_4_1CLI}
keylset LAT_5_80_S3_M4_C1_US Destination {Eth}

#unicast_latency MCS4 SS3 US Options
keylset LAT_5_80_S3_M4_C1_DS Test unicast_latency
keylset LAT_5_80_S3_M4_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M4_C1_DS ILoadList {176856.65 146494.99 92627.77 55366.32 30608.28 21362.26}
keylset LAT_5_80_S3_M4_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S3_M4_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S3_M4_C1_DS Source {Wifi5_AC_SP3_4_1CLI}
keylset LAT_5_80_S3_M4_C1_DS Destination {Eth}

#unicast_latency MCS9 SS3 US Options
keylset LAT_5_80_S3_M9_C1_US Test unicast_latency
keylset LAT_5_80_S3_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M9_C1_US ILoadList {212008.28 189981.45 157296.47 117028.57 77399.85 58347.58}
keylset LAT_5_80_S3_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S3_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S3_M9_C1_US Source {Wifi5_AC_SP3_9_1CLI}
keylset LAT_5_80_S3_M9_C1_US Destination {Eth}

#unicast_latency MCS9 SS3 US Options
keylset LAT_5_80_S3_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S3_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S3_M9_C1_DS ILoadList {212008.28 189981.45 157296.47 117028.57 77399.85 58347.58}
keylset LAT_5_80_S3_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S3_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S3_M9_C1_DS Source {Eth}
keylset LAT_5_80_S3_M9_C1_DS Destination {Wifi5_AC_SP3_9_1CLI}

#unicast_latency MCS9 SS3 US Options
keylset LAT_5_80_S4_M9_C1_US Test unicast_latency
keylset LAT_5_80_S4_M9_C1_US FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S4_M9_C1_US ILoadList {212008.28 189981.45 157296.47 117028.57 77399.85 58347.58}
keylset LAT_5_80_S4_M9_C1_US AcceptableAvgLatency 0
keylset LAT_5_80_S4_M9_C1_US AcceptableMaxLatency 0
keylset LAT_5_80_S4_M9_C1_US Source {Wifi5_AC_SP4_9_1CLI}
keylset LAT_5_80_S4_M9_C1_US Destination {Eth}

#unicast_latency MCS9 SS4 US Options
keylset LAT_5_80_S4_M9_C1_DS Test unicast_latency
keylset LAT_5_80_S4_M9_C1_DS FrameSizeList {$ipv6_5_min_frame_size 128 256 512 1024 1518}
keylset LAT_5_80_S4_M9_C1_DS ILoadList {212008.28 189981.45 157296.47 117028.57 77399.85 58347.58}
keylset LAT_5_80_S4_M9_C1_DS AcceptableAvgLatency 0
keylset LAT_5_80_S4_M9_C1_DS AcceptableMaxLatency 0
keylset LAT_5_80_S4_M9_C1_DS Source {Eth}
keylset LAT_5_80_S4_M9_C1_DS Destination {Wifi5_AC_SP4_9_1CLI}


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
keylset generic_dut_0 Interface.802_3.EthernetSpeed 100
keylset generic_dut_0 Interface.802_3.Duplex full
keylset generic_dut_0 Interface.802_3.Autonegotiation on
keylset generic_dut_0 Interface.802_3.HighPerformance off
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
keylset generic_dut_2 Interface.802_11ac.HighPerformance off
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
keylset generic_dut_5 Interface.802_11ac.HighPerformance off
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.EnableRxAttenuation $ATTN5
keylset generic_dut_5 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_5 WLANSwitchModel $LANSModel


#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

