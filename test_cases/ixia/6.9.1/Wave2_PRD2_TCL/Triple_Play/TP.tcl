
#Auto-generated from: Tripleplay.wml
#At: 2014-02-19 14:47:50.744000
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {Eth}
keylset global_config Destination {Wifi5}

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
keylset global_config BrandDir G:/WaveAutomation/CharterCommunication_Logo_Color.png
keylset global_config CoBrandFlag True

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 60
keylset global_config TestDurationSec 60
keylset global_config wimixResultSampleVal 1
keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed $random_int
keylset global_config overTimeGraphs 1

#Tests - you may define more than one in a TCL list.
#TriplePlay_24_20 TriplePlay_5_20 TriplePlay_5_40 TriplePlay_5_80
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#Group Client24
keylset Client24 GroupType 802.11abgn
keylset Client24 Dut generic_dut_2

#Group Client24 - Client Options
keylset Client24 ListenInt 10
keylset Client24 Ssid $SSID_24
keylset Client24 Hops -1
keylset Client24 Wlan80211eQoSAC 0
keylset Client24 Dhcp Enable
keylset Client24 RateAdapt 0
keylset Client24 GratuitousArp True
keylset Client24 MacAddress 00:00:01:00:00:01
keylset Client24 PlcpConfiguration mixed
keylset Client24 ChannelBandwidth 20
keylset Client24 EnableAMSDUaggregation 0
keylset Client24 EnableAMPDUaggregation 1
keylset Client24 ChannelModel Bypass
keylset Client24 GuardInterval standard
keylset Client24 DataMcsIndex 15
keylset Client24 EnableIpv6 0
keylset Client24 SubnetMask 255.255.0.0
keylset Client24 KeepAlive True
keylset Client24 MacAddressIncr 1
keylset Client24 NumTxAntennas $Num24Antennas
keylset Client24 Gateway 192.168.1.1
keylset Client24 phyInterface 802.11n
keylset Client24 MgmtPhyRate 24
keylset Client24 Qos Enable
keylset Client24 IncrIp Normal
keylset Client24 TransmitDeference 1
keylset Client24 BaseIp 192.168.1.10

#Group Client24 - Security Options
keylset Client24 Method {WPA2-PSK}
keylset Client24 PskAscii charter123

set data24_M7 ${Client24}
keylset data24_M7 DataMcsIndex 7

set data24_M15 ${Client24}
keylset data24_M15 DataMcsIndex 15

set data24_M23 ${Client24}
keylset data24_M23 DataMcsIndex 23

set data24_M31 ${Client24}
keylset data24_M31 DataMcsIndex 31

set video24_M7 ${Client24}
keylset video24_M7 DataMcsIndex 7

set video24_M15 ${Client24}
keylset video24_M15 DataMcsIndex 15

set video24_M23 ${Client24}
keylset video24_M23 DataMcsIndex 23

set video24_M31 ${Client24}
keylset video24_M31 DataMcsIndex 31

set voice24_M7 ${Client24}
keylset voice24_M7 DataMcsIndex 7

set voice24_M15 ${Client24}
keylset voice24_M15 DataMcsIndex 15

set voice24_M23 ${Client24}
keylset voice24_M23 DataMcsIndex 23

set voice24_M31 ${Client24}
keylset voice24_M31 DataMcsIndex 31


# 5GHz client groups
set Client520 ${Client24}
keylset Client520 Dut generic_dut_5
keylset Client520 Ssid $SSID_5
keylset Client520 ChannelBandwidth 20
keylset Client520 NumTxAntennas $Num5Antennas
keylset Client520 EnableIpv6 0
# keylset Client520 DhcpV6 Enable
set Client540 ${Client520}
keylset Client540 ChannelBandwidth 40
set Client580 ${Client520}
keylset Client580 ChannelBandwidth 80
keylset Client580 phyInterface 802.11ac
keylset Client580 PlcpConfiguration vht_mixed
keylset Client580 VhtDataMcs 9
keylset Client580 USManagementMcs 11
keylset Client580 USDataMcs 9

#540
set data540_M7 ${Client540}
keylset data540_M7 DataMcsIndex 7

set data540_M15 ${Client540}
keylset data540_M15 DataMcsIndex 15

set data540_M23 ${Client540}
keylset data540_M23 DataMcsIndex 23

set data540_M31 ${Client540}
keylset data540_M31 DataMcsIndex 31

set video540_M7 ${Client540}
keylset video540_M7 DataMcsIndex 7

set video540_M15 ${Client540}
keylset video540_M15 DataMcsIndex 15

set video540_M23 ${Client540}
keylset video540_M23 DataMcsIndex 23

set video540_M31 ${Client540}
keylset video540_M31 DataMcsIndex 31

set voice540_M7 ${Client540}
keylset voice540_M7 DataMcsIndex 7

set voice540_M15 ${Client540}
keylset voice540_M15 DataMcsIndex 15

set voice540_M23 ${Client540}
keylset voice540_M23 DataMcsIndex 23

set voice540_M31 ${Client540}
keylset voice540_M31 DataMcsIndex 31

#580
set data580_S1_M9 ${Client580}
keylset data580_S1_M9 NumSpatialStreams 1

set data580_S2_M9 ${Client580}
keylset data580_S2_M9 NumSpatialStreams 2

set data580_S3_M9 ${Client580}
keylset data580_S3_M9 NumSpatialStreams 3

set data580_S4_M9 ${Client580}
keylset data580_S4_M9 NumSpatialStreams 4

set video580_S1_M9 ${Client580}
keylset video580_S1_M9 NumSpatialStreams 1

set video580_S2_M9 ${Client580}
keylset video580_S2_M9 NumSpatialStreams 2

set video580_S3_M9 ${Client580}
keylset video580_S3_M9 NumSpatialStreams 3

set video580_S4_M9 ${Client580}
keylset video580_S4_M9 NumSpatialStreams 4

set voice580_S1_M9 ${Client580}
keylset voice580_S1_M9 NumSpatialStreams 1

set voice580_S2_M9 ${Client580}
keylset voice580_S2_M9 NumSpatialStreams 2

set voice580_S3_M9 ${Client580}
keylset voice580_S3_M9 NumSpatialStreams 3

set voice580_S4_M9 ${Client580}
keylset voice580_S4_M9 NumSpatialStreams 4


#Wimix24 Test Settings
keylset Tripleplay Test wimix_script
keylset Tripleplay wimixMode Client
keylset Tripleplay wimixTestName Layer2/3\ Triple\ Play\ QoS
keylset Tripleplay testProfile Layer2_QoS
keylset Tripleplay testProfileImage images/wimix_new.png
keylset Tripleplay staggerStart 0
keylset Tripleplay totalClientPer 60.0
keylset Tripleplay staggerStartInt 1
keylset Tripleplay loadVal 5
keylset Tripleplay totalLoadPer 60.0
keylset Tripleplay loadMode 0
keylset Tripleplay loadSweepEnd 20
keylset Tripleplay loadSweepStart 10
keylset Tripleplay continueFlag 0
keylset Tripleplay loadSweepStep 1

set TriplePlay_24_20_M7 ${Tripleplay}
keylset TriplePlay_24_20_M7 ClientMix.data24_M7.TrafficType {data}
keylset TriplePlay_24_20_M7 ClientMix.data24_M7.Percentage 20.0
keylset TriplePlay_24_20_M7 ClientMix.data24_M7.delay 0
keylset TriplePlay_24_20_M7 ClientMix.data24_M7.endTime END
keylset TriplePlay_24_20_M7 ClientMix.video24_M7.TrafficType {video}
keylset TriplePlay_24_20_M7 ClientMix.video24_M7.Percentage 20.0
keylset TriplePlay_24_20_M7 ClientMix.video24_M7.delay 20
keylset TriplePlay_24_20_M7 ClientMix.video24_M7.endTime END
keylset TriplePlay_24_20_M7 ClientMix.voice24_M7.TrafficType {voice}
keylset TriplePlay_24_20_M7 ClientMix.voice24_M7.Percentage 20.0
keylset TriplePlay_24_20_M7 ClientMix.voice24_M7.delay 40
keylset TriplePlay_24_20_M7 ClientMix.voice24_M7.endTime END
keylset TriplePlay_24_20_M7 Source {video24_M7}
keylset TriplePlay_24_20_M7 Destination {voice24_M7 data24_M7}

set TriplePlay_24_20_M15 ${Tripleplay}
keylset TriplePlay_24_20_M15 ClientMix.data24_M15.TrafficType {data_24_M15}
keylset TriplePlay_24_20_M15 ClientMix.data24_M15.Percentage 20.0
keylset TriplePlay_24_20_M15 ClientMix.data24_M15.delay 0
keylset TriplePlay_24_20_M15 ClientMix.data24_M15.endTime END
keylset TriplePlay_24_20_M15 ClientMix.video24_M15.TrafficType {video_24_M15}
keylset TriplePlay_24_20_M15 ClientMix.video24_M15.Percentage 20.0
keylset TriplePlay_24_20_M15 ClientMix.video24_M15.delay 20
keylset TriplePlay_24_20_M15 ClientMix.video24_M15.endTime END
keylset TriplePlay_24_20_M15 ClientMix.voice24_M15.TrafficType {voice_24_M15}
keylset TriplePlay_24_20_M15 ClientMix.voice24_M15.Percentage 20.0
keylset TriplePlay_24_20_M15 ClientMix.voice24_M15.delay 40
keylset TriplePlay_24_20_M15 ClientMix.voice24_M15.endTime END
keylset TriplePlay_24_20_M15 Source {video24_M15}
keylset TriplePlay_24_20_M15 Destination {voice24_M15 data24_M15}

set TriplePlay_24_20_M23 ${Tripleplay}
keylset TriplePlay_24_20_M23 ClientMix.data24_M23.TrafficType {data_24_M23}
keylset TriplePlay_24_20_M23 ClientMix.data24_M23.Percentage 20.0
keylset TriplePlay_24_20_M23 ClientMix.data24_M23.delay 0
keylset TriplePlay_24_20_M23 ClientMix.data24_M23.endTime END
keylset TriplePlay_24_20_M23 ClientMix.video24_M23.TrafficType {video_24_M23}
keylset TriplePlay_24_20_M23 ClientMix.video24_M23.Percentage 20.0
keylset TriplePlay_24_20_M23 ClientMix.video24_M23.delay 20
keylset TriplePlay_24_20_M23 ClientMix.video24_M23.endTime END
keylset TriplePlay_24_20_M23 ClientMix.voice24_M23.TrafficType {voice_24_M23}
keylset TriplePlay_24_20_M23 ClientMix.voice24_M23.Percentage 20.0
keylset TriplePlay_24_20_M23 ClientMix.voice24_M23.delay 40
keylset TriplePlay_24_20_M23 ClientMix.voice24_M23.endTime END
keylset TriplePlay_24_20_M23 Source {video24_M23}
keylset TriplePlay_24_20_M23 Destination {voice24_M23 data24_M23}

set TriplePlay_24_20_M31 ${Tripleplay}
keylset TriplePlay_24_20_M31 ClientMix.data24_M31.TrafficType {data_24_M31}
keylset TriplePlay_24_20_M31 ClientMix.data24_M31.Percentage 20.0
keylset TriplePlay_24_20_M31 ClientMix.data24_M31.delay 0
keylset TriplePlay_24_20_M31 ClientMix.data24_M31.endTime END
keylset TriplePlay_24_20_M31 ClientMix.video24_M31.TrafficType {video_24_M31}
keylset TriplePlay_24_20_M31 ClientMix.video24_M31.Percentage 20.0
keylset TriplePlay_24_20_M31 ClientMix.video24_M31.delay 20
keylset TriplePlay_24_20_M31 ClientMix.video24_M31.endTime END
keylset TriplePlay_24_20_M31 ClientMix.voice24_M31.TrafficType {voice_24_M31}
keylset TriplePlay_24_20_M31 ClientMix.voice24_M31.Percentage 20.0
keylset TriplePlay_24_20_M31 ClientMix.voice24_M31.delay 40
keylset TriplePlay_24_20_M31 ClientMix.voice24_M31.endTime END
keylset TriplePlay_24_20_M31 Source {video24_M31}
keylset TriplePlay_24_20_M31 Destination {voice24_M31 data24_M31}

set TriplePlay_5_20 ${Tripleplay}
keylset TriplePlay_5_20 ClientMix.data520.TrafficType {data}
keylset TriplePlay_5_20 ClientMix.data520.Percentage 20.0
keylset TriplePlay_5_20 ClientMix.data520.delay 0
keylset TriplePlay_5_20 ClientMix.data520.endTime END
keylset TriplePlay_5_20 ClientMix.video520.TrafficType {video}
keylset TriplePlay_5_20 ClientMix.video520.Percentage 20.0
keylset TriplePlay_5_20 ClientMix.video520.delay 20
keylset TriplePlay_5_20 ClientMix.video520.endTime END
keylset TriplePlay_5_20 ClientMix.voice520.TrafficType {voice}
keylset TriplePlay_5_20 ClientMix.voice520.Percentage 20.0
keylset TriplePlay_5_20 ClientMix.voice520.delay 40
keylset TriplePlay_5_20 ClientMix.voice520.endTime END
keylset TriplePlay_5_20 Source {video520}
keylset TriplePlay_5_20 Destination {voice520 data520}

set TriplePlay_5_40_M7 ${Tripleplay}
keylset TriplePlay_5_40_M7 ClientMix.data540_M7.TrafficType {data}
keylset TriplePlay_5_40_M7 ClientMix.data540_M7.Percentage 20.0
keylset TriplePlay_5_40_M7 ClientMix.data540_M7.delay 0
keylset TriplePlay_5_40_M7 ClientMix.data540_M7.endTime END
keylset TriplePlay_5_40_M7 ClientMix.video540_M7.TrafficType {video}
keylset TriplePlay_5_40_M7 ClientMix.video540_M7.Percentage 20.0
keylset TriplePlay_5_40_M7 ClientMix.video540_M7.delay 20
keylset TriplePlay_5_40_M7 ClientMix.video540_M7.endTime END
keylset TriplePlay_5_40_M7 ClientMix.voice540_M7.TrafficType {voice}
keylset TriplePlay_5_40_M7 ClientMix.voice540_M7.Percentage 20.0
keylset TriplePlay_5_40_M7 ClientMix.voice540_M7.delay 40
keylset TriplePlay_5_40_M7 ClientMix.voice540_M7.endTime END
keylset TriplePlay_5_40_M7 Source {video540_M7}
keylset TriplePlay_5_40_M7 Destination {voice540_M7 data540_M7}

set TriplePlay_5_40_M15 ${Tripleplay}
keylset TriplePlay_5_40_M15 ClientMix.data540_M15.TrafficType {data_540_M15}
keylset TriplePlay_5_40_M15 ClientMix.data540_M15.Percentage 20.0
keylset TriplePlay_5_40_M15 ClientMix.data540_M15.delay 0
keylset TriplePlay_5_40_M15 ClientMix.data540_M15.endTime END
keylset TriplePlay_5_40_M15 ClientMix.video540_M15.TrafficType {video_540_M15}
keylset TriplePlay_5_40_M15 ClientMix.video540_M15.Percentage 20.0
keylset TriplePlay_5_40_M15 ClientMix.video540_M15.delay 20
keylset TriplePlay_5_40_M15 ClientMix.video540_M15.endTime END
keylset TriplePlay_5_40_M15 ClientMix.voice540_M15.TrafficType {voice_540_M15}
keylset TriplePlay_5_40_M15 ClientMix.voice540_M15.Percentage 20.0
keylset TriplePlay_5_40_M15 ClientMix.voice540_M15.delay 40
keylset TriplePlay_5_40_M15 ClientMix.voice540_M15.endTime END
keylset TriplePlay_5_40_M15 Source {video540_M15}
keylset TriplePlay_5_40_M15 Destination {voice540_M15 data540_M15}

set TriplePlay_5_40_M23 ${Tripleplay}
keylset TriplePlay_5_40_M23 ClientMix.data540_M23.TrafficType {data_540_M23}
keylset TriplePlay_5_40_M23 ClientMix.data540_M23.Percentage 20.0
keylset TriplePlay_5_40_M23 ClientMix.data540_M23.delay 0
keylset TriplePlay_5_40_M23 ClientMix.data540_M23.endTime END
keylset TriplePlay_5_40_M23 ClientMix.video540_M23.TrafficType {video_540_M23}
keylset TriplePlay_5_40_M23 ClientMix.video540_M23.Percentage 20.0
keylset TriplePlay_5_40_M23 ClientMix.video540_M23.delay 20
keylset TriplePlay_5_40_M23 ClientMix.video540_M23.endTime END
keylset TriplePlay_5_40_M23 ClientMix.voice540_M23.TrafficType {voice_540_M23}
keylset TriplePlay_5_40_M23 ClientMix.voice540_M23.Percentage 20.0
keylset TriplePlay_5_40_M23 ClientMix.voice540_M23.delay 40
keylset TriplePlay_5_40_M23 ClientMix.voice540_M23.endTime END
keylset TriplePlay_5_40_M23 Source {video540_M23}
keylset TriplePlay_5_40_M23 Destination {voice540_M23 data540_M23}


set TriplePlay_5_40_M31 ${Tripleplay}
keylset TriplePlay_5_40_M31 ClientMix.data540_M31.TrafficType {data_540_M31}
keylset TriplePlay_5_40_M31 ClientMix.data540_M31.Percentage 20.0
keylset TriplePlay_5_40_M31 ClientMix.data540_M31.delay 0
keylset TriplePlay_5_40_M31 ClientMix.data540_M31.endTime END
keylset TriplePlay_5_40_M31 ClientMix.video540_M31.TrafficType {video_540_M31}
keylset TriplePlay_5_40_M31 ClientMix.video540_M31.Percentage 20.0
keylset TriplePlay_5_40_M31 ClientMix.video540_M31.delay 20
keylset TriplePlay_5_40_M31 ClientMix.video540_M31.endTime END
keylset TriplePlay_5_40_M31 ClientMix.voice540_M31.TrafficType {voice_540_M31}
keylset TriplePlay_5_40_M31 ClientMix.voice540_M31.Percentage 20.0
keylset TriplePlay_5_40_M31 ClientMix.voice540_M31.delay 40
keylset TriplePlay_5_40_M31 ClientMix.voice540_M31.endTime END
keylset TriplePlay_5_40_M31 Source {video540_M31}
keylset TriplePlay_5_40_M31 Destination {voice540_M31 data540_M31}

set TriplePlay_5_80_S1_M9 ${Tripleplay}
keylset TriplePlay_5_80_S1_M9 ClientMix.data580_S1_M9.TrafficType {data}
keylset TriplePlay_5_80_S1_M9 ClientMix.data580_S1_M9.Percentage 20.0
keylset TriplePlay_5_80_S1_M9 ClientMix.data580_S1_M9.delay 0
keylset TriplePlay_5_80_S1_M9 ClientMix.data580_S1_M9.endTime END
keylset TriplePlay_5_80_S1_M9 ClientMix.video580_S1_M9.TrafficType {video}
keylset TriplePlay_5_80_S1_M9 ClientMix.video580_S1_M9.Percentage 20.0
keylset TriplePlay_5_80_S1_M9 ClientMix.video580_S1_M9.delay 20
keylset TriplePlay_5_80_S1_M9 ClientMix.video580_S1_M9.endTime END
keylset TriplePlay_5_80_S1_M9 ClientMix.voice580_S1_M9.TrafficType {voice}
keylset TriplePlay_5_80_S1_M9 ClientMix.voice580_S1_M9.Percentage 20.0
keylset TriplePlay_5_80_S1_M9 ClientMix.voice580_S1_M9.delay 40
keylset TriplePlay_5_80_S1_M9 ClientMix.voice580_S1_M9.endTime END
keylset TriplePlay_5_80_S1_M9 Source {video580_S1_M9}
keylset TriplePlay_5_80_S1_M9 Destination {voice580_S1_M9 data580_S1_M9}

set TriplePlay_5_80_S2_M9 ${Tripleplay}
keylset TriplePlay_5_80_S2_M9 ClientMix.data580_S2_M9.TrafficType {data_580_S2}
keylset TriplePlay_5_80_S2_M9 ClientMix.data580_S2_M9.Percentage 20.0
keylset TriplePlay_5_80_S2_M9 ClientMix.data580_S2_M9.delay 0
keylset TriplePlay_5_80_S2_M9 ClientMix.data580_S2_M9.endTime END
keylset TriplePlay_5_80_S2_M9 ClientMix.video580_S2_M9.TrafficType {video_580_S2}
keylset TriplePlay_5_80_S2_M9 ClientMix.video580_S2_M9.Percentage 20.0
keylset TriplePlay_5_80_S2_M9 ClientMix.video580_S2_M9.delay 20
keylset TriplePlay_5_80_S2_M9 ClientMix.video580_S2_M9.endTime END
keylset TriplePlay_5_80_S2_M9 ClientMix.voice580_S2_M9.TrafficType {voice_580_S2}
keylset TriplePlay_5_80_S2_M9 ClientMix.voice580_S2_M9.Percentage 20.0
keylset TriplePlay_5_80_S2_M9 ClientMix.voice580_S2_M9.delay 40
keylset TriplePlay_5_80_S2_M9 ClientMix.voice580_S2_M9.endTime END
keylset TriplePlay_5_80_S2_M9 Source {video580_S2_M9}
keylset TriplePlay_5_80_S2_M9 Destination {voice580_S2_M9 data580_S2_M9}

set TriplePlay_5_80_S3_M9 ${Tripleplay}
keylset TriplePlay_5_80_S3_M9 ClientMix.data580_S3_M9.TrafficType {data_580_S3}
keylset TriplePlay_5_80_S3_M9 ClientMix.data580_S3_M9.Percentage 20.0
keylset TriplePlay_5_80_S3_M9 ClientMix.data580_S3_M9.delay 0
keylset TriplePlay_5_80_S3_M9 ClientMix.data580_S3_M9.endTime END
keylset TriplePlay_5_80_S3_M9 ClientMix.video580_S3_M9.TrafficType {video_580_S3}
keylset TriplePlay_5_80_S3_M9 ClientMix.video580_S3_M9.Percentage 20.0
keylset TriplePlay_5_80_S3_M9 ClientMix.video580_S3_M9.delay 20
keylset TriplePlay_5_80_S3_M9 ClientMix.video580_S3_M9.endTime END
keylset TriplePlay_5_80_S3_M9 ClientMix.voice580_S3_M9.TrafficType {voice_580_S3}
keylset TriplePlay_5_80_S3_M9 ClientMix.voice580_S3_M9.Percentage 20.0
keylset TriplePlay_5_80_S3_M9 ClientMix.voice580_S3_M9.delay 40
keylset TriplePlay_5_80_S3_M9 ClientMix.voice580_S3_M9.endTime END
keylset TriplePlay_5_80_S3_M9 Source {video580_S3_M9}
keylset TriplePlay_5_80_S3_M9 Destination {voice580_S3_M9 data580_S3_M9}

set TriplePlay_5_80_S4_M9 ${Tripleplay}
keylset TriplePlay_5_80_S4_M9 ClientMix.data580_S4_M9.TrafficType {data_580_S4}
keylset TriplePlay_5_80_S4_M9 ClientMix.data580_S4_M9.Percentage 20.0
keylset TriplePlay_5_80_S4_M9 ClientMix.data580_S4_M9.delay 0
keylset TriplePlay_5_80_S4_M9 ClientMix.data580_S4_M9.endTime END
keylset TriplePlay_5_80_S4_M9 ClientMix.video580_S4_M9.TrafficType {video_580_S4}
keylset TriplePlay_5_80_S4_M9 ClientMix.video580_S4_M9.Percentage 20.0
keylset TriplePlay_5_80_S4_M9 ClientMix.video580_S4_M9.delay 20
keylset TriplePlay_5_80_S4_M9 ClientMix.video580_S4_M9.endTime END
keylset TriplePlay_5_80_S4_M9 ClientMix.voice580_S4_M9.TrafficType {voice_580_S4}
keylset TriplePlay_5_80_S4_M9 ClientMix.voice580_S4_M9.Percentage 20.0
keylset TriplePlay_5_80_S4_M9 ClientMix.voice580_S4_M9.delay 40
keylset TriplePlay_5_80_S4_M9 ClientMix.voice580_S4_M9.endTime END
keylset TriplePlay_5_80_S4_M9 Source {video580_S4_M9}
keylset TriplePlay_5_80_S4_M9 Destination {voice580_S4_M9 data580_S4_M9}


#Traffic Profiles


keylset data WimixtrafficDirection downlink
keylset data WimixtrafficIntendedrate 30000
keylset data WimixtrafficFramesize 1500
keylset data WimixtrafficNumFrames 100000000
keylset data WimixtrafficpayData None
keylset data WimixtrafficServer server
keylset data WimixtrafficipProtocolNum Auto
keylset data WimixtrafficPhyrate 54
keylset data WimixtrafficpayPattern 0
keylset data WimixtrafficTtl 64
keylset data WimixtrafficRateMode 0
keylset data WimixtrafficType UDP
keylset data WimixtrafficRateBehaviour 0
keylset data Layer4to7SrcPort 21020
keylset data Layer4to7DestPort 31020
keylset data Layer3qosenable 1
keylset data Layer3qosdscp 0
keylset data BurstdataburstDur 5
keylset data BurstdataburstRate 100
keylset data Burstdataibg 5
keylset data Layer2qosenable 1
keylset data Layer2qossurBand 100
keylset data Layer2qosminPhyRate 1
keylset data Layer2qoswlanUp 0
keylset data Layer2qosmDataRate 10240
keylset data Layer2qosethUp 0
keylset data Layer2qostclasIe 0
keylset data Layer2qosmsduSize 128
keylset data Layer2qosadControl 0
keylset data Layer2qosflDir 1
keylset data Layer2qostid 0
keylset data Layer2qostclasUp 0
keylset data Layer2qosclassifier None
keylset data SlaLatency 1000
keylset data SlaJitter 500
keylset data SlaPacketLoss 50

set data_24_M15 ${data}
keylset data_24_M15 WimixtrafficIntendedrate 50000
set data_24_M23 ${data}
keylset data_24_M23 WimixtrafficIntendedrate 65000
set data_24_M31 ${data}
keylset data_24_M31 WimixtrafficIntendedrate 80000

set data_540_M15 ${data}
keylset data_540_M15 WimixtrafficIntendedrate 100000
set data_540_M23 ${data}
keylset data_540_M23 WimixtrafficIntendedrate 150000
set data_540_M31 ${data}
keylset data_540_M31 WimixtrafficIntendedrate 200000

set data_580_S2 ${data}
keylset data_580_S2 WimixtrafficIntendedrate 300000
set data_580_S3 ${data}
keylset data_580_S3 WimixtrafficIntendedrate 350000
set data_580_S4 ${data}
keylset data_580_S4 WimixtrafficIntendedrate 400000



keylset voice WimixtrafficDirection downlink
keylset voice WimixtrafficIntendedrate 30000
keylset voice WimixtrafficFramesize 1500
keylset voice WimixtrafficNumFrames 100000000
keylset voice WimixtrafficpayData None
keylset voice WimixtrafficServer server
keylset voice WimixtrafficipProtocolNum Auto
keylset voice WimixtrafficPhyrate 54
keylset voice WimixtrafficRateBehaviour 0
keylset voice WimixtrafficTtl 64
keylset voice WimixtrafficRateMode 0
keylset voice WimixtrafficType UDP
keylset voice WimixtrafficpayPattern 0
keylset voice Layer4to7SrcPort 21517
keylset voice Layer4to7DestPort 31517
keylset voice Layer3qosenable 1
keylset voice Layer3qosdscp 56
keylset voice BurstdataburstDur 5
keylset voice BurstdataburstRate 100
keylset voice Burstdataibg 5
keylset voice Layer2qosenable 1
keylset voice Layer2qossurBand 100
keylset voice Layer2qosminPhyRate 1
keylset voice Layer2qoswlanUp 0
keylset voice Layer2qosmDataRate 10240
keylset voice Layer2qosethUp 7
keylset voice Layer2qostclasIe 0
keylset voice Layer2qosmsduSize 128
keylset voice Layer2qosadControl 0
keylset voice Layer2qosflDir 1
keylset voice Layer2qostid 0
keylset voice Layer2qostclasUp 0
keylset voice Layer2qosclassifier None
keylset voice SlaLatency 50
keylset voice SlaJitter 20
keylset voice SlaPacketLoss 1

set voice_24_M15 ${voice}
keylset voice_24_M15 WimixtrafficIntendedrate 50000
set voice_24_M23 ${voice}
keylset voice_24_M23 WimixtrafficIntendedrate 65000
set voice_24_M31 ${voice}
keylset voice_24_M31 WimixtrafficIntendedrate 80000

set voice_540_M15 ${voice}
keylset voice_540_M15 WimixtrafficIntendedrate 100000
set voice_540_M23 ${voice}
keylset voice_540_M23 WimixtrafficIntendedrate 150000
set voice_540_M31 ${voice}
keylset voice_540_M31 WimixtrafficIntendedrate 200000

set voice_580_S2 ${voice}
keylset voice_580_S2 WimixtrafficIntendedrate 300000
set voice_580_S3 ${voice}
keylset voice_580_S3 WimixtrafficIntendedrate 350000
set voice_580_S4 ${voice}
keylset voice_580_S4 WimixtrafficIntendedrate 400000


keylset video WimixtrafficDirection downlink
keylset video WimixtrafficIntendedrate 30000
keylset video WimixtrafficFramesize 1500
keylset video WimixtrafficNumFrames 100000000
keylset video WimixtrafficpayData None
keylset video WimixtrafficServer server
keylset video WimixtrafficipProtocolNum Auto
keylset video WimixtrafficPhyrate 54
keylset video WimixtrafficRateBehaviour 0
keylset video WimixtrafficTtl 64
keylset video WimixtrafficRateMode 0
keylset video WimixtrafficType UDP
keylset video WimixtrafficpayPattern 0
keylset video Layer4to7SrcPort 21418
keylset video Layer4to7DestPort 31418
keylset video Layer3qosenable 1
keylset video Layer3qosdscp 40
keylset video BurstdataburstDur 5
keylset video BurstdataburstRate 100
keylset video Burstdataibg 5
keylset video Layer2qosenable 1
keylset video Layer2qossurBand 100
keylset video Layer2qosminPhyRate 1
keylset video Layer2qoswlanUp 0
keylset video Layer2qosmDataRate 10240
keylset video Layer2qosethUp 5
keylset video Layer2qostclasIe 0
keylset video Layer2qosmsduSize 128
keylset video Layer2qosadControl 0
keylset video Layer2qosflDir 1
keylset video Layer2qostid 0
keylset video Layer2qostclasUp 0
keylset video Layer2qosclassifier None
keylset video SlaLatency 1000
keylset video SlaJitter 500
keylset video SlaPacketLoss 10

set video_24_M15 ${video}
keylset video_24_M15 WimixtrafficIntendedrate 50000
set video_24_M23 ${video}
keylset video_24_M23 WimixtrafficIntendedrate 65000
set video_24_M31 ${video}
keylset video_24_M31 WimixtrafficIntendedrate 80000

set video_540_M15 ${video}
keylset video_540_M15 WimixtrafficIntendedrate 100000
set video_540_M23 ${video}
keylset video_540_M23 WimixtrafficIntendedrate 150000
set video_540_M31 ${video}
keylset video_540_M31 WimixtrafficIntendedrate 200000

set video_580_S2 ${video}
keylset video_580_S2 WimixtrafficIntendedrate 300000
set video_580_S3 ${video}
keylset video_580_S3 WimixtrafficIntendedrate 350000
set video_580_S4 ${video}
keylset video_580_S4 WimixtrafficIntendedrate 400000



#Server Profiles


keylset server WimixservermacAddress 00:00:02:00:00:02
keylset server WimixserverethPort $Card_Eth
keylset server WimixserverEnableIpv6 0
keylset server WimixserverserverType 0
keylset server WimixserveripMode 0
keylset server Wimixservernetmask 255.255.0.0
keylset server WimixservermacMode 1
keylset server WimixserveragentServer None
keylset server WimixserveripV6Mode 0
keylset server WimixserveripAddress 192.168.1.201
keylset server Wimixservergateway 192.168.1.1
keylset server Vlanenable 0
keylset server Vlanid 0

#Port list for port specific options
keylset global_config Ports {generic_dut_2 generic_dut_5}


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
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11ac
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
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.secChannel 0
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$LANSModel


#Client Analysis Profiles

#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

