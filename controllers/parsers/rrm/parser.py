import json
import pytz
import datetime
import os
import re

from tests.rrm.rrm_objects import DumpSlice, IxiaObject, Interface, Station

from pymongo import MongoClient

class RrmParser:

    def __init__(self):
        self._initialize_rrm_mongo_db()
        self.collections = []

    def _initialize_rrm_mongo_db(self):
        db_ip = '10.0.39.158'
        rrm_mongo_client = MongoClient('mongodb://{}:27017/'.format(db_ip))
        self.rrm_db = rrm_mongo_client['charter']

    def _add_collection(self, timestamp):
        """Sets the collection we care about for the RRM MongoDB"""
        base_str = 'wifiCollection_'
        date_string = timestamp.split(' ')[0].split('-')
        date_string = ''.join(date_string)
        collection_name = base_str + date_string
        self.collections.append(collection_name)

    def _find_ixia_csvs(self, directory):
        csv_regex = r'Results_WaveQoE_[0-9]+_clients.csv'

        return self._find_files(directory, csv_regex)

    def _find_files(self, directory, pattern):
        matched_files = []
        for root, dirs, files in os.walk(directory):
            for basename in files:
                if re.fullmatch(pattern, basename):
                    filename = os.path.join(root, basename)
                    matched_files.append(filename)
        return matched_files    

    def _parse_ixia_csv(self, log_path):
        fwd_rate_next = 0
        new_ixia_obj = IxiaObject()
        new_ixia_obj.client_number = int(log_path.split('/')[-1].split('_')[2])
        new_ixia_obj.t_put = 0
        new_ixia_obj.timestamp = ''
        new_ixia_obj.log_path = log_path
        with open(log_path, 'r') as file:
            for line in file:
                if "Trial 1" in line:
                    temp_line = line.split('(')[1].split(')')[1].split('.')[0]
                    temp_line = temp_line[2:]
                    temp_line_split = temp_line.split(' ')
                    temp_line = temp_line_split[0] + ' ' + temp_line_split[1]
                    new_ixia_obj.timestamp = temp_line
                    self._add_collection(new_ixia_obj.timestamp)

                if fwd_rate_next:
                    temp_line = line.split(',')[5]
                    new_ixia_obj.t_put = float(temp_line) * 600 * new_ixia_obj.client_number * 0.000125
                    break
                if "Fwd Rate (Kbps)" in line:
                    fwd_rate_next = 1
        return new_ixia_obj

    def _get_assia_data(self, mac_address):
        assia_data = []
        for collection_name in self.collections:
            collection = self.rrm_db[collection_name]
            for post in collection.find({"lineId" : mac_address }):
                returned_good = self._coming_through(post)
                if returned_good is not None:
                    assia_data = assia_data + returned_good
            return assia_data

    def _coming_through(self, data):
        #Process each interface slice first
        slice_list = []
        #Flag to see if there anything to return
        did_contain = 0
        if 'operational' in data:
            for time_slice in data["operational"]:
                did_contain = 1
                slice_list.append(self._process_slice(time_slice))
            if did_contain:
                return slice_list
            else:
                return None
        else:
            return None

    def _process_slice(self, time_slice):
        #Do stuff
        #All the exceptions are just in case of bad uploads to Assia
        new_slice  = DumpSlice()
        new_slice.ixia_results = None
        new_slice.interfaces = []
        try:
            new_slice.timestamp = str(time_slice["timestamp"]).split(".")[0]
            new_slice.last_cpu = time_slice["cpuStats"]["lastCpu"]
        except:
            new_slice.timestamp = str(time_slice["timestamp"]).split(".")[0]
            new_slice.last_cpu = 0
        for slice_interface in time_slice["interfaces"]:
            new_interface = Interface()
            new_interface.stations = []
            if slice_interface["interface"] == 0:
                new_interface.interface_name = "ath1"
            elif slice_interface["interface"] == 32:
                new_interface.interface_name = "ath0"
            else:
                break
            try:
                new_interface.rx_bytes = int(slice_interface["counters"]["rxBytes"])/1000000
                new_interface.rx_packets = slice_interface["counters"]["rxPackets"]
                new_interface.tx_bytes = int(slice_interface["counters"]["txBytes"])/1000000
                new_interface.tx_packets = slice_interface["counters"]["txPackets"]
            except:
                new_interface.rx_bytes = 0
                new_interface.rx_packets = 0
                new_interface.tx_bytes = 0
                new_interface.tx_packets = 0
            try:
                # for int_station in slice_interface["stations"]:
                for int_station in slice_interface.get("stations", []):
                    new_station = Station()
                    new_station.rssi = int_station["rssi"]
                    new_station.interface = new_interface.interface_name
                    new_station.tx_packets = int_station["txPackets"]
                    new_station.rx_packets = int_station["rxPackets"]
                    new_station.mac = int_station["mac"]
                    new_station.tx_bytes = int(int_station["txBytes"])/1000000
                    new_station.rx_bytes = int(int_station["rxBytes"])/1000000
                    new_interface.stations.append(new_station)
            except Exception as ex:
                pass
            new_slice.interfaces.append(new_interface)
        # self.test_logger.info('new_slice: \n{}'.format(new_slice))
        return new_slice

    def _convert_local_to_utc(self, naive_datetime):
        local = pytz.timezone('America/Denver')
        local_dt = local.localize(naive_datetime, is_dst=None)
        utc_dt = local_dt.astimezone(pytz.utc)
        return utc_dt

    def _combine_assia_ixia(self, assia_data, ixia_data):
        #Start by going through each of the objects
        new_output_list = []
        times_list = []
        for assia_obj in assia_data:
            for ixia_obj in ixia_data:
                #get both the timestamps and convert each to UTC time
                if ixia_obj.timestamp != '':
                    new_ixia_time = datetime.datetime.strptime(ixia_obj.timestamp, "%Y-%m-%d %H:%M:%S")
                    new_ixia_time = self._convert_local_to_utc(new_ixia_time)

                    new_assia_time = datetime.datetime.strptime(assia_obj.timestamp, "%Y-%m-%d %H:%M:%S")
                    new_assia_time = pytz.utc.localize(new_assia_time)

                    #Check whether the difference between the two time stamps is more than 10 but less than 15
                    assia_ixia_time_diff = abs((new_ixia_time - new_assia_time).total_seconds())
                    times_list.append(assia_ixia_time_diff)
                    if assia_ixia_time_diff < 900 and assia_ixia_time_diff > 660:
                        #This means that the time stamps match up lets add it to the 
                        assia_obj.ixia_results = ixia_obj
                        new_output_list.append(assia_obj)
                        break
        return new_output_list

    def _get_ap_meta_data(self, test_dir):
        meta_data_file = '{}/ApMetaData.json'.format(test_dir)
        with open(meta_data_file, 'r') as file:
            return json.load(file)
        
    def get_results(self, test_dir, test_type, test_case):
        '''
        Determines whether or not there was a testing error
        '''
        ap_meta_data = None
        try:
            ap_meta_data = self._get_ap_meta_data(test_dir)
            mac_address = ap_meta_data['lineId']

            ixia_objects = []
            for filename in self._find_ixia_csvs(test_dir):
                ixia_objects.append(self._parse_ixia_csv(filename))

            # We have all the logs now have to comb through the db
            assia_data = self._get_assia_data(mac_address)
            combined_objects = self._combine_assia_ixia(assia_data, ixia_objects)
            for i in range(len(combined_objects)):
                combined_objects[i] = vars(combined_objects[i])
                combined_objects[i]['ixia_results'] = vars(combined_objects[i]['ixia_results'])
                for j in range(len(combined_objects[i]['interfaces'])):
                    combined_objects[i]['interfaces'][j] = vars(combined_objects[i]['interfaces'][j])
                    for k in range(len(combined_objects[i]['interfaces'][j]['stations'])):
                        combined_objects[i]['interfaces'][j]['stations'][k] = vars(combined_objects[i]['interfaces'][j]['stations'][k])
            output_file = '{}/CombinedObjects.json'.format(test_dir)
            with open(output_file, 'w') as file:
                for one_obj in combined_objects:
                    json.dump(one_obj, file)

            results_file = '{}/results_data.json'.format(test_dir)
            return {
                "raw": {},
                "processed": {
                    "ap_meta_data": ap_meta_data,
                    "combined_data": combined_objects
                },
                "errors": []
            }
        except Exception as ex:
            print('Exception')
            print(ex)
            return {
                "raw": {},
                "processed": {
                    "ap_meta_data": ap_meta_data
                },
                "errors": [str(ex)]
            }