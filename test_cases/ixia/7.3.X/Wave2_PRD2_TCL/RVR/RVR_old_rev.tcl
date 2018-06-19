
#Auto-generated from: RVR.wml
#At: 2016-07-20 11:07:51.058000
#Altered By Nagendra Reddy ( nagendra.patil@charter.com )
#Date : 20th July 2016
source $ipv6_defaults_tcl
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {Eth}
keylset global_config Destination {WiFi5_40_M23 WiFi2_20_M15 WiFi5_40_M31 WiFi5_40_M15 WiFi2_20_M23 WiFi2_20_M31 WiFi5_80_S4_M9 WiFi5_80_S2_M9 WiFi5_80_S3_M9}

#Traffics Global Options

keylset global_config PayloadData None

#TestParameters Global Options

keylset global_config TrialDuration 15
keylset global_config TestDurationSec 15
keylset global_config RandomSeed 1142638611
keylset global_config Ipv6PrefFlag 1

#Connection Global Options

#LogsAndResultsInfo Global Options

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

#Wireless Group Count
keylset global_config WirelessGroupCount 8

#Tests - you may define more than one in a TCL list.
#RVR_24_20_M15 RVR_24_20_M23 RVR_5_20_M15 RVR_5_40_M23 RVR_5_80_M9
keylset global_config TestList ${test_list}

#Group Eth
keylset Eth GroupType 802.3
keylset Eth Dut generic_dut_Eth

#Group Eth - Client Options
keylset Eth Hops -1
keylset Eth Dhcp Enable
keylset Eth Dhcpv6 Enable
keylset Eth Ipv6Flag 1
keylset Eth GratuitousArp True
keylset Eth MacAddress None
keylset Eth Gateway 192.168.1.1
keylset Eth phyInterface 802.11ag
keylset Eth MgmtPhyRate 24
keylset Eth Qos Disable
keylset Eth BaseIp 192.168.1.11

#Group Eth - Security Options
keylset Eth Method {None}
keylset Eth EnableValidateCertificate off

#Group Ethv6
keylset Ethv6 GroupType 802.3
keylset Ethv6 Dut generic_dut_Eth

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

#Group WiFi2
keylset WiFi2 GroupType 802.11ac
keylset WiFi2 Dut generic_dut_24

#Group WiFi2 - Client Options
keylset WiFi2 NumSpatialStreams 2
keylset WiFi2 Ssid $SSID_24
keylset WiFi2 Hops -1
keylset WiFi2 Dhcp Enable
keylset WiFi2 GratuitousArp True
keylset Wifi2 MacAddress 00:00:01:00:00:01
keylset Wifi2 MacAddressIncr 1
keylset WiFi2 PlcpConfiguration mixed
keylset WiFi2 ChannelBandwidth 20
keylset WiFi2 EnableAMSDUrxaggregation False
keylset WiFi2 EnableAMPDUaggregation True
keylset WiFi2 EnableAMSDUtxaggregation False
keylset WiFi2 ChannelModel Bypass
keylset WiFi2 DataMcsIndex 15
keylset WiFi2 KeepAlive True
keylset WiFi2 EnableLDPC False
keylset WiFi2 NumTxAntennas $Num24Antennas
keylset WiFi2 GuardInterval standard
keylset WiFi2 Gateway 192.168.1.1
keylset WiFi2 phyInterface 802.11n
keylset WiFi2 MgmtPhyRate 24
keylset WiFi2 Qos Enable
keylset WiFi2 BaseIp 192.168.1.10
keylset WiFi2 Channel $Channel24
keylset WiFi2 EnableFollowApBandwidth 1

#Group WiFi2 - Security Options
keylset WiFi2 Method {WPA2-PSK}
keylset WiFi2 EnableValidateCertificate off
keylset WiFi2 PskAscii charter123

ipv6_interface WiFi2 24



#Group WiFi5
keylset WiFi5 GroupType 802.11ac
keylset WiFi5 Dut generic_dut_5

#Group WiFi5 - Client Options
keylset WiFi5 NumSpatialStreams 2
keylset WiFi5 Ssid $SSID_5
keylset WiFi5 Dhcp Enable
keylset WiFi5 GratuitousArp True
keylset WiFi5 MacAddress 00:00:01:00:00:01
keylset Wifi5 MacAddressIncr 1
keylset WiFi5 PlcpConfiguration mixed
keylset WiFi5 ChannelBandwidth 40
keylset WiFi5 EnableAMSDUrxaggregation False
keylset WiFi5 EnableAMPDUaggregation True
keylset WiFi5 EnableAMSDUtxaggregation False
keylset WiFi5 ChannelModel Bypass
keylset WiFi5 DataMcsIndex 15
keylset WiFi5 KeepAlive True
keylset WiFi5 EnableLDPC False
keylset WiFi5 GuardInterval short
keylset WiFi5 Gateway 192.168.1.1
keylset WiFi5 NumTxAntennas $Num5Antennas
keylset WiFi5 phyInterface 802.11n
keylset WiFi5 MgmtPhyRate 24
keylset WiFi5 Qos Enable
keylset WiFi5 BaseIp 192.168.1.12
keylset WiFi5 Channel $Channel5

#Group WiFi5 - Security Options
keylset WiFi5 Method {WPA2-PSK}
keylset WiFi5 EnableValidateCertificate off
keylset WiFi5 PskAscii charter123
keylset WiFi5 Dhcpv6 Enable
keylset WiFi5 Ipv6Flag 1

ipv6_interface WiFi5 5

set WiFi2_20_M7 ${WiFi2}
keylset WiFi2_20_M7 DataMcsIndex 7

set WiFi2_20_M15 ${WiFi2}
keylset WiFi2_20_M15 DataMcsIndex 15

set WiFi2_20_M23 ${WiFi2}
keylset WiFi2_20_M23 DataMcsIndex 23

set WiFi2_20_M31 ${WiFi2}
keylset WiFi2_20_M31 DataMcsIndex 31

set WiFi5_40_M7 ${WiFi5} 
keylset WiFi5_40_M7 DataMcsIndex 7

set WiFi5_40_M15 ${WiFi5} 
keylset WiFi5_40_M15 DataMcsIndex 15

set WiFi5_40_M23 ${WiFi5} 
keylset WiFi5_40_M23 DataMcsIndex 23

set WiFi5_40_M31 ${WiFi5} 
keylset WiFi5_40_M31 DataMcsIndex 31

set WiFi5_80_S1_M9 ${WiFi5}
keylset WiFi5_80_S1_M9 ChannelBandwidth 80
keylset WiFi5_80_S1_M9 phyInterface 802.11ac
keylset WiFi5_80_S1_M9 PlcpConfiguration vht_mixed
keylset WiFi5_80_S1_M9 VhtDataMcs 9
keylset WiFi5_80_S1_M9 USManagementMcs 11
keylset WiFi5_80_S1_M9 USDataMcs 9
keylset WiFi5_80_S1_M9 NumSpatialStreams 1

set WiFi5_80_S2_M9 ${WiFi5}
keylset WiFi5_80_S2_M9 ChannelBandwidth 80
keylset WiFi5_80_S2_M9 phyInterface 802.11ac
keylset WiFi5_80_S2_M9 PlcpConfiguration vht_mixed
keylset WiFi5_80_S2_M9 VhtDataMcs 9
keylset WiFi5_80_S2_M9 USManagementMcs 11
keylset WiFi5_80_S2_M9 USDataMcs 9
keylset WiFi5_80_S2_M9 NumSpatialStreams 2

set WiFi5_80_S3_M9 ${WiFi5}
keylset WiFi5_80_S3_M9 ChannelBandwidth 80
keylset WiFi5_80_S3_M9 phyInterface 802.11ac
keylset WiFi5_80_S3_M9 PlcpConfiguration vht_mixed
keylset WiFi5_80_S3_M9 VhtDataMcs 9
keylset WiFi5_80_S3_M9 USManagementMcs 11
keylset WiFi5_80_S3_M9 USDataMcs 9
keylset WiFi5_80_S3_M9 NumSpatialStreams 3

set WiFi5_80_S4_M9 ${WiFi5}
keylset WiFi5_80_S4_M9 ChannelBandwidth 80
keylset WiFi5_80_S4_M9 phyInterface 802.11ac
keylset WiFi5_80_S4_M9 PlcpConfiguration vht_mixed
keylset WiFi5_80_S4_M9 VhtDataMcs 9
keylset WiFi5_80_S4_M9 USManagementMcs 11
keylset WiFi5_80_S4_M9 USDataMcs 9
keylset WiFi5_80_S4_M9 NumSpatialStreams 4


#rate_vs_range_s2 Options
keylset rate_vs_range_s2 Test rate_vs_range_s2
keylset rate_vs_range_s2 ExternalAttenuation 50
keylset rate_vs_range_s2 InitialPowerLevel 0
keylset rate_vs_range_s2 FinalPowerLevel -50
keylset rate_vs_range_s2 RefPowerList {-6 -18 -42}
keylset rate_vs_range_s2 RefRateList {3.0 3.0 3.0}
keylset rate_vs_range_s2 IncrementPowerLevel 1

# RVR_24_20_M7
set RVR_24_20_M7 ${rate_vs_range_s2}
keylset RVR_24_20_M7 Source {Eth}
keylset RVR_24_20_M7 Destination {WiFi2_20_M7}
keylset RVR_24_20_M7 FrameSizeList {1518}
keylset RVR_24_20_M7 ILoadList {10000.0}

# RVR_24_20_M15
set RVR_24_20_M15 ${rate_vs_range_s2}
keylset RVR_24_20_M15 Source {Eth}
keylset RVR_24_20_M15 Destination {WiFi2_20_M15}
keylset RVR_24_20_M15 FrameSizeList {1518}
keylset RVR_24_20_M15 ILoadList {10000.0}

# RVR_24_20_M23
set RVR_24_20_M23 ${rate_vs_range_s2}
keylset RVR_24_20_M23 Source {Eth}
keylset RVR_24_20_M23 Destination {WiFi2_20_M23}
keylset RVR_24_20_M23 FrameSizeList {1518}
keylset RVR_24_20_M23 ILoadList {15000.0}

# RVR_24_20_M31
set RVR_24_20_M31 ${rate_vs_range_s2}
keylset RVR_24_20_M31 Source {Eth}
keylset RVR_24_20_M31 Destination {WiFi2_20_M31}
keylset RVR_24_20_M31 FrameSizeList {1518}
keylset RVR_24_20_M31 ILoadList {19000.0}


# RVR_5_40_M7
set RVR_5_40_M7 ${rate_vs_range_s2}
keylset RVR_5_40_M7 Source {Ethv6}
keylset RVR_5_40_M7 Destination {WiFi5_40_M7}
keylset RVR_5_40_M7 FrameSizeList {1518}
keylset RVR_5_40_M7 ILoadList {21000.0}

# RVR_5_40_M15
set RVR_5_40_M15 ${rate_vs_range_s2}
keylset RVR_5_40_M15 Source {Ethv6}
keylset RVR_5_40_M15 Destination {WiFi5_40_M15}
keylset RVR_5_40_M15 FrameSizeList {1518}
keylset RVR_5_40_M15 ILoadList {21000.0}

# RVR_5_40_M23
set RVR_5_40_M23 ${rate_vs_range_s2}
keylset RVR_5_40_M23 Source {Ethv6}
keylset RVR_5_40_M23 Destination {WiFi5_40_M23}
keylset RVR_5_40_M23 FrameSizeList {1518}
keylset RVR_5_40_M23 ILoadList {30000.0}

# RVR_5_40_M31
set RVR_5_40_M31 ${rate_vs_range_s2}
keylset RVR_5_40_M31 Source {Ethv6}
keylset RVR_5_40_M31 Destination {WiFi5_40_M31}
keylset RVR_5_40_M31 FrameSizeList {1518}
keylset RVR_5_40_M31 ILoadList {37000.0}

# RVR_5_80_S1_M9
set RVR_5_80_S1_M9 ${rate_vs_range_s2}
keylset RVR_5_80_S1_M9 Source {Ethv6}
keylset RVR_5_80_S1_M9 Destination {WiFi5_80_S1_M9}
keylset RVR_5_80_S1_M9 FrameSizeList {1518}
keylset RVR_5_80_S1_M9 ILoadList {57000.0}

# RVR_5_80_S2_M9
set RVR_5_80_S2_M9 ${rate_vs_range_s2}
keylset RVR_5_80_S2_M9 Source {Ethv6}
keylset RVR_5_80_S2_M9 Destination {WiFi5_80_S2_M9}
keylset RVR_5_80_S2_M9 FrameSizeList {1518}
keylset RVR_5_80_S2_M9 ILoadList {57000.0}

# RVR_5_80_S3_M9
set RVR_5_80_S3_M9 ${rate_vs_range_s2}
keylset RVR_5_80_S3_M9 Source {Ethv6}
keylset RVR_5_80_S3_M9 Destination {WiFi5_80_S3_M9}
keylset RVR_5_80_S3_M9 FrameSizeList {1518}
keylset RVR_5_80_S3_M9 ILoadList {78000.0}

# RVR_5_80_S4_M9
set RVR_5_80_S4_M9 ${rate_vs_range_s2}
keylset RVR_5_80_S4_M9 Source {Ethv6}
keylset RVR_5_80_S4_M9 Destination {WiFi5_80_S4_M9}
keylset RVR_5_80_S4_M9 FrameSizeList {1518}
keylset RVR_5_80_S4_M9 ILoadList {96000.0}

#Port list for port specific options
keylset global_config Ports {generic_dut_5 generic_dut_Eth generic_dut_24 }

#Generic Dut Definitions


#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion $VENDORMODEL
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 Interface.802_11ac.ChannelBandwidth 80
keylset generic_dut_5 Interface.802_11ac.ClientBackoff True
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.EnableRxAttenuation off
keylset generic_dut_5 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_5 Interface.802_11ac.Channel $Channel5
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel UID

#Generic Dut - generic_dut_Eth
keylset generic_dut_Eth used True
keylset generic_dut_Eth Vendor generic
keylset generic_dut_Eth WLANSwitchSWVersion $VENDORMODEL
keylset generic_dut_Eth APSWVersion $VENDORFW
keylset generic_dut_Eth APModel $VENDORMODEL
keylset generic_dut_Eth Interface.802_3.BindStatus True
keylset generic_dut_Eth Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_Eth Interface.802_3.EthernetSpeed 1000
keylset generic_dut_Eth Interface.802_3.Duplex full
keylset generic_dut_Eth Interface.802_3.Autonegotiation on
keylset generic_dut_Eth Interface.802_3.ClientBackoff True
keylset generic_dut_Eth Interface.802_3.InterfaceType 802.3
keylset generic_dut_Eth Interface.802_3.EnableRxAttenuation on
keylset generic_dut_Eth Interface.802_3.SecondaryChannelPlacement defer
keylset generic_dut_Eth WLANSwitchModel UID
keylset generic_dut_Eth Interface.802_3.EnableFollowApBandwidth 1

#Generic Dut - generic_dut_24
keylset generic_dut_24 used True
keylset generic_dut_24 Vendor generic
keylset generic_dut_24 WLANSwitchSWVersion $VENDORMODEL
keylset generic_dut_24 APSWVersion $VENDORFW
keylset generic_dut_24 APModel $VENDORMODEL
keylset generic_dut_24 Interface.802_11ac.BindStatus True
keylset generic_dut_24 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_24 Interface.802_11ac.ClientBackoff True
keylset generic_dut_24 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_24 Interface.802_11ac.EnableRxAttenuation on
keylset generic_dut_24 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_24 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_24 Interface.802_11ac.Channel $Channel24
keylset generic_dut_24 WLANSwitchModel UID
keylset generic_dut_24 Interface.802_11ac.EnableFollowApBandwidth 1
# keylset generic_dut_24 Interface.802_11ac.ChannelBandwidth 20



#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

