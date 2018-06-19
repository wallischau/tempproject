
#Auto-generated from: Z:\Testing_Area\Automation\VCL_APIs\7.3.2\automation\bin\SH2GHzu.wml
#At: 2018-04-10 12:34:24.090000
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {Group_3}
keylset global_config Destination {Group_2 Group_1}

#Traffics Global Options

keylset global_config Content None
keylset global_config UserPattern None
keylset global_config PayloadData None
keylset global_config DestinationPort None
keylset global_config SourcePort None

#Learning Global Options

keylset global_config AgingTime 0

#IgmpJoinInfo Global Options


#Connection Global Options


#ProgAttenuation Global Options

keylset Progattenuation NapRepeatInt 5
keylset Progattenuation RoamSla 100

#keylset global_config CustomSchedule {[0,\ 63,\ 1] [5,\ 58,\ 1] [10,\ 53,\ 1] [15,\ 48,\ 1] [20,\ 43,\ 1] [25,\ 38,\ 1] [30,\ 33,\ 1] [35,\ 28,\ 1] [40,\ 23,\ 1] [45,\ 18,\ 1] [50,\ 13,\ 1] [55,\ 8,\ 1] [60,\ 3,\ 1] [63,\ 0,\ 1]}
keylset Progattenuation ChangeInt 1

#keylset ProgAtten NapAttenData OrderedDict([('Duration(secs)', [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]), ('192.168.1.250_p1', [63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63]), ('192.168.1.250_p2', [63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63]), ('192.168.1.250_p3', [63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63]), ('192.168.1.250_p4', [63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63])])
keylset Progattenuation IpAddress 192.168.1.250
keylset Progattenuation NapNumPorts 4
keylset Progattenuation TestTime 65
keylset Progattenuation ChangeStep 5
keylset Progattenuation NapDurationStep 0
keylset Progattenuation NapMaxVal 63
keylset Progattenuation NapIpAddress 192.168.1.250
keylset Progattenuation PaTestType 0
keylset Progattenuation NapTrialDur 100

#LogsAndResultsInfo Global Options
set Card_24 $card_24_ip
set Card_5 $card_5_ip
set Card_Eth $card_eth_ip
set Card_Eth_2 $card_eth_2_ip
set SSID_24 $ssid_24
set SSID_5 $ssid_5
set VENDORNAME $vendor_name
set VENDORMODEL $vendor_model
set VENDORFW $vendor_firmware
set ATTN24 off
set ATTN5 off
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas

keylset global_config LogsDir $logs_dir
keylset global_config CustomTitle None
keylset global_config dbserverip 127.0.0.1

#L4to7Connection Global Options

keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 600
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 0
keylset global_config TestDurationMin 10

#Tests - you may define more than one in a TCL list.
keylset global_config TestList {wimix_script}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#Group Group_1
keylset Group_1 GroupType 802.11ac
keylset Group_1 Dut generic_dut_2

#Group Group_1 - Client Options
keylset Group_1 ListenInt 10
keylset Group_1 Ssid $SSID_24
keylset Group_1 Hops -1
keylset Group_1 MimoId 0
keylset Group_1 Wlan80211eQoSAC 0
keylset Group_1 Dhcp Enable
keylset Group_1 RateAdapt 0
keylset Group_1 GratuitousArp True
keylset Group_1 MacAddress None
keylset Group_1 EnableAMSDUaggregation 0
keylset Group_1 PlcpConfiguration mixed
keylset Group_1 GuiPhyRate 65.0
keylset Group_1 ChannelBandwidth 20
keylset Group_1 EnableLDPC False
keylset Group_1 EnableAMPDUaggregation 0
keylset Group_1 EnableRxAMSDUaggregation 1
keylset Group_1 ChannelModel Bypass
keylset Group_1 DataMcsIndex 7
keylset Group_1 MgmtPhyRate 54
keylset Group_1 GuardInterval standard
keylset Group_1 EnableIpv6 0
keylset Group_1 SubnetMask 255.255.0.0
keylset Group_1 KeepAlive True
keylset Group_1 MacAddressIncr 1
keylset Group_1 SnrVal 40
keylset Group_1 Gateway 192.168.1.1
keylset Group_1 phyInterface 802.11n
keylset Group_1 MgmtPhyRate 24
keylset Group_1 Qos Enable
# keylset Group_1 Bssid f4:6b:ef:d8:6d:6e
keylset Group_1 IncrIp Normal
keylset Group_1 TransmitDeference 1
keylset Group_1 BaseIp 192.168.1.10
keylset Group_1 UapsdSp 3

#Group Group_1 - Security Options
keylset Group_1 Method {WPA2-PSK}
keylset Group_1 PskAscii charter123

#Group Group_2
keylset Group_2 GroupType 802.11ac
keylset Group_2 Dut generic_dut_2

#Group Group_2 - Client Options
keylset Group_2 ListenInt 10
keylset Group_2 Ssid $SSID_24
keylset Group_2 Hops 0
keylset Group_2 MimoId 0
keylset Group_2 DataPhyRate 36
keylset Group_2 Wlan80211eQoSAC 0
keylset Group_2 Dhcp Enable
keylset Group_2 RateAdapt 0
keylset Group_2 GratuitousArp True
keylset Group_2 MacAddress None
keylset Group_2 EnableAMSDUaggregation 0
keylset Group_2 PlcpConfiguration mixed
keylset Group_2 GuiPhyRate 52.0
keylset Group_2 ChannelBandwidth 20
keylset Group_2 EnableLDPC False
keylset Group_2 EnableAMPDUaggregation 0
keylset Group_2 EnableRxAMSDUaggregation 1
keylset Group_2 ChannelModel Bypass
keylset Group_2 DataMcsIndex 5
keylset Group_2 MgmtPhyRate 12
keylset Group_2 GuardInterval standard
keylset Group_2 EnableIpv6 0
keylset Group_2 SubnetMask 255.255.0.0
keylset Group_2 KeepAlive True
keylset Group_2 MacAddressIncr 1
keylset Group_2 SnrVal 25
keylset Group_2 DistId 1
keylset Group_2 Gateway 192.168.1.1
keylset Group_2 phyInterface 802.11n
keylset Group_2 MgmtPhyRate 12
keylset Group_2 TxPower -20
keylset Group_2 Qos Enable
# keylset Group_2 Bssid f4:6b:ef:d8:6d:6e
keylset Group_2 IncrIp Normal
keylset Group_2 TransmitDeference 1
keylset Group_2 BaseIp 192.168.2.10
keylset Group_2 UapsdSp 3

#Group Group_2 - Security Options
keylset Group_2 Method {WPA2-PSK}
keylset Group_2 PskAscii charter123

#Group Group_3
keylset Group_3 GroupType 802.11ac
keylset Group_3 Dut generic_dut_2

#Group Group_3 - Client Options
keylset Group_3 ListenInt 10
keylset Group_3 Ssid $SSID_24
keylset Group_3 Hops 0
keylset Group_3 MimoId 0
keylset Group_3 DataPhyRate 12
keylset Group_3 Wlan80211eQoSAC 0
keylset Group_3 Dhcp Enable
keylset Group_3 RateAdapt 0
keylset Group_3 GratuitousArp True
keylset Group_3 MacAddress None
keylset Group_3 EnableAMSDUaggregation 0
keylset Group_3 PlcpConfiguration mixed
keylset Group_3 GuiPhyRate 26.0
keylset Group_3 ChannelBandwidth 20
keylset Group_3 EnableLDPC False
keylset Group_3 EnableAMPDUaggregation 0
keylset Group_3 EnableRxAMSDUaggregation 1
keylset Group_3 ChannelModel Bypass
keylset Group_3 DataMcsIndex 3
keylset Group_3 MgmtPhyRate 6
keylset Group_3 GuardInterval standard
keylset Group_3 EnableIpv6 0
keylset Group_3 SubnetMask 255.255.0.0
keylset Group_3 KeepAlive True
keylset Group_3 MacAddressIncr 1
keylset Group_3 SnrVal 12
keylset Group_3 DistId 2
keylset Group_3 Gateway 192.168.1.1
keylset Group_3 phyInterface 802.11n
keylset Group_3 TxPower -40
keylset Group_3 Qos Enable
# keylset Group_3 Bssid f4:6b:ef:d8:6d:6e
keylset Group_3 IncrIp Normal
keylset Group_3 TransmitDeference 1
keylset Group_3 BaseIp 192.168.2.10
keylset Group_3 UapsdSp 3

#Group Group_3 - Security Options
keylset Group_3 Method {WPA2-PSK}
keylset Group_3 PskAscii charter123

#Wimix Test Settings
keylset wimix_script Test wimix_script
keylset wimix_script wimixMode Client
keylset wimix_script wimixTestName WaveQoE
keylset wimix_script testProfile ClientMix
keylset wimix_script testProfileImage images/wimix_new.png
keylset wimix_script staggerStartInt 1
keylset wimix_script loadVal 25
keylset wimix_script totalLoadPer 100.0
keylset wimix_script contAdminControlFlag 1
keylset wimix_script loadMode 0
keylset wimix_script loadSweepEnd 20
keylset wimix_script loadSweepStart 10
keylset wimix_script staggerStart 0
keylset wimix_script loadSweepStep 1
keylset wimix_script totalClientPer 100.0
keylset wimix_script continueFlag 0
keylset wimix_script ClientMix.Group_1.TrafficType {traffic001}
keylset wimix_script ClientMix.Group_1.Percentage 40.0
keylset wimix_script ClientMix.Group_1.delay 0
keylset wimix_script ClientMix.Group_1.endTime END
keylset wimix_script ClientMix.Group_2.TrafficType {traffic001}
keylset wimix_script ClientMix.Group_2.Percentage 40.0
keylset wimix_script ClientMix.Group_2.delay 0
keylset wimix_script ClientMix.Group_2.endTime END
keylset wimix_script ClientMix.Group_3.TrafficType {traffic001}
keylset wimix_script ClientMix.Group_3.Percentage 20.0
keylset wimix_script ClientMix.Group_3.delay 0
keylset wimix_script ClientMix.Group_3.endTime END

#Traffic Profiles


keylset traffic001 WimixtrafficIntendedrate 5000.0
keylset traffic001 WimixtrafficipProtocolNum Auto
keylset traffic001 WimixtrafficType UDP
keylset traffic001 WimixtrafficDirection downlink
keylset traffic001 WimixtrafficFramesize 1518
keylset traffic001 WimixtrafficEnableIpv6 0
keylset traffic001 WimixtrafficpayData None
keylset traffic001 WimixtrafficStreamType 0
keylset traffic001 WimixtrafficRateBehaviour 0
keylset traffic001 WimixtraffictcpWinSize 65535
keylset traffic001 WimixtrafficServer server1
keylset traffic001 WimixtrafficDataRetries 10
keylset traffic001 WimixtrafficNumFrames 100000000
keylset traffic001 WimixtrafficPhyrate 54
keylset traffic001 WimixtrafficTtl 64
keylset traffic001 WimixtrafficRateMode 0
keylset traffic001 WimixtrafficpayPattern 0
keylset traffic001 Layer2qosenable 0
keylset traffic001 Layer2qossurBand 100
keylset traffic001 Layer2qosminPhyRate 1
keylset traffic001 Layer2qoswlanUp 0
keylset traffic001 Layer2qosmDataRate 10240
keylset traffic001 Layer2qosethUp 0
keylset traffic001 Layer2qostclasIe 0
keylset traffic001 Layer2qosmsduSize 128
keylset traffic001 Layer2qosadControl 0
keylset traffic001 Layer2qosflDir 1
keylset traffic001 Layer2qostid 0
keylset traffic001 Layer2qostclasUp 0
keylset traffic001 Layer2qosclassifier None
keylset traffic001 MulticastaddrmacAddress 01:00:5e:01:01:01
keylset traffic001 MulticastaddripV6Address ff00::01
keylset traffic001 MulticastaddripMode 1
keylset traffic001 MulticastaddrmacV6Address 33:33:00:00:00:01
keylset traffic001 MulticastaddrsrcIpMode 1
keylset traffic001 MulticastaddripAddress 224.1.1.1
keylset traffic001 SlaLatency 10000
keylset traffic001 SlaJitter 500
keylset traffic001 SlaPacketLoss 10.0
keylset traffic001 Layer4to7SrcPort 20205
keylset traffic001 Layer4to7DestPort 30205
keylset traffic001 Layer3qosenable 0
keylset traffic001 Layer3qosdscp 0
keylset traffic001 BurstdataburstDur 5
keylset traffic001 BurstdataburstRate 100
keylset traffic001 Burstdataibg 5

#Server Profiles


keylset server1 WimixservermacAddress 00:00:01:00:00:01
keylset server1 WimixserverEnableIpv6 0
keylset server1 WimixserverserverType 0
keylset server1 WimixserveripMode 0
keylset server1 WimixserverethPort $Card_Eth
keylset server1 Wimixservernetmask 255.255.0.0
keylset server1 WimixservermacMode 1
keylset server1 WimixserveragentServer None
keylset server1 WimixserveripV6Mode 0
keylset server1 WimixserveripAddress 192.168.1.100
keylset server1 Wimixservergateway 192.168.1.1
keylset server1 Vlanenable 0
keylset server1 Vlanid 0

#Port list for port specific options
keylset global_config Ports {generic_dut_2, generic_dut_eth}

#Generic Dut Definitions

#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor $VENDORNAME
keylset generic_dut_2 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version\ :@|#^&
keylset generic_dut_2 APSWVersion $VENDORFW
keylset generic_dut_2 APModel $VENDORMODEL
keylset generic_dut_2 Interface.802_11ac.BindStatus True
keylset generic_dut_2 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11ac.portChannelBandwidth 20
keylset generic_dut_2 Interface.802_11ac.RxAttenuation False
keylset generic_dut_2 Interface.802_11ac.ClientBackoff False
keylset generic_dut_2 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_2 Interface.802_11ac.secChannel 0
keylset generic_dut_2 Interface.802_11ac.CaptureMode reduced
keylset generic_dut_2 Interface.802_11ac.PartCode 2A05400980000000
keylset generic_dut_2 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_2 Interface.802_11ac.VkIndex 1
keylset generic_dut_2 Interface.802_11ac.Channel $Channel24
keylset generic_dut_2 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_2 WLANSwitchModel WLAN\ Switch\ Model\ :@|#^&

#Generic Dut - generic_dut_eth
keylset generic_dut_eth used False
keylset generic_dut_eth Vendor generic
keylset generic_dut_eth WLANSwitchSWVersion WLAN\ Switch\ SW\ Version\ :@|#^&
keylset generic_dut_eth APSWVersion $VENDORFW
keylset generic_dut_eth APModel $VENDORMODEL
keylset generic_dut_eth Interface.802_3.BindStatus True
keylset generic_dut_eth Interface.802_3.WavetestPort $Card_Eth
keylset generic_dut_eth Interface.802_3.Autonegotiation on
keylset generic_dut_eth Interface.802_3.EthernetSpeed 100
keylset generic_dut_eth Interface.802_3.Duplex full
keylset generic_dut_eth Interface.802_3.RxAttenuation True
keylset generic_dut_eth Interface.802_3.ClientBackoff False
keylset generic_dut_eth Interface.802_3.InterfaceType 802.3
keylset generic_dut_eth Interface.802_3.secChannel 0
keylset generic_dut_eth WLANSwitchModel WLAN\ Switch\ Model\ :@|#^&

#Client Analysis Profiles

