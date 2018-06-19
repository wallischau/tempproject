import os
import re
import json
import sys
import argparse
import platform
import time

if platform.system() == 'Windows':
    from ssh import SSHClient

ABORT_TEXT = 'ABORTED'

BITS_TO_MBPS = 1000 * 1000
KBPS_TO_MBPS = 1000

PCAP_FIELDS = [
    'ixveriwave.dbm_anta',
    'ixveriwave.dbm_antb',
    'ixveriwave.dbm_antc',
    'ixveriwave.dbm_antd',
    'wlan.da_resolved',
    'wlan.fc.ds',
    'wlan.fc.pwrmgt',
    'wlan_mgt.asel.capable',
    'wlan_mgt.extcap.b19',
    'wlan_mgt.extcap.b2',
    'wlan_mgt.extcap.b22',
    'wlan_mgt.fixed.capabilities.agility',
    'wlan_mgt.fixed.capabilities.apsd',
    'wlan_mgt.fixed.capabilities.cfpoll.ap',
    'wlan_mgt.fixed.capabilities.dsss_ofdm',
    'wlan_mgt.fixed.capabilities.ess',
    'wlan_mgt.fixed.capabilities.ibss',
    'wlan_mgt.fixed.capabilities.pbcc',
    'wlan_mgt.fixed.capabilities.preamble',
    'wlan_mgt.fixed.capabilities.privacy',
    'wlan_mgt.fixed.capabilities.spec_man',
    'wlan_mgt.ht.ampduparam.maxlength',
    'wlan_mgt.ht.capabilities.amsdu',
    'wlan_mgt.ht.capabilities.green',
    'wlan_mgt.ht.capabilities.ldpccoding',
    'wlan_mgt.ht.capabilities.rxstbc',
    'wlan_mgt.ht.capabilities.short20',
    'wlan_mgt.ht.capabilities.short40 ',
    'wlan_mgt.ht.capabilities.txstbc',
    'wlan_mgt.ht.capabilities.width',
    'wlan_mgt.ht.info.dualbeacon',
    'wlan_mgt.ht.info.lsigprotsupport',
    'wlan_mgt.ht.info.operatingmode',
    'wlan_mgt.ht.mcsset.rxbitmask.0to7',
    'wlan_mgt.ht.mcsset.rxbitmask.8to15',
    'wlan_mgt.ht.mcsset.rxbitmask.16to23',
    'wlan_mgt.ht.mcsset.rxbitmask.24to31',
    'wlan_mgt.rsn.version',
    'wlan_mgt.ssid',
    'wlan_mgt.supported_rates',
    'wlan_mgt.vht.capabilities.maxampdu',
    'wlan_mgt.vht.capabilities.mubeamformer',
    'wlan_mgt.vht.capabilities.rxldpc ',
    'wlan_mgt.vht.capabilities.rxstbc',
    'wlan_mgt.vht.capabilities.short160',
    'wlan_mgt.vht.capabilities.short80 ',
    'wlan_mgt.vht.capabilities.subeamformer',
    'wlan_mgt.vht.capabilities.supportedchanwidthset',
    'wlan_mgt.vht.capabilities.txstbc',
    'wlan_mgt.vht.mcsset.rxmcsmap.ss1',
    'wlan_mgt.vht.mcsset.rxmcsmap.ss2',
    'wlan_mgt.vht.mcsset.rxmcsmap.ss3',
    'wlan_mgt.vht.mcsset.rxmcsmap.ss4',
    'wlan_mgt.vht.tpe.pwr_constr_20',
    'wlan_mgt.vht.tpe.pwr_constr_40',
    'wlan_mgt.vht.tpe.pwr_constr_80',
    'wlan_radio.data_rate',
    'wlan_radio.signal_dbm',
    'wlan.sa_resolved'
]

def convert(data):
    
    try:
        return int(data)
    except:
        try:
            return float(data)
        except:
            if data and re.match(r'0x', data):
                return int(data, 16)
            return data
    
def normalize(data):
        
    for key in data.keys():
        v = data[key]
        if isinstance(v, list) and len(v) == 1:
            data[key] = convert(v[0])
        
    return data

ssh_cache = None
def read_pcap_file(filename, ssid):
    '''
    Reads a pcap file. This will truncate the pcap file to 64KB by default, then
    use tshark to process the file, output JSON, and parse the output
    
    :param filename: The input file
    '''
    BLOCKSIZE = 65536
    
    global ssh_cache
    
    if not ssh_cache:
        host = SSHClient.JUMP_SERVER_HOST
        username = SSHClient.JUMP_SERVER_USER
        password = SSHClient.JUMP_SERVER_PASS
        
        ssh_cache = SSHClient(host, username, password)
    
    fields = ''
    
    for field in PCAP_FIELDS:
        fields += ' -e {}'.format(field)
    
    tmpname = time.time()
    cmdline = ('dd if="{0}" bs=65536 count=1 > {1}.vwr ; ' 
               'tshark -r {1}.vwr '
               '-Y wlan_mgt.ssid=={2} -T json > {1}.json{3}; '
               'rm -rf {1}.vwr').format(filename, tmpname, ssid, fields)
    
    ssh_cache.wait_for(cmdline)
    
    output = ssh_cache.wait_for('cat {}.json'.format(tmpname))
    
    ssh_cache.wait_for('rm -rf {}.json'.format(tmpname))
    
    if output[-1] != ']':
        # Sometimes, JSON output is broken
        output += '\n]'
    
    return json.loads(output)
    
class IxiaResultParserFactory:
    
    @staticmethod
    def get_card_config(wml_results, card_name):
        '''
        Obtains the configuration for a single card based off of name
        
        :param wml_results: The WML results in JSON/dict format
        :param card_name: The name of the card
        
        :return: Returns a single card and their configuration
        '''
    
        wifi_cards = wml_results['ConfigurationFile']['ChassisConfig']['ChassisName']['Card']
        wifi_card = None
        
        for card in wifi_cards:
        
            ports = card['Port']
            if not isinstance(ports, list):
                ports = [ports]
            
            for port in ports:
                if port['PortName'] == card_name:
                    wifi_card = port
                    break
                
        if not wifi_card:
            return None
            
        return {
            # Channel 6 = 2.4GHz ; Channel 149 = 5GHz
            "ghz":  5.0 if wifi_card['Channel'] == 149 else 2.4,
            "channel": wifi_card['Channel']
        }
    
    @staticmethod
    def get_wifi_client_config(wml_results, client_name):
        '''
        Obtains a single interface configuration from WML based off of name
        
        :param wml_results: The WML results in JSON/dict format
        :param client_name: The name of the client
        
        :return: Returns a single client and their configuration
        '''
    
        wifi_clients = wml_results['ConfigurationFile']['ClientProfileConfig']['ClientGroupName']
        wifi_client = None
        
        if not isinstance(wifi_clients, list):
            wifi_clients = [wifi_clients]
        
        for client in wifi_clients:
            if client['Name'] == client_name:
                wifi_client = client
                break
        
        if not wifi_client:
            return None

        if 'Ethernet' in wifi_client['Interface']:
            # This is not a WiFi client. Keys below won't exist
            return None
        
        # 802.11ac or 802.11n
        wifi_standard = wifi_client['Performance']['phyInterface']
        
        # Card name and configuration. This determines the channel(GHz)
        card_name = wifi_client['PortName']
        card_config = IxiaResultParserFactory.get_card_config(wml_results, card_name)
        
        # IPv6
        if 'Ipv6Flag' in wifi_client:
            # Regular test result
            ipv6_enabled = wifi_client['Ipv6Flag']
        else:
            # wimix script
            ipv6_enabled = wifi_client['EnableIpv6']
        
        # Calculate clients
        client_num = wifi_client['NumClients']
        
        # Data rate. This is pointless if we have MCS, which we won't always have
        performance = wifi_client['Performance']
        data_rate = performance['DataPhyRate']
        
        # Listening interval
        listen_interval = None
        if 'ListenInt' in performance:
            listen_interval = performance['ListenInt']
        elif 'ListenInterval' in performance:
            listen_interval = performance['ListenInterval']
            
        # These are interface specific
        modulation_coding_scheme = None
        spatial_streams = None
        guard_interval = None
        
        # SSID
        ssid = wifi_client['Ssid']
        
        # Aggregate Mac Protocol Data Unit
        ampdu = None
        
        
        if 'ac' in wifi_standard:
            ac_settings = wifi_client['Performance']['acPhySettings']
            
            modulation_coding_scheme = ac_settings['VhtDataMcs']
            spatial_streams = ac_settings['NumSpatialStreams']
            channel_band_mhz = ac_settings['SigBandwidth']
            guard_interval = ac_settings['GuardInterval']
            ampdu = ac_settings['EnableAMPDUaggregation']
        else:
            n_settings = wifi_client['Performance']['nPhySettings']
            
            channel_band_mhz = n_settings['ChannelBandwidth']
            guard_interval = n_settings['GuardInterval']
            
            if 'n' in wifi_standard:
                modulation_coding_scheme = n_settings['DataMcsIndex']
                ampdu = n_settings['EnableAMPDUaggregation']
            
        if modulation_coding_scheme:
            modulation_coding_scheme = int(str(modulation_coding_scheme).replace("'", ''))
        
        # Convert ampdu from 'True'/'False' to 1/0
        if ampdu:
            ampdu = str(ampdu).replace("'", "")
            if ampdu.lower() == 'true':
                ampdu = 1
            elif ampdu.lower() == 'false':
                ampdu = 0

        return {
            "ssid": ssid,
            "card": card_name,
        
            "interface": wifi_standard,
            "ss": spatial_streams,
            "ghz": card_config['ghz'],
            "channel": card_config['channel'],
            "mcs": modulation_coding_scheme,
            
            # Sometimes, this is reported back as a string
            "mhz": int(str(channel_band_mhz).replace("'", '')),
            
            "ipv": 6 if ipv6_enabled else 4,
            "clients": client_num,
            "gi": guard_interval.replace("'", ''),
            "data_rate_mbps": data_rate,
            "ampdu": ampdu,
            
            "listen_interval": listen_interval
        }
    
    @staticmethod
    def get_wml_config(wml_results):
        '''
        Obtains client configurations from WML results. This is used for non-wimix
        test types
        
        :param wml_results: The WML results in JSON/dict format
        
        :return: Returns clients and their information
        '''
        src_info = wml_results['ConfigurationFile']['MapConfig']['SourceDestinationInfo']
        
        src_clients = src_info['Source']
        dest_clients = src_info['Destination']
        
        # Iterate all the interfaces. We only want configurations for WiFi clients
        clients = []
     
        downstream = False
     
        opt = True
        for client_list in (dest_clients, src_clients):
        
            for client in client_list:
                config = IxiaResultParserFactory.get_wifi_client_config(wml_results, client)
                
                downstream = opt
                if config:
                    clients.append(config)
        
            opt = False

        # We have a list of WiFi interfaces. Merge them
        # In other words, if we have 2 WiFi interfaces, we have a Dual-Band test
        
        # On the front-end, the developer should join the lists on the UI using
        # row.interface.join('/')
        # row.mcs.join('/')
        # row.ghz.join('/')
        # etc...
        ret_append = {
            "interface": [],
            "mcs": [],
            "ss": [],
            "ghz": [],
            "mhz": [],
            "ipv": [],
            "data_rate_mbps": []
        }

        clients = sorted(clients, key=lambda k: k['ghz'])
        
        for client in clients:
            for k in ret_append.keys():
                if client[k]:
                    ret_append[k].append(client[k])
        
        # The rest of these configurations can be fetched interface-independent
        
        # Map config has direction
        src_info = wml_results['ConfigurationFile']['MapConfig']['SourceDestinationInfo']
        
        retry = False
        
        # Direction of traffic
        if src_info['FlowDirection'] == 'Unidirectional':
            direction = 'DS' if downstream else 'US'
        else:
            direction = 'BI'
            
        # Flow/traffic type
        traffic_type = src_info['FlowOptions']['Type']
            
        ret = {
            # Traffic flow
            "traffic_flow": '{}=>{}'.format(','.join(src_clients), ','.join(dest_clients)),
        
            # Should be consistent
            "retry": False,
            "direction": direction,
            "traffic_type": traffic_type,
            
            # Even if dual-band, should be consistent
            # These won't exist in LAN-LAN, WAN-LAN
            "gi": clients[0]['gi'] if len(clients) > 0 else None,
            "clients": clients[0]['clients'] if len(clients) > 0 else None,
        }
        
        # Append clients
        ret.update(ret_append)
        return ret
    
    
    @staticmethod
    def udp_throughput(csv_results, wml_results, **kwargs):
        '''
        Extract UDP Throughput information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate UDP Throughout data
        '''
        try:
            if 'results' not in csv_results['Results_unicast_throughput']:
                return {}

            results = csv_results['Results_unicast_throughput']['results']
            
            bi_results = None
            if 'BidirResults' in csv_results:
                bi_results = csv_results['BidirResults']['results']
            
            # Get clients information
            ret = IxiaResultParserFactory.get_wml_config(wml_results)
            
            # Parse throguh TCP MSS 
            frame_size_results = {}
            
            for result in results:
                frame_size = result['Frame Size']
                
                # Wtf. IXIA really loves to switch between arbitrary units...
                theoretical = result['Theoretical Throughput bits/sec']
                actual = result['Throughput bits/sec']
                
                # I remember doing this in school...
                percentage = 100 * (actual / theoretical)
                
                frame_size_results[frame_size] = {
                    "theoretical_mbps": theoretical / BITS_TO_MBPS,
                    "actual_mbps": actual / BITS_TO_MBPS, 
                    "percentage": percentage
                }
                
                if bi_results:
                    # We must obtain the up/down throughputs
                    bi_result = bi_results[0]
                    bi_results = bi_results[1:]
                    
                    up = bi_result['Throughput Up bits/sec']
                    down = bi_result['Throughput Down bits/sec']
                    
                    # Difference between up and down compared to the average
                    try:
                        diff = 100 * abs(up - down)
                        if up > down:
                            diff /= up
                        else:
                            diff /= down
                        diff = diff if diff >= 0 else -1 * diff
                    except ZeroDivisionError:
                        diff = 0
                    
                    frame_size_results[frame_size].update({
                        "up_mbps": up / BITS_TO_MBPS,
                        "down_mbps": down / BITS_TO_MBPS,
                        "diff": diff
                    })
            
            # Output
            ret['frame_size_results'] = frame_size_results
            ret['eth_test'] = False
            
            return ret
        except:
            frame_size_abort = {
                'actual_mbps': ABORT_TEXT,
                'percentage': ABORT_TEXT,
                'theoretical_mbps': ABORT_TEXT
            }

            return {
                'clients': ABORT_TEXT,
                'direction': ABORT_TEXT,
                'frame_size_results': {
                    '64': frame_size_abort,
                    '88': frame_size_abort,
                    '128': frame_size_abort,
                    '256': frame_size_abort,
                    '512': frame_size_abort,
                    '1024': frame_size_abort,
                    '1518': frame_size_abort
                },
                'ghz': [ABORT_TEXT],
                'ipv': [ABORT_TEXT],
                'mcs': [ABORT_TEXT],
                'mhz': [ABORT_TEXT],
                'retry': ABORT_TEXT,
                'ss': ABORT_TEXT
            }
    
    
    @staticmethod
    def tcp_goodput(csv_results, wml_results, **kwargs):
        '''
        Extract TCP goodput information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate TCP goodput data
        '''
        try:
            if 'results' not in csv_results['Results_tcp_goodput']:
                return {}

            results = csv_results['Results_tcp_goodput']['results']
            
            # Get clients information
            ret = IxiaResultParserFactory.get_wml_config(wml_results)
            
            # Parse through TCP MSS 
            mss_results = {}
            
            for result in results:
                mss = result['TCP MSS']
                theoretical = result['Theoretical Goodput kbits/sec']
                actual = result['TCP Goodput kbits/sec']
                
                # I remember doing this in school...
                percentage = 100 * (actual / theoretical)
                
                mss_results[mss] = {
                    "theoretical_mbps": theoretical/KBPS_TO_MBPS,
                    "actual_mbps": actual/KBPS_TO_MBPS, 
                    "percentage": percentage
                }
            
            # Output
            ret['mss_results'] = mss_results
            
            return ret
        except:
            mss_results = {
                'actual_mbps': ABORT_TEXT,
                'percentage': ABORT_TEXT,
                'theoretical_mbps': ABORT_TEXT
            }
            return {
                'clients': ABORT_TEXT,
                'direction': ABORT_TEXT,
                'ghz': [ABORT_TEXT],
                'interface': [ABORT_TEXT],
                'mcs': [ABORT_TEXT],
                'mss_results': {
                    '536': mss_results,
                    '1460': mss_results
                },
                'mhz': [ABORT_TEXT],
                'ss': ABORT_TEXT
            }
    
    @staticmethod
    def mixed_client(csv_results, wml_results, **kwargs):
        '''
        Extract Mixed Client information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Mixed Client data
        '''
        
        # This one is a little different from the rest. The "wimix_script.wml" has 
        # a different format. Additionally, the CSV files are not statically named
        # so we must find the proper CSV files
        
        try:
            results = []
            
            for k, v in csv_results.items():
                
                i = 0
                
                if k.find('Results') == 0 and 'over_time' not in k:
                    # Parse the regular results
                    table = v['trials'][0]['table1']
                    
                    for item in table:
                        if len(results) <= i:
                            results.append({})
                        
                        results[i].update({
                            "forwarding_rate_kbps": item['ForwadingRate(Kbps)'],
                            "packet_loss": item['%PacketLoss'],
                            "jitter": item['jitter(milli-secs)'],
                            "latency": item['avgLatency(milli-secs)'],
                            "retry": False
                        })
                        
                        i+=1
                        
                elif k.find('Detailed') == 0:
                    # Parse the detailed csv
                    table = v['results']
                    for item in table:
                        
                        if len(results) <= i:
                            results.append({})
                            
                        flow_name = item['Flow Name']
                        
                        regex = r'card[0-9]+_port[0-9]+_([A-Za-z0-9_]+)_[0-9]+_[0-9]+$'
                        regex_result = re.search(regex, flow_name)
                            
                        results[i].update({"client_name": regex_result.group(1)})
                            
                        i+=1
            for result in results:
                name = result['client_name']
                
                info = IxiaResultParserFactory.get_wifi_client_config(wml_results, name)
                
                result.update(info)
                
            return results
        except:
            return [{
                'ampdu': ABORT_TEXT,
                'data_rate_mbps': ABORT_TEXT,
                'forwarding_rate_kbps': ABORT_TEXT,
                'ghz': ABORT_TEXT,
                'interface': ABORT_TEXT,
                'mhz': ABORT_TEXT
            }]
    
    
    @staticmethod
    def near_far(csv_results, wml_results, **kwargs):
        '''
        Extract Near Far information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Near Far data
        '''
        
        # All the information from mixed_client can be reused for the near_far test
        # type. We'll just encapsulate the data a little differently
        try:
            before = IxiaResultParserFactory.mixed_client(csv_results, wml_results)
            
            # Encapsulate Near/Medium/Far clients as keys
            after = {}
            for item in before:
            
                client_name = item['client_name']
                regex_result = re.match(r'([A-Za-z]+)', client_name)
                
                key = regex_result.group(1).lower()
                after[key] = item
            
            return after
        except:
            return {
                'near': {
                    'ghz': ABORT_TEXT,
                    'mhz': ABORT_TEXT,
                    'forwarding_rate_kbps': ABORT_TEXT,
                    'jitter': ABORT_TEXT,
                    'latency': ABORT_TEXT,
                    'packet_loss': ABORT_TEXT,
                },
                'medium': {
                    'ghz': ABORT_TEXT,
                    'mhz': ABORT_TEXT,
                    'forwarding_rate_kbps': ABORT_TEXT,
                    'jitter': ABORT_TEXT,
                    'latency': ABORT_TEXT,
                    'packet_loss': ABORT_TEXT,
                },
                'far': {
                    'ghz': ABORT_TEXT,
                    'mhz': ABORT_TEXT,
                    'forwarding_rate_kbps': ABORT_TEXT,
                    'jitter': ABORT_TEXT,
                    'latency': ABORT_TEXT,
                    'packet_loss': ABORT_TEXT,
                }
            }
        
    @staticmethod
    def wmm_power_save(csv_results, wml_results, **kwargs):
        '''
        Extract WMM Power Save information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate WMM Power Save data
        '''
        
        # Same exact as mixed_client, but in key format
        try:
            ret = IxiaResultParserFactory.mixed_client(csv_results, wml_results)
            
            for item in ret:
            
                client_name = item['client_name']
                regex_result = re.match(r'([a-z]+)', client_name)
                
                type = regex_result.group(1).capitalize()
                
                item['client_type'] = type
                
            return ret
        except:
            return [{
                'client_type': ABORT_TEXT,
                'forwarding_rate_kbps': ABORT_TEXT,
                'listen_interval': ABORT_TEXT
            }]
        
        
    @staticmethod
    def triple_play(csv_results, wml_results, **kwargs):
        '''
        Extract Triple Play information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Triple Play data
        '''
        
        # Same exact as near_far
        try:
            ret = IxiaResultParserFactory.near_far(csv_results, wml_results)


            # Search for correct file
            for file, contents in csv_results.items():
                if 'over_time' in file:
                    overtime_results = contents
                    break

            for result in overtime_results['results']:
                if result['Metric'] == 'Forwarding Rate':
                    flow_name = result['Flow Name']
                    regex = r'card[0-9]_port[0-9]_([A-za-z]+)[0-9]+_[A-Za-z0-9_]+$'
                    regex_result = re.search(regex, flow_name)
                    client_name = regex_result.group(1)

                    counter = 1.0
                    overtime = []

                    while counter <= 60.0:
                        # Key of the item
                        k = '{} secs'.format(counter)

                        # Append item to result list
                        item = result[k]/KBPS_TO_MBPS

                        overtime.append(item)

                        counter += 1.0

                    ret[client_name]['overtime'] = overtime

            # Transform this to fit with how legacy data was brought over due
            # to dual band test results. 
            # Ex:
            # {
            #     'voice': {
            #         '24': {},
            #         '5': {}
            #     },
            # }
            for key in ret.keys():
                result_object = ret[key]
                ghz_key = result_object['ghz']
                ghz_key = int(ghz_key) if ghz_key.is_integer() else ghz_key
                ghz_key = str(ghz_key).replace('.', '')
                ret[key] = {}
                ret[key][ghz_key] = result_object

            return ret
        except:
            overtime_abort = []
            for x in range(0, 60):
                overtime_abort.append(0)
            abort_data = {
                '24': {
                    'forwarding_rate_kbps': ABORT_TEXT,
                    'ghz': ABORT_TEXT,
                    'jitter': ABORT_TEXT,
                    'latency': ABORT_TEXT,
                    'mhz': ABORT_TEXT,
                    'overtime': overtime_abort,
                    'packet_loss': ABORT_TEXT
                }
            }
            return {
                'data': abort_data,
                'video': abort_data,
                'voice': abort_data
            }
        
        
    @staticmethod
    def realworld_qoe(csv_results, wml_results, **kwargs):
        '''
        Extract Realworld QoE information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Realworld QoE data
        '''
        try:
            clients = 0
            client_key = ''

            # We must iterate through all the result CSVs and determine which one is
            # the highest. We don't need to concern ourselves with the other CSVs as 
            # they contain duplicated data
            for result in csv_results.keys():
                if result.find('Results_') == 0 and 'over_time' not in result:
                    regex = r'Results_WaveQoE_([0-9]+)_clients'
                    regex_result = re.match(regex, result)
                    client = int(regex_result.group(1))
                    
                    if client > clients:
                        client_key = result
                        clients = client
                    
            
            # Get results
            if client_key == '' or 'trials' not in csv_results[client_key]:
                return {}

            trials = csv_results[client_key]['trials']
            
            ret = []
            for trial in trials:
                table = trial['table2'][0] if 'table2' in trial else None
                
                if table:
                    ret.append({
                        "clients": trial['clients'],
                        "client_type": table['Flow Type'],
                        "latency": table['Latency (msec)'],
                        "jittery": table['Jitter (msec)'],
                        "forwarding_rate_kbps": table['Fwd Rate (Kbps)'],
                        "packet_loss": table['% Packet Loss'],
                        
                        # These need to be implemented sometime in the future
                        
                        # Mean Opinion Score
                        "mos": None,
                        
                        # Media Delivery Index. This is Delay Factor(ms) with 
                        # Media Loss Rate(mlr, pkts/min)
                        #
                        # This is actually located in table['Layer7 Results']
                        "mdi": None
                    })
            
            return ret
        except:
            return None
    
    @staticmethod
    def latency(csv_results, wml_results, **kwargs):
        '''
        Extract Latency information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Latency data
        '''
        
        try:
            if 'results' not in csv_results['Results_unicast_latency']:
                return {}

            results = csv_results['Results_unicast_latency']['results']
            
            # Get clients information
            ret = IxiaResultParserFactory.get_wml_config(wml_results)
            frame_size_results = {}
            
            for result in results:
                frame_size = result['Frame Size']
                frame_size_results[frame_size] = {
                    "latency": result['Average Latency'],
                    "jitter": result['Average Jitter(us)']
                }
            
            ret['frame_size_results'] = frame_size_results
            
            return ret
        except:
            frame_size_abort = {
                'jitter': ABORT_TEXT,
                'latency': ABORT_TEXT
            }

            return {
                'direction': ABORT_TEXT,
                'frame_size_results': {
                    '64': frame_size_abort,
                    '88': frame_size_abort,
                    '128': frame_size_abort,
                    '256': frame_size_abort,
                    '512': frame_size_abort,
                    '1024': frame_size_abort,
                    '1518': frame_size_abort
                },
                'ghz': ABORT_TEXT,
                'ipv': ABORT_TEXT,
                'mcs': ABORT_TEXT,
                'mhz': ABORT_TEXT,
                'ss': ABORT_TEXT
            }
    
    @staticmethod
    def multicast_video(csv_results, wml_results, **kwargs):
        '''
        Extract Multicast Video information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Multicast Video data
        '''
        try:
            results = None
            
            # I can make assumptions that the number of clients will always be 3, but 
            # just to make sure...
            for file, contents in csv_results.items():
                if file.find('Results_') == 0 and 'over_time' not in file:
                    results = contents

            if 'trials' not in results:
                return {}
                    
            # We must parse the clients and map them to their IP address so we can 
            # find them when parsing the test results
            test_config = wml_results['ConfigurationFile']['TestConfig']['Test']['clientWimix']['profiles']['MulticastVideo']
            
            traffic_list = test_config['trafficList']
            client_list = test_config['clientList']
            
            traffic_map = {}
            traffic_wml = wml_results['ConfigurationFile']['WimixTraffic']['TrafficProfile']
            for traffic in traffic_wml:
                traffic_name = traffic['TextNode']
                traffic_map[traffic_name] = traffic['MulticastAddr']['ipAddress']
            
            for traffics, client in zip(traffic_list, client_list):
                traffics = traffics.split(',')
                
                for traffic in traffics:
                    ip = traffic_map[traffic]
                    new_dict = {}
                    new_dict['client_name'] = client
                    new_dict['stream_name'] = traffic
                    traffic_map[ip] = new_dict
                    del traffic_map[traffic]
            
            # And now to parse the results...
            ret = []
            
            for result in results['trials'][0]['table1']:
            
                stream_ip = result['Flow IP(src to dest)'].split(' ')[2]
                delay_factor = result['delayFactor']
                mlr = result['mlr']
                
                client_info = traffic_map[stream_ip]
                
                new_obj = {
                    "retry": False,
                    "stream_ip": stream_ip,
                    "delay_factor": delay_factor,
                    "media_loss_rate": mlr
                }
                
                new_obj.update(client_info)
                
                ret.append(new_obj)
                
            return sorted(ret, key=lambda row: row['client_name'])
        except:
            return [{
                'client_name': ABORT_TEXT,
                'delay_factor': ABORT_TEXT,
                'media_loss_rate': ABORT_TEXT,
                'stream_ip': ABORT_TEXT,
                'stream_name': ABORT_TEXT
            }]
    
    @staticmethod
    def packet_capture(csv_results, wml_results, **kwargs):
        '''
        Extract Packet Capture information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Packet Capture data
        '''
        
        # We need a 'path' kwarg for this function. Otherwise, we don't know where
        # to get our pcap files from!
        if 'path' not in kwargs or not kwargs['path']:
            raise Exception('packet_capture requires "path" kwarg (--path option)')
        
        try:
            src_info = wml_results['ConfigurationFile']['MapConfig']['SourceDestinationInfo']
            
            src_clients = src_info['Source']
            dest_clients = src_info['Destination']
            
            all_clients = src_clients + dest_clients
            
            ret = {}
            for client in all_clients:
                config = IxiaResultParserFactory.get_wifi_client_config(wml_results, client)

                if config:
                    # Config is set, it's a WiFi client. Otherwise, it's an Ethernet
                    channel = config['channel']
                    ssid = config['ssid']
                    card_name = config['card']
                    
                    pcap_file = 'Hdwrlog_lib-{}-ch{}.vwr'.format(card_name, channel)
                    
                    fullpath = os.path.join(kwargs['path'], pcap_file).replace('\\', '/')
                    
                    results = read_pcap_file(fullpath, ssid)
                    packet = results[0]['_source']['layers']
                    
                    # Convert bit rates to Mbps
                    rates = packet.get('wlan_mgt.supported_rates', None)
                    if rates:
                        packet['wlan_mgt.supported_rates'] = [(int(i) & 127) / 2 for i in rates]

                    # packet = normalize(packet)
                    new_packet = {}
                    for old_key in packet:
                        value = packet[old_key]
                        new_keys = old_key.split('.')
                        packet_iter = new_packet
                        for new_key in new_keys:
                            if new_key == new_keys[-1]:
                                packet_iter[new_key] = value
                                break

                            if new_key not in packet_iter:
                                packet_iter[new_key] = {}
                            packet_iter = packet_iter[new_key]
                    
                    ret[channel] = new_packet

            return ret
        except:
            ixveriwave_data = {
                'ixveriwave': {
                    'dbm_anta': ABORT_TEXT,
                    'dbm_antb': ABORT_TEXT,
                    'dbm_antc': ABORT_TEXT,
                    'dbm_antd': ABORT_TEXT
                }
            }
            return {
                '6': ixveriwave_data,
                '149': ixveriwave_data
            }
                
        
    @staticmethod
    def reuse_of_airtime(csv_results, wml_results, **kwargs):
        '''
        Extract Reuse of Airtime information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Reuse of Airtime data
        '''
        try:
            overtime_results = None
            
            # Search for correct file
            for file, contents in csv_results.items():
                if 'over_time' in file:
                    overtime_results = contents
                    break
                    
            # Parse results
            
            individual_results = {}
            average_results = {}
            total_results = {}
            
            # There are 4 metrics per client
            total_set = int(len(overtime_results['results']) / 4)
            
            for result in overtime_results['results']:
            
                # Extract the client name
                flow_name = result['Flow Name']
                regex = r'card([0-9])_port([0-9])_([A-Za-z0-9_]+)$'
                regex_result = re.search(regex, flow_name)
                client_name = regex_result.group(3)
                result_type = result['Metric'].lower().replace(' ', '_')
                if result_type == 'forwarding_rate':
                    result_type = 'forwarding_rate_mbps'
                
                # Create objects if they weren't already created
                if client_name not in individual_results:
                    individual_results[client_name] = {}
                
                if result_type not in total_results:
                    total_results[result_type] = [0] * 60
                    average_results[result_type] = [0] * 60
                
                # Begin iteration
                counter = 1.0
                new_list = []
                
                time_average_key = ['avg_1_30', 'avg_31_60']
                time_average = {
                    "avg_1_30": 0,
                    "avg_31_60": 0,
                }
                while counter <= 60.0:
                    # Key of the item
                    k = '{} secs'.format(counter)
                    
                    # Append item to result list
                    item = result[k]
                    
                    if result_type == 'forwarding_rate_mbps':
                        item /= KBPS_TO_MBPS
                    new_list.append(item)
                    
                    # Aggregate total
                    i = int(counter) - 1
                    total_results[result_type][i] += item
                    
                    # Average total
                    average_results[result_type][i] += item / total_set
                    
                    # Individual average(0-30 secs, 31-60 secs)
                    kavg = time_average_key[int(i / 30)]
                    time_average[kavg] += item / 30
                    
                    counter += 1.0
                    
                individual_results[client_name][result_type] = {}
                individual_results[client_name][result_type]['data'] = new_list
                individual_results[client_name][result_type].update(
                    time_average)
            

            return {
                "individual": individual_results,
                "average": average_results,
                "total": total_results
            }
        except:
            fake_data = {
                'avg_1_30': 0,
                'avg_31_60': 0,
                'data': []
            }
            for x in range (0, 61):
                fake_data['data'].append(0)
            return {
                'individual': {
                    ABORT_TEXT: {
                        'jitter': fake_data,
                        'latency': fake_data,
                        'forwarding_rate_mbps': fake_data,
                        'packet_loss': fake_data
                    }
                },
                'average': {
                    'latency': fake_data['data'],
                    'jitter': fake_data['data'],
                    'packet_loss': fake_data['data'],
                    'forwarding_rate_mbps': fake_data['data']
                },
                'total': {
                    'latency': fake_data['data'],
                    'jitter': fake_data['data'],
                    'packet_loss': fake_data['data'],
                    'forwarding_rate_mbps': fake_data['data']
                }
            }
        
    @staticmethod
    def unicast_video(csv_results, wml_results, **kwargs):
        '''
        Extract Unicast Video information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Unicast Video data
        '''
        
        # We'll assume this exists. If not, there was an error with testing
        # TODO: Confirm and handle
        try:
            if 'results' not in csv_results['Detailed_Results_WaveQoE_1_clients']:
                return {}

            client = csv_results['Detailed_Results_WaveQoE_1_clients']['results'][0]
            
            # Fetch client name
            flow_name = client['Flow Name']
            regex = r'card[0-9]+_port[0-9]+_([A-Za-z0-9_]+)_[0-9]+_[0-9]+$'
            regex_result = re.search(regex, flow_name)
            name = regex_result.group(1)
            
            # Fetch client configuration
            ret = IxiaResultParserFactory.get_wifi_client_config(wml_results, name)
            
            # Now for the fun part...
            # Unicast Video creates clients until it can handle no more additional
            # client streams. This means IxVeriwave creates a CSV for each of the 
            # different amount of clients
            
            # We'll parse through all of them, and determine the MAX delayFactor & mlr
            
            sessions = 0
            max_delay_factor = -1
            max_mlr = -1
            for file, contents in csv_results.items():
                if file.find('Results_') == 0 and 'over_time' not in file:
                    trials = contents['trials']
                    for trial in trials:
                        tables = trial['table1']
                        
                        for table in tables:
                            max_delay_factor = max(max_delay_factor, table['delayFactor'])
                            max_mlr = max(max_mlr, table['mlr'])
                        
                    sessions += 1
        
            ret.update({
                "max_delay_factor": max_delay_factor,
                "max_mlr": max_mlr,
                "retry": False,
                "sessions": sessions
            })
            
            return ret
        except:
            return {
                'ghz': ABORT_TEXT,
                'interface': ABORT_TEXT,
                'max_delay_factor': ABORT_TEXT,
                'max_mlr': ABORT_TEXT,
                'mcs': ABORT_TEXT,
                'mhz': ABORT_TEXT,
                'sessions': ABORT_TEXT,
                'ss': ABORT_TEXT
            }
    
    @staticmethod
    def max_client(csv_results, wml_results, **kwargs):
        '''
        Extract Max Client information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate Max Client data
        '''
        try:
            if 'results' not in csv_results['Results_unicast_maximum_client_capacity']:
                return {}

            results = csv_results['Results_unicast_maximum_client_capacity']['results']
            
            # Get clients information
            ret = IxiaResultParserFactory.get_wml_config(wml_results)
            
            for result in results:
                clients = result['Num Of Clients']
                retry = False
                load = result['ILOAD']
                
                ret.update({
                    "clients": clients,
                    "retry": retry,
                    "load": load
                });
            
            return ret
        except:
            return {
                'clients': ABORT_TEXT,
                'direction': ABORT_TEXT,
                'ghz': ABORT_TEXT,
                'gi': ABORT_TEXT,
                'interface': ABORT_TEXT,
                'ipv': ABORT_TEXT,
                'load': ABORT_TEXT,
                'mcs': ABORT_TEXT,
                'mhz': ABORT_TEXT,
                'ss': ABORT_TEXT,
                'traffic_type': ABORT_TEXT
            }
            
    
    @staticmethod
    def rate_vs_range(csv_results, wml_results, **kwargs):
        '''
        Extract RVR information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate RVR data
        '''
        try:
            if 'results' not in csv_results['Results_rate_vs_range_s2']:
                return {}

            csv_results = csv_results['Results_rate_vs_range_s2']['results']
            name = csv_results[0]['Group Name']
            
            ret = IxiaResultParserFactory.get_wifi_client_config(wml_results, name)
            
            dbs = {}
            
            for row in csv_results:
                db = int(row['Est. RSSI'])
                rate = row['Forwarding Rate bits/sec']
                db_value = rate / BITS_TO_MBPS
                dbs[db] = db_value

            # Align data with imported legacy data
            wml_config = IxiaResultParserFactory.get_wml_config(wml_results)
            ret['channel'] = [ret['channel']]
            ret['direction'] = wml_config['direction']
            ret['ghz'] = [ret['ghz']]
            ret['interface'] = [ret['interface']]
            ret['ipv'] = [ret['ipv']]
            ret['mcs'] = [ret['mcs']]
            ret['mhz'] = [ret['mhz']]
            ret['retry'] = False
                
            ret['dB_throughput'] = dbs
            return ret
        except:
            dbs = {}
            for db in range(-32, -96, -1):
                dbs[db] = 0

            return {
                'dB_throughput': dbs,
                'ghz': ABORT_TEXT,
                'ipv': ABORT_TEXT,
                'mcs': ABORT_TEXT,
                'mhz': ABORT_TEXT,
                'retry': ABORT_TEXT
            }
    
    @staticmethod
    def packet_loss(csv_results, wml_results, **kwargs):
        '''
        Extract packet loss information from CSV and WML test results
        
        :param csv_results: csv results in JSON/dict format
        :param wml_results: wml results in JSON/dict format
        
        :return: This will return appropriate packet loss data
        '''
        try:
            # if 'results' not in csv_results['Results_unicast_packet_loss']:
            #     return {}

            csv_results = csv_results['Results_unicast_packet_loss']['results'][0]
            
            # Get clients information
            ret = IxiaResultParserFactory.get_wml_config(wml_results)
            
            # Frame size
            frame_size = csv_results['Frame Size']
            
            # Forwarding rate(Mbps). How much data the DUT is forwarding
            forwarding_rate = csv_results['Forwarding Rate bits/sec']
            forwarding_rate /= BITS_TO_MBPS
            
            # Packet loss(percentage)
            packet_loss = csv_results['Frame Loss Rate']
            
            # Outbound load. This is relative to the IXIA traffic generator
            # This is calculated with the forwarding rate. OLOAD key is packets/sec
            oload = forwarding_rate * ((100 + packet_loss) / 100)
            
            # Inbound load. This is relative to the IXIA traffic generator
            # This is calculated with percentage difference on OLOAD and ILOAD
            iload_percentage_diff = csv_results['ILOAD'] - csv_results['OLOAD']
            iload_percentage_diff /= csv_results['ILOAD']
            
            iload = oload * (1.0 + iload_percentage_diff)
            
            ret['frame_size'] = frame_size
            ret['iload_mbps'] = iload
            ret['oload_mbps'] = oload
            ret['forwarding_rate_mbps'] = forwarding_rate
            ret['packet_loss'] = packet_loss
            
            return ret
        except:
            return {
                'direction': ABORT_TEXT,
                'forwarding_rate_mbps': ABORT_TEXT,
                'frame_size': ABORT_TEXT,
                'ghz': ABORT_TEXT,
                'iload_mbps': ABORT_TEXT,
                'ipv': ABORT_TEXT,
                'mhz': ABORT_TEXT,
                'oload_mbps': ABORT_TEXT,
                'packet_loss': ABORT_TEXT,
                'ss': ABORT_TEXT
            }
        
def ixia_result_parser(result, test_type, pass_fail_criteria=None, as_table=False, **kwargs):
    '''
    Will parse CSV and WML results, and determine relevant information according
    to the test_type
    
    :param result: The CSV and WML results in JSON/dict format
    :param test_type: The test type to use for result data parsing
    :param pass_fail_criteria: Provide a pass/fail criteria. TODO: Implement
    :param as_table: Whether to display result as an ASCII table. TODO: Implement
    
    :return: This will return relevant test type information
    '''
    ret = {}
    
    function = getattr(IxiaResultParserFactory, test_type, None)
    
    if not function:
        raise Exception('Test type "{}" was not found'.format(test_type))
    
    for key, wml_results in result['wml'].items():
        return function(result['csv'], wml_results, **kwargs)
    
    return None

def ixia_error_parser(result):
    '''
    Will parse CSV results for any errors and combine them into a single
    error list

    :param result: The CSV and WML results in JSON/dict format

    :return: This will return all errors found
    '''
    errors = []

    for key in result['csv']:
        if (('errors' in result['csv'][key]) and 
                (result['csv'][key]['errors'] is not None)):
            for error in result['csv'][key]['errors']:
                if error not in errors:
                    errors.append(error)
    return errors
        
def main(args):
    '''
    The program should output via STDOUT a valid JSON describing the test results 
    for a specific test type
    
    :param args: arguments provided through command line
    '''
    
    # Determine the test type
    test_type = args.test_type
    
    # Read the JSON result + wml config through STDIN
    json_input = sys.stdin.read()
    
    # Path. This is needed for Packet Capture test
    path = args.path
    
    try:
        result = json.loads(json_input)
    except Exception as e:
        print('INPUT|ERROR|stdin input is not valid JSON');
        return
        
    try:
        result = ixia_result_parser(result, test_type, path=path)
    except Exception as e: 
        print('PARSER|ERROR|{}'.format(str(e)));
        raise(e)
        return
    
    if args.indent:
        # Was called with --indent
        print(json.dumps(result, indent=2))
    else:
        print(json.dumps(result))
    
if __name__ == '__main__':

    #
    # If we're here, this script was called directly through the python
    # interpreter
    #  
    
    parser = argparse.ArgumentParser(
        description='Parse IXIA test results'
    )
    
    parser.add_argument(
        '--indent', 
        help='Include the WML only', 
        action='store_true'
    )
    
    parser.add_argument(
        '--test-type', 
        help='Indent the JSON output',
        type=str
    )
    
    parser.add_argument(
        '--path', 
        help='Test result path',
        default='',
        type=str
    )
    
    args = parser.parse_args()
    
    main(args)
        