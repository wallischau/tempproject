
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}

#Traffics Global Options

keylset global_config Content None
keylset global_config UserPattern None
keylset global_config PayloadData None
keylset global_config Destination None
keylset global_config Source None

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
set LANSModel none
set LANSFW none
set ATTN24 False
set ATTN5 False
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir
keylset global_config CustomTitle None
keylset global_config dbserverip 127.0.0.1

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 10
keylset global_config TestDurationSec 10
keylset global_config wimixResultSampleVal 1
keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed $random_int
keylset global_config overTimeGraphs 0

#Tests - you may define more than one in a TCL list.
#unicast_video24_M15 unicast_video540_M15 unicast_video580
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#Group videoClient
keylset videoClient_2 GroupType 802.11abgn
keylset videoClient_2 Dut generic_dut_2

#Group videoClient_2 - Client Options
keylset videoClient_2 ListenInt 10
keylset videoClient_2 Ssid $SSID_24
keylset videoClient_2 Hops -1
keylset videoClient_2 Wlan80211eQoSAC 0
keylset videoClient_2 Dhcp Enable
keylset videoClient_2 RateAdapt 0
keylset videoClient_2 GratuitousArp True
keylset videoClient_2 MacAddress 00:00:01:00:00:01
keylset videoClient_2 PlcpConfiguration mixed
keylset videoClient_2 ChannelBandwidth 20
keylset videoClient_2 EnableAMPDUaggregation 1
keylset videoClient_2 ChannelModel Bypass
keylset videoClient_2 GuardInterval standard
keylset videoClient_2 DataMcsIndex 15
keylset videoClient_2 NumTxAntennas $Num24Antennas
keylset videoClient_2 EnableIpv6 0
keylset videoClient_2 SubnetMask 255.255.0.0
keylset videoClient_2 KeepAlive True
keylset videoClient_2 MacAddressIncr 1
keylset videoClient_2 Gateway 192.168.1.1
keylset videoClient_2 phyInterface 802.11n
keylset videoClient_2 MgmtPhyRate 24
keylset videoClient_2 Qos Enable
keylset videoClient_2 IncrIp Normal
keylset videoClient_2 TransmitDeference 1
keylset videoClient_2 BaseIp 192.168.1.10

#Group videoClient_2 - Security Options
keylset videoClient_2 Method {WPA2-PSK}
keylset videoClient_2 PskAscii charter123

#Group videoClient_5
keylset videoClient_5 GroupType 802.11abgn
keylset videoClient_5 Dut generic_dut_5

#Group videoClient_5 - Client Options
keylset videoClient_5 ListenInt 10
keylset videoClient_5 Ssid $SSID_5
keylset videoClient_5 Hops -1
keylset videoClient_5 Wlan80211eQoSAC 0
keylset videoClient_5 Dhcp Enable
keylset videoClient_5 RateAdapt 0
keylset videoClient_5 GratuitousArp True
keylset videoClient_5 MacAddress 00:00:01:00:00:01
keylset videoClient_5 PlcpConfiguration mixed
keylset videoClient_5 ChannelBandwidth 40
keylset videoClient_5 EnableAMPDUaggregation 1
keylset videoClient_5 ChannelModel Bypass
keylset videoClient_5 GuardInterval standard
keylset videoClient_5 DataMcsIndex 15
keylset videoClient_5 NumTxAntennas $Num5Antennas
keylset videoClient_5 EnableIpv6 0
keylset videoClient_5 SubnetMask 255.255.0.0
keylset videoClient_5 KeepAlive True
keylset videoClient_5 MacAddressIncr 1
keylset videoClient_5 Gateway 192.168.1.1
keylset videoClient_5 phyInterface 802.11n
keylset videoClient_5 MgmtPhyRate 24
keylset videoClient_5 Qos Enable
keylset videoClient_5 IncrIp Normal
keylset videoClient_5 TransmitDeference 1
keylset videoClient_5 BaseIp 192.168.1.10

#Group videoClient_5 - Security Options
keylset videoClient_5 Method {WPA2-PSK}
keylset videoClient_5 PskAscii charter123

#24
set videoClient24_M7 ${videoClient_2}
keylset videoClient24_M7 DataMcsIndex 7

set videoClient24_M15 ${videoClient_2}
keylset videoClient24_M15 DataMcsIndex 15

set videoClient24_M23 ${videoClient_2}
keylset videoClient24_M23 DataMcsIndex 23

set videoClient24_M31 ${videoClient_2}
keylset videoClient24_M31 DataMcsIndex 31


#540
set videoClient540 ${videoClient_5}
keylset videoClient540 ChannelBandwidth 40

set videoClient540_M7 ${videoClient540}
keylset videoClient540_M7 DataMcsIndex 7

set videoClient540_M15 ${videoClient540}
keylset videoClient540_M15 DataMcsIndex 15

set videoClient540_M23 ${videoClient540}
keylset videoClient540_M23 DataMcsIndex 23

set videoClient540_M31 ${videoClient540}
keylset videoClient540_M31 DataMcsIndex 31

#580
set videoClient580 ${videoClient_5}
keylset videoClient580 ChannelBandwidth 80
keylset videoClient580 phyInterface 802.11ac
keylset videoClient580 PlcpConfiguration vht_mixed
keylset videoClient580 VhtDataMcs 9
keylset videoClient580 USManagementMcs 11
keylset videoClient580 USDataMcs 9

set videoClient580_S1_M9 ${videoClient580}
keylset videoClient580_S1_M9 NumSpatialStreams 1

set videoClient580_S2_M9 ${videoClient580}
keylset videoClient580_S2_M9 NumSpatialStreams 2

set videoClient580_S3_M9 ${videoClient580}
keylset videoClient580_S3_M9 NumSpatialStreams 3

set videoClient580_S4_M9 ${videoClient580}
keylset videoClient580_S4_M9 NumSpatialStreams 4

#Wimix Test Settings
keylset unicast_video Test wimix_script
keylset unicast_video wimixMode Client
keylset unicast_video wimixTestName Unicast\ Video\ Session\ Capacity
keylset unicast_video testProfile VideoSessionCapacity
keylset unicast_video testProfileImage images/wimix_new.png
keylset unicast_video staggerStart 0
keylset unicast_video totalClientPer 100.0
keylset unicast_video continueFlag 0
keylset unicast_video loadVal 9
keylset unicast_video totalLoadPer 100.0
keylset unicast_video contAdminControlFlag 0
keylset unicast_video loadMode 1
keylset unicast_video loadSweepEnd 99
keylset unicast_video loadSweepStart 1
keylset unicast_video loadSweepStep 1
keylset unicast_video staggerStartInt 1

set UV_24_20_M7 ${unicast_video}
keylset UV_24_20_M7 ClientMix.videoClient24_M7.TrafficType {MPEG2_VideoStream}
keylset UV_24_20_M7 ClientMix.videoClient24_M7.Percentage 100.0
keylset UV_24_20_M7 ClientMix.videoClient24_M7.delay 0
keylset UV_24_20_M7 ClientMix.videoClient24_M7.endTime END

set UV_24_20_M15 ${unicast_video}
keylset UV_24_20_M15 ClientMix.videoClient24_M15.TrafficType {MPEG2_VideoStream}
keylset UV_24_20_M15 ClientMix.videoClient24_M15.Percentage 100.0
keylset UV_24_20_M15 ClientMix.videoClient24_M15.delay 0
keylset UV_24_20_M15 ClientMix.videoClient24_M15.endTime END

set UV_24_20_M23 ${unicast_video}
keylset UV_24_20_M23 ClientMix.videoClient24_M23.TrafficType {MPEG2_VideoStream}
keylset UV_24_20_M23 ClientMix.videoClient24_M23.Percentage 100.0
keylset UV_24_20_M23 ClientMix.videoClient24_M23.delay 0
keylset UV_24_20_M23 ClientMix.videoClient24_M23.endTime END

set UV_24_20_M31 ${unicast_video}
keylset UV_24_20_M31 ClientMix.videoClient24_M31.TrafficType {MPEG2_VideoStream}
keylset UV_24_20_M31 ClientMix.videoClient24_M31.Percentage 100.0
keylset UV_24_20_M31 ClientMix.videoClient24_M31.delay 0
keylset UV_24_20_M31 ClientMix.videoClient24_M31.endTime END


set UV_5_40_M7 ${unicast_video}
keylset UV_5_40_M7 ClientMix.videoClient540_M7.TrafficType {MPEG2_VideoStream}
keylset UV_5_40_M7 ClientMix.videoClient540_M7.Percentage 100.0
keylset UV_5_40_M7 ClientMix.videoClient540_M7.delay 0
keylset UV_5_40_M7 ClientMix.videoClient540_M7.endTime END

set UV_5_40_M15 ${unicast_video}
keylset UV_5_40_M15 ClientMix.videoClient540_M15.TrafficType {MPEG2_VideoStream}
keylset UV_5_40_M15 ClientMix.videoClient540_M15.Percentage 100.0
keylset UV_5_40_M15 ClientMix.videoClient540_M15.delay 0
keylset UV_5_40_M15 ClientMix.videoClient540_M15.endTime END

set UV_5_40_M23 ${unicast_video}
keylset UV_5_40_M23 ClientMix.videoClient540_M23.TrafficType {MPEG2_VideoStream}
keylset UV_5_40_M23 ClientMix.videoClient540_M23.Percentage 100.0
keylset UV_5_40_M23 ClientMix.videoClient540_M23.delay 0
keylset UV_5_40_M23 ClientMix.videoClient540_M23.endTime END

set UV_5_40_M31 ${unicast_video}
keylset UV_5_40_M31 ClientMix.videoClient540_M31.TrafficType {MPEG2_VideoStream}
keylset UV_5_40_M31 ClientMix.videoClient540_M31.Percentage 100.0
keylset UV_5_40_M31 ClientMix.videoClient540_M31.delay 0
keylset UV_5_40_M31 ClientMix.videoClient540_M31.endTime END


set UV_5_80_S1_M9 ${unicast_video}
keylset UV_5_80_S1_M9 ClientMix.videoClient580_S1_M9.TrafficType {MPEG2_VideoStream}
keylset UV_5_80_S1_M9 ClientMix.videoClient580_S1_M9.Percentage 100.0
keylset UV_5_80_S1_M9 ClientMix.videoClient580_S1_M9.delay 0
keylset UV_5_80_S1_M9 ClientMix.videoClient580_S1_M9.endTime END


set UV_5_80_S2_M9 ${unicast_video}
keylset UV_5_80_S2_M9 ClientMix.videoClient580_S2_M9.TrafficType {MPEG2_VideoStream}
keylset UV_5_80_S2_M9 ClientMix.videoClient580_S2_M9.Percentage 100.0
keylset UV_5_80_S2_M9 ClientMix.videoClient580_S2_M9.delay 0
keylset UV_5_80_S2_M9 ClientMix.videoClient580_S2_M9.endTime END

set UV_5_80_S3_M9 ${unicast_video}
keylset UV_5_80_S3_M9 ClientMix.videoClient580_S3_M9.TrafficType {MPEG2_VideoStream}
keylset UV_5_80_S3_M9 ClientMix.videoClient580_S3_M9.Percentage 100.0
keylset UV_5_80_S3_M9 ClientMix.videoClient580_S3_M9.delay 0
keylset UV_5_80_S3_M9 ClientMix.videoClient580_S3_M9.endTime END

set UV_5_80_S4_M9 ${unicast_video}
keylset UV_5_80_S4_M9 ClientMix.videoClient580_S4_M9.TrafficType {MPEG2_VideoStream}
keylset UV_5_80_S4_M9 ClientMix.videoClient580_S4_M9.Percentage 100.0
keylset UV_5_80_S4_M9 ClientMix.videoClient580_S4_M9.delay 0
keylset UV_5_80_S4_M9 ClientMix.videoClient580_S4_M9.endTime END


#Traffic Profiles
keylset MPEG2_VideoStream WimixtrafficDirection downlink
keylset MPEG2_VideoStream WimixtrafficIntendedrate 8000
keylset MPEG2_VideoStream WimixtrafficFramesize 1500
keylset MPEG2_VideoStream WimixtrafficNumFrames 100000000
keylset MPEG2_VideoStream WimixtrafficpayData None
keylset MPEG2_VideoStream WimixtrafficServer videoServer
keylset MPEG2_VideoStream WimixtrafficipProtocolNum Auto
keylset MPEG2_VideoStream WimixtrafficPhyrate 54
keylset MPEG2_VideoStream WimixtrafficRateBehaviour 0
keylset MPEG2_VideoStream WimixtrafficTtl 64
keylset MPEG2_VideoStream WimixtrafficRateMode 0
keylset MPEG2_VideoStream WimixtrafficType RTPVideo
keylset MPEG2_VideoStream WimixtrafficpayPattern 0
keylset MPEG2_VideoStream Layer4to7rtpVideoSignaling 0
keylset MPEG2_VideoStream Layer4to7rtpVideoProtocol 0
keylset MPEG2_VideoStream Layer4to7SrcPort 25000
keylset MPEG2_VideoStream Layer4to7DestPort 26000
keylset MPEG2_VideoStream Layer4to7rtpVideoCoding 0
keylset MPEG2_VideoStream Layer3qosenable 1
keylset MPEG2_VideoStream Layer3qosdscp 40
keylset MPEG2_VideoStream BurstdataburstDur 5
keylset MPEG2_VideoStream BurstdataburstRate 100
keylset MPEG2_VideoStream Burstdataibg 5
keylset MPEG2_VideoStream Layer2qosenable 1
keylset MPEG2_VideoStream Layer2qossurBand 100
keylset MPEG2_VideoStream Layer2qosminPhyRate 1
keylset MPEG2_VideoStream Layer2qoswlanUp 5
keylset MPEG2_VideoStream Layer2qosmDataRate 200
keylset MPEG2_VideoStream Layer2qosethUp 5
keylset MPEG2_VideoStream Layer2qostclasIe 0
keylset MPEG2_VideoStream Layer2qosmsduSize 280
keylset MPEG2_VideoStream Layer2qosadControl 0
keylset MPEG2_VideoStream Layer2qosflDir 1
keylset MPEG2_VideoStream Layer2qostid 7
keylset MPEG2_VideoStream Layer2qostclasUp 0
keylset MPEG2_VideoStream Layer2qosclassifier None
keylset MPEG2_VideoStream SlaDf 50
keylset MPEG2_VideoStream SlaMlr 1

#Server Profiles


keylset videoServer WimixservermacAddress 00:00:02:00:00:02
keylset videoServer WimixserverserverType 0
keylset videoServer WimixserverEnableIpv6 0
keylset videoServer WimixserverethPort $Card_Eth
keylset videoServer WimixserveripMode 0
keylset videoServer Wimixservernetmask 255.255.0.0
keylset videoServer WimixservermacMode 1
keylset videoServer WimixserveragentServer None
keylset videoServer WimixserveripV6Mode 0
keylset videoServer WimixserveripAddress 192.168.1.201
keylset videoServer Wimixservergateway 192.168.1.1
keylset videoServer Vlanenable 0
keylset videoServer Vlanid 0

#Port list for port specific options
keylset global_config Ports {generic_dut_2 generic_dut_5}

#Generic Dut Definitions


#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&$LANSFW
keylset generic_dut_2 APSWVersion AP\ SW\ Version:@|#^&$VENDORFW
keylset generic_dut_2 APModel AP\ Model:@|#^&$VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11ac.RxAttenuation False
keylset generic_dut_2 Interface.802_11ac.ClientBackoff False
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11n
keylset generic_dut_2 Interface.802_11ac.secChannel 0
keylset generic_dut_2 Interface.802_11ac.Channel 6
keylset generic_dut_2 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_2 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$LANSModel

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&$LANSFW
keylset generic_dut_5 APSWVersion AP\ SW\ Version:@|#^&$VENDORFW
keylset generic_dut_5 APModel AP\ Model:@|#^&$VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 Interface.802_11ac.RxAttenuation False
keylset generic_dut_5 Interface.802_11ac.ClientBackoff False
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11n
keylset generic_dut_5 Interface.802_11ac.secChannel 0
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$LANSModel

#Client Analysis Profiles

#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

