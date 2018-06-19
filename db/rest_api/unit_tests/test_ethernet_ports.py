import unittest
import json
from database_test import Database_Test

class Ethernet_Ports_Test(unittest.TestCase, Database_Test):
    @classmethod
    def setUpClass(cls):
        cls.rest_api_url = 'http://localhost:8080/v1/'
        cls.setup(cls)
        cls.drop_database(cls)

    @classmethod
    def tearDownClass(cls):
        result = cls.drop_database(cls)

    def setUp(self):
        self.drop_database()

    def create_ethernet_ports(self, ethernet_port_data):
        destination = self.rest_api_url + 'ethernet-port/'

        data = json.dumps(ethernet_port_data)
        return self.curl_db(destination, data=data, rest_method='POST')

    def read_ethernet_ports(self, query=''):
        destination = self.rest_api_url + 'ethernet-port' + query
        return self.curl_db(destination)

    def update_ethernet_ports(self, ethernet_port_id, update_data):
        destination = self.rest_api_url + 'ethernet-port/' + ethernet_port_id

        data = json.dumps(update_data)
        
        return self.curl_db(destination, data=data, rest_method='PUT')

    def delete_ethernet_ports(self, ethernet_port_id):
        destination = self.rest_api_url + 'ethernet-port/' + ethernet_port_id

        return self.curl_db(destination, rest_method='DELETE')

    def reserve_ethernet_ports(self, chamber, quantity):
        destination = self.rest_api_url + 'ethernet-port/reserve'

        data = json.dumps({'chamber': chamber, 'qty': quantity})
        return self.curl_db(destination, data=data, rest_method='POST')

    def release_ethernet_ports(self, chamber):
        destination = self.rest_api_url + 'ethernet-port/release'

        data = json.dumps({'chamber': chamber})
        return self.curl_db(destination, data=data, rest_method='POST')

    def test_create_ethernet_ports(self):
        # Test creating when not logged in
        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        self.create_test_user()
        self.login_test_user()

        # Test creating multiple ethernet_ports with good data
        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)

        self.assertEqual(response['success'], True)

        actual_ethernet_ports = response['data']

        self.remove_mongo_keys(actual_ethernet_ports)

        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

        # Test creating multiple ethernet_ports with bad data
        self.drop_ethernet_ports()

        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/bad_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'ValidationError: port: Cast to String failed for value "{}" at path "port"')

        # Test creating single ethernet_port with good data
        ethernet_port = self.get_json_data('data/ethernet_ports_data/good_document.json')
        response = self.create_ethernet_ports(ethernet_port)
        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], ethernet_port)

        # Test creating single ethernet_port with bad data
        ethernet_port = self.get_json_data('data/ethernet_ports_data/bad_document.json')
        response = self.create_ethernet_ports(ethernet_port)
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'ValidationError: port: Cast to String failed for value "{}" at path "port"')

    def test_read_ethernet_ports(self):
        # Test get all ethernet_ports when empty
        response = self.read_ethernet_ports()

        self.assertEqual(response['success'], True)

        actual_ethernet_ports = response['data']
        expected_ethernet_ports = []

        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

        # Test get all ethernet_ports when populated
        self.create_test_user()
        self.login_test_user()

        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)

        self.assertEqual(response['success'], True)
        self.logout_user()
        
        response = self.read_ethernet_ports()
        self.assertEqual(response['success'], True)
        actual_ethernet_ports = response['data']

        self.remove_mongo_keys(actual_ethernet_ports)

        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

        # Test querying of ethernet_ports
        query = '?card_serial=kgjwi-1234'
        response = self.read_ethernet_ports(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?card_serial=kgjwi-2156&chassis_ip=1234'
        response = self.read_ethernet_ports(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?card_serial=kgjwi-2156&chassis_ip=gfkfksjkeg'
        response = self.read_ethernet_ports(query=query)
        self.assertEqual(response['success'], True)
        actual_ethernet_port = response['data']
        self.remove_mongo_keys(actual_ethernet_port)
        actual_ethernet_port = actual_ethernet_port[0]
        for ethernet_port in actual_ethernet_ports:
            if ethernet_port['card_serial'] == 'kgjwi-2156':
                expected_ethernet_port = ethernet_port
                break
        self.assertEqual(actual_ethernet_port, expected_ethernet_port)

    def test_update_ethernet_ports(self):
        self.create_test_user()
        self.login_test_user()

        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)
        self.assertEqual(response['success'], True)

        # Test updating ethernet ports when not logged in
        self.logout_user()
        
        query = '?card_serial=kgjwi-2156'
        response = self.read_ethernet_ports(query)
        self.assertEqual(response['success'], True)
        ethernet_port = response['data']
        self.assertEqual(len(ethernet_port), 1)
        ethernet_port = ethernet_port[0]

        good_ethernet_port = self.get_json_data('data/ethernet_ports_data/good_document.json')

        response = self.update_ethernet_ports(ethernet_port['_id'], good_ethernet_port)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test updating ethernet_port with good data
        self.login_test_user()
        query = '?card_serial=kgjwi-2156'
        response = self.read_ethernet_ports(query)
        self.assertEqual(response['success'], True)
        ethernet_port = response['data']
        self.assertEqual(len(ethernet_port), 1)
        ethernet_port = ethernet_port[0]

        good_ethernet_port = self.get_json_data('data/ethernet_ports_data/good_document.json')

        response = self.update_ethernet_ports(ethernet_port['_id'], good_ethernet_port)

        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], good_ethernet_port)

        response = self.read_ethernet_ports(query)
        self.assertEqual(response['success'], True)
        ethernet_port = response['data']
        self.assertEqual(len(ethernet_port), 1)
        self.remove_mongo_keys(ethernet_port)
        ethernet_port = ethernet_port[0]

        self.assertEqual(good_ethernet_port, ethernet_port)

        # Test updating ethernet_port with bad data
        self.assertEqual(response['success'], True)

        response = self.read_ethernet_ports(query)
        self.assertEqual(response['success'], True)
        ethernet_port = response['data']
        self.assertEqual(len(ethernet_port), 1)
        ethernet_port = ethernet_port[0]

        bad_ethernet_port = self.get_json_data('data/ethernet_ports_data/bad_document.json')

        response = self.update_ethernet_ports(ethernet_port['_id'], bad_ethernet_port)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'CastError: Cast to string failed for value "{}" at path "port"')

        response = self.read_ethernet_ports(query)
        self.assertEqual(response['success'], True)
        ethernet_port = response['data']
        self.assertEqual(len(ethernet_port), 1)
        self.remove_mongo_keys(ethernet_port)
        ethernet_port = ethernet_port[0]

        self.assertEqual(good_ethernet_port, ethernet_port)

    def test_delete_ethernet_ports(self):
        self.create_test_user()
        self.login_test_user()

        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)
        self.assertEqual(response['success'], True)
        actual_ethernet_ports = response['data']

        # Test deleting ethernet ports when not logged in
        self.logout_user()
        
        ethernet_port = {}
        for item in response['data']:
            if item['card_serial'] == 'kgjwi-2156':
                ethernet_port = item
                break

        self.assertIn('_id', ethernet_port)
        ethernet_port_id = ethernet_port['_id']

        response = self.delete_ethernet_ports(ethernet_port_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test deleting a ethernet_port that exists
        self.login_test_user()
        ethernet_port = {}
        for item in actual_ethernet_ports:
            if item['card_serial'] == 'kgjwi-2156':
                ethernet_port = item
                break

        self.assertIn('_id', ethernet_port)
        ethernet_port_id = ethernet_port['_id']

        response = self.delete_ethernet_ports(ethernet_port_id)

        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], ethernet_port)

        response = self.read_ethernet_ports()
        actual_ethernet_ports = response['data']

        self.remove_mongo_keys(ethernet_port)
        self.remove_mongo_keys(actual_ethernet_ports)
        expected_ethernet_ports.remove(ethernet_port)

        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

        # Test deleting a ethernet_port that does not exist

        response = self.delete_ethernet_ports(ethernet_port_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Could not find object')

        response = self.read_ethernet_ports()
        actual_ethernet_ports = response['data']
        self.remove_mongo_keys(actual_ethernet_ports)
        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

    def test_reserve_ethernet_ports(self):
        self.create_test_user()
        self.login_test_user()

        response = self.populate_chambers()
        self.assertEqual(response['success'], True)

        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)
        self.assertEqual(response['success'], True)

        # Test reserving ethernet ports when not logged in
        self.logout_user()
        
        response = self.reserve_ethernet_ports('Z', '4')

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Chamber Z does not exist')

        # Test non-existent chamber
        self.login_test_user()

        response = self.reserve_ethernet_ports('Z', '4')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Chamber Z does not exist')

        # Test enough ethernet ports available
        response = self.reserve_ethernet_ports('A', '4')
        self.assertEqual(response['success'], True)
        self.assertEqual(len(response['data']), 4)
        expected_ethernet_ports = expected_ethernet_ports[:-3]
        for port in expected_ethernet_ports:
            port['reserved_by_chamber'] = 'A'
        actual_ethernet_ports = response['data']
        self.remove_mongo_keys(actual_ethernet_ports)
        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

        # Test not enough ethernet ports available
        response = self.reserve_ethernet_ports('A', '4')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Not enough ports available')

    def test_release_ethernet_ports(self):
        self.create_test_user()
        self.login_test_user()

        response = self.populate_chambers()
        self.assertEqual(response['success'], True)

        expected_ethernet_ports = self.get_json_data('data/ethernet_ports_data/good_documents.json')
        response = self.create_ethernet_ports(expected_ethernet_ports)
        self.assertEqual(response['success'], True)

        # Test reserving ethernet ports when not logged in
        self.logout_user()
        
        response = self.release_ethernet_ports('A')

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test no ports reserved by chamber
        self.login_test_user()
        response = self.release_ethernet_ports('A')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Chamber A has no ports reserved')

        # Test ports reserved by chamber
        response = self.reserve_ethernet_ports('A', '4')
        self.assertEqual(response['success'], True)

        response = self.release_ethernet_ports('A')
        self.assertEqual(response['success'], True)
        self.assertEqual(len(response['data']), 4)
        expected_ethernet_ports = expected_ethernet_ports[:-3]
        actual_ethernet_ports = response['data']
        self.remove_mongo_keys(actual_ethernet_ports)
        self.assertEqual(actual_ethernet_ports, expected_ethernet_ports)

if __name__ == '__main__':
    unittest.main()