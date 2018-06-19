
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {}
keylset global_config Destination {}

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

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 30
keylset global_config TestDurationSec 30
keylset global_config wimixResultSampleVal 1
keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 0

#Tests - you may define more than one in a TCL list.
#
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 1

#Group wirelessTV_24
keylset wirelessTV_24 GroupType 802.11ac
keylset wirelessTV_24 Dut generic_dut_2
keylset wirelessTV_24 ListenInt 10
keylset wirelessTV_24 Ssid $SSID_24
keylset wirelessTV_24 Channel $Channel24
keylset wirelessTV_24 Wlan80211eQoSAC 0
keylset wirelessTV_24 Dhcp Enable
keylset wirelessTV_24 RateAdapt 0
keylset wirelessTV_24 GratuitousArp True
keylset wirelessTV_24 EnableAMSDUaggregation 0
keylset wirelessTV_24 PlcpConfiguration mixed
keylset wirelessTV_24 ChannelBandwidth 20
keylset wirelessTV_24 SnrVal 40
keylset wirelessTV_24 EnableLDPC False
keylset wirelessTV_24 EnableAMPDUaggregation 1
keylset wirelessTV_24 ChannelModel Bypass
keylset wirelessTV_24 GuardInterval standard
keylset wirelessTV_24 EnableIpv6 0
keylset wirelessTV_24 SubnetMask 255.255.0.0
keylset wirelessTV_24 KeepAlive True
keylset wirelessTV_24 MacAddressIncr 1
keylset wirelessTV_24 NumTxAntennas $Num24Antennas
keylset wirelessTV_24 Gateway 192.168.1.1
keylset wirelessTV_24 phyInterface 802.11n
keylset wirelessTV_24 MgmtPhyRate 24
keylset wirelessTV_24 Qos Enable
keylset wirelessTV_24 IncrIp Normal
keylset wirelessTV_24 TransmitDeference 1
keylset wirelessTV_24 Method {WPA2-PSK}
keylset wirelessTV_24 PskAscii charter123

set wirelessTV1_24 ${wirelessTV_24}
keylset wirelessTV1_24 MacAddress 00:00:01:00:00:01
keylset wirelessTV1_24 BaseIp 172.168.1.10

set wirelessTV2_24 ${wirelessTV_24}
keylset wirelessTV1_24 MacAddress 00:00:02:00:00:01
keylset wirelessTV1_24 BaseIp 172.168.1.11

set wirelessTV3_24 ${wirelessTV_24}
keylset wirelessTV1_24 MacAddress 00:00:03:00:00:01
keylset wirelessTV1_24 BaseIp 172.168.1.12

#Group wirelessTV_5
keylset wirelessTV_5 GroupType 802.11ac
keylset wirelessTV_5 Dut generic_dut_5
keylset wirelessTV_5 ListenInt 10
keylset wirelessTV_5 Ssid $SSID_5
keylset wirelessTV_5 Channel $Channel5
keylset wirelessTV_5 Wlan80211eQoSAC 0
keylset wirelessTV_5 Dhcp Enable
keylset wirelessTV_5 RateAdapt 0
keylset wirelessTV_5 GratuitousArp True
keylset wirelessTV_5 EnableAMSDUaggregation 0
keylset wirelessTV_5 PlcpConfiguration mixed
keylset wirelessTV_5 SnrVal 40
keylset wirelessTV_5 EnableLDPC False
keylset wirelessTV_5 EnableAMPDUaggregation 1
keylset wirelessTV_5 ChannelModel Bypass
keylset wirelessTV_5 GuardInterval short
keylset wirelessTV_5 EnableIpv6 0
keylset wirelessTV_5 SubnetMask 255.255.0.0
keylset wirelessTV_5 KeepAlive True
keylset wirelessTV_5 MacAddressIncr 1
keylset wirelessTV_5 NumTxAntennas $Num5Antennas
keylset wirelessTV_5 Gateway 192.168.1.1
keylset wirelessTV_5 MgmtPhyRate 24
keylset wirelessTV_5 Qos Enable
keylset wirelessTV_5 IncrIp Normal
keylset wirelessTV_5 TransmitDeference 1
keylset wirelessTV_5 Method {WPA2-PSK}
keylset wirelessTV_5 PskAscii charter123

set wirelessTV1_5 ${wirelessTV_5}
keylset wirelessTV1_5 MacAddress 00:00:01:00:00:01
keylset wirelessTV1_5 BaseIp 172.168.1.10

set wirelessTV2_5 ${wirelessTV_5}
keylset wirelessTV1_5 MacAddress 00:00:02:00:00:01
keylset wirelessTV1_5 BaseIp 172.168.1.11

set wirelessTV3_5 ${wirelessTV_5}
keylset wirelessTV1_5 MacAddress 00:00:03:00:00:01
keylset wirelessTV1_5 BaseIp 172.168.1.12

set wirelessTV1_540 ${wirelessTV1_5}
keylset wirelessTV1_540 ChannelBandwidth 40
keylset wirelessTV1_540 phyInterface 802.11n
set wirelessTV2_540 ${wirelessTV2_5}
keylset wirelessTV2_540 ChannelBandwidth 40
keylset wirelessTV2_540 phyInterface 802.11n
set wirelessTV3_540 ${wirelessTV3_5}
keylset wirelessTV3_540 ChannelBandwidth 40
keylset wirelessTV3_540 phyInterface 802.11n

set wirelessTV1_580 ${wirelessTV1_5}
keylset wirelessTV1_580 sigBandwidth 80
keylset wirelessTV1_580 phyInterface 802.11ac
keylset wirelessTV1_580 MimoMode mu-mimo
keylset wirelessTV1_580 USManagementMcs 7
keylset wirelessTV1_580 VhtDataMcs 7
keylset wirelessTV1_580 USDataMcs 7
keylset wirelessTV1_580 EnableMuSuMimo False
set wirelessTV2_580 ${wirelessTV2_5}
keylset wirelessTV2_580 sigBandwidth 80
keylset wirelessTV2_580 phyInterface 802.11ac
keylset wirelessTV2_580 MimoMode mu-mimo
keylset wirelessTV2_580 USManagementMcs 7
keylset wirelessTV2_580 VhtDataMcs 7
keylset wirelessTV2_580 USDataMcs 7
keylset wirelessTV2_580 EnableMuSuMimo False
set wirelessTV3_580 ${wirelessTV3_5}
keylset wirelessTV2_580 sigBandwidth 80
keylset wirelessTV2_580 phyInterface 802.11ac
keylset wirelessTV2_580 MimoMode mu-mimo
keylset wirelessTV2_580 USManagementMcs 7
keylset wirelessTV2_580 VhtDataMcs 7
keylset wirelessTV2_580 USDataMcs 7
keylset wirelessTV2_580 EnableMuSuMimo False

#24
set wirelessTV1_24_M7 ${wirelessTV1_24}
keylset wirelessTV1_24_M7 DataMcsIndex 7
keylset wirelessTV1_24_M7 MimoId 1
set wirelessTV1_24_M15 ${wirelessTV1_24}
keylset wirelessTV1_24_M15 DataMcsIndex 15
keylset wirelessTV1_24_M15 MimoId 2
set wirelessTV1_24_M23 ${wirelessTV1_24}
keylset wirelessTV1_24_M23 DataMcsIndex 23
keylset wirelessTV1_24_M23 MimoId 3
set wirelessTV1_24_M31 ${wirelessTV1_24}
keylset wirelessTV1_24_M31 DataMcsIndex 31
keylset wirelessTV1_24_M31 MimoId 4

set wirelessTV2_24_M7 ${wirelessTV2_24}
keylset wirelessTV2_24_M7 DataMcsIndex 7
keylset wirelessTV2_24_M7 MimoId 1
set wirelessTV2_24_M15 ${wirelessTV2_24}
keylset wirelessTV2_24_M15 DataMcsIndex 15
keylset wirelessTV2_24_M15 MimoId 2
set wirelessTV2_24_M23 ${wirelessTV2_24}
keylset wirelessTV2_24_M23 DataMcsIndex 23
keylset wirelessTV2_24_M23 MimoId 3
set wirelessTV2_24_M31 ${wirelessTV2_24}
keylset wirelessTV2_24_M31 DataMcsIndex 31
keylset wirelessTV2_24_M31 MimoId 4

set wirelessTV3_24_M7 ${wirelessTV3_24}
keylset wirelessTV3_24_M7 DataMcsIndex 7
keylset wirelessTV3_24_M7 MimoId 1
set wirelessTV3_24_M15 ${wirelessTV3_24}
keylset wirelessTV3_24_M15 DataMcsIndex 15
keylset wirelessTV3_24_M15 MimoId 2
set wirelessTV3_24_M23 ${wirelessTV3_24}
keylset wirelessTV3_24_M23 DataMcsIndex 23
keylset wirelessTV3_24_M23 MimoId 3
set wirelessTV3_24_M31 ${wirelessTV3_24}
keylset wirelessTV3_24_M31 DataMcsIndex 31
keylset wirelessTV3_24_M31 MimoId 4

#540
set wirelessTV1_540_M7 ${wirelessTV1_540}
keylset wirelessTV1_540_M7 DataMcsIndex 7
keylset wirelessTV1_540_M7 MimoId 1
set wirelessTV1_540_M15 ${wirelessTV1_540}
keylset wirelessTV1_540_M15 DataMcsIndex 15
keylset wirelessTV1_540_M15 MimoId 2
set wirelessTV1_540_M23 ${wirelessTV1_540}
keylset wirelessTV1_540_M23 DataMcsIndex 23
keylset wirelessTV1_540_M23 MimoId 3
set wirelessTV1_540_M31 ${wirelessTV1_540}
keylset wirelessTV1_540_M31 DataMcsIndex 31
keylset wirelessTV1_540_M31 MimoId 4

set wirelessTV2_540_M7 ${wirelessTV2_540}
keylset wirelessTV2_540_M7 DataMcsIndex 7
keylset wirelessTV2_540_M7 MimoId 1
set wirelessTV2_540_M15 ${wirelessTV2_540}
keylset wirelessTV2_540_M15 DataMcsIndex 15
keylset wirelessTV2_540_M15 MimoId 2
set wirelessTV2_540_M23 ${wirelessTV2_540}
keylset wirelessTV2_540_M23 DataMcsIndex 23
keylset wirelessTV2_540_M23 MimoId 3
set wirelessTV2_540_M31 ${wirelessTV2_540}
keylset wirelessTV2_540_M31 DataMcsIndex 31
keylset wirelessTV2_540_M31 MimoId 4

set wirelessTV3_540_M7 ${wirelessTV3_540}
keylset wirelessTV3_540_M7 DataMcsIndex 7
keylset wirelessTV3_540_M7 MimoId 1
set wirelessTV3_540_M15 ${wirelessTV3_540}
keylset wirelessTV3_540_M15 DataMcsIndex 15
keylset wirelessTV3_540_M15 MimoId 2
set wirelessTV3_540_M23 ${wirelessTV3_540}
keylset wirelessTV3_540_M23 DataMcsIndex 23
keylset wirelessTV3_540_M23 MimoId 3
set wirelessTV3_540_M31 ${wirelessTV3_540}
keylset wirelessTV3_540_M31 DataMcsIndex 31
keylset wirelessTV3_540_M31 MimoId 4

#580
set wirelessTV1_580_S1_M7 ${wirelessTV1_580}
keylset wirelessTV1_580_S1_M7 NumSpatialStreams 1
set wirelessTV1_580_S2_M7 ${wirelessTV1_580}
keylset wirelessTV1_580_S2_M7 NumSpatialStreams 2
set wirelessTV1_580_S3_M7 ${wirelessTV1_580}
keylset wirelessTV1_580_S3_M7 NumSpatialStreams 3
set wirelessTV1_580_S4_M7 ${wirelessTV1_580}
keylset wirelessTV1_580_S4_M7 NumSpatialStreams 4

set wirelessTV2_580_S1_M7 ${wirelessTV2_580}
keylset wirelessTV2_580_S1_M7 NumSpatialStreams 1
set wirelessTV2_580_S2_M7 ${wirelessTV2_580}
keylset wirelessTV2_580_S2_M7 NumSpatialStreams 2
set wirelessTV2_580_S3_M7 ${wirelessTV2_580}
keylset wirelessTV2_580_S3_M7 NumSpatialStreams 3
set wirelessTV2_580_S4_M7 ${wirelessTV2_580}
keylset wirelessTV2_580_S4_M7 NumSpatialStreams 4

set wirelessTV3_580_S1_M7 ${wirelessTV3_580}
keylset wirelessTV3_580_S1_M7 NumSpatialStreams 1
set wirelessTV3_580_S2_M7 ${wirelessTV3_580}
keylset wirelessTV3_580_S2_M7 NumSpatialStreams 2
set wirelessTV3_580_S3_M7 ${wirelessTV3_580}
keylset wirelessTV3_580_S3_M7 NumSpatialStreams 3
set wirelessTV3_580_S4_M7 ${wirelessTV3_580}
keylset wirelessTV3_580_S4_M7 NumSpatialStreams 4

#Wimix Test Settings
keylset multicast_video Test wimix_script
keylset multicast_video wimixMode Client
keylset multicast_video wimixTestName Multicast\ Video\ Performance
keylset multicast_video testProfile MulticastVideo
keylset multicast_video testProfileImage images/wimix_new.png
keylset multicast_video staggerStart 0
keylset multicast_video totalClientPer 99.0
keylset multicast_video continueFlag 0
keylset multicast_video loadVal 4
keylset multicast_video totalLoadPer 99.0
keylset multicast_video contAdminControlFlag 0
keylset multicast_video loadMode 0
keylset multicast_video loadSweepEnd 25
keylset multicast_video loadSweepStart 4
keylset multicast_video loadSweepStep 3
keylset multicast_video staggerStartInt 1

set MV_24_20_M7 ${multicast_video}
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_M7.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_M7.Percentage 33.0
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_M7.delay 0
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_M7.endTime END
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_M7.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_M7.Percentage 33.0
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_M7.delay 0
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_M7.endTime END
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_M7.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_M7.Percentage 33.0
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_M7.delay 0
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_M7.endTime END
keylset MV_24_20_M7 Source {wirelessTV1_24_M7}
keylset MV_24_20_M7 Destination {wirelessTV2_24_M7 wirelessTV3_24_M7}

set MV_24_20_M15 ${multicast_video}
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_M15.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_M15.Percentage 33.0
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_M15.delay 0
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_M15.endTime END
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_M15.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_M15.Percentage 33.0
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_M15.delay 0
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_M15.endTime END
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_M15.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_M15.Percentage 33.0
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_M15.delay 0
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_M15.endTime END
keylset MV_24_20_M15 Source {wirelessTV1_24_M15}
keylset MV_24_20_M15 Destination {wirelessTV2_24_M15 wirelessTV3_24_M15}

set MV_24_20_M23 ${multicast_video}
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_M23.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_M23.Percentage 33.0
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_M23.delay 0
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_M23.endTime END
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_M23.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_M23.Percentage 33.0
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_M23.delay 0
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_M23.endTime END
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_M23.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_M23.Percentage 33.0
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_M23.delay 0
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_M23.endTime END
keylset MV_24_20_M23 Source {wirelessTV1_24_M23}
keylset MV_24_20_M23 Destination {wirelessTV2_24_M23 wirelessTV3_24_M23}

set MV_24_20_M31 ${multicast_video}
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_M31.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_M31.Percentage 33.0
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_M31.delay 0
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_M31.endTime END
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_M31.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_M31.Percentage 33.0
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_M31.delay 0
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_M31.endTime END
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_M31.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_M31.Percentage 33.0
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_M31.delay 0
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_M31.endTime END
keylset MV_24_20_M31 Source {wirelessTV1_24_M31}
keylset MV_24_20_M31 Destination {wirelessTV2_24_M31 wirelessTV3_24_M31}

set MV_5_40_M7 ${multicast_video}
keylset MV_5_40_M7 ClientMix.wirelessTV1_540_M7.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_40_M7 ClientMix.wirelessTV1_540_M7.Percentage 33.0
keylset MV_5_40_M7 ClientMix.wirelessTV1_540_M7.delay 0
keylset MV_5_40_M7 ClientMix.wirelessTV1_540_M7.endTime END
keylset MV_5_40_M7 ClientMix.wirelessTV2_540_M7.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_40_M7 ClientMix.wirelessTV2_540_M7.Percentage 33.0
keylset MV_5_40_M7 ClientMix.wirelessTV2_540_M7.delay 0
keylset MV_5_40_M7 ClientMix.wirelessTV2_540_M7.endTime END
keylset MV_5_40_M7 ClientMix.wirelessTV3_540_M7.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_40_M7 ClientMix.wirelessTV3_540_M7.Percentage 33.0
keylset MV_5_40_M7 ClientMix.wirelessTV3_540_M7.delay 0
keylset MV_5_40_M7 ClientMix.wirelessTV3_540_M7.endTime END
keylset MV_5_40_M7 Source {wirelessTV1_540_M7}
keylset MV_5_40_M7 Destination {wirelessTV2_540_M7 wirelessTV3_540_M7}

set MV_5_40_M15 ${multicast_video}
keylset MV_5_40_M15 ClientMix.wirelessTV1_540_M15.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_40_M15 ClientMix.wirelessTV1_540_M15.Percentage 33.0
keylset MV_5_40_M15 ClientMix.wirelessTV1_540_M15.delay 0
keylset MV_5_40_M15 ClientMix.wirelessTV1_540_M15.endTime END
keylset MV_5_40_M15 ClientMix.wirelessTV2_540_M15.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_40_M15 ClientMix.wirelessTV2_540_M15.Percentage 33.0
keylset MV_5_40_M15 ClientMix.wirelessTV2_540_M15.delay 0
keylset MV_5_40_M15 ClientMix.wirelessTV2_540_M15.endTime END
keylset MV_5_40_M15 ClientMix.wirelessTV3_540_M15.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_40_M15 ClientMix.wirelessTV3_540_M15.Percentage 33.0
keylset MV_5_40_M15 ClientMix.wirelessTV3_540_M15.delay 0
keylset MV_5_40_M15 ClientMix.wirelessTV3_540_M15.endTime END
keylset MV_5_40_M15 Source {wirelessTV1_540_M15}
keylset MV_5_40_M15 Destination {wirelessTV2_540_M15 wirelessTV3_540_M15}

set MV_5_40_M23 ${multicast_video}
keylset MV_5_40_M23 ClientMix.wirelessTV1_540_M23.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_40_M23 ClientMix.wirelessTV1_540_M23.Percentage 33.0
keylset MV_5_40_M23 ClientMix.wirelessTV1_540_M23.delay 0
keylset MV_5_40_M23 ClientMix.wirelessTV1_540_M23.endTime END
keylset MV_5_40_M23 ClientMix.wirelessTV2_540_M23.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_40_M23 ClientMix.wirelessTV2_540_M23.Percentage 33.0
keylset MV_5_40_M23 ClientMix.wirelessTV2_540_M23.delay 0
keylset MV_5_40_M23 ClientMix.wirelessTV2_540_M23.endTime END
keylset MV_5_40_M23 ClientMix.wirelessTV3_540_M23.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_40_M23 ClientMix.wirelessTV3_540_M23.Percentage 33.0
keylset MV_5_40_M23 ClientMix.wirelessTV3_540_M23.delay 0
keylset MV_5_40_M23 ClientMix.wirelessTV3_540_M23.endTime END
keylset MV_5_40_M23 Source {wirelessTV1_540_M23}
keylset MV_5_40_M23 Destination {wirelessTV2_540_M23 wirelessTV3_540_M23}

set MV_5_40_M31 ${multicast_video}
keylset MV_5_40_M31 ClientMix.wirelessTV1_540_M31.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_40_M31 ClientMix.wirelessTV1_540_M31.Percentage 33.0
keylset MV_5_40_M31 ClientMix.wirelessTV1_540_M31.delay 0
keylset MV_5_40_M31 ClientMix.wirelessTV1_540_M31.endTime END
keylset MV_5_40_M31 ClientMix.wirelessTV2_540_M31.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_40_M31 ClientMix.wirelessTV2_540_M31.Percentage 33.0
keylset MV_5_40_M31 ClientMix.wirelessTV2_540_M31.delay 0
keylset MV_5_40_M31 ClientMix.wirelessTV2_540_M31.endTime END
keylset MV_5_40_M31 ClientMix.wirelessTV3_540_M31.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_40_M31 ClientMix.wirelessTV3_540_M31.Percentage 33.0
keylset MV_5_40_M31 ClientMix.wirelessTV3_540_M31.delay 0
keylset MV_5_40_M31 ClientMix.wirelessTV3_540_M31.endTime END
keylset MV_5_40_M31 Source {wirelessTV1_540_M31}
keylset MV_5_40_M31 Destination {wirelessTV2_540_M31 wirelessTV3_540_M31}


set MV_5_80_S1_M7 ${multicast_video}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_580_S1_M7.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_580_S1_M7.Percentage 33.0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_580_S1_M7.delay 0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_580_S1_M7.endTime END
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_580_S1_M7.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_580_S1_M7.Percentage 33.0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_580_S1_M7.delay 0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_580_S1_M7.endTime END
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_580_S1_M7.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_580_S1_M7.Percentage 33.0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_580_S1_M7.delay 0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_580_S1_M7.endTime END
keylset MV_5_80_S1_M7 Source {wirelessTV1_580_S1_M7}
keylset MV_5_80_S1_M7 Destination {wirelessTV2_580_S1_M7 wirelessTV3_580_S1_M7}

set MV_5_80_S2_M7 ${multicast_video}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_580_S2_M7.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_580_S2_M7.Percentage 33.0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_580_S2_M7.delay 0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_580_S2_M7.endTime END
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_580_S2_M7.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_580_S2_M7.Percentage 33.0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_580_S2_M7.delay 0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_580_S2_M7.endTime END
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_580_S2_M7.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_580_S2_M7.Percentage 33.0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_580_S2_M7.delay 0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_580_S2_M7.endTime END
keylset MV_5_80_S2_M7 Source {wirelessTV1_580_S2_M7}
keylset MV_5_80_S2_M7 Destination {wirelessTV2_580_S2_M7 wirelessTV3_580_S2_M7}

set MV_5_80_S3_M7 ${multicast_video}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_580_S3_M7.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_580_S3_M7.Percentage 33.0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_580_S3_M7.delay 0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_580_S3_M7.endTime END
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_580_S3_M7.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_580_S3_M7.Percentage 33.0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_580_S3_M7.delay 0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_580_S3_M7.endTime END
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_580_S3_M7.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_580_S3_M7.Percentage 33.0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_580_S3_M7.delay 0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_580_S3_M7.endTime END
keylset MV_5_80_S3_M7 Source {wirelessTV1_580_S3_M7}
keylset MV_5_80_S3_M7 Destination {wirelessTV2_580_S3_M7 wirelessTV3_580_S3_M7}

set MV_5_80_S4_M7 ${multicast_video}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_580_S4_M7.TrafficType {IPTV_audio_stream1 IPTV_audio_stream2 IPTV_video_stream1 IPTV_video_stream2}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_580_S4_M7.Percentage 33.0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_580_S4_M7.delay 0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_580_S4_M7.endTime END
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_580_S4_M7.TrafficType {IPTV_audio_stream3 IPTV_audio_stream4 IPTV_video_stream3 IPTV_video_stream4}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_580_S4_M7.Percentage 33.0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_580_S4_M7.delay 0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_580_S4_M7.endTime END
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_580_S4_M7.TrafficType {IPTV_audio_stream5 IPTV_audio_stream6 IPTV_video_stream5 IPTV_video_stream6}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_580_S4_M7.Percentage 33.0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_580_S4_M7.delay 0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_580_S4_M7.endTime END
keylset MV_5_80_S4_M7 Source {wirelessTV1_580_S4_M7}
keylset MV_5_80_S4_M7 Destination {wirelessTV2_580_S4_M7 wirelessTV3_580_S4_M7}

#Traffic Profiles
keylset IPTV_audio_stream WimixtrafficIntendedrate 72
keylset IPTV_audio_stream WimixtrafficFramesize 1500
keylset IPTV_audio_stream WimixtrafficNumFrames 100000000
keylset IPTV_audio_stream WimixtrafficDirection multicast(downlink)
keylset IPTV_audio_stream WimixtrafficServer videoServer
keylset IPTV_audio_stream WimixtrafficipProtocolNum Auto
keylset IPTV_audio_stream WimixtrafficpayData None
keylset IPTV_audio_stream WimixtrafficPhyrate 54
keylset IPTV_audio_stream WimixtrafficpayPattern 0
keylset IPTV_audio_stream WimixtrafficTtl 64
keylset IPTV_audio_stream WimixtrafficRateMode 0
keylset IPTV_audio_stream WimixtrafficType RTPAudio
keylset IPTV_audio_stream WimixtrafficRateBehaviour 0
keylset IPTV_audio_stream Layer4to7rtpAudioCoding 0
keylset IPTV_audio_stream Layer4to7rtpAudioProtocol 0
keylset IPTV_audio_stream Layer4to7SrcPort 24715
keylset IPTV_audio_stream Layer4to7DestPort 34715
keylset IPTV_audio_stream Layer4to7rtpAudioSignaling 0
keylset IPTV_audio_stream MulticastaddripV6Address ff00::01
keylset IPTV_audio_stream MulticastaddripMode 1
keylset IPTV_audio_stream MulticastaddrmacV6Address 33:33:00:00:00:01
keylset IPTV_audio_stream MulticastaddrsrcIpMode 1
keylset IPTV_audio_stream Layer3qosenable 1
keylset IPTV_audio_stream Layer3qosdscp 40
keylset IPTV_audio_stream BurstdataburstDur 5
keylset IPTV_audio_stream BurstdataburstRate 100
keylset IPTV_audio_stream Burstdataibg 5
keylset IPTV_audio_stream Layer2qosenable 1
keylset IPTV_audio_stream Layer2qossurBand 100
keylset IPTV_audio_stream Layer2qosminPhyRate 3
keylset IPTV_audio_stream Layer2qoswlanUp 5
keylset IPTV_audio_stream Layer2qosmDataRate 2048
keylset IPTV_audio_stream Layer2qosethUp 5
keylset IPTV_audio_stream Layer2qostclasIe 0
keylset IPTV_audio_stream Layer2qosmsduSize 128
keylset IPTV_audio_stream Layer2qosadControl 0
keylset IPTV_audio_stream Layer2qosflDir 1
keylset IPTV_audio_stream Layer2qostid 5
keylset IPTV_audio_stream Layer2qostclasUp 0
keylset IPTV_audio_stream Layer2qosclassifier None
keylset IPTV_audio_stream SlaLatency 1000
keylset IPTV_audio_stream SlaJitter 500
keylset IPTV_audio_stream SlaPacketLoss 10

set IPTV_audio_stream1 ${IPTV_audio_stream}
keylset IPTV_audio_stream1 MulticastaddrmacAddress 01:00:5e:01:01:01
keylset IPTV_audio_stream1 MulticastaddripAddress 224.1.1.1
set IPTV_audio_stream2 ${IPTV_audio_stream}
keylset IPTV_audio_stream2 MulticastaddrmacAddress 01:00:5e:01:01:02
keylset IPTV_audio_stream2 MulticastaddripAddress 224.1.1.2
set IPTV_audio_stream3 ${IPTV_audio_stream}
keylset IPTV_audio_stream3 MulticastaddrmacAddress 01:00:5e:01:01:03
keylset IPTV_audio_stream3 MulticastaddripAddress 224.1.1.3
set IPTV_audio_stream4 ${IPTV_audio_stream}
keylset IPTV_audio_stream4 MulticastaddrmacAddress 01:00:5e:01:01:04
keylset IPTV_audio_stream4 MulticastaddripAddress 224.1.1.4
set IPTV_audio_stream5 ${IPTV_audio_stream}
keylset IPTV_audio_stream5 MulticastaddrmacAddress 01:00:5e:01:01:05
keylset IPTV_audio_stream5 MulticastaddripAddress 224.1.1.5
set IPTV_audio_stream6 ${IPTV_audio_stream}
keylset IPTV_audio_stream6 MulticastaddrmacAddress 01:00:5e:01:01:06
keylset IPTV_audio_stream6 MulticastaddripAddress 224.1.1.6

keylset IPTV_video_stream WimixtrafficIntendedrate 1824
keylset IPTV_video_stream WimixtrafficFramesize 1374
keylset IPTV_video_stream WimixtrafficNumFrames 100000000
keylset IPTV_video_stream WimixtrafficDirection multicast(downlink)
keylset IPTV_video_stream WimixtrafficServer videoServer
keylset IPTV_video_stream WimixtrafficipProtocolNum Auto
keylset IPTV_video_stream WimixtrafficpayData None
keylset IPTV_video_stream WimixtrafficPhyrate 54
keylset IPTV_video_stream WimixtrafficpayPattern 0
keylset IPTV_video_stream WimixtrafficTtl 64
keylset IPTV_video_stream WimixtrafficRateMode 1
keylset IPTV_video_stream WimixtrafficType VideoClips
keylset IPTV_video_stream WimixtrafficRateBehaviour 0
keylset IPTV_video_stream Layer4to7rtpVideoCoding 0
keylset IPTV_video_stream Layer4to7rtpVideoProtocol 0
keylset IPTV_video_stream Layer4to7SrcPort 21517
keylset IPTV_video_stream Layer4to7rtpVideoSignaling 0
keylset IPTV_video_stream Layer4to7DestPort 31517
keylset IPTV_video_stream Layer4to7videoClipName HDTV_1080i_19.2_Mbps
keylset IPTV_video_stream MulticastaddripV6Address ff00::10
keylset IPTV_video_stream MulticastaddripMode 1
keylset IPTV_video_stream MulticastaddrmacV6Address 33:33:00:00:00:10
keylset IPTV_video_stream MulticastaddrsrcIpMode 1
keylset IPTV_video_stream Layer3qosenable 1
keylset IPTV_video_stream Layer3qosdscp 56
keylset IPTV_video_stream BurstdataburstDur 5
keylset IPTV_video_stream BurstdataburstRate 100
keylset IPTV_video_stream Burstdataibg 5
keylset IPTV_video_stream Layer2qosenable 1
keylset IPTV_video_stream Layer2qossurBand 100
keylset IPTV_video_stream Layer2qosminPhyRate 3
keylset IPTV_video_stream Layer2qoswlanUp 5
keylset IPTV_video_stream Layer2qosmDataRate 2048
keylset IPTV_video_stream Layer2qosethUp 7
keylset IPTV_video_stream Layer2qostclasIe 0
keylset IPTV_video_stream Layer2qosmsduSize 128
keylset IPTV_video_stream Layer2qosadControl 0
keylset IPTV_video_stream Layer2qosflDir 1
keylset IPTV_video_stream Layer2qostid 5
keylset IPTV_video_stream Layer2qostclasUp 0
keylset IPTV_video_stream Layer2qosclassifier None
keylset IPTV_video_stream SlaDf 50
keylset IPTV_video_stream SlaMlr 1

set IPTV_video_stream1 ${IPTV_video_stream}
keylset IPTV_video_stream1 MulticastaddrmacAddress 01:00:5e:01:01:0a
keylset IPTV_video_stream1 MulticastaddripAddress 224.1.1.10
set IPTV_video_stream2 ${IPTV_video_stream}
keylset IPTV_video_stream2 MulticastaddrmacAddress 01:00:5e:01:01:0b
keylset IPTV_video_stream2 MulticastaddripAddress 224.1.1.11
set IPTV_video_stream3 ${IPTV_video_stream}
keylset IPTV_video_stream3 MulticastaddrmacAddress 01:00:5e:01:01:0c
keylset IPTV_video_stream3 MulticastaddripAddress 224.1.1.12
set IPTV_video_stream4 ${IPTV_video_stream}
keylset IPTV_video_stream4 MulticastaddrmacAddress 01:00:5e:01:01:0d
keylset IPTV_video_stream4 MulticastaddripAddress 224.1.1.13
set IPTV_video_stream5 ${IPTV_video_stream}
keylset IPTV_video_stream5 MulticastaddrmacAddress 01:00:5e:01:01:0e
keylset IPTV_video_stream5 MulticastaddripAddress 224.1.1.14
set IPTV_video_stream6 ${IPTV_video_stream}
keylset IPTV_video_stream6 MulticastaddrmacAddress 01:00:5e:01:01:0f
keylset IPTV_video_stream6 MulticastaddripAddress 224.1.1.15

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
keylset global_config Ports {generic_dut_2 generic_dut_5 generic_dut_eth}

#Generic Dut Definitions


#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion $LANSFW
keylset generic_dut_2 APSWVersion $VENDORFW
keylset generic_dut_2 APModel $VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11ac.RxAttenuation False
keylset generic_dut_2 Interface.802_11ac.ClientBackoff True
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_2 Interface.802_11ac.secChannel 0
keylset generic_dut_2 Interface.802_11ac.Channel $Channel24
keylset generic_dut_2 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_2 WLANSwitchModel $LANSModel

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion $LANSFW
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 Interface.802_11ac.RxAttenuation False
keylset generic_dut_5 Interface.802_11ac.ClientBackoff True
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.secChannel 0
keylset generic_dut_5 Interface.802_11ac.Channel $Channel5
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel $LANSModel

#Generic Dut - generic_dut_eth
keylset generic_dut_eth used False
keylset generic_dut_eth Vendor generic
keylset generic_dut_eth WLANSwitchSWVersion WLAN\ Switch\ SW\ Version\ :@|#^&
keylset generic_dut_eth APSWVersion AP\ SW\ Version\ :@|#^&
keylset generic_dut_eth APModel AP\ Model\ :@|#^&
keylset generic_dut_eth Interface.802_3.BindStatus True
keylset generic_dut_eth Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_eth Interface.802_3.Autonegotiation on
keylset generic_dut_eth Interface.802_3.EthernetSpeed 1000
keylset generic_dut_eth Interface.802_3.Duplex full
keylset generic_dut_eth Interface.802_3.RxAttenuation True
keylset generic_dut_eth Interface.802_3.ClientBackoff True
keylset generic_dut_eth Interface.802_3.InterfaceType 802.3
keylset generic_dut_eth Interface.802_3.secChannel 0
keylset generic_dut_eth WLANSwitchModel WLAN\ Switch\ Model\ :@|#^&

#Client Analysis Profiles

#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

