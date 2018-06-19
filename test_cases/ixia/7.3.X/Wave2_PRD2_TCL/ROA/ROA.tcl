
#Auto-generated from: /mnt/wifi_vol/Testing_Area/Automation/Script_Development/ATF/Reuse of Airtime/Case A/20171113-091101/test_wimix_script.wml
#At: 2018-02-06 14:13:48.436641
keylset global_config ChassisName {$chassis_ip}

#Traffics Global Options

keylset global_config Content None
keylset global_config UserPattern None
keylset global_config PayloadData None
keylset global_config DestinationPort None
keylset global_config SourcePort None

#Learning Global Options

keylset global_config ArpTimeout 10
keylset global_config AgingTime 0
keylset global_config ArpNumRetries 10
keylset global_config ArpRate 10
keylset global_config ClientLearningTime 2

#IgmpJoinInfo Global Options


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
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir

#LogsAndResultsInfo Global Options

keylset global_config CustomTitle None
keylset global_config dbserverip 127.0.0.1

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 60
keylset global_config wimixResultSampleVal 1
keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 1
keylset global_config TestDurationMin 1

#Tests - you may define more than one in a TCL list.
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 1

#Test List Starts here

keylset test_case Test wimix_script
keylset test_case contAdminControlFlag 1
keylset test_case continueFlag 0
keylset test_case loadMode 0
keylset test_case loadSweepEnd 20
keylset test_case loadSweepStart 10
keylset test_case loadSweepStep 1
keylset test_case loadVal 10
keylset test_case staggerStart 0
keylset test_case staggerStartInt 1
keylset test_case testProfile MixedClients
keylset test_case testProfileImage images/wimix_new.png
keylset test_case totalClientPer 60.0
keylset test_case totalLoadPer 60.0
keylset test_case wimixMode Client
keylset test_case wimixTestName 802.11b/g/n/ac Mixed Clients

# ROA_24_20_DROP_11g_24_20
set ROA_24_20_DROP_11g_24_20 ${test_case}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.Percentage 20.0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.TrafficType {11g}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.delay 0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.endTime 30
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.Percentage 20.0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.TrafficType {11n_M15}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.delay 0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.endTime END
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.Percentage 20.0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.TrafficType {11n_M23}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.delay 0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.endTime END
keylset ROA_24_20_DROP_11g_24_20 Destination {11n_24_20_M15 11g_24_20}
keylset ROA_24_20_DROP_11g_24_20 Source {11n_24_20_M23}

# ROA_24_20_DROP_11n_24_20_M15
set ROA_24_20_DROP_11n_24_20_M15 ${ROA_24_20_DROP_11g_24_20}
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11g_24_20.endTime END
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M15.endTime 30

# ROA_24_20_DROP_11n_24_20_M23
set ROA_24_20_DROP_11n_24_20_M23 ${ROA_24_20_DROP_11g_24_20}
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11g_24_20.endTime END
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M23.endTime 30

# ROA_5_80_DROP_11a_5_20
set ROA_5_80_DROP_11a_5_20 ${test_case}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.Percentage 20.0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.TrafficType {11a}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.delay 0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.endTime 30
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.Percentage 20.0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.TrafficType {11ac_5_80}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.delay 0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.endTime END
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.Percentage 20.0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.TrafficType {11n_5_40}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.delay 0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.endTime END
keylset ROA_5_80_DROP_11a_5_20 Destination {11n_5_40_M23 11ac_5_80_S3}
keylset ROA_5_80_DROP_11a_5_20 Source {11a_5_20}

# ROA_5_80_DROP_11ac_5_80_S3
set ROA_5_80_DROP_11ac_5_80_S3 ${ROA_5_80_DROP_11a_5_20}
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11a_5_20.endTime END
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11ac_5_80_S3.endTime 30

# ROA_5_80_DROP_11n_5_40_M23
set ROA_5_80_DROP_11n_5_40_M23 ${ROA_5_80_DROP_11a_5_20}
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11a_5_20.endTime END
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11n_5_40_M23.endTime 30


#Test List ends here

#Traffic Profiles

# 11a
keylset 11a BurstdataburstDur 5
keylset 11a BurstdataburstRate 100
keylset 11a Burstdataibg 5
keylset 11a Layer2qosadControl 0
keylset 11a Layer2qosclassifier None
keylset 11a Layer2qosenable 0
keylset 11a Layer2qosethUp 0
keylset 11a Layer2qosflDir 1
keylset 11a Layer2qosmDataRate 10240
keylset 11a Layer2qosminPhyRate 1
keylset 11a Layer2qosmsduSize 128
keylset 11a Layer2qossurBand 100
keylset 11a Layer2qostclasIe 0
keylset 11a Layer2qostclasUp 0
keylset 11a Layer2qostid 0
keylset 11a Layer2qoswlanUp 0
keylset 11a Layer3qosdscp 0
keylset 11a Layer3qosenable 0
keylset 11a Layer4to7DestPort 34158
keylset 11a Layer4to7SrcPort 24158
keylset 11a MulticastaddripAddress 224.1.1.1
keylset 11a MulticastaddripMode 1
keylset 11a MulticastaddripV6Address ff00::01
keylset 11a MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11a MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11a MulticastaddrsrcIpMode 1
keylset 11a SlaJitter 500
keylset 11a SlaLatency 10000
keylset 11a SlaPacketLoss 10
keylset 11a WimixtrafficDirection downlink
keylset 11a WimixtrafficEnableIpv6 0
keylset 11a WimixtrafficFramesize 1500
keylset 11a WimixtrafficIntendedrate 10000
keylset 11a WimixtrafficNumFrames 100000000
keylset 11a WimixtrafficPhyrate 54
keylset 11a WimixtrafficRateBehaviour 0
keylset 11a WimixtrafficRateMode 0
keylset 11a WimixtrafficServer server1
keylset 11a WimixtrafficStreamType 0
keylset 11a WimixtrafficTtl 64
keylset 11a WimixtrafficType UDP
keylset 11a WimixtrafficipProtocolNum Auto
keylset 11a WimixtrafficpayData None
keylset 11a WimixtrafficpayPattern 0
keylset 11a WimixtraffictcpWinSize 65535

# 11ac_5_80
set 11ac_5_80 ${11a}
keylset 11ac_5_80 Layer4to7DestPort 33686
keylset 11ac_5_80 Layer4to7SrcPort 23868
keylset 11ac_5_80 WimixtrafficIntendedrate 200000

# 11g
set 11g ${11a}
# Nothin to do. These are the same

# 11n_5_40
set 11n_5_40 ${11a}
keylset 11n_5_40 Layer4to7DestPort 33153
keylset 11n_5_40 Layer4to7SrcPort 23153
keylset 11n_5_40 WimixtrafficIntendedrate 80000

# 11n_M15
set 11n_M15 ${11a}
keylset 11n_M15 Layer4to7DestPort 33868
keylset 11n_M15 Layer4to7SrcPort 23868
keylset 11n_M15 WimixtrafficIntendedrate 30000

# 11n_M23
set 11n_M23 ${11a}
keylset 11n_M23 Layer4to7DestPort 33153
keylset 11n_M23 Layer4to7SrcPort 23153
keylset 11n_M23 WimixtrafficIntendedrate 40000

# 11a_5_20
keylset 11a_5_20 BaseIp 192.168.1.10
keylset 11a_5_20 Bssid 08:6a:0a:d2:fa:7e
keylset 11a_5_20 Dhcp Enable
keylset 11a_5_20 DistId 3
keylset 11a_5_20 Dut generic_dut_5
keylset 11a_5_20 EnableIpv6 0
keylset 11a_5_20 Gateway 192.168.1.1
keylset 11a_5_20 GratuitousArp True
keylset 11a_5_20 GroupType 802.11ac
keylset 11a_5_20 Hops -1
keylset 11a_5_20 IncrIp Normal
keylset 11a_5_20 KeepAlive True
keylset 11a_5_20 ListenInt 10
keylset 11a_5_20 MacAddress None
keylset 11a_5_20 MacAddressIncr 1
keylset 11a_5_20 Method {WPA2-PSK}
keylset 11a_5_20 MgmtPhyRate 24
keylset 11a_5_20 NumTxAntennas $Num5Antennas
keylset 11a_5_20 PskAscii charter123
keylset 11a_5_20 Qos Enable
keylset 11a_5_20 RateAdapt 0
keylset 11a_5_20 SnrVal 40
keylset 11a_5_20 Ssid $SSID_5
keylset 11a_5_20 SubnetMask 255.255.0.0
keylset 11a_5_20 TransmitDeference 1
keylset 11a_5_20 UapsdSp 3
keylset 11a_5_20 Wlan80211eQoSAC 0
keylset 11a_5_20 phyInterface 802.11ag

# 11g_24_20
set 11g_24_20 ${11a_5_20}
keylset 11g_24_20 Bssid 08:6a:0a:d2:fa:7d
keylset 11g_24_20 Dut generic_dut_24
keylset 11g_24_20 NumTxAntennas $Num24Antennas
keylset 11g_24_20 Ssid $SSID_24

# 11ac_5_80_S3
keylset 11ac_5_80_S3 BaseIp 192.168.7.10
keylset 11ac_5_80_S3 Bssid 08:6a:0a:d2:fa:7e
keylset 11ac_5_80_S3 ChannelModel Bypass
keylset 11ac_5_80_S3 Dhcp Enable
keylset 11ac_5_80_S3 DistId 3
keylset 11ac_5_80_S3 Dut generic_dut_5
keylset 11ac_5_80_S3 EnableAMPDUaggregation 1
keylset 11ac_5_80_S3 EnableAMSDUaggregation 0
keylset 11ac_5_80_S3 EnableIpv6 0
keylset 11ac_5_80_S3 EnableLDPC False
keylset 11ac_5_80_S3 EnableMuSuMimo False
keylset 11ac_5_80_S3 Gateway 192.168.1.1
keylset 11ac_5_80_S3 GratuitousArp True
keylset 11ac_5_80_S3 GroupType 802.11ac
keylset 11ac_5_80_S3 GuardInterval short
keylset 11ac_5_80_S3 Hops 5
keylset 11ac_5_80_S3 IncrIp Normal
keylset 11ac_5_80_S3 KeepAlive True
keylset 11ac_5_80_S3 ListenInt 10
keylset 11ac_5_80_S3 MacAddress None
keylset 11ac_5_80_S3 MacAddressIncr 1
keylset 11ac_5_80_S3 Method {WPA2-PSK}
keylset 11ac_5_80_S3 MgmtPhyRate 24
keylset 11ac_5_80_S3 MimoMode mu-mimo
keylset 11ac_5_80_S3 NumSpatialStreams 3
keylset 11ac_5_80_S3 NumTxAntennas $Num5Antennas
keylset 11ac_5_80_S3 PlcpConfiguration vht_mixed
keylset 11ac_5_80_S3 PskAscii charter123
keylset 11ac_5_80_S3 Qos Enable
keylset 11ac_5_80_S3 RateAdapt 0
keylset 11ac_5_80_S3 SigBandwidth 80
keylset 11ac_5_80_S3 SnrVal 40
keylset 11ac_5_80_S3 Ssid $SSID_5
keylset 11ac_5_80_S3 SubnetMask 255.255.0.0
keylset 11ac_5_80_S3 TransmitDeference 1
keylset 11ac_5_80_S3 USDataMcs 7
keylset 11ac_5_80_S3 USManagementMcs 11
keylset 11ac_5_80_S3 UapsdSp 3
keylset 11ac_5_80_S3 VhtDataMcs 7
keylset 11ac_5_80_S3 Wlan80211eQoSAC 0
keylset 11ac_5_80_S3 phyInterface 802.11ac

# 11n_24_20_M15
keylset 11n_24_20_M15 BaseIp 192.168.5.10
keylset 11n_24_20_M15 Bssid 08:6a:0a:d2:fa:7d
keylset 11n_24_20_M15 ChannelBandwidth 20
keylset 11n_24_20_M15 ChannelModel Bypass
keylset 11n_24_20_M15 DataMcsIndex 15
keylset 11n_24_20_M15 Dhcp Enable
keylset 11n_24_20_M15 DistId 3
keylset 11n_24_20_M15 Dut generic_dut_24
keylset 11n_24_20_M15 EnableAMPDUaggregation 1
keylset 11n_24_20_M15 EnableAMSDUaggregation 0
keylset 11n_24_20_M15 EnableIpv6 0
keylset 11n_24_20_M15 EnableLDPC False
keylset 11n_24_20_M15 Gateway 192.168.1.1
keylset 11n_24_20_M15 GratuitousArp True
keylset 11n_24_20_M15 GroupType 802.11ac
keylset 11n_24_20_M15 GuardInterval standard
keylset 11n_24_20_M15 Hops 3
keylset 11n_24_20_M15 IncrIp Normal
keylset 11n_24_20_M15 KeepAlive True
keylset 11n_24_20_M15 ListenInt 10
keylset 11n_24_20_M15 MacAddress None
keylset 11n_24_20_M15 MacAddressIncr 1
keylset 11n_24_20_M15 Method {WPA2-PSK}
keylset 11n_24_20_M15 MgmtPhyRate 24
keylset 11n_24_20_M15 NumTxAntennas $Num24Antennas
keylset 11n_24_20_M15 PlcpConfiguration mixed
keylset 11n_24_20_M15 PskAscii charter123
keylset 11n_24_20_M15 Qos Enable
keylset 11n_24_20_M15 RateAdapt 0
keylset 11n_24_20_M15 SnrVal 40
keylset 11n_24_20_M15 Ssid $SSID_24
keylset 11n_24_20_M15 SubnetMask 255.255.0.0
keylset 11n_24_20_M15 TransmitDeference 1
keylset 11n_24_20_M15 UapsdSp 3
keylset 11n_24_20_M15 Wlan80211eQoSAC 0
keylset 11n_24_20_M15 phyInterface 802.11n

# 11n_24_20_M23
set 11n_24_20_M23 ${11n_24_20_M15}
keylset 11n_24_20_M23 BaseIp 192.168.7.10
keylset 11n_24_20_M23 DataMcsIndex 23
keylset 11n_24_20_M23 Hops 5
keylset 11n_24_20_M23 MimoId 2

# 11n_5_40_M23
set 11n_5_40_M23 ${11n_24_20_M15}
keylset 11n_5_40_M23 Bssid 08:61:0a:d2:fa:7e
keylset 11n_5_40_M23 ChannelBandwidth 40
keylset 11n_5_40_M23 DataMcsIndex 23
keylset 11n_5_40_M23 Dut generic_dut_5
keylset 11n_5_40_M23 MimoId 2
keylset 11n_5_40_M23 NumTxAntennas $Num5Antennas
keylset 11n_5_40_M23 Ssid $SSID_5

#Server Profiles

keylset server1 Vlanenable 0
keylset server1 Vlanid 0
keylset server1 WimixserverEnableIpv6 0
keylset server1 WimixserveragentServer None
keylset server1 WimixserverethPort $Card_Eth
keylset server1 Wimixservergateway 192.168.1.1
keylset server1 WimixserveripAddress 192.168.1.201
keylset server1 WimixserveripMode 0
keylset server1 WimixserveripV6Mode 0
keylset server1 WimixservermacAddress 00:00:02:00:00:02
keylset server1 WimixservermacMode 1
keylset server1 Wimixservernetmask 255.255.0.0
keylset server1 WimixserverserverType 0


#Port list for port specific options
keylset global_config Ports {generic_dut_24 generic_dut_5 generic_dut_eth}

#Generic Dut Definitions

# generic_dut_24
keylset generic_dut_24 APModel $VENDORMODEL
keylset generic_dut_24 APSWVersion $VENDORFW
keylset generic_dut_24 Interface.802_11ac.BindStatus True
keylset generic_dut_24 Interface.802_11ac.CaptureMode normal
keylset generic_dut_24 Interface.802_11ac.Channel 6
keylset generic_dut_24 Interface.802_11ac.ClientBackoff True
keylset generic_dut_24 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_24 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_24 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_24 Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_24 Interface.802_11ac.RxAttenuation False
keylset generic_dut_24 Interface.802_11ac.VkIndex 0
keylset generic_dut_24 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_24 Interface.802_11ac.portChannelBandwidth -1
keylset generic_dut_24 Interface.802_11ac.secChannel 0
keylset generic_dut_24 Vendor $VENDORNAME
keylset generic_dut_24 WLANSwitchModel WLAN\ Switch\ Model:@|
keylset generic_dut_24 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|
keylset generic_dut_24 used True

# generic_dut_5
set generic_dut_5 ${generic_dut_24}
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5

#Generic Dut - generic_dut_eth
keylset generic_dut_eth APModel AP\ Model\ :@|#^&
keylset generic_dut_eth APSWVersion AP\ SW\ Version\ :@|#^&
keylset generic_dut_eth Interface.802_3.Autonegotiation on
keylset generic_dut_eth Interface.802_3.BindStatus True
keylset generic_dut_eth Interface.802_3.ClientBackoff False
keylset generic_dut_eth Interface.802_3.Duplex full
keylset generic_dut_eth Interface.802_3.EthernetSpeed 1000
keylset generic_dut_eth Interface.802_3.InterfaceType 802.3
keylset generic_dut_eth Interface.802_3.RxAttenuation True
keylset generic_dut_eth Interface.802_3.WLANSwitchModel WLAN\ Switch\ Model\ :@|#^&
keylset generic_dut_eth Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_eth Interface.802_3.secChannel 0
keylset generic_dut_eth Vendor generic
keylset generic_dut_eth WLANSwitchSWVersion WLAN\ Switch\ SW\ Version\ :@|#^&
keylset generic_dut_eth used False


#Client Analysis Profiles

#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

