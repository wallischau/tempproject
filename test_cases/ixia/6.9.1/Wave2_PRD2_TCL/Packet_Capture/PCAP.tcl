
#Auto-generated from: pcap_test.wml
#At: 2016-11-22 17:13:59.038000
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Direction {Unidirectional}
keylset global_config Source {WiFi2 WiFi5}
keylset global_config Destination {Eth}

#Traffics Global Options

keylset global_config PayloadData None

#TestParameters Global Options

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

#Learning Global Options

keylset global_config TrialDuration 1
keylset global_config TestDurationSec 1
keylset global_config RandomSeed $random_int

#Connection Global Options


#LogsAndResultsInfo Global Options

keylset global_config dbusername veriwave
# keylset global_config TestNameDir True

# keylset global_config TimeStampDir False
keylset global_config GeneratePdfReport False
keylset global_config dbpassword veriwave
keylset global_config dbname veriwave

#Learning Global Options


#Mapping Options
keylset global_config FlowType UDP

#Wireless Group Count
keylset global_config WirelessGroupCount 2

#Tests - you may define more than one in a TCL list.
keylset global_config TestList ${test_list}

#Group Eth
keylset Eth GroupType 802.3
keylset Eth Dut generic_dut_eth

#Group Eth - Client Options
keylset Eth Hops -1
keylset Eth Dhcp Enable
keylset Eth GratuitousArp True
keylset Eth MacAddress None
keylset Eth Gateway 192.168.1.1
keylset Eth phyInterface 802.11ag
keylset Eth MgmtPhyRate 24
keylset Eth Qos Disable
keylset Eth IncrIp 1
keylset Eth BaseIp 192.168.1.10

#Group Eth - Security Options
keylset Eth Method {None}
keylset Eth EnableValidateCertificate off

#Group WiFi2
keylset WiFi2 GroupType 802.11ac
keylset WiFi2 Dut generic_dut_24

#Group WiFi2 - Client Options
keylset WiFi2 Ssid $SSID_24
keylset WiFi2 Hops 0
keylset WiFi2 Dhcp Enable
keylset WiFi2 GratuitousArp True
keylset WiFi2 MacAddress None
keylset WiFi2 PlcpConfiguration mixed
keylset WiFi2 ChannelBandwidth 20
keylset WiFi2 EnableAMSDUrxaggregation True
keylset WiFi2 EnableAMPDUaggregation True
keylset WiFi2 EnableAMSDUtxaggregation False
keylset WiFi2 ChannelModel Bypass
keylset WiFi2 DataMcsIndex 23
keylset WiFi2 EnableLDPC False
keylset WiFi2 GuardInterval standard
keylset WiFi2 Gateway 192.168.1.1
keylset WiFi2 NumTxAntennas $Num24Antennas
keylset WiFi2 phyInterface 802.11n
keylset WiFi2 MgmtPhyRate 24
keylset WiFi2 Qos Enable
keylset WiFi2 IncrIp 1
keylset WiFi2 BaseIp 192.168.1.11
keylset WiFi2 Channel 6

#Group WiFi2 - Security Options
keylset WiFi2 Method {WPA2-PSK}
keylset WiFi2 EnableValidateCertificate off
keylset WiFi2 PskAscii charter123

#Group WiFi5
keylset WiFi5 GroupType 802.11ac
keylset WiFi5 Dut generic_dut_5

#Group WiFi5 - Client Options
keylset WiFi5 Ssid $SSID_5

#802.11ac clients configuration
keylset WiFi5 NumSpatialStreams 3
keylset WiFi5 PlcpConfiguration vht_mixed
keylset WiFi5 EnableAMSDUrxaggregation True
keylset WiFi5 SigBandwidth 80
keylset WiFi5 EnableAMPDUaggregation True
keylset WiFi5 DuplicateControlFrames False
keylset WiFi5 MimoMode mu-mimo
keylset WiFi5 EnableAMSDUtxaggregation False
keylset WiFi5 USManagementMcs 11
keylset WiFi5 ChannelModel Bypass
keylset WiFi5 GuardInterval standard
keylset WiFi5 VhtDataMcs 9
keylset WiFi5 EnableLDPC False
keylset WiFi5 USDataMcs 9
keylset WiFi5 EnableMuSuMimo False
keylset WiFi5 Dhcp Enable
keylset WiFi5 GratuitousArp True
keylset WiFi5 MacAddress None
keylset WiFi5 Gateway 192.168.1.1
keylset WiFi5 NumTxAntennas $Num5Antennas
keylset WiFi5 phyInterface 802.11ac
keylset WiFi5 MgmtPhyRate 24
keylset WiFi5 Qos Enable
keylset WiFi5 IncrIp 1
keylset WiFi5 BaseIp 192.168.1.12
keylset WiFi5 Channel 149

#Group WiFi5 - Security Options
keylset WiFi5 Method {WPA2-PSK}
keylset WiFi5 EnableValidateCertificate off
keylset WiFi5 PskAscii charter123

#PCAP_TEST Options
keylset PCAP_TEST Test unicast_packet_loss
keylset PCAP_TEST Frame Custom
keylset PCAP_TEST FrameSizeList {1518}
keylset PCAP_TEST ILoadList {70000}
keylset PCAP_TEST AcceptableFrameLossRate 0

#Port list for port specific options
keylset global_config Ports {generic_dut_24 generic_dut_5 generic_dut_eth }

#Generic Dut Definitions

#Generic Dut - generic_dut_24
keylset generic_dut_24 used True
keylset generic_dut_24 Vendor $VENDORNAME
keylset generic_dut_24 WLANSwitchSWVersion NONE
keylset generic_dut_24 APSWVersion $VENDORFW
keylset generic_dut_24 APModel $VENDORMODEL
keylset generic_dut_24 Interface.802_11ac.BindStatus True
keylset generic_dut_24 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_24 Interface.802_11ac.ChannelBandwidth 20
# 7.3 Update:
keylset generic_dut_24 Interface.802_11ac.HighPerformance on
keylset generic_dut_24 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_24 Interface.802_11ac.EnableRxAttenuation off
keylset generic_dut_24 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_24 Interface.802_11ac.CaptureMode normal
keylset generic_dut_24 Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_24 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_24 Interface.802_11ac.VkIndex 0
keylset generic_dut_24 Interface.802_11ac.Channel 6
keylset generic_dut_24 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_24 WLANSwitchModel NONE

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor $VENDORNAME
keylset generic_dut_5 WLANSwitchSWVersion NONE
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 Interface.802_11ac.ChannelBandwidth 20
# 7.3 Update:
keylset generic_dut_5 Interface.802_11ac.HighPerformance on
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.EnableRxAttenuation off
keylset generic_dut_5 Interface.802_11ac.SecondaryChannelPlacement defer
keylset generic_dut_5 Interface.802_11ac.CaptureMode normal
keylset generic_dut_5 Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_5 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_5 Interface.802_11ac.VkIndex 0
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel NONE



#Generic Dut - generic_dut_eth
keylset generic_dut_eth used True
keylset generic_dut_eth Vendor $VENDORNAME
keylset generic_dut_eth WLANSwitchSWVersion NONE
keylset generic_dut_eth APSWVersion $VENDORFW
keylset generic_dut_eth APModel $VENDORMODEL
keylset generic_dut_eth Interface.802_3.BindStatus True
keylset generic_dut_eth Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_eth Interface.802_3.EthernetSpeed 1000
keylset generic_dut_eth Interface.802_3.Duplex full
keylset generic_dut_eth Interface.802_3.Autonegotiation on
# 7.3 Update:
keylset generic_dut_eth Interface.802_3.HighPerformance on
keylset generic_dut_eth Interface.802_3.InterfaceType 802.3
keylset generic_dut_eth Interface.802_3.EnableRxAttenuation on
keylset generic_dut_eth Interface.802_3.SecondaryChannelPlacement defer
keylset generic_dut_eth Interface.802_3.CaptureMode normal
keylset generic_dut_eth Interface.802_3.PartCode 2A01100380000000
keylset generic_dut_eth Interface.802_3.VkIndex 0
keylset generic_dut_eth Interface.802_3.IncludeRFLogging off
keylset generic_dut_eth WLANSwitchModel NONE



#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

