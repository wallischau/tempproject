import unittest
import json
import subprocess
from ..mobile import MobileClient

class Mobile_Test(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.emulator_name = 'emulator-5554'
        cls.ip_address = '10.0.39.19:8080'
        cls.rest_api_url = 'http://{0}/'.format(cls.ip_address)
        
        # Start the emulator
        response = cls.start_emulator(cls);

        cls.emulator_error = True
        if 'status' in response:
            if response['status'] == 'success':
                cls.emulator_error = False
                cls.emulator = MobileClient(cls.emulator_name, cls.ip_address)

    def setUp(self):
        if self.emulator_error:
            self.fail("Unable to start emulator")

    def start_emulator(self):
        return self.execute(self, path='emulator/start')
    def stop_emulator(self):
        return self.execute(self, path='emulator/stop')

    def execute(self, path, params=None):
        request = ''
        if params:
            request = "curl -s -X GET -H 'Content-Type:application/json' --data '{0}' {1}{2}".format(params, self.rest_api_url, path)

        else:
            request = 'curl -s {0}{1}'.format(self.rest_api_url, path);

        response = subprocess.Popen(request, stdout=subprocess.PIPE, shell=True).communicate()[0].decode()

        if response != "":
            return json.loads(response)
        else:
            error = {'ERR':{'reason':'No Connection'}}
            return json.loads(json.dumps(error))

        return json.loads(response)

    def test_get_network_info(self):
        expected_response = {
            'frequency': '-1',
            'link_speed': '-1',
            'frequency_units': 'MHz',
            'link_speed_units': 'Mbps',
            'bssid': None,
            'state': 'CONNECTED',
            'rssi': '-127',
            'wifi_state': 'UNINITIALIZED',
            'type': 'MOBILE',
            'ip_address': '0.0.0.0',
            'ssid': '<unknown ssid>',
            'bool_ssid': 'False',
            'mac_address': '02:00:00:00:00:00'
        }
        
        actual_response = self.emulator.get_network_info()
        
        self.assertEqual(expected_response, actual_response)

    def test_scan_networks(self):
        expected_response = []

        actual_response = self.emulator.scan_networks()

        self.assertEqual(expected_response, actual_response)

    def test_connect_network(self):
        expected_response = {
            'status': 'error',
            'reason': 'matching network not found'
        }

        ssid = 'Charter_Guest_Wireless'
        bssid = 'a0:e0:af:3c:43:de'

        actual_response = self.emulator.connect_network(ssid=ssid)
        self.assertEqual(expected_response, actual_response)

        actual_response = self.emulator.connect_network(bssid=bssid)
        self.assertEqual(expected_response, actual_response)

        actual_response = self.emulator.connect_network(ssid=ssid, bssid=bssid)
        self.assertEqual(expected_response, actual_response)

    def test_start_app(self):
        expected_response = {
            'status': 'success'
        }

        actual_response = self.emulator.start_app('com.google.android.youtube')
        self.assertEqual(expected_response, actual_response)

    def test_stop_app(self):
        expected_response = {
            'status': 'success'
        }

        actual_response = self.emulator.stop_app('com.google.android.youtube')
        self.assertEqual(expected_response, actual_response)

    @classmethod 
    def tearDownClass(cls):
        if not cls.emulator_error:
            cls.stop_emulator(cls)

if __name__ == '__main__':
    unittest.main()
