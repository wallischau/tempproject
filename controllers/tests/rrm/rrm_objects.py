import datetime

class APInfoObject(object):
    def __init__(self, mac_addr, device_obj):
        self.setChannelInfo(
            device_obj["wifiConfiguration"]["Band2G"]["currentChannel"]
        )
        self.setChannelInfo(
            device_obj["wifiConfiguration"]["Band5G"]["currentChannel"]
        )
        self.setDeviceInfo(mac_addr, device_obj)

    def __str__(self):
        return (
            '{:<30s} {}\n'.format('mac_address:', self.mac_address) +
            '{:<30s} {}\n'.format('fw_version:', self.fw_version) +
            '{:<30s} {}\n'.format('current_2_g_channel:', self.current_2_g_channel) +
            '{:<30s} {}\n'.format('current_5_g_channel:', self.current_5_g_channel) +
            '{:<30s} {}\n'.format('current_2_g_bandwidth:', self.current_2_g_bandwidth) +
            '{:<30s} {}\n'.format('current_5_g_bandwidth:', self.current_5_g_bandwidth) +
            '{:<30s} {}\n'.format('rrm_son_fw_version:', self.rrm_son_fw_version) +
            '{:<30s} {}\n'.format('serial_number:', self.serial_number) +
            '{:<30s} {}\n'.format('rrm_son_config_group:', self.rrm_son_config_group) +
            '{:<30s} {}\n'.format('current_2_g_ssid:', self.current_2_g_ssid) +
            '{:<30s} {}\n'.format('current_5_g_ssid:', self.current_5_g_ssid) +
            '{:<30s} {}\n'.format('wan_ip:', self.wan_ip) +
            '{:<30s} {}\n'.format('lan_ip:', self.lan_ip) +
            '{:<30s} {}\n'.format('last_bootup_time:', self.last_bootup_time) +
            '{:<30s} {}\n'.format('last_upload_timestamp:', self.last_upload_timestamp) +
            '{:<30s} {}\n'.format('ap_up_time:', self.ap_up_time) +
            '{:<30s} {}\n'.format('ap_wifi_server:', self.ap_wifi_server) +
            '{:<30s} {}\n'.format('ap_wan_ul:', self.ap_wan_ul) +
            '{:<30s} {}\n'.format('ap_wan_dl:', self.ap_wan_dl) +
            '{:<30s} {}\n'.format('ap_last_dns_error:', self.ap_last_dns_error) +
            '{:<30s} {}'.format('ap_real_time_pull_response:', self.ap_real_time_pull_response)
        )

    #TODO: Add an ssh thingy to check the radios arent disabled
    def setChannelInfo(self, channel_obj):
        if channel_obj["primary"] <= 14:
            #We have a 2G channel obj here
            self.current_2_g_channel = channel_obj["primary"]
            self.current_2_g_bandwidth = channel_obj["bandwidth"]
        else:
            self.current_5_g_channel = channel_obj["primary"]
            self.current_5_g_bandwidth = channel_obj["bandwidth"]
    def setDeviceInfo(self, mac_addr, device_obj):
        #Get the FW Ver
        self.fw_version = device_obj["cpeFirmwareVersion"]
        self.model_name = device_obj["modelName"]
        #RRMSON FW Ver
        self.rrm_son_fw_version = device_obj["softwareVersion"]
        self.serial_number = device_obj["serialNumber"]
        #Get the configuration groups
        self.rrm_son_config_group = list()
        for group in device_obj["configurationGroups"]:
            self.rrm_son_config_group.append(group)
        #Map the ssids
        self.current_2_g_ssid = device_obj["ssidMap"]["Band2G"]
        self.current_5_g_ssid = device_obj["ssidMap"]["Band5G"]
        #IP stuffs
        self.wan_ip = device_obj["wanIpAddress"]
        self.lan_ip = device_obj["lanIpAddress"]
        self.last_bootup_time = device_obj["lastBootupTime"]
        self.last_upload_timestamp = device_obj["lastUploadTimestamp"]
        self.ap_up_time = datetime.timedelta(
            seconds=abs(
                device_obj["lastBootupTime"] -
                device_obj["lastUploadTimestamp"]
            ).total_seconds()
        )
        self.ap_wifi_server = device_obj["lastServer"]
        self.ap_wan_ul = device_obj["monthlyBBUsageUsMbyte"]
        self.ap_wan_dl = device_obj["monthlyBBUsageDsMbyte"]
        if device_obj["lastDnsErrorTime"] != None:
            self.ap_last_dns_error = device_obj["lastDnsErrorTime"]
        else:
            self.ap_last_dns_error = "None"
        self.ap_real_time_pull_response = device_obj["lastPeRunDay"]
        self.mac_address = mac_addr

class DumpSlice(object):
    def __init__(self):
        self.timestamp = ''
        self.interfaces = list()
        self.last_cpu = 0
        #Adding this here for keeping track of the Assia results for this particular object
        self.ixia_results = None
    def __str__(self):
        toreturn =  "TimePeriod: {0}, Last CPU: {1}\n".format(self.timestamp, self.last_cpu)
        for interface in self.interfaces:
            toreturn += "\t{0}".format(interface)
        toreturn += "\t{0}".format(self.ixia_results)
        return toreturn

    def __repr__(self):
        toreturn =  "TimePeriod: {0}, Last CPU: {1}\n".format(self.timestamp, self.last_cpu)
        for interface in self.interfaces:
            toreturn += "\t{0}".format(interface)
        return toreturn

class IxiaObject(object):
    def __init__(self):
        #These are the fiels gotten from the log
        self.client_number = 0
        self.t_put = 0
        self.timestamp = ''
        self.log_path = ''
    def __str__(self):
        return "\t\tclient_number: {0}, t_put: {1}, timestamp: {2}".format(
                    self.client_number, self.t_put, self.timestamp)

class Interface(object):
    def __init__(self):
        self.interface_name = ''
        self.stations = list()
        self.rx_bytes = 0
        self.rx_packets = 0
        self.tx_bytes = 0
        self.tx_packets = 0
    def __str__(self):
        toreturn =  "Interface: {0}, rx_bytes: {1}, rx_packets: {2}, tx_bytes: {3}, tx_packets: {4}\n".format(
                    self.interface_name, self.rx_bytes, self.rx_packets, self.tx_bytes, self.tx_packets)
        for station in self.stations:
            toreturn +=  "{0}".format(station)
        return toreturn

class Station(object):
    def __init__(self):
        self.rssi = 0
        self.tx_packets = 0
        self.rx_packets = 0
        self.tx_bytes = 0
        self.rx_bytes = 0
        self.interface = ''
        self.mac = ''
    def __str__(self):
        return "\t\trssi: {0}, tx_packets: {1}, rx_packets: {2}, tx_bytes: {3}, rx_bytes: {4}, interface: {5}, mac: {6}\n".format(
                self.rssi, self.tx_packets, self.rx_packets, self.tx_bytes, self.rx_bytes, self.interface, self.mac)
