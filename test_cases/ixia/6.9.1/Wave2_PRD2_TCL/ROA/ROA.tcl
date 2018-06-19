
#Auto-generated from: /mnt/wifi_vol/Testing_Area/Automation/Script_Development/ATF/Reuse of Airtime/Case A/20171113-091101/test_wimix_script.wml
#At: 2018-02-06 14:13:48.436641
keylset global_config ChassisName {$chassis_ip}

#License Keys for running tests beyond the basic benchmarking tests

#keylset global_config LicenseKey {#####-#####-##### #####-#####-#####}
# keylset global_config Source {11g}
# keylset global_config Destination {11n_2_20_M15 11n_2_20_M23}

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

#LogsAndResultsInfo Global Options
set Card_24 $card_24_ip
set Card_5 $card_5_ip
set Card_Eth $card_eth_ip
set SSID_24 $ssid_24
set SSID_5 $ssid_5
set VENDORNAME $vendor_name
set VENDORMODEL $vendor_model
set VENDORFW $vendor_firmware
set Channel24 6
set Channel5 149
set Num24Antennas $num_24_antennas
set Num5Antennas $num_5_antennas
keylset global_config LogsDir $logs_dir

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

keylset global_config CustomTitle None
keylset global_config dbserverip 127.0.0.1

#L4to7Connection Global Options

keylset global_config ConnectionRate 20
keylset global_config NumL4to7Fails 20

#TestParameters Global Options

keylset global_config TrialDuration 60
keylset global_config wimixResultSampleVal 1
keylset global_config wimixResultSampleOption 1
keylset global_config SettleTime 1
keylset global_config ReconnectClients 1
keylset global_config LossTolerance 0
keylset global_config RandomSeed 1186422843
keylset global_config overTimeGraphs 1
keylset global_config TestDurationMin 1

#Tests - you may define more than one in a TCL list.
keylset global_config TestList ${test_list}

#Client mode, 0 = Auto (ssid), 1 = Manual (BSSID)
keylset global_config ClientMode 1

#Test List Starts here

# wimix_script
# keylset wimix_script ClientMix.11g_24_20.delay 0
# keylset wimix_script ClientMix.11g_24_20.endTime 30
# keylset wimix_script ClientMix.11g_24_20.Percentage 20.0
# keylset wimix_script ClientMix.11g_24_20.TrafficType {11g}
# keylset wimix_script ClientMix.11n_24_20_M15.delay 0
# keylset wimix_script ClientMix.11n_24_20_M15.endTime END
# keylset wimix_script ClientMix.11n_24_20_M15.Percentage 20.0
# keylset wimix_script ClientMix.11n_24_20_M15.TrafficType {11n_M15}
# keylset wimix_script ClientMix.11n_24_20_M23.delay 0
# keylset wimix_script ClientMix.11n_24_20_M23.endTime END
# keylset wimix_script ClientMix.11n_24_20_M23.Percentage 20.0
# keylset wimix_script ClientMix.11n_24_20_M23.TrafficType {11n_M23}
keylset wimix_script contAdminControlFlag 1
keylset wimix_script continueFlag 0
keylset wimix_script loadMode 0
keylset wimix_script loadSweepEnd 20
keylset wimix_script loadSweepStart 10
keylset wimix_script loadSweepStep 1
keylset wimix_script loadVal 10
keylset wimix_script staggerStart 0
keylset wimix_script staggerStartInt 1
keylset wimix_script Test wimix_script
keylset wimix_script testProfile MixedClients
keylset wimix_script testProfileImage images/wimix_new.png
keylset wimix_script totalClientPer 60.0
keylset wimix_script totalLoadPer 60.0
keylset wimix_script wimixMode Client
keylset wimix_script wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

# ROA_24_20_DROP_11g_24_20
set ROA_24_20_DROP_11g_24_20 ${wimix_script}
keylset ROA_24_20_DROP_11g_24_20 Source {11n_24_20_M23}
keylset ROA_24_20_DROP_11g_24_20 Destination {11n_24_20_M15 11g_24_20}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.delay 0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.endTime 30
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.Percentage 20.0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11g_24_20.TrafficType {11g}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.delay 0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.endTime END
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.Percentage 20.0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M15.TrafficType {11n_M15}
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.delay 0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.endTime END
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.Percentage 20.0
keylset ROA_24_20_DROP_11g_24_20 ClientMix.11n_24_20_M23.TrafficType {11n_M23}
# keylset ROA_24_20_DROP_11g_24_20 contAdminControlFlag 1
# keylset ROA_24_20_DROP_11g_24_20 continueFlag 0
# keylset ROA_24_20_DROP_11g_24_20 loadMode 0
# keylset ROA_24_20_DROP_11g_24_20 loadSweepEnd 20
# keylset ROA_24_20_DROP_11g_24_20 loadSweepStart 10
# keylset ROA_24_20_DROP_11g_24_20 loadSweepStep 1
# keylset ROA_24_20_DROP_11g_24_20 loadVal 10
# keylset ROA_24_20_DROP_11g_24_20 staggerStart 0
# keylset ROA_24_20_DROP_11g_24_20 staggerStartInt 1
# keylset ROA_24_20_DROP_11g_24_20 Test wimix_script
# keylset ROA_24_20_DROP_11g_24_20 testProfile MixedClients
# keylset ROA_24_20_DROP_11g_24_20 testProfileImage images/wimix_new.png
# keylset ROA_24_20_DROP_11g_24_20 totalClientPer 60.0
# keylset ROA_24_20_DROP_11g_24_20 totalLoadPer 60.0
# keylset ROA_24_20_DROP_11g_24_20 wimixMode Client
# keylset ROA_24_20_DROP_11g_24_20 wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

# ROA_24_20_DROP_11n_24_20_M15
set ROA_24_20_DROP_11n_24_20_M15 ${wimix_script}
keylset ROA_24_20_DROP_11n_24_20_M15 Source {11n_24_20_M23}
keylset ROA_24_20_DROP_11n_24_20_M15 Destination {11n_24_20_M15 11g_24_20}
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11g_24_20.delay 0
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11g_24_20.endTime END
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11g_24_20.Percentage 20.0
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11g_24_20.TrafficType {11g}
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M15.delay 0
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M15.endTime 30
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M15.Percentage 20.0
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M15.TrafficType {11n_M15}
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M23.delay 0
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M23.endTime END
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M23.Percentage 20.0
keylset ROA_24_20_DROP_11n_24_20_M15 ClientMix.11n_24_20_M23.TrafficType {11n_M23}
# keylset ROA_24_20_DROP_11n_24_20_M15 contAdminControlFlag 1
# keylset ROA_24_20_DROP_11n_24_20_M15 continueFlag 0
# keylset ROA_24_20_DROP_11n_24_20_M15 loadMode 0
# keylset ROA_24_20_DROP_11n_24_20_M15 loadSweepEnd 20
# keylset ROA_24_20_DROP_11n_24_20_M15 loadSweepStart 10
# keylset ROA_24_20_DROP_11n_24_20_M15 loadSweepStep 1
# keylset ROA_24_20_DROP_11n_24_20_M15 loadVal 10
# keylset ROA_24_20_DROP_11n_24_20_M15 staggerStart 0
# keylset ROA_24_20_DROP_11n_24_20_M15 staggerStartInt 1
# keylset ROA_24_20_DROP_11n_24_20_M15 Test wimix_script
# keylset ROA_24_20_DROP_11n_24_20_M15 testProfile MixedClients
# keylset ROA_24_20_DROP_11n_24_20_M15 testProfileImage images/wimix_new.png
# keylset ROA_24_20_DROP_11n_24_20_M15 totalClientPer 60.0
# keylset ROA_24_20_DROP_11n_24_20_M15 totalLoadPer 60.0
# keylset ROA_24_20_DROP_11n_24_20_M15 wimixMode Client
# keylset ROA_24_20_DROP_11n_24_20_M15 wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

# ROA_24_20_DROP_11n_24_20_M23
set ROA_24_20_DROP_11n_24_20_M23 ${wimix_script}
keylset ROA_24_20_DROP_11n_24_20_M23 Source {11n_24_20_M23}
keylset ROA_24_20_DROP_11n_24_20_M23 Destination {11n_24_20_M15 11g_24_20}
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11g_24_20.delay 0
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11g_24_20.endTime END
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11g_24_20.Percentage 20.0
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11g_24_20.TrafficType {11g}
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M15.delay 0
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M15.endTime END
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M15.Percentage 20.0
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M15.TrafficType {11n_M15}
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M23.delay 0
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M23.endTime 30
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M23.Percentage 20.0
keylset ROA_24_20_DROP_11n_24_20_M23 ClientMix.11n_24_20_M23.TrafficType {11n_M23}
# keylset ROA_24_20_DROP_11n_24_20_M23 contAdminControlFlag 1
# keylset ROA_24_20_DROP_11n_24_20_M23 continueFlag 0
# keylset ROA_24_20_DROP_11n_24_20_M23 loadMode 0
# keylset ROA_24_20_DROP_11n_24_20_M23 loadSweepEnd 20
# keylset ROA_24_20_DROP_11n_24_20_M23 loadSweepStart 10
# keylset ROA_24_20_DROP_11n_24_20_M23 loadSweepStep 1
# keylset ROA_24_20_DROP_11n_24_20_M23 loadVal 10
# keylset ROA_24_20_DROP_11n_24_20_M23 staggerStart 0
# keylset ROA_24_20_DROP_11n_24_20_M23 staggerStartInt 1
# keylset ROA_24_20_DROP_11n_24_20_M23 Test wimix_script
# keylset ROA_24_20_DROP_11n_24_20_M23 testProfile MixedClients
# keylset ROA_24_20_DROP_11n_24_20_M23 testProfileImage images/wimix_new.png
# keylset ROA_24_20_DROP_11n_24_20_M23 totalClientPer 60.0
# keylset ROA_24_20_DROP_11n_24_20_M23 totalLoadPer 60.0
# keylset ROA_24_20_DROP_11n_24_20_M23 wimixMode Client
# keylset ROA_24_20_DROP_11n_24_20_M23 wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

# ROA_5_80_DROP_11a_5_20
set ROA_5_80_DROP_11a_5_20 ${wimix_script}
keylset ROA_5_80_DROP_11a_5_20 Source {11a_5_20}
keylset ROA_5_80_DROP_11a_5_20 Destination {11n_5_40_M23 11ac_5_80_S3}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.delay 0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.endTime 30
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.Percentage 20.0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11a_5_20.TrafficType {11a}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.delay 0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.endTime END
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.Percentage 20.0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11ac_5_80_S3.TrafficType {11ac_5_80}
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.delay 0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.endTime END
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.Percentage 20.0
keylset ROA_5_80_DROP_11a_5_20 ClientMix.11n_5_40_M23.TrafficType {11n_5_40}
# keylset ROA_5_80_DROP_11a_5_20 contAdminControlFlag 1
# keylset ROA_5_80_DROP_11a_5_20 continueFlag 0
# keylset ROA_5_80_DROP_11a_5_20 loadMode 0
# keylset ROA_5_80_DROP_11a_5_20 loadSweepEnd 20
# keylset ROA_5_80_DROP_11a_5_20 loadSweepStart 10
# keylset ROA_5_80_DROP_11a_5_20 loadSweepStep 1
# keylset ROA_5_80_DROP_11a_5_20 loadVal 10
# keylset ROA_5_80_DROP_11a_5_20 staggerStart 0
# keylset ROA_5_80_DROP_11a_5_20 staggerStartInt 1
# keylset ROA_5_80_DROP_11a_5_20 Test wimix_script
# keylset ROA_5_80_DROP_11a_5_20 testProfile MixedClients
# keylset ROA_5_80_DROP_11a_5_20 testProfileImage images/wimix_new.png
# keylset ROA_5_80_DROP_11a_5_20 totalClientPer 60.0
# keylset ROA_5_80_DROP_11a_5_20 totalLoadPer 60.0
# keylset ROA_5_80_DROP_11a_5_20 wimixMode Client
# keylset ROA_5_80_DROP_11a_5_20 wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

# ROA_5_80_DROP_11ac_5_80_S3
set ROA_5_80_DROP_11ac_5_80_S3 ${wimix_script}
keylset ROA_5_80_DROP_11ac_5_80_S3 Source {11a_5_20}
keylset ROA_5_80_DROP_11ac_5_80_S3 Destination {11n_5_40_M23 11ac_5_80_S3}
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11a_5_20.delay 0
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11a_5_20.endTime END
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11a_5_20.Percentage 20.0
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11a_5_20.TrafficType {11a}
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11ac_5_80_S3.delay 0
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11ac_5_80_S3.endTime 30
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11ac_5_80_S3.Percentage 20.0
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11ac_5_80_S3.TrafficType {11ac_5_80}
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11n_5_40_M23.delay 0
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11n_5_40_M23.endTime END
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11n_5_40_M23.Percentage 20.0
keylset ROA_5_80_DROP_11ac_5_80_S3 ClientMix.11n_5_40_M23.TrafficType {11n_5_40}
# keylset ROA_5_80_DROP_11ac_5_80_S3 contAdminControlFlag 1
# keylset ROA_5_80_DROP_11ac_5_80_S3 continueFlag 0
# keylset ROA_5_80_DROP_11ac_5_80_S3 loadMode 0
# keylset ROA_5_80_DROP_11ac_5_80_S3 loadSweepEnd 20
# keylset ROA_5_80_DROP_11ac_5_80_S3 loadSweepStart 10
# keylset ROA_5_80_DROP_11ac_5_80_S3 loadSweepStep 1
# keylset ROA_5_80_DROP_11ac_5_80_S3 loadVal 10
# keylset ROA_5_80_DROP_11ac_5_80_S3 staggerStart 0
# keylset ROA_5_80_DROP_11ac_5_80_S3 staggerStartInt 1
# keylset ROA_5_80_DROP_11ac_5_80_S3 Test wimix_script
# keylset ROA_5_80_DROP_11ac_5_80_S3 testProfile MixedClients
# keylset ROA_5_80_DROP_11ac_5_80_S3 testProfileImage images/wimix_new.png
# keylset ROA_5_80_DROP_11ac_5_80_S3 totalClientPer 60.0
# keylset ROA_5_80_DROP_11ac_5_80_S3 totalLoadPer 60.0
# keylset ROA_5_80_DROP_11ac_5_80_S3 wimixMode Client
# keylset ROA_5_80_DROP_11ac_5_80_S3 wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

# ROA_5_80_DROP_11n_5_40_M23
set ROA_5_80_DROP_11n_5_40_M23 ${wimix_script}
keylset ROA_5_80_DROP_11n_5_40_M23 Source {11a_5_20}
keylset ROA_5_80_DROP_11n_5_40_M23 Destination {11n_5_40_M23 11ac_5_80_S3}
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11a_5_20.delay 0
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11a_5_20.endTime END
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11a_5_20.Percentage 20.0
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11a_5_20.TrafficType {11a}
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11ac_5_80_S3.delay 0
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11ac_5_80_S3.endTime END
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11ac_5_80_S3.Percentage 20.0
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11ac_5_80_S3.TrafficType {11ac_5_80}
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11n_5_40_M23.delay 0
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11n_5_40_M23.endTime 30
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11n_5_40_M23.Percentage 20.0
keylset ROA_5_80_DROP_11n_5_40_M23 ClientMix.11n_5_40_M23.TrafficType {11n_5_40}
# keylset ROA_5_80_DROP_11n_5_40_M23 contAdminControlFlag 1
# keylset ROA_5_80_DROP_11n_5_40_M23 continueFlag 0
# keylset ROA_5_80_DROP_11n_5_40_M23 loadMode 0
# keylset ROA_5_80_DROP_11n_5_40_M23 loadSweepEnd 20
# keylset ROA_5_80_DROP_11n_5_40_M23 loadSweepStart 10
# keylset ROA_5_80_DROP_11n_5_40_M23 loadSweepStep 1
# keylset ROA_5_80_DROP_11n_5_40_M23 loadVal 10
# keylset ROA_5_80_DROP_11n_5_40_M23 staggerStart 0
# keylset ROA_5_80_DROP_11n_5_40_M23 staggerStartInt 1
# keylset ROA_5_80_DROP_11n_5_40_M23 Test wimix_script
# keylset ROA_5_80_DROP_11n_5_40_M23 testProfile MixedClients
# keylset ROA_5_80_DROP_11n_5_40_M23 testProfileImage images/wimix_new.png
# keylset ROA_5_80_DROP_11n_5_40_M23 totalClientPer 60.0
# keylset ROA_5_80_DROP_11n_5_40_M23 totalLoadPer 60.0
# keylset ROA_5_80_DROP_11n_5_40_M23 wimixMode Client
# keylset ROA_5_80_DROP_11n_5_40_M23 wimixTestName 802.11b/g/n/ac\ Mixed\ Clients

#Test List ends here

#Traffic Profiles

# 11g
keylset 11g BurstdataburstDur 5
keylset 11g BurstdataburstRate 100
keylset 11g Burstdataibg 5
keylset 11g Layer2qosadControl 0
keylset 11g Layer2qosclassifier None
keylset 11g Layer2qosenable 0
keylset 11g Layer2qosethUp 0
keylset 11g Layer2qosflDir 1
keylset 11g Layer2qosmDataRate 10240
keylset 11g Layer2qosminPhyRate 1
keylset 11g Layer2qosmsduSize 128
keylset 11g Layer2qossurBand 100
keylset 11g Layer2qostclasIe 0
keylset 11g Layer2qostclasUp 0
keylset 11g Layer2qostid 0
keylset 11g Layer2qoswlanUp 0
keylset 11g Layer3qosdscp 0
keylset 11g Layer3qosenable 0
keylset 11g Layer4to7DestPort 34158
keylset 11g Layer4to7SrcPort 24158
keylset 11g MulticastaddripAddress 224.1.1.1
keylset 11g MulticastaddripMode 1
keylset 11g MulticastaddripV6Address ff00::01
keylset 11g MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11g MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11g MulticastaddrsrcIpMode 1
keylset 11g SlaJitter 500
keylset 11g SlaLatency 10000
keylset 11g SlaPacketLoss 10
keylset 11g WimixtrafficDirection downlink
keylset 11g WimixtrafficEnableIpv6 0
keylset 11g WimixtrafficFramesize 1500
keylset 11g WimixtrafficIntendedrate 10000
keylset 11g WimixtrafficipProtocolNum Auto
keylset 11g WimixtrafficNumFrames 100000000
keylset 11g WimixtrafficpayData None
keylset 11g WimixtrafficpayPattern 0
keylset 11g WimixtrafficPhyrate 54
keylset 11g WimixtrafficRateBehaviour 0
keylset 11g WimixtrafficRateMode 0
keylset 11g WimixtrafficServer server1
keylset 11g WimixtrafficStreamType 0
keylset 11g WimixtraffictcpWinSize 65535
keylset 11g WimixtrafficTtl 64
keylset 11g WimixtrafficType UDP

# 11g_24_20
keylset 11g_24_20 BaseIp 192.168.1.10
# keylset 11g_24_20 Bssid 08:6a:0a:d2:fa:7d
keylset 11g_24_20 Dhcp Enable
keylset 11g_24_20 DistId 3
keylset 11g_24_20 Dut generic_dut_24
keylset 11g_24_20 EnableIpv6 0
keylset 11g_24_20 Gateway 192.168.1.1
keylset 11g_24_20 GratuitousArp True
keylset 11g_24_20 GroupType 802.11ac
keylset 11g_24_20 Hops -1
keylset 11g_24_20 IncrIp Normal
keylset 11g_24_20 KeepAlive True
keylset 11g_24_20 ListenInt 10
keylset 11g_24_20 MacAddress None
keylset 11g_24_20 MacAddressIncr 1
keylset 11g_24_20 Method {WPA2-PSK}
keylset 11g_24_20 MgmtPhyRate 24
keylset 11g_24_20 NumTxAntennas $Num24Antennas
keylset 11g_24_20 phyInterface 802.11ag
keylset 11g_24_20 PskAscii charter123
keylset 11g_24_20 Qos Enable
keylset 11g_24_20 RateAdapt 0
keylset 11g_24_20 Ssid $SSID_24
keylset 11g_24_20 SubnetMask 255.255.0.0
keylset 11g_24_20 TransmitDeference 1
keylset 11g_24_20 UapsdSp 3
keylset 11g_24_20 Wlan80211eQoSAC 0

# 11n_24_20_M15
keylset 11n_24_20_M15 BaseIp 192.168.5.10
# keylset 11n_24_20_M15 Bssid 08:6a:0a:d2:fa:7d
keylset 11n_24_20_M15 ChannelBandwidth 20
keylset 11n_24_20_M15 ChannelModel Bypass
keylset 11n_24_20_M15 DataMcsIndex 15
keylset 11n_24_20_M15 Dhcp Enable
keylset 11n_24_20_M15 DistId 3
keylset 11n_24_20_M15 Dut generic_dut_24
keylset 11n_24_20_M15 EnableAMPDUaggregation 1
keylset 11n_24_20_M15 EnableAMSDUaggregation 0
keylset 11n_24_20_M15 EnableIpv6 0
keylset 11n_24_20_M15 EnableLDPC False
keylset 11n_24_20_M15 Gateway 192.168.1.1
keylset 11n_24_20_M15 GratuitousArp True
keylset 11n_24_20_M15 GroupType 802.11ac
keylset 11n_24_20_M15 GuardInterval standard
keylset 11n_24_20_M15 Hops 3
keylset 11n_24_20_M15 IncrIp Normal
keylset 11n_24_20_M15 KeepAlive True
keylset 11n_24_20_M15 ListenInt 10
keylset 11n_24_20_M15 MacAddress None
keylset 11n_24_20_M15 MacAddressIncr 1
keylset 11n_24_20_M15 Method {WPA2-PSK}
keylset 11n_24_20_M15 MgmtPhyRate 24
keylset 11n_24_20_M15 NumTxAntennas $Num24Antennas
keylset 11n_24_20_M15 phyInterface 802.11n
keylset 11n_24_20_M15 PlcpConfiguration mixed
keylset 11n_24_20_M15 PskAscii charter123
keylset 11n_24_20_M15 Qos Enable
keylset 11n_24_20_M15 RateAdapt 0
keylset 11n_24_20_M15 Ssid $SSID_24
keylset 11n_24_20_M15 SubnetMask 255.255.0.0
keylset 11n_24_20_M15 TransmitDeference 1
keylset 11n_24_20_M15 UapsdSp 3
keylset 11n_24_20_M15 Wlan80211eQoSAC 0

# 11n_24_20_M23
keylset 11n_24_20_M23 BaseIp 192.168.7.10
# keylset 11n_24_20_M23 Bssid 08:6a:0a:d2:fa:7d
keylset 11n_24_20_M23 ChannelBandwidth 20
keylset 11n_24_20_M23 ChannelModel Bypass
keylset 11n_24_20_M23 DataMcsIndex 23
keylset 11n_24_20_M23 Dhcp Enable
keylset 11n_24_20_M23 DistId 3
keylset 11n_24_20_M23 Dut generic_dut_24
keylset 11n_24_20_M23 EnableAMPDUaggregation 1
keylset 11n_24_20_M23 EnableAMSDUaggregation 0
keylset 11n_24_20_M23 EnableIpv6 0
keylset 11n_24_20_M23 EnableLDPC False
keylset 11n_24_20_M23 Gateway 192.168.1.1
keylset 11n_24_20_M23 GratuitousArp True
keylset 11n_24_20_M23 GroupType 802.11ac
keylset 11n_24_20_M23 GuardInterval standard
keylset 11n_24_20_M23 Hops 5
keylset 11n_24_20_M23 IncrIp Normal
keylset 11n_24_20_M23 KeepAlive True
keylset 11n_24_20_M23 ListenInt 10
keylset 11n_24_20_M23 MacAddress None
keylset 11n_24_20_M23 MacAddressIncr 1
keylset 11n_24_20_M23 Method {WPA2-PSK}
keylset 11n_24_20_M23 MgmtPhyRate 24
keylset 11n_24_20_M23 MimoId 2
keylset 11n_24_20_M23 NumTxAntennas $Num24Antennas
keylset 11n_24_20_M23 phyInterface 802.11n
keylset 11n_24_20_M23 PlcpConfiguration mixed
keylset 11n_24_20_M23 PskAscii charter123
keylset 11n_24_20_M23 Qos Enable
keylset 11n_24_20_M23 RateAdapt 0
keylset 11n_24_20_M23 Ssid $SSID_24
keylset 11n_24_20_M23 SubnetMask 255.255.0.0
keylset 11n_24_20_M23 TransmitDeference 1
keylset 11n_24_20_M23 UapsdSp 3
keylset 11n_24_20_M23 Wlan80211eQoSAC 0

# 11n_M15
keylset 11n_M15 BurstdataburstDur 5
keylset 11n_M15 BurstdataburstRate 100
keylset 11n_M15 Burstdataibg 5
keylset 11n_M15 Layer2qosadControl 0
keylset 11n_M15 Layer2qosclassifier None
keylset 11n_M15 Layer2qosenable 0
keylset 11n_M15 Layer2qosethUp 0
keylset 11n_M15 Layer2qosflDir 1
keylset 11n_M15 Layer2qosmDataRate 10240
keylset 11n_M15 Layer2qosminPhyRate 1
keylset 11n_M15 Layer2qosmsduSize 128
keylset 11n_M15 Layer2qossurBand 100
keylset 11n_M15 Layer2qostclasIe 0
keylset 11n_M15 Layer2qostclasUp 0
keylset 11n_M15 Layer2qostid 0
keylset 11n_M15 Layer2qoswlanUp 0
keylset 11n_M15 Layer3qosdscp 0
keylset 11n_M15 Layer3qosenable 0
keylset 11n_M15 Layer4to7DestPort 33868
keylset 11n_M15 Layer4to7SrcPort 23868
keylset 11n_M15 MulticastaddripAddress 224.1.1.1
keylset 11n_M15 MulticastaddripMode 1
keylset 11n_M15 MulticastaddripV6Address ff00::01
keylset 11n_M15 MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11n_M15 MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11n_M15 MulticastaddrsrcIpMode 1
keylset 11n_M15 SlaJitter 500
keylset 11n_M15 SlaLatency 10000
keylset 11n_M15 SlaPacketLoss 10
keylset 11n_M15 WimixtrafficDirection downlink
keylset 11n_M15 WimixtrafficEnableIpv6 0
keylset 11n_M15 WimixtrafficFramesize 1500
keylset 11n_M15 WimixtrafficIntendedrate 30000
keylset 11n_M15 WimixtrafficipProtocolNum Auto
keylset 11n_M15 WimixtrafficNumFrames 100000000
keylset 11n_M15 WimixtrafficpayData None
keylset 11n_M15 WimixtrafficpayPattern 0
keylset 11n_M15 WimixtrafficPhyrate 54
keylset 11n_M15 WimixtrafficRateBehaviour 0
keylset 11n_M15 WimixtrafficRateMode 0
keylset 11n_M15 WimixtrafficServer server1
keylset 11n_M15 WimixtrafficStreamType 0
keylset 11n_M15 WimixtraffictcpWinSize 65535
keylset 11n_M15 WimixtrafficTtl 64
keylset 11n_M15 WimixtrafficType UDP

# 11n_M23
keylset 11n_M23 BurstdataburstDur 5
keylset 11n_M23 BurstdataburstRate 100
keylset 11n_M23 Burstdataibg 5
keylset 11n_M23 Layer2qosadControl 0
keylset 11n_M23 Layer2qosclassifier None
keylset 11n_M23 Layer2qosenable 0
keylset 11n_M23 Layer2qosethUp 0
keylset 11n_M23 Layer2qosflDir 1
keylset 11n_M23 Layer2qosmDataRate 10240
keylset 11n_M23 Layer2qosminPhyRate 1
keylset 11n_M23 Layer2qosmsduSize 128
keylset 11n_M23 Layer2qossurBand 100
keylset 11n_M23 Layer2qostclasIe 0
keylset 11n_M23 Layer2qostclasUp 0
keylset 11n_M23 Layer2qostid 0
keylset 11n_M23 Layer2qoswlanUp 0
keylset 11n_M23 Layer3qosdscp 0
keylset 11n_M23 Layer3qosenable 0
keylset 11n_M23 Layer4to7DestPort 33153
keylset 11n_M23 Layer4to7SrcPort 23153
keylset 11n_M23 MulticastaddripAddress 224.1.1.1
keylset 11n_M23 MulticastaddripMode 1
keylset 11n_M23 MulticastaddripV6Address ff00::01
keylset 11n_M23 MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11n_M23 MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11n_M23 MulticastaddrsrcIpMode 1
keylset 11n_M23 SlaJitter 500
keylset 11n_M23 SlaLatency 10000
keylset 11n_M23 SlaPacketLoss 10
keylset 11n_M23 WimixtrafficDirection downlink
keylset 11n_M23 WimixtrafficEnableIpv6 0
keylset 11n_M23 WimixtrafficFramesize 1500
keylset 11n_M23 WimixtrafficIntendedrate 40000
keylset 11n_M23 WimixtrafficipProtocolNum Auto
keylset 11n_M23 WimixtrafficNumFrames 100000000
keylset 11n_M23 WimixtrafficpayData None
keylset 11n_M23 WimixtrafficpayPattern 0
keylset 11n_M23 WimixtrafficPhyrate 54
keylset 11n_M23 WimixtrafficRateBehaviour 0
keylset 11n_M23 WimixtrafficRateMode 0
keylset 11n_M23 WimixtrafficServer server1
keylset 11n_M23 WimixtrafficStreamType 0
keylset 11n_M23 WimixtraffictcpWinSize 65535
keylset 11n_M23 WimixtrafficTtl 64
keylset 11n_M23 WimixtrafficType UDP

# 11a
keylset 11a BurstdataburstDur 5
keylset 11a BurstdataburstRate 100
keylset 11a Burstdataibg 5
keylset 11a Layer2qosadControl 0
keylset 11a Layer2qosclassifier None
keylset 11a Layer2qosenable 0
keylset 11a Layer2qosethUp 0
keylset 11a Layer2qosflDir 1
keylset 11a Layer2qosmDataRate 10240
keylset 11a Layer2qosminPhyRate 1
keylset 11a Layer2qosmsduSize 128
keylset 11a Layer2qossurBand 100
keylset 11a Layer2qostclasIe 0
keylset 11a Layer2qostclasUp 0
keylset 11a Layer2qostid 0
keylset 11a Layer2qoswlanUp 0
keylset 11a Layer3qosdscp 0
keylset 11a Layer3qosenable 0
keylset 11a Layer4to7DestPort 34158
keylset 11a Layer4to7SrcPort 24158
keylset 11a MulticastaddripAddress 224.1.1.1
keylset 11a MulticastaddripMode 1
keylset 11a MulticastaddripV6Address ff00::01
keylset 11a MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11a MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11a MulticastaddrsrcIpMode 1
keylset 11a SlaJitter 500
keylset 11a SlaLatency 10000
keylset 11a SlaPacketLoss 10
keylset 11a WimixtrafficDirection downlink
keylset 11a WimixtrafficEnableIpv6 0
keylset 11a WimixtrafficFramesize 1500
keylset 11a WimixtrafficIntendedrate 10000
keylset 11a WimixtrafficipProtocolNum Auto
keylset 11a WimixtrafficNumFrames 100000000
keylset 11a WimixtrafficpayData None
keylset 11a WimixtrafficpayPattern 0
keylset 11a WimixtrafficPhyrate 54
keylset 11a WimixtrafficRateBehaviour 0
keylset 11a WimixtrafficRateMode 0
keylset 11a WimixtrafficServer server1
keylset 11a WimixtrafficStreamType 0
keylset 11a WimixtraffictcpWinSize 65535
keylset 11a WimixtrafficTtl 64
keylset 11a WimixtrafficType UDP

# 11a_5_20
keylset 11a_5_20 BaseIp 192.168.1.10
# keylset 11a_5_20 Bssid 08:6a:0a:d2:fa:7e
keylset 11a_5_20 Dhcp Enable
keylset 11a_5_20 DistId 3
keylset 11a_5_20 Dut generic_dut_5
keylset 11a_5_20 EnableIpv6 0
keylset 11a_5_20 Gateway 192.168.1.1
keylset 11a_5_20 GratuitousArp True
keylset 11a_5_20 GroupType 802.11ac
keylset 11a_5_20 Hops -1
keylset 11a_5_20 IncrIp Normal
keylset 11a_5_20 KeepAlive True
keylset 11a_5_20 ListenInt 10
keylset 11a_5_20 MacAddress None
keylset 11a_5_20 MacAddressIncr 1
keylset 11a_5_20 Method {WPA2-PSK}
keylset 11a_5_20 MgmtPhyRate 24
keylset 11a_5_20 NumTxAntennas $Num5Antennas
keylset 11a_5_20 phyInterface 802.11ag
keylset 11a_5_20 PskAscii charter123
keylset 11a_5_20 Qos Enable
keylset 11a_5_20 RateAdapt 0
keylset 11a_5_20 Ssid $SSID_5
keylset 11a_5_20 SubnetMask 255.255.0.0
keylset 11a_5_20 TransmitDeference 1
keylset 11a_5_20 UapsdSp 3
keylset 11a_5_20 Wlan80211eQoSAC 0

# 11ac_5_80
keylset 11ac_5_80 BurstdataburstDur 5
keylset 11ac_5_80 BurstdataburstRate 100
keylset 11ac_5_80 Burstdataibg 5
keylset 11ac_5_80 Layer2qosadControl 0
keylset 11ac_5_80 Layer2qosclassifier None
keylset 11ac_5_80 Layer2qosenable 0
keylset 11ac_5_80 Layer2qosethUp 0
keylset 11ac_5_80 Layer2qosflDir 1
keylset 11ac_5_80 Layer2qosmDataRate 10240
keylset 11ac_5_80 Layer2qosminPhyRate 1
keylset 11ac_5_80 Layer2qosmsduSize 128
keylset 11ac_5_80 Layer2qossurBand 100
keylset 11ac_5_80 Layer2qostclasIe 0
keylset 11ac_5_80 Layer2qostclasUp 0
keylset 11ac_5_80 Layer2qostid 0
keylset 11ac_5_80 Layer2qoswlanUp 0
keylset 11ac_5_80 Layer3qosdscp 0
keylset 11ac_5_80 Layer3qosenable 0
keylset 11ac_5_80 Layer4to7DestPort 33868
keylset 11ac_5_80 Layer4to7SrcPort 23868
keylset 11ac_5_80 MulticastaddripAddress 224.1.1.1
keylset 11ac_5_80 MulticastaddripMode 1
keylset 11ac_5_80 MulticastaddripV6Address ff00::01
keylset 11ac_5_80 MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11ac_5_80 MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11ac_5_80 MulticastaddrsrcIpMode 1
keylset 11ac_5_80 SlaJitter 500
keylset 11ac_5_80 SlaLatency 10000
keylset 11ac_5_80 SlaPacketLoss 10
keylset 11ac_5_80 WimixtrafficDirection downlink
keylset 11ac_5_80 WimixtrafficEnableIpv6 0
keylset 11ac_5_80 WimixtrafficFramesize 1500
keylset 11ac_5_80 WimixtrafficIntendedrate 200000
keylset 11ac_5_80 WimixtrafficipProtocolNum Auto
keylset 11ac_5_80 WimixtrafficNumFrames 100000000
keylset 11ac_5_80 WimixtrafficpayData None
keylset 11ac_5_80 WimixtrafficpayPattern 0
keylset 11ac_5_80 WimixtrafficPhyrate 54
keylset 11ac_5_80 WimixtrafficRateBehaviour 0
keylset 11ac_5_80 WimixtrafficRateMode 0
keylset 11ac_5_80 WimixtrafficServer server1
keylset 11ac_5_80 WimixtrafficStreamType 0
keylset 11ac_5_80 WimixtraffictcpWinSize 65535
keylset 11ac_5_80 WimixtrafficTtl 64
keylset 11ac_5_80 WimixtrafficType UDP

# 11ac_5_80_S3
keylset 11ac_5_80_S3 BaseIp 192.168.7.10
# keylset 11ac_5_80_S3 Bssid 08:6a:0a:d2:fa:7e
keylset 11ac_5_80_S3 ChannelModel Bypass
keylset 11ac_5_80_S3 Dhcp Enable
keylset 11ac_5_80_S3 DistId 3
keylset 11ac_5_80_S3 Dut generic_dut_5
keylset 11ac_5_80_S3 EnableAMPDUaggregation 1
keylset 11ac_5_80_S3 EnableAMSDUaggregation 0
keylset 11ac_5_80_S3 EnableIpv6 0
keylset 11ac_5_80_S3 EnableLDPC False
keylset 11ac_5_80_S3 EnableMuSuMimo False
keylset 11ac_5_80_S3 Gateway 192.168.1.1
keylset 11ac_5_80_S3 GratuitousArp True
keylset 11ac_5_80_S3 GroupType 802.11ac
keylset 11ac_5_80_S3 GuardInterval short
keylset 11ac_5_80_S3 Hops 5
keylset 11ac_5_80_S3 IncrIp Normal
keylset 11ac_5_80_S3 KeepAlive True
keylset 11ac_5_80_S3 ListenInt 10
keylset 11ac_5_80_S3 MacAddress None
keylset 11ac_5_80_S3 MacAddressIncr 1
keylset 11ac_5_80_S3 Method {WPA2-PSK}
keylset 11ac_5_80_S3 MgmtPhyRate 24
keylset 11ac_5_80_S3 MimoMode mu-mimo
keylset 11ac_5_80_S3 NumSpatialStreams 3
keylset 11ac_5_80_S3 NumTxAntennas $Num5Antennas
keylset 11ac_5_80_S3 phyInterface 802.11ac
keylset 11ac_5_80_S3 PlcpConfiguration vht_mixed
keylset 11ac_5_80_S3 PskAscii charter123
keylset 11ac_5_80_S3 Qos Enable
keylset 11ac_5_80_S3 RateAdapt 0
keylset 11ac_5_80_S3 SigBandwidth 80
keylset 11ac_5_80_S3 Ssid $SSID_5
keylset 11ac_5_80_S3 SubnetMask 255.255.0.0
keylset 11ac_5_80_S3 TransmitDeference 1
keylset 11ac_5_80_S3 UapsdSp 3
keylset 11ac_5_80_S3 USDataMcs 7
keylset 11ac_5_80_S3 USManagementMcs 11
keylset 11ac_5_80_S3 VhtDataMcs 7
keylset 11ac_5_80_S3 Wlan80211eQoSAC 0

# 11n_5_40
keylset 11n_5_40 BurstdataburstDur 5
keylset 11n_5_40 BurstdataburstRate 100
keylset 11n_5_40 Burstdataibg 5
keylset 11n_5_40 Layer2qosadControl 0
keylset 11n_5_40 Layer2qosclassifier None
keylset 11n_5_40 Layer2qosenable 0
keylset 11n_5_40 Layer2qosethUp 0
keylset 11n_5_40 Layer2qosflDir 1
keylset 11n_5_40 Layer2qosmDataRate 10240
keylset 11n_5_40 Layer2qosminPhyRate 1
keylset 11n_5_40 Layer2qosmsduSize 128
keylset 11n_5_40 Layer2qossurBand 100
keylset 11n_5_40 Layer2qostclasIe 0
keylset 11n_5_40 Layer2qostclasUp 0
keylset 11n_5_40 Layer2qostid 0
keylset 11n_5_40 Layer2qoswlanUp 0
keylset 11n_5_40 Layer3qosdscp 0
keylset 11n_5_40 Layer3qosenable 0
keylset 11n_5_40 Layer4to7DestPort 33153
keylset 11n_5_40 Layer4to7SrcPort 23153
keylset 11n_5_40 MulticastaddripAddress 224.1.1.1
keylset 11n_5_40 MulticastaddripMode 1
keylset 11n_5_40 MulticastaddripV6Address ff00::01
keylset 11n_5_40 MulticastaddrmacAddress 01:00:5e:01:01:01
keylset 11n_5_40 MulticastaddrmacV6Address 33:33:00:00:00:01
keylset 11n_5_40 MulticastaddrsrcIpMode 1
keylset 11n_5_40 SlaJitter 500
keylset 11n_5_40 SlaLatency 10000
keylset 11n_5_40 SlaPacketLoss 10
keylset 11n_5_40 WimixtrafficDirection downlink
keylset 11n_5_40 WimixtrafficEnableIpv6 0
keylset 11n_5_40 WimixtrafficFramesize 1500
keylset 11n_5_40 WimixtrafficIntendedrate 80000
keylset 11n_5_40 WimixtrafficipProtocolNum Auto
keylset 11n_5_40 WimixtrafficNumFrames 100000000
keylset 11n_5_40 WimixtrafficpayData None
keylset 11n_5_40 WimixtrafficpayPattern 0
keylset 11n_5_40 WimixtrafficPhyrate 54
keylset 11n_5_40 WimixtrafficRateBehaviour 0
keylset 11n_5_40 WimixtrafficRateMode 0
keylset 11n_5_40 WimixtrafficServer server1
keylset 11n_5_40 WimixtrafficStreamType 0
keylset 11n_5_40 WimixtraffictcpWinSize 65535
keylset 11n_5_40 WimixtrafficTtl 64
keylset 11n_5_40 WimixtrafficType UDP

# 11n_5_40_M23
keylset 11n_5_40_M23 BaseIp 192.168.5.10
# keylset 11n_5_40_M23 Bssid 08:6a:0a:d2:fa:7e
keylset 11n_5_40_M23 ChannelBandwidth 40
keylset 11n_5_40_M23 ChannelModel Bypass
keylset 11n_5_40_M23 DataMcsIndex 23
keylset 11n_5_40_M23 Dhcp Enable
keylset 11n_5_40_M23 DistId 3
keylset 11n_5_40_M23 Dut generic_dut_5
keylset 11n_5_40_M23 EnableAMPDUaggregation 1
keylset 11n_5_40_M23 EnableAMSDUaggregation 0
keylset 11n_5_40_M23 EnableIpv6 0
keylset 11n_5_40_M23 EnableLDPC False
keylset 11n_5_40_M23 Gateway 192.168.1.1
keylset 11n_5_40_M23 GratuitousArp True
keylset 11n_5_40_M23 GroupType 802.11ac
keylset 11n_5_40_M23 GuardInterval standard
keylset 11n_5_40_M23 Hops 3
keylset 11n_5_40_M23 IncrIp Normal
keylset 11n_5_40_M23 KeepAlive True
keylset 11n_5_40_M23 ListenInt 10
keylset 11n_5_40_M23 MacAddress None
keylset 11n_5_40_M23 MacAddressIncr 1
keylset 11n_5_40_M23 Method {WPA2-PSK}
keylset 11n_5_40_M23 MgmtPhyRate 24
keylset 11n_5_40_M23 MimoId 2
keylset 11n_5_40_M23 NumTxAntennas $Num5Antennas
keylset 11n_5_40_M23 phyInterface 802.11n
keylset 11n_5_40_M23 PlcpConfiguration mixed
keylset 11n_5_40_M23 PskAscii charter123
keylset 11n_5_40_M23 Qos Enable
keylset 11n_5_40_M23 RateAdapt 0
keylset 11n_5_40_M23 Ssid $SSID_5
keylset 11n_5_40_M23 SubnetMask 255.255.0.0
keylset 11n_5_40_M23 TransmitDeference 1
keylset 11n_5_40_M23 UapsdSp 3
keylset 11n_5_40_M23 Wlan80211eQoSAC 0

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
keylset global_config Ports {generic_dut_24 generic_dut_5}

#Generic Dut Definitions

# generic_dut_24
keylset generic_dut_24 APModel $VENDORMODEL
keylset generic_dut_24 APSWVersion $VENDORFW
keylset generic_dut_24 Interface.802_11ac.BindStatus True
keylset generic_dut_24 Interface.802_11ac.CaptureMode normal
keylset generic_dut_24 Interface.802_11ac.Channel $Channel24
keylset generic_dut_24 Interface.802_11ac.ClientBackoff False
keylset generic_dut_24 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_24 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_24 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_24 Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_24 Interface.802_11ac.portChannelBandwidth -1
keylset generic_dut_24 Interface.802_11ac.RxAttenuation False
keylset generic_dut_24 Interface.802_11ac.secChannel 0
keylset generic_dut_24 Interface.802_11ac.VkIndex 0
keylset generic_dut_24 Interface.802_11ac.WavetestPort $Card_24
keylset generic_dut_24 used True
keylset generic_dut_24 Vendor $VENDORNAME
keylset generic_dut_24 WLANSwitchModel WLAN\ Switch\ Model:@|
keylset generic_dut_24 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|

# generic_dut_5
keylset generic_dut_5 APModel $VENDORMODEL
keylset generic_dut_5 APSWVersion $VENDORFW
keylset generic_dut_5 Interface.802_11ac.BindStatus True
keylset generic_dut_5 Interface.802_11ac.CaptureMode normal
keylset generic_dut_5 Interface.802_11ac.Channel $Channel5
keylset generic_dut_5 Interface.802_11ac.ClientBackoff False
keylset generic_dut_5 Interface.802_11ac.EnableFollowApBandwidth 1
keylset generic_dut_5 Interface.802_11ac.IncludeRFLogging off
keylset generic_dut_5 Interface.802_11ac.InterfaceType 802.11ac
keylset generic_dut_5 Interface.802_11ac.PartCode 2A04400480000000
keylset generic_dut_5 Interface.802_11ac.portChannelBandwidth -1
keylset generic_dut_5 Interface.802_11ac.RxAttenuation False
keylset generic_dut_5 Interface.802_11ac.secChannel 0
keylset generic_dut_5 Interface.802_11ac.VkIndex 0
keylset generic_dut_5 Interface.802_11ac.WavetestPort $Card_5
keylset generic_dut_5 used True
keylset generic_dut_5 Vendor $VENDORNAME
keylset generic_dut_5 WLANSwitchModel WLAN\ Switch\ Model:@|
keylset generic_dut_5 WLANSwitchSWVersion WLAN\ Switch\ SW\ Version:@|


#Client Analysis Profiles

#Source a file looking for a license key definition
catch {source [file join $env(HOME) "vw_licenses.tcl"]}

