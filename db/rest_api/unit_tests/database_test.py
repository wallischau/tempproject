import unittest
import json
import subprocess
import platform
import re
import urllib
import urllib.request
from pymongo import MongoClient

def windows_curl(request):
  
  url = ''
  data = None
  cookie = ''
  
  url_start = request.rfind(' ')
  url = request[url_start+2:-1]
  
  headers = {}
  
  method = 'GET'
  
  if '--cookie' in request:
    result = re.search(r'--cookie "([^"]+)"', request)
    headers['Cookie'] = result.group(1)
    
  args = [url]
  if '--data' in request:
    method = 'POST'
    data_start = request.find("--data") + 8
    data_end = url_start - 1
    
    data = request[data_start:data_end].replace("'\"'\"'", "'")
    headers['Content-Type'] = "application/json"
    args.append(data.encode())
    
  if '-X' in request:
    result = re.search(r'-X ([A-Za-z]+)', request)
    method = result.group(1)
  
  req = urllib.request.Request(*args, headers=headers)
  req.get_method = lambda: method
  
  try:
    response = urllib.request.urlopen(req)
    content = response.read().decode(encoding='utf-8')
    status = response.status
    headers = response.headers
  except urllib.error.HTTPError as e:
    status = e.status
    headers = e.headers
    content = e.fp.read().decode(encoding='utf-8')
  
  ret = 'HTTP/1.1 {} OK\n'.format(status)
  ret += str(headers) + str(content)
  
  return ret
  
class Database_Test():
    def setup(self):
        self.client = MongoClient()
        self.db = self.client.unittest

        self.cookie_string = None

    def drop_database(self):
        self.db.command("dropDatabase")

    def curl_db(self, destination, data=None, rest_method='GET'):

        destination = destination.replace(' ', '%20')

        request = "curl -i -s -X {0}".format(rest_method)

        if self.cookie_string:
            request += ' --cookie "{0}"'.format(self.cookie_string)

        if data:
            request += " -H 'Content-Type:application/json' --data '{0}' '{1}'".format(data, destination)
        else:
            request += " '{0}'".format(destination)
        
        if platform.system() == "Windows":
          response = windows_curl(request)
        else:
          response = subprocess.Popen(request, stdout=subprocess.PIPE, shell=True).communicate()[0].decode()
        
        if 'set-cookie' in response:
            self.cookie_string = response[response.find('set-cookie'):]
            self.cookie_string = self.cookie_string[self.cookie_string.find(' ') + 1:]
            self.cookie_string = self.cookie_string[:self.cookie_string.find(';')]

        response = response[response.find('{'):]

        return json.loads(response)

    def get_json_data(self, file):
        with open(file) as json_data:
            d = json.load(json_data)
            return d

    def get_json_data_string(self, file):
        return json.dumps(self.get_json_data(file))

    def remove_mongo_keys(self, data):

        if (isinstance(data, dict)):
            data.pop('_id', None)
            data.pop('__v', None)
        elif (isinstance(data, list)):
            for item in data:
                item.pop('_id', None)
                item.pop('__v', None)
        else:
            print('Unrecognized data type in remove_mongo_keys')
            return False
        return True

    def populate_users(self, json_file=None):
        success = True
        destination = self.rest_api_url + 'user/register'

        users = self.get_json_data('data/user_data/users.json')['users']

        default_password = "changeme";
        for user in users:
            user['first_name'] = user['fname']
            user['last_name'] = user['lname']
            user['password1'] = 'changeme'
            user['password2'] = 'changeme'
            user['email1'] = user['email']
            user['email2'] = user['email']
            user = json.dumps(user)
            user = user.replace("'", "'\"'\"'")
            response = self.curl_db(destination, data=user, rest_method='POST')
            if (response['success'] == False):
                if (response['errors'] != 'User already exists'):
                    print('user not created!!')
                    print('user')
                    print(user)
                    print('response')
                    print(response)
                    success = False

        return success

    def create_test_user(self):
        destination = self.rest_api_url + 'user/register'

        test_user = {
            'userid': 'tuser',
            'first_name': 'Testing',
            'last_name': 'User',
            'password1': 'tpassword',
            'password2': 'tpassword',
            'email1': 'testing.user@charter.com',
            'email2': 'testing.user@charter.com',
            'active': True
        }

        test_user = json.dumps(test_user)

        response = self.curl_db(destination, data=test_user, rest_method='POST')

        return response

    def login_test_user(self):
        self.login_user('testing.user@charter.com', 'tpassword')

    def login_user(self, email, password):
        destination = self.rest_api_url + 'user/login'

        user = {
            'email': email,
            'password': password
        }

        user = json.dumps(user)

        response = self.curl_db(destination, data=user, rest_method='POST')

        return response

    def logout_user(self):
        destination = self.rest_api_url + 'user/logout'

        response = self.curl_db(destination, rest_method='GET')

    def populate_chambers(self, json_file=None):
        destination = self.rest_api_url + 'test-chamber/'
        if json_file is None:
            json_file = 'data/chamber_data/good_documents.json'
        data = self.get_json_data(json_file)
        data = json.dumps(data)

        return self.curl_db(destination, data=data, rest_method='POST')

    def populate_queue(self, json_file=None):
        destination = self.rest_api_url + 'test-queue/'

        if json_file is None:
            json_file = 'data/queue_data/good_documents.json'

        data = self.get_json_data(json_file)
        data = data
        data = json.dumps(data)

        return self.curl_db(destination, data=data, rest_method='POST')

    def drop_users(self):
        self.db.users.delete_many({})

    def drop_chambers(self):
        self.db.test_chambers.delete_many({})

    def drop_queue(self):
        self.db.test_queue.delete_many({})

    def drop_ap_metrics(self):
        self.db.ap_metrics.delete_many({})

    def drop_ethernet_ports(self):
        self.db.ethernet_ports.delete_many({})
