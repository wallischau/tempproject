import json
import subprocess

from controller import Controller
from exceptions import MobileDeviceNotFound, NetworkError

class MobileClient(Controller):
    '''
    a mobile device client. used for sending commands and retreiving
    information from mobile devices connected via USB. provides abstraction
    from the REST API and WebSocket interface to the USB server
    '''

    def __init__(self, serial_no, ip_address):
        self.ip_address = ip_address
        self.rest_api_url = 'http://{0}/'.format(ip_address)

        # Initialize the REST API Request Template
        self.request = {}

        devices = self._get_device_list();

        print(devices);

        # search for our device
        for dev_id, dev_str in devices.items():
            make, model, serial = dev_str.split(':')
            if serial == serial_no:
                # this is the one we're looking for
                self.device_id = dev_id
                self.make = make
                self.model = model
                break
        else:
            # didn't find our device
            raise MobileDeviceNotFound('No device with serial number "{0}" connected via USB'.format(serial_no))

    def _execute(self, path, params=None):
        request = ''
        if params:
            request = "curl -s -X GET -H 'Content-Type:application/json' --data '{0}' {1}{2}".format(params, self.rest_api_url, path)

        else:
            request = 'curl -s {0}{1}'.format(self.rest_api_url, path);

        print(request)
        self.log.debug(request)

        response = subprocess.Popen(request, stdout=subprocess.PIPE, shell=True).communicate()[0].decode()
        print(response)
        self.log.debug("\n" + response)

        if response != "":
            return json.loads(response)
        else:
            error = {'ERR':{'reason':'No Connection'}}
            return json.loads(json.dumps(error))

        # if self.validate_response(response):
        #     self.init_request()
        #     return True
        # else:
        #     return False

    def _get_device_list(self):
        return self._execute(path='list');

    def get_network_info(self):
        '''
        retreive the current WiFi connectivity info
        :return: dict
        '''
        # return self._http_command_request('network').json()
        params = '{{"dev": "{0}"}}'.format(self.device_id)
        return self._execute(path='command/network', params=params)

    def scan_networks(self):
        '''
        instruct device to scan its environment and return info about
        the APs it sees. BLOCKS UNTIL THE SCAN IS COMPLETE
        :return: a list of dict
        '''
        # return self._http_command_request('network/scan').json()
        params = '{{"dev":"{0}"}}'.format(self.device_id)
        return self._execute(path='command/network/scan', params=params)

    def connect_network(self, ssid='', bssid=''):
        '''
        instruct the device to connect to a the specified network
        :return: dict containing success/failure info
        '''
        params = '{{"dev":"{0}", "ssid":"{1}", "bssid":"{2}"}}'.format(self.device_id, ssid, bssid)
        return self._execute(path='command/network/change', params=params);

    def start_app(self, package_name):
        '''
        instruct the device to start the app associated with
        the pacakge name
        :return: dict containing success/failure info
        '''
        # return self._http_command_request('app/start', package=package_name).json()
        params = '{{"dev":"{0}", "package":"{1}"}}'.format(self.device_id, package_name);
        return self._execute(path='command/app/start', params=params);

    def stop_app(self, package_name):
        '''
        instruct the device to stop the app associated with 
        the package name
        :return: dict containing success/failure info
        '''
        # return self._http_command_request('app/stop', package=package_name).json()
        params = '{{"dev":"{0}", "package":"{1}"}}'.format(self.device_id, package_name);
        return self._execute(path='command/app/stop', params=params);
