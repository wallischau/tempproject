
keylset global_config ChassisName {$chassis_ip}
keylset global_config Source {}
keylset global_config Destination {}
#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}


#Traffics Global Options

keylset global_config Content None
keylset global_config UserPattern None
keylset global_config PayloadData None
keylset global_config DestinationPort None
keylset global_config SourcePort None

#Learning Global Options

keylset global_config AgingTime 0
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
keylset global_config BrandDir G:/WaveAutomation/CharterCommunication_Logo_Color.png
keylset global_config CoBrandFlag True
keylset global_config dbserverip 127.0.0.1
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
keylset global_config overTimeGraphs 1

#Tests - you may define more than one in a TCL list.
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

# Client Group settings

# awakeClient settings

# awakeClient_Base settings
keylset awakeClient_Base BaseIp 192.168.4.10
keylset awakeClient_Base ChannelModel Bypass
keylset awakeClient_Base Dhcp Enable
keylset awakeClient_Base Dut generic_dut_24
keylset awakeClient_Base EnableAMPDUaggregation 1
keylset awakeClient_Base EnableAMSDUaggregation 0
keylset awakeClient_Base EnableIpv6 0
keylset awakeClient_Base EnableLDPC False
keylset awakeClient_Base Gateway 192.168.1.1
keylset awakeClient_Base GratuitousArp True
keylset awakeClient_Base GroupType 802.11ac
keylset awakeClient_Base GuardInterval standard
keylset awakeClient_Base Hops -1
keylset awakeClient_Base IncrIp Normal
keylset awakeClient_Base KeepAlive True
keylset awakeClient_Base ListenInt 10
keylset awakeClient_Base MacAddress 00:00:01:00:03:01
keylset awakeClient_Base MacAddressIncr 1
keylset awakeClient_Base Method {WPA2-PSK}
keylset awakeClient_Base MgmtPhyRate 24
keylset awakeClient_Base MimoId 2
keylset awakeClient_Base NumTxAntennas $Num24Antennas
keylset awakeClient_Base PlcpConfiguration mixed
keylset awakeClient_Base PskAscii charter123
keylset awakeClient_Base Qos Enable
keylset awakeClient_Base RateAdapt 0
keylset awakeClient_Base SnrVal 40
keylset awakeClient_Base Ssid $SSID_24
keylset awakeClient_Base SubnetMask 255.255.0.0
keylset awakeClient_Base TransmitDeference 1
keylset awakeClient_Base Wlan80211eQoSAC 0
keylset awakeClient_Base phyInterface 802.11n

# awakeClient24_20_Base settings
set awakeClient24_20_Base ${awakeClient_Base}
keylset awakeClient24_20_Base ChannelBandwidth 20
keylset awakeClient24_20_Base DataMcsIndex 15

# awakeClient5_40_Base settings
set awakeClient5_40_Base ${awakeClient24_20_Base}
keylset awakeClient5_40_Base ChannelBandwidth 40
keylset awakeClient5_40_Base Dut generic_dut_5
keylset awakeClient5_40_Base MimoId 3
keylset awakeClient5_40_Base NumTxAntennas $Num5Antennas
keylset awakeClient5_40_Base Ssid $SSID_5
keylset awakeClient5_40_Base GuardInterval short

# awakeClient5_40_Base settings
set awakeClient5_80_Base ${awakeClient_Base}
keylset awakeClient5_80_Base DistId 3
keylset awakeClient5_80_Base Dut generic_dut_5
keylset awakeClient5_80_Base EnableMuSuMimo False
keylset awakeClient5_80_Base GuardInterval short
keylset awakeClient5_80_Base MimoId 3
keylset awakeClient5_80_Base MimoMode mu-mimo
keylset awakeClient5_80_Base NumSpatialStreams 1
keylset awakeClient5_80_Base NumTxAntennas $Num5Antennas
keylset awakeClient5_80_Base PlcpConfiguration vht_mixed
keylset awakeClient5_80_Base SigBandwidth 80
keylset awakeClient5_80_Base Ssid $SSID_5
keylset awakeClient5_80_Base USDataMcs 9
keylset awakeClient5_80_Base USManagementMcs 11
keylset awakeClient5_80_Base VhtDataMcs 9
keylset awakeClient5_80_Base phyInterface 802.11ac

set awakeClient_PS_24_20_M15_LEG ${awakeClient24_20_Base}
# Nothing to do. Same as awakeClient24_20_Base

set awakeClient_PS_24_20_M15_MIXED ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M15_MIXED DistId 3

set awakeClient_PS_24_20_M15_WMM ${awakeClient24_20_Base}
# Nothing to do. Same as awakeClient24_20_Base

set awakeClient_PS_24_20_M23_LEG ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M23_LEG DataMcsIndex 23

set awakeClient_PS_24_20_M23_MIXED ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M23_MIXED DataMcsIndex 23
keylset awakeClient_PS_24_20_M23_MIXED DistId 3

set awakeClient_PS_24_20_M23_WMM ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M23_WMM DataMcsIndex 23

set awakeClient_PS_24_20_M31_LEG ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M31_LEG DataMcsIndex 31

set awakeClient_PS_24_20_M31_MIXED ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M31_MIXED DataMcsIndex 31
keylset awakeClient_PS_24_20_M31_MIXED DistId 3

set awakeClient_PS_24_20_M31_WMM ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M31_WMM DataMcsIndex 31

set awakeClient_PS_24_20_M7_LEG ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M7_LEG DataMcsIndex 7

set awakeClient_PS_24_20_M7_MIXED ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M7_MIXED DataMcsIndex 7
keylset awakeClient_PS_24_20_M7_MIXED DistId 3

set awakeClient_PS_24_20_M7_WMM ${awakeClient24_20_Base}
keylset awakeClient_PS_24_20_M7_WMM DataMcsIndex 7

set awakeClient_PS_5_40_M15_LEG ${awakeClient5_40_Base}
# Nothing to do. Same as awakeClient5_40_Base

set awakeClient_PS_5_40_M15_MIXED ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M15_MIXED DistId 3

set awakeClient_PS_5_40_M15_WMM ${awakeClient5_40_Base}
# Nothing to do. Same as awakeClient5_40_Base

set awakeClient_PS_5_40_M23_LEG ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M23_LEG DataMcsIndex 23

set awakeClient_PS_5_40_M23_MIXED ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M23_MIXED DataMcsIndex 23
keylset awakeClient_PS_5_40_M23_MIXED DistId 3

set awakeClient_PS_5_40_M23_WMM ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M23_WMM DataMcsIndex 23

set awakeClient_PS_5_40_M31_LEG ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M31_LEG DataMcsIndex 31

set awakeClient_PS_5_40_M31_MIXED ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M31_MIXED DataMcsIndex 31
keylset awakeClient_PS_5_40_M31_MIXED DistId 3

set awakeClient_PS_5_40_M31_WMM ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M31_WMM DataMcsIndex 31

set awakeClient_PS_5_40_M7_LEG ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M7_LEG DataMcsIndex 7

set awakeClient_PS_5_40_M7_MIXED ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M7_MIXED DataMcsIndex 7
keylset awakeClient_PS_5_40_M7_MIXED DistId 3

set awakeClient_PS_5_40_M7_WMM ${awakeClient5_40_Base}
keylset awakeClient_PS_5_40_M7_WMM DataMcsIndex 7

set awakeClient_PS_5_80_S1_M9_LEG ${awakeClient5_80_Base}
# Nothing to do. Same as awakeClient5_80_Base

set awakeClient_PS_5_80_S1_M9_MIXED ${awakeClient5_80_Base}
# Nothing to do. Same as awakeClient5_80_Base

set awakeClient_PS_5_80_S1_M9_WMM ${awakeClient5_80_Base}
# Nothing to do. Same as awakeClient5_80_Base

set awakeClient_PS_5_80_S2_M9_LEG ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S2_M9_LEG NumSpatialStreams 2

set awakeClient_PS_5_80_S2_M9_MIXED ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S2_M9_MIXED NumSpatialStreams 2

set awakeClient_PS_5_80_S2_M9_WMM ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S2_M9_WMM NumSpatialStreams 2

set awakeClient_PS_5_80_S3_M9_LEG ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S3_M9_LEG NumSpatialStreams 3

set awakeClient_PS_5_80_S3_M9_MIXED ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S3_M9_MIXED NumSpatialStreams 3

set awakeClient_PS_5_80_S3_M9_WMM ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S3_M9_WMM NumSpatialStreams 3

set awakeClient_PS_5_80_S4_M9_LEG ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S4_M9_LEG NumSpatialStreams 4

set awakeClient_PS_5_80_S4_M9_MIXED ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S4_M9_MIXED NumSpatialStreams 4

set awakeClient_PS_5_80_S4_M9_WMM ${awakeClient5_80_Base}
keylset awakeClient_PS_5_80_S4_M9_WMM NumSpatialStreams 4

# wmmPs10 settings

# Base settings from PS_24_20_M15_WMM
keylset wmmPs10_Base BaseIp 192.168.3.10
keylset wmmPs10_Base ChannelModel Bypass
keylset wmmPs10_Base Dhcp Enable
keylset wmmPs10_Base Dut generic_dut_24
keylset wmmPs10_Base EnableAMPDUaggregation 1
keylset wmmPs10_Base EnableAMSDUaggregation 0
keylset wmmPs10_Base EnableIpv6 0
keylset wmmPs10_Base EnableLDPC False
keylset wmmPs10_Base Gateway 192.168.1.1
keylset wmmPs10_Base GratuitousArp True
keylset wmmPs10_Base GroupType 802.11ac
keylset wmmPs10_Base GuardInterval standard
keylset wmmPs10_Base Hops 3
keylset wmmPs10_Base IncrIp Normal
keylset wmmPs10_Base KeepAlive True
keylset wmmPs10_Base LegacyPs 1
keylset wmmPs10_Base ListenInt 10
keylset wmmPs10_Base MacAddress 00:00:01:00:02:01
keylset wmmPs10_Base MacAddressIncr 1
keylset wmmPs10_Base Method {WPA2-PSK}
keylset wmmPs10_Base MgmtPhyRate 24
keylset wmmPs10_Base MimoId 2
keylset wmmPs10_Base NumTxAntennas $Num24Antennas
keylset wmmPs10_Base PlcpConfiguration mixed
keylset wmmPs10_Base PskAscii charter123
keylset wmmPs10_Base Qos Enable
keylset wmmPs10_Base RateAdapt 0
keylset wmmPs10_Base SnrVal 40
keylset wmmPs10_Base Ssid $SSID_24
keylset wmmPs10_Base SubnetMask 255.255.0.0
keylset wmmPs10_Base TransmitDeference 1
keylset wmmPs10_Base Uapsd 1
keylset wmmPs10_Base Wlan80211eQoSAC 0
keylset wmmPs10_Base phyInterface 802.11n

set wmmPs10_24_20_Base ${wmmPs10_Base}
keylset wmmPs10_24_20_Base ChannelBandwidth 20
keylset wmmPs10_24_20_Base DataMcsIndex 15

set wmmPs10_5_40_Base ${wmmPs10_24_20_Base}
keylset wmmPs10_5_40_Base ChannelBandwidth 40
keylset wmmPs10_5_40_Base Dut generic_dut_5
keylset wmmPs10_5_40_Base MimoId 3
keylset wmmPs10_5_40_Base NumTxAntennas $Num5Antennas
keylset wmmPs10_5_40_Base Ssid $SSID_5
keylset wmmPs10_5_40_Base GuardInterval short

set wmmPs10_5_80_Base ${wmmPs10_Base}
keylset wmmPs10_5_80_Base DistId 3
keylset wmmPs10_5_80_Base Dut generic_dut_5
keylset wmmPs10_5_80_Base EnableMuSuMimo False
keylset wmmPs10_5_80_Base GuardInterval short
keylset wmmPs10_5_80_Base MimoId 3
keylset wmmPs10_5_80_Base MimoMode mu-mimo
keylset wmmPs10_5_80_Base NumSpatialStreams 1
keylset wmmPs10_5_80_Base NumTxAntennas $Num5Antennas
keylset wmmPs10_5_80_Base PlcpConfiguration vht_mixed
keylset wmmPs10_5_80_Base SigBandwidth 80
keylset wmmPs10_5_80_Base Ssid $SSID_5
keylset wmmPs10_5_80_Base USDataMcs 8
keylset wmmPs10_5_80_Base USManagementMcs 11
keylset wmmPs10_5_80_Base VhtDataMcs 9
keylset wmmPs10_5_80_Base phyInterface 802.11ac

set wmmPs10_PS_24_20_M15_MIXED ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M15_MIXED DistId 3

set wmmPs10_PS_24_20_M15_WMM ${wmmPs10_24_20_Base}
# Nothing to do. Same as wmmPs10_24_20_Base

set wmmPs10_PS_24_20_M23_MIXED ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M23_MIXED DataMcsIndex 23
keylset wmmPs10_PS_24_20_M23_MIXED DistId 3

set wmmPs10_PS_24_20_M23_WMM ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M23_WMM DistId 3

set wmmPs10_PS_24_20_M31_MIXED ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M31_MIXED DataMcsIndex 31
keylset wmmPs10_PS_24_20_M31_MIXED DistId 3

set wmmPs10_PS_24_20_M31_WMM ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M31_WMM DataMcsIndex 31

set wmmPs10_PS_24_20_M7_MIXED ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M7_MIXED DataMcsIndex 7
keylset wmmPs10_PS_24_20_M7_MIXED DistId 3

set wmmPs10_PS_24_20_M7_WMM ${wmmPs10_24_20_Base}
keylset wmmPs10_PS_24_20_M7_WMM DataMcsIndex 7

set wmmPs10_PS_5_40_M15_MIXED ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M15_MIXED DistId 3

set wmmPs10_PS_5_40_M15_WMM ${wmmPs10_5_40_Base}
# Nothing to do. Same as wmmPs10_5_40_Base

set wmmPs10_PS_5_40_M23_MIXED ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M23_MIXED DataMcsIndex 23
keylset wmmPs10_PS_5_40_M23_MIXED DistId 3

set wmmPs10_PS_5_40_M23_WMM ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M23_WMM DataMcsIndex 23

set wmmPs10_PS_5_40_M31_MIXED ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M31_MIXED DataMcsIndex 31
keylset wmmPs10_PS_5_40_M31_MIXED DistId 3

set wmmPs10_PS_5_40_M31_WMM ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M31_WMM DataMcsIndex 31

set wmmPs10_PS_5_40_M7_MIXED ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M7_MIXED DataMcsIndex 7
keylset wmmPs10_PS_5_40_M7_MIXED DistId 3

set wmmPs10_PS_5_40_M7_WMM ${wmmPs10_5_40_Base}
keylset wmmPs10_PS_5_40_M7_WMM DataMcsIndex 7

set wmmPs10_PS_5_80_S1_M9_MIXED ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S1_M9_MIXED USDataMcs 8

set wmmPs10_PS_5_80_S1_M9_WMM ${wmmPs10_5_80_Base}
# Nothing to do. Same as wmmPs10_5_80_Base

set wmmPs10_PS_5_80_S2_M9_MIXED ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S2_M9_MIXED NumSpatialStreams 2
keylset wmmPs10_PS_5_80_S2_M9_MIXED USDataMcs 8

set wmmPs10_PS_5_80_S2_M9_WMM ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S2_M9_WMM NumSpatialStreams 2

set wmmPs10_PS_5_80_S3_M9_MIXED ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S3_M9_MIXED NumSpatialStreams 3
keylset wmmPs10_PS_5_80_S3_M9_MIXED USDataMcs 8

set wmmPs10_PS_5_80_S3_M9_WMM ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S3_M9_WMM NumSpatialStreams 3

set wmmPs10_PS_5_80_S4_M9_MIXED ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S4_M9_MIXED NumSpatialStreams 4
keylset wmmPs10_PS_5_80_S4_M9_MIXED USDataMcs 8

set wmmPs10_PS_5_80_S4_M9_WMM ${wmmPs10_5_80_Base}
keylset wmmPs10_PS_5_80_S4_M9_WMM NumSpatialStreams 4

# wmmPs2 settings

# Base settings from PS_24_20_M15_MIXED
keylset wmmPs2_Base BaseIp 192.168.2.10
keylset wmmPs2_Base ChannelModel Bypass
keylset wmmPs2_Base Dhcp Enable
keylset wmmPs2_Base Dut generic_dut_24
keylset wmmPs2_Base EnableAMPDUaggregation 1
keylset wmmPs2_Base EnableAMSDUaggregation 0
keylset wmmPs2_Base EnableIpv6 0
keylset wmmPs2_Base EnableLDPC False
keylset wmmPs2_Base Gateway 192.168.1.1
keylset wmmPs2_Base GratuitousArp True
keylset wmmPs2_Base GroupType 802.11ac
keylset wmmPs2_Base GuardInterval standard
keylset wmmPs2_Base IncrIp Normal
keylset wmmPs2_Base KeepAlive True
keylset wmmPs2_Base LegacyPs 1
keylset wmmPs2_Base ListenInt 2
keylset wmmPs2_Base MacAddress 00:00:01:00:01:01
keylset wmmPs2_Base MacAddressIncr 1
keylset wmmPs2_Base Method {WPA2-PSK}
keylset wmmPs2_Base MgmtPhyRate 24
keylset wmmPs2_Base MimoId 2
keylset wmmPs2_Base NumTxAntennas $Num24Antennas
keylset wmmPs2_Base PlcpConfiguration mixed
keylset wmmPs2_Base PskAscii charter123
keylset wmmPs2_Base Qos Enable
keylset wmmPs2_Base RateAdapt 0
keylset wmmPs2_Base SnrVal 40
keylset wmmPs2_Base Ssid $SSID_24
keylset wmmPs2_Base SubnetMask 255.255.0.0
keylset wmmPs2_Base TransmitDeference 1
keylset wmmPs2_Base Uapsd 1
keylset wmmPs2_Base Wlan80211eQoSAC 0
keylset wmmPs2_Base phyInterface 802.11n

set wmmPs2_24_20_Base ${wmmPs2_Base}
keylset wmmPs2_24_20_Base ChannelBandwidth 20

set wmmPs2_24_20_MIXED ${wmmPs2_Base}
keylset wmmPs2_24_20_MIXED DistId 3

set wmmPs2_24_20_WMM ${wmmPs2_Base}
keylset wmmPs2_24_20_WMM BaseIp 192.168.1.10
keylset wmmPs2_24_20_WMM Hops 0
keylset wmmPs2_24_20_WMM MacAddress 00:00:01:00:00:01

set wmmPs2_5_40_Base ${wmmPs2_Base}
keylset wmmPs2_5_40_Base ChannelBandwidth 40
keylset wmmPs2_5_40_Base Dut generic_dut_5
keylset wmmPs2_5_40_Base MimoId 3
keylset wmmPs2_5_40_Base NumTxAntennas $Num5Antennas
keylset wmmPs2_5_40_Base Ssid $SSID_5
keylset wmmPs2_5_40_Base GuardInterval short

set wmmPs2_5_40_MIXED ${wmmPs2_5_40_Base}
keylset wmmPs2_5_40_MIXED DistId 3

set wmmPs2_5_40_WMM ${wmmPs2_5_40_Base}
keylset wmmPs2_5_40_WMM BaseIp 192.168.1.10
keylset wmmPs2_5_40_WMM Hops 0
keylset wmmPs2_5_40_WMM MacAddress 00:00:01:00:00:01

set wmmPs2_5_80_Base ${wmmPs2_Base}
keylset wmmPs2_5_80_Base DistId 3
keylset wmmPs2_5_80_Base Dut generic_dut_5
keylset wmmPs2_5_80_Base EnableMuSuMimo False
keylset wmmPs2_5_80_Base GuardInterval short
keylset wmmPs2_5_80_Base MimoId 3
keylset wmmPs2_5_80_Base MimoMode mu-mimo
keylset wmmPs2_5_80_Base NumSpatialStreams 1
keylset wmmPs2_5_80_Base NumTxAntennas $Num5Antennas
keylset wmmPs2_5_80_Base PlcpConfiguration vht_mixed
keylset wmmPs2_5_80_Base SigBandwidth 80
keylset wmmPs2_5_80_Base Ssid $SSID_5
keylset wmmPs2_5_80_Base USDataMcs 9
keylset wmmPs2_5_80_Base USManagementMcs 11
keylset wmmPs2_5_80_Base VhtDataMcs 9
keylset wmmPs2_5_80_Base phyInterface 802.11ac

set wmmPs2_5_80_MIXED ${wmmPs2_5_80_Base}

set wmmPs2_5_80_WMM ${wmmPs2_5_80_Base}
keylset wmmPs2_5_80_WMM BaseIp 192.168.1.10
keylset wmmPs2_5_80_WMM Hops 0
keylset wmmPs2_5_80_WMM MacAddress 00:00:01:00:00:01

set wmmPs2_PS_24_20_M15_MIXED ${wmmPs2_24_20_MIXED}
keylset wmmPs2_PS_24_20_M15_MIXED DataMcsIndex 15

set wmmPs2_PS_24_20_M15_WMM ${wmmPs2_24_20_WMM}
keylset wmmPs2_PS_24_20_M15_WMM DataMcsIndex 15

set wmmPs2_PS_24_20_M23_MIXED ${wmmPs2_24_20_MIXED}
keylset wmmPs2_PS_24_20_M23_MIXED DataMcsIndex 23

set wmmPs2_PS_24_20_M23_WMM ${wmmPs2_24_20_WMM}
keylset wmmPs2_PS_24_20_M23_WMM DataMcsIndex 23

set wmmPs2_PS_24_20_M31_MIXED ${wmmPs2_24_20_MIXED}
keylset wmmPs2_PS_24_20_M31_MIXED DataMcsIndex 31

set wmmPs2_PS_24_20_M31_WMM ${wmmPs2_24_20_WMM}
keylset wmmPs2_PS_24_20_M31_WMM DataMcsIndex 31

set wmmPs2_PS_24_20_M7_MIXED ${wmmPs2_24_20_MIXED}
keylset wmmPs2_PS_24_20_M7_MIXED DataMcsIndex 7

set wmmPs2_PS_24_20_M7_WMM ${wmmPs2_24_20_WMM}
keylset wmmPs2_PS_24_20_M7_WMM DataMcsIndex 7

set wmmPs2_PS_5_40_M15_MIXED ${wmmPs2_5_40_MIXED}
keylset wmmPs2_PS_5_40_M15_MIXED DataMcsIndex 15

set wmmPs2_PS_5_40_M15_WMM ${wmmPs2_5_40_WMM}
keylset wmmPs2_PS_5_40_M15_WMM DataMcsIndex 15

set wmmPs2_PS_5_40_M23_MIXED ${wmmPs2_5_40_MIXED}
keylset wmmPs2_PS_5_40_M23_MIXED DataMcsIndex 23

set wmmPs2_PS_5_40_M23_WMM ${wmmPs2_5_40_WMM}
keylset wmmPs2_PS_5_40_M23_WMM DataMcsIndex 23

set wmmPs2_PS_5_40_M31_MIXED ${wmmPs2_5_40_MIXED}
keylset wmmPs2_PS_5_40_M31_MIXED DataMcsIndex 31

set wmmPs2_PS_5_40_M31_WMM ${wmmPs2_5_40_WMM}
keylset wmmPs2_PS_5_40_M31_WMM DataMcsIndex 31

set wmmPs2_PS_5_40_M7_MIXED ${wmmPs2_5_40_MIXED}
keylset wmmPs2_PS_5_40_M7_MIXED DataMcsIndex 7

set wmmPs2_PS_5_40_M7_WMM ${wmmPs2_5_40_WMM}
keylset wmmPs2_PS_5_40_M7_WMM DataMcsIndex 7

set wmmPs2_PS_5_80_S1_M9_MIXED ${wmmPs2_5_80_MIXED}
# Nothing to do. Same as wmmPs2_5_80_MIXED

set wmmPs2_PS_5_80_S1_M9_WMM ${wmmPs2_5_80_WMM}
# Nothing to do. Same as wmmPs2_5_80_WMM

set wmmPs2_PS_5_80_S2_M9_MIXED ${wmmPs2_5_80_MIXED}
keylset wmmPs2_PS_5_80_S2_M9_MIXED NumSpatialStreams 2

set wmmPs2_PS_5_80_S2_M9_WMM ${wmmPs2_5_80_WMM}
keylset wmmPs2_PS_5_80_S2_M9_WMM NumSpatialStreams 2

set wmmPs2_PS_5_80_S3_M9_MIXED ${wmmPs2_5_80_MIXED}
keylset wmmPs2_PS_5_80_S3_M9_MIXED NumSpatialStreams 3

set wmmPs2_PS_5_80_S3_M9_WMM ${wmmPs2_5_80_WMM}
keylset wmmPs2_PS_5_80_S3_M9_WMM NumSpatialStreams 3

set wmmPs2_PS_5_80_S4_M9_MIXED ${wmmPs2_5_80_MIXED}
keylset wmmPs2_PS_5_80_S4_M9_MIXED NumSpatialStreams 4

set wmmPs2_PS_5_80_S4_M9_WMM ${wmmPs2_5_80_WMM}
keylset wmmPs2_PS_5_80_S4_M9_WMM NumSpatialStreams 4

# wmmPs6 settings

# Base settings from PS_24_20_M15_WMM
keylset wmmPs6_Base BaseIp 192.168.2.10
keylset wmmPs6_Base ChannelModel Bypass
keylset wmmPs6_Base Dhcp Enable
keylset wmmPs6_Base Dut generic_dut_24
keylset wmmPs6_Base EnableAMPDUaggregation 1
keylset wmmPs6_Base EnableAMSDUaggregation 0
keylset wmmPs6_Base EnableIpv6 0
keylset wmmPs6_Base EnableLDPC False
keylset wmmPs6_Base Gateway 192.168.1.1
keylset wmmPs6_Base GratuitousArp True
keylset wmmPs6_Base GroupType 802.11ac
keylset wmmPs6_Base GuardInterval standard
keylset wmmPs6_Base IncrIp Normal
keylset wmmPs6_Base KeepAlive True
keylset wmmPs6_Base LegacyPs 1
keylset wmmPs6_Base ListenInt 6
keylset wmmPs6_Base MacAddress 00:00:01:00:01:01
keylset wmmPs6_Base MacAddressIncr 1
keylset wmmPs6_Base Method {WPA2-PSK}
keylset wmmPs6_Base MgmtPhyRate 24
keylset wmmPs6_Base MimoId 2
keylset wmmPs6_Base NumTxAntennas $Num24Antennas
keylset wmmPs6_Base PlcpConfiguration mixed
keylset wmmPs6_Base PskAscii charter123
keylset wmmPs6_Base Qos Enable
keylset wmmPs6_Base RateAdapt 0
keylset wmmPs6_Base SnrVal 40
keylset wmmPs6_Base Ssid $SSID_24
keylset wmmPs6_Base SubnetMask 255.255.0.0
keylset wmmPs6_Base TransmitDeference 1
keylset wmmPs6_Base Uapsd 1
keylset wmmPs6_Base Wlan80211eQoSAC 0
keylset wmmPs6_Base phyInterface 802.11n

set wmmPs6_24_20_Base ${wmmPs6_Base}
keylset wmmPs6_24_20_Base ChannelBandwidth 20
keylset wmmPs6_24_20_Base DataMcsIndex 15

set wmmPs6_5_40_Base ${wmmPs6_Base}
keylset wmmPs6_5_40_Base ChannelBandwidth 40
keylset wmmPs6_5_40_Base DataMcsIndex 15
keylset wmmPs6_5_40_Base Dut generic_dut_5
keylset wmmPs6_5_40_Base MimoId 3
keylset wmmPs6_5_40_Base NumTxAntennas $Num5Antennas
keylset wmmPs6_5_40_Base Ssid $SSID_5
keylset wmmPs6_5_40_Base GuardInterval short

set wmmPs6_5_80_Base ${wmmPs6_Base}
keylset wmmPs6_5_80_Base DistId 3
keylset wmmPs6_5_80_Base Dut generic_dut_5
keylset wmmPs6_5_80_Base EnableMuSuMimo False
keylset wmmPs6_5_80_Base GuardInterval short
keylset wmmPs6_5_80_Base MimoId 3
keylset wmmPs6_5_80_Base MimoMode mu-mimo
keylset wmmPs6_5_80_Base NumSpatialStreams 1
keylset wmmPs6_5_80_Base NumTxAntennas $Num5Antennas
keylset wmmPs6_5_80_Base PlcpConfiguration vht_mixed
keylset wmmPs6_5_80_Base SigBandwidth 80
keylset wmmPs6_5_80_Base Ssid $SSID_5
keylset wmmPs6_5_80_Base USDataMcs 9
keylset wmmPs6_5_80_Base USManagementMcs 11
keylset wmmPs6_5_80_Base VhtDataMcs 9
keylset wmmPs6_5_80_Base phyInterface 802.11ac

set wmmPs6_PS_24_20_M15_WMM ${wmmPs6_24_20_Base}
# Nothing to do. Same as wmmPs6_24_20_Base

set wmmPs6_PS_24_20_M23_WMM ${wmmPs6_24_20_Base}
keylset wmmPs6_PS_24_20_M23_WMM DataMcsIndex 23

set wmmPs6_PS_24_20_M31_WMM ${wmmPs6_24_20_Base}
keylset wmmPs6_PS_24_20_M31_WMM DataMcsIndex 31

set wmmPs6_PS_24_20_M7_WMM ${wmmPs6_24_20_Base}
keylset wmmPs6_PS_24_20_M7_WMM DataMcsIndex 7

set wmmPs6_PS_5_40_M15_WMM ${wmmPs6_5_40_Base}
# Nothing to do. Same as wmmPs6_5_40_Base

set wmmPs6_PS_5_40_M23_WMM ${wmmPs6_5_40_Base}
keylset wmmPs6_PS_5_40_M23_WMM DataMcsIndex 23

set wmmPs6_PS_5_40_M31_WMM ${wmmPs6_5_40_Base}
keylset wmmPs6_PS_5_40_M31_WMM DataMcsIndex 31

set wmmPs6_PS_5_40_M7_WMM ${wmmPs6_5_40_Base}
keylset wmmPs6_PS_5_40_M7_WMM DataMcsIndex 7

set wmmPs6_PS_5_80_S1_M9_WMM ${wmmPs6_5_80_Base}
# Nothing to do. Same as wmmPs6_5_80_Base

set wmmPs6_PS_5_80_S2_M9_WMM ${wmmPs6_5_80_Base}
keylset wmmPs6_PS_5_80_S2_M9_WMM NumSpatialStreams 2

set wmmPs6_PS_5_80_S3_M9_WMM ${wmmPs6_5_80_Base}
keylset wmmPs6_PS_5_80_S3_M9_WMM NumSpatialStreams 3

set wmmPs6_PS_5_80_S4_M9_WMM ${wmmPs6_5_80_Base}
keylset wmmPs6_PS_5_80_S4_M9_WMM NumSpatialStreams 4

# legacyPs10 settings

# Base settings from PS_24_20_M15_LEG
keylset legacyPs10_Base BaseIp 192.168.3.10
keylset legacyPs10_Base ChannelModel Bypass
keylset legacyPs10_Base Dhcp Enable
keylset legacyPs10_Base Dut generic_dut_24
keylset legacyPs10_Base EnableAMPDUaggregation 1
keylset legacyPs10_Base EnableAMSDUaggregation 0
keylset legacyPs10_Base EnableIpv6 0
keylset legacyPs10_Base EnableLDPC False
keylset legacyPs10_Base Gateway 192.168.1.1
keylset legacyPs10_Base GratuitousArp True
keylset legacyPs10_Base GroupType 802.11ac
keylset legacyPs10_Base GuardInterval standard
keylset legacyPs10_Base Hops 3
keylset legacyPs10_Base IncrIp Normal
keylset legacyPs10_Base KeepAlive True
keylset legacyPs10_Base LegacyPs 1
keylset legacyPs10_Base ListenInt 10
keylset legacyPs10_Base MacAddress 00:00:01:00:02:01
keylset legacyPs10_Base MacAddressIncr 1
keylset legacyPs10_Base Method {WPA2-PSK}
keylset legacyPs10_Base MgmtPhyRate 24
keylset legacyPs10_Base MimoId 2
keylset legacyPs10_Base NumTxAntennas $Num24Antennas
keylset legacyPs10_Base PlcpConfiguration mixed
keylset legacyPs10_Base PskAscii charter123
keylset legacyPs10_Base Qos Enable
keylset legacyPs10_Base RateAdapt 0
keylset legacyPs10_Base SnrVal 40
keylset legacyPs10_Base Ssid $SSID_24
keylset legacyPs10_Base SubnetMask 255.255.0.0
keylset legacyPs10_Base TransmitDeference 1
keylset legacyPs10_Base Wlan80211eQoSAC 0
keylset legacyPs10_Base phyInterface 802.11n

set legacyPs10_24_20_Base ${legacyPs10_Base}
keylset legacyPs10_24_20_Base ChannelBandwidth 20
keylset legacyPs10_24_20_Base DataMcsIndex 15

set legacyPs10_24_20_LEG ${legacyPs10_24_20_Base}
# Nothing to do. Same as legacyPs10_24_20_Base

set legacyPs10_24_20_MIXED ${legacyPs10_24_20_Base}
keylset legacyPs10_24_20_MIXED BaseIp 192.168.5.10
keylset legacyPs10_24_20_MIXED DistId 3
keylset legacyPs10_24_20_MIXED Hops 2
keylset legacyPs10_24_20_MIXED MacAddress 00:00:01:00:04:01

set legacyPs10_5_40_Base ${legacyPs10_Base}
keylset legacyPs10_5_40_Base ChannelBandwidth 40
keylset legacyPs10_5_40_Base DataMcsIndex 15
keylset legacyPs10_5_40_Base Dut generic_dut_5
keylset legacyPs10_5_40_Base MimoId 3
keylset legacyPs10_5_40_Base NumTxAntennas $Num5Antennas
keylset legacyPs10_5_40_Base Ssid $SSID_5
keylset legacyPs10_5_40_Base GuardInterval short

set legacyPs10_5_40_LEG ${legacyPs10_Base}
keylset legacyPs10_5_40_LEG GuardInterval short

set legacyPs10_5_40_MIXED ${legacyPs10_Base}
keylset legacyPs10_5_40_MIXED BaseIp 192.168.5.10
keylset legacyPs10_5_40_MIXED DistId 3
keylset legacyPs10_5_40_MIXED Hops 2
keylset legacyPs10_5_40_MIXED MacAddress 00:00:01:00:04:01
keylset legacyPs10_5_40_MIXED GuardInterval short

set legacyPs10_5_80_Base ${legacyPs10_Base}
keylset legacyPs10_5_80_Base DistId 3
keylset legacyPs10_5_80_Base Dut generic_dut_5
keylset legacyPs10_5_80_Base EnableMuSuMimo False
keylset legacyPs10_5_80_Base GuardInterval short
keylset legacyPs10_5_80_Base MimoId 3
keylset legacyPs10_5_80_Base MimoMode mu-mimo
keylset legacyPs10_5_80_Base NumSpatialStreams 1
keylset legacyPs10_5_80_Base NumTxAntennas $Num5Antennas
keylset legacyPs10_5_80_Base PlcpConfiguration vht_mixed
keylset legacyPs10_5_80_Base SigBandwidth 80
keylset legacyPs10_5_80_Base Ssid $SSID_5
keylset legacyPs10_5_80_Base USDataMcs 9
keylset legacyPs10_5_80_Base USManagementMcs 11
keylset legacyPs10_5_80_Base VhtDataMcs 9
keylset legacyPs10_5_80_Base phyInterface 802.11ac

set legacyPs10_5_80_LEG ${legacyPs10_5_80_Base}
# Nothing to do. Same as legacyPs10_5_80_Base

set legacyPs10_5_80_MIXED ${legacyPs10_5_80_Base}
keylset legacyPs10_5_80_MIXED BaseIp 192.168.5.10
keylset legacyPs10_5_80_MIXED Hops 2
keylset legacyPs10_5_80_MIXED MacAddress 00:00:01:00:04:01

set legacyPs10_PS_24_20_M15_LEG ${legacyPs10_24_20_LEG}
# Nothing to do. Same as legacyPs10_24_20_LEG

set legacyPs10_PS_24_20_M15_MIXED ${legacyPs10_24_20_MIXED}
# Nothing to do. Same as legacyPs10_24_20_MIXED

set legacyPs10_PS_24_20_M23_LEG ${legacyPs10_24_20_LEG}
keylset legacyPs10_PS_24_20_M23_LEG DataMcsIndex 23

set legacyPs10_PS_24_20_M23_MIXED ${legacyPs10_24_20_MIXED}
keylset legacyPs10_PS_24_20_M23_MIXED DataMcsIndex 23

set legacyPs10_PS_24_20_M31_LEG ${legacyPs10_24_20_LEG}
keylset legacyPs10_PS_24_20_M31_LEG DataMcsIndex 31

set legacyPs10_PS_24_20_M31_MIXED ${legacyPs10_24_20_MIXED}
keylset legacyPs10_PS_24_20_M31_MIXED DataMcsIndex 31

set legacyPs10_PS_24_20_M7_LEG ${legacyPs10_24_20_LEG}
keylset legacyPs10_PS_24_20_M7_LEG DataMcsIndex 7

set legacyPs10_PS_24_20_M7_MIXED ${legacyPs10_24_20_MIXED}
keylset legacyPs10_PS_24_20_M7_MIXED DataMcsIndex 7

set legacyPs10_PS_5_40_M15_LEG ${legacyPs10_5_40_LEG}
# Nothing to do. Same as legacyPs10_5_40_LEG

set legacyPs10_PS_5_40_M15_MIXED ${legacyPs10_5_40_MIXED}
# Nothing to do. Same as legacyPs10_5_40_MIXED

set legacyPs10_PS_5_40_M23_LEG ${legacyPs10_5_40_LEG}
keylset legacyPs10_PS_5_40_M23_LEG DataMcsIndex 23

set legacyPs10_PS_5_40_M23_MIXED ${legacyPs10_5_40_MIXED}
keylset legacyPs10_PS_5_40_M23_MIXED DataMcsIndex 23

set legacyPs10_PS_5_40_M31_LEG ${legacyPs10_5_40_LEG}
keylset legacyPs10_PS_5_40_M31_LEG DataMcsIndex 31

set legacyPs10_PS_5_40_M31_MIXED ${legacyPs10_5_40_MIXED}
keylset legacyPs10_PS_5_40_M31_MIXED DataMcsIndex 31

set legacyPs10_PS_5_40_M7_LEG ${legacyPs10_5_40_LEG}
keylset legacyPs10_PS_5_40_M7_LEG DataMcsIndex 7

set legacyPs10_PS_5_40_M7_MIXED ${legacyPs10_5_40_MIXED}
keylset legacyPs10_PS_5_40_M7_MIXED DataMcsIndex 7

set legacyPs10_PS_5_80_S1_M9_LEG ${legacyPs10_5_80_LEG}
# Nothing to do. Same as legacyPs10_5_80_LEG

set legacyPs10_PS_5_80_S1_M9_MIXED ${legacyPs10_5_80_MIXED}
# Nothing to do. Same as legacyPs10_5_80_MIXED

set legacyPs10_PS_5_80_S2_M9_LEG ${legacyPs10_5_80_LEG}
keylset legacyPs10_PS_5_80_S2_M9_LEG NumSpatialStreams 2

set legacyPs10_PS_5_80_S2_M9_MIXED ${legacyPs10_5_80_MIXED}
keylset legacyPs10_PS_5_80_S2_M9_MIXED NumSpatialStreams 2

set legacyPs10_PS_5_80_S3_M9_LEG ${legacyPs10_5_80_LEG}
keylset legacyPs10_PS_5_80_S3_M9_LEG NumSpatialStreams 3

set legacyPs10_PS_5_80_S3_M9_MIXED ${legacyPs10_5_80_MIXED}
keylset legacyPs10_PS_5_80_S3_M9_MIXED NumSpatialStreams 3

set legacyPs10_PS_5_80_S4_M9_LEG ${legacyPs10_5_80_LEG}
keylset legacyPs10_PS_5_80_S4_M9_LEG NumSpatialStreams 4

set legacyPs10_PS_5_80_S4_M9_MIXED ${legacyPs10_5_80_MIXED}
keylset legacyPs10_PS_5_80_S4_M9_MIXED NumSpatialStreams 4

# legacyPs2 settings

# Base settings from PS_24_20_M15_LEG
keylset legacyPs2_Base BaseIp 192.168.1.10
keylset legacyPs2_Base ChannelModel Bypass
keylset legacyPs2_Base Dhcp Enable
keylset legacyPs2_Base Dut generic_dut_24
keylset legacyPs2_Base EnableAMPDUaggregation 1
keylset legacyPs2_Base EnableAMSDUaggregation 0
keylset legacyPs2_Base EnableIpv6 0
keylset legacyPs2_Base EnableLDPC False
keylset legacyPs2_Base Gateway 192.168.1.1
keylset legacyPs2_Base GratuitousArp True
keylset legacyPs2_Base GroupType 802.11ac
keylset legacyPs2_Base GuardInterval standard
keylset legacyPs2_Base Hops 0
keylset legacyPs2_Base IncrIp Normal
keylset legacyPs2_Base KeepAlive True
keylset legacyPs2_Base LegacyPs 1
keylset legacyPs2_Base ListenInt 2
keylset legacyPs2_Base MacAddress 00:00:01:00:00:01
keylset legacyPs2_Base MacAddressIncr 1
keylset legacyPs2_Base Method {WPA2-PSK}
keylset legacyPs2_Base MgmtPhyRate 24
keylset legacyPs2_Base MimoId 2
keylset legacyPs2_Base NumTxAntennas $Num24Antennas
keylset legacyPs2_Base PlcpConfiguration mixed
keylset legacyPs2_Base PskAscii charter123
keylset legacyPs2_Base Qos Enable
keylset legacyPs2_Base RateAdapt 0
keylset legacyPs2_Base SnrVal 40
keylset legacyPs2_Base Ssid $SSID_24
keylset legacyPs2_Base SubnetMask 255.255.0.0
keylset legacyPs2_Base TransmitDeference 1
keylset legacyPs2_Base Wlan80211eQoSAC 0
keylset legacyPs2_Base phyInterface 802.11n

set legacyPs2_24_20_Base ${legacyPs2_Base}
keylset legacyPs2_24_20_Base ChannelBandwidth 20
keylset legacyPs2_24_20_Base DataMcsIndex 15

set legacyPs2_24_20_LEG ${legacyPs2_24_20_Base}
# Nothing to do. Same as legacyPs2_24_20_Base

set legacyPs2_24_20_MIXED ${legacyPs2_24_20_Base}
keylset legacyPs2_24_20_MIXED DistId 3

set legacyPs2_5_40_Base ${legacyPs2_Base}
keylset legacyPs2_5_40_Base ChannelBandwidth 40
keylset legacyPs2_5_40_Base DataMcsIndex 15
keylset legacyPs2_5_40_Base Dut generic_dut_5
keylset legacyPs2_5_40_Base MimoId 3
keylset legacyPs2_5_40_Base NumTxAntennas $Num5Antennas
keylset legacyPs2_5_40_Base Ssid $SSID_5
keylset legacyPs2_5_40_Base GuardInterval short

set legacyPs2_5_40_LEG ${legacyPs2_5_40_Base}
# Nothing to do. Same as legacyPs2_5_40_Base

set legacyPs2_5_40_MIXED ${legacyPs2_5_40_Base}
keylset legacyPs2_5_40_MIXED DistId 3

set legacyPs2_5_80_Base ${legacyPs2_Base}
keylset legacyPs2_5_80_Base DistId 3
keylset legacyPs2_5_80_Base Dut generic_dut_5
keylset legacyPs2_5_80_Base EnableMuSuMimo False
keylset legacyPs2_5_80_Base GuardInterval short
keylset legacyPs2_5_80_Base MimoId 3
keylset legacyPs2_5_80_Base MimoMode mu-mimo
keylset legacyPs2_5_80_Base NumSpatialStreams 1
keylset legacyPs2_5_80_Base NumTxAntennas $Num5Antennas
keylset legacyPs2_5_80_Base PlcpConfiguration vht_mixed
keylset legacyPs2_5_80_Base SigBandwidth 80
keylset legacyPs2_5_80_Base Ssid $SSID_5
keylset legacyPs2_5_80_Base USDataMcs 9
keylset legacyPs2_5_80_Base USManagementMcs 11
keylset legacyPs2_5_80_Base VhtDataMcs 9
keylset legacyPs2_5_80_Base phyInterface 802.11ac

set legacyPs2_PS_24_20_M15_LEG ${legacyPs2_24_20_LEG}
# Nothing to do. Same as legacyPs2_24_20_LEG

set legacyPs2_PS_24_20_M15_MIXED ${legacyPs2_24_20_MIXED}
# Nothing to do. Same as legacyPs2_24_20_MIXED

set legacyPs2_PS_24_20_M23_LEG ${legacyPs2_24_20_LEG}
keylset legacyPs2_PS_24_20_M23_LEG DataMcsIndex 23

set legacyPs2_PS_24_20_M23_MIXED ${legacyPs2_24_20_MIXED}
keylset legacyPs2_PS_24_20_M23_MIXED DataMcsIndex 23

set legacyPs2_PS_24_20_M31_LEG ${legacyPs2_24_20_LEG}
keylset legacyPs2_PS_24_20_M31_LEG DataMcsIndex 31

set legacyPs2_PS_24_20_M31_MIXED ${legacyPs2_24_20_MIXED}
keylset legacyPs2_PS_24_20_M31_MIXED DataMcsIndex 31

set legacyPs2_PS_24_20_M7_LEG ${legacyPs2_24_20_LEG}
keylset legacyPs2_PS_24_20_M7_LEG DataMcsIndex 7

set legacyPs2_PS_24_20_M7_MIXED ${legacyPs2_24_20_MIXED}
keylset legacyPs2_PS_24_20_M7_MIXED DataMcsIndex 7

set legacyPs2_PS_5_40_M15_LEG ${legacyPs2_5_40_LEG}
# Nothing to do. Same as legacyPs2_5_40_LEG

set legacyPs2_PS_5_40_M15_MIXED ${legacyPs2_5_40_MIXED}
# Nothing to do. Same as legacyPs2_5_40_MIXED

set legacyPs2_PS_5_40_M23_LEG ${legacyPs2_5_40_LEG}
keylset legacyPs2_PS_5_40_M23_LEG DataMcsIndex 23

set legacyPs2_PS_5_40_M23_MIXED ${legacyPs2_5_40_MIXED}
keylset legacyPs2_PS_5_40_M23_MIXED DataMcsIndex 23

set legacyPs2_PS_5_40_M31_LEG ${legacyPs2_5_40_LEG}
keylset legacyPs2_PS_5_40_M31_LEG DataMcsIndex 31

set legacyPs2_PS_5_40_M31_MIXED ${legacyPs2_5_40_MIXED}
keylset legacyPs2_PS_5_40_M31_MIXED DataMcsIndex 31

set legacyPs2_PS_5_40_M7_LEG ${legacyPs2_5_40_LEG}
keylset legacyPs2_PS_5_40_M7_LEG DataMcsIndex 7

set legacyPs2_PS_5_40_M7_MIXED ${legacyPs2_5_40_MIXED}
keylset legacyPs2_PS_5_40_M7_MIXED DataMcsIndex 7

set legacyPs2_PS_5_80_S1_M9_LEG ${legacyPs2_5_80_Base}
# Nothing to do. Same as legacyPs2_5_80_Base

set legacyPs2_PS_5_80_S1_M9_MIXED ${legacyPs2_5_80_Base}
# Nothing to do. Same as legacyPs2_5_80_Base

set legacyPs2_PS_5_80_S2_M9_LEG ${legacyPs2_5_80_Base}
keylset legacyPs2_PS_5_80_S2_M9_LEG NumSpatialStreams 2

set legacyPs2_PS_5_80_S2_M9_MIXED ${legacyPs2_5_80_Base}
keylset legacyPs2_PS_5_80_S2_M9_MIXED NumSpatialStreams 2

set legacyPs2_PS_5_80_S3_M9_LEG ${legacyPs2_5_80_Base}
keylset legacyPs2_PS_5_80_S3_M9_LEG NumSpatialStreams 3

set legacyPs2_PS_5_80_S3_M9_MIXED ${legacyPs2_5_80_Base}
keylset legacyPs2_PS_5_80_S3_M9_MIXED NumSpatialStreams 3

set legacyPs2_PS_5_80_S4_M9_LEG ${legacyPs2_5_80_Base}
keylset legacyPs2_PS_5_80_S4_M9_LEG NumSpatialStreams 4

set legacyPs2_PS_5_80_S4_M9_MIXED ${legacyPs2_5_80_Base}
keylset legacyPs2_PS_5_80_S4_M9_MIXED NumSpatialStreams 4

# legacyPs6 settings

# Base settings from PS_24_20_M15_LEG
keylset legacyPs6_Base BaseIp 192.168.2.10
keylset legacyPs6_Base ChannelModel Bypass
keylset legacyPs6_Base Dhcp Enable
keylset legacyPs6_Base Dut generic_dut_24
keylset legacyPs6_Base EnableAMPDUaggregation 1
keylset legacyPs6_Base EnableAMSDUaggregation 0
keylset legacyPs6_Base EnableIpv6 0
keylset legacyPs6_Base EnableLDPC False
keylset legacyPs6_Base Gateway 192.168.1.1
keylset legacyPs6_Base GratuitousArp True
keylset legacyPs6_Base GroupType 802.11ac
keylset legacyPs6_Base GuardInterval standard
keylset legacyPs6_Base IncrIp Normal
keylset legacyPs6_Base KeepAlive True
keylset legacyPs6_Base LegacyPs 1
keylset legacyPs6_Base ListenInt 6
keylset legacyPs6_Base MacAddress 00:00:01:00:01:01
keylset legacyPs6_Base MacAddressIncr 1
keylset legacyPs6_Base Method {WPA2-PSK}
keylset legacyPs6_Base MgmtPhyRate 24
keylset legacyPs6_Base MimoId 2
keylset legacyPs6_Base NumTxAntennas $Num24Antennas
keylset legacyPs6_Base PlcpConfiguration mixed
keylset legacyPs6_Base PskAscii charter123
keylset legacyPs6_Base Qos Enable
keylset legacyPs6_Base RateAdapt 0
keylset legacyPs6_Base SnrVal 40
keylset legacyPs6_Base Ssid $SSID_24
keylset legacyPs6_Base SubnetMask 255.255.0.0
keylset legacyPs6_Base TransmitDeference 1
keylset legacyPs6_Base Wlan80211eQoSAC 0
keylset legacyPs6_Base phyInterface 802.11n

set legacyPs6_24_20_Base ${legacyPs6_Base}
keylset legacyPs6_24_20_Base ChannelBandwidth 20
keylset legacyPs6_24_20_Base DataMcsIndex 15

set legacyPs6_5_40_Base ${legacyPs6_Base}
keylset legacyPs6_5_40_Base ChannelBandwidth 40
keylset legacyPs6_5_40_Base DataMcsIndex 15
keylset legacyPs6_5_40_Base Dut generic_dut_5
keylset legacyPs6_5_40_Base MimoId 3
keylset legacyPs6_5_40_Base NumTxAntennas $Num5Antennas
keylset legacyPs6_5_40_Base Ssid $SSID_5
keylset legacyPs6_5_40_Base GuardInterval short

set legacyPs6_5_80_Base ${legacyPs6_Base}
keylset legacyPs6_5_80_Base DistId 3
keylset legacyPs6_5_80_Base Dut generic_dut_5
keylset legacyPs6_5_80_Base EnableMuSuMimo False
keylset legacyPs6_5_80_Base GuardInterval short
keylset legacyPs6_5_80_Base MimoId 3
keylset legacyPs6_5_80_Base MimoMode mu-mimo
keylset legacyPs6_5_80_Base NumSpatialStreams 1
keylset legacyPs6_5_80_Base NumTxAntennas $Num5Antennas
keylset legacyPs6_5_80_Base PlcpConfiguration vht_mixed
keylset legacyPs6_5_80_Base SigBandwidth 80
keylset legacyPs6_5_80_Base Ssid $SSID_5
keylset legacyPs6_5_80_Base USDataMcs 9
keylset legacyPs6_5_80_Base USManagementMcs 11
keylset legacyPs6_5_80_Base VhtDataMcs 9
keylset legacyPs6_5_80_Base phyInterface 802.11ac

set legacyPs6_PS_24_20_M15_LEG ${legacyPs6_24_20_Base}
# Nothing to do. Same as legacyPs6_24_20_Base

set legacyPs6_PS_24_20_M23_LEG ${legacyPs6_24_20_Base}
keylset legacyPs6_PS_24_20_M23_LEG DataMcsIndex 23

set legacyPs6_PS_24_20_M31_LEG ${legacyPs6_24_20_Base}
keylset legacyPs6_PS_24_20_M31_LEG DataMcsIndex 31

set legacyPs6_PS_24_20_M7_LEG ${legacyPs6_24_20_Base}
keylset legacyPs6_PS_24_20_M7_LEG DataMcsIndex 7

set legacyPs6_PS_5_40_M15_LEG ${legacyPs6_5_40_Base}
# Nothing to do. Same as legacyPs6_5_40_Base

set legacyPs6_PS_5_40_M23_LEG ${legacyPs6_5_40_Base}
keylset legacyPs6_PS_5_40_M23_LEG DataMcsIndex 23

set legacyPs6_PS_5_40_M31_LEG ${legacyPs6_5_40_Base}
keylset legacyPs6_PS_5_40_M31_LEG DataMcsIndex 31

set legacyPs6_PS_5_40_M7_LEG ${legacyPs6_5_40_Base}
keylset legacyPs6_PS_5_40_M7_LEG DataMcsIndex 7

set legacyPs6_PS_5_80_S1_M9_LEG ${legacyPs6_5_80_Base}
# Nothing to do. Same as legacyPs6_5_80_Base

set legacyPs6_PS_5_80_S2_M9_LEG ${legacyPs6_5_80_Base}
keylset legacyPs6_PS_5_80_S2_M9_LEG NumSpatialStreams 2

set legacyPs6_PS_5_80_S3_M9_LEG ${legacyPs6_5_80_Base}
keylset legacyPs6_PS_5_80_S3_M9_LEG NumSpatialStreams 3

set legacyPs6_PS_5_80_S4_M9_LEG ${legacyPs6_5_80_Base}
keylset legacyPs6_PS_5_80_S4_M9_LEG NumSpatialStreams 4

# Test List start

# PS_24_20_M15_LEG
keylset PS_24_20_M15_LEG ClientMix.awakeClient_PS_24_20_M15_LEG.Percentage 25.0
keylset PS_24_20_M15_LEG ClientMix.awakeClient_PS_24_20_M15_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_LEG ClientMix.awakeClient_PS_24_20_M15_LEG.delay 0
keylset PS_24_20_M15_LEG ClientMix.awakeClient_PS_24_20_M15_LEG.endTime END
keylset PS_24_20_M15_LEG ClientMix.legacyPs10_PS_24_20_M15_LEG.Percentage 25.0
keylset PS_24_20_M15_LEG ClientMix.legacyPs10_PS_24_20_M15_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_LEG ClientMix.legacyPs10_PS_24_20_M15_LEG.delay 0
keylset PS_24_20_M15_LEG ClientMix.legacyPs10_PS_24_20_M15_LEG.endTime END
keylset PS_24_20_M15_LEG ClientMix.legacyPs2_PS_24_20_M15_LEG.Percentage 25.0
keylset PS_24_20_M15_LEG ClientMix.legacyPs2_PS_24_20_M15_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_LEG ClientMix.legacyPs2_PS_24_20_M15_LEG.delay 0
keylset PS_24_20_M15_LEG ClientMix.legacyPs2_PS_24_20_M15_LEG.endTime END
keylset PS_24_20_M15_LEG ClientMix.legacyPs6_PS_24_20_M15_LEG.Percentage 25.0
keylset PS_24_20_M15_LEG ClientMix.legacyPs6_PS_24_20_M15_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_LEG ClientMix.legacyPs6_PS_24_20_M15_LEG.delay 0
keylset PS_24_20_M15_LEG ClientMix.legacyPs6_PS_24_20_M15_LEG.endTime END
keylset PS_24_20_M15_LEG Test wimix_script
keylset PS_24_20_M15_LEG contAdminControlFlag 1
keylset PS_24_20_M15_LEG continueFlag 0
keylset PS_24_20_M15_LEG loadMode 0
keylset PS_24_20_M15_LEG loadSweepEnd 20
keylset PS_24_20_M15_LEG loadSweepStart 10
keylset PS_24_20_M15_LEG loadSweepStep 1
keylset PS_24_20_M15_LEG loadVal 4
keylset PS_24_20_M15_LEG staggerStart 0
keylset PS_24_20_M15_LEG staggerStartInt 1
keylset PS_24_20_M15_LEG testProfile PowerSave
keylset PS_24_20_M15_LEG testProfileImage images/wimix_new.png
keylset PS_24_20_M15_LEG totalClientPer 100.0
keylset PS_24_20_M15_LEG totalLoadPer 100.0
keylset PS_24_20_M15_LEG wimixMode Client
keylset PS_24_20_M15_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M15_MIXED
keylset PS_24_20_M15_MIXED ClientMix.awakeClient_PS_24_20_M15_MIXED.Percentage 20.0
keylset PS_24_20_M15_MIXED ClientMix.awakeClient_PS_24_20_M15_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_MIXED ClientMix.awakeClient_PS_24_20_M15_MIXED.delay 0
keylset PS_24_20_M15_MIXED ClientMix.awakeClient_PS_24_20_M15_MIXED.endTime END
keylset PS_24_20_M15_MIXED ClientMix.legacyPs10_PS_24_20_M15_MIXED.Percentage 20.0
keylset PS_24_20_M15_MIXED ClientMix.legacyPs10_PS_24_20_M15_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_MIXED ClientMix.legacyPs10_PS_24_20_M15_MIXED.delay 0
keylset PS_24_20_M15_MIXED ClientMix.legacyPs10_PS_24_20_M15_MIXED.endTime END
keylset PS_24_20_M15_MIXED ClientMix.legacyPs2_PS_24_20_M15_MIXED.Percentage 20.0
keylset PS_24_20_M15_MIXED ClientMix.legacyPs2_PS_24_20_M15_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_MIXED ClientMix.legacyPs2_PS_24_20_M15_MIXED.delay 0
keylset PS_24_20_M15_MIXED ClientMix.legacyPs2_PS_24_20_M15_MIXED.endTime END
keylset PS_24_20_M15_MIXED ClientMix.wmmPs10_PS_24_20_M15_MIXED.Percentage 20.0
keylset PS_24_20_M15_MIXED ClientMix.wmmPs10_PS_24_20_M15_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_MIXED ClientMix.wmmPs10_PS_24_20_M15_MIXED.delay 0
keylset PS_24_20_M15_MIXED ClientMix.wmmPs10_PS_24_20_M15_MIXED.endTime END
keylset PS_24_20_M15_MIXED ClientMix.wmmPs2_PS_24_20_M15_MIXED.Percentage 20.0
keylset PS_24_20_M15_MIXED ClientMix.wmmPs2_PS_24_20_M15_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_MIXED ClientMix.wmmPs2_PS_24_20_M15_MIXED.delay 0
keylset PS_24_20_M15_MIXED ClientMix.wmmPs2_PS_24_20_M15_MIXED.endTime END
keylset PS_24_20_M15_MIXED Test wimix_script
keylset PS_24_20_M15_MIXED continueFlag 0
keylset PS_24_20_M15_MIXED loadMode 0
keylset PS_24_20_M15_MIXED loadSweepEnd 20
keylset PS_24_20_M15_MIXED loadSweepStart 10
keylset PS_24_20_M15_MIXED loadSweepStep 1
keylset PS_24_20_M15_MIXED loadVal 5
keylset PS_24_20_M15_MIXED staggerStart 0
keylset PS_24_20_M15_MIXED staggerStartInt 1
keylset PS_24_20_M15_MIXED testProfile PowerSave
keylset PS_24_20_M15_MIXED testProfileImage images/wimix_new.png
keylset PS_24_20_M15_MIXED totalClientPer 100.0
keylset PS_24_20_M15_MIXED totalLoadPer 100.0
keylset PS_24_20_M15_MIXED wimixMode Client
keylset PS_24_20_M15_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M15_WMM
keylset PS_24_20_M15_WMM ClientMix.awakeClient_PS_24_20_M15_WMM.Percentage 25.0
keylset PS_24_20_M15_WMM ClientMix.awakeClient_PS_24_20_M15_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_WMM ClientMix.awakeClient_PS_24_20_M15_WMM.delay 0
keylset PS_24_20_M15_WMM ClientMix.awakeClient_PS_24_20_M15_WMM.endTime END
keylset PS_24_20_M15_WMM ClientMix.wmmPs10_PS_24_20_M15_WMM.Percentage 25.0
keylset PS_24_20_M15_WMM ClientMix.wmmPs10_PS_24_20_M15_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_WMM ClientMix.wmmPs10_PS_24_20_M15_WMM.delay 0
keylset PS_24_20_M15_WMM ClientMix.wmmPs10_PS_24_20_M15_WMM.endTime END
keylset PS_24_20_M15_WMM ClientMix.wmmPs2_PS_24_20_M15_WMM.Percentage 25.0
keylset PS_24_20_M15_WMM ClientMix.wmmPs2_PS_24_20_M15_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_WMM ClientMix.wmmPs2_PS_24_20_M15_WMM.delay 0
keylset PS_24_20_M15_WMM ClientMix.wmmPs2_PS_24_20_M15_WMM.endTime END
keylset PS_24_20_M15_WMM ClientMix.wmmPs6_PS_24_20_M15_WMM.Percentage 25.0
keylset PS_24_20_M15_WMM ClientMix.wmmPs6_PS_24_20_M15_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M15_WMM ClientMix.wmmPs6_PS_24_20_M15_WMM.delay 0
keylset PS_24_20_M15_WMM ClientMix.wmmPs6_PS_24_20_M15_WMM.endTime END
keylset PS_24_20_M15_WMM Test wimix_script
keylset PS_24_20_M15_WMM contAdminControlFlag 1
keylset PS_24_20_M15_WMM continueFlag 0
keylset PS_24_20_M15_WMM loadMode 0
keylset PS_24_20_M15_WMM loadSweepEnd 20
keylset PS_24_20_M15_WMM loadSweepStart 10
keylset PS_24_20_M15_WMM loadSweepStep 1
keylset PS_24_20_M15_WMM loadVal 4
keylset PS_24_20_M15_WMM staggerStart 0
keylset PS_24_20_M15_WMM staggerStartInt 1
keylset PS_24_20_M15_WMM testProfile PowerSave
keylset PS_24_20_M15_WMM testProfileImage images/wimix_new.png
keylset PS_24_20_M15_WMM totalClientPer 100.0
keylset PS_24_20_M15_WMM totalLoadPer 100.0
keylset PS_24_20_M15_WMM wimixMode Client
keylset PS_24_20_M15_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M23_LEG
keylset PS_24_20_M23_LEG ClientMix.awakeClient_PS_24_20_M23_LEG.Percentage 25.0
keylset PS_24_20_M23_LEG ClientMix.awakeClient_PS_24_20_M23_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_LEG ClientMix.awakeClient_PS_24_20_M23_LEG.delay 0
keylset PS_24_20_M23_LEG ClientMix.awakeClient_PS_24_20_M23_LEG.endTime END
keylset PS_24_20_M23_LEG ClientMix.legacyPs10_PS_24_20_M23_LEG.Percentage 25.0
keylset PS_24_20_M23_LEG ClientMix.legacyPs10_PS_24_20_M23_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_LEG ClientMix.legacyPs10_PS_24_20_M23_LEG.delay 0
keylset PS_24_20_M23_LEG ClientMix.legacyPs10_PS_24_20_M23_LEG.endTime END
keylset PS_24_20_M23_LEG ClientMix.legacyPs2_PS_24_20_M23_LEG.Percentage 25.0
keylset PS_24_20_M23_LEG ClientMix.legacyPs2_PS_24_20_M23_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_LEG ClientMix.legacyPs2_PS_24_20_M23_LEG.delay 0
keylset PS_24_20_M23_LEG ClientMix.legacyPs2_PS_24_20_M23_LEG.endTime END
keylset PS_24_20_M23_LEG ClientMix.legacyPs6_PS_24_20_M23_LEG.Percentage 25.0
keylset PS_24_20_M23_LEG ClientMix.legacyPs6_PS_24_20_M23_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_LEG ClientMix.legacyPs6_PS_24_20_M23_LEG.delay 0
keylset PS_24_20_M23_LEG ClientMix.legacyPs6_PS_24_20_M23_LEG.endTime END
keylset PS_24_20_M23_LEG Test wimix_script
keylset PS_24_20_M23_LEG contAdminControlFlag 1
keylset PS_24_20_M23_LEG continueFlag 0
keylset PS_24_20_M23_LEG loadMode 0
keylset PS_24_20_M23_LEG loadSweepEnd 20
keylset PS_24_20_M23_LEG loadSweepStart 10
keylset PS_24_20_M23_LEG loadSweepStep 1
keylset PS_24_20_M23_LEG loadVal 4
keylset PS_24_20_M23_LEG staggerStart 0
keylset PS_24_20_M23_LEG staggerStartInt 1
keylset PS_24_20_M23_LEG testProfile PowerSave
keylset PS_24_20_M23_LEG testProfileImage images/wimix_new.png
keylset PS_24_20_M23_LEG totalClientPer 100.0
keylset PS_24_20_M23_LEG totalLoadPer 100.0
keylset PS_24_20_M23_LEG wimixMode Client
keylset PS_24_20_M23_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M23_MIXED
keylset PS_24_20_M23_MIXED ClientMix.awakeClient_PS_24_20_M23_MIXED.Percentage 20.0
keylset PS_24_20_M23_MIXED ClientMix.awakeClient_PS_24_20_M23_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_MIXED ClientMix.awakeClient_PS_24_20_M23_MIXED.delay 0
keylset PS_24_20_M23_MIXED ClientMix.awakeClient_PS_24_20_M23_MIXED.endTime END
keylset PS_24_20_M23_MIXED ClientMix.legacyPs10_PS_24_20_M23_MIXED.Percentage 20.0
keylset PS_24_20_M23_MIXED ClientMix.legacyPs10_PS_24_20_M23_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_MIXED ClientMix.legacyPs10_PS_24_20_M23_MIXED.delay 0
keylset PS_24_20_M23_MIXED ClientMix.legacyPs10_PS_24_20_M23_MIXED.endTime END
keylset PS_24_20_M23_MIXED ClientMix.legacyPs2_PS_24_20_M23_MIXED.Percentage 20.0
keylset PS_24_20_M23_MIXED ClientMix.legacyPs2_PS_24_20_M23_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_MIXED ClientMix.legacyPs2_PS_24_20_M23_MIXED.delay 0
keylset PS_24_20_M23_MIXED ClientMix.legacyPs2_PS_24_20_M23_MIXED.endTime END
keylset PS_24_20_M23_MIXED ClientMix.wmmPs10_PS_24_20_M23_MIXED.Percentage 20.0
keylset PS_24_20_M23_MIXED ClientMix.wmmPs10_PS_24_20_M23_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_MIXED ClientMix.wmmPs10_PS_24_20_M23_MIXED.delay 0
keylset PS_24_20_M23_MIXED ClientMix.wmmPs10_PS_24_20_M23_MIXED.endTime END
keylset PS_24_20_M23_MIXED ClientMix.wmmPs2_PS_24_20_M23_MIXED.Percentage 20.0
keylset PS_24_20_M23_MIXED ClientMix.wmmPs2_PS_24_20_M23_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_MIXED ClientMix.wmmPs2_PS_24_20_M23_MIXED.delay 0
keylset PS_24_20_M23_MIXED ClientMix.wmmPs2_PS_24_20_M23_MIXED.endTime END
keylset PS_24_20_M23_MIXED Test wimix_script
keylset PS_24_20_M23_MIXED continueFlag 0
keylset PS_24_20_M23_MIXED loadMode 0
keylset PS_24_20_M23_MIXED loadSweepEnd 20
keylset PS_24_20_M23_MIXED loadSweepStart 10
keylset PS_24_20_M23_MIXED loadSweepStep 1
keylset PS_24_20_M23_MIXED loadVal 5
keylset PS_24_20_M23_MIXED staggerStart 0
keylset PS_24_20_M23_MIXED staggerStartInt 1
keylset PS_24_20_M23_MIXED testProfile PowerSave
keylset PS_24_20_M23_MIXED testProfileImage images/wimix_new.png
keylset PS_24_20_M23_MIXED totalClientPer 100.0
keylset PS_24_20_M23_MIXED totalLoadPer 100.0
keylset PS_24_20_M23_MIXED wimixMode Client
keylset PS_24_20_M23_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M23_WMM
keylset PS_24_20_M23_WMM ClientMix.awakeClient_PS_24_20_M23_WMM.Percentage 25.0
keylset PS_24_20_M23_WMM ClientMix.awakeClient_PS_24_20_M23_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_WMM ClientMix.awakeClient_PS_24_20_M23_WMM.delay 0
keylset PS_24_20_M23_WMM ClientMix.awakeClient_PS_24_20_M23_WMM.endTime END
keylset PS_24_20_M23_WMM ClientMix.wmmPs10_PS_24_20_M23_WMM.Percentage 25.0
keylset PS_24_20_M23_WMM ClientMix.wmmPs10_PS_24_20_M23_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_WMM ClientMix.wmmPs10_PS_24_20_M23_WMM.delay 0
keylset PS_24_20_M23_WMM ClientMix.wmmPs10_PS_24_20_M23_WMM.endTime END
keylset PS_24_20_M23_WMM ClientMix.wmmPs2_PS_24_20_M23_WMM.Percentage 25.0
keylset PS_24_20_M23_WMM ClientMix.wmmPs2_PS_24_20_M23_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_WMM ClientMix.wmmPs2_PS_24_20_M23_WMM.delay 0
keylset PS_24_20_M23_WMM ClientMix.wmmPs2_PS_24_20_M23_WMM.endTime END
keylset PS_24_20_M23_WMM ClientMix.wmmPs6_PS_24_20_M23_WMM.Percentage 25.0
keylset PS_24_20_M23_WMM ClientMix.wmmPs6_PS_24_20_M23_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M23_WMM ClientMix.wmmPs6_PS_24_20_M23_WMM.delay 0
keylset PS_24_20_M23_WMM ClientMix.wmmPs6_PS_24_20_M23_WMM.endTime END
keylset PS_24_20_M23_WMM Test wimix_script
keylset PS_24_20_M23_WMM contAdminControlFlag 1
keylset PS_24_20_M23_WMM continueFlag 0
keylset PS_24_20_M23_WMM loadMode 0
keylset PS_24_20_M23_WMM loadSweepEnd 20
keylset PS_24_20_M23_WMM loadSweepStart 10
keylset PS_24_20_M23_WMM loadSweepStep 1
keylset PS_24_20_M23_WMM loadVal 4
keylset PS_24_20_M23_WMM staggerStart 0
keylset PS_24_20_M23_WMM staggerStartInt 1
keylset PS_24_20_M23_WMM testProfile PowerSave
keylset PS_24_20_M23_WMM testProfileImage images/wimix_new.png
keylset PS_24_20_M23_WMM totalClientPer 100.0
keylset PS_24_20_M23_WMM totalLoadPer 100.0
keylset PS_24_20_M23_WMM wimixMode Client
keylset PS_24_20_M23_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M31_LEG
keylset PS_24_20_M31_LEG ClientMix.awakeClient_PS_24_20_M31_LEG.Percentage 25.0
keylset PS_24_20_M31_LEG ClientMix.awakeClient_PS_24_20_M31_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_LEG ClientMix.awakeClient_PS_24_20_M31_LEG.delay 0
keylset PS_24_20_M31_LEG ClientMix.awakeClient_PS_24_20_M31_LEG.endTime END
keylset PS_24_20_M31_LEG ClientMix.legacyPs10_PS_24_20_M31_LEG.Percentage 25.0
keylset PS_24_20_M31_LEG ClientMix.legacyPs10_PS_24_20_M31_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_LEG ClientMix.legacyPs10_PS_24_20_M31_LEG.delay 0
keylset PS_24_20_M31_LEG ClientMix.legacyPs10_PS_24_20_M31_LEG.endTime END
keylset PS_24_20_M31_LEG ClientMix.legacyPs2_PS_24_20_M31_LEG.Percentage 25.0
keylset PS_24_20_M31_LEG ClientMix.legacyPs2_PS_24_20_M31_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_LEG ClientMix.legacyPs2_PS_24_20_M31_LEG.delay 0
keylset PS_24_20_M31_LEG ClientMix.legacyPs2_PS_24_20_M31_LEG.endTime END
keylset PS_24_20_M31_LEG ClientMix.legacyPs6_PS_24_20_M31_LEG.Percentage 25.0
keylset PS_24_20_M31_LEG ClientMix.legacyPs6_PS_24_20_M31_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_LEG ClientMix.legacyPs6_PS_24_20_M31_LEG.delay 0
keylset PS_24_20_M31_LEG ClientMix.legacyPs6_PS_24_20_M31_LEG.endTime END
keylset PS_24_20_M31_LEG Test wimix_script
keylset PS_24_20_M31_LEG contAdminControlFlag 1
keylset PS_24_20_M31_LEG continueFlag 0
keylset PS_24_20_M31_LEG loadMode 0
keylset PS_24_20_M31_LEG loadSweepEnd 20
keylset PS_24_20_M31_LEG loadSweepStart 10
keylset PS_24_20_M31_LEG loadSweepStep 1
keylset PS_24_20_M31_LEG loadVal 4
keylset PS_24_20_M31_LEG staggerStart 0
keylset PS_24_20_M31_LEG staggerStartInt 1
keylset PS_24_20_M31_LEG testProfile PowerSave
keylset PS_24_20_M31_LEG testProfileImage images/wimix_new.png
keylset PS_24_20_M31_LEG totalClientPer 100.0
keylset PS_24_20_M31_LEG totalLoadPer 100.0
keylset PS_24_20_M31_LEG wimixMode Client
keylset PS_24_20_M31_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M31_MIXED
keylset PS_24_20_M31_MIXED ClientMix.awakeClient_PS_24_20_M31_MIXED.Percentage 20.0
keylset PS_24_20_M31_MIXED ClientMix.awakeClient_PS_24_20_M31_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_MIXED ClientMix.awakeClient_PS_24_20_M31_MIXED.delay 0
keylset PS_24_20_M31_MIXED ClientMix.awakeClient_PS_24_20_M31_MIXED.endTime END
keylset PS_24_20_M31_MIXED ClientMix.legacyPs10_PS_24_20_M31_MIXED.Percentage 20.0
keylset PS_24_20_M31_MIXED ClientMix.legacyPs10_PS_24_20_M31_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_MIXED ClientMix.legacyPs10_PS_24_20_M31_MIXED.delay 0
keylset PS_24_20_M31_MIXED ClientMix.legacyPs10_PS_24_20_M31_MIXED.endTime END
keylset PS_24_20_M31_MIXED ClientMix.legacyPs2_PS_24_20_M31_MIXED.Percentage 20.0
keylset PS_24_20_M31_MIXED ClientMix.legacyPs2_PS_24_20_M31_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_MIXED ClientMix.legacyPs2_PS_24_20_M31_MIXED.delay 0
keylset PS_24_20_M31_MIXED ClientMix.legacyPs2_PS_24_20_M31_MIXED.endTime END
keylset PS_24_20_M31_MIXED ClientMix.wmmPs10_PS_24_20_M31_MIXED.Percentage 20.0
keylset PS_24_20_M31_MIXED ClientMix.wmmPs10_PS_24_20_M31_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_MIXED ClientMix.wmmPs10_PS_24_20_M31_MIXED.delay 0
keylset PS_24_20_M31_MIXED ClientMix.wmmPs10_PS_24_20_M31_MIXED.endTime END
keylset PS_24_20_M31_MIXED ClientMix.wmmPs2_PS_24_20_M31_MIXED.Percentage 20.0
keylset PS_24_20_M31_MIXED ClientMix.wmmPs2_PS_24_20_M31_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_MIXED ClientMix.wmmPs2_PS_24_20_M31_MIXED.delay 0
keylset PS_24_20_M31_MIXED ClientMix.wmmPs2_PS_24_20_M31_MIXED.endTime END
keylset PS_24_20_M31_MIXED Test wimix_script
keylset PS_24_20_M31_MIXED continueFlag 0
keylset PS_24_20_M31_MIXED loadMode 0
keylset PS_24_20_M31_MIXED loadSweepEnd 20
keylset PS_24_20_M31_MIXED loadSweepStart 10
keylset PS_24_20_M31_MIXED loadSweepStep 1
keylset PS_24_20_M31_MIXED loadVal 5
keylset PS_24_20_M31_MIXED staggerStart 0
keylset PS_24_20_M31_MIXED staggerStartInt 1
keylset PS_24_20_M31_MIXED testProfile PowerSave
keylset PS_24_20_M31_MIXED testProfileImage images/wimix_new.png
keylset PS_24_20_M31_MIXED totalClientPer 100.0
keylset PS_24_20_M31_MIXED totalLoadPer 100.0
keylset PS_24_20_M31_MIXED wimixMode Client
keylset PS_24_20_M31_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M31_WMM
keylset PS_24_20_M31_WMM ClientMix.awakeClient_PS_24_20_M31_WMM.Percentage 25.0
keylset PS_24_20_M31_WMM ClientMix.awakeClient_PS_24_20_M31_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_WMM ClientMix.awakeClient_PS_24_20_M31_WMM.delay 0
keylset PS_24_20_M31_WMM ClientMix.awakeClient_PS_24_20_M31_WMM.endTime END
keylset PS_24_20_M31_WMM ClientMix.wmmPs10_PS_24_20_M31_WMM.Percentage 25.0
keylset PS_24_20_M31_WMM ClientMix.wmmPs10_PS_24_20_M31_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_WMM ClientMix.wmmPs10_PS_24_20_M31_WMM.delay 0
keylset PS_24_20_M31_WMM ClientMix.wmmPs10_PS_24_20_M31_WMM.endTime END
keylset PS_24_20_M31_WMM ClientMix.wmmPs2_PS_24_20_M31_WMM.Percentage 25.0
keylset PS_24_20_M31_WMM ClientMix.wmmPs2_PS_24_20_M31_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_WMM ClientMix.wmmPs2_PS_24_20_M31_WMM.delay 0
keylset PS_24_20_M31_WMM ClientMix.wmmPs2_PS_24_20_M31_WMM.endTime END
keylset PS_24_20_M31_WMM ClientMix.wmmPs6_PS_24_20_M31_WMM.Percentage 25.0
keylset PS_24_20_M31_WMM ClientMix.wmmPs6_PS_24_20_M31_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M31_WMM ClientMix.wmmPs6_PS_24_20_M31_WMM.delay 0
keylset PS_24_20_M31_WMM ClientMix.wmmPs6_PS_24_20_M31_WMM.endTime END
keylset PS_24_20_M31_WMM Test wimix_script
keylset PS_24_20_M31_WMM contAdminControlFlag 1
keylset PS_24_20_M31_WMM continueFlag 0
keylset PS_24_20_M31_WMM loadMode 0
keylset PS_24_20_M31_WMM loadSweepEnd 20
keylset PS_24_20_M31_WMM loadSweepStart 10
keylset PS_24_20_M31_WMM loadSweepStep 1
keylset PS_24_20_M31_WMM loadVal 4
keylset PS_24_20_M31_WMM staggerStart 0
keylset PS_24_20_M31_WMM staggerStartInt 1
keylset PS_24_20_M31_WMM testProfile PowerSave
keylset PS_24_20_M31_WMM testProfileImage images/wimix_new.png
keylset PS_24_20_M31_WMM totalClientPer 100.0
keylset PS_24_20_M31_WMM totalLoadPer 100.0
keylset PS_24_20_M31_WMM wimixMode Client
keylset PS_24_20_M31_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M7_LEG
keylset PS_24_20_M7_LEG ClientMix.awakeClient_PS_24_20_M7_LEG.Percentage 25.0
keylset PS_24_20_M7_LEG ClientMix.awakeClient_PS_24_20_M7_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_LEG ClientMix.awakeClient_PS_24_20_M7_LEG.delay 0
keylset PS_24_20_M7_LEG ClientMix.awakeClient_PS_24_20_M7_LEG.endTime END
keylset PS_24_20_M7_LEG ClientMix.legacyPs10_PS_24_20_M7_LEG.Percentage 25.0
keylset PS_24_20_M7_LEG ClientMix.legacyPs10_PS_24_20_M7_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_LEG ClientMix.legacyPs10_PS_24_20_M7_LEG.delay 0
keylset PS_24_20_M7_LEG ClientMix.legacyPs10_PS_24_20_M7_LEG.endTime END
keylset PS_24_20_M7_LEG ClientMix.legacyPs2_PS_24_20_M7_LEG.Percentage 25.0
keylset PS_24_20_M7_LEG ClientMix.legacyPs2_PS_24_20_M7_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_LEG ClientMix.legacyPs2_PS_24_20_M7_LEG.delay 0
keylset PS_24_20_M7_LEG ClientMix.legacyPs2_PS_24_20_M7_LEG.endTime END
keylset PS_24_20_M7_LEG ClientMix.legacyPs6_PS_24_20_M7_LEG.Percentage 25.0
keylset PS_24_20_M7_LEG ClientMix.legacyPs6_PS_24_20_M7_LEG.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_LEG ClientMix.legacyPs6_PS_24_20_M7_LEG.delay 0
keylset PS_24_20_M7_LEG ClientMix.legacyPs6_PS_24_20_M7_LEG.endTime END
keylset PS_24_20_M7_LEG Test wimix_script
keylset PS_24_20_M7_LEG contAdminControlFlag 1
keylset PS_24_20_M7_LEG continueFlag 0
keylset PS_24_20_M7_LEG loadMode 0
keylset PS_24_20_M7_LEG loadSweepEnd 20
keylset PS_24_20_M7_LEG loadSweepStart 10
keylset PS_24_20_M7_LEG loadSweepStep 1
keylset PS_24_20_M7_LEG loadVal 4
keylset PS_24_20_M7_LEG staggerStart 0
keylset PS_24_20_M7_LEG staggerStartInt 1
keylset PS_24_20_M7_LEG testProfile PowerSave
keylset PS_24_20_M7_LEG testProfileImage images/wimix_new.png
keylset PS_24_20_M7_LEG totalClientPer 100.0
keylset PS_24_20_M7_LEG totalLoadPer 100.0
keylset PS_24_20_M7_LEG wimixMode Client
keylset PS_24_20_M7_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M7_MIXED
keylset PS_24_20_M7_MIXED ClientMix.awakeClient_PS_24_20_M7_MIXED.Percentage 20.0
keylset PS_24_20_M7_MIXED ClientMix.awakeClient_PS_24_20_M7_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_MIXED ClientMix.awakeClient_PS_24_20_M7_MIXED.delay 0
keylset PS_24_20_M7_MIXED ClientMix.awakeClient_PS_24_20_M7_MIXED.endTime END
keylset PS_24_20_M7_MIXED ClientMix.legacyPs10_PS_24_20_M7_MIXED.Percentage 20.0
keylset PS_24_20_M7_MIXED ClientMix.legacyPs10_PS_24_20_M7_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_MIXED ClientMix.legacyPs10_PS_24_20_M7_MIXED.delay 0
keylset PS_24_20_M7_MIXED ClientMix.legacyPs10_PS_24_20_M7_MIXED.endTime END
keylset PS_24_20_M7_MIXED ClientMix.legacyPs2_PS_24_20_M7_MIXED.Percentage 20.0
keylset PS_24_20_M7_MIXED ClientMix.legacyPs2_PS_24_20_M7_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_MIXED ClientMix.legacyPs2_PS_24_20_M7_MIXED.delay 0
keylset PS_24_20_M7_MIXED ClientMix.legacyPs2_PS_24_20_M7_MIXED.endTime END
keylset PS_24_20_M7_MIXED ClientMix.wmmPs10_PS_24_20_M7_MIXED.Percentage 20.0
keylset PS_24_20_M7_MIXED ClientMix.wmmPs10_PS_24_20_M7_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_MIXED ClientMix.wmmPs10_PS_24_20_M7_MIXED.delay 0
keylset PS_24_20_M7_MIXED ClientMix.wmmPs10_PS_24_20_M7_MIXED.endTime END
keylset PS_24_20_M7_MIXED ClientMix.wmmPs2_PS_24_20_M7_MIXED.Percentage 20.0
keylset PS_24_20_M7_MIXED ClientMix.wmmPs2_PS_24_20_M7_MIXED.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_MIXED ClientMix.wmmPs2_PS_24_20_M7_MIXED.delay 0
keylset PS_24_20_M7_MIXED ClientMix.wmmPs2_PS_24_20_M7_MIXED.endTime END
keylset PS_24_20_M7_MIXED Test wimix_script
keylset PS_24_20_M7_MIXED continueFlag 0
keylset PS_24_20_M7_MIXED loadMode 0
keylset PS_24_20_M7_MIXED loadSweepEnd 20
keylset PS_24_20_M7_MIXED loadSweepStart 10
keylset PS_24_20_M7_MIXED loadSweepStep 1
keylset PS_24_20_M7_MIXED loadVal 5
keylset PS_24_20_M7_MIXED staggerStart 0
keylset PS_24_20_M7_MIXED staggerStartInt 1
keylset PS_24_20_M7_MIXED testProfile PowerSave
keylset PS_24_20_M7_MIXED testProfileImage images/wimix_new.png
keylset PS_24_20_M7_MIXED totalClientPer 100.0
keylset PS_24_20_M7_MIXED totalLoadPer 100.0
keylset PS_24_20_M7_MIXED wimixMode Client
keylset PS_24_20_M7_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_24_20_M7_WMM
keylset PS_24_20_M7_WMM ClientMix.awakeClient_PS_24_20_M7_WMM.Percentage 25.0
keylset PS_24_20_M7_WMM ClientMix.awakeClient_PS_24_20_M7_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_WMM ClientMix.awakeClient_PS_24_20_M7_WMM.delay 0
keylset PS_24_20_M7_WMM ClientMix.awakeClient_PS_24_20_M7_WMM.endTime END
keylset PS_24_20_M7_WMM ClientMix.wmmPs10_PS_24_20_M7_WMM.Percentage 25.0
keylset PS_24_20_M7_WMM ClientMix.wmmPs10_PS_24_20_M7_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_WMM ClientMix.wmmPs10_PS_24_20_M7_WMM.delay 0
keylset PS_24_20_M7_WMM ClientMix.wmmPs10_PS_24_20_M7_WMM.endTime END
keylset PS_24_20_M7_WMM ClientMix.wmmPs2_PS_24_20_M7_WMM.Percentage 25.0
keylset PS_24_20_M7_WMM ClientMix.wmmPs2_PS_24_20_M7_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_WMM ClientMix.wmmPs2_PS_24_20_M7_WMM.delay 0
keylset PS_24_20_M7_WMM ClientMix.wmmPs2_PS_24_20_M7_WMM.endTime END
keylset PS_24_20_M7_WMM ClientMix.wmmPs6_PS_24_20_M7_WMM.Percentage 25.0
keylset PS_24_20_M7_WMM ClientMix.wmmPs6_PS_24_20_M7_WMM.TrafficType {udpTraffic_24_20}
keylset PS_24_20_M7_WMM ClientMix.wmmPs6_PS_24_20_M7_WMM.delay 0
keylset PS_24_20_M7_WMM ClientMix.wmmPs6_PS_24_20_M7_WMM.endTime END
keylset PS_24_20_M7_WMM Test wimix_script
keylset PS_24_20_M7_WMM contAdminControlFlag 1
keylset PS_24_20_M7_WMM continueFlag 0
keylset PS_24_20_M7_WMM loadMode 0
keylset PS_24_20_M7_WMM loadSweepEnd 20
keylset PS_24_20_M7_WMM loadSweepStart 10
keylset PS_24_20_M7_WMM loadSweepStep 1
keylset PS_24_20_M7_WMM loadVal 4
keylset PS_24_20_M7_WMM name PS_24_20_M7_MIXED
keylset PS_24_20_M7_WMM staggerStart 0
keylset PS_24_20_M7_WMM staggerStartInt 1
keylset PS_24_20_M7_WMM testProfile PowerSave
keylset PS_24_20_M7_WMM testProfileImage images/wimix_new.png
keylset PS_24_20_M7_WMM totalClientPer 100.0
keylset PS_24_20_M7_WMM totalLoadPer 100.0
keylset PS_24_20_M7_WMM wimixMode Client
keylset PS_24_20_M7_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M15_LEG
keylset PS_5_40_M15_LEG ClientMix.awakeClient_PS_5_40_M15_LEG.Percentage 25.0
keylset PS_5_40_M15_LEG ClientMix.awakeClient_PS_5_40_M15_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_LEG ClientMix.awakeClient_PS_5_40_M15_LEG.delay 0
keylset PS_5_40_M15_LEG ClientMix.awakeClient_PS_5_40_M15_LEG.endTime END
keylset PS_5_40_M15_LEG ClientMix.legacyPs10_PS_5_40_M15_LEG.Percentage 25.0
keylset PS_5_40_M15_LEG ClientMix.legacyPs10_PS_5_40_M15_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_LEG ClientMix.legacyPs10_PS_5_40_M15_LEG.delay 0
keylset PS_5_40_M15_LEG ClientMix.legacyPs10_PS_5_40_M15_LEG.endTime END
keylset PS_5_40_M15_LEG ClientMix.legacyPs2_PS_5_40_M15_LEG.Percentage 25.0
keylset PS_5_40_M15_LEG ClientMix.legacyPs2_PS_5_40_M15_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_LEG ClientMix.legacyPs2_PS_5_40_M15_LEG.delay 0
keylset PS_5_40_M15_LEG ClientMix.legacyPs2_PS_5_40_M15_LEG.endTime END
keylset PS_5_40_M15_LEG ClientMix.legacyPs6_PS_5_40_M15_LEG.Percentage 25.0
keylset PS_5_40_M15_LEG ClientMix.legacyPs6_PS_5_40_M15_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_LEG ClientMix.legacyPs6_PS_5_40_M15_LEG.delay 0
keylset PS_5_40_M15_LEG ClientMix.legacyPs6_PS_5_40_M15_LEG.endTime END
keylset PS_5_40_M15_LEG Test wimix_script
keylset PS_5_40_M15_LEG contAdminControlFlag 1
keylset PS_5_40_M15_LEG continueFlag 0
keylset PS_5_40_M15_LEG loadMode 0
keylset PS_5_40_M15_LEG loadSweepEnd 20
keylset PS_5_40_M15_LEG loadSweepStart 10
keylset PS_5_40_M15_LEG loadSweepStep 1
keylset PS_5_40_M15_LEG loadVal 4
keylset PS_5_40_M15_LEG staggerStart 0
keylset PS_5_40_M15_LEG staggerStartInt 1
keylset PS_5_40_M15_LEG testProfile PowerSave
keylset PS_5_40_M15_LEG testProfileImage images/wimix_new.png
keylset PS_5_40_M15_LEG totalClientPer 100.0
keylset PS_5_40_M15_LEG totalLoadPer 100.0
keylset PS_5_40_M15_LEG wimixMode Client
keylset PS_5_40_M15_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M15_MIXED
keylset PS_5_40_M15_MIXED ClientMix.awakeClient_PS_5_40_M15_MIXED.Percentage 20.0
keylset PS_5_40_M15_MIXED ClientMix.awakeClient_PS_5_40_M15_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_MIXED ClientMix.awakeClient_PS_5_40_M15_MIXED.delay 0
keylset PS_5_40_M15_MIXED ClientMix.awakeClient_PS_5_40_M15_MIXED.endTime END
keylset PS_5_40_M15_MIXED ClientMix.legacyPs10_PS_5_40_M15_MIXED.Percentage 20.0
keylset PS_5_40_M15_MIXED ClientMix.legacyPs10_PS_5_40_M15_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_MIXED ClientMix.legacyPs10_PS_5_40_M15_MIXED.delay 0
keylset PS_5_40_M15_MIXED ClientMix.legacyPs10_PS_5_40_M15_MIXED.endTime END
keylset PS_5_40_M15_MIXED ClientMix.legacyPs2_PS_5_40_M15_MIXED.Percentage 20.0
keylset PS_5_40_M15_MIXED ClientMix.legacyPs2_PS_5_40_M15_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_MIXED ClientMix.legacyPs2_PS_5_40_M15_MIXED.delay 0
keylset PS_5_40_M15_MIXED ClientMix.legacyPs2_PS_5_40_M15_MIXED.endTime END
keylset PS_5_40_M15_MIXED ClientMix.wmmPs10_PS_5_40_M15_MIXED.Percentage 20.0
keylset PS_5_40_M15_MIXED ClientMix.wmmPs10_PS_5_40_M15_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_MIXED ClientMix.wmmPs10_PS_5_40_M15_MIXED.delay 0
keylset PS_5_40_M15_MIXED ClientMix.wmmPs10_PS_5_40_M15_MIXED.endTime END
keylset PS_5_40_M15_MIXED ClientMix.wmmPs2_PS_5_40_M15_MIXED.Percentage 20.0
keylset PS_5_40_M15_MIXED ClientMix.wmmPs2_PS_5_40_M15_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_MIXED ClientMix.wmmPs2_PS_5_40_M15_MIXED.delay 0
keylset PS_5_40_M15_MIXED ClientMix.wmmPs2_PS_5_40_M15_MIXED.endTime END
keylset PS_5_40_M15_MIXED Test wimix_script
keylset PS_5_40_M15_MIXED continueFlag 0
keylset PS_5_40_M15_MIXED loadMode 0
keylset PS_5_40_M15_MIXED loadSweepEnd 20
keylset PS_5_40_M15_MIXED loadSweepStart 10
keylset PS_5_40_M15_MIXED loadSweepStep 1
keylset PS_5_40_M15_MIXED loadVal 5
keylset PS_5_40_M15_MIXED staggerStart 0
keylset PS_5_40_M15_MIXED staggerStartInt 1
keylset PS_5_40_M15_MIXED testProfile PowerSave
keylset PS_5_40_M15_MIXED testProfileImage images/wimix_new.png
keylset PS_5_40_M15_MIXED totalClientPer 100.0
keylset PS_5_40_M15_MIXED totalLoadPer 100.0
keylset PS_5_40_M15_MIXED wimixMode Client
keylset PS_5_40_M15_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M15_WMM
keylset PS_5_40_M15_WMM ClientMix.awakeClient_PS_5_40_M15_WMM.Percentage 25.0
keylset PS_5_40_M15_WMM ClientMix.awakeClient_PS_5_40_M15_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_WMM ClientMix.awakeClient_PS_5_40_M15_WMM.delay 0
keylset PS_5_40_M15_WMM ClientMix.awakeClient_PS_5_40_M15_WMM.endTime END
keylset PS_5_40_M15_WMM ClientMix.wmmPs10_PS_5_40_M15_WMM.Percentage 25.0
keylset PS_5_40_M15_WMM ClientMix.wmmPs10_PS_5_40_M15_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_WMM ClientMix.wmmPs10_PS_5_40_M15_WMM.delay 0
keylset PS_5_40_M15_WMM ClientMix.wmmPs10_PS_5_40_M15_WMM.endTime END
keylset PS_5_40_M15_WMM ClientMix.wmmPs2_PS_5_40_M15_WMM.Percentage 25.0
keylset PS_5_40_M15_WMM ClientMix.wmmPs2_PS_5_40_M15_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_WMM ClientMix.wmmPs2_PS_5_40_M15_WMM.delay 0
keylset PS_5_40_M15_WMM ClientMix.wmmPs2_PS_5_40_M15_WMM.endTime END
keylset PS_5_40_M15_WMM ClientMix.wmmPs6_PS_5_40_M15_WMM.Percentage 25.0
keylset PS_5_40_M15_WMM ClientMix.wmmPs6_PS_5_40_M15_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M15_WMM ClientMix.wmmPs6_PS_5_40_M15_WMM.delay 0
keylset PS_5_40_M15_WMM ClientMix.wmmPs6_PS_5_40_M15_WMM.endTime END
keylset PS_5_40_M15_WMM Test wimix_script
keylset PS_5_40_M15_WMM contAdminControlFlag 1
keylset PS_5_40_M15_WMM continueFlag 0
keylset PS_5_40_M15_WMM loadMode 0
keylset PS_5_40_M15_WMM loadSweepEnd 20
keylset PS_5_40_M15_WMM loadSweepStart 10
keylset PS_5_40_M15_WMM loadSweepStep 1
keylset PS_5_40_M15_WMM loadVal 4
keylset PS_5_40_M15_WMM staggerStart 0
keylset PS_5_40_M15_WMM staggerStartInt 1
keylset PS_5_40_M15_WMM testProfile PowerSave
keylset PS_5_40_M15_WMM testProfileImage images/wimix_new.png
keylset PS_5_40_M15_WMM totalClientPer 100.0
keylset PS_5_40_M15_WMM totalLoadPer 100.0
keylset PS_5_40_M15_WMM wimixMode Client
keylset PS_5_40_M15_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M23_LEG
keylset PS_5_40_M23_LEG ClientMix.awakeClient_PS_5_40_M23_LEG.Percentage 25.0
keylset PS_5_40_M23_LEG ClientMix.awakeClient_PS_5_40_M23_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_LEG ClientMix.awakeClient_PS_5_40_M23_LEG.delay 0
keylset PS_5_40_M23_LEG ClientMix.awakeClient_PS_5_40_M23_LEG.endTime END
keylset PS_5_40_M23_LEG ClientMix.legacyPs10_PS_5_40_M23_LEG.Percentage 25.0
keylset PS_5_40_M23_LEG ClientMix.legacyPs10_PS_5_40_M23_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_LEG ClientMix.legacyPs10_PS_5_40_M23_LEG.delay 0
keylset PS_5_40_M23_LEG ClientMix.legacyPs10_PS_5_40_M23_LEG.endTime END
keylset PS_5_40_M23_LEG ClientMix.legacyPs2_PS_5_40_M23_LEG.Percentage 25.0
keylset PS_5_40_M23_LEG ClientMix.legacyPs2_PS_5_40_M23_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_LEG ClientMix.legacyPs2_PS_5_40_M23_LEG.delay 0
keylset PS_5_40_M23_LEG ClientMix.legacyPs2_PS_5_40_M23_LEG.endTime END
keylset PS_5_40_M23_LEG ClientMix.legacyPs6_PS_5_40_M23_LEG.Percentage 25.0
keylset PS_5_40_M23_LEG ClientMix.legacyPs6_PS_5_40_M23_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_LEG ClientMix.legacyPs6_PS_5_40_M23_LEG.delay 0
keylset PS_5_40_M23_LEG ClientMix.legacyPs6_PS_5_40_M23_LEG.endTime END
keylset PS_5_40_M23_LEG Test wimix_script
keylset PS_5_40_M23_LEG contAdminControlFlag 1
keylset PS_5_40_M23_LEG continueFlag 0
keylset PS_5_40_M23_LEG loadMode 0
keylset PS_5_40_M23_LEG loadSweepEnd 20
keylset PS_5_40_M23_LEG loadSweepStart 10
keylset PS_5_40_M23_LEG loadSweepStep 1
keylset PS_5_40_M23_LEG loadVal 4
keylset PS_5_40_M23_LEG staggerStart 0
keylset PS_5_40_M23_LEG staggerStartInt 1
keylset PS_5_40_M23_LEG testProfile PowerSave
keylset PS_5_40_M23_LEG testProfileImage images/wimix_new.png
keylset PS_5_40_M23_LEG totalClientPer 100.0
keylset PS_5_40_M23_LEG totalLoadPer 100.0
keylset PS_5_40_M23_LEG wimixMode Client
keylset PS_5_40_M23_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M23_MIXED
keylset PS_5_40_M23_MIXED ClientMix.awakeClient_PS_5_40_M23_MIXED.Percentage 20.0
keylset PS_5_40_M23_MIXED ClientMix.awakeClient_PS_5_40_M23_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_MIXED ClientMix.awakeClient_PS_5_40_M23_MIXED.delay 0
keylset PS_5_40_M23_MIXED ClientMix.awakeClient_PS_5_40_M23_MIXED.endTime END
keylset PS_5_40_M23_MIXED ClientMix.legacyPs10_PS_5_40_M23_MIXED.Percentage 20.0
keylset PS_5_40_M23_MIXED ClientMix.legacyPs10_PS_5_40_M23_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_MIXED ClientMix.legacyPs10_PS_5_40_M23_MIXED.delay 0
keylset PS_5_40_M23_MIXED ClientMix.legacyPs10_PS_5_40_M23_MIXED.endTime END
keylset PS_5_40_M23_MIXED ClientMix.legacyPs2_PS_5_40_M23_MIXED.Percentage 20.0
keylset PS_5_40_M23_MIXED ClientMix.legacyPs2_PS_5_40_M23_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_MIXED ClientMix.legacyPs2_PS_5_40_M23_MIXED.delay 0
keylset PS_5_40_M23_MIXED ClientMix.legacyPs2_PS_5_40_M23_MIXED.endTime END
keylset PS_5_40_M23_MIXED ClientMix.wmmPs10_PS_5_40_M23_MIXED.Percentage 20.0
keylset PS_5_40_M23_MIXED ClientMix.wmmPs10_PS_5_40_M23_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_MIXED ClientMix.wmmPs10_PS_5_40_M23_MIXED.delay 0
keylset PS_5_40_M23_MIXED ClientMix.wmmPs10_PS_5_40_M23_MIXED.endTime END
keylset PS_5_40_M23_MIXED ClientMix.wmmPs2_PS_5_40_M23_MIXED.Percentage 20.0
keylset PS_5_40_M23_MIXED ClientMix.wmmPs2_PS_5_40_M23_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_MIXED ClientMix.wmmPs2_PS_5_40_M23_MIXED.delay 0
keylset PS_5_40_M23_MIXED ClientMix.wmmPs2_PS_5_40_M23_MIXED.endTime END
keylset PS_5_40_M23_MIXED Test wimix_script
keylset PS_5_40_M23_MIXED continueFlag 0
keylset PS_5_40_M23_MIXED loadMode 0
keylset PS_5_40_M23_MIXED loadSweepEnd 20
keylset PS_5_40_M23_MIXED loadSweepStart 10
keylset PS_5_40_M23_MIXED loadSweepStep 1
keylset PS_5_40_M23_MIXED loadVal 5
keylset PS_5_40_M23_MIXED staggerStart 0
keylset PS_5_40_M23_MIXED staggerStartInt 1
keylset PS_5_40_M23_MIXED testProfile PowerSave
keylset PS_5_40_M23_MIXED testProfileImage images/wimix_new.png
keylset PS_5_40_M23_MIXED totalClientPer 100.0
keylset PS_5_40_M23_MIXED totalLoadPer 100.0
keylset PS_5_40_M23_MIXED wimixMode Client
keylset PS_5_40_M23_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M23_WMM
keylset PS_5_40_M23_WMM ClientMix.awakeClient_PS_5_40_M23_WMM.Percentage 25.0
keylset PS_5_40_M23_WMM ClientMix.awakeClient_PS_5_40_M23_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_WMM ClientMix.awakeClient_PS_5_40_M23_WMM.delay 0
keylset PS_5_40_M23_WMM ClientMix.awakeClient_PS_5_40_M23_WMM.endTime END
keylset PS_5_40_M23_WMM ClientMix.wmmPs10_PS_5_40_M23_WMM.Percentage 25.0
keylset PS_5_40_M23_WMM ClientMix.wmmPs10_PS_5_40_M23_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_WMM ClientMix.wmmPs10_PS_5_40_M23_WMM.delay 0
keylset PS_5_40_M23_WMM ClientMix.wmmPs10_PS_5_40_M23_WMM.endTime END
keylset PS_5_40_M23_WMM ClientMix.wmmPs2_PS_5_40_M23_WMM.Percentage 25.0
keylset PS_5_40_M23_WMM ClientMix.wmmPs2_PS_5_40_M23_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_WMM ClientMix.wmmPs2_PS_5_40_M23_WMM.delay 0
keylset PS_5_40_M23_WMM ClientMix.wmmPs2_PS_5_40_M23_WMM.endTime END
keylset PS_5_40_M23_WMM ClientMix.wmmPs6_PS_5_40_M23_WMM.Percentage 25.0
keylset PS_5_40_M23_WMM ClientMix.wmmPs6_PS_5_40_M23_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M23_WMM ClientMix.wmmPs6_PS_5_40_M23_WMM.delay 0
keylset PS_5_40_M23_WMM ClientMix.wmmPs6_PS_5_40_M23_WMM.endTime END
keylset PS_5_40_M23_WMM Test wimix_script
keylset PS_5_40_M23_WMM contAdminControlFlag 1
keylset PS_5_40_M23_WMM continueFlag 0
keylset PS_5_40_M23_WMM loadMode 0
keylset PS_5_40_M23_WMM loadSweepEnd 20
keylset PS_5_40_M23_WMM loadSweepStart 10
keylset PS_5_40_M23_WMM loadSweepStep 1
keylset PS_5_40_M23_WMM loadVal 4
keylset PS_5_40_M23_WMM staggerStart 0
keylset PS_5_40_M23_WMM staggerStartInt 1
keylset PS_5_40_M23_WMM testProfile PowerSave
keylset PS_5_40_M23_WMM testProfileImage images/wimix_new.png
keylset PS_5_40_M23_WMM totalClientPer 100.0
keylset PS_5_40_M23_WMM totalLoadPer 100.0
keylset PS_5_40_M23_WMM wimixMode Client
keylset PS_5_40_M23_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M31_LEG
keylset PS_5_40_M31_LEG ClientMix.awakeClient_PS_5_40_M31_LEG.Percentage 25.0
keylset PS_5_40_M31_LEG ClientMix.awakeClient_PS_5_40_M31_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_LEG ClientMix.awakeClient_PS_5_40_M31_LEG.delay 0
keylset PS_5_40_M31_LEG ClientMix.awakeClient_PS_5_40_M31_LEG.endTime END
keylset PS_5_40_M31_LEG ClientMix.legacyPs10_PS_5_40_M31_LEG.Percentage 25.0
keylset PS_5_40_M31_LEG ClientMix.legacyPs10_PS_5_40_M31_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_LEG ClientMix.legacyPs10_PS_5_40_M31_LEG.delay 0
keylset PS_5_40_M31_LEG ClientMix.legacyPs10_PS_5_40_M31_LEG.endTime END
keylset PS_5_40_M31_LEG ClientMix.legacyPs2_PS_5_40_M31_LEG.Percentage 25.0
keylset PS_5_40_M31_LEG ClientMix.legacyPs2_PS_5_40_M31_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_LEG ClientMix.legacyPs2_PS_5_40_M31_LEG.delay 0
keylset PS_5_40_M31_LEG ClientMix.legacyPs2_PS_5_40_M31_LEG.endTime END
keylset PS_5_40_M31_LEG ClientMix.legacyPs6_PS_5_40_M31_LEG.Percentage 25.0
keylset PS_5_40_M31_LEG ClientMix.legacyPs6_PS_5_40_M31_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_LEG ClientMix.legacyPs6_PS_5_40_M31_LEG.delay 0
keylset PS_5_40_M31_LEG ClientMix.legacyPs6_PS_5_40_M31_LEG.endTime END
keylset PS_5_40_M31_LEG Test wimix_script
keylset PS_5_40_M31_LEG contAdminControlFlag 1
keylset PS_5_40_M31_LEG continueFlag 0
keylset PS_5_40_M31_LEG loadMode 0
keylset PS_5_40_M31_LEG loadSweepEnd 20
keylset PS_5_40_M31_LEG loadSweepStart 10
keylset PS_5_40_M31_LEG loadSweepStep 1
keylset PS_5_40_M31_LEG loadVal 4
keylset PS_5_40_M31_LEG staggerStart 0
keylset PS_5_40_M31_LEG staggerStartInt 1
keylset PS_5_40_M31_LEG testProfile PowerSave
keylset PS_5_40_M31_LEG testProfileImage images/wimix_new.png
keylset PS_5_40_M31_LEG totalClientPer 100.0
keylset PS_5_40_M31_LEG totalLoadPer 100.0
keylset PS_5_40_M31_LEG wimixMode Client
keylset PS_5_40_M31_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M31_MIXED
keylset PS_5_40_M31_MIXED ClientMix.awakeClient_PS_5_40_M31_MIXED.Percentage 20.0
keylset PS_5_40_M31_MIXED ClientMix.awakeClient_PS_5_40_M31_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_MIXED ClientMix.awakeClient_PS_5_40_M31_MIXED.delay 0
keylset PS_5_40_M31_MIXED ClientMix.awakeClient_PS_5_40_M31_MIXED.endTime END
keylset PS_5_40_M31_MIXED ClientMix.legacyPs10_PS_5_40_M31_MIXED.Percentage 20.0
keylset PS_5_40_M31_MIXED ClientMix.legacyPs10_PS_5_40_M31_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_MIXED ClientMix.legacyPs10_PS_5_40_M31_MIXED.delay 0
keylset PS_5_40_M31_MIXED ClientMix.legacyPs10_PS_5_40_M31_MIXED.endTime END
keylset PS_5_40_M31_MIXED ClientMix.legacyPs2_PS_5_40_M31_MIXED.Percentage 20.0
keylset PS_5_40_M31_MIXED ClientMix.legacyPs2_PS_5_40_M31_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_MIXED ClientMix.legacyPs2_PS_5_40_M31_MIXED.delay 0
keylset PS_5_40_M31_MIXED ClientMix.legacyPs2_PS_5_40_M31_MIXED.endTime END
keylset PS_5_40_M31_MIXED ClientMix.wmmPs10_PS_5_40_M31_MIXED.Percentage 20.0
keylset PS_5_40_M31_MIXED ClientMix.wmmPs10_PS_5_40_M31_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_MIXED ClientMix.wmmPs10_PS_5_40_M31_MIXED.delay 0
keylset PS_5_40_M31_MIXED ClientMix.wmmPs10_PS_5_40_M31_MIXED.endTime END
keylset PS_5_40_M31_MIXED ClientMix.wmmPs2_PS_5_40_M31_MIXED.Percentage 20.0
keylset PS_5_40_M31_MIXED ClientMix.wmmPs2_PS_5_40_M31_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_MIXED ClientMix.wmmPs2_PS_5_40_M31_MIXED.delay 0
keylset PS_5_40_M31_MIXED ClientMix.wmmPs2_PS_5_40_M31_MIXED.endTime END
keylset PS_5_40_M31_MIXED Test wimix_script
keylset PS_5_40_M31_MIXED continueFlag 0
keylset PS_5_40_M31_MIXED loadMode 0
keylset PS_5_40_M31_MIXED loadSweepEnd 20
keylset PS_5_40_M31_MIXED loadSweepStart 10
keylset PS_5_40_M31_MIXED loadSweepStep 1
keylset PS_5_40_M31_MIXED loadVal 5
keylset PS_5_40_M31_MIXED staggerStart 0
keylset PS_5_40_M31_MIXED staggerStartInt 1
keylset PS_5_40_M31_MIXED testProfile PowerSave
keylset PS_5_40_M31_MIXED testProfileImage images/wimix_new.png
keylset PS_5_40_M31_MIXED totalClientPer 100.0
keylset PS_5_40_M31_MIXED totalLoadPer 100.0
keylset PS_5_40_M31_MIXED wimixMode Client
keylset PS_5_40_M31_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M31_WMM
keylset PS_5_40_M31_WMM ClientMix.awakeClient_PS_5_40_M31_WMM.Percentage 25.0
keylset PS_5_40_M31_WMM ClientMix.awakeClient_PS_5_40_M31_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_WMM ClientMix.awakeClient_PS_5_40_M31_WMM.delay 0
keylset PS_5_40_M31_WMM ClientMix.awakeClient_PS_5_40_M31_WMM.endTime END
keylset PS_5_40_M31_WMM ClientMix.wmmPs10_PS_5_40_M31_WMM.Percentage 25.0
keylset PS_5_40_M31_WMM ClientMix.wmmPs10_PS_5_40_M31_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_WMM ClientMix.wmmPs10_PS_5_40_M31_WMM.delay 0
keylset PS_5_40_M31_WMM ClientMix.wmmPs10_PS_5_40_M31_WMM.endTime END
keylset PS_5_40_M31_WMM ClientMix.wmmPs2_PS_5_40_M31_WMM.Percentage 25.0
keylset PS_5_40_M31_WMM ClientMix.wmmPs2_PS_5_40_M31_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_WMM ClientMix.wmmPs2_PS_5_40_M31_WMM.delay 0
keylset PS_5_40_M31_WMM ClientMix.wmmPs2_PS_5_40_M31_WMM.endTime END
keylset PS_5_40_M31_WMM ClientMix.wmmPs6_PS_5_40_M31_WMM.Percentage 25.0
keylset PS_5_40_M31_WMM ClientMix.wmmPs6_PS_5_40_M31_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M31_WMM ClientMix.wmmPs6_PS_5_40_M31_WMM.delay 0
keylset PS_5_40_M31_WMM ClientMix.wmmPs6_PS_5_40_M31_WMM.endTime END
keylset PS_5_40_M31_WMM Test wimix_script
keylset PS_5_40_M31_WMM contAdminControlFlag 1
keylset PS_5_40_M31_WMM continueFlag 0
keylset PS_5_40_M31_WMM loadMode 0
keylset PS_5_40_M31_WMM loadSweepEnd 20
keylset PS_5_40_M31_WMM loadSweepStart 10
keylset PS_5_40_M31_WMM loadSweepStep 1
keylset PS_5_40_M31_WMM loadVal 4
keylset PS_5_40_M31_WMM staggerStart 0
keylset PS_5_40_M31_WMM staggerStartInt 1
keylset PS_5_40_M31_WMM testProfile PowerSave
keylset PS_5_40_M31_WMM testProfileImage images/wimix_new.png
keylset PS_5_40_M31_WMM totalClientPer 100.0
keylset PS_5_40_M31_WMM totalLoadPer 100.0
keylset PS_5_40_M31_WMM wimixMode Client
keylset PS_5_40_M31_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M7_LEG
keylset PS_5_40_M7_LEG ClientMix.awakeClient_PS_5_40_M7_LEG.Percentage 25.0
keylset PS_5_40_M7_LEG ClientMix.awakeClient_PS_5_40_M7_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_LEG ClientMix.awakeClient_PS_5_40_M7_LEG.delay 0
keylset PS_5_40_M7_LEG ClientMix.awakeClient_PS_5_40_M7_LEG.endTime END
keylset PS_5_40_M7_LEG ClientMix.legacyPs10_PS_5_40_M7_LEG.Percentage 25.0
keylset PS_5_40_M7_LEG ClientMix.legacyPs10_PS_5_40_M7_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_LEG ClientMix.legacyPs10_PS_5_40_M7_LEG.delay 0
keylset PS_5_40_M7_LEG ClientMix.legacyPs10_PS_5_40_M7_LEG.endTime END
keylset PS_5_40_M7_LEG ClientMix.legacyPs2_PS_5_40_M7_LEG.Percentage 25.0
keylset PS_5_40_M7_LEG ClientMix.legacyPs2_PS_5_40_M7_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_LEG ClientMix.legacyPs2_PS_5_40_M7_LEG.delay 0
keylset PS_5_40_M7_LEG ClientMix.legacyPs2_PS_5_40_M7_LEG.endTime END
keylset PS_5_40_M7_LEG ClientMix.legacyPs6_PS_5_40_M7_LEG.Percentage 25.0
keylset PS_5_40_M7_LEG ClientMix.legacyPs6_PS_5_40_M7_LEG.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_LEG ClientMix.legacyPs6_PS_5_40_M7_LEG.delay 0
keylset PS_5_40_M7_LEG ClientMix.legacyPs6_PS_5_40_M7_LEG.endTime END
keylset PS_5_40_M7_LEG Test wimix_script
keylset PS_5_40_M7_LEG contAdminControlFlag 1
keylset PS_5_40_M7_LEG continueFlag 0
keylset PS_5_40_M7_LEG loadMode 0
keylset PS_5_40_M7_LEG loadSweepEnd 20
keylset PS_5_40_M7_LEG loadSweepStart 10
keylset PS_5_40_M7_LEG loadSweepStep 1
keylset PS_5_40_M7_LEG loadVal 4
keylset PS_5_40_M7_LEG staggerStart 0
keylset PS_5_40_M7_LEG staggerStartInt 1
keylset PS_5_40_M7_LEG testProfile PowerSave
keylset PS_5_40_M7_LEG testProfileImage images/wimix_new.png
keylset PS_5_40_M7_LEG totalClientPer 100.0
keylset PS_5_40_M7_LEG totalLoadPer 100.0
keylset PS_5_40_M7_LEG wimixMode Client
keylset PS_5_40_M7_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M7_MIXED
keylset PS_5_40_M7_MIXED ClientMix.awakeClient_PS_5_40_M7_MIXED.Percentage 20.0
keylset PS_5_40_M7_MIXED ClientMix.awakeClient_PS_5_40_M7_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_MIXED ClientMix.awakeClient_PS_5_40_M7_MIXED.delay 0
keylset PS_5_40_M7_MIXED ClientMix.awakeClient_PS_5_40_M7_MIXED.endTime END
keylset PS_5_40_M7_MIXED ClientMix.legacyPs10_PS_5_40_M7_MIXED.Percentage 20.0
keylset PS_5_40_M7_MIXED ClientMix.legacyPs10_PS_5_40_M7_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_MIXED ClientMix.legacyPs10_PS_5_40_M7_MIXED.delay 0
keylset PS_5_40_M7_MIXED ClientMix.legacyPs10_PS_5_40_M7_MIXED.endTime END
keylset PS_5_40_M7_MIXED ClientMix.legacyPs2_PS_5_40_M7_MIXED.Percentage 20.0
keylset PS_5_40_M7_MIXED ClientMix.legacyPs2_PS_5_40_M7_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_MIXED ClientMix.legacyPs2_PS_5_40_M7_MIXED.delay 0
keylset PS_5_40_M7_MIXED ClientMix.legacyPs2_PS_5_40_M7_MIXED.endTime END
keylset PS_5_40_M7_MIXED ClientMix.wmmPs10_PS_5_40_M7_MIXED.Percentage 20.0
keylset PS_5_40_M7_MIXED ClientMix.wmmPs10_PS_5_40_M7_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_MIXED ClientMix.wmmPs10_PS_5_40_M7_MIXED.delay 0
keylset PS_5_40_M7_MIXED ClientMix.wmmPs10_PS_5_40_M7_MIXED.endTime END
keylset PS_5_40_M7_MIXED ClientMix.wmmPs2_PS_5_40_M7_MIXED.Percentage 20.0
keylset PS_5_40_M7_MIXED ClientMix.wmmPs2_PS_5_40_M7_MIXED.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_MIXED ClientMix.wmmPs2_PS_5_40_M7_MIXED.delay 0
keylset PS_5_40_M7_MIXED ClientMix.wmmPs2_PS_5_40_M7_MIXED.endTime END
keylset PS_5_40_M7_MIXED Test wimix_script
keylset PS_5_40_M7_MIXED continueFlag 0
keylset PS_5_40_M7_MIXED loadMode 0
keylset PS_5_40_M7_MIXED loadSweepEnd 20
keylset PS_5_40_M7_MIXED loadSweepStart 10
keylset PS_5_40_M7_MIXED loadSweepStep 1
keylset PS_5_40_M7_MIXED loadVal 5
keylset PS_5_40_M7_MIXED staggerStart 0
keylset PS_5_40_M7_MIXED staggerStartInt 1
keylset PS_5_40_M7_MIXED testProfile PowerSave
keylset PS_5_40_M7_MIXED testProfileImage images/wimix_new.png
keylset PS_5_40_M7_MIXED totalClientPer 100.0
keylset PS_5_40_M7_MIXED totalLoadPer 100.0
keylset PS_5_40_M7_MIXED wimixMode Client
keylset PS_5_40_M7_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_40_M7_WMM
keylset PS_5_40_M7_WMM ClientMix.awakeClient_PS_5_40_M7_WMM.Percentage 25.0
keylset PS_5_40_M7_WMM ClientMix.awakeClient_PS_5_40_M7_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_WMM ClientMix.awakeClient_PS_5_40_M7_WMM.delay 0
keylset PS_5_40_M7_WMM ClientMix.awakeClient_PS_5_40_M7_WMM.endTime END
keylset PS_5_40_M7_WMM ClientMix.wmmPs10_PS_5_40_M7_WMM.Percentage 25.0
keylset PS_5_40_M7_WMM ClientMix.wmmPs10_PS_5_40_M7_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_WMM ClientMix.wmmPs10_PS_5_40_M7_WMM.delay 0
keylset PS_5_40_M7_WMM ClientMix.wmmPs10_PS_5_40_M7_WMM.endTime END
keylset PS_5_40_M7_WMM ClientMix.wmmPs2_PS_5_40_M7_WMM.Percentage 25.0
keylset PS_5_40_M7_WMM ClientMix.wmmPs2_PS_5_40_M7_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_WMM ClientMix.wmmPs2_PS_5_40_M7_WMM.delay 0
keylset PS_5_40_M7_WMM ClientMix.wmmPs2_PS_5_40_M7_WMM.endTime END
keylset PS_5_40_M7_WMM ClientMix.wmmPs6_PS_5_40_M7_WMM.Percentage 25.0
keylset PS_5_40_M7_WMM ClientMix.wmmPs6_PS_5_40_M7_WMM.TrafficType {udpTraffic_5_40}
keylset PS_5_40_M7_WMM ClientMix.wmmPs6_PS_5_40_M7_WMM.delay 0
keylset PS_5_40_M7_WMM ClientMix.wmmPs6_PS_5_40_M7_WMM.endTime END
keylset PS_5_40_M7_WMM Test wimix_script
keylset PS_5_40_M7_WMM contAdminControlFlag 1
keylset PS_5_40_M7_WMM continueFlag 0
keylset PS_5_40_M7_WMM loadMode 0
keylset PS_5_40_M7_WMM loadSweepEnd 20
keylset PS_5_40_M7_WMM loadSweepStart 10
keylset PS_5_40_M7_WMM loadSweepStep 1
keylset PS_5_40_M7_WMM loadVal 4
keylset PS_5_40_M7_WMM staggerStart 0
keylset PS_5_40_M7_WMM staggerStartInt 1
keylset PS_5_40_M7_WMM testProfile PowerSave
keylset PS_5_40_M7_WMM testProfileImage images/wimix_new.png
keylset PS_5_40_M7_WMM totalClientPer 100.0
keylset PS_5_40_M7_WMM totalLoadPer 100.0
keylset PS_5_40_M7_WMM wimixMode Client
keylset PS_5_40_M7_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S1_M9_LEG
keylset PS_5_80_S1_M9_LEG ClientMix.awakeClient_PS_5_80_S1_M9_LEG.Percentage 25.0
keylset PS_5_80_S1_M9_LEG ClientMix.awakeClient_PS_5_80_S1_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_LEG ClientMix.awakeClient_PS_5_80_S1_M9_LEG.delay 0
keylset PS_5_80_S1_M9_LEG ClientMix.awakeClient_PS_5_80_S1_M9_LEG.endTime END
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs10_PS_5_80_S1_M9_LEG.Percentage 25.0
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs10_PS_5_80_S1_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs10_PS_5_80_S1_M9_LEG.delay 0
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs10_PS_5_80_S1_M9_LEG.endTime END
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs2_PS_5_80_S1_M9_LEG.Percentage 25.0
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs2_PS_5_80_S1_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs2_PS_5_80_S1_M9_LEG.delay 0
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs2_PS_5_80_S1_M9_LEG.endTime END
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs6_PS_5_80_S1_M9_LEG.Percentage 25.0
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs6_PS_5_80_S1_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs6_PS_5_80_S1_M9_LEG.delay 0
keylset PS_5_80_S1_M9_LEG ClientMix.legacyPs6_PS_5_80_S1_M9_LEG.endTime END
keylset PS_5_80_S1_M9_LEG Test wimix_script
keylset PS_5_80_S1_M9_LEG contAdminControlFlag 1
keylset PS_5_80_S1_M9_LEG continueFlag 0
keylset PS_5_80_S1_M9_LEG loadMode 0
keylset PS_5_80_S1_M9_LEG loadSweepEnd 20
keylset PS_5_80_S1_M9_LEG loadSweepStart 10
keylset PS_5_80_S1_M9_LEG loadSweepStep 1
keylset PS_5_80_S1_M9_LEG loadVal 4
keylset PS_5_80_S1_M9_LEG staggerStart 0
keylset PS_5_80_S1_M9_LEG staggerStartInt 1
keylset PS_5_80_S1_M9_LEG testProfile PowerSave
keylset PS_5_80_S1_M9_LEG testProfileImage images/wimix_new.png
keylset PS_5_80_S1_M9_LEG totalClientPer 100.0
keylset PS_5_80_S1_M9_LEG totalLoadPer 100.0
keylset PS_5_80_S1_M9_LEG wimixMode Client
keylset PS_5_80_S1_M9_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S1_M9_MIXED
keylset PS_5_80_S1_M9_MIXED ClientMix.awakeClient_PS_5_80_S1_M9_MIXED.Percentage 20.0
keylset PS_5_80_S1_M9_MIXED ClientMix.awakeClient_PS_5_80_S1_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_MIXED ClientMix.awakeClient_PS_5_80_S1_M9_MIXED.delay 0
keylset PS_5_80_S1_M9_MIXED ClientMix.awakeClient_PS_5_80_S1_M9_MIXED.endTime END
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs10_PS_5_80_S1_M9_MIXED.Percentage 20.0
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs10_PS_5_80_S1_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs10_PS_5_80_S1_M9_MIXED.delay 0
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs10_PS_5_80_S1_M9_MIXED.endTime END
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs2_PS_5_80_S1_M9_MIXED.Percentage 20.0
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs2_PS_5_80_S1_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs2_PS_5_80_S1_M9_MIXED.delay 0
keylset PS_5_80_S1_M9_MIXED ClientMix.legacyPs2_PS_5_80_S1_M9_MIXED.endTime END
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs10_PS_5_80_S1_M9_MIXED.Percentage 20.0
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs10_PS_5_80_S1_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs10_PS_5_80_S1_M9_MIXED.delay 0
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs10_PS_5_80_S1_M9_MIXED.endTime END
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs2_PS_5_80_S1_M9_MIXED.Percentage 20.0
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs2_PS_5_80_S1_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs2_PS_5_80_S1_M9_MIXED.delay 0
keylset PS_5_80_S1_M9_MIXED ClientMix.wmmPs2_PS_5_80_S1_M9_MIXED.endTime END
keylset PS_5_80_S1_M9_MIXED Test wimix_script
keylset PS_5_80_S1_M9_MIXED continueFlag 0
keylset PS_5_80_S1_M9_MIXED loadMode 0
keylset PS_5_80_S1_M9_MIXED loadSweepEnd 20
keylset PS_5_80_S1_M9_MIXED loadSweepStart 10
keylset PS_5_80_S1_M9_MIXED loadSweepStep 1
keylset PS_5_80_S1_M9_MIXED loadVal 5
keylset PS_5_80_S1_M9_MIXED staggerStart 0
keylset PS_5_80_S1_M9_MIXED staggerStartInt 1
keylset PS_5_80_S1_M9_MIXED testProfile PowerSave
keylset PS_5_80_S1_M9_MIXED testProfileImage images/wimix_new.png
keylset PS_5_80_S1_M9_MIXED totalClientPer 100.0
keylset PS_5_80_S1_M9_MIXED totalLoadPer 100.0
keylset PS_5_80_S1_M9_MIXED wimixMode Client
keylset PS_5_80_S1_M9_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S1_M9_WMM
keylset PS_5_80_S1_M9_WMM ClientMix.awakeClient_PS_5_80_S1_M9_WMM.Percentage 25.0
keylset PS_5_80_S1_M9_WMM ClientMix.awakeClient_PS_5_80_S1_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_WMM ClientMix.awakeClient_PS_5_80_S1_M9_WMM.delay 0
keylset PS_5_80_S1_M9_WMM ClientMix.awakeClient_PS_5_80_S1_M9_WMM.endTime END
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs10_PS_5_80_S1_M9_WMM.Percentage 25.0
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs10_PS_5_80_S1_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs10_PS_5_80_S1_M9_WMM.delay 0
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs10_PS_5_80_S1_M9_WMM.endTime END
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs2_PS_5_80_S1_M9_WMM.Percentage 25.0
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs2_PS_5_80_S1_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs2_PS_5_80_S1_M9_WMM.delay 0
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs2_PS_5_80_S1_M9_WMM.endTime END
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs6_PS_5_80_S1_M9_WMM.Percentage 25.0
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs6_PS_5_80_S1_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs6_PS_5_80_S1_M9_WMM.delay 0
keylset PS_5_80_S1_M9_WMM ClientMix.wmmPs6_PS_5_80_S1_M9_WMM.endTime END
keylset PS_5_80_S1_M9_WMM Test wimix_script
keylset PS_5_80_S1_M9_WMM contAdminControlFlag 1
keylset PS_5_80_S1_M9_WMM continueFlag 0
keylset PS_5_80_S1_M9_WMM loadMode 0
keylset PS_5_80_S1_M9_WMM loadSweepEnd 20
keylset PS_5_80_S1_M9_WMM loadSweepStart 10
keylset PS_5_80_S1_M9_WMM loadSweepStep 1
keylset PS_5_80_S1_M9_WMM loadVal 4
keylset PS_5_80_S1_M9_WMM staggerStart 0
keylset PS_5_80_S1_M9_WMM staggerStartInt 1
keylset PS_5_80_S1_M9_WMM testProfile PowerSave
keylset PS_5_80_S1_M9_WMM testProfileImage images/wimix_new.png
keylset PS_5_80_S1_M9_WMM totalClientPer 100.0
keylset PS_5_80_S1_M9_WMM totalLoadPer 100.0
keylset PS_5_80_S1_M9_WMM wimixMode Client
keylset PS_5_80_S1_M9_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S2_M9_LEG
keylset PS_5_80_S2_M9_LEG ClientMix.awakeClient_PS_5_80_S2_M9_LEG.Percentage 25.0
keylset PS_5_80_S2_M9_LEG ClientMix.awakeClient_PS_5_80_S2_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_LEG ClientMix.awakeClient_PS_5_80_S2_M9_LEG.delay 0
keylset PS_5_80_S2_M9_LEG ClientMix.awakeClient_PS_5_80_S2_M9_LEG.endTime END
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs10_PS_5_80_S2_M9_LEG.Percentage 25.0
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs10_PS_5_80_S2_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs10_PS_5_80_S2_M9_LEG.delay 0
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs10_PS_5_80_S2_M9_LEG.endTime END
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs2_PS_5_80_S2_M9_LEG.Percentage 25.0
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs2_PS_5_80_S2_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs2_PS_5_80_S2_M9_LEG.delay 0
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs2_PS_5_80_S2_M9_LEG.endTime END
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs6_PS_5_80_S2_M9_LEG.Percentage 25.0
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs6_PS_5_80_S2_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs6_PS_5_80_S2_M9_LEG.delay 0
keylset PS_5_80_S2_M9_LEG ClientMix.legacyPs6_PS_5_80_S2_M9_LEG.endTime END
keylset PS_5_80_S2_M9_LEG Test wimix_script
keylset PS_5_80_S2_M9_LEG contAdminControlFlag 1
keylset PS_5_80_S2_M9_LEG continueFlag 0
keylset PS_5_80_S2_M9_LEG loadMode 0
keylset PS_5_80_S2_M9_LEG loadSweepEnd 20
keylset PS_5_80_S2_M9_LEG loadSweepStart 10
keylset PS_5_80_S2_M9_LEG loadSweepStep 1
keylset PS_5_80_S2_M9_LEG loadVal 4
keylset PS_5_80_S2_M9_LEG staggerStart 0
keylset PS_5_80_S2_M9_LEG staggerStartInt 1
keylset PS_5_80_S2_M9_LEG testProfile PowerSave
keylset PS_5_80_S2_M9_LEG testProfileImage images/wimix_new.png
keylset PS_5_80_S2_M9_LEG totalClientPer 100.0
keylset PS_5_80_S2_M9_LEG totalLoadPer 100.0
keylset PS_5_80_S2_M9_LEG wimixMode Client
keylset PS_5_80_S2_M9_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S2_M9_MIXED
keylset PS_5_80_S2_M9_MIXED ClientMix.awakeClient_PS_5_80_S2_M9_MIXED.Percentage 20.0
keylset PS_5_80_S2_M9_MIXED ClientMix.awakeClient_PS_5_80_S2_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_MIXED ClientMix.awakeClient_PS_5_80_S2_M9_MIXED.delay 0
keylset PS_5_80_S2_M9_MIXED ClientMix.awakeClient_PS_5_80_S2_M9_MIXED.endTime END
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs10_PS_5_80_S2_M9_MIXED.Percentage 20.0
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs10_PS_5_80_S2_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs10_PS_5_80_S2_M9_MIXED.delay 0
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs10_PS_5_80_S2_M9_MIXED.endTime END
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs2_PS_5_80_S2_M9_MIXED.Percentage 20.0
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs2_PS_5_80_S2_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs2_PS_5_80_S2_M9_MIXED.delay 0
keylset PS_5_80_S2_M9_MIXED ClientMix.legacyPs2_PS_5_80_S2_M9_MIXED.endTime END
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs10_PS_5_80_S2_M9_MIXED.Percentage 20.0
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs10_PS_5_80_S2_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs10_PS_5_80_S2_M9_MIXED.delay 0
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs10_PS_5_80_S2_M9_MIXED.endTime END
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs2_PS_5_80_S2_M9_MIXED.Percentage 20.0
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs2_PS_5_80_S2_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs2_PS_5_80_S2_M9_MIXED.delay 0
keylset PS_5_80_S2_M9_MIXED ClientMix.wmmPs2_PS_5_80_S2_M9_MIXED.endTime END
keylset PS_5_80_S2_M9_MIXED Test wimix_script
keylset PS_5_80_S2_M9_MIXED continueFlag 0
keylset PS_5_80_S2_M9_MIXED loadMode 0
keylset PS_5_80_S2_M9_MIXED loadSweepEnd 20
keylset PS_5_80_S2_M9_MIXED loadSweepStart 10
keylset PS_5_80_S2_M9_MIXED loadSweepStep 1
keylset PS_5_80_S2_M9_MIXED loadVal 5
keylset PS_5_80_S2_M9_MIXED staggerStart 0
keylset PS_5_80_S2_M9_MIXED staggerStartInt 1
keylset PS_5_80_S2_M9_MIXED testProfile PowerSave
keylset PS_5_80_S2_M9_MIXED testProfileImage images/wimix_new.png
keylset PS_5_80_S2_M9_MIXED totalClientPer 100.0
keylset PS_5_80_S2_M9_MIXED totalLoadPer 100.0
keylset PS_5_80_S2_M9_MIXED wimixMode Client
keylset PS_5_80_S2_M9_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S2_M9_WMM
keylset PS_5_80_S2_M9_WMM ClientMix.awakeClient_PS_5_80_S2_M9_WMM.Percentage 25.0
keylset PS_5_80_S2_M9_WMM ClientMix.awakeClient_PS_5_80_S2_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_WMM ClientMix.awakeClient_PS_5_80_S2_M9_WMM.delay 0
keylset PS_5_80_S2_M9_WMM ClientMix.awakeClient_PS_5_80_S2_M9_WMM.endTime END
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs10_PS_5_80_S2_M9_WMM.Percentage 25.0
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs10_PS_5_80_S2_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs10_PS_5_80_S2_M9_WMM.delay 0
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs10_PS_5_80_S2_M9_WMM.endTime END
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs2_PS_5_80_S2_M9_WMM.Percentage 25.0
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs2_PS_5_80_S2_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs2_PS_5_80_S2_M9_WMM.delay 0
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs2_PS_5_80_S2_M9_WMM.endTime END
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs6_PS_5_80_S2_M9_WMM.Percentage 25.0
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs6_PS_5_80_S2_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs6_PS_5_80_S2_M9_WMM.delay 0
keylset PS_5_80_S2_M9_WMM ClientMix.wmmPs6_PS_5_80_S2_M9_WMM.endTime END
keylset PS_5_80_S2_M9_WMM Test wimix_script
keylset PS_5_80_S2_M9_WMM contAdminControlFlag 1
keylset PS_5_80_S2_M9_WMM continueFlag 0
keylset PS_5_80_S2_M9_WMM loadMode 0
keylset PS_5_80_S2_M9_WMM loadSweepEnd 20
keylset PS_5_80_S2_M9_WMM loadSweepStart 10
keylset PS_5_80_S2_M9_WMM loadSweepStep 1
keylset PS_5_80_S2_M9_WMM loadVal 4
keylset PS_5_80_S2_M9_WMM staggerStart 0
keylset PS_5_80_S2_M9_WMM staggerStartInt 1
keylset PS_5_80_S2_M9_WMM testProfile PowerSave
keylset PS_5_80_S2_M9_WMM testProfileImage images/wimix_new.png
keylset PS_5_80_S2_M9_WMM totalClientPer 100.0
keylset PS_5_80_S2_M9_WMM totalLoadPer 100.0
keylset PS_5_80_S2_M9_WMM wimixMode Client
keylset PS_5_80_S2_M9_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S3_M9_LEG
keylset PS_5_80_S3_M9_LEG ClientMix.awakeClient_PS_5_80_S3_M9_LEG.Percentage 25.0
keylset PS_5_80_S3_M9_LEG ClientMix.awakeClient_PS_5_80_S3_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_LEG ClientMix.awakeClient_PS_5_80_S3_M9_LEG.delay 0
keylset PS_5_80_S3_M9_LEG ClientMix.awakeClient_PS_5_80_S3_M9_LEG.endTime END
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs10_PS_5_80_S3_M9_LEG.Percentage 25.0
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs10_PS_5_80_S3_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs10_PS_5_80_S3_M9_LEG.delay 0
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs10_PS_5_80_S3_M9_LEG.endTime END
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs2_PS_5_80_S3_M9_LEG.Percentage 25.0
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs2_PS_5_80_S3_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs2_PS_5_80_S3_M9_LEG.delay 0
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs2_PS_5_80_S3_M9_LEG.endTime END
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs6_PS_5_80_S3_M9_LEG.Percentage 25.0
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs6_PS_5_80_S3_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs6_PS_5_80_S3_M9_LEG.delay 0
keylset PS_5_80_S3_M9_LEG ClientMix.legacyPs6_PS_5_80_S3_M9_LEG.endTime END
keylset PS_5_80_S3_M9_LEG Test wimix_script
keylset PS_5_80_S3_M9_LEG contAdminControlFlag 1
keylset PS_5_80_S3_M9_LEG continueFlag 0
keylset PS_5_80_S3_M9_LEG loadMode 0
keylset PS_5_80_S3_M9_LEG loadSweepEnd 20
keylset PS_5_80_S3_M9_LEG loadSweepStart 10
keylset PS_5_80_S3_M9_LEG loadSweepStep 1
keylset PS_5_80_S3_M9_LEG loadVal 4
keylset PS_5_80_S3_M9_LEG staggerStart 0
keylset PS_5_80_S3_M9_LEG staggerStartInt 1
keylset PS_5_80_S3_M9_LEG testProfile PowerSave
keylset PS_5_80_S3_M9_LEG testProfileImage images/wimix_new.png
keylset PS_5_80_S3_M9_LEG totalClientPer 100.0
keylset PS_5_80_S3_M9_LEG totalLoadPer 100.0
keylset PS_5_80_S3_M9_LEG wimixMode Client
keylset PS_5_80_S3_M9_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S3_M9_MIXED
keylset PS_5_80_S3_M9_MIXED ClientMix.awakeClient_PS_5_80_S3_M9_MIXED.Percentage 20.0
keylset PS_5_80_S3_M9_MIXED ClientMix.awakeClient_PS_5_80_S3_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_MIXED ClientMix.awakeClient_PS_5_80_S3_M9_MIXED.delay 0
keylset PS_5_80_S3_M9_MIXED ClientMix.awakeClient_PS_5_80_S3_M9_MIXED.endTime END
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs10_PS_5_80_S3_M9_MIXED.Percentage 20.0
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs10_PS_5_80_S3_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs10_PS_5_80_S3_M9_MIXED.delay 0
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs10_PS_5_80_S3_M9_MIXED.endTime END
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs2_PS_5_80_S3_M9_MIXED.Percentage 20.0
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs2_PS_5_80_S3_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs2_PS_5_80_S3_M9_MIXED.delay 0
keylset PS_5_80_S3_M9_MIXED ClientMix.legacyPs2_PS_5_80_S3_M9_MIXED.endTime END
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs10_PS_5_80_S3_M9_MIXED.Percentage 20.0
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs10_PS_5_80_S3_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs10_PS_5_80_S3_M9_MIXED.delay 0
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs10_PS_5_80_S3_M9_MIXED.endTime END
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs2_PS_5_80_S3_M9_MIXED.Percentage 20.0
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs2_PS_5_80_S3_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs2_PS_5_80_S3_M9_MIXED.delay 0
keylset PS_5_80_S3_M9_MIXED ClientMix.wmmPs2_PS_5_80_S3_M9_MIXED.endTime END
keylset PS_5_80_S3_M9_MIXED Test wimix_script
keylset PS_5_80_S3_M9_MIXED continueFlag 0
keylset PS_5_80_S3_M9_MIXED loadMode 0
keylset PS_5_80_S3_M9_MIXED loadSweepEnd 20
keylset PS_5_80_S3_M9_MIXED loadSweepStart 10
keylset PS_5_80_S3_M9_MIXED loadSweepStep 1
keylset PS_5_80_S3_M9_MIXED loadVal 5
keylset PS_5_80_S3_M9_MIXED staggerStart 0
keylset PS_5_80_S3_M9_MIXED staggerStartInt 1
keylset PS_5_80_S3_M9_MIXED testProfile PowerSave
keylset PS_5_80_S3_M9_MIXED testProfileImage images/wimix_new.png
keylset PS_5_80_S3_M9_MIXED totalClientPer 100.0
keylset PS_5_80_S3_M9_MIXED totalLoadPer 100.0
keylset PS_5_80_S3_M9_MIXED wimixMode Client
keylset PS_5_80_S3_M9_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S3_M9_WMM
keylset PS_5_80_S3_M9_WMM ClientMix.awakeClient_PS_5_80_S3_M9_WMM.Percentage 25.0
keylset PS_5_80_S3_M9_WMM ClientMix.awakeClient_PS_5_80_S3_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_WMM ClientMix.awakeClient_PS_5_80_S3_M9_WMM.delay 0
keylset PS_5_80_S3_M9_WMM ClientMix.awakeClient_PS_5_80_S3_M9_WMM.endTime END
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs10_PS_5_80_S3_M9_WMM.Percentage 25.0
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs10_PS_5_80_S3_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs10_PS_5_80_S3_M9_WMM.delay 0
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs10_PS_5_80_S3_M9_WMM.endTime END
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs2_PS_5_80_S3_M9_WMM.Percentage 25.0
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs2_PS_5_80_S3_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs2_PS_5_80_S3_M9_WMM.delay 0
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs2_PS_5_80_S3_M9_WMM.endTime END
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs6_PS_5_80_S3_M9_WMM.Percentage 25.0
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs6_PS_5_80_S3_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs6_PS_5_80_S3_M9_WMM.delay 0
keylset PS_5_80_S3_M9_WMM ClientMix.wmmPs6_PS_5_80_S3_M9_WMM.endTime END
keylset PS_5_80_S3_M9_WMM Test wimix_script
keylset PS_5_80_S3_M9_WMM contAdminControlFlag 1
keylset PS_5_80_S3_M9_WMM continueFlag 0
keylset PS_5_80_S3_M9_WMM loadMode 0
keylset PS_5_80_S3_M9_WMM loadSweepEnd 20
keylset PS_5_80_S3_M9_WMM loadSweepStart 10
keylset PS_5_80_S3_M9_WMM loadSweepStep 1
keylset PS_5_80_S3_M9_WMM loadVal 4
keylset PS_5_80_S3_M9_WMM staggerStart 0
keylset PS_5_80_S3_M9_WMM staggerStartInt 1
keylset PS_5_80_S3_M9_WMM testProfile PowerSave
keylset PS_5_80_S3_M9_WMM testProfileImage images/wimix_new.png
keylset PS_5_80_S3_M9_WMM totalClientPer 100.0
keylset PS_5_80_S3_M9_WMM totalLoadPer 100.0
keylset PS_5_80_S3_M9_WMM wimixMode Client
keylset PS_5_80_S3_M9_WMM wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S4_M9_LEG
keylset PS_5_80_S4_M9_LEG ClientMix.awakeClient_PS_5_80_S4_M9_LEG.Percentage 25.0
keylset PS_5_80_S4_M9_LEG ClientMix.awakeClient_PS_5_80_S4_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_LEG ClientMix.awakeClient_PS_5_80_S4_M9_LEG.delay 0
keylset PS_5_80_S4_M9_LEG ClientMix.awakeClient_PS_5_80_S4_M9_LEG.endTime END
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs10_PS_5_80_S4_M9_LEG.Percentage 25.0
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs10_PS_5_80_S4_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs10_PS_5_80_S4_M9_LEG.delay 0
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs10_PS_5_80_S4_M9_LEG.endTime END
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs2_PS_5_80_S4_M9_LEG.Percentage 25.0
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs2_PS_5_80_S4_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs2_PS_5_80_S4_M9_LEG.delay 0
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs2_PS_5_80_S4_M9_LEG.endTime END
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs6_PS_5_80_S4_M9_LEG.Percentage 25.0
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs6_PS_5_80_S4_M9_LEG.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs6_PS_5_80_S4_M9_LEG.delay 0
keylset PS_5_80_S4_M9_LEG ClientMix.legacyPs6_PS_5_80_S4_M9_LEG.endTime END
keylset PS_5_80_S4_M9_LEG Test wimix_script
keylset PS_5_80_S4_M9_LEG contAdminControlFlag 1
keylset PS_5_80_S4_M9_LEG continueFlag 0
keylset PS_5_80_S4_M9_LEG loadMode 0
keylset PS_5_80_S4_M9_LEG loadSweepEnd 20
keylset PS_5_80_S4_M9_LEG loadSweepStart 10
keylset PS_5_80_S4_M9_LEG loadSweepStep 1
keylset PS_5_80_S4_M9_LEG loadVal 4
keylset PS_5_80_S4_M9_LEG staggerStart 0
keylset PS_5_80_S4_M9_LEG staggerStartInt 1
keylset PS_5_80_S4_M9_LEG testProfile PowerSave
keylset PS_5_80_S4_M9_LEG testProfileImage images/wimix_new.png
keylset PS_5_80_S4_M9_LEG totalClientPer 100.0
keylset PS_5_80_S4_M9_LEG totalLoadPer 100.0
keylset PS_5_80_S4_M9_LEG wimixMode Client
keylset PS_5_80_S4_M9_LEG wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S4_M9_MIXED
keylset PS_5_80_S4_M9_MIXED ClientMix.awakeClient_PS_5_80_S4_M9_MIXED.Percentage 20.0
keylset PS_5_80_S4_M9_MIXED ClientMix.awakeClient_PS_5_80_S4_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_MIXED ClientMix.awakeClient_PS_5_80_S4_M9_MIXED.delay 0
keylset PS_5_80_S4_M9_MIXED ClientMix.awakeClient_PS_5_80_S4_M9_MIXED.endTime END
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs10_PS_5_80_S4_M9_MIXED.Percentage 20.0
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs10_PS_5_80_S4_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs10_PS_5_80_S4_M9_MIXED.delay 0
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs10_PS_5_80_S4_M9_MIXED.endTime END
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs2_PS_5_80_S4_M9_MIXED.Percentage 20.0
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs2_PS_5_80_S4_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs2_PS_5_80_S4_M9_MIXED.delay 0
keylset PS_5_80_S4_M9_MIXED ClientMix.legacyPs2_PS_5_80_S4_M9_MIXED.endTime END
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs10_PS_5_80_S4_M9_MIXED.Percentage 20.0
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs10_PS_5_80_S4_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs10_PS_5_80_S4_M9_MIXED.delay 0
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs10_PS_5_80_S4_M9_MIXED.endTime END
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs2_PS_5_80_S4_M9_MIXED.Percentage 20.0
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs2_PS_5_80_S4_M9_MIXED.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs2_PS_5_80_S4_M9_MIXED.delay 0
keylset PS_5_80_S4_M9_MIXED ClientMix.wmmPs2_PS_5_80_S4_M9_MIXED.endTime END
keylset PS_5_80_S4_M9_MIXED Test wimix_script
keylset PS_5_80_S4_M9_MIXED continueFlag 0
keylset PS_5_80_S4_M9_MIXED loadMode 0
keylset PS_5_80_S4_M9_MIXED loadSweepEnd 20
keylset PS_5_80_S4_M9_MIXED loadSweepStart 10
keylset PS_5_80_S4_M9_MIXED loadSweepStep 1
keylset PS_5_80_S4_M9_MIXED loadVal 5
keylset PS_5_80_S4_M9_MIXED staggerStart 0
keylset PS_5_80_S4_M9_MIXED staggerStartInt 1
keylset PS_5_80_S4_M9_MIXED testProfile PowerSave
keylset PS_5_80_S4_M9_MIXED testProfileImage images/wimix_new.png
keylset PS_5_80_S4_M9_MIXED totalClientPer 100.0
keylset PS_5_80_S4_M9_MIXED totalLoadPer 100.0
keylset PS_5_80_S4_M9_MIXED wimixMode Client
keylset PS_5_80_S4_M9_MIXED wimixTestName WMM/Legacy\ PowerSave

# PS_5_80_S4_M9_WMM
keylset PS_5_80_S4_M9_WMM ClientMix.awakeClient_PS_5_80_S4_M9_WMM.Percentage 25.0
keylset PS_5_80_S4_M9_WMM ClientMix.awakeClient_PS_5_80_S4_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_WMM ClientMix.awakeClient_PS_5_80_S4_M9_WMM.delay 0
keylset PS_5_80_S4_M9_WMM ClientMix.awakeClient_PS_5_80_S4_M9_WMM.endTime END
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs10_PS_5_80_S4_M9_WMM.Percentage 25.0
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs10_PS_5_80_S4_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs10_PS_5_80_S4_M9_WMM.delay 0
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs10_PS_5_80_S4_M9_WMM.endTime END
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs2_PS_5_80_S4_M9_WMM.Percentage 25.0
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs2_PS_5_80_S4_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs2_PS_5_80_S4_M9_WMM.delay 0
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs2_PS_5_80_S4_M9_WMM.endTime END
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs6_PS_5_80_S4_M9_WMM.Percentage 25.0
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs6_PS_5_80_S4_M9_WMM.TrafficType {udpTraffic_5_80}
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs6_PS_5_80_S4_M9_WMM.delay 0
keylset PS_5_80_S4_M9_WMM ClientMix.wmmPs6_PS_5_80_S4_M9_WMM.endTime END
keylset PS_5_80_S4_M9_WMM Test wimix_script
keylset PS_5_80_S4_M9_WMM contAdminControlFlag 1
keylset PS_5_80_S4_M9_WMM continueFlag 0
keylset PS_5_80_S4_M9_WMM loadMode 0
keylset PS_5_80_S4_M9_WMM loadSweepEnd 20
keylset PS_5_80_S4_M9_WMM loadSweepStart 10
keylset PS_5_80_S4_M9_WMM loadSweepStep 1
keylset PS_5_80_S4_M9_WMM loadVal 4
keylset PS_5_80_S4_M9_WMM staggerStart 0
keylset PS_5_80_S4_M9_WMM staggerStartInt 1
keylset PS_5_80_S4_M9_WMM testProfile PowerSave
keylset PS_5_80_S4_M9_WMM testProfileImage images/wimix_new.png
keylset PS_5_80_S4_M9_WMM totalClientPer 100.0
keylset PS_5_80_S4_M9_WMM totalLoadPer 100.0
keylset PS_5_80_S4_M9_WMM wimixMode Client
keylset PS_5_80_S4_M9_WMM wimixTestName WMM/Legacy\ PowerSave

# Test List end

#Traffic Profiles 

# udpTraffic settings

# Base settings from PS_24_20_M15_LEG
keylset udpTraffic_Base BurstdataburstDur 5
keylset udpTraffic_Base BurstdataburstRate 100
keylset udpTraffic_Base Burstdataibg 5
keylset udpTraffic_Base Layer2qosadControl 0
keylset udpTraffic_Base Layer2qosclassifier None
keylset udpTraffic_Base Layer2qosenable 0
keylset udpTraffic_Base Layer2qosethUp 0
keylset udpTraffic_Base Layer2qosflDir 1
keylset udpTraffic_Base Layer2qosmpduAggregation 0
keylset udpTraffic_Base Layer2qosmpduAggregationLimit 8
keylset udpTraffic_Base Layer2qostclasIe 0
keylset udpTraffic_Base Layer2qoswlanUp 0
keylset udpTraffic_Base Layer3qosdscp 0
keylset udpTraffic_Base Layer3qosenable 0
keylset udpTraffic_Base Layer4to7DestPort 32743
keylset udpTraffic_Base Layer4to7SrcPort 22743
keylset udpTraffic_Base SlaJitter 500
keylset udpTraffic_Base SlaLatency 10000
keylset udpTraffic_Base SlaPacketLoss 10
keylset udpTraffic_Base WimixtrafficDirection downlink
keylset udpTraffic_Base WimixtrafficFramesize 1500
keylset udpTraffic_Base WimixtrafficIntendedrate 20000
keylset udpTraffic_Base WimixtrafficNumFrames 100000000
keylset udpTraffic_Base WimixtrafficPhyrate 54
keylset udpTraffic_Base WimixtrafficRateBehaviour 0
keylset udpTraffic_Base WimixtrafficRateMode 0
keylset udpTraffic_Base WimixtrafficServer server1
keylset udpTraffic_Base WimixtrafficType UDP
keylset udpTraffic_Base WimixtrafficipProtocolNum Auto
keylset udpTraffic_Base WimixtrafficpayData None
keylset udpTraffic_Base WimixtrafficpayPattern 0

set udpTraffic_24_20 ${udpTraffic_Base}
# Nothing to do. Same as udpTraffic_Base

set udpTraffic_5_40 ${udpTraffic_Base}
keylset udpTraffic_5_40 WimixtrafficIntendedrate 40000

set udpTraffic_5_80 ${udpTraffic_Base}
keylset udpTraffic_5_80 WimixtrafficIntendedrate 60000

#Server Profiles

# server1 settings

# Base settings from PS_24_20_M15_LEG
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

# generic_dut settings

# Base settings from PS_24_20_M15_LEG
keylset generic_dut_Base APModel $VENDORMODEL
keylset generic_dut_Base APSWVersion $VENDORFW
keylset generic_dut_Base Interface.802_11ac.BindStatus True
keylset generic_dut_Base Interface.802_11ac.CaptureMode normal
keylset generic_dut_Base Interface.802_11ac.Channel 6
keylset generic_dut_Base Interface.802_11ac.ClientBackoff True
keylset generic_dut_Base Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_Base Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_Base Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_Base Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_Base Interface.802_11ac.RxAttenuation False
keylset generic_dut_Base Interface.802_11ac.VkIndex 0
keylset generic_dut_Base Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_Base Interface.802_11ac.portChannelBandwidth -1
keylset generic_dut_Base Interface.802_11ac.secChannel 0
keylset generic_dut_Base Vendor $VENDORNAME
keylset generic_dut_Base WLANSwitchModel WLAN\ Switch\ Model:@|
keylset generic_dut_Base WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|
keylset generic_dut_Base used True

set generic_dut_24 ${generic_dut_Base}
# Nothing to do. Same as generic_dut_Base

set generic_dut_5 ${generic_dut_Base}
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5

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
