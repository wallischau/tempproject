
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {}
keylset global_config Destination {}
keylset global_config SourcePort None
keylset global_config DestinationPort None

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

keylset global_config igmpMode 1
keylset global_config dbserverip 127.0.0.1


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
# keylset global_config wimixResultSampleVal 1
# keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 0

#Tests - you may define more than one in a TCL list.
#
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#Group wirelessTV1
keylset wirelessTV BaseIp 192.168.1.10
keylset wirelessTV ChannelModel Bypass
keylset wirelessTV Dut generic_dut_2
keylset wirelessTV EnableAMPDUaggregation 1
keylset wirelessTV EnableAMSDUaggregation 0
keylset wirelessTV EnableIpv6 0
keylset wirelessTV EnableLDPC False
keylset wirelessTV Gateway 192.168.1.1
keylset wirelessTV GratuitousArp True
keylset wirelessTV GroupType 802.11ac
keylset wirelessTV GuardInterval standard
keylset wirelessTV IncrIp Normal
keylset wirelessTV KeepAlive True
keylset wirelessTV ListenInt 10
keylset wirelessTV MacAddress 00:00:01:00:00:01
keylset wirelessTV MacAddressIncr 1
keylset wirelessTV Method {WPA2-PSK}
keylset wirelessTV MgmtPhyRate 24
keylset wirelessTV NumTxAntennas $Num24Antennas
keylset wirelessTV PlcpConfiguration mixed
keylset wirelessTV PskAscii charter123
keylset wirelessTV Qos Enable
keylset wirelessTV RateAdapt 0
keylset wirelessTV Ssid $SSID_24
keylset wirelessTV SubnetMask 255.255.0.0
keylset wirelessTV TransmitDeference 1
keylset wirelessTV Wlan80211eQoSAC 0
keylset wirelessTV phyInterface 802.11n

# wirelessTV1_24_20
set wirelessTV1_24_20_M7 ${wirelessTV}
keylset wirelessTV1_24_20_M7 ChannelBandwidth 20
keylset wirelessTV1_24_20_M7 DataMcsIndex 7
keylset wirelessTV1_24_20_M7 MimoId 2

set wirelessTV1_24_20_M15 ${wirelessTV1_24_20_M7}
keylset wirelessTV1_24_20_M15 DataMcsIndex 15

set wirelessTV1_24_20_M23 ${wirelessTV1_24_20_M7}
keylset wirelessTV1_24_20_M23 DataMcsIndex 23

set wirelessTV1_24_20_M31 ${wirelessTV1_24_20_M7}
keylset wirelessTV1_24_20_M31 DataMcsIndex 31

# wirelessTV1_5_40
set wirelessTV1_5_40_M7 ${wirelessTV}
keylset wirelessTV1_5_40_M7 ChannelBandwidth 40
keylset wirelessTV1_5_40_M7 DataMcsIndex 7
keylset wirelessTV1_5_40_M7 Dhcp Enable
keylset wirelessTV1_5_40_M7 Dut generic_dut_5
keylset wirelessTV1_5_40_M7 GuardInterval short
keylset wirelessTV1_5_40_M7 MimoId 3
keylset wirelessTV1_5_40_M7 NumTxAntennas $Num5Antennas
keylset wirelessTV1_5_40_M7 Ssid $SSID_5

set wirelessTV1_5_40_M15 ${wirelessTV1_5_40_M7}
keylset wirelessTV1_5_40_M15 DataMcsIndex 15

set wirelessTV1_5_40_M23 ${wirelessTV1_5_40_M7}
keylset wirelessTV1_5_40_M23 DataMcsIndex 23

set wirelessTV1_5_40_M31 ${wirelessTV1_5_40_M7}
keylset wirelessTV1_5_40_M31 DataMcsIndex 31

# wirelessTV1_5_80
set wirelessTV1_5_80_S1_M7 ${wirelessTV}
keylset wirelessTV1_5_80_S1_M7 Dhcp Enable
keylset wirelessTV1_5_80_S1_M7 Dut generic_dut_5
keylset wirelessTV1_5_80_S1_M7 EnableMuSuMimo False
keylset wirelessTV1_5_80_S1_M7 GuardInterval short
keylset wirelessTV1_5_80_S1_M7 MimoMode mu-mimo
keylset wirelessTV1_5_80_S1_M7 NumSpatialStreams 1
keylset wirelessTV1_5_80_S1_M7 NumTxAntennas $Num5Antennas
keylset wirelessTV1_5_80_S1_M7 PlcpConfiguration vht_mixed
keylset wirelessTV1_5_80_S1_M7 SigBandwidth 80
keylset wirelessTV1_5_80_S1_M7 Ssid $SSID_5
keylset wirelessTV1_5_80_S1_M7 USDataMcs 7
keylset wirelessTV1_5_80_S1_M7 USManagementMcs 7
keylset wirelessTV1_5_80_S1_M7 VhtDataMcs 7
keylset wirelessTV1_5_80_S1_M7 phyInterface 802.11ac

set wirelessTV1_5_80_S2_M7 ${wirelessTV1_5_80_S1_M7}
keylset wirelessTV1_5_80_S2_M7 NumSpatialStreams 2

set wirelessTV1_5_80_S3_M7 ${wirelessTV1_5_80_S1_M7}
keylset wirelessTV1_5_80_S3_M7 NumSpatialStreams 3

set wirelessTV1_5_80_S4_M7 ${wirelessTV1_5_80_S1_M7}
keylset wirelessTV1_5_80_S4_M7 NumSpatialStreams 4

#Group wirelessTV2
set wirelessTV2_24_20_M7 ${wirelessTV1_24_20_M7}
keylset wirelessTV2_24_20_M7 BaseIp 192.168.3.10
keylset wirelessTV2_24_20_M7 Dhcp Enable
keylset wirelessTV2_24_20_M7 Hops 2
keylset wirelessTV2_24_20_M7 MacAddress 00:00:01:00:02:01

set wirelessTV2_24_20_M15 ${wirelessTV2_24_20_M7}
keylset wirelessTV2_24_20_M15 DataMcsIndex 15

set wirelessTV2_24_20_M23 ${wirelessTV2_24_20_M7}
keylset wirelessTV2_24_20_M23 DataMcsIndex 23

set wirelessTV2_24_20_M31 ${wirelessTV2_24_20_M7}
keylset wirelessTV2_24_20_M31 DataMcsIndex 31

set wirelessTV2_5_40_M7 ${wirelessTV1_5_40_M7}
keylset wirelessTV2_5_40_M7 BaseIp 192.168.3.10
keylset wirelessTV2_5_40_M7 Hops 2
keylset wirelessTV2_5_40_M7 MacAddress 00:00:01:00:02:01

set wirelessTV2_5_40_M15 ${wirelessTV2_5_40_M7}
keylset wirelessTV2_5_40_M15 DataMcsIndex 15

set wirelessTV2_5_40_M23 ${wirelessTV2_5_40_M7}
keylset wirelessTV2_5_40_M23 DataMcsIndex 23

set wirelessTV2_5_40_M31 ${wirelessTV2_5_40_M7}
keylset wirelessTV2_5_40_M31 DataMcsIndex 31

set wirelessTV2_5_80_S1_M7 ${wirelessTV1_5_80_S1_M7}
keylset wirelessTV2_5_80_S1_M7 BaseIp 192.168.3.10
keylset wirelessTV2_5_80_S1_M7 Hops 2
keylset wirelessTV2_5_80_S1_M7 MacAddress 00:00:01:00:02:01

set wirelessTV2_5_80_S2_M7 ${wirelessTV2_5_80_S1_M7}
keylset wirelessTV2_5_80_S2_M7 NumSpatialStreams 2

set wirelessTV2_5_80_S3_M7 ${wirelessTV2_5_80_S1_M7}
keylset wirelessTV2_5_80_S3_M7 NumSpatialStreams 3

set wirelessTV2_5_80_S4_M7 ${wirelessTV2_5_80_S1_M7}
keylset wirelessTV2_5_80_S4_M7 NumSpatialStreams 4

#Group wirelessTV3
set wirelessTV3_24_20_M7 ${wirelessTV1_24_20_M7}
keylset wirelessTV3_24_20_M7 BaseIp 192.168.2.10
keylset wirelessTV3_24_20_M7 Dhcp Enable
keylset wirelessTV3_24_20_M7 Hops 3
keylset wirelessTV3_24_20_M7 MacAddress 00:00:01:00:01:01

set wirelessTV3_24_20_M15 ${wirelessTV3_24_20_M7}
keylset wirelessTV3_24_20_M15 DataMcsIndex 15

set wirelessTV3_24_20_M23 ${wirelessTV3_24_20_M7}
keylset wirelessTV3_24_20_M23 DataMcsIndex 23

set wirelessTV3_24_20_M31 ${wirelessTV3_24_20_M7}
keylset wirelessTV3_24_20_M31 DataMcsIndex 31

set wirelessTV3_5_40_M7 ${wirelessTV1_5_40_M7}
keylset wirelessTV3_5_40_M7 BaseIp 192.168.2.10
keylset wirelessTV3_5_40_M7 Hops 3
keylset wirelessTV3_5_40_M7 MacAddress 00:00:01:00:01:01

set wirelessTV3_5_40_M15 ${wirelessTV3_5_40_M7}
keylset wirelessTV3_5_40_M15 DataMcsIndex 15

set wirelessTV3_5_40_M23 ${wirelessTV3_5_40_M7}
keylset wirelessTV3_5_40_M23 DataMcsIndex 23

set wirelessTV3_5_40_M31 ${wirelessTV3_5_40_M7}
keylset wirelessTV3_5_40_M31 DataMcsIndex 31

set wirelessTV3_5_80_S1_M7 ${wirelessTV1_5_80_S1_M7}
keylset wirelessTV3_5_80_S1_M7 BaseIp 192.168.2.10
keylset wirelessTV3_5_80_S1_M7 Hops 3
keylset wirelessTV3_5_80_S1_M7 MacAddress 00:00:01:00:01:01

set wirelessTV3_5_80_S2_M7 ${wirelessTV3_5_80_S1_M7}
keylset wirelessTV3_5_80_S2_M7 NumSpatialStreams 2

set wirelessTV3_5_80_S3_M7 ${wirelessTV3_5_80_S1_M7}
keylset wirelessTV3_5_80_S3_M7 NumSpatialStreams 3

set wirelessTV3_5_80_S4_M7 ${wirelessTV3_5_80_S1_M7}
keylset wirelessTV3_5_80_S4_M7 NumSpatialStreams 4

#Wimix Test Settings
keylset multicast_video Test wimix_script
keylset multicast_video contAdminControlFlag 1
keylset multicast_video continueFlag 0
keylset multicast_video loadMode 0
keylset multicast_video loadSweepEnd 20
keylset multicast_video loadSweepStart 10
keylset multicast_video loadSweepStep 1
keylset multicast_video loadVal 5
keylset multicast_video staggerStart 0
keylset multicast_video staggerStartInt 1
keylset multicast_video testProfile MulticastVideo
keylset multicast_video testProfileImage images/wimix_new.png
keylset multicast_video totalClientPer 60.0
keylset multicast_video totalLoadPer 60.0
keylset multicast_video wimixMode Client
keylset multicast_video wimixTestName Multicast Video Performance

set MV_24_20_M7 ${multicast_video}
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_20_M7.Percentage 20.0
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_20_M7.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_20_M7.delay 0
keylset MV_24_20_M7 ClientMix.wirelessTV1_24_20_M7.endTime END
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_20_M7.Percentage 20.0
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_20_M7.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream5}
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_20_M7.delay 0
keylset MV_24_20_M7 ClientMix.wirelessTV2_24_20_M7.endTime END
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_20_M7.Percentage 20.0
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_20_M7.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream6}
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_20_M7.delay 0
keylset MV_24_20_M7 ClientMix.wirelessTV3_24_20_M7.endTime END
keylset MV_24_20_M7 Destination {wirelessTV3_24_20_M7 wirelessTV2_24_20_M7}
keylset MV_24_20_M7 Source {wirelessTV1_24_20_M7}

set MV_24_20_M15 ${multicast_video}
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_20_M15.Percentage 20.0
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_20_M15.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_20_M15.delay 0
keylset MV_24_20_M15 ClientMix.wirelessTV1_24_20_M15.endTime END
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_20_M15.Percentage 20.0
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_20_M15.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream5}
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_20_M15.delay 0
keylset MV_24_20_M15 ClientMix.wirelessTV2_24_20_M15.endTime END
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_20_M15.Percentage 20.0
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_20_M15.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream6}
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_20_M15.delay 0
keylset MV_24_20_M15 ClientMix.wirelessTV3_24_20_M15.endTime END
keylset MV_24_20_M15 Destination {wirelessTV3_24_20_M15 wirelessTV2_24_20_M15}
keylset MV_24_20_M15 Source {wirelessTV1_24_20_M15}

set MV_24_20_M23 ${multicast_video}
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_20_M23.Percentage 20.0
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_20_M23.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_20_M23.delay 0
keylset MV_24_20_M23 ClientMix.wirelessTV1_24_20_M23.endTime END
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_20_M23.Percentage 20.0
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_20_M23.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream5}
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_20_M23.delay 0
keylset MV_24_20_M23 ClientMix.wirelessTV2_24_20_M23.endTime END
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_20_M23.Percentage 20.0
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_20_M23.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream6}
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_20_M23.delay 0
keylset MV_24_20_M23 ClientMix.wirelessTV3_24_20_M23.endTime END
keylset MV_24_20_M23 Destination {wirelessTV3_24_20_M23 wirelessTV2_24_20_M23}
keylset MV_24_20_M23 Source {wirelessTV1_24_20_M23}

set MV_24_20_M31 ${multicast_video}
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_20_M31.Percentage 20.0
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_20_M31.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_20_M31.delay 0
keylset MV_24_20_M31 ClientMix.wirelessTV1_24_20_M31.endTime END
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_20_M31.Percentage 20.0
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_20_M31.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream5}
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_20_M31.delay 0
keylset MV_24_20_M31 ClientMix.wirelessTV2_24_20_M31.endTime END
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_20_M31.Percentage 20.0
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_20_M31.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream6}
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_20_M31.delay 0
keylset MV_24_20_M31 ClientMix.wirelessTV3_24_20_M31.endTime END
keylset MV_24_20_M31 Destination {wirelessTV3_24_20_M31 wirelessTV2_24_20_M31}
keylset MV_24_20_M31 Source {wirelessTV1_24_20_M31}

set MV_5_40_M7 ${multicast_video}
keylset MV_5_40_M7 ClientMix.wirelessTV1_5_40_M7.Percentage 20.0
keylset MV_5_40_M7 ClientMix.wirelessTV1_5_40_M7.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_40_M7 ClientMix.wirelessTV1_5_40_M7.delay 0
keylset MV_5_40_M7 ClientMix.wirelessTV1_5_40_M7.endTime END
keylset MV_5_40_M7 ClientMix.wirelessTV2_5_40_M7.Percentage 20.0
keylset MV_5_40_M7 ClientMix.wirelessTV2_5_40_M7.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_40_M7 ClientMix.wirelessTV2_5_40_M7.delay 0
keylset MV_5_40_M7 ClientMix.wirelessTV2_5_40_M7.endTime END
keylset MV_5_40_M7 ClientMix.wirelessTV3_5_40_M7.Percentage 20.0
keylset MV_5_40_M7 ClientMix.wirelessTV3_5_40_M7.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_40_M7 ClientMix.wirelessTV3_5_40_M7.delay 0
keylset MV_5_40_M7 ClientMix.wirelessTV3_5_40_M7.endTime END
keylset MV_5_40_M7 Destination {wirelessTV3_5_40_M7 wirelessTV2_5_40_M7}
keylset MV_5_40_M7 Source {wirelessTV1_5_40_M7}

set MV_5_40_M15 ${multicast_video}
keylset MV_5_40_M15 ClientMix.wirelessTV1_5_40_M15.Percentage 20.0
keylset MV_5_40_M15 ClientMix.wirelessTV1_5_40_M15.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_40_M15 ClientMix.wirelessTV1_5_40_M15.delay 0
keylset MV_5_40_M15 ClientMix.wirelessTV1_5_40_M15.endTime END
keylset MV_5_40_M15 ClientMix.wirelessTV2_5_40_M15.Percentage 20.0
keylset MV_5_40_M15 ClientMix.wirelessTV2_5_40_M15.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_40_M15 ClientMix.wirelessTV2_5_40_M15.delay 0
keylset MV_5_40_M15 ClientMix.wirelessTV2_5_40_M15.endTime END
keylset MV_5_40_M15 ClientMix.wirelessTV3_5_40_M15.Percentage 20.0
keylset MV_5_40_M15 ClientMix.wirelessTV3_5_40_M15.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_40_M15 ClientMix.wirelessTV3_5_40_M15.delay 0
keylset MV_5_40_M15 ClientMix.wirelessTV3_5_40_M15.endTime END
keylset MV_5_40_M15 Destination {wirelessTV3_5_40_M15 wirelessTV2_5_40_M15}
keylset MV_5_40_M15 Source {wirelessTV1_5_40_M15}

set MV_5_40_M23 ${multicast_video}
keylset MV_5_40_M23 ClientMix.wirelessTV1_5_40_M23.Percentage 20.0
keylset MV_5_40_M23 ClientMix.wirelessTV1_5_40_M23.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_40_M23 ClientMix.wirelessTV1_5_40_M23.delay 0
keylset MV_5_40_M23 ClientMix.wirelessTV1_5_40_M23.endTime END
keylset MV_5_40_M23 ClientMix.wirelessTV2_5_40_M23.Percentage 20.0
keylset MV_5_40_M23 ClientMix.wirelessTV2_5_40_M23.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_40_M23 ClientMix.wirelessTV2_5_40_M23.delay 0
keylset MV_5_40_M23 ClientMix.wirelessTV2_5_40_M23.endTime END
keylset MV_5_40_M23 ClientMix.wirelessTV3_5_40_M23.Percentage 20.0
keylset MV_5_40_M23 ClientMix.wirelessTV3_5_40_M23.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_40_M23 ClientMix.wirelessTV3_5_40_M23.delay 0
keylset MV_5_40_M23 ClientMix.wirelessTV3_5_40_M23.endTime END
keylset MV_5_40_M23 Destination {wirelessTV3_5_40_M23 wirelessTV2_5_40_M23}
keylset MV_5_40_M23 Source {wirelessTV1_5_40_M23}

set MV_5_40_M31 ${multicast_video}
keylset MV_5_40_M31 ClientMix.wirelessTV1_5_40_M31.Percentage 20.0
keylset MV_5_40_M31 ClientMix.wirelessTV1_5_40_M31.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_40_M31 ClientMix.wirelessTV1_5_40_M31.delay 0
keylset MV_5_40_M31 ClientMix.wirelessTV1_5_40_M31.endTime END
keylset MV_5_40_M31 ClientMix.wirelessTV2_5_40_M31.Percentage 20.0
keylset MV_5_40_M31 ClientMix.wirelessTV2_5_40_M31.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_40_M31 ClientMix.wirelessTV2_5_40_M31.delay 0
keylset MV_5_40_M31 ClientMix.wirelessTV2_5_40_M31.endTime END
keylset MV_5_40_M31 ClientMix.wirelessTV3_5_40_M31.Percentage 20.0
keylset MV_5_40_M31 ClientMix.wirelessTV3_5_40_M31.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_40_M31 ClientMix.wirelessTV3_5_40_M31.delay 0
keylset MV_5_40_M31 ClientMix.wirelessTV3_5_40_M31.endTime END
keylset MV_5_40_M31 Destination {wirelessTV3_5_40_M31 wirelessTV2_5_40_M31}
keylset MV_5_40_M31 Source {wirelessTV1_5_40_M31}


set MV_5_80_S1_M7 ${multicast_video}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_5_80_S1_M7.Percentage 20.0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_5_80_S1_M7.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_5_80_S1_M7.delay 0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV1_5_80_S1_M7.endTime END
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_5_80_S1_M7.Percentage 20.0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_5_80_S1_M7.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_5_80_S1_M7.delay 0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV2_5_80_S1_M7.endTime END
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_5_80_S1_M7.Percentage 20.0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_5_80_S1_M7.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_5_80_S1_M7.delay 0
keylset MV_5_80_S1_M7 ClientMix.wirelessTV3_5_80_S1_M7.endTime END
keylset MV_5_80_S1_M7 Destination {wirelessTV3_5_80_S1_M7 wirelessTV2_5_80_S1_M7}
keylset MV_5_80_S1_M7 Source {wirelessTV1_5_80_S1_M7}

set MV_5_80_S2_M7 ${multicast_video}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_5_80_S2_M7.Percentage 20.0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_5_80_S2_M7.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_5_80_S2_M7.delay 0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV1_5_80_S2_M7.endTime END
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_5_80_S2_M7.Percentage 20.0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_5_80_S2_M7.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_5_80_S2_M7.delay 0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV2_5_80_S2_M7.endTime END
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_5_80_S2_M7.Percentage 20.0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_5_80_S2_M7.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_5_80_S2_M7.delay 0
keylset MV_5_80_S2_M7 ClientMix.wirelessTV3_5_80_S2_M7.endTime END
keylset MV_5_80_S2_M7 Destination {wirelessTV3_5_80_S2_M7 wirelessTV2_5_80_S2_M7}
keylset MV_5_80_S2_M7 Source {wirelessTV1_5_80_S2_M7}

set MV_5_80_S3_M7 ${multicast_video}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_5_80_S3_M7.Percentage 20.0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_5_80_S3_M7.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_5_80_S3_M7.delay 0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV1_5_80_S3_M7.endTime END
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_5_80_S3_M7.Percentage 20.0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_5_80_S3_M7.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_5_80_S3_M7.delay 0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV2_5_80_S3_M7.endTime END
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_5_80_S3_M7.Percentage 20.0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_5_80_S3_M7.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_5_80_S3_M7.delay 0
keylset MV_5_80_S3_M7 ClientMix.wirelessTV3_5_80_S3_M7.endTime END
keylset MV_5_80_S3_M7 Destination {wirelessTV3_5_80_S3_M7 wirelessTV2_5_80_S3_M7}
keylset MV_5_80_S3_M7 Source {wirelessTV1_5_80_S3_M7}

set MV_5_80_S4_M7 ${multicast_video}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_5_80_S4_M7.Percentage 20.0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_5_80_S4_M7.TrafficType {IPTV_Video_Stream1 IPTV_Video_Stream4}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_5_80_S4_M7.delay 0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV1_5_80_S4_M7.endTime END
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_5_80_S4_M7.Percentage 20.0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_5_80_S4_M7.TrafficType {IPTV_Video_Stream2 IPTV_Video_Stream6}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_5_80_S4_M7.delay 0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV2_5_80_S4_M7.endTime END
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_5_80_S4_M7.Percentage 20.0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_5_80_S4_M7.TrafficType {IPTV_Video_Stream3 IPTV_Video_Stream5}
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_5_80_S4_M7.delay 0
keylset MV_5_80_S4_M7 ClientMix.wirelessTV3_5_80_S4_M7.endTime END
keylset MV_5_80_S4_M7 Destination {wirelessTV3_5_80_S4_M7 wirelessTV2_5_80_S4_M7}
keylset MV_5_80_S4_M7 Source {wirelessTV1_5_80_S4_M7}

#Traffic Profiles
keylset IPTV_Video_Stream BurstdataburstDur 5
keylset IPTV_Video_Stream BurstdataburstRate 100
keylset IPTV_Video_Stream Burstdataibg 5
keylset IPTV_Video_Stream Layer2qosadControl 0
keylset IPTV_Video_Stream Layer2qosclassifier None
keylset IPTV_Video_Stream Layer2qosenable 1
keylset IPTV_Video_Stream Layer2qosethUp 7
keylset IPTV_Video_Stream Layer2qosflDir 1
keylset IPTV_Video_Stream Layer2qosmDataRate 10240
keylset IPTV_Video_Stream Layer2qosminPhyRate 1
keylset IPTV_Video_Stream Layer2qosmsduSize 128
keylset IPTV_Video_Stream Layer2qossurBand 100
keylset IPTV_Video_Stream Layer2qostclasIe 0
keylset IPTV_Video_Stream Layer2qostclasUp 0
keylset IPTV_Video_Stream Layer2qostid 0
keylset IPTV_Video_Stream Layer2qoswlanUp 0
keylset IPTV_Video_Stream Layer3qosdscp 56
keylset IPTV_Video_Stream Layer3qosenable 1
keylset IPTV_Video_Stream Layer4to7rtpVideoCoding 0
keylset IPTV_Video_Stream Layer4to7rtpVideoProtocol 0
keylset IPTV_Video_Stream Layer4to7rtpVideoSignaling 0
keylset IPTV_Video_Stream Layer4to7videoClipName HDTV_1080i_19.2_Mbps
keylset IPTV_Video_Stream MulticastaddripMode 1
keylset IPTV_Video_Stream MulticastaddripV6Address ff00::01
keylset IPTV_Video_Stream MulticastaddrmacV6Address 33:33:00:00:00:01
keylset IPTV_Video_Stream MulticastaddrsrcIpMode 1
keylset IPTV_Video_Stream SlaDf 50
keylset IPTV_Video_Stream SlaMlr 1
keylset IPTV_Video_Stream WimixtrafficDirection multicast(downlink)
keylset IPTV_Video_Stream WimixtrafficEnableIpv6 0
keylset IPTV_Video_Stream WimixtrafficFramesize 1374
keylset IPTV_Video_Stream WimixtrafficIntendedrate 1824
keylset IPTV_Video_Stream WimixtrafficNumFrames 100000000
keylset IPTV_Video_Stream WimixtrafficPhyrate 54
keylset IPTV_Video_Stream WimixtrafficRateBehaviour 0
keylset IPTV_Video_Stream WimixtrafficRateMode 1
keylset IPTV_Video_Stream WimixtrafficServer videoServer
keylset IPTV_Video_Stream WimixtrafficStreamType 0
keylset IPTV_Video_Stream WimixtrafficTtl 64
keylset IPTV_Video_Stream WimixtrafficType VideoClips
keylset IPTV_Video_Stream WimixtrafficipProtocolNum Auto
keylset IPTV_Video_Stream WimixtrafficpayData None
keylset IPTV_Video_Stream WimixtrafficpayPattern 0
keylset IPTV_Video_Stream WimixtraffictcpWinSize 65535

set IPTV_Video_Stream1 ${IPTV_Video_Stream}
keylset IPTV_Video_Stream1 Layer4to7DestPort 31438
keylset IPTV_Video_Stream1 Layer4to7SrcPort 21438
keylset IPTV_Video_Stream1 MulticastaddripAddress 224.1.1.1
keylset IPTV_Video_Stream1 MulticastaddrmacAddress 01:00:5e:01:01:01

set IPTV_Video_Stream2 ${IPTV_Video_Stream}
keylset IPTV_Video_Stream2 Layer4to7DestPort 34365
keylset IPTV_Video_Stream2 Layer4to7SrcPort 24365
keylset IPTV_Video_Stream2 MulticastaddripAddress 224.1.1.2
keylset IPTV_Video_Stream2 MulticastaddrmacAddress 01:00:5e:01:01:02

set IPTV_Video_Stream3 ${IPTV_Video_Stream}
keylset IPTV_Video_Stream3 Layer4to7DestPort 30251
keylset IPTV_Video_Stream3 Layer4to7SrcPort 20251
keylset IPTV_Video_Stream3 MulticastaddripAddress 224.1.1.3
keylset IPTV_Video_Stream3 MulticastaddrmacAddress 01:00:5e:01:01:03

set IPTV_Video_Stream4 ${IPTV_Video_Stream}
keylset IPTV_Video_Stream4 Layer4to7DestPort 30251
keylset IPTV_Video_Stream4 Layer4to7SrcPort 20251
keylset IPTV_Video_Stream4 MulticastaddripAddress 224.1.1.4
keylset IPTV_Video_Stream4 MulticastaddrmacAddress 01:00:5e:01:01:04

set IPTV_Video_Stream5 ${IPTV_Video_Stream}
keylset IPTV_Video_Stream5 Layer4to7DestPort 30251
keylset IPTV_Video_Stream5 Layer4to7SrcPort 20251
keylset IPTV_Video_Stream5 MulticastaddripAddress 224.1.1.5
keylset IPTV_Video_Stream5 MulticastaddrmacAddress 01:00:5e:01:01:05

set IPTV_Video_Stream6 ${IPTV_Video_Stream}
keylset IPTV_Video_Stream6 Layer4to7DestPort 30251
keylset IPTV_Video_Stream6 Layer4to7SrcPort 20251
keylset IPTV_Video_Stream6 MulticastaddripAddress 224.1.1.6
keylset IPTV_Video_Stream6 MulticastaddrmacAddress 01:00:5e:01:01:06


#Server Profiles
keylset videoServer Vlanenable 0
keylset videoServer Vlanid 0
keylset videoServer WimixserverEnableIpv6 0
keylset videoServer WimixserveragentServer None
keylset videoServer WimixserverethPort $Card_Eth
keylset videoServer Wimixservergateway 10.0.0.1
keylset videoServer WimixserveripAddress 10.0.0.3
keylset videoServer WimixserveripMode 1
keylset videoServer WimixserveripV6Mode 0
keylset videoServer WimixservermacAddress 00:00:02:00:00:02
keylset videoServer WimixservermacMode 1
keylset videoServer Wimixservernetmask 255.255.0.0
keylset videoServer WimixserverserverType 0


#Port list for port specific options
keylset global_config Ports {generic_dut_2 generic_dut_5 generic_dut_eth}

#Generic Dut Definitions


#Generic Dut - generic_dut_2
keylset generic_dut_2 APModel $VENDORMODEL
keylset generic_dut_2 APSWVersion $VENDORFW
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.CaptureMode normal
keylset generic_dut_2 Interface.802_11ac.Channel $Channel24
keylset generic_dut_2 Interface.802_11ac.ClientBackoff True
keylset generic_dut_2 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_2 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_2 Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_2 Interface.802_11ac.RxAttenuation False
keylset generic_dut_2 Interface.802_11ac.VkIndex 0
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11ac.portChannelBandwidth -1
keylset generic_dut_2 Interface.802_11ac.secChannel 0
keylset generic_dut_2 Vendor $VENDORNAME
keylset generic_dut_2 WLANSwitchModel WLAN\ Switch\ Model:@|
keylset generic_dut_2 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|
keylset generic_dut_2 used True

#Generic Dut - generic_dut_5
set generic_dut_5 ${generic_dut_2}
keylset generic_dut_5 Interface.802_11ac.Channel $Channel5
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

