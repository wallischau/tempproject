keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {11a_54 11a_6 11n_540_M15 11n_540_M23 11n_540_M7 11n_520_M7 11n_520_M15 11n_520_M23 11n_580_M9-1 11n_580_M9-2 11n_580_M9-3}
keylset global_config Destination {11g_54 11g_6 11n_24_M15 11n_24_M7}

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
# Num Of Antenna Changes
# set NUM_TX_ANTENNAS numOfTxAntennas
# keylset WiFi2 NumTxAntennas $NUM_TX_ANTENNAS
# keylset WiFi5 NumTxAntennas $NUM_TX_ANTENNAS
# keylset global_config NumTxAntennas $NUM_TX_ANTENNAS

#Connection Global Options
# Num Of Antenna Changes
# set NUM_TX_ANTENNAS numOfTxAntennas
# keylset WiFi2 NumTxAntennas $NUM_TX_ANTENNAS
# keylset WiFi5 NumTxAntennas $NUM_TX_ANTENNAS
# keylset global_config NumTxAntennas $NUM_TX_ANTENNAS

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
keylset global_config BrandDir G:/WaveAutomation/CharterCommunication_Logo_Color.png
keylset global_config CoBrandFlag True
keylset global_config dbserverip 127.0.0.1

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 30
keylset global_config TestDurationSec 30
keylset global_config SettleTime 5
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed $random_int
keylset global_config overTimeGraphs 0

#Tests - you may define more than one in a TCL list.

#Complete List MC_24_20_C4 MC_5_20_C4 MC_5_40_C6 MC_5_80_C6
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0


#Group 11g_54
keylset 11g_54 GroupType 802.11abgn
keylset 11g_54 Dut generic_dut_1

#Group 11g_54 - Client Options
keylset 11g_54 ListenInt 10
keylset 11g_54 Ssid $SSID_24
keylset 11g_54 Hops 0
keylset 11g_54 Wlan80211eQoSAC 0
keylset 11g_54 Dhcp Enable
keylset 11g_54 RateAdapt 0
keylset 11g_54 GratuitousArp True
keylset 11g_54 MacAddress 00:00:01:00:02:01
keylset 11g_54 EnableIpv6 0
keylset 11g_54 SubnetMask 255.255.0.0
keylset 11g_54 KeepAlive True
keylset 11g_54 MacAddressIncr 1
keylset 11g_54 NumTxAntennas $Num24Antennas
keylset 11g_54 DistId 3
keylset 11g_54 Gateway 192.168.1.1
keylset 11g_54 phyInterface 802.11ag
keylset 11g_54 MgmtPhyRate 54
keylset 11g_54 Qos Enable
keylset 11g_54 IncrIp Normal
keylset 11g_54 TransmitDeference 1
keylset 11g_54 BaseIp 192.168.3.10

#Group 11g_54 - Security Options
keylset 11g_54 Method {WPA2-PSK}
keylset 11g_54 PskAscii charter123

set 11g_6 ${11g_54}
keylset 11g_6 DataPhyRate 6
keylset 11g_6 MgmtPhyRate 6




#Group 11n_24_M15
keylset 11n_24_M15 GroupType 802.11abgn
keylset 11n_24_M15 Dut generic_dut_1

#Group 11n_24_M15 - Client Options
keylset 11n_24_M15 ListenInt 10
keylset 11n_24_M15 Ssid $SSID_24
keylset 11n_24_M15 Wlan80211eQoSAC 0
keylset 11n_24_M15 Dhcp Enable
keylset 11n_24_M15 RateAdapt 0
keylset 11n_24_M15 GratuitousArp True
keylset 11n_24_M15 MacAddress 00:00:01:00:00:01
keylset 11n_24_M15 PlcpConfiguration mixed
keylset 11n_24_M15 ChannelBandwidth 20
keylset 11n_24_M15 EnableAMPDUaggregation 1
keylset 11n_24_M15 ChannelModel Bypass
keylset 11n_24_M15 GuardInterval standard
keylset 11n_24_M15 DataMcsIndex 15
keylset 11n_24_M15 EnableIpv6 0
keylset 11n_24_M15 SubnetMask 255.255.0.0
keylset 11n_24_M15 KeepAlive True
keylset 11n_24_M15 MacAddressIncr 1
keylset 11n_24_M15 NumTxAntennas $Num24Antennas
keylset 11n_24_M15 DistId 3
keylset 11n_24_M15 Gateway 192.168.1.1
keylset 11n_24_M15 phyInterface 802.11n
keylset 11n_24_M15 MgmtPhyRate 24
keylset 11n_24_M15 Qos Enable
keylset 11n_24_M15 IncrIp Normal
keylset 11n_24_M15 TransmitDeference 1
keylset 11n_24_M15 BaseIp 192.168.1.10

#Group 11n_24_M15 - Security Options
keylset 11n_24_M15 Method {WPA2-PSK}
keylset 11n_24_M15 PskAscii charter123

set 11n_24_M7 ${11n_24_M15}
keylset 11n_24_M7 DataMcsIndex 7




#Group 11a_54
keylset 11a_54 GroupType 802.11abgn
keylset 11a_54 Dut generic_dut_0

#Group 11a_54 - Client Options
keylset 11a_54 ListenInt 10
keylset 11a_54 Ssid $SSID_5
keylset 11a_54 Hops 0
keylset 11a_54 Wlan80211eQoSAC 0
keylset 11a_54 Dhcp Enable
keylset 11a_54 RateAdapt 0
keylset 11a_54 GratuitousArp True
keylset 11a_54 MacAddress 00:00:01:00:02:01
keylset 11a_54 EnableIpv6 0
keylset 11a_54 SubnetMask 255.255.0.0
keylset 11a_54 KeepAlive True
keylset 11a_54 MacAddressIncr 1
keylset 11a_54 NumTxAntennas $Num5Antennas
keylset 11a_54 DistId 3
keylset 11a_54 Gateway 192.168.1.1
keylset 11a_54 phyInterface 802.11ag
keylset 11a_54 MgmtPhyRate 54
keylset 11a_54 Qos Enable
keylset 11a_54 IncrIp Normal
keylset 11a_54 TransmitDeference 1
keylset 11a_54 BaseIp 192.168.3.10

#Group 11a_54 - Security Options
keylset 11a_54 Method {WPA2-PSK}
keylset 11a_54 PskAscii charter123

set 11a_6 ${11a_54}
keylset 11a_6 DataPhyRate 6
keylset 11a_6 MgmtPhyRate 6


#Group 11n_540_M15
keylset 11n_540_M15 GroupType 802.11ac
keylset 11n_540_M15 Dut generic_dut_0

#Group 11n_540_M15 - Client Options
keylset 11n_540_M15 ListenInt 10
keylset 11n_540_M15 Ssid $SSID_5
keylset 11n_540_M15 Wlan80211eQoSAC 0
keylset 11n_540_M15 Dhcp Enable
keylset 11n_540_M15 RateAdapt 0
keylset 11n_540_M15 GratuitousArp True
keylset 11n_540_M15 MacAddress 00:00:01:00:00:01
keylset 11n_540_M15 PlcpConfiguration mixed
keylset 11n_540_M15 ChannelBandwidth 40
keylset 11n_540_M15 EnableAMPDUaggregation 1
keylset 11n_540_M15 ChannelModel Bypass
keylset 11n_540_M15 GuardInterval standard
keylset 11n_540_M15 DataMcsIndex 15
keylset 11n_540_M15 EnableIpv6 0
keylset 11n_540_M15 SubnetMask 255.255.0.0
keylset 11n_540_M15 KeepAlive True
keylset 11n_540_M15 MacAddressIncr 1
keylset 11n_540_M15 NumTxAntennas $Num5Antennas
keylset 11n_540_M15 DistId 3
keylset 11n_540_M15 Gateway 192.168.1.1
keylset 11n_540_M15 phyInterface 802.11n
keylset 11n_540_M15 MgmtPhyRate 24
keylset 11n_540_M15 Qos Enable
keylset 11n_540_M15 IncrIp Normal
keylset 11n_540_M15 TransmitDeference 1
keylset 11n_540_M15 BaseIp 192.168.1.10

#Group 11n_540_M15 - Security Options
keylset 11n_540_M15 Method {WPA2-PSK}
keylset 11n_540_M15 PskAscii charter123

set 11n_540_M23 ${11n_540_M15}
keylset 11n_540_M23 ChannelBandwidth 40
keylset 11n_540_M23 DataMcsIndex 23

set 11n_540_M7 ${11n_540_M15}
keylset 11n_540_M7 ChannelBandwidth 40
keylset 11n_540_M7 DataMcsIndex 7

set 11n_520_M7 ${11n_540_M15}
keylset 11n_520_M7 ChannelBandwidth 20
keylset 11n_520_M7 DataMcsIndex 7

set 11n_520_M15 ${11n_540_M15}
keylset 11n_520_M15 ChannelBandwidth 20
keylset 11n_520_M15 DataMcsIndex 15

set 11n_520_M23 ${11n_540_M15}
keylset 11n_520_M23 ChannelBandwidth 20
keylset 11n_520_M23 DataMcsIndex 23

set Wifi5_80 ${11n_540_M15}
keylset Wifi5_80 ChannelBandwidth 80
keylset Wifi5_80 phyInterface 802.11ac
keylset Wifi5_80 PlcpConfiguration vht_mixed

set 11n_580_M9-1 ${Wifi5_80}
keylset 11n_580_M9-1 VhtDataMcs 9
keylset 11n_580_M9-1 NumSpatialStreams 1

set 11n_580_M9-2 ${Wifi5_80}
keylset 11n_580_M9-2 VhtDataMcs 9
keylset 11n_580_M9-2 NumSpatialStreams 2

set 11n_580_M9-3 ${Wifi5_80}
keylset 11n_580_M9-3 VhtDataMcs 9
keylset 11n_580_M9-3 NumSpatialStreams 3


#Wimix Test Settings
keylset Mixed_Clients Test wimix_script
keylset Mixed_Clients wimixMode Client
keylset Mixed_Clients wimixTestName 802.11b/g/n\ Mixed\ Clients
keylset Mixed_Clients testProfile MixedClients
keylset Mixed_Clients testProfileImage images/wimix_new.png
keylset Mixed_Clients totalClientPer 80.0
keylset Mixed_Clients staggerStartInt 1
keylset Mixed_Clients loadVal 5
keylset Mixed_Clients totalLoadPer 80.0
keylset Mixed_Clients contAdminControlFlag 1
keylset Mixed_Clients loadMode 0
keylset Mixed_Clients loadSweepEnd 20
keylset Mixed_Clients loadSweepStart 10
keylset Mixed_Clients continueFlag 0
keylset Mixed_Clients staggerStart 0
keylset Mixed_Clients loadSweepStep 1

set MC_24_20_C4 ${Mixed_Clients}
keylset MC_24_20_C4 ClientMix.11n_24_M15.TrafficType {UDPTraffic}
keylset MC_24_20_C4 ClientMix.11n_24_M15.Percentage 20.0
keylset MC_24_20_C4 ClientMix.11n_24_M15.delay 0
keylset MC_24_20_C4 ClientMix.11n_24_M15.endTime END
keylset MC_24_20_C4 ClientMix.11n_24_M7.TrafficType {UDPTraffic}
keylset MC_24_20_C4 ClientMix.11n_24_M7.Percentage 20.0
keylset MC_24_20_C4 ClientMix.11n_24_M7.delay 0
keylset MC_24_20_C4 ClientMix.11n_24_M7.endTime END
keylset MC_24_20_C4 ClientMix.11g_54.TrafficType {UDPTraffic}
keylset MC_24_20_C4 ClientMix.11g_54.Percentage 20.0
keylset MC_24_20_C4 ClientMix.11g_54.delay 0
keylset MC_24_20_C4 ClientMix.11g_54.endTime END
keylset MC_24_20_C4 ClientMix.11g_6.TrafficType {UDPTraffic}
keylset MC_24_20_C4 ClientMix.11g_6.Percentage 20.0
keylset MC_24_20_C4 ClientMix.11g_6.delay 0
keylset MC_24_20_C4 ClientMix.11g_6.endTime END
keylset MC_24_20_C4 Source {11n_24_M15}
keylset MC_24_20_C4 Destination {11n_24_M7 11g_6 11g_54}

set MC_5_20_C4 ${Mixed_Clients}
keylset MC_5_20_C4 ClientMix.11n_520_M15.TrafficType {UDPTraffic}
keylset MC_5_20_C4 ClientMix.11n_520_M15.Percentage 20.0
keylset MC_5_20_C4 ClientMix.11n_520_M15.delay 0
keylset MC_5_20_C4 ClientMix.11n_520_M15.endTime END
keylset MC_5_20_C4 ClientMix.11n_520_M7.TrafficType {UDPTraffic}
keylset MC_5_20_C4 ClientMix.11n_520_M7.Percentage 20.0
keylset MC_5_20_C4 ClientMix.11n_520_M7.delay 0
keylset MC_5_20_C4 ClientMix.11n_520_M7.endTime END
keylset MC_5_20_C4 ClientMix.11a_54.TrafficType {UDPTraffic}
keylset MC_5_20_C4 ClientMix.11a_54.Percentage 20.0
keylset MC_5_20_C4 ClientMix.11a_54.delay 0
keylset MC_5_20_C4 ClientMix.11a_54.endTime END
keylset MC_5_20_C4 ClientMix.11a_6.TrafficType {UDPTraffic}
keylset MC_5_20_C4 ClientMix.11a_6.Percentage 20.0
keylset MC_5_20_C4 ClientMix.11a_6.delay 0
keylset MC_5_20_C4 ClientMix.11a_6.endTime END
keylset MC_5_20_C4 Source {11n_520_M15}
keylset MC_5_20_C4 Destination {11n_520_M7 11a_6 11a_54}

set MC_5_40_C6 ${Mixed_Clients}
keylset MC_5_40_C6 ClientMix.11n_520_M15.TrafficType {UDPTraffic}
keylset MC_5_40_C6 ClientMix.11n_520_M15.Percentage 20.0
keylset MC_5_40_C6 ClientMix.11n_520_M15.delay 0
keylset MC_5_40_C6 ClientMix.11n_520_M15.endTime END
keylset MC_5_40_C6 ClientMix.11n_520_M7.TrafficType {UDPTraffic}
keylset MC_5_40_C6 ClientMix.11n_520_M7.Percentage 20.0
keylset MC_5_40_C6 ClientMix.11n_520_M7.delay 0
keylset MC_5_40_C6 ClientMix.11n_520_M7.endTime END
keylset MC_5_40_C6 ClientMix.11a_54.TrafficType {UDPTraffic}
keylset MC_5_40_C6 ClientMix.11a_54.Percentage 20.0
keylset MC_5_40_C6 ClientMix.11a_54.delay 0
keylset MC_5_40_C6 ClientMix.11a_54.endTime END
keylset MC_5_40_C6 ClientMix.11a_6.TrafficType {UDPTraffic}
keylset MC_5_40_C6 ClientMix.11a_6.Percentage 20.0
keylset MC_5_40_C6 ClientMix.11a_6.delay 0
keylset MC_5_40_C6 ClientMix.11a_6.endTime END
keylset MC_5_40_C6 ClientMix.11n_540_M15.TrafficType {UDPTraffic}
keylset MC_5_40_C6 ClientMix.11n_540_M15.Percentage 20.0
keylset MC_5_40_C6 ClientMix.11n_540_M15.delay 0
keylset MC_5_40_C6 ClientMix.11n_540_M15.endTime END
keylset MC_5_40_C6 ClientMix.11n_540_M7.TrafficType {UDPTraffic}
keylset MC_5_40_C6 ClientMix.11n_540_M7.Percentage 20.0
keylset MC_5_40_C6 ClientMix.11n_540_M7.delay 0
keylset MC_5_40_C6 ClientMix.11n_540_M7.endTime END
keylset MC_5_40_C6 Source {11n_520_M15}
keylset MC_5_40_C6 Destination {11n_520_M7 11n_540_M7 11n_540_M15 11a_6 11a_54}

set MC_5_80_C6 ${Mixed_Clients}
keylset MC_5_80_C6 ClientMix.11a_54.TrafficType {UDPTraffic}
keylset MC_5_80_C6 ClientMix.11a_54.Percentage 20.0
keylset MC_5_80_C6 ClientMix.11a_54.delay 0
keylset MC_5_80_C6 ClientMix.11a_54.endTime END
keylset MC_5_80_C6 ClientMix.11a_6.TrafficType {UDPTraffic}
keylset MC_5_80_C6 ClientMix.11a_6.Percentage 20.0
keylset MC_5_80_C6 ClientMix.11a_6.delay 0
keylset MC_5_80_C6 ClientMix.11a_6.endTime END
keylset MC_5_80_C6 ClientMix.11n_540_M23.TrafficType {UDPTraffic}
keylset MC_5_80_C6 ClientMix.11n_540_M23.Percentage 20.0
keylset MC_5_80_C6 ClientMix.11n_540_M23.delay 0
keylset MC_5_80_C6 ClientMix.11n_540_M23.endTime END
keylset MC_5_80_C6 ClientMix.11n_580_M9-1.TrafficType {UDPTraffic}
keylset MC_5_80_C6 ClientMix.11n_580_M9-1.Percentage 20.0
keylset MC_5_80_C6 ClientMix.11n_580_M9-1.delay 0
keylset MC_5_80_C6 ClientMix.11n_580_M9-1.endTime END
keylset MC_5_80_C6 ClientMix.11n_580_M9-2.TrafficType {UDPTraffic}
keylset MC_5_80_C6 ClientMix.11n_580_M9-2.Percentage 20.0
keylset MC_5_80_C6 ClientMix.11n_580_M9-2.delay 0
keylset MC_5_80_C6 ClientMix.11n_580_M9-2.endTime END
keylset MC_5_80_C6 ClientMix.11n_580_M9-3.TrafficType {UDPTraffic}
keylset MC_5_80_C6 ClientMix.11n_580_M9-3.Percentage 20.0
keylset MC_5_80_C6 ClientMix.11n_580_M9-3.delay 0
keylset MC_5_80_C6 ClientMix.11n_580_M9-3.endTime END
keylset MC_5_80_C6 Source {11n_540_M23}
keylset MC_5_80_C6 Destination {11a_6 11a_54 11n_580_M9-1 11n_580_M9-2 11n_580_M9-3}



#Traffic Profiles
keylset UDPTraffic WimixtrafficDirection downlink
keylset UDPTraffic WimixtrafficIntendedrate 20000
keylset UDPTraffic WimixtrafficFramesize 1500
keylset UDPTraffic WimixtrafficNumFrames 100000000
keylset UDPTraffic WimixtrafficpayData None
keylset UDPTraffic WimixtrafficServer server1
keylset UDPTraffic WimixtrafficipProtocolNum Auto
keylset UDPTraffic WimixtrafficPhyrate 54
keylset UDPTraffic WimixtrafficRateBehaviour 0
keylset UDPTraffic WimixtrafficTtl 64
keylset UDPTraffic WimixtrafficRateMode 0
keylset UDPTraffic WimixtrafficType UDP
keylset UDPTraffic WimixtrafficpayPattern 0
keylset UDPTraffic Layer4to7SrcPort 20340
keylset UDPTraffic Layer4to7DestPort 30340
keylset UDPTraffic Layer3qosenable 0
keylset UDPTraffic Layer3qosdscp 0
keylset UDPTraffic BurstdataburstDur 5
keylset UDPTraffic BurstdataburstRate 100
keylset UDPTraffic Burstdataibg 5
keylset UDPTraffic Layer2qosenable 0
keylset UDPTraffic Layer2qossurBand 100
keylset UDPTraffic Layer2qosminPhyRate 1
keylset UDPTraffic Layer2qoswlanUp 0
keylset UDPTraffic Layer2qosmDataRate 10240
keylset UDPTraffic Layer2qosethUp 0
keylset UDPTraffic Layer2qostclasIe 0
keylset UDPTraffic Layer2qosmsduSize 128
keylset UDPTraffic Layer2qosadControl 0
keylset UDPTraffic Layer2qosflDir 1
keylset UDPTraffic Layer2qostid 0
keylset UDPTraffic Layer2qostclasUp 0
keylset UDPTraffic Layer2qosclassifier None
keylset UDPTraffic SlaLatency 1000
keylset UDPTraffic SlaJitter 50
keylset UDPTraffic SlaPacketLoss 10

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
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

