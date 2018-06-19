
#Auto-generated from: MCD
#At: 2014-04-22 10:40:12.638000
source $ipv6_defaults_tcl
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Direction {Unidirectional}
keylset global_config Source {Eth}
keylset global_config Destination {Wifi2}

#Traffics Global Options

keylset global_config PayloadData None

#TestParameters Global Options
keylset global_config Ipv6PrefFlag 1
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
set WLANSwitchModel none
set WLANSwitchFW none
set ATTN24 off
set ATTN5 off
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir
keylset global_config dbserverip 127.0.0.1

#Learning Global Options


#Mapping Options
keylset global_config FlowType UDP

#Wireless Group Count
keylset global_config WirelessGroupCount 1

#Tests - you may define more than one in a TCL list.
#MX_<Band/BW>_<SS>_<MCS> ie: MX_24_20_M23
keylset global_config TestList ${test_list}


#Group Eth
keylset Eth GroupType 802.3
keylset Eth Dut generic_dut_0

#Group Eth - Client Options
keylset Eth Hops -1
keylset Eth Dhcp Enable
keylset Eth GratuitousArp True
keylset Eth MacAddress None
keylset Eth Gateway 192.168.1.1
keylset Eth Qos Disable
keylset Eth BaseIp 192.168.1.10

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
keylset Wifi2 MacAddress 00:00:01:00:00:01
keylset Wifi2 MacAddressIncr 1
keylset Wifi2 PlcpConfiguration mixed
keylset Wifi2 ChannelBandwidth 20
keylset Wifi2 EnableAMSDUrxaggregation False
keylset Wifi2 EnableAMSDUtxaggregation False
keylset Wifi2 EnableAMPDUaggregation True
keylset Wifi2 KeepAlive True
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

ipv6_interface Wifi2 24


#Group Wifi2 - Security Options
keylset Wifi2 Method {WPA2-PSK}
keylset Wifi2 EnableValidateCertificate off
keylset Wifi2 PskAscii charter123


set Wifi2_g_1CLI ${Wifi2}
keylset Wifi2_g_1CLI phyInterface 802.11ag
keylset Wifi2_g_1CLI NumClients 1

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



#Group Wifi5
keylset Wifi5 GroupType 802.11ac
keylset Wifi5 Dut generic_dut_5


#Group Wifi5 - Client Options
keylset Wifi5 Ssid $SSID_5
keylset Wifi5 Dhcp Enable
keylset Wifi5 GratuitousArp True
keylset Wifi5 MacAddress 00:00:01:00:00:01
keylset Wifi5 MacAddressIncr 1
keylset Wifi5 PlcpConfiguration mixed
keylset Wifi5 ChannelBandwidth 40
keylset Wifi5 EnableAMSDUrxaggregation False
keylset Wifi5 EnableAMSDUtxaggregation False
keylset Wifi5 EnableAMPDUaggregation True
keylset Wifi5 KeepAlive True
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

set Wifi5_20 ${Wifi5}
keylset Wifi5_20 ChannelBandwidth 20

set Wifi5_40 ${Wifi5}
keylset Wifi5_40 ChannelBandwidth 40

set Wifi5_80 ${Wifi5}
keylset Wifi5_80 ChannelBandwidth 80
keylset Wifi5_80 phyInterface 802.11ac
keylset Wifi5_80 PlcpConfiguration vht_mixed

set Wifi5_20_7_1CLI ${Wifi5_20}
keylset Wifi5_20_7_1CLI DataMcsIndex 7
keylset Wifi5_20_7_1CLI NumClients 1

set Wifi5_20_15_1CLI ${Wifi5_20}
keylset Wifi5_20_15_1CLI DataMcsIndex 15
keylset Wifi5_20_15_1CLI NumClients 1

set Wifi5_20_23_1CLI ${Wifi5_20}
keylset Wifi5_20_23_1CLI DataMcsIndex 23
keylset Wifi5_20_23_1CLI NumClients 1

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

set Wifi5_AC_SP2_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP2_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP2_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP2_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP2_9_1CLI NumClients 1
keylset Wifi5_AC_SP2_9_1CLI NumSpatialStreams 2

set Wifi5_AC_SP1_9_1CLI ${Wifi5_80}
keylset Wifi5_AC_SP1_9_1CLI VhtDataMcs 9
keylset Wifi5_AC_SP1_9_1CLI USManagementMcs 11
keylset Wifi5_AC_SP1_9_1CLI USDataMcs 9
keylset Wifi5_AC_SP1_9_1CLI NumClients 1
keylset Wifi5_AC_SP1_9_1CLI NumSpatialStreams 1


#MX_24_20_M31 Options
keylset MX_24_20_M31 Test unicast_max_client_capacity
keylset MX_24_20_M31 FrameSizeList {512}
keylset MX_24_20_M31 ILoadList {10}
keylset MX_24_20_M31 MaxSearchValue 255
keylset MX_24_20_M31 ExpectedClientConnections 50
keylset MX_24_20_M31 Source {Eth}
keylset MX_24_20_M31 Destination {Wifi2_31_1CLI}

#MX_24_20_M23 Options
keylset MX_24_20_M23 Test unicast_max_client_capacity
keylset MX_24_20_M23 FrameSizeList {512}
keylset MX_24_20_M23 ILoadList {10}
keylset MX_24_20_M23 MaxSearchValue 255
keylset MX_24_20_M23 ExpectedClientConnections 50
keylset MX_24_20_M23 Source {Eth}
keylset MX_24_20_M23 Destination {Wifi2_23_1CLI}

#MX_24_20_M15 Options
keylset MX_24_20_M15 Test unicast_max_client_capacity
keylset MX_24_20_M15 FrameSizeList {512}
keylset MX_24_20_M15 ILoadList {10}
keylset MX_24_20_M15 MaxSearchValue 255
keylset MX_24_20_M15 ExpectedClientConnections 50
keylset MX_24_20_M15 Source {Eth}
keylset MX_24_20_M15 Destination {Wifi2_15_1CLI}

#MX_24_20_M15 Options
keylset MX_24_20_M7 Test unicast_max_client_capacity
keylset MX_24_20_M7 FrameSizeList {512}
keylset MX_24_20_M7 ILoadList {10}
keylset MX_24_20_M7 MaxSearchValue 255
keylset MX_24_20_M7 ExpectedClientConnections 50
keylset MX_24_20_M7 Source {Eth}
keylset MX_24_20_M7 Destination {Wifi2_7_1CLI}


#MX_5_40_M31 Options
keylset MX_5_40_M31 Test unicast_max_client_capacity
keylset MX_5_40_M31 FrameSizeList {512}
keylset MX_5_40_M31 ILoadList {10}
keylset MX_5_40_M31 MaxSearchValue 255
keylset MX_5_40_M31 ExpectedClientConnections 50
keylset MX_5_40_M31 Source {Eth}
keylset MX_5_40_M31 Destination {Wifi5_40_31_1CLI}

#MX_5_40_M23 Options
keylset MX_5_40_M23 Test unicast_max_client_capacity
keylset MX_5_40_M23 FrameSizeList {512}
keylset MX_5_40_M23 ILoadList {10}
keylset MX_5_40_M23 MaxSearchValue 255
keylset MX_5_40_M23 ExpectedClientConnections 50
keylset MX_5_40_M23 Source {Eth}
keylset MX_5_40_M23 Destination {Wifi5_40_23_1CLI}

#MX_5_40_M15 Options
keylset MX_5_40_M15 Test unicast_max_client_capacity
keylset MX_5_40_M15 FrameSizeList {512}
keylset MX_5_40_M15 ILoadList {10}
keylset MX_5_40_M15 MaxSearchValue 255
keylset MX_5_40_M15 ExpectedClientConnections 50
keylset MX_5_40_M15 Source {Eth}
keylset MX_5_40_M15 Destination {Wifi5_40_15_1CLI}

#MX_5_40_M15 Options
keylset MX_5_40_M7 Test unicast_max_client_capacity
keylset MX_5_40_M7 FrameSizeList {512}
keylset MX_5_40_M7 ILoadList {10}
keylset MX_5_40_M7 MaxSearchValue 255
keylset MX_5_40_M7 ExpectedClientConnections 50
keylset MX_5_40_M7 Source {Eth}
keylset MX_5_40_M7 Destination {Wifi5_40_7_1CLI}


#MX_5_80_S4_M9 Options
keylset MX_5_80_S4_M9 Test unicast_max_client_capacity
keylset MX_5_80_S4_M9 FrameSizeList {512}
keylset MX_5_80_S4_M9 ILoadList {10}
keylset MX_5_80_S4_M9 MaxSearchValue 255
keylset MX_5_80_S4_M9 ExpectedClientConnections 50
keylset MX_5_80_S4_M9 Source {Eth}
keylset MX_5_80_S4_M9 Destination {Wifi5_AC_SP4_9_1CLI}

#MX_5_80_S3_M9 Options
keylset MX_5_80_S3_M9 Test unicast_max_client_capacity
keylset MX_5_80_S3_M9 FrameSizeList {512}
keylset MX_5_80_S3_M9 ILoadList {10}
keylset MX_5_80_S3_M9 MaxSearchValue 255
keylset MX_5_80_S3_M9 ExpectedClientConnections 50
keylset MX_5_80_S3_M9 Source {Eth}
keylset MX_5_80_S3_M9 Destination {Wifi5_AC_SP3_9_1CLI}

#MX_5_80_S2_M9 Options
keylset MX_5_80_S2_M9 Test unicast_max_client_capacity
keylset MX_5_80_S2_M9 FrameSizeList {512}
keylset MX_5_80_S2_M9 ILoadList {10}
keylset MX_5_80_S2_M9 MaxSearchValue 255
keylset MX_5_80_S2_M9 ExpectedClientConnections 50
keylset MX_5_80_S2_M9 Source {Eth}
keylset MX_5_80_S2_M9 Destination {Wifi5_AC_SP2_9_1CLI}

#MX_5_80_S3_M9 Options
keylset MX_5_80_S1_M9 Test unicast_max_client_capacity
keylset MX_5_80_S1_M9 FrameSizeList {512}
keylset MX_5_80_S1_M9 ILoadList {10}
keylset MX_5_80_S1_M9 MaxSearchValue 255
keylset MX_5_80_S1_M9 ExpectedClientConnections 50
keylset MX_5_80_S1_M9 Source {Eth}
keylset MX_5_80_S1_M9 Destination {Wifi5_AC_SP1_9_1CLI}

#Port list for port specific options
keylset global_config Ports {generic_dut_0 generic_dut_2 generic_dut_5}

#Generic Dut Definitions

#Generic Dut - generic_dut_0
keylset generic_dut_0 used True
keylset generic_dut_0 Vendor generic
keylset generic_dut_0 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_0 APSWVersion $VENDORFW
keylset generic_dut_0 APModel $VENDORMODEL
keylset generic_dut_0 Interface.802_3.BindStatus True
keylset generic_dut_0 Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_0 Interface.802_3.EthernetSpeed 100
keylset generic_dut_0 Interface.802_3.Duplex full
keylset generic_dut_0 Interface.802_3.Autonegotiation on
# 7.3 Update:
keylset generic_dut_0 Interface.802_3.HighPerformance off
keylset generic_dut_0 Interface.802_3.InterfaceType 802.3
keylset generic_dut_0 Interface.802_3.EnableRxAttenuation on
keylset generic_dut_0 Interface.802_3.SecondaryChannelPlacement defer
keylset generic_dut_0 WLANSwitchModel $WLANSwitchModel


#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_2 APSWVersion $VENDORFW
keylset generic_dut_2 APModel $VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
# 7.3 Update:
keylset generic_dut_2 Interface.802_11ac.HighPerformance off
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11n
keylset generic_dut_2 Interface.802_11ac.EnableRxAttenuation $ATTN24
keylset generic_dut_2 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_2 WLANSwitchModel $WLANSwitchModel

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion $WLANSwitchFW
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
# 7.3 Update:
keylset generic_dut_5 Interface.802_11ac.HighPerformance off
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.EnableRxAttenuation $ATTN5
keylset generic_dut_5 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_5 WLANSwitchModel $WLANSwitchModel




#Auto-generated from: MCD
#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

