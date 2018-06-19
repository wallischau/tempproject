keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {}
keylset global_config Destination {}

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


#ProgAttenuation Global Options

keylset Progattenuation RoamSla 1

#keylset global_config CustomSchedule {[0,\ 63,\ 1] [5,\ 58,\ 1] [10,\ 53,\ 1] [15,\ 48,\ 1] [20,\ 43,\ 1] [25,\ 38,\ 1] [30,\ 33,\ 1] [35,\ 28,\ 1] [40,\ 23,\ 1] [45,\ 18,\ 1] [50,\ 13,\ 1] [55,\ 8,\ 1] [60,\ 3,\ 1] [63,\ 0,\ 1]}
keylset Progattenuation ChangeInt 1

#keylset ProgAtten NapAttenData OrderedDict([])
keylset Progattenuation IpAddress 192.168.1.250
keylset Progattenuation TestTime 60
keylset Progattenuation ChangeStep 5
keylset Progattenuation NapDurationStep 0
keylset Progattenuation NapMaxVal 1
keylset Progattenuation NapIpAddress 0
keylset Progattenuation PaTestType 0

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
set ATTN24 False
set ATTN5 False
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir
keylset global_config CustomTitle None
keylset global_config BrandDir C:/WaveAutomation/CharterCommunication_Logo_Color.png
keylset global_config CoBrandFlag True
keylset global_config dbserverip 127.0.0.1

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 30
keylset global_config TestDurationSec 30
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed $random_int
keylset global_config overTimeGraphs 0

#Tests - you may define more than one in a TCL list.

#Complete List MC_24_20_C3 MC_DB_C4 MC_DB_C6 MC_5_C7
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#cross group configuration
keylset allGroups GroupType 802.11ac
keylset allGroups ListenInt 10
keylset allGroups Hops 2
keylset allGroups Wlan80211eQoSAC 0
keylset allGroups Dhcp Enable
keylset allGroups RateAdapt 0
keylset allGroups GratuitousArp True
keylset allGroups EnableAMSDUaggregation 0
keylset allGroups PlcpConfiguration mixed
keylset allGroups EnableLDPC False
keylset allGroups ChannelModel Bypass
keylset allGroups GuardInterval standard
keylset allGroups EnableIpv6 0
keylset allGroups SubnetMask 255.255.255.0
keylset allGroups KeepAlive True
keylset allGroups MacAddressIncr 1
keylset allGroups DistId 3
keylset allGroups Gateway 192.168.1.1
keylset allGroups MgmtPhyRate 54
keylset allGroups Qos Enable
keylset allGroups IncrIp Normal
keylset allGroups TransmitDeference 1
keylset allGroups BaseIp 192.168.2.10
keylset allGroups Method {WPA2-PSK}
keylset allGroups PskAscii charter123

#Group 11g_24_54 - Client Options
set 11g_24_54 ${allGroups}
keylset 11g_24_54 Dut generic_dut_1
keylset 11g_24_54 Ssid $SSID_24
keylset 11g_24_54 MacAddress 00:00:01:00:00:01
keylset 11g_24_54 NumTxAntennas $Num24Antennas
keylset 11g_24_54 phyInterface 802.11ag

#Group 11n_24_M15_Agg
set 11n_24_M15_Agg ${allGroups}
keylset 11n_24_M15_Agg Dut generic_dut_1
keylset 11n_24_M15_Agg Ssid $SSID_24
keylset 11n_24_M15_Agg MacAddress 00:00:02:00:00:01
keylset 11n_24_M15_Agg ChannelBandwidth 20
keylset 11n_24_M15_Agg EnableAMPDUaggregation 1
keylset 11n_24_M15_Agg DataMcsIndex 15
keylset 11n_24_M15_Agg NumTxAntennas $Num24Antennas
keylset 11n_24_M15_Agg phyInterface 802.11n

#Group 11n_24_M15_NoAgg
set 11n_24_M15_NoAgg ${11n_24_M15_Agg}
keylset 11n_24_M15_NoAgg EnableAMPDUaggregation 0
keylset 11n_24_M15_NoAgg MacAddress 00:00:03:00:00:01

#Group 11a_5_54
set 11a_5_54 ${allGroups}
keylset 11a_5_54 Dut generic_dut_0
keylset 11a_5_54 Ssid $SSID_5
keylset 11a_5_54 MacAddress 00:00:04:00:00:01
keylset 11a_5_54 NumTxAntennas $Num5Antennas
keylset 11a_5_54 phyInterface 802.11ag

#Group 11n_520_M15_Agg
set 11n_520_M15_Agg ${allGroups}
keylset 11n_520_M15_Agg Dut generic_dut_0
keylset 11n_520_M15_Agg Ssid $SSID_5
keylset 11n_520_M15_Agg MacAddress 00:00:05:00:00:01
keylset 11n_520_M15_Agg ChannelBandwidth 20
keylset 11n_520_M15_Agg EnableAMPDUaggregation 1
keylset 11n_520_M15_Agg DataMcsIndex 15
keylset 11n_520_M15_Agg NumTxAntennas $Num5Antennas
keylset 11n_520_M15_Agg phyInterface 802.11n

#Group 11n_520_M15_NoAgg
set 11n_520_M15_NoAgg ${11n_520_M15_Agg}
keylset 11n_520_M15_NoAgg EnableAMPDUaggregation 0
keylset 11n_520_M15_NoAgg MacAddress 00:00:06:00:00:01

#Group 11n_540_M15_Agg
set 11n_540_M15_Agg ${11n_520_M15_Agg}
keylset 11n_540_M15_Agg ChannelBandwidth 40
keylset 11n_540_M15_Agg MacAddress 00:00:07:00:00:01

#Group 11n_540_M15_NoAgg
set 11n_540_M15_NoAgg ${11n_540_M15_Agg}
keylset 11n_540_M15_NoAgg EnableAMPDUaggregation 0
keylset 11n_540_M15_NoAgg MacAddress 00:00:08:00:00:01

#Group 11ac_5_M9_S1_Agg
set 11ac_5_M9_S1_Agg ${allGroups}
keylset 11ac_5_M9_S1_Agg Dut generic_dut_0
keylset 11ac_5_M9_S1_Agg Ssid $SSID_5
keylset 11ac_5_M9_S1_Agg MacAddress 00:00:09:00:00:01
keylset 11ac_5_M9_S1_Agg NumSpatialStreams 1
keylset 11ac_5_M9_S1_Agg EnableAMPDUaggregation 1
keylset 11ac_5_M9_S1_Agg PlcpConfiguration vht_mixed
keylset 11ac_5_M9_S1_Agg SigBandwidth 80
keylset 11ac_5_M9_S1_Agg MimoMode mu-mimo
keylset 11ac_5_M9_S1_Agg USManagementMcs 11
keylset 11ac_5_M9_S1_Agg VhtDataMcs 9
keylset 11ac_5_M9_S1_Agg USDataMcs 9
keylset 11ac_5_M9_S1_Agg EnableMuSuMimo False
keylset 11ac_5_M9_S1_Agg NumTxAntennas $Num5Antennas
keylset 11ac_5_M9_S1_Agg phyInterface 802.11ac

#Group 11ac_5_M9_S1_NoAgg
set 11ac_5_M9_S1_NoAgg ${11ac_5_M9_S1_Agg}
keylset 11ac_5_M9_S1_NoAgg MacAddress 00:00:09:00:00:01
keylset 11ac_5_M9_S1_NoAgg EnableAMPDUaggregation 0

#
#unknown naming scheme
#

#Wimix Test Settings
keylset Mixed_Clients Test wimix_script
keylset Mixed_Clients wimixMode Client
keylset Mixed_Clients wimixTestName 802.11b/g/n\ Mixed\ Clients
keylset Mixed_Clients testProfile MixedClients
keylset Mixed_Clients testProfileImage images/wimix_new.png
keylset Mixed_Clients staggerStartInt 1
keylset Mixed_Clients totalLoadPer 0
keylset Mixed_Clients contAdminControlFlag 1
keylset Mixed_Clients loadMode 0
keylset Mixed_Clients loadSweepEnd 20
keylset Mixed_Clients loadSweepStart 10
keylset Mixed_Clients continueFlag 0
keylset Mixed_Clients staggerStart 0
keylset Mixed_Clients loadSweepStep 1

set MC_24_20_C3 ${Mixed_Clients}
keylset MC_24_20_C3 loadVal 4
keylset MC_24_20_C3 ClientMix.11g_24_54.TrafficType {UDPTraffic_A}
keylset MC_24_20_C3 ClientMix.11g_24_54.Percentage 33.333
keylset MC_24_20_C3 ClientMix.11g_24_54.delay 0
keylset MC_24_20_C3 ClientMix.11g_24_54.endTime END
keylset MC_24_20_C3 ClientMix.11n_24_M15_Agg.TrafficType {UDPTraffic_A}
keylset MC_24_20_C3 ClientMix.11n_24_M15_Agg.Percentage 33.333
keylset MC_24_20_C3 ClientMix.11n_24_M15_Agg.delay 0
keylset MC_24_20_C3 ClientMix.11n_24_M15_Agg.endTime END
keylset MC_24_20_C3 ClientMix.11n_24_M15_NoAgg.TrafficType {UDPTraffic_A}
keylset MC_24_20_C3 ClientMix.11n_24_M15_NoAgg.Percentage 33.333
keylset MC_24_20_C3 ClientMix.11n_24_M15_NoAgg.delay 0
keylset MC_24_20_C3 ClientMix.11n_24_M15_NoAgg.endTime END
keylset MC_24_20_C3 Source {11n_24_M15_Agg}
keylset MC_24_20_C3 Destination {11g_24_54 11n_24_M15_NoAgg}

set MC_DB_C4 ${Mixed_Clients}
keylset MC_DB_C4 loadVal 4
keylset MC_DB_C4 ClientMix.11n_24_M15_Agg.TrafficType {UDPTraffic_B}
keylset MC_DB_C4 ClientMix.11n_24_M15_Agg.Percentage 25.0
keylset MC_DB_C4 ClientMix.11n_24_M15_Agg.delay 0
keylset MC_DB_C4 ClientMix.11n_24_M15_Agg.endTime END
keylset MC_DB_C4 ClientMix.11n_24_M15_NoAgg.TrafficType {UDPTraffic_B}
keylset MC_DB_C4 ClientMix.11n_24_M15_NoAgg.Percentage 25.0
keylset MC_DB_C4 ClientMix.11n_24_M15_NoAgg.delay 0
keylset MC_DB_C4 ClientMix.11n_24_M15_NoAgg.endTime END
keylset MC_DB_C4 ClientMix.11n_540_M15_Agg.TrafficType {UDPTraffic_B}
keylset MC_DB_C4 ClientMix.11n_540_M15_Agg.Percentage 25.0
keylset MC_DB_C4 ClientMix.11n_540_M15_Agg.delay 0
keylset MC_DB_C4 ClientMix.11n_540_M15_Agg.endTime END
keylset MC_DB_C4 ClientMix.11n_540_M15_NoAgg.TrafficType {UDPTraffic_B}
keylset MC_DB_C4 ClientMix.11n_540_M15_NoAgg.Percentage 25.0
keylset MC_DB_C4 ClientMix.11n_540_M15_NoAgg.delay 0
keylset MC_DB_C4 ClientMix.11n_540_M15_NoAgg.endTime END
keylset MC_DB_C4 Source {11n_24_M15_NoAgg}
keylset MC_DB_C4 Destination {11n_24_M15_Agg 11n_540_M15_Agg 11n_540_M15_NoAgg}

set MC_DB_C6 ${Mixed_Clients}
keylset MC_DB_C6 loadVal 7
keylset MC_DB_C6 ClientMix.11g_24_54.TrafficType {UDPTraffic_C}
keylset MC_DB_C6 ClientMix.11g_24_54.Percentage 16.667
keylset MC_DB_C6 ClientMix.11g_24_54.delay 0
keylset MC_DB_C6 ClientMix.11g_24_54.endTime END
keylset MC_DB_C6 ClientMix.11n_24_M15_Agg.TrafficType {UDPTraffic_C}
keylset MC_DB_C6 ClientMix.11n_24_M15_Agg.Percentage 16.667
keylset MC_DB_C6 ClientMix.11n_24_M15_Agg.delay 0
keylset MC_DB_C6 ClientMix.11n_24_M15_Agg.endTime END
keylset MC_DB_C6 ClientMix.11n_24_M15_NoAgg.TrafficType {UDPTraffic_C}
keylset MC_DB_C6 ClientMix.11n_24_M15_NoAgg.Percentage 16.667
keylset MC_DB_C6 ClientMix.11n_24_M15_NoAgg.delay 0
keylset MC_DB_C6 ClientMix.11n_24_M15_NoAgg.endTime END
keylset MC_DB_C6 ClientMix.11a_5_54.TrafficType {UDPTraffic_C}
keylset MC_DB_C6 ClientMix.11a_5_54.Percentage 16.667
keylset MC_DB_C6 ClientMix.11a_5_54.delay 0
keylset MC_DB_C6 ClientMix.11a_5_54.endTime END
keylset MC_DB_C6 ClientMix.11n_540_M15_Agg.TrafficType {UDPTraffic_C}
keylset MC_DB_C6 ClientMix.11n_540_M15_Agg.Percentage 16.667
keylset MC_DB_C6 ClientMix.11n_540_M15_Agg.delay 0
keylset MC_DB_C6 ClientMix.11n_540_M15_Agg.endTime END
keylset MC_DB_C6 ClientMix.11n_540_M15_NoAgg.TrafficType {UDPTraffic_C}
keylset MC_DB_C6 ClientMix.11n_540_M15_NoAgg.Percentage 16.667
keylset MC_DB_C6 ClientMix.11n_540_M15_NoAgg.delay 0
keylset MC_DB_C6 ClientMix.11n_540_M15_NoAgg.endTime END
keylset MC_DB_C6 Source {11n_24_M15_Agg}
keylset MC_DB_C6 Destination {11g_24_54 11n_24_M15_NoAgg 11a_5_54 11n_540_M15_Agg 11n_540_M15_NoAgg}

set MC_5_80_C7 ${Mixed_Clients}
keylset MC_5_80_C7 loadVal 8
keylset MC_5_80_C7 ClientMix.11a_5_54.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11a_5_54.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11a_5_54.delay 0
keylset MC_5_80_C7 ClientMix.11a_5_54.endTime END
keylset MC_5_80_C7 ClientMix.11n_520_M15_Agg.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11n_520_M15_Agg.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11n_520_M15_Agg.delay 0
keylset MC_5_80_C7 ClientMix.11n_520_M15_Agg.endTime END
keylset MC_5_80_C7 ClientMix.11n_520_M15_NoAgg.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11n_520_M15_NoAgg.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11n_520_M15_NoAgg.delay 0
keylset MC_5_80_C7 ClientMix.11n_520_M15_NoAgg.endTime END
keylset MC_5_80_C7 ClientMix.11n_540_M15_Agg.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11n_540_M15_Agg.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11n_540_M15_Agg.delay 0
keylset MC_5_80_C7 ClientMix.11n_540_M15_Agg.endTime END
keylset MC_5_80_C7 ClientMix.11n_540_M15_NoAgg.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11n_540_M15_NoAgg.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11n_540_M15_NoAgg.delay 0
keylset MC_5_80_C7 ClientMix.11n_540_M15_NoAgg.endTime END
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_Agg.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_Agg.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_Agg.delay 0
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_Agg.endTime END
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_NoAgg.TrafficType {UDPTraffic_D}
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_NoAgg.Percentage 14.286
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_NoAgg.delay 0
keylset MC_5_80_C7 ClientMix.11ac_5_M9_S1_NoAgg.endTime END
keylset MC_5_80_C7 Source {11n_520_M15_Agg}
keylset MC_5_80_C7 Destination {11a_5_54 11n_520_M15_NoAgg 11n_540_M15_Agg 11n_540_M15_NoAgg 11ac_5_M9_S1_Agg 11ac_5_M9_S1_NoAgg}



#Traffic Profiles
keylset UDPTraffic_Base WimixtrafficDirection downlink
keylset UDPTraffic_Base WimixtrafficFramesize 1500
keylset UDPTraffic_Base WimixtrafficNumFrames 100000000
keylset UDPTraffic_Base WimixtrafficpayData None
keylset UDPTraffic_Base WimixtrafficServer server1
keylset UDPTraffic_Base WimixtrafficipProtocolNum Auto
keylset UDPTraffic_Base WimixtrafficPhyrate 54
keylset UDPTraffic_Base WimixtrafficRateBehaviour 0
keylset UDPTraffic_Base WimixtrafficTtl 64
keylset UDPTraffic_Base WimixtrafficRateMode 0
keylset UDPTraffic_Base WimixtrafficType UDP
keylset UDPTraffic_Base WimixtrafficpayPattern 0
keylset UDPTraffic_Base Layer4to7SrcPort 20340
keylset UDPTraffic_Base Layer4to7DestPort 30340
keylset UDPTraffic_Base Layer3qosenable 0
keylset UDPTraffic_Base Layer3qosdscp 0
keylset UDPTraffic_Base BurstdataburstDur 5
keylset UDPTraffic_Base BurstdataburstRate 100
keylset UDPTraffic_Base Burstdataibg 5
keylset UDPTraffic_Base Layer2qosenable 0
keylset UDPTraffic_Base Layer2qossurBand 100
keylset UDPTraffic_Base Layer2qosminPhyRate 1
keylset UDPTraffic_Base Layer2qoswlanUp 0
keylset UDPTraffic_Base Layer2qosmDataRate 10240
keylset UDPTraffic_Base Layer2qosethUp 0
keylset UDPTraffic_Base Layer2qostclasIe 0
keylset UDPTraffic_Base Layer2qosmsduSize 128
keylset UDPTraffic_Base Layer2qosadControl 0
keylset UDPTraffic_Base Layer2qosflDir 1
keylset UDPTraffic_Base Layer2qostid 0
keylset UDPTraffic_Base Layer2qostclasUp 0
keylset UDPTraffic_Base Layer2qosclassifier None
keylset UDPTraffic_Base SlaLatency 1000
keylset UDPTraffic_Base SlaJitter 50
keylset UDPTraffic_Base SlaPacketLoss 10

set UDPTraffic_A ${UDPTraffic_Base}
keylset UDPTraffic_A WimixtrafficIntendedrate 30000

set UDPTraffic_B ${UDPTraffic_Base}
keylset UDPTraffic_B WimixtrafficIntendedrate 100000

set UDPTraffic_C ${UDPTraffic_Base}
keylset UDPTraffic_C WimixtrafficIntendedrate 75000

set UDPTraffic_D ${UDPTraffic_Base}
keylset UDPTraffic_D WimixtrafficIntendedrate 60000

#Server Profiles


keylset server1 WimixservermacAddress 00:00:02:00:00:02
keylset server1 WimixserverEnableIpv6 0
keylset server1 WimixserverserverType 0
keylset server1 WimixserveripMode 0
keylset server1 WimixserverethPort $Card_Eth
keylset server1 Wimixservernetmask 255.255.0.0
keylset server1 WimixservermacMode 1
keylset server1 WimixserveragentServer None
keylset server1 WimixserveripV6Mode 0
keylset server1 WimixserveripAddress 192.168.1.201
keylset server1 Wimixservergateway 192.168.1.1
keylset server1 Vlanenable 0
keylset server1 Vlanid 0

#Port list for port specific options
keylset global_config Ports {generic_dut_0 generic_dut_1}

#Generic Dut Definitions

#Generic Dut - generic_dut_0
keylset generic_dut_0 used True
keylset generic_dut_0 Vendor generic
keylset generic_dut_0 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&
keylset generic_dut_0 APSWVersion AP\ SW\ Version:@|#^&
keylset generic_dut_0 APModel AP\ Model:@|#^&
keylset generic_dut_0 Interface.802_11ac.BindStatus True
keylset generic_dut_0 Interface.802_11ac.WavetestPort $Card_5
# keylset generic_dut_0 Interface.802_11ac.ChannelBandwidth Follow\ AP's\ Info
keylset generic_dut_0 Interface.802_11ac.RxAttenuation False
keylset generic_dut_0 Interface.802_11ac.ClientBackoff False
keylset generic_dut_0 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_0 Interface.802_11ac.Channel 149
keylset generic_dut_0 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_0 WLANSwitchModel WLAN\ Switch\ Model:@|#^&

#Generic Dut - generic_dut_1
keylset generic_dut_1 used True
keylset generic_dut_1 Vendor generic
keylset generic_dut_1 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&
keylset generic_dut_1 APSWVersion AP\ SW\ Version:@|#^&
keylset generic_dut_1 APModel AP\ Model:@|#^&
keylset generic_dut_1 Interface.802_11ac.BindStatus True
keylset generic_dut_1 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_1 Interface.802_11ac.RxAttenuation False
keylset generic_dut_1 Interface.802_11ac.ClientBackoff False
keylset generic_dut_1 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_1 Interface.802_11ac.Channel 6
keylset generic_dut_1 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_1 WLANSwitchModel WLAN\ Switch\ Model:@|#^&

#Client Analysis Profiles

#Source a file looking for a license key definition
#catch {source [file join $env(HOME) "vw_licenses.tcl"]}

