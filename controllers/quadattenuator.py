import json
import subprocess

from .controller import Controller

class QuadAttenuator(Controller):
    def __init__(self, ip_address):
        self.ip_address = ip_address
        self.rest_api_url = 'http://{0}/api/quadAtten'.format(ip_address)

        # Initialize the REST API Request Template
        self.request = {}
        self.init_request()

    def init_request(self):
        request = 'curl -s {0}'.format(self.rest_api_url)
        response = subprocess.Popen(request, stdout=subprocess.PIPE, shell=True).communicate()[0].decode()
        self.request = json.loads(response)

        self.request.pop('form_error')
        self.request.pop('form_result')

    def validate_response(self, response):
        fields = json.loads(response)
        if fields['form_error'] != '':
            print('REST API Exception: {0}'.format(fields['form_error']))
            self.log.error('REST API Exception: {0}'.format(fields['form_error']))
            return False

        return True

    def execute(self, params=None):
        request = ''
        if params:
            request = "curl -s -H 'Content-Type:application/json' --data '{0}' {1}".format(params, self.rest_api_url)

        else:
            request = 'curl -s {0}'.format(self.rest_api_url)

        print(request)
        self.log.debug(request)

        response = subprocess.Popen(request, stdout=subprocess.PIPE, shell=True).communicate()[0].decode()
        print(response)
        self.log.debug("\n" + response)

        if self.validate_response(response):
            self.init_request()
            return True
        else:
            return False

    def get_info(self):
        return self.request

    def get_atten(self, atten_no):
        return float(self.request['atten{0}'.format(atten_no)]) 

    def get_atten_db_max(self):
        return float(self.request['atten_db_max'])

    def get_atten_rf_count(self):
        return float(self.request['atten_rf_count'])

    def get_dev_name(self):
        return self.request['dev_name']

    def get_dev_serial(self):
        return self.request['dev_serial']

    def get_dev_type(self):
        return self.request['dev_type']

    def get_ether_mac(self):
        return self.request['ether_mac']

    def get_ip_static_address(self):
        return self.request['ip_static_address']

    def get_ip_static_gateway(self):
        return self.request['ip_static_gateway']

    def get_ip_static_subnet(self):
        return self.request['ip_static_subnet']

    def get_version_firmware(self):
        return self.request['version_firmware']

    def set_atten(self, atten_no, atten):
        params = '{{"atten{0}": "{1}"}}'.format(atten_no, atten)
        return self.execute(params)
