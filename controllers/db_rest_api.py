import datetime
import json
import requests
import urllib3

from controller import Controller

class DbConnectionError(Exception):
    """Exception for when the connection is refused"""
    pass
class DbRestApiLoginError(Exception):
    """Exception for when the init fails on this class"""
    pass

class DbRestApi(Controller):
    """DB Rest API class. Performs all interactions with the DB Rest API

    Attributes:
        db: database that the test_queue collection is located on.
        logger: logger for the class
        error_logged: dict used to track which errors have already been logged 
                      to minimize logging
    """

    def __init__(self, url, email, password):
        """Inits the DbRestApi class"""
        self.log.info('Initializing')

        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

        self.session = requests.Session()
        self.url = url
        login_url = self.url + '/user/login'

        user = {
            'email': email,
            'password': password
        }

        response = self.session.post(login_url, json=user, verify=False)
        response = json.loads(response.text)

        if 'success' not in response or response['success'] == False:
            self.logger.debug('Error initializing')
            self.logger.debug('response: {}'.format(response))
            raise DbRestApiLoginError

        self.log.info('Successfully initialized')

    def is_connected(self):
        try:
            response = self.session.get(self.url, verify=False)
            return True
        except KeyboardInterrupt:
            raise KeyboardInterrupt
        except:
            return False

    def get_pending_tests(self):
        """Gets all tests from test_queue with 'pending' status"""
        query = self.url + '/test-queue?status=pending'

        response = self.session.get(query, verify=False)

        response = json.loads(response.text)

        if 'success' not in response:
            return []

        return response['data']

    def get_running_tests(self):
        """Gets all tests from test_queue with 'running' status"""
        query = self.url + '/test-queue?status=running'

        response = self.session.get(query, verify=False)

        response = json.loads(response.text)

        if 'success' not in response:
            return []

        return response['data']

    def run_has_more_tests(self, test_run_id):
        """Checks if a specified run id has more tests

        Args:
            test_run_id: id of the run to check
        """
        query = self.url + '/test-queue?status=pending&test_run={}'.format(test_run_id)

        response = self.session.get(query, verify=False)

        response = json.loads(response.text)

        if 'success' not in response:
            return True

        return len(response['data']) > 0

    def get_test_run(self, test_run_id):
        """Gets the test run associated with a test_run_id

        Args:
            test_run_id: ID of the test_run_id to retrieve
        """
        query = '{}/test-runs/{}'.format(self.url, test_run_id)

        response = self.session.get(query, verify=False)
        response = json.loads(response.text)
        test_run = None

        if (('success' not in response) or
            (not response['success'])):
            test_run = None
        else:
            test_run = response['data']

        return test_run

    def get_test_suite(self, suite_name):
        """Gets the test suite

        Args:
            suite_name: name of the test suite to get
        """
        query = '{}/test-suite?name={}'.format(self.url, suite_name)

        response = self.session.get(query, verify=False)
        response = json.loads(response.text)
        test_suite = None

        if (('success' not in response) or
            (len(response['data']) == 0) or
            (len(response['data']) > 1)):
            test_suite = None
        else:
            test_suite = response['data'][0]

        return test_suite

    def get_running_tests_for_chamber(self, chamber_id):
        """Returns true if a chamber has running tests

        Args:
            chamber_id: ID of chamber to check for running tests on
        """
        tests_are_running = False
        
        query = self.url
        query += '/test-queue?topology.chamber._id={}'.format(chamber_id)
        query += '&status=running'

        running_tests = self.session.get(query, verify=False)
        running_tests = json.loads(running_tests.text)

        if 'success' not in running_tests:
            running_tests = []
        else:
            running_tests = running_tests['data']
        return running_tests

    def get_test_queue_doc(self, queued_test_id):
        """Retrieves a test queue item by id

        Args:
            queued_test_id: id of the queued test to get
        """
        url = self.url + '/test-queue/' + str(queued_test_id)
        response = self.session.put(url, verify=False)
        response = json.loads(response.text)

        if 'success' not in response or not response['success']:
            return None
        else:
            return response['data']

    def update_test_queue_fields(self, queued_test_id, update):
        """Updates fields for a queued test

        Args:
            queued_test_id: id of the queued test to update
            update: dictionary with field updates
        """
        url = self.url + '/test-queue/' + str(queued_test_id)
        response = self.session.put(url, json=update, verify=False)
        return json.loads(response.text)

    def delete_test(self, queued_test_id):
        """Deletes a queued test from the collection

        Args:
            queued_test_id: id of the queued test to delete
        """
        url = self.url + '/test-queue/' + str(queued_test_id)
        response = self.session.delete(url, verify=False)
        return json.loads(response.text)

    def delete_multiple_tests(self, query):
        """Deletes queued tests matching a query

        Args:
            query: query dictionary to search on
        """
        url = self.url + '/test-queue/'
        response=self.session.delete(url, json=query, verify=False)
        return json.loads(response.text)

    def update_test_run_fields(self, test_run_id, update):
        """Updates fields for a test run

        Args:
            test_run_id: id of the test run to update
            update: dictionary with field updates
        """
        url = self.url + '/test-runs/' + str(test_run_id)
        response = self.session.put(url, json=update, verify=False)
        return json.loads(response.text)

    def update_chamber_fields(self, chamber_id, update):
        """Updates fields for a chamber

        Args:
            chamber_id: id of the chamber to update
            update: dictionary with field updates
        """
        url = self.url + '/test-chamber/' + str(chamber_id)
        response = self.session.put(url, json=update, verify=False)
        return json.loads(response.text)

    def insert_test_result(self, test_type, result_doc):
        """Inserts a test result into the test results collection

        Args:
            test_type: type of the test to insert
            result_doc: document to insert
        """
        url = self.url + '/test-results/'
        insertion = {
            'testType': test_type,
            'resultDoc': result_doc
        }
        response = self.session.post(url, json=insertion, verify=False)
        response = json.loads(response.text)
        return response

    def update_test_result(self, result_id, test_type, update):
        """Updates test results for a given test type

        Args:
            result_id: id of the test result to update
            test_type: type of the test to update
            update: update to apply
        """
        url = self.url + '/test-results/' + str(result_id)
        update = {
            'testType': test_type,
            'update': update
        }
        response = self.session.put(url, json=update, verify=False)
        response = json.loads(response.text)
        return response

    def get_pre_parsed_results(self, test_type):
        """Gets test results for a test type that haven't yet been processed

        Args:
            test_type: type of the test to query
        """
        url = self.url + '/test-results?testType=' + test_type
        url += '&results_parsed=false'
        response = self.session.get(url, verify=False)
        response = json.loads(response.text)
        if 'success' not in response:
            return []

        if not response['success']:
            return []
        return response['data']

    def release_port(self, ip, slot, port):
        """Releases a port on a given ip and slot"""
        url = self.url + '/release-ports?ip={}&slot={}&port={}'.format(
            ip,
            slot,
            port)

        response = self.session.get(url, verify=False)
        response = json.loads(response.text)
        if 'success' not in response:
            return False

        return response['success']
