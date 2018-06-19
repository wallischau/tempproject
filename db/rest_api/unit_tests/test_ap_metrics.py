import unittest
import json
from database_test import Database_Test

class AP_Metrics_Test(unittest.TestCase, Database_Test):
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

    def create_ap_metrics(self, metrics_data):
        destination = self.rest_api_url + 'ap-metrics/'

        data = json.dumps(metrics_data)
        return self.curl_db(destination, data=data, rest_method='POST')

    def read_ap_metrics(self, query=''):
        destination = self.rest_api_url + 'ap-metrics' + query
        return self.curl_db(destination)

    def update_ap_metrics(self, metrics_id, update_data):
        destination = self.rest_api_url + 'ap-metrics/' + metrics_id

        data = json.dumps(update_data)
        
        return self.curl_db(destination, data=data, rest_method='PUT')

    def delete_ap_metrics(self, metrics_id):
        destination = self.rest_api_url + 'ap-metrics/' + metrics_id

        return self.curl_db(destination, rest_method='DELETE')

    def test_create_ap_metrics(self):
        # Test creating single document
        expected_ap_metrics = self.get_json_data('data/ap_metrics_data/good_document.json')
        response = self.create_ap_metrics(expected_ap_metrics)

        self.assertEqual(response['success'], True)

        actual_ap_metrics = response['data']
        self.remove_mongo_keys(actual_ap_metrics)

        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

        # Test creating multiple documents
        self.drop_ap_metrics()

        expected_ap_metrics = self.get_json_data('data/ap_metrics_data/good_documents.json')
        response = self.create_ap_metrics(expected_ap_metrics)

        self.assertEqual(response['success'], True)

        actual_ap_metrics = response['data']
        self.remove_mongo_keys(actual_ap_metrics)

        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

    def test_read_chambers(self):
        self.drop_ap_metrics()
        # Test get all chambers when empty
        response = self.read_ap_metrics()

        self.assertEqual(response['success'], True)

        actual_ap_metrics = response['data']
        expected_ap_metrics = []

        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

        # Test get all chambers when populated
        expected_ap_metrics = self.get_json_data('data/ap_metrics_data/good_documents.json')
        response = self.create_ap_metrics(expected_ap_metrics)

        self.assertEqual(response['success'], True)

        response = self.read_ap_metrics()
        self.assertEqual(response['success'], True)
        actual_ap_metrics = response['data']

        self.remove_mongo_keys(actual_ap_metrics)

        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

        # Test querying of chambers
        query = '?seq_id=1234567890ABCDEFGHIJKL'
        response = self.read_ap_metrics(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?seq_id=E8D11BDAB8491515446613&type=stast'
        response = self.read_ap_metrics(query=query)
        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], [])

        query = '?seq_id=E8D11BDAB8491515446613&type=stats'
        response = self.read_ap_metrics(query=query)
        self.assertEqual(response['success'], True)
        actual_ap_metrics = response['data']
        self.remove_mongo_keys(actual_ap_metrics)
        actual_ap_metrics = actual_ap_metrics[0]
        for ap_metrics in expected_ap_metrics:
            if ap_metrics['seq_id'] == 'E8D11BDAB8491515446613':
                expected_ap_metrics = ap_metrics
                break
        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

    def test_update_ap_metrics(self):
        # Test updating AP metrics with good data
        expected_ap_metrics = self.get_json_data('data/ap_metrics_data/good_documents.json')
        response = self.create_ap_metrics(expected_ap_metrics)

        self.assertEqual(response['success'], True)

        query = '?seq_id=E8D11BDAB8491515446613'
        response = self.read_ap_metrics(query)
        self.assertEqual(response['success'], True)
        ap_metrics = response['data']
        self.assertEqual(len(ap_metrics), 1)
        ap_metrics = ap_metrics[0]

        good_ap_metrics = self.get_json_data('data/ap_metrics_data/good_document.json')

        response = self.update_ap_metrics(ap_metrics['_id'], good_ap_metrics)

        self.assertEqual(response['success'], True)
        self.remove_mongo_keys(response['data'])
        self.assertEqual(response['data'], good_ap_metrics)

        response = self.read_ap_metrics(query)
        self.assertEqual(response['success'], True)
        ap_metrics = response['data']
        self.assertEqual(len(ap_metrics), 1)
        self.remove_mongo_keys(ap_metrics)
        ap_metrics = ap_metrics[0]

        self.assertEqual(good_ap_metrics, ap_metrics)

        # Test updating ap_metrics with bad data
        self.assertEqual(response['success'], True)

        query = '?seq_id=E8D11BDAB8491515446613'
        response = self.read_ap_metrics(query)
        self.assertEqual(response['success'], True)
        ap_metrics = response['data']
        self.assertEqual(len(ap_metrics), 1)
        ap_metrics = ap_metrics[0]

        bad_ap_metrics = self.get_json_data('data/ap_metrics_data/bad_document.json')

        response = self.update_ap_metrics(ap_metrics['_id'], bad_ap_metrics)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'CastError: Cast to string failed for value "{}" at path "type"')

        response = self.read_ap_metrics(query)
        self.assertEqual(response['success'], True)
        ap_metrics = response['data']
        self.assertEqual(len(ap_metrics), 1)
        self.remove_mongo_keys(ap_metrics)
        ap_metrics = ap_metrics[0]

        self.assertEqual(good_ap_metrics, ap_metrics)

    def test_delete_ap_metrics(self):
        # Test deleting an ap_metrics that exists
        ap_metrics_data = self.get_json_data('data/ap_metrics_data/good_documents.json')
        response = self.create_ap_metrics(ap_metrics_data)

        self.assertEqual(response['success'], True)

        ap_metrics = {}
        for item in response['data']:
            if item['seq_id'] == 'E8D11BDAB8491515446613':
                ap_metrics = item
                break

        self.assertIn('_id', ap_metrics)
        metrics_id = ap_metrics['_id']

        response = self.delete_ap_metrics(metrics_id)

        self.assertEqual(response['success'], True)
        self.assertEqual(response['data'], ap_metrics)

        response = self.read_ap_metrics()
        actual_ap_metrics = response['data']
        expected_ap_metrics = json.loads(self.get_json_data_string('data/ap_metrics_data/good_documents.json'))

        self.remove_mongo_keys(ap_metrics)
        self.remove_mongo_keys(actual_ap_metrics)
        expected_ap_metrics.remove(ap_metrics)

        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

        # Test deleting an ap_metrics that does not exist

        response = self.delete_ap_metrics(metrics_id)

        self.assertEqual(response['success'], False)
        self.assertEqual(response['errors'], 'Could not find object')

        response = self.read_ap_metrics()
        actual_ap_metrics = response['data']
        self.remove_mongo_keys(actual_ap_metrics)
        self.assertEqual(actual_ap_metrics, expected_ap_metrics)

if __name__ == '__main__':
    unittest.main()