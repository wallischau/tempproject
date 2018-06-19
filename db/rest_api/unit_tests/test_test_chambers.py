import unittest
import json
from database_test import Database_Test

class Test_Chambers_Test(unittest.TestCase, Database_Test):
    @classmethod
    def setUpClass(cls):
        cls.rest_api_url = 'http://localhost:8080/v1/'
        cls.setup(cls)
        cls.drop_database(cls)

    @classmethod
    def tearDownClass(cls):
        cls.drop_database(cls)

    def setUp(self):
        self.drop_database()

    def create_chambers(self, chamber_data):
        destination = self.rest_api_url + 'test-chamber/'

        data = json.dumps(chamber_data)
        return self.curl_db(destination, data=data, rest_method='POST')

    def read_chambers(self, query=''):
        destination = self.rest_api_url + 'test-chamber' + query
        return self.curl_db(destination)

    def update_chambers(self, chamber_id, update_data):
        destination = self.rest_api_url + 'test-chamber/' + chamber_id

        data = json.dumps(update_data)
        
        return self.curl_db(destination, data=data, rest_method='PUT')

    def delete_chambers(self, chamber_id):
        destination = self.rest_api_url + 'test-chamber/' + chamber_id

        return self.curl_db(destination, rest_method='DELETE')

    def reserve_chamber(self, chamber, user):
        destination = self.rest_api_url + 'test-chamber/reserve'

        data = json.dumps({'chamber': chamber, 'userid': user})
        return self.curl_db(destination, data=data, rest_method='POST')

    def release_chamber(self, chamber):
        destination = self.rest_api_url + 'test-chamber/release'

        data = json.dumps({'chamber': chamber})
        return self.curl_db(destination, data=data, rest_method='POST')

    def test_create_chambers(self):
        # Test creating when not logged in
        response = self.populate_chambers()
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        self.create_test_user()
        self.login_test_user()

        # Test creating multiple chambers with good data
        response = self.populate_chambers()

        self.assertEqual(response['success'], True)

        actual_chambers = response['data']
        expected_chambers = json.loads(self.get_json_data_string('data/chamber_data/good_documents.json'))

        self.remove_mongo_keys(actual_chambers)

        self.assertEqual(actual_chambers, expected_chambers)

        # Test creating multiple chambers with bad data
        self.drop_chambers()

        response = self.populate_chambers('data/chamber_data/bad_documents.json')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'ValidationError: type: Cast to String failed for value "{}" at path "type"')

        # Test creating single chamber with good data
        chamber = self.get_json_data('data/chamber_data/good_document.json')
        response = self.create_chambers(chamber)
        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], chamber)

        # Test creating single chamber with bad data
        chamber = self.get_json_data('data/chamber_data/bad_document.json')
        response = self.create_chambers(chamber)
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'ValidationError: type: Cast to String failed for value "{}" at path "type"')

    def test_read_chambers(self):
        # Test get all chambers when empty
        response = self.read_chambers()

        self.assertEqual(response['success'], True)

        actual_chambers = response['data']
        expected_chambers = []

        self.assertEqual(actual_chambers, expected_chambers)

        # Test get all chambers when populated
        self.create_test_user()
        self.login_test_user()
        self.populate_chambers()
        self.assertEqual(response['success'], True)
        self.logout_user()
        
        response = self.read_chambers()
        self.assertEqual(response['success'], True)
        actual_chambers = response['data']
        expected_chambers = json.loads(self.get_json_data_string('data/chamber_data/good_documents.json'))

        self.remove_mongo_keys(actual_chambers)

        self.assertEqual(actual_chambers, expected_chambers)

        # Test querying of chambers
        query = '?name=Z'
        response = self.read_chambers(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?name=A&dut.make=bad make'
        response = self.read_chambers(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?name=A&dut.make=Askey'
        response = self.read_chambers(query=query)
        self.assertEqual(response['success'], True)
        actual_chamber = response['data']
        self.remove_mongo_keys(actual_chamber)
        actual_chamber = actual_chamber[0]
        for chamber in expected_chambers:
            if chamber['name'] == 'A':
                expected_chamber = chamber
                break
        self.assertEqual(actual_chamber, expected_chamber)

    def test_update_chambers(self):
        self.create_test_user()
        self.login_test_user()

        response = self.populate_chambers()
        self.assertEqual(response['success'], True)

        # Test updating chamber when not logged in
        self.logout_user()
        query = '?name=A'
        response = self.read_chambers(query)
        self.assertEqual(response['success'], True)
        chamber = response['data']
        self.assertEqual(len(chamber), 1)
        chamber = chamber[0]

        good_chamber = self.get_json_data('data/chamber_data/good_document.json')

        response = self.update_chambers(chamber['_id'], good_chamber)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test updating chamber with good data
        self.login_test_user()

        response = self.read_chambers(query)
        self.assertEqual(response['success'], True)
        chamber = response['data']
        self.assertEqual(len(chamber), 1)
        chamber = chamber[0]

        good_chamber = self.get_json_data('data/chamber_data/good_document.json')

        response = self.update_chambers(chamber['_id'], good_chamber)

        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], good_chamber)

        response = self.read_chambers(query)
        self.assertEqual(response['success'], True)
        chamber = response['data']
        self.assertEqual(len(chamber), 1)
        self.remove_mongo_keys(chamber)
        chamber = chamber[0]

        self.assertEqual(good_chamber, chamber)

        # Test updating chamber with bad data
        self.assertEqual(response['success'], True)

        query = '?name=A'
        response = self.read_chambers(query)
        self.assertEqual(response['success'], True)
        chamber = response['data']
        self.assertEqual(len(chamber), 1)
        chamber = chamber[0]

        bad_chamber = self.get_json_data('data/chamber_data/bad_document.json')

        response = self.update_chambers(chamber['_id'], bad_chamber)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'CastError: Cast to string failed for value "{}" at path "type"')

        response = self.read_chambers(query)
        self.assertEqual(response['success'], True)
        chamber = response['data']
        self.assertEqual(len(chamber), 1)
        self.remove_mongo_keys(chamber)
        chamber = chamber[0]

        self.assertEqual(good_chamber, chamber)

    def test_delete_chambers(self):
        self.create_test_user()
        self.login_test_user()

        response = self.populate_chambers()
        self.assertEqual(response['success'], True)
        actual_chambers = response['data']

        # Test deleting chamber when not logged in
        self.logout_user()
        chamber = {}
        for item in actual_chambers:
            if item['name'] == 'D':
                chamber = item
                break

        self.assertIn('_id', chamber)
        chamber_id = chamber['_id']

        response = self.delete_chambers(chamber_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test deleting a chamber that exists
        self.login_test_user()
        chamber = {}
        for item in actual_chambers:
            if item['name'] == 'D':
                chamber = item
                break

        self.assertIn('_id', chamber)
        chamber_id = chamber['_id']

        response = self.delete_chambers(chamber_id)

        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], chamber)

        response = self.read_chambers()
        actual_chambers = response['data']
        expected_chambers = json.loads(self.get_json_data_string('data/chamber_data/good_documents.json'))

        self.remove_mongo_keys(chamber)
        self.remove_mongo_keys(actual_chambers)
        expected_chambers.remove(chamber)

        self.assertEqual(actual_chambers, expected_chambers)

        # Test deleting a chamber that does not exist

        response = self.delete_chambers(chamber_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Could not find object')

        response = self.read_chambers()
        actual_chambers = response['data']
        self.remove_mongo_keys(actual_chambers)
        self.assertEqual(actual_chambers, expected_chambers)

    def test_reserve_chambers(self):
        response = self.populate_users()
        self.assertEqual(response, True)

        self.create_test_user()
        self.login_test_user()

        response = self.populate_chambers()
        self.assertEqual(response['success'], True)

        # Test reserving chamber when not logged in
        self.logout_user()
        response = self.reserve_chamber('Z', 'dgolke')

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test non-existent chamber
        self.login_test_user()
        response = self.reserve_chamber('Z', 'dgolke')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Chamber Z does not exist')

        # Test non-existent user
        response = self.reserve_chamber('A', 'bgolke')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'User bgolke does not exist')

        # Test good case
        response = self.reserve_chamber('A', 'dgolke')
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data']['reserved_by'], 'dgolke')

        # Test already reserved
        response = self.reserve_chamber('A', 'kzucker')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Chamber A is already reserved')

    def test_release_chambers(self):
        response = self.populate_users()
        self.assertEqual(response, True)

        self.create_test_user()
        self.login_test_user()

        response = self.populate_chambers()
        self.assertEqual(response['success'], True)

        # Test reserving chamber when not logged in
        self.logout_user()
        response = self.release_chamber('A')

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Permission denied')

        # Test not reserved
        self.login_test_user()
        response = self.release_chamber('A')
        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Chamber A is not reserved')

        # Test reserved
        response = self.reserve_chamber('A', 'dgolke')
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data']['reserved_by'], 'dgolke')

        response = self.release_chamber('A')
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data']['reserved_by'], None)

if __name__ == '__main__':
    unittest.main()