
#Auto-generated from: MCD
#At: 2014-10-15 10:47:38.163000
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
keylset global_config Source {WirelessTv}
keylset global_config Destination {HomeLaptop iDevice WorkLaptop}

#Traffics Global Options

keylset global_config Content None
keylset global_config UserPattern None
keylset global_config PayloadData None
keylset global_config DestinationPort None
keylset global_config SourcePort None

#Learning Global Options

keylset global_config ArpTimeout 60
keylset global_config AgingTime 0
keylset global_config ArpNumRetries 10
keylset global_config NumArpFails 86
keylset global_config ArpRate 10
keylset global_config ClientLearningTime 2

#IgmpJoinInfo Global Options


#Connection Global Options
keylset global_config AssocTimeout 30
keylset global_config NumFails 84

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
set Card_Eth_2 $card_eth_2_ip
set SSID_24 $ssid_24
set SSID_5 $ssid_5
set VENDORNAME $vendor_name
set VENDORMODEL $vendor_model
set VENDORFW $vendor_firmware
set WLANSwitchModel none
set WLANSwitchFW none
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

keylset global_config ConnectionTimeout 60
keylset global_config NumL4to7Fails 83
keylset global_config ConnectionPattern 0

#TestParameters Global Options

keylset global_config TrialDuration 10
keylset global_config TestDurationSec 10
keylset global_config ClientContention 70
keylset global_config wimixResultSampleVal 5
keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 0
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 1
keylset global_config wimixResultOption 1

#Tests - you may define more than one in a TCL list.
#Complete List QoE_24_20 QoE_5_40 QoE_5_80
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 0

#Group HomeLaptop
keylset HomeLaptop GroupType 802.11ac
keylset HomeLaptop Dut generic_dut_2

#Group HomeLaptop - Client Options
keylset HomeLaptop ListenInt 10
keylset HomeLaptop Ssid $SSID_24
keylset HomeLaptop DataPhyRate 36
keylset HomeLaptop Wlan80211eQoSAC 0
keylset HomeLaptop Dhcp Enable
keylset HomeLaptop RateAdapt 0
keylset HomeLaptop GratuitousArp True
keylset HomeLaptop MacAddress 00:00:01:00:00:01
keylset HomeLaptop EnableAMSDUaggregation 0
keylset HomeLaptop PlcpConfiguration mixed
keylset HomeLaptop ChannelBandwidth 40
keylset HomeLaptop EnableLDPC False
keylset HomeLaptop EnableAMPDUaggregation 1
keylset HomeLaptop ChannelModel Bypass
keylset HomeLaptop DataMcsIndex 13
keylset HomeLaptop GuardInterval standard
keylset HomeLaptop EnableIpv6 0
keylset HomeLaptop SubnetMask 255.255.0.0
keylset HomeLaptop KeepAlive True
keylset HomeLaptop MacAddressIncr 1
keylset HomeLaptop NumTxAntennas 0
keylset HomeLaptop DistId 1
keylset HomeLaptop Gateway 192.168.1.1
keylset HomeLaptop phyInterface 802.11n
keylset HomeLaptop MgmtPhyRate 12
keylset HomeLaptop TxPower -20
keylset HomeLaptop SnrVal 25
keylset HomeLaptop Qos Enable
keylset HomeLaptop IncrIp Normal
keylset HomeLaptop TransmitDeference 1
keylset HomeLaptop BaseIp 192.168.1.10

#Group HomeLaptop - Security Options
keylset HomeLaptop Method {WPA2-PSK}
keylset HomeLaptop PskAscii charter123

#Group WirelessTv
keylset WirelessTv GroupType 802.11ac
keylset WirelessTv Dut generic_dut_2

#Group WirelessTv - Client Options
keylset WirelessTv ListenInt 10
keylset WirelessTv Ssid $SSID_24
keylset WirelessTv Hops 2
keylset WirelessTv Wlan80211eQoSAC 0
keylset WirelessTv Dhcp Enable
keylset WirelessTv RateAdapt 0
keylset WirelessTv GratuitousArp True
keylset WirelessTv MacAddress 00:00:01:00:00:01
keylset WirelessTv EnableAMSDUaggregation 0
keylset WirelessTv PlcpConfiguration mixed
keylset WirelessTv ChannelBandwidth 40
keylset WirelessTv EnableLDPC False
keylset WirelessTv EnableAMPDUaggregation 1
keylset WirelessTv ChannelModel Bypass
keylset WirelessTv DataMcsIndex 15
keylset WirelessTv GuardInterval standard
keylset WirelessTv EnableIpv6 0
keylset WirelessTv SubnetMask 255.255.0.0
keylset WirelessTv KeepAlive True
keylset WirelessTv MacAddressIncr 1
keylset WirelessTv NumTxAntennas 0
keylset WirelessTv Gateway 192.168.1.1
keylset WirelessTv phyInterface 802.11n
keylset WirelessTv MgmtPhyRate 24
keylset WirelessTv Qos Enable
keylset WirelessTv IncrIp Normal
keylset WirelessTv TransmitDeference 1
keylset WirelessTv BaseIp 192.168.3.10

#Group WirelessTv - Security Options
keylset WirelessTv Method {WPA2-PSK}
keylset WirelessTv PskAscii charter123

#Group WorkLaptop
keylset WorkLaptop GroupType 802.11ac
keylset WorkLaptop Dut generic_dut_2

#Group WorkLaptop - Client Options
keylset WorkLaptop ListenInt 10
keylset WorkLaptop Ssid $SSID_24
keylset WorkLaptop Hops -1
keylset WorkLaptop DataPhyRate 36
keylset WorkLaptop Wlan80211eQoSAC 0
keylset WorkLaptop Dhcp Enable
keylset WorkLaptop RateAdapt 0
keylset WorkLaptop GratuitousArp True
keylset WorkLaptop MacAddress 00:00:01:00:04:01
keylset WorkLaptop EnableAMSDUaggregation 0
keylset WorkLaptop PlcpConfiguration mixed
keylset WorkLaptop ChannelBandwidth 40
keylset WorkLaptop EnableLDPC False
keylset WorkLaptop EnableAMPDUaggregation 1
keylset WorkLaptop ChannelModel Bypass
keylset WorkLaptop DataMcsIndex 13
keylset WorkLaptop GuardInterval standard
keylset WorkLaptop EnableIpv6 0
keylset WorkLaptop SubnetMask 255.255.0.0
keylset WorkLaptop KeepAlive True
keylset WorkLaptop MacAddressIncr 1
keylset WorkLaptop NumTxAntennas 0
keylset WorkLaptop DistId 1
keylset WorkLaptop Gateway 192.168.1.1
keylset WorkLaptop phyInterface 802.11n
keylset WorkLaptop MgmtPhyRate 12
keylset WorkLaptop TxPower -20
keylset WorkLaptop SnrVal 25
keylset WorkLaptop Qos Enable
keylset WorkLaptop IncrIp Normal
keylset WorkLaptop TransmitDeference 1
keylset WorkLaptop BaseIp 192.168.5.10

#Group WorkLaptop - Security Options
keylset WorkLaptop Method {WPA2-PSK}
keylset WorkLaptop PskAscii charter123

#Group iDevice
keylset iDevice GroupType 802.11abgn
keylset iDevice Dut generic_dut_2

#Group iDevice - Client Options
keylset iDevice ListenInt 10
keylset iDevice Ssid $SSID_24
keylset iDevice Hops 3
keylset iDevice DataPhyRate 36
keylset iDevice Wlan80211eQoSAC 0
keylset iDevice Dhcp Enable
keylset iDevice RateAdapt 0
keylset iDevice GratuitousArp True
keylset iDevice MacAddress 00:00:01:00:03:01
keylset iDevice EnableAMSDUaggregation 0
keylset iDevice PlcpConfiguration mixed
keylset iDevice ChannelBandwidth 40
keylset iDevice EnableLDPC False
keylset iDevice EnableAMPDUaggregation 1
keylset iDevice ChannelModel Bypass
keylset iDevice DataMcsIndex 13
keylset iDevice GuardInterval standard
keylset iDevice EnableIpv6 0
keylset iDevice SubnetMask 255.255.0.0
keylset iDevice KeepAlive True
keylset iDevice MacAddressIncr 1
keylset iDevice NumTxAntennas 0
keylset iDevice DistId 1
keylset iDevice Gateway 192.168.1.1
keylset iDevice phyInterface 802.11n
keylset iDevice MgmtPhyRate 12
keylset iDevice TxPower -20
keylset iDevice SnrVal 25
keylset iDevice Qos Enable
keylset iDevice IncrIp Normal
keylset iDevice TransmitDeference 1
keylset iDevice BaseIp 192.168.4.10

#Group iDevice - Security Options
keylset iDevice Method {WPA2-PSK}
keylset iDevice PskAscii charter123


#24GHz devices
set HomeLaptop_24 ${HomeLaptop}
keylset HomeLaptop_24 Ssid $SSID_24
keylset HomeLaptop_24 Dut generic_dut_2
keylset HomeLaptop_24 NumTxAntennas $Num24Antennas
set WirelessTv_24 ${WirelessTv}
keylset WirelessTv_24 Ssid $SSID_24
keylset WirelessTv_24 Dut generic_dut_2
keylset WirelessTv_24 NumTxAntennas $Num24Antennas
set WorkLaptop_24 ${WorkLaptop}
keylset WorkLaptop_24 Ssid $SSID_24
keylset WorkLaptop_24 Dut generic_dut_2
keylset WorkLaptop_24 NumTxAntennas $Num24Antennas
set iDevice_24 ${iDevice}
keylset iDevice_24 Ssid $SSID_24
keylset iDevice_24 Dut generic_dut_2
keylset iDevice_24 NumTxAntennas $Num24Antennas

#5Ghz devices
set HomeLaptop_540 ${HomeLaptop}
keylset HomeLaptop_540 Ssid $SSID_5
keylset HomeLaptop_540 Dut generic_dut_5
keylset HomeLaptop_540 ChannelBandwidth 40
keylset HomeLaptop_540 NumTxAntennas $Num5Antennas
keylset HomeLaptop_540 GuardInterval short
set WirelessTv_540 ${WirelessTv}
keylset WirelessTv_540 Ssid $SSID_5
keylset WirelessTv_540 Dut generic_dut_5
keylset WirelessTv_540 ChannelBandwidth 40
keylset WirelessTv_540 NumTxAntennas $Num5Antennas
keylset WirelessTv_540 GuardInterval short
set WorkLaptop_540 ${WorkLaptop}
keylset WorkLaptop_540 Ssid $SSID_5
keylset WorkLaptop_540 Dut generic_dut_5
keylset WorkLaptop_540 ChannelBandwidth 40
keylset WorkLaptop_540 NumTxAntennas $Num5Antennas
keylset WorkLaptop_540 GuardInterval short
set iDevice_540 ${iDevice}
keylset iDevice_540 Ssid $SSID_5
keylset iDevice_540 Dut generic_dut_5
keylset iDevice_540 ChannelBandwidth 40
keylset iDevice_540 NumTxAntennas $Num5Antennas
keylset iDevice_540 GuardInterval short


set HomeLaptop_580 ${HomeLaptop}
keylset HomeLaptop_580 Ssid $SSID_5
keylset HomeLaptop_580 Dut generic_dut_5
keylset HomeLaptop_580 ChannelBandwidth 80
keylset HomeLaptop_580 phyInterface 802.11ac
keylset HomeLaptop_580 PlcpConfiguration vht_mixed
keylset HomeLaptop_580 NumTxAntennas $Num5Antennas
keylset HomeLaptop_580 GuardInterval short
set WirelessTv_580 ${WirelessTv}
keylset WirelessTv_580 Ssid $SSID_5
keylset WirelessTv_580 Dut generic_dut_5
keylset WirelessTv_580 ChannelBandwidth 80
keylset WirelessTv_580 phyInterface 802.11ac
keylset WirelessTv_580 PlcpConfiguration vht_mixed
keylset WirelessTv_580 NumTxAntennas $Num5Antennas
keylset WirelessTv_580 GuardInterval short
set WorkLaptop_580 ${WorkLaptop}
keylset WorkLaptop_580 Ssid $SSID_5
keylset WorkLaptop_580 Dut generic_dut_5
keylset WorkLaptop_580 ChannelBandwidth 80
keylset WorkLaptop_580 phyInterface 802.11ac
keylset WorkLaptop_580 PlcpConfiguration vht_mixed
keylset WorkLaptop_580 NumTxAntennas $Num5Antennas
keylset WorkLaptop_580 GuardInterval short
set iDevice_580 ${iDevice}
keylset iDevice_580 Ssid $SSID_5
keylset iDevice_580 Dut generic_dut_5
keylset iDevice_580 ChannelBandwidth 80
keylset iDevice_580 phyInterface 802.11ac
keylset iDevice_580 PlcpConfiguration vht_mixed
keylset iDevice_580 NumTxAntennas $Num5Antennas
keylset iDevice_580 GuardInterval short




#Wimix Test Settings
keylset wimix_script Test wimix_script
keylset wimix_script wimixMode Client
keylset wimix_script wimixTestName WaveQoE
keylset wimix_script testProfile Residential
keylset wimix_script testProfileImage images/wimix_residential.png
keylset wimix_script staggerStart 0
keylset wimix_script totalClientPer 100
keylset wimix_script staggerStartInt 1
keylset wimix_script loadVal 10
keylset wimix_script totalLoadPer 100
keylset wimix_script loadSweepStart 10
# keylset wimix_script contAdminControlFlag 1
keylset wimix_script loadMode 1
keylset wimix_script loadSweepEnd 75
keylset wimix_script loadSweepStep 5
keylset wimix_script continueFlag 1


set QoE_24_20 ${wimix_script}
keylset QoE_24_20 ClientMix.WirelessTv_24.TrafficType {VideoStreaming}
keylset QoE_24_20 ClientMix.WirelessTv_24.Percentage 20
keylset QoE_24_20 ClientMix.WirelessTv_24.delay 0
keylset QoE_24_20 ClientMix.WirelessTv_24.endTime END
keylset QoE_24_20 ClientMix.HomeLaptop_24.TrafficType {InternetRadio InternetVoice PersonalEmail VideoStreaming}
keylset QoE_24_20 ClientMix.HomeLaptop_24.Percentage 20
keylset QoE_24_20 ClientMix.HomeLaptop_24.delay 0
keylset QoE_24_20 ClientMix.HomeLaptop_24.endTime END
keylset QoE_24_20 ClientMix.iDevice_24.TrafficType {InternetVideo WebBrowsing}
keylset QoE_24_20 ClientMix.iDevice_24.Percentage 20
keylset QoE_24_20 ClientMix.iDevice_24.delay 0
keylset QoE_24_20 ClientMix.iDevice_24.endTime END
keylset QoE_24_20 ClientMix.WorkLaptop_24.TrafficType {WorkEmail WebBrowsing FileDownloads FileUploads}
keylset QoE_24_20 ClientMix.WorkLaptop_24.Percentage 20
keylset QoE_24_20 ClientMix.WorkLaptop_24.delay 0
keylset QoE_24_20 ClientMix.WorkLaptop_24.endTime END
keylset QoE_24_20 Source {WirelessTv_24}
keylset QoE_24_20 Destination {HomeLaptop_24 iDevice_24 WorkLaptop_24}

set QoE_5_40 ${wimix_script}
keylset QoE_5_40 ClientMix.WirelessTv_540.TrafficType {VideoStreaming}
keylset QoE_5_40 ClientMix.WirelessTv_540.Percentage 20
keylset QoE_5_40 ClientMix.WirelessTv_540.delay 0
keylset QoE_5_40 ClientMix.WirelessTv_540.endTime END
keylset QoE_5_40 ClientMix.HomeLaptop_540.TrafficType {InternetRadio InternetVoice PersonalEmail VideoStreaming}
keylset QoE_5_40 ClientMix.HomeLaptop_540.Percentage 20
keylset QoE_5_40 ClientMix.HomeLaptop_540.delay 0
keylset QoE_5_40 ClientMix.HomeLaptop_540.endTime END
keylset QoE_5_40 ClientMix.iDevice_540.TrafficType {InternetVideo WebBrowsing}
keylset QoE_5_40 ClientMix.iDevice_540.Percentage 20
keylset QoE_5_40 ClientMix.iDevice_540.delay 0
keylset QoE_5_40 ClientMix.iDevice_540.endTime END
keylset QoE_5_40 ClientMix.WorkLaptop_540.TrafficType {WorkEmail WebBrowsing FileDownloads FileUploads}
keylset QoE_5_40 ClientMix.WorkLaptop_540.Percentage 20
keylset QoE_5_40 ClientMix.WorkLaptop_540.delay 0
keylset QoE_5_40 ClientMix.WorkLaptop_540.endTime END
keylset QoE_5_40 Source {WirelessTv_540}
keylset QoE_5_40 Destination {HomeLaptop_540 iDevice_540 WorkLaptop_540}



set QoE_5_80 ${wimix_script}
keylset QoE_5_80 ClientMix.WirelessTv_580.TrafficType {VideoStreaming}
keylset QoE_5_80 ClientMix.WirelessTv_580.Percentage 20
keylset QoE_5_80 ClientMix.WirelessTv_580.delay 0
keylset QoE_5_80 ClientMix.WirelessTv_580.endTime END
keylset QoE_5_80 ClientMix.HomeLaptop_580.TrafficType {InternetRadio InternetVoice PersonalEmail VideoStreaming}
keylset QoE_5_80 ClientMix.HomeLaptop_580.Percentage 20
keylset QoE_5_80 ClientMix.HomeLaptop_580.delay 0
keylset QoE_5_80 ClientMix.HomeLaptop_580.endTime END
keylset QoE_5_80 ClientMix.iDevice_580.TrafficType {InternetVideo WebBrowsing}
keylset QoE_5_80 ClientMix.iDevice_580.Percentage 20
keylset QoE_5_80 ClientMix.iDevice_580.delay 0
keylset QoE_5_80 ClientMix.iDevice_580.endTime END
keylset QoE_5_80 ClientMix.WorkLaptop_580.TrafficType {WorkEmail WebBrowsing FileDownloads FileUploads}
keylset QoE_5_80 ClientMix.WorkLaptop_580.Percentage 20
keylset QoE_5_80 ClientMix.WorkLaptop_580.delay 0
keylset QoE_5_80 ClientMix.WorkLaptop_580.endTime END
keylset QoE_5_80 Source {WirelessTv_580}
keylset QoE_5_80 Destination {HomeLaptop_580 iDevice_580 WorkLaptop_580}






#Traffic Profiles


keylset FileDownloads WimixtrafficDirection downlink
keylset FileDownloads WimixtrafficIntendedrate 1000
keylset FileDownloads WimixtrafficFramesize 1500
keylset FileDownloads WimixtrafficNumFrames 1000000000
keylset FileDownloads WimixtrafficpayData None
keylset FileDownloads WimixtrafficServer MediaServer
keylset FileDownloads WimixtrafficipProtocolNum Auto
keylset FileDownloads WimixtrafficPhyrate 54
keylset FileDownloads WimixtrafficpayPattern 0
keylset FileDownloads WimixtrafficTtl 64
keylset FileDownloads WimixtrafficRateMode 0
keylset FileDownloads WimixtrafficType FTP
keylset FileDownloads WimixtrafficRateBehaviour 0
keylset FileDownloads Layer4to7UserName anonymous
keylset FileDownloads Layer4to7SrcPort 21863
keylset FileDownloads Layer4to7FileName home.txt
keylset FileDownloads Layer4to7FileSize 10
keylset FileDownloads Layer4to7Operation ftp\ get
keylset FileDownloads Layer4to7Password anonymous
keylset FileDownloads Layer4to7DestPort 21
keylset FileDownloads Layer3qosenable 1
keylset FileDownloads Layer3qosdscp 0
keylset FileDownloads BurstdataburstDur 5
keylset FileDownloads BurstdataburstRate 100
keylset FileDownloads Burstdataibg 5
keylset FileDownloads Layer2qosenable 1
keylset FileDownloads Layer2qossurBand 100
keylset FileDownloads Layer2qosminPhyRate 3
keylset FileDownloads Layer2qoswlanUp 0
keylset FileDownloads Layer2qosmDataRate 10240
keylset FileDownloads Layer2qosethUp 0
keylset FileDownloads Layer2qostclasIe 0
keylset FileDownloads Layer2qosmsduSize 128
keylset FileDownloads Layer2qosadControl 0
keylset FileDownloads Layer2qosflDir 1
keylset FileDownloads Layer2qostid 0
keylset FileDownloads Layer2qostclasUp 0
keylset FileDownloads Layer2qosclassifier None
keylset FileDownloads SlaperLoad 50

keylset VideoStreaming WimixtrafficDirection downlink
keylset VideoStreaming WimixtrafficIntendedrate 20000
keylset VideoStreaming WimixtrafficFramesize 1500
keylset VideoStreaming WimixtrafficpayData None
keylset VideoStreaming WimixtrafficServer MediaServer
keylset VideoStreaming WimixtrafficipProtocolNum Auto
keylset VideoStreaming WimixtrafficPhyrate 54
keylset VideoStreaming WimixtrafficpayPattern 0
keylset VideoStreaming WimixtrafficTtl 64
keylset VideoStreaming WimixtrafficRateMode 0
keylset VideoStreaming WimixtrafficType RTPVideo
keylset VideoStreaming WimixtrafficRateBehaviour 0
keylset VideoStreaming Layer4to7rtpVideoSignaling 0
keylset VideoStreaming Layer4to7rtpVideoProtocol 0
keylset VideoStreaming Layer4to7SrcPort 3155
keylset VideoStreaming Layer4to7DestPort 3155
keylset VideoStreaming Layer4to7rtpVideoCoding 0
keylset VideoStreaming Layer3qosenable 1
keylset VideoStreaming Layer3qosdscp 40
keylset VideoStreaming BurstdataburstDur 5
keylset VideoStreaming BurstdataburstRate 100
keylset VideoStreaming Burstdataibg 5
keylset VideoStreaming Layer2qosenable 1
keylset VideoStreaming Layer2qossurBand 100
keylset VideoStreaming Layer2qosminPhyRate 3
keylset VideoStreaming Layer2qoswlanUp 5
keylset VideoStreaming Layer2qosmDataRate 2048
keylset VideoStreaming Layer2qosethUp 5
keylset VideoStreaming Layer2qostclasIe 0
keylset VideoStreaming Layer2qosmsduSize 128
keylset VideoStreaming Layer2qosadControl 0
keylset VideoStreaming Layer2qosflDir 1
keylset VideoStreaming Layer2qostid 5
keylset VideoStreaming Layer2qostclasUp 0
keylset VideoStreaming Layer2qosclassifier None
keylset VideoStreaming SlaDf 50
keylset VideoStreaming SlaMlr 1


keylset FileUploads WimixtrafficDirection uplink
keylset FileUploads WimixtrafficIntendedrate 1000
keylset FileUploads WimixtrafficFramesize 1500
keylset FileUploads WimixtrafficpayData None
keylset FileUploads WimixtrafficServer Internet
keylset FileUploads WimixtrafficipProtocolNum Auto
keylset FileUploads WimixtrafficPhyrate 54
keylset FileUploads WimixtrafficpayPattern 0
keylset FileUploads WimixtrafficTtl 64
keylset FileUploads WimixtrafficRateMode 0
keylset FileUploads WimixtrafficType FTP
keylset FileUploads WimixtrafficRateBehaviour 0
keylset FileUploads Layer4to7UserName anonymous
keylset FileUploads Layer4to7SrcPort 22786
keylset FileUploads Layer4to7FileName home.txt
keylset FileUploads Layer4to7FileSize 10
keylset FileUploads Layer4to7Operation ftp\ put
keylset FileUploads Layer4to7Password anonymous
keylset FileUploads Layer4to7DestPort 21
keylset FileUploads Layer3qosenable 1
keylset FileUploads Layer3qosdscp 0
keylset FileUploads BurstdataburstDur 5
keylset FileUploads BurstdataburstRate 100
keylset FileUploads Burstdataibg 5
keylset FileUploads Layer2qosenable 1
keylset FileUploads Layer2qossurBand 100
keylset FileUploads Layer2qosminPhyRate 3
keylset FileUploads Layer2qoswlanUp 0
keylset FileUploads Layer2qosmDataRate 10240
keylset FileUploads Layer2qosethUp 0
keylset FileUploads Layer2qostclasIe 0
keylset FileUploads Layer2qosmsduSize 128
keylset FileUploads Layer2qosadControl 0
keylset FileUploads Layer2qosflDir 0
keylset FileUploads Layer2qostid 0
keylset FileUploads Layer2qostclasUp 0
keylset FileUploads Layer2qosclassifier None
keylset FileUploads SlaperLoad 50


keylset WebBrowsing WimixtrafficDirection downlink
keylset WebBrowsing WimixtrafficIntendedrate 1000
keylset WebBrowsing WimixtrafficFramesize 470
keylset WebBrowsing WimixtrafficpayData None
keylset WebBrowsing WimixtrafficServer Internet
keylset WebBrowsing WimixtrafficipProtocolNum Auto
keylset WebBrowsing WimixtrafficPhyrate 54
keylset WebBrowsing WimixtrafficpayPattern 0
keylset WebBrowsing WimixtrafficTtl 64
keylset WebBrowsing WimixtrafficRateMode 0
keylset WebBrowsing WimixtrafficType HTTP
keylset WebBrowsing WimixtrafficRateBehaviour 0
keylset WebBrowsing Layer4to7Operation http\ get
keylset WebBrowsing Layer4to7SrcPort 21163
keylset WebBrowsing Layer4to7DestPort 80
keylset WebBrowsing Layer3qosenable 1
keylset WebBrowsing Layer3qosdscp 0
keylset WebBrowsing BurstdataburstDur 5
keylset WebBrowsing BurstdataburstRate 100
keylset WebBrowsing Burstdataibg 5
keylset WebBrowsing Layer2qosenable 1
keylset WebBrowsing Layer2qossurBand 100
keylset WebBrowsing Layer2qosminPhyRate 3
keylset WebBrowsing Layer2qoswlanUp 0
keylset WebBrowsing Layer2qosmDataRate 10240
keylset WebBrowsing Layer2qosethUp 0
keylset WebBrowsing Layer2qostclasIe 0
keylset WebBrowsing Layer2qosmsduSize 128
keylset WebBrowsing Layer2qosadControl 0
keylset WebBrowsing Layer2qosflDir 1
keylset WebBrowsing Layer2qostid 0
keylset WebBrowsing Layer2qostclasUp 0
keylset WebBrowsing Layer2qosclassifier None
keylset WebBrowsing SlaperLoad 50


keylset InternetVideo WimixtrafficDirection downlink
keylset InternetVideo WimixtrafficIntendedrate 10000
keylset InternetVideo WimixtrafficFramesize 1500
keylset InternetVideo WimixtrafficpayData None
keylset InternetVideo WimixtrafficServer Internet
keylset InternetVideo WimixtrafficipProtocolNum Auto
keylset InternetVideo WimixtrafficPhyrate 54
keylset InternetVideo WimixtrafficpayPattern 0
keylset InternetVideo WimixtrafficTtl 64
keylset InternetVideo WimixtrafficRateMode 0
keylset InternetVideo WimixtrafficType TCPVideo
keylset InternetVideo WimixtrafficRateBehaviour 0
keylset InternetVideo Layer4to7mediaFileSize 5000
keylset InternetVideo Layer4to7SrcPort 20674
keylset InternetVideo Layer4to7mediaProtocol 0
keylset InternetVideo Layer4to7playTime 300
keylset InternetVideo Layer4to7bufferSize 500
keylset InternetVideo Layer4to7DestPort 30674
keylset InternetVideo Layer3qosenable 1
keylset InternetVideo Layer3qosdscp 40
keylset InternetVideo BurstdataburstDur 5
keylset InternetVideo BurstdataburstRate 100
keylset InternetVideo Burstdataibg 5
keylset InternetVideo Layer2qosenable 1
keylset InternetVideo Layer2qossurBand 100
keylset InternetVideo Layer2qosminPhyRate 3
keylset InternetVideo Layer2qoswlanUp 0
keylset InternetVideo Layer2qosmDataRate 10240
keylset InternetVideo Layer2qosethUp 5
keylset InternetVideo Layer2qostclasIe 0
keylset InternetVideo Layer2qosmsduSize 128
keylset InternetVideo Layer2qosadControl 0
keylset InternetVideo Layer2qosflDir 1
keylset InternetVideo Layer2qostid 0
keylset InternetVideo Layer2qostclasUp 0
keylset InternetVideo Layer2qosclassifier None
keylset InternetVideo SlaplayDelay 5
keylset InternetVideo SlacontPlay 0


keylset PersonalEmail WimixtrafficDirection downlink
keylset PersonalEmail WimixtrafficIntendedrate 1000
keylset PersonalEmail WimixtrafficFramesize 1500
keylset PersonalEmail WimixtrafficpayData None
keylset PersonalEmail WimixtrafficServer Internet
keylset PersonalEmail WimixtrafficipProtocolNum Auto
keylset PersonalEmail WimixtrafficPhyrate 54
keylset PersonalEmail WimixtrafficpayPattern 0
keylset PersonalEmail WimixtrafficTtl 64
keylset PersonalEmail WimixtrafficRateMode 0
keylset PersonalEmail WimixtrafficType HTTP
keylset PersonalEmail WimixtrafficRateBehaviour 0
keylset PersonalEmail Layer4to7Operation http\ get
keylset PersonalEmail Layer4to7SrcPort 21508
keylset PersonalEmail Layer4to7DestPort 31508
keylset PersonalEmail Layer3qosenable 1
keylset PersonalEmail Layer3qosdscp 0
keylset PersonalEmail BurstdataburstDur 5
keylset PersonalEmail BurstdataburstRate 100
keylset PersonalEmail Burstdataibg 5
keylset PersonalEmail Layer2qosenable 1
keylset PersonalEmail Layer2qossurBand 100
keylset PersonalEmail Layer2qosminPhyRate 3
keylset PersonalEmail Layer2qoswlanUp 0
keylset PersonalEmail Layer2qosmDataRate 10240
keylset PersonalEmail Layer2qosethUp 0
keylset PersonalEmail Layer2qostclasIe 0
keylset PersonalEmail Layer2qosmsduSize 128
keylset PersonalEmail Layer2qosadControl 0
keylset PersonalEmail Layer2qosflDir 1
keylset PersonalEmail Layer2qostid 0
keylset PersonalEmail Layer2qostclasUp 0
keylset PersonalEmail Layer2qosclassifier None
keylset PersonalEmail SlaperLoad 50


keylset InternetVoice WimixtrafficDirection bidirectional
keylset InternetVoice WimixtrafficIntendedrate 50
keylset InternetVoice WimixtrafficFramesize 236
keylset InternetVoice WimixtrafficsipSignaling 1
keylset InternetVoice WimixtrafficRateMode 1
keylset InternetVoice WimixtrafficpayData None
keylset InternetVoice WimixtrafficServer Internet
keylset InternetVoice WimixtrafficipProtocolNum Auto
keylset InternetVoice WimixtrafficPhyrate 54
keylset InternetVoice WimixtrafficpayPattern 0
keylset InternetVoice WimixtrafficTtl 64
keylset InternetVoice WimixtrafficType VOIP
keylset InternetVoice WimixtrafficRateBehaviour 0
keylset InternetVoice Layer4to7voipCodec 0
keylset InternetVoice Layer4to7voipSignaling 0
keylset InternetVoice Layer4to7SrcPort 23796
keylset InternetVoice Layer4to7DestPort 33796
keylset InternetVoice BurstdataburstDur 5
keylset InternetVoice BurstdataburstRate 100
keylset InternetVoice Burstdataibg 5
keylset InternetVoice Layer3qosenable 1
keylset InternetVoice Layer3qosdscp 56
keylset InternetVoice Layer2qosenable 1
keylset InternetVoice Layer2qossurBand 100
keylset InternetVoice Layer2qosminPhyRate 3
keylset InternetVoice Layer2qoswlanUp 7
keylset InternetVoice Layer2qosmDataRate 43000
keylset InternetVoice Layer2qosethUp 7
keylset InternetVoice Layer2qostclasIe 0
keylset InternetVoice Layer2qosmsduSize 208
keylset InternetVoice Layer2qosadControl 0
keylset InternetVoice Layer2qosflDir 2
keylset InternetVoice Layer2qostid 7
keylset InternetVoice Layer2qostclasUp 0
keylset InternetVoice Layer2qosclassifier None
keylset InternetVoice SlaslaMode 1
keylset InternetVoice Slavalue 4


keylset InternetRadio WimixtrafficDirection downlink
keylset InternetRadio WimixtrafficIntendedrate 10000
keylset InternetRadio WimixtrafficFramesize 256
keylset InternetRadio WimixtrafficpayData None
keylset InternetRadio WimixtrafficServer Internet
keylset InternetRadio WimixtrafficipProtocolNum Auto
keylset InternetRadio WimixtrafficPhyrate 54
keylset InternetRadio WimixtrafficpayPattern 0
keylset InternetRadio WimixtrafficTtl 64
keylset InternetRadio WimixtrafficRateMode 0
keylset InternetRadio WimixtrafficType RTP
keylset InternetRadio WimixtrafficRateBehaviour 0
keylset InternetRadio Layer4to7SrcPort 21794
keylset InternetRadio Layer4to7DestPort 31794
keylset InternetRadio Layer3qosenable 1
keylset InternetRadio Layer3qosdscp 0
keylset InternetRadio BurstdataburstDur 5
keylset InternetRadio BurstdataburstRate 100
keylset InternetRadio Burstdataibg 5
keylset InternetRadio Layer2qosenable 1
keylset InternetRadio Layer2qossurBand 100
keylset InternetRadio Layer2qosminPhyRate 3
keylset InternetRadio Layer2qoswlanUp 0
keylset InternetRadio Layer2qosmDataRate 10240
keylset InternetRadio Layer2qosethUp 0
keylset InternetRadio Layer2qostclasIe 0
keylset InternetRadio Layer2qosmsduSize 128
keylset InternetRadio Layer2qosadControl 0
keylset InternetRadio Layer2qosflDir 1
keylset InternetRadio Layer2qostid 0
keylset InternetRadio Layer2qostclasUp 0
keylset InternetRadio Layer2qosclassifier None
keylset InternetRadio SlaLatency 10000
keylset InternetRadio SlaJitter 500
keylset InternetRadio SlaPacketLoss 10

keylset WorkEmail WimixtrafficDirection downlink
keylset WorkEmail WimixtrafficIntendedrate 1000
keylset WorkEmail WimixtrafficFramesize 300
keylset WorkEmail WimixtrafficpayData None
keylset WorkEmail WimixtrafficServer Internet
keylset WorkEmail WimixtrafficipProtocolNum Auto
keylset WorkEmail WimixtrafficPhyrate 54
keylset WorkEmail WimixtrafficpayPattern 0
keylset WorkEmail WimixtrafficTtl 64
keylset WorkEmail WimixtrafficRateMode 0
keylset WorkEmail WimixtrafficType TCP
keylset WorkEmail WimixtrafficRateBehaviour 0
keylset WorkEmail Layer4to7SrcPort 21155
keylset WorkEmail Layer4to7DestPort 31155
keylset WorkEmail Layer3qosenable 1
keylset WorkEmail Layer3qosdscp 0
keylset WorkEmail BurstdataburstDur 5
keylset WorkEmail BurstdataburstRate 100
keylset WorkEmail Burstdataibg 5
keylset WorkEmail Layer2qosenable 1
keylset WorkEmail Layer2qossurBand 100
keylset WorkEmail Layer2qosminPhyRate 3
keylset WorkEmail Layer2qoswlanUp 0
keylset WorkEmail Layer2qosmDataRate 10240
keylset WorkEmail Layer2qosethUp 0
keylset WorkEmail Layer2qostclasIe 0
keylset WorkEmail Layer2qosmsduSize 128
keylset WorkEmail Layer2qosadControl 0
keylset WorkEmail Layer2qosflDir 1
keylset WorkEmail Layer2qostid 0
keylset WorkEmail Layer2qostclasUp 0
keylset WorkEmail Layer2qosclassifier None
keylset WorkEmail SlaperLoad 50


#Server Profiles


keylset MediaServer WimixservermacAddress 00:00:02:00:00:02
keylset MediaServer WimixserverserverType 0
keylset MediaServer WimixserverEnableIpv6 0
keylset MediaServer WimixserverethPort $Card_Eth
keylset MediaServer WimixserveripMode 0
keylset MediaServer Wimixservernetmask 255.255.0.0
keylset MediaServer WimixservermacMode 1
keylset MediaServer WimixserveragentServer None
keylset MediaServer WimixserveripV6Mode 0
keylset MediaServer WimixserveripAddress 192.168.1.201
keylset MediaServer Wimixservergateway 192.168.1.1
keylset MediaServer Vlanenable 0
keylset MediaServer Vlanid 0

keylset Internet WimixservermacAddress 00:00:02:00:00:03
keylset Internet WimixserverserverType 0
keylset Internet WimixserverEnableIpv6 0
keylset Internet WimixserverethPort $Card_Eth
keylset Internet WimixserveripMode 0
keylset Internet Wimixservernetmask 255.255.0.0
keylset Internet WimixservermacMode 1
keylset Internet WimixserveragentServer None
keylset Internet WimixserveripV6Mode 0
keylset Internet WimixserveripAddress 192.168.1.202
keylset Internet Wimixservergateway 192.168.1.1
keylset Internet Vlanenable 0
keylset Internet Vlanid 0


#Port list for port specific options
keylset global_config Ports {generic_dut_2 generic_dut_5 generic_dut_eth}

#Generic Dut Definitions

#Generic Dut - generic_dut_2
keylset generic_dut_2 used True
keylset generic_dut_2 Vendor generic
keylset generic_dut_2 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&$WLANSwitchFW
keylset generic_dut_2 APSWVersion AP\ SW\ Version:@|#^&$VENDORFW
keylset generic_dut_2 APModel AP\ Model:@|#^&$VENDORMODEL
keylset generic_dut_2 Interface.802_11n.BindStatus True
keylset generic_dut_2 Interface.802_11n.WavetestPort $Card_24
keylset generic_dut_2 Interface.802_11n.portChannelBandwidth -1
keylset generic_dut_2 Interface.802_11n.RxAttenuation False
keylset generic_dut_2 Interface.802_11n.ClientBackoff True
keylset generic_dut_2 Interface.802_11n.InterfaceType 802.11n
keylset generic_dut_2 Interface.802_11n.secChannel 0
keylset generic_dut_2 Interface.802_11n.CaptureMode normal
keylset generic_dut_2 Interface.802_11n.Channel 6
keylset generic_dut_2 Interface.802_11n.EnableFollowApBandwidth 1
keylset generic_dut_2 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$WLANSwitchModel

#Generic Dut - generic_dut_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor generic
keylset generic_dut_5 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|#^&$WLANSwitchFW
keylset generic_dut_5 APSWVersion AP\ SW\ Version:@|#^&$VENDORFW
keylset generic_dut_5 APModel AP\ Model:@|#^&$VENDORMODEL
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 Interface.802_11ac.RxAttenuation False
keylset generic_dut_5 Interface.802_11ac.ClientBackoff True
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.secChannel 0
keylset generic_dut_2 Interface.802_11n.CaptureMode normal
keylset generic_dut_5 Interface.802_11ac.Channel 149
keylset generic_dut_5 WLANSwitchModel WLAN\ Switch\ Model:@|#^&$WLANSwitchModel
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1

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
#Auto-generated from: MCD
#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

