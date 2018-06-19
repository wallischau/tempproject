
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {Medium_Client}
keylset global_config Destination {Far_Client Near_Client}


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
keylset global_config dbserverip 127.0.0.1
keylset global_config NumFails 20
#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 30
keylset global_config TestDurationSec 30
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 1

#Tests - you may define more than one in a TCL list.
#NF_24_20 NF_5_40 NF_5_80
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#GroupClient
keylset Client GroupType 802.11abgn
keylset Client Dut generic_dut_2

#GroupClient - Client Options
keylset Client ListenInt 10
keylset Client Ssid $SSID_24
keylset Client Hops -1
keylset Client Wlan80211eQoSAC 0
keylset Client Dhcp Enable
keylset Client RateAdapt 0
keylset Client GratuitousArp True
keylset Client MacAddress 00:00:01:00:00:01
keylset Client PlcpConfiguration mixed
keylset Client ChannelBandwidth 20
keylset Client EnableAMSDUaggregation 0
keylset Client EnableAMPDUaggregation 1
keylset Client ChannelModel Bypass
keylset Client GuardInterval standard
keylset Client DataMcsIndex 15
keylset Client EnableIpv6 0
keylset Client SubnetMask 255.255.0.0
keylset Client KeepAlive True
keylset Client MacAddressIncr 1
keylset Client NumTxAntennas 0
keylset Client DistId 3
keylset Client Gateway 192.168.1.1
keylset Client phyInterface 802.11n
keylset Client MgmtPhyRate 24
keylset Client TxPower 0
keylset Client Qos Enable
keylset Client IncrIp Normal
keylset Client TransmitDeference 1
keylset Client BaseIp 192.168.3.10

#GroupClient - Security Options
keylset Client Method {WPA2-PSK}
keylset Client PskAscii charter123


set Client_24 ${Client}
keylset Client_24 Ssid $SSID_24
keylset Client_24 NumTxAntennas $Num24Antennas

#HW - Legacy tests
set Near_24 ${Client_24}
keylset Near_24 DataMcsIndex 7
keylset Near_24 DistId 0
keylset Near_24 TxPower 0
keylset Near_24 SnrVal 40

set Medium_24 ${Client_24}
keylset Medium_24 DataMcsIndex 5
keylset Medium_24 DistId 3
keylset Medium_24 TxPower -20
keylset Medium_24 SnrVal 25
keylset Medium_24 UapsdSp 3

set Far_24 ${Client_24}
keylset Far_24 DataMcsIndex 3
keylset Far_24 DistId 2
keylset Far_24 TxPower -40
keylset Far_24 SnrVal 12
keylset Far_24 UapsdSp 3

set Near_24_M7 ${Client_24}
keylset Near_24_M7 DataMcsIndex 7
keylset Near_24_M7 DistId 0
keylset Near_24_M7 TxPower 0
keylset Near_24_M7 SnrVal 40

set Medium_24_M7 ${Client_24}
keylset Medium_24_M7 DataMcsIndex 5
keylset Medium_24_M7 DistId 3
keylset Medium_24_M7 TxPower -20
keylset Medium_24_M7 SnrVal 25
keylset Medium_24_M7 UapsdSp 3

set Far_24_M7 ${Client_24}
keylset Far_24_M7 DataMcsIndex 3
keylset Far_24_M7 DistId 2
keylset Far_24_M7 TxPower -40
keylset Far_24_M7 SnrVal 12
keylset Far_24_M7 UapsdSp 3

set Near_24_M15 ${Client_24}
keylset Near_24_M15 DataMcsIndex 15
keylset Near_24_M15 DistId 0
keylset Near_24_M15 TxPower 0
keylset Near_24_M15 SnrVal 40

set Medium_24_M15 ${Client_24}
keylset Medium_24_M15 DataMcsIndex 13
keylset Medium_24_M15 DistId 3
keylset Medium_24_M15 TxPower -20
keylset Medium_24_M15 SnrVal 25
keylset Medium_24_M15 UapsdSp 3

set Far_24_M15 ${Client_24}
keylset Far_24_M15 DataMcsIndex 11
keylset Far_24_M15 DistId 2
keylset Far_24_M15 TxPower -40
keylset Far_24_M15 SnrVal 12
keylset Far_24_M15 UapsdSp 3

set Near_24_M23 ${Client_24}
keylset Near_24_M23 DataMcsIndex 23
keylset Near_24_M23 DistId 0
keylset Near_24_M23 TxPower 0
keylset Near_24_M23 SnrVal 40

set Medium_24_M23 ${Client_24}
keylset Medium_24_M23 DataMcsIndex 21
keylset Medium_24_M23 DistId 3
keylset Medium_24_M23 TxPower -20
keylset Medium_24_M23 SnrVal 25
keylset Medium_24_M23 UapsdSp 3

set Far_24_M23 ${Client_24}
keylset Far_24_M23 DataMcsIndex 19
keylset Far_24_M23 DistId 2
keylset Far_24_M23 TxPower -40
keylset Far_24_M23 SnrVal 12
keylset Far_24_M23 UapsdSp 3

set Near_24_M31 ${Client_24}
keylset Near_24_M31 DataMcsIndex 31
keylset Near_24_M31 DistId 0
keylset Near_24_M31 TxPower 0
keylset Near_24_M31 SnrVal 40

set Medium_24_M31 ${Client_24}
keylset Medium_24_M31 DataMcsIndex 29
keylset Medium_24_M31 DistId 3
keylset Medium_24_M31 TxPower -20
keylset Medium_24_M31 SnrVal 25
keylset Medium_24_M31 UapsdSp 3

set Far_24_M31 ${Client_24}
keylset Far_24_M31 DataMcsIndex 27
keylset Far_24_M31 DistId 2
keylset Far_24_M31 TxPower -40
keylset Far_24_M31 SnrVal 12
keylset Far_24_M31 UapsdSp 3


set Client_540 ${Client}
keylset Client_540 Dut generic_dut_5
keylset Client_540 Ssid $SSID_5
keylset Client_540 ChannelBandwidth 40
keylset Client_540 NumTxAntennas $Num5Antennas
keylset Client_540 GuardInterval short


#HW - Legacy Tests
set Near_540 ${Client_540}
keylset Near_540 DataMcsIndex 7
keylset Near_540 DistId 0
keylset Near_540 TxPower 0
keylset Near_540 SnrVal 40

set Medium_540 ${Client_540}
keylset Medium_540 DataMcsIndex 5
keylset Medium_540 DistId 3
keylset Medium_540 TxPower -20
keylset Medium_540 SnrVal 25
keylset Medium_540 UapsdSp 3

set Far_540 ${Client_540}
keylset Far_540 DataMcsIndex 3
keylset Far_540 DistId 2
keylset Far_540 TxPower -40
keylset Far_540 SnrVal 12
keylset Far_540 UapsdSp 3


set Near_540_M7 ${Client_540}
keylset Near_540_M7 DataMcsIndex 7
keylset Near_540_M7 DistId 0
keylset Near_540_M7 TxPower 0
keylset Near_540_M7 SnrVal 40

set Medium_540_M7 ${Client_540}
keylset Medium_540_M7 DataMcsIndex 5
keylset Medium_540_M7 DistId 3
keylset Medium_540_M7 TxPower -20
keylset Medium_540_M7 SnrVal 25
keylset Medium_540_M7 UapsdSp 3

set Far_540_M7 ${Client_540}
keylset Far_540_M7 DataMcsIndex 3
keylset Far_540_M7 DistId 2
keylset Far_540_M7 TxPower -40
keylset Far_540_M7 SnrVal 12
keylset Far_540_M7 UapsdSp 3

set Near_540_M15 ${Client_540}
keylset Near_540_M15 DataMcsIndex 15
keylset Near_540_M15 DistId 0
keylset Near_540_M15 TxPower 0
keylset Near_540_M15 SnrVal 40

set Medium_540_M15 ${Client_540}
keylset Medium_540_M15 DataMcsIndex 13
keylset Medium_540_M15 DistId 3
keylset Medium_540_M15 TxPower -20
keylset Medium_540_M15 SnrVal 25
keylset Medium_540_M15 UapsdSp 3

set Far_540_M15 ${Client_540}
keylset Far_540_M15 DataMcsIndex 11
keylset Far_540_M15 DistId 2
keylset Far_540_M15 TxPower -40
keylset Far_540_M15 SnrVal 12
keylset Far_540_M15 UapsdSp 3

set Near_540_M23 ${Client_540}
keylset Near_540_M23 DataMcsIndex 23
keylset Near_540_M23 DistId 0
keylset Near_540_M23 TxPower 0
keylset Near_540_M23 SnrVal 40

set Medium_540_M23 ${Client_540}
keylset Medium_540_M23 DataMcsIndex 21
keylset Medium_540_M23 DistId 3
keylset Medium_540_M23 TxPower -20
keylset Medium_540_M23 SnrVal 25
keylset Medium_540_M23 UapsdSp 3

set Far_540_M23 ${Client_540}
keylset Far_540_M23 DataMcsIndex 19
keylset Far_540_M23 DistId 2
keylset Far_540_M23 TxPower -40
keylset Far_540_M23 SnrVal 12
keylset Far_540_M23 UapsdSp 3


set Near_540_M31 ${Client_540}
keylset Near_540_M31 DataMcsIndex 31
keylset Near_540_M31 DistId 0
keylset Near_540_M31 TxPower 0
keylset Near_540_M31 SnrVal 40

set Medium_540_M31 ${Client_540}
keylset Medium_540_M31 DataMcsIndex 29
keylset Medium_540_M31 DistId 3
keylset Medium_540_M31 TxPower -20
keylset Medium_540_M31 SnrVal 25
keylset Medium_540_M31 UapsdSp 3

set Far_540_M31 ${Client_540}
keylset Far_540_M31 DataMcsIndex 27
keylset Far_540_M31 DistId 2
keylset Far_540_M31 TxPower -40
keylset Far_540_M31 SnrVal 12
keylset Far_540_M31 UapsdSp 3



set Client_580 ${Client}
keylset Client_580 Dut generic_dut_5
keylset Client_580 Ssid $SSID_5
keylset Client_580 ChannelBandwidth 80
keylset Client_580 phyInterface 802.11ac
keylset Client_580 PlcpConfiguration vht_mixed
keylset Client_580 GuardInterval short

#HW - Legacy tests
set Near_580 ${Client_580}
keylset Near_580 VhtDataMcs 7
keylset Near_580 NumSpatialStreams 3
keylset Near_580 DistId 0
keylset Near_580 TxPower 0
keylset Near_580 SnrVal 40

set Medium_580 ${Client_580}
keylset Medium_580 VhtDataMcs 5
keylset Medium_580 NumSpatialStreams 3
keylset Medium_580 DistId 3
keylset Medium_580 TxPower -20
keylset Medium_580 SnrVal 25
keylset Medium_580 UapsdSp 3

set Far_580 ${Client_580}
keylset Far_580 VhtDataMcs 3
keylset Far_580 NumSpatialStreams 3
keylset Far_580 DistId 2
keylset Far_580 TxPower -40
keylset Far_580 SnrVal 12
keylset Far_580 UapsdSp 3



set Near_580_S1 ${Client_580}
keylset Near_580_S1 VhtDataMcs 7
keylset Near_580_S1 NumSpatialStreams 1
keylset Near_580_S1 DistId 0
keylset Near_580_S1 TxPower 0
keylset Near_580_S1 SnrVal 40

set Medium_580_S1 ${Client_580}
keylset Medium_580_S1 VhtDataMcs 5
keylset Medium_580_S1 NumSpatialStreams 1
keylset Medium_580_S1 DistId 3
keylset Medium_580_S1 TxPower -20
keylset Medium_580_S1 SnrVal 25
keylset Medium_580_S1 UapsdSp 3

set Far_580_S1 ${Client_580}
keylset Far_580_S1 VhtDataMcs 3
keylset Far_580_S1 NumSpatialStreams 1
keylset Far_580_S1 DistId 2
keylset Far_580_S1 TxPower -40
keylset Far_580_S1 SnrVal 12
keylset Far_580_S1 UapsdSp 3

set Near_580_S2 ${Client_580}
keylset Near_580_S2 VhtDataMcs 7
keylset Near_580_S2 NumSpatialStreams 2
keylset Near_580_S2 DistId 0
keylset Near_580_S2 TxPower 0
keylset Near_580_S2 SnrVal 40

set Medium_580_S2 ${Client_580}
keylset Medium_580_S2 VhtDataMcs 5
keylset Medium_580_S2 NumSpatialStreams 2
keylset Medium_580_S2 DistId 3
keylset Medium_580_S2 TxPower -20
keylset Medium_580_S2 SnrVal 25
keylset Medium_580_S2 UapsdSp 3

set Far_580_S2 ${Client_580}
keylset Far_580_S2 VhtDataMcs 3
keylset Far_580_S2 NumSpatialStreams 2
keylset Far_580_S2 DistId 2
keylset Far_580_S2 TxPower -40
keylset Far_580_S2 SnrVal 12
keylset Far_580_S2 UapsdSp 3

set Near_580_S3 ${Client_580}
keylset Near_580_S3 VhtDataMcs 7
keylset Near_580_S3 NumSpatialStreams 3
keylset Near_580_S3 DistId 0
keylset Near_580_S3 TxPower 0
keylset Near_580_S3 SnrVal 40

set Medium_580_S3 ${Client_580}
keylset Medium_580_S3 VhtDataMcs 5
keylset Medium_580_S3 NumSpatialStreams 3
keylset Medium_580_S3 DistId 3
keylset Medium_580_S3 TxPower -20
keylset Medium_580_S3 SnrVal 25
keylset Medium_580_S3 UapsdSp 3

set Far_580_S3 ${Client_580}
keylset Far_580_S3 VhtDataMcs 3
keylset Far_580_S3 NumSpatialStreams 3
keylset Far_580_S3 DistId 2
keylset Far_580_S3 TxPower -40
keylset Far_580_S3 SnrVal 12
keylset Far_580_S3 UapsdSp 3

set Near_580_S4 ${Client_580}
keylset Near_580_S4 VhtDataMcs 7
keylset Near_580_S4 NumSpatialStreams 4
keylset Near_580_S4 DistId 0
keylset Near_580_S4 TxPower 0
keylset Near_580_S4 SnrVal 40

set Medium_580_S4 ${Client_580}
keylset Medium_580_S4 VhtDataMcs 5
keylset Medium_580_S4 NumSpatialStreams 4
keylset Medium_580_S4 DistId 3
keylset Medium_580_S4 TxPower -20
keylset Medium_580_S4 SnrVal 25
keylset Medium_580_S4 UapsdSp 3

set Far_580_S4 ${Client_580}
keylset Far_580_S4 VhtDataMcs 3
keylset Far_580_S4 NumSpatialStreams 4
keylset Far_580_S4 DistId 2
keylset Far_580_S4 TxPower -40
keylset Far_580_S4 SnrVal 12
keylset Far_580_S4 UapsdSp 3

#Wimix Test Settings
keylset Near_Far Test wimix_script
keylset Near_Far wimixMode Client
keylset Near_Far wimixTestName Near/Far\ Clients
keylset Near_Far testProfile Thput_Distance
keylset Near_Far testProfileImage images/wimix_new.png
keylset Near_Far staggerStartInt 1
keylset Near_Far loadVal 5
keylset Near_Far totalLoadPer 0
keylset Near_Far contAdminControlFlag 1
keylset Near_Far loadMode 0
keylset Near_Far loadSweepEnd 20
keylset Near_Far loadSweepStart 10
keylset Near_Far staggerStart 0
keylset Near_Far loadSweepStep 1
keylset Near_Far continueFlag 1

#HW - Left in for legacy tests
set NF_24_20 ${Near_Far}
keylset NF_24_20 ClientMix.Far_24.TrafficType {UDPTraffic_24}
keylset NF_24_20 ClientMix.Far_24.Percentage 20.0
keylset NF_24_20 ClientMix.Far_24.delay 0
keylset NF_24_20 ClientMix.Far_24.endTime END
keylset NF_24_20 ClientMix.Medium_24.TrafficType {UDPTraffic_24}
keylset NF_24_20 ClientMix.Medium_24.Percentage 20.0
keylset NF_24_20 ClientMix.Medium_24.delay 0
keylset NF_24_20 ClientMix.Medium_24.endTime END
keylset NF_24_20 ClientMix.Near_24.TrafficType {UDPTraffic_24}
keylset NF_24_20 ClientMix.Near_24.Percentage 20.0
keylset NF_24_20 ClientMix.Near_24.delay 0
keylset NF_24_20 ClientMix.Near_24.endTime END
keylset NF_24_20 Source {Medium_24}
keylset NF_24_20 Destination {Far_24 Near_24}

set NF_24_20_M7 ${Near_Far}
keylset NF_24_20_M7 ClientMix.Far_24_M7.TrafficType {UDPTraffic_24_M7}
keylset NF_24_20_M7 ClientMix.Far_24_M7.Percentage 20.0
keylset NF_24_20_M7 ClientMix.Far_24_M7.delay 0
keylset NF_24_20_M7 ClientMix.Far_24_M7.endTime END
keylset NF_24_20_M7 ClientMix.Medium_24_M7.TrafficType {UDPTraffic_24_M7}
keylset NF_24_20_M7 ClientMix.Medium_24_M7.Percentage 20.0
keylset NF_24_20_M7 ClientMix.Medium_24_M7.delay 0
keylset NF_24_20_M7 ClientMix.Medium_24_M7.endTime END
keylset NF_24_20_M7 ClientMix.Near_24_M7.TrafficType {UDPTraffic_24_M7}
keylset NF_24_20_M7 ClientMix.Near_24_M7.Percentage 20.0
keylset NF_24_20_M7 ClientMix.Near_24_M7.delay 0
keylset NF_24_20_M7 ClientMix.Near_24_M7.endTime END
keylset NF_24_20_M7 Source {Medium_24_M7}
keylset NF_24_20_M7 Destination {Far_24_M7 Near_24_M7}

set NF_24_20_M15 ${Near_Far}
keylset NF_24_20_M15 ClientMix.Far_24_M15.TrafficType {UDPTraffic_24_M15}
keylset NF_24_20_M15 ClientMix.Far_24_M15.Percentage 20.0
keylset NF_24_20_M15 ClientMix.Far_24_M15.delay 0
keylset NF_24_20_M15 ClientMix.Far_24_M15.endTime END
keylset NF_24_20_M15 ClientMix.Medium_24_M15.TrafficType {UDPTraffic_24_M15}
keylset NF_24_20_M15 ClientMix.Medium_24_M15.Percentage 20.0
keylset NF_24_20_M15 ClientMix.Medium_24_M15.delay 0
keylset NF_24_20_M15 ClientMix.Medium_24_M15.endTime END
keylset NF_24_20_M15 ClientMix.Near_24_M15.TrafficType {UDPTraffic_24_M15}
keylset NF_24_20_M15 ClientMix.Near_24_M15.Percentage 20.0
keylset NF_24_20_M15 ClientMix.Near_24_M15.delay 0
keylset NF_24_20_M15 ClientMix.Near_24_M15.endTime END
keylset NF_24_20_M15 Source {Medium_24_M15}
keylset NF_24_20_M15 Destination {Far_24_M15 Near_24_M15}

set NF_24_20_M23 ${Near_Far}
keylset NF_24_20_M23 ClientMix.Far_24_M23.TrafficType {UDPTraffic_24_M23}
keylset NF_24_20_M23 ClientMix.Far_24_M23.Percentage 20.0
keylset NF_24_20_M23 ClientMix.Far_24_M23.delay 0
keylset NF_24_20_M23 ClientMix.Far_24_M23.endTime END
keylset NF_24_20_M23 ClientMix.Medium_24_M23.TrafficType {UDPTraffic_24_M23}
keylset NF_24_20_M23 ClientMix.Medium_24_M23.Percentage 20.0
keylset NF_24_20_M23 ClientMix.Medium_24_M23.delay 0
keylset NF_24_20_M23 ClientMix.Medium_24_M23.endTime END
keylset NF_24_20_M23 ClientMix.Near_24_M23.TrafficType {UDPTraffic_24_M23}
keylset NF_24_20_M23 ClientMix.Near_24_M23.Percentage 20.0
keylset NF_24_20_M23 ClientMix.Near_24_M23.delay 0
keylset NF_24_20_M23 ClientMix.Near_24_M23.endTime END
keylset NF_24_20_M23 Source {Medium_24_M23}
keylset NF_24_20_M23 Destination {Far_24_M23 Near_24_M23}

set NF_24_20_M31 ${Near_Far}
keylset NF_24_20_M31 ClientMix.Far_24_M31.TrafficType {UDPTraffic_24_M31}
keylset NF_24_20_M31 ClientMix.Far_24_M31.Percentage 20.0
keylset NF_24_20_M31 ClientMix.Far_24_M31.delay 0
keylset NF_24_20_M31 ClientMix.Far_24_M31.endTime END
keylset NF_24_20_M31 ClientMix.Medium_24_M31.TrafficType {UDPTraffic_24_M31}
keylset NF_24_20_M31 ClientMix.Medium_24_M31.Percentage 20.0
keylset NF_24_20_M31 ClientMix.Medium_24_M31.delay 0
keylset NF_24_20_M31 ClientMix.Medium_24_M31.endTime END
keylset NF_24_20_M31 ClientMix.Near_24_M31.TrafficType {UDPTraffic_24_M31}
keylset NF_24_20_M31 ClientMix.Near_24_M31.Percentage 20.0
keylset NF_24_20_M31 ClientMix.Near_24_M31.delay 0
keylset NF_24_20_M31 ClientMix.Near_24_M31.endTime END
keylset NF_24_20_M31 Source {Medium_24_M31}
keylset NF_24_20_M31 Destination {Far_24_M31 Near_24_M31}


#HW - Left in for legacy tests
set NF_5_40 ${Near_Far}
keylset NF_5_40 ClientMix.Far_540.TrafficType {UDPTraffic}
keylset NF_5_40 ClientMix.Far_540.Percentage 20.0
keylset NF_5_40 ClientMix.Far_540.delay 0
keylset NF_5_40 ClientMix.Far_540.endTime END
keylset NF_5_40 ClientMix.Medium_540.TrafficType {UDPTraffic}
keylset NF_5_40 ClientMix.Medium_540.Percentage 20.0
keylset NF_5_40 ClientMix.Medium_540.delay 0
keylset NF_5_40 ClientMix.Medium_540.endTime END
keylset NF_5_40 ClientMix.Near_540.TrafficType {UDPTraffic}
keylset NF_5_40 ClientMix.Near_540.Percentage 20.0
keylset NF_5_40 ClientMix.Near_540.delay 0
keylset NF_5_40 ClientMix.Near_540.endTime END
keylset NF_5_40 Source {Medium_540}
keylset NF_5_40 Destination {Far_540 Near_540}

set NF_5_40_M7 ${Near_Far}
keylset NF_5_40_M7 ClientMix.Far_540_M7.TrafficType {UDPTraffic_540_M7}
keylset NF_5_40_M7 ClientMix.Far_540_M7.Percentage 20.0
keylset NF_5_40_M7 ClientMix.Far_540_M7.delay 0
keylset NF_5_40_M7 ClientMix.Far_540_M7.endTime END
keylset NF_5_40_M7 ClientMix.Medium_540_M7.TrafficType {UDPTraffic_540_M7}
keylset NF_5_40_M7 ClientMix.Medium_540_M7.Percentage 20.0
keylset NF_5_40_M7 ClientMix.Medium_540_M7.delay 0
keylset NF_5_40_M7 ClientMix.Medium_540_M7.endTime END
keylset NF_5_40_M7 ClientMix.Near_540_M7.TrafficType {UDPTraffic_540_M7}
keylset NF_5_40_M7 ClientMix.Near_540_M7.Percentage 20.0
keylset NF_5_40_M7 ClientMix.Near_540_M7.delay 0
keylset NF_5_40_M7 ClientMix.Near_540_M7.endTime END
keylset NF_5_40_M7 Source {Medium_540_M7}
keylset NF_5_40_M7 Destination {Far_540_M7 Near_540_M7}

set NF_5_40_M15 ${Near_Far}
keylset NF_5_40_M15 ClientMix.Far_540_M15.TrafficType {UDPTraffic_540_M15}
keylset NF_5_40_M15 ClientMix.Far_540_M15.Percentage 20.0
keylset NF_5_40_M15 ClientMix.Far_540_M15.delay 0
keylset NF_5_40_M15 ClientMix.Far_540_M15.endTime END
keylset NF_5_40_M15 ClientMix.Medium_540_M15.TrafficType {UDPTraffic_540_M15}
keylset NF_5_40_M15 ClientMix.Medium_540_M15.Percentage 20.0
keylset NF_5_40_M15 ClientMix.Medium_540_M15.delay 0
keylset NF_5_40_M15 ClientMix.Medium_540_M15.endTime END
keylset NF_5_40_M15 ClientMix.Near_540_M15.TrafficType {UDPTraffic_540_M15}
keylset NF_5_40_M15 ClientMix.Near_540_M15.Percentage 20.0
keylset NF_5_40_M15 ClientMix.Near_540_M15.delay 0
keylset NF_5_40_M15 ClientMix.Near_540_M15.endTime END
keylset NF_5_40_M15 Source {Medium_540_M15}
keylset NF_5_40_M15 Destination {Far_540_M15 Near_540_M15}

set NF_5_40_M23 ${Near_Far}
keylset NF_5_40_M23 ClientMix.Far_540_M23.TrafficType {UDPTraffic_540_M23}
keylset NF_5_40_M23 ClientMix.Far_540_M23.Percentage 20.0
keylset NF_5_40_M23 ClientMix.Far_540_M23.delay 0
keylset NF_5_40_M23 ClientMix.Far_540_M23.endTime END
keylset NF_5_40_M23 ClientMix.Medium_540_M23.TrafficType {UDPTraffic_540_M23}
keylset NF_5_40_M23 ClientMix.Medium_540_M23.Percentage 20.0
keylset NF_5_40_M23 ClientMix.Medium_540_M23.delay 0
keylset NF_5_40_M23 ClientMix.Medium_540_M23.endTime END
keylset NF_5_40_M23 ClientMix.Near_540_M23.TrafficType {UDPTraffic_540_M23}
keylset NF_5_40_M23 ClientMix.Near_540_M23.Percentage 20.0
keylset NF_5_40_M23 ClientMix.Near_540_M23.delay 0
keylset NF_5_40_M23 ClientMix.Near_540_M23.endTime END
keylset NF_5_40_M23 Source {Medium_540_M23}
keylset NF_5_40_M23 Destination {Far_540_M23 Near_540_M23}

set NF_5_40_M31 ${Near_Far}
keylset NF_5_40_M31 ClientMix.Far_540_M31.TrafficType {UDPTraffic_540_M31}
keylset NF_5_40_M31 ClientMix.Far_540_M31.Percentage 20.0
keylset NF_5_40_M31 ClientMix.Far_540_M31.delay 0
keylset NF_5_40_M31 ClientMix.Far_540_M31.endTime END
keylset NF_5_40_M31 ClientMix.Medium_540_M31.TrafficType {UDPTraffic_540_M31}
keylset NF_5_40_M31 ClientMix.Medium_540_M31.Percentage 20.0
keylset NF_5_40_M31 ClientMix.Medium_540_M31.delay 0
keylset NF_5_40_M31 ClientMix.Medium_540_M31.endTime END
keylset NF_5_40_M31 ClientMix.Near_540_M31.TrafficType {UDPTraffic_540_M31}
keylset NF_5_40_M31 ClientMix.Near_540_M31.Percentage 20.0
keylset NF_5_40_M31 ClientMix.Near_540_M31.delay 0
keylset NF_5_40_M31 ClientMix.Near_540_M31.endTime END
keylset NF_5_40_M31 Source {Medium_540_M31}
keylset NF_5_40_M31 Destination {Far_540_M31 Near_540_M31}


#HW - Left in for legacy tests
set NF_5_80 ${Near_Far}
keylset NF_5_80 ClientMix.Far_580.TrafficType {UDPTraffic_580}
keylset NF_5_80 ClientMix.Far_580.Percentage 20.0
keylset NF_5_80 ClientMix.Far_580.delay 0
keylset NF_5_80 ClientMix.Far_580.endTime END
keylset NF_5_80 ClientMix.Medium_580.TrafficType {UDPTraffic_580}
keylset NF_5_80 ClientMix.Medium_580.Percentage 20.0
keylset NF_5_80 ClientMix.Medium_580.delay 0
keylset NF_5_80 ClientMix.Medium_580.endTime END
keylset NF_5_80 ClientMix.Near_580.TrafficType {UDPTraffic_580}
keylset NF_5_80 ClientMix.Near_580.Percentage 20.0
keylset NF_5_80 ClientMix.Near_580.delay 0
keylset NF_5_80 ClientMix.Near_580.endTime END
keylset NF_5_80 Source {Medium_580}
keylset NF_5_80 Destination {Far_580 Near_580}


set NF_5_80_S1_M9 ${Near_Far}
keylset NF_5_80_S1_M9 ClientMix.Far_580_S1.TrafficType {UDPTraffic_580_S1}
keylset NF_5_80_S1_M9 ClientMix.Far_580_S1.Percentage 20.0
keylset NF_5_80_S1_M9 ClientMix.Far_580_S1.delay 0
keylset NF_5_80_S1_M9 ClientMix.Far_580_S1.endTime END
keylset NF_5_80_S1_M9 ClientMix.Medium_580_S1.TrafficType {UDPTraffic_580_S1}
keylset NF_5_80_S1_M9 ClientMix.Medium_580_S1.Percentage 20.0
keylset NF_5_80_S1_M9 ClientMix.Medium_580_S1.delay 0
keylset NF_5_80_S1_M9 ClientMix.Medium_580_S1.endTime END
keylset NF_5_80_S1_M9 ClientMix.Near_580_S1.TrafficType {UDPTraffic_580_S1}
keylset NF_5_80_S1_M9 ClientMix.Near_580_S1.Percentage 20.0
keylset NF_5_80_S1_M9 ClientMix.Near_580_S1.delay 0
keylset NF_5_80_S1_M9 ClientMix.Near_580_S1.endTime END
keylset NF_5_80_S1_M9 Source {Medium_580_S1}
keylset NF_5_80_S1_M9 Destination {Far_580_S1 Near_580_S1}

set NF_5_80_S2_M9 ${Near_Far}
keylset NF_5_80_S2_M9 ClientMix.Far_580_S2.TrafficType {UDPTraffic_580_S2}
keylset NF_5_80_S2_M9 ClientMix.Far_580_S2.Percentage 20.0
keylset NF_5_80_S2_M9 ClientMix.Far_580_S2.delay 0
keylset NF_5_80_S2_M9 ClientMix.Far_580_S2.endTime END
keylset NF_5_80_S2_M9 ClientMix.Medium_580_S2.TrafficType {UDPTraffic_580_S2}
keylset NF_5_80_S2_M9 ClientMix.Medium_580_S2.Percentage 20.0
keylset NF_5_80_S2_M9 ClientMix.Medium_580_S2.delay 0
keylset NF_5_80_S2_M9 ClientMix.Medium_580_S2.endTime END
keylset NF_5_80_S2_M9 ClientMix.Near_580_S2.TrafficType {UDPTraffic_580_S2}
keylset NF_5_80_S2_M9 ClientMix.Near_580_S2.Percentage 20.0
keylset NF_5_80_S2_M9 ClientMix.Near_580_S2.delay 0
keylset NF_5_80_S2_M9 ClientMix.Near_580_S2.endTime END
keylset NF_5_80_S2_M9 Source {Medium_580_S2}
keylset NF_5_80_S2_M9 Destination {Far_580_S2 Near_580_S2}

set NF_5_80_S3_M9 ${Near_Far}
keylset NF_5_80_S3_M9 ClientMix.Far_580_S3.TrafficType {UDPTraffic_580_S3}
keylset NF_5_80_S3_M9 ClientMix.Far_580_S3.Percentage 20.0
keylset NF_5_80_S3_M9 ClientMix.Far_580_S3.delay 0
keylset NF_5_80_S3_M9 ClientMix.Far_580_S3.endTime END
keylset NF_5_80_S3_M9 ClientMix.Medium_580_S3.TrafficType {UDPTraffic_580_S3}
keylset NF_5_80_S3_M9 ClientMix.Medium_580_S3.Percentage 20.0
keylset NF_5_80_S3_M9 ClientMix.Medium_580_S3.delay 0
keylset NF_5_80_S3_M9 ClientMix.Medium_580_S3.endTime END
keylset NF_5_80_S3_M9 ClientMix.Near_580_S3.TrafficType {UDPTraffic_580_S3}
keylset NF_5_80_S3_M9 ClientMix.Near_580_S3.Percentage 20.0
keylset NF_5_80_S3_M9 ClientMix.Near_580_S3.delay 0
keylset NF_5_80_S3_M9 ClientMix.Near_580_S3.endTime END
keylset NF_5_80_S3_M9 Source {Medium_580_S3}
keylset NF_5_80_S3_M9 Destination {Far_580_S3 Near_580_S3}


set NF_5_80_S4_M9 ${Near_Far}
keylset NF_5_80_S4_M9 ClientMix.Far_580_S4.TrafficType {UDPTraffic_580_S4}
keylset NF_5_80_S4_M9 ClientMix.Far_580_S4.Percentage 20.0
keylset NF_5_80_S4_M9 ClientMix.Far_580_S4.delay 0
keylset NF_5_80_S4_M9 ClientMix.Far_580_S4.endTime END
keylset NF_5_80_S4_M9 ClientMix.Medium_580_S4.TrafficType {UDPTraffic_580_S4}
keylset NF_5_80_S4_M9 ClientMix.Medium_580_S4.Percentage 20.0
keylset NF_5_80_S4_M9 ClientMix.Medium_580_S4.delay 0
keylset NF_5_80_S4_M9 ClientMix.Medium_580_S4.endTime END
keylset NF_5_80_S4_M9 ClientMix.Near_580_S4.TrafficType {UDPTraffic_580_S4}
keylset NF_5_80_S4_M9 ClientMix.Near_580_S4.Percentage 20.0
keylset NF_5_80_S4_M9 ClientMix.Near_580_S4.delay 0
keylset NF_5_80_S4_M9 ClientMix.Near_580_S4.endTime END
keylset NF_5_80_S4_M9 Source {Medium_580_S4}
keylset NF_5_80_S4_M9 Destination {Far_580_S4 Near_580_S4}


#Traffic Profiles
keylset UDPTraffic WimixtrafficDirection downlink
keylset UDPTraffic WimixtrafficIntendedrate 10000
keylset UDPTraffic WimixtrafficFramesize 1500
keylset UDPTraffic WimixtrafficNumFrames 100000000
keylset UDPTraffic WimixtrafficpayData None
keylset UDPTraffic WimixtrafficServer DataServer
keylset UDPTraffic WimixtrafficipProtocolNum Auto
keylset UDPTraffic WimixtrafficPhyrate 54
keylset UDPTraffic WimixtrafficpayPattern 0
keylset UDPTraffic WimixtrafficTtl 64
keylset UDPTraffic WimixtrafficRateMode 0
keylset UDPTraffic WimixtrafficType UDP
keylset UDPTraffic WimixtrafficRateBehaviour 0
keylset UDPTraffic Layer4to7SrcPort 24437
keylset UDPTraffic Layer4to7DestPort 34437
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

#HW - Legacy Tests
set UDPTraffic_24 ${UDPTraffic}
keylset UDPTraffic_24 WimixtrafficIntendedrate 5000
set UDPTraffic_580 ${UDPTraffic}
keylset UDPTraffic_580 WimixtrafficIntendedrate 30000

set UDPTraffic_24_M7 ${UDPTraffic}
keylset UDPTraffic_24_M7 WimixtrafficIntendedrate 20000
set UDPTraffic_24_M15 ${UDPTraffic}
keylset UDPTraffic_24_M15 WimixtrafficIntendedrate 30000
set UDPTraffic_24_M23 ${UDPTraffic}
keylset UDPTraffic_24_M23 WimixtrafficIntendedrate 40000
set UDPTraffic_24_M31 ${UDPTraffic}
keylset UDPTraffic_24_M31 WimixtrafficIntendedrate 50000

set UDPTraffic_540_M7 ${UDPTraffic}
keylset UDPTraffic_540_M7 WimixtrafficIntendedrate 20000
set UDPTraffic_540_M15 ${UDPTraffic}
keylset UDPTraffic_540_M15 WimixtrafficIntendedrate 60000
set UDPTraffic_540_M23 ${UDPTraffic}
keylset UDPTraffic_540_M23 WimixtrafficIntendedrate 100000
set UDPTraffic_540_M31 ${UDPTraffic}
keylset UDPTraffic_540_M31 WimixtrafficIntendedrate 140000

set UDPTraffic_580_S1 ${UDPTraffic}
keylset UDPTraffic_580_S1 WimixtrafficIntendedrate 70000
set UDPTraffic_580_S2 ${UDPTraffic}
keylset UDPTraffic_580_S2 WimixtrafficIntendedrate 140000
set UDPTraffic_580_S3 ${UDPTraffic}
keylset UDPTraffic_580_S3 WimixtrafficIntendedrate 210000
set UDPTraffic_580_S4 ${UDPTraffic}
keylset UDPTraffic_580_S4 WimixtrafficIntendedrate 280000


#Server Profiles

keylset DataServer WimixservermacAddress 00:00:02:00:00:02
keylset DataServer WimixserverserverType 0
keylset DataServer WimixserverEnableIpv6 0
keylset DataServer WimixserverethPort $Card_Eth
keylset DataServer WimixserveripMode 0
keylset DataServer Wimixservernetmask 255.255.0.0
keylset DataServer WimixservermacMode 1
keylset DataServer WimixserveragentServer None
keylset DataServer WimixserveripV6Mode 0
keylset DataServer WimixserveripAddress 192.168.1.201
keylset DataServer Wimixservergateway 192.168.1.1
keylset DataServer Vlanenable 0
keylset DataServer Vlanid 0

#Port list for port specific options
keylset global_config Ports {generic_dut_0 generic_dut_2 generic_dut_5 generic_dut_eth}

#Generic Dut Definitions

#Generic Dut - generic_dut_0
keylset generic_dut_0 used False
keylset generic_dut_0 Vendor generic
keylset generic_dut_0 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&$LANSFW
keylset generic_dut_0 APSWVersion AP\ SW\ Version:@|#^&$VENDORFW
keylset generic_dut_0 APModel AP\ Model:@|#^&$VENDORMODEL
keylset generic_dut_0 Interface.802_11n.BindStatus False
keylset generic_dut_0 Interface.802_11n.WavetestPort 68.114.161.133:2:1
keylset generic_dut_0 Interface.802_11n.RxAttenuation True
keylset generic_dut_0 Interface.802_11n.ClientBackoff True
keylset generic_dut_0 Interface.802_11n.InterfaceType 802.11n
keylset generic_dut_0 Interface.802_11n.secChannel 0
keylset generic_dut_0 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$LANSModel

#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&$LANSFW
keylset generic_dut_2 APSWVersion AP\ SW\ Version:@|#^&$VENDORFW
keylset generic_dut_2 APModel AP\ Model:@|#^&$VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11ac.RxAttenuation False
keylset generic_dut_2 Interface.802_11ac.ClientBackoff True
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
keylset generic_dut_5 Interface.802_11ac.ClientBackoff True
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11n
keylset generic_dut_5 Interface.802_11ac.secChannel 0
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$LANSModel

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

#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}
