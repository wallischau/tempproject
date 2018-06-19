import unittest
import json
from database_test import Database_Test

class Test_Queue_Test(unittest.TestCase, Database_Test):
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

    def create_queue(self, tests_data):
        destination = self.rest_api_url + 'test-queue/'

        data = json.dumps(tests_data)
        return self.curl_db(destination, data=data, rest_method='POST')

    def read_queue(self, query=''):
        destination = self.rest_api_url + 'test-queue' + query
        return self.curl_db(destination)

    def update_queue(self, test_id, update_data):
        destination = self.rest_api_url + 'test-queue/' + test_id

        data = json.dumps(update_data)
        
        return self.curl_db(destination, data=data, rest_method='PUT')

    def delete_queue(self, test_id):
        destination = self.rest_api_url + 'test-queue/' + test_id

        return self.curl_db(destination, rest_method='DELETE')

    def test_create_queue(self):
        # Test creating when not logged in
        response = self.populate_chambers()
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        self.create_test_user()
        self.login_test_user()

        # Test creating multiple tests with good data
        response = self.populate_queue()
        self.assertEqual(response['success'], True)

        actual_queue = response['data']
        expected_queue = json.loads(self.get_json_data_string('data/queue_data/good_documents.json'))
        for test in expected_queue:
            if test['pid'] is '':
                test['pid'] = None

        self.remove_mongo_keys(actual_queue)

        self.assertEqual(actual_queue, expected_queue)

        # Test creating multiple tests with bad data
        self.drop_queue()

        response = self.populate_queue('data/queue_data/bad_documents.json')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'ValidationError: pid: Cast to Number failed for value "mypid" at path "pid"')

        # Test creating single test with good data
        test = self.get_json_data('data/queue_data/good_document.json')
        if test['pid'] is '':
            test['pid'] = None
        response = self.create_queue(test)
        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], test)

        # Test creating single test with bad data
        test = self.get_json_data('data/queue_data/bad_document.json')
        if test['pid'] is '':
            test['pid'] = None
        response = self.create_queue(test)
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'ValidationError: pid: Cast to Number failed for value "mypid" at path "pid"')

    def test_read_queue(self):
        # Test get whole queue when empty
        response = self.read_queue()

        self.assertEqual(response['success'], True)

        actual_queue = response['data']
        expected_queue = []

        self.assertEqual(actual_queue, expected_queue)

        # Test get whole queue when populated
        self.create_test_user()
        self.login_test_user()
        self.populate_queue()
        self.assertEqual(response['success'], True)
        self.logout_user()
        
        response = self.read_queue()
        self.assertEqual(response['success'], True)
        actual_queue = response['data']
        expected_queue = json.loads(self.get_json_data_string('data/queue_data/good_documents.json'))

        self.remove_mongo_keys(actual_queue)
        for test in expected_queue:
            if test['pid'] is '':
                test['pid'] = None

        self.assertEqual(actual_queue, expected_queue)

        # Test querying of queue
        query = '?test_case=bad case'
        response = self.read_queue(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        test_name = '802.11ac Wave 2/Packet Loss/802.11ac Wave 2 - Packet Loss/Packet_loss_24_20_M15_DS'
        query = '?test_case=' + test_name + '&chamber=Z'
        response = self.read_queue(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?test_case=' + test_name + '&chamber=A'
        response = self.read_queue(query=query)
        self.assertEqual(response['success'], True)
        actual_test = response['data']
        self.remove_mongo_keys(actual_test)
        actual_test = actual_test[0]
        for test in expected_queue:
            if test['test_case'] == test_name:
                expected_test = test
                break
        self.assertEqual(actual_test, expected_test)

    def test_update_queue(self):
        self.create_test_user()
        self.login_test_user()

        response = self.populate_queue()
        self.assertEqual(response['success'], True)

        # Test updating queue when not logged in
        self.logout_user()
        
        test_name = '802.11ac Wave 2/Packet Loss/802.11ac Wave 2 - Packet Loss/Packet_loss_24_20_M15_DS'
        query = '?test_case=' + test_name
        response = self.read_queue(query)
        self.assertEqual(response['success'], True)
        test = response['data']
        self.assertEqual(len(test), 1)
        test = test[0]

        good_test = self.get_json_data('data/queue_data/good_document.json')

        response = self.update_queue(test['_id'], good_test)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test updating test with good data
        self.login_test_user()
        test_name = '802.11ac Wave 2/Packet Loss/802.11ac Wave 2 - Packet Loss/Packet_loss_24_20_M15_DS'
        query = '?test_case=' + test_name
        response = self.read_queue(query)
        self.assertEqual(response['success'], True)
        test = response['data']
        self.assertEqual(len(test), 1)
        test = test[0]

        good_test = self.get_json_data('data/queue_data/good_document.json')

        response = self.update_queue(test['_id'], good_test)

        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], good_test)

        query = '?test_case=' + good_test['test_case']
        response = self.read_queue(query)
        self.assertEqual(response['success'], True)
        test = response['data']
        self.assertEqual(len(test), 1)
        self.remove_mongo_keys(test)
        test = test[0]

        self.assertEqual(good_test, test)

        # Test updating test with bad data
        self.assertEqual(response['success'], True)

        query = '?test_case=' + good_test['test_case']
        response = self.read_queue(query)
        self.assertEqual(response['success'], True)
        test = response['data']
        self.assertEqual(len(test), 1)
        test = test[0]

        bad_test = self.get_json_data('data/queue_data/bad_document.json')

        response = self.update_queue(test['_id'], bad_test)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'CastError: Cast to number failed for value "mypid" at path "pid"')

        response = self.read_queue(query)
        self.assertEqual(response['success'], True)
        test = response['data']
        self.assertEqual(len(test), 1)
        self.remove_mongo_keys(test)
        test = test[0]

        self.assertEqual(good_test, test)

    def test_delete_queue(self):
        self.create_test_user()
        self.login_test_user()

        response = self.populate_queue()
        self.assertEqual(response['success'], True)
        actual_queue = response['data']

        # Test deleting queue when not logged in
        self.logout_user()
        
        test = {}
        test_name = '802.11ac Wave 2/Packet Loss/802.11ac Wave 2 - Packet Loss/Packet_loss_24_20_M15_US'
        for item in response['data']:
            if item['test_case'] == test_name:
                test = item
                break

        self.assertIn('_id', test)
        test_id = test['_id']

        response = self.delete_queue(test_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test deleting a test that exists
        self.login_test_user()
        test = {}
        test_name = '802.11ac Wave 2/Packet Loss/802.11ac Wave 2 - Packet Loss/Packet_loss_24_20_M15_US'
        for item in actual_queue:
            if item['test_case'] == test_name:
                test = item
                break

        self.assertIn('_id', test)
        test_id = test['_id']

        response = self.delete_queue(test_id)

        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], test)

        response = self.read_queue()
        actual_queue = response['data']
        expected_queue = json.loads(self.get_json_data_string('data/queue_data/good_documents.json'))

        for queued_test in expected_queue:
            if queued_test['pid'] is '':
                queued_test['pid'] = None

        self.remove_mongo_keys(test)
        self.remove_mongo_keys(actual_queue)
        expected_queue.remove(test)

        self.assertEqual(actual_queue, expected_queue)

        # Test deleting a test that does not exist
        response = self.delete_queue(test_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Could not find object')

        response = self.read_queue()
        actual_queue = response['data']
        self.remove_mongo_keys(actual_queue)
        self.assertEqual(actual_queue, expected_queue)

if __name__ == '__main__':
    unittest.main()