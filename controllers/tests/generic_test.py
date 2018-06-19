import datetime
import logging
import os
import sys
import threading
import time

from db_rest_api import DbRestApi
from tests.test import Test
import parsers

# DB REST API Information
REST_API_URL = 'https://localhost/v1'
DB_EMAIL = 'runner.daemon@charter.com'
DB_PASSWORD = 'drunner'

BASE_RESULTS_DIR = '/mnt/wifi_vol/SMART/test_results/'

class GenericTest(Test):
    def __init__(self, test_config):
        """Inits GenericTest with a DB REST API connection

        Args:
            test_config: dictionary with all test configuration data

        Attributes:
            db_rest_api: DbRestApi instance for database interactions
            proc: process of the sshpass command running the test
            test_config: dictionary with all test configuration data
            test_type_directory: directory for the test type results
            test_result_directory: directory for the test result
            test_run_directory: directory for the test run
            test_type: type of the test. Ex: packet_loss
            timestamp_directory: timestamp string for results directory
            results: test results
            test_run: test run dictionary
            test_result: test result dictionary
            parser: results parser object
        """
        self.test_config = test_config

        self.db_rest_api = DbRestApi(REST_API_URL,
                                     DB_EMAIL,
                                     DB_PASSWORD)

        self.test_type = self._get_test_type().lower().replace(' ', '_')

        self.test_run_directory = self._get_run_results_dir()

        self._update_test_run()
        if self.test_run is None:
            raise Exception(
                'TEST INIT ERROR: '
                'Test Run {} not found'.format(self.test_config['test_run']))
            return
        self.test_type_directory = self._get_test_type_dir()
        self.timestamp_directory = '{}/{}'.format(
            self.test_type_directory, self._make_timestamp()
        )
        self.test_result_directory = '{}/{}'.format(
            self.timestamp_directory,
            self._get_test_case()
        )

        self._initialize_test_logger()

        self.test_logger.info('Initializing GenericTest...')

        self.results = {}

        if not self.test_config:
            self.test_logger.error('TEST INIT ERROR: Queued test config not found!')
            return

        # Common controller instances needed by all tests

        self.proc = None

        if not self._initialize_parser():
            self.test_logger.error(
                'TEST INIT ERROR: Could not create parser class')
            return

        self.test_result = self._create_results_doc_base()
        if not self.test_result:
            self.test_logger.error(
                'TEST INIT ERROR: '
                'Error creating test result for {}'.format(
                    self.test_config['_id'])
            )
            return

        if not self._link_test_result_to_run():
            self.test_logger.error(
                'TEST INIT ERROR: '
                'Error linking test result {} to test run {}'.format(
                    self.test_result['_id'],
                    self.test_run['_id']
                )
            )
            return

        if not self._link_test_result_to_queue():
            self.test_logger.error(
                'TEST INIT ERROR: '
                'Error linking test result {} to test queue item {}'.format(
                    self.test_result['_id'],
                    self.test_config['_id']
                )
            )
            return

    def _initialize_parser(self):
        parser_name = self.test_config.get('runner')
        parser_class = parsers.__dict__.get(parser_name, None)
        if not parser_class:
            self.test_logger.error(
                'Cannot find "{}" parser class for test'.format(
                    parser_name))
            return False
        self.parser = parser_class()
        return True

    def _initialize_test_logger(self):
        log_name = class_name = type(self).__name__ + 'Output'

        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(filename)s - %(funcName)s - %(message)s'
        )
        self.test_logger = logging.getLogger(log_name)

        log_filename = '{}/{}.log'.format(
            self.test_result_directory,
            log_name
        )
        directory = os.path.dirname(log_filename)
        if not os.path.exists(directory):
            os.makedirs(directory)
        
        file_handler = logging.FileHandler(log_filename)
        file_handler.setFormatter(formatter)
        self.test_logger.addHandler(file_handler)

        console_handler = logging.StreamHandler(sys.stdout)
        console_handler.setFormatter(formatter)
        self.test_logger.addHandler(console_handler)

        self.test_logger.setLevel(logging.DEBUG)

    #############################
    # COMMON TEST FUNCTIONALITY #
    #############################
    
    def execute(self):
        if not self._set_test_start_time():
            self.test_logger.error(
                'Error setting the test start time for test_result {}'.format(
                    self.test_result['_id']))
            return None

        self.cancel_watcher_t = threading.Thread(
            target=self._watch_for_cancel,
            daemon=True)
        self.cancel_watcher_t.start()

        try:
            self._execute()
        except Exception as ex:
            self.test_logger.error(
                'Error occurred during execution of test: {}'.format(ex)
            )

        self._wait_for_finish()

    def _wait_for_finish(self):
        while self._is_running():
            time.sleep(1)
            pass

        self._set_test_end_times()

        self._update_test_to_done()

        self._parse_results()

        self._finish()

    def _execute(self):
        raise NotImplementedError('GenericTest::_execute must be overridden!')

    def _is_running(self):
        raise NotImplementedError('GenericTest::_is_running must be overridden!')

    def _finish(self):
        raise NotImplementedError('GenericTest::_finish must be overridden!')

    def _watch_for_cancel(self):
        raise NotImplementedError('GenericTest::_watch_for_cancel must be overriden!')

    def _get_topology(self):
        """Gets the topology field for a queued test"""
        return self.test_config.get('topology', {})

    def _get_chamber(self):
        """Gets the chamber field for a queued test"""
        return self._get_topology().get('chamber', {})

    def _get_chamber_name(self):
        """Gets the chamber name field for a queued test"""
        return self._get_chamber().get('name');

    def _get_card_config(self):
        """Gets the card_config field for a queued test"""
        return self._get_chamber().get('card_config', {})

    def _get_24_card_config(self):
        """Gets the wifi_24_GHz card config field for a queued test
        """
        return self._get_card_config().get('wifi_24_GHz', {})

    def _get_24_ip(self):
        """Gets the wifi_24_GHz ip field for a queued test"""
        return self._get_24_card_config().get('ip')

    def _get_24_slot(self):
        """Gets the wifi_24_GHz slot field for a queued test"""
        return self._get_24_card_config().get('slot')

    def _get_24_port(self):
        """Gets the wifi_24_GHz port field for a queued test"""
        return self._get_24_card_config().get('port')

    def _get_24_ip_string(self):
        """Generates and returns the wifi_24_GHz ip string for a queued test"""
        ip = self._get_24_ip()
        slot = self._get_24_slot()
        port = self._get_24_port()
        return '{}:{}:{}'.format(ip, slot, port)

    def _get_5_card_config(self):
        """Gets the wifi_5_GHz card config field for a queued test"""
        return self._get_card_config().get('wifi_5_GHz', {})

    def _get_5_ip(self):
        """Gets the wifi_5_GHz ip field for a queued test"""
        return self._get_5_card_config().get('ip')

    def _get_5_slot(self):
        """Gets the wifi_5_GHz slot field for a queued test"""
        return self._get_5_card_config().get('slot')

    def _get_5_port(self):
        """Gets the wifi_5_GHz port field for a queued test"""
        return self._get_5_card_config().get('port')

    def _get_5_ip_string(self):
        """Generates and returns the wifi_5_GHz ip string for a queued test"""
        ip = self._get_5_ip()
        slot = self._get_5_slot()
        port = self._get_5_port()
        return '{}:{}:{}'.format(ip, slot, port)

    def _get_eth_card_config(self):
        """Gets the ethernet card config field for a queued test"""
        return self._get_card_config().get('ethernet', {})

    def _get_eth_ip(self):
        """Gets the ethernet ip field for a queued test"""
        return self._get_eth_card_config().get('ip')

    def _get_eth_slot(self):
        """Gets the ethernet slot field for a queued test"""
        return self._get_eth_card_config().get('slot')

    def _get_eth_port(self):
        """Gets the ethernet port field for a queued test"""
        return self._get_eth_card_config().get('port')

    def _get_eth_ip_string(self):
        """Generates and returns the ethernet ip string for a queued test"""
        ip = self._get_eth_ip()
        slot = self._get_eth_slot()
        port = self._get_eth_port()
        return '{}:{}:{}'.format(ip, slot, port)

    def _get_dut(self):
        """Gets the dut field for a queued test"""
        return self._get_chamber().get('dut', {})

    def _get_dut_mac_address(self):
        """Gets the mac address field for a queued test"""
        return self._get_dut().get('mac_address')

    def _get_dut_firmware(self):
        """Gets the dut firmware field for a queued test"""
        return self._get_dut().get('firmware', {})

    def _get_dut_company(self):
        """Gets the dut company field for a queued test"""
        return self._get_dut_firmware().get('company')

    def _get_dut_model(self):
        """Gets the dut model_name field for a queued test"""
        return self._get_dut_firmware().get('model_name')

    def _get_dut_firmware_name(self):
        """Gets the firmware name field for a queued test"""
        return self._get_dut_firmware().get('name')

    def _get_dut_capabilities(self):
        """Gets the dut capabilities field for a queued test"""
        return self._get_dut_firmware().get('capabilities', {})

    def _get_num_ant_24(self):
        """Gets the ant_tx_24 field for a queued test"""
        return int(
            self._get_dut_capabilities().get('ant_tx_24', 0))

    def _get_num_ant_5(self):
        """Gets the ant_tx_5 field for a queued test"""
        return int(self._get_dut_capabilities().get('ant_tx_5', 0))

    def _get_ssid_24(self):
        """Gets the ssid_24 field for a queued test"""
        return self._get_topology().get('ssid_24')

    def _get_ssid_5(self):
        """Gets the ssid_5 field for a queued test"""
        return self._get_topology().get('ssid_5')

    def _get_test_type(self):
        """Gets the test type for a queued test"""
        return self.test_config.get('test_type')

    def _get_test_case(self):
        """Gets the test case for a queued test"""
        return self.test_config.get('test_case')

    def _get_run_results_dir(self):
        """Generates and returns the results directory for a queued test"""
        run_results_dir = BASE_RESULTS_DIR
        run_results_dir += self._get_dut_company()
        run_results_dir += '/{}'.format(self._get_dut_model())
        run_results_dir += '/{}'.format(
            self._get_dut_firmware_name())
        return run_results_dir

    def _get_test_type_dir(self):
        """Updates all fields for queued test prior to excecuting it"""
        test_results_dir = self.test_run_directory
        test_results_dir += '/{}'.format(
            self.test_type)

        return test_results_dir

    def _update_test_run(self):
        """Updates all fields for test run prior to excecuting it"""
        update = {}
        
        self.test_run = self.db_rest_api.get_test_run(self.test_config['test_run'])
        if self.test_run is None:
            return False

        if self.test_run['directory'] is None:
            update['directory'] = self.test_run_directory

        if self.test_run['test_start'] is None:
            update['test_start'] = self._get_utcnow_string()

        if update == {}:
            return True

        response = self.db_rest_api.update_test_run_fields(
            self.test_run['_id'],
            update)

        if 'success' not in response:
            return False

        self.test_run = response['data']
        return response['success']

    def _make_timestamp(self):
        # timestamp = datetime.datetime.utcnow()
        timestamp = self.test_run['test_start']
        date_string = str(timestamp).split('T')[0].strip().replace('-', '')
        time_string = str(timestamp).split('T')[1].split('.')[0]
        time_string = time_string.strip().replace(':', '')
        timestamp = '{0}_{1}'.format(date_string, time_string)
        return timestamp

    def _get_utcnow_string(self):
        return (str(datetime.datetime.utcnow()) + 'Z')

    def _create_results_doc_base(self):
        """Creates the base results document for the queued test"""
        suite_name = self.test_config.get('test_suite')
        prd = self.db_rest_api.get_test_suite(suite_name)

        if prd is None:
            self.test_logger.error(
                'Could not find associated test_suite for prd {}'.format(
                    suite_name))
            return None

        result_doc = {
            'test_name': self.test_config['test_case'],
            'test_run': self.test_config['test_run'],
            'data': None,
            'errors': [],
            'legacy': False,
            'directory': None,
            'prd': prd['_id'],
            'test_start': None,
            'test_end': None,
            'results_parsed': False,
            'runner': self.test_config['runner']
        }

        response = self.db_rest_api.insert_test_result(self.test_type, result_doc)
        if 'success' not in response or not response['success']:
            return None

        return response['data']

    def _link_test_result_to_run(self):
        """Links the test result with the test run"""
        test_run_update = {
            'test_results': self.test_run['test_results'] or {}
        }

        if self.test_type not in test_run_update['test_results']:
            test_run_update['test_results'][self.test_type] = []

        test_run_update['test_results'][self.test_type].append(
            self.test_result['_id'])

        response = self.db_rest_api.update_test_run_fields(
            self.test_run['_id'],
            test_run_update)

        if 'success' not in response or not response['success']:
            return False

        self.test_run = response['data']
        return True

    def _link_test_result_to_queue(self):
        """Updates the queued test with the test result id"""
        update = {
            'test_result': self.test_result['_id']
        }

        response = self.db_rest_api.update_test_queue_fields(
            self.test_config['_id'],
            update)

        if 'success' not in response or not response['success']:
            return False

        self.test_config = response['data']
        return True

    def _set_test_start_time(self):
        """Sets the test start time for a test result

        Args:
            test_result: test result dictionary
        """
        update = {
            'test_start': self._get_utcnow_string(),
            'directory': self.test_result_directory
        }

        response = self.db_rest_api.update_test_result(
            self.test_result['_id'],
            self.test_type,
            update)

        if 'success' not in response or not response['success']:
            return False
        self.test_result = response['data']
        return True

    def _set_test_result_end(self):
        """Updates test result end time"""
        update = {
            'test_end': self._get_utcnow_string()
        }

        response = self.db_rest_api.update_test_result(
            self.test_result['_id'],
            self.test_type,
            update)
        if 'success' not in response or not response['success']:
            return False
        self.test_result = response['data']
        return True

    def _set_test_run_end(self):
        """Updates test run end time"""
        if self.db_rest_api.run_has_more_tests(self.test_run['_id']):
            return True

        update = {
            'test_end': self._get_utcnow_string()
        }

        response = self.db_rest_api.update_test_run_fields(
            self.test_run['_id'],
            update)
        if 'success' not in response or not response['success']:
            return False
        self.test_run = response['data']
        return True

    def _set_test_end_times(self):
        """Updates all test end times"""
        success = True
        if not self._set_test_result_end():
            self.test_logger.error(
                'Error updating end time for test result {}'.format(
                    self.test_result['_id']))
            success = False
        if not self._set_test_run_end():
            self.test_logger.error(
                'Error updating end time for test run {}'.format(
                    self.test_run['_id']))
            success = False
        return success

    def _update_test_to_done(self):
        """Updates queued test to 'done' status if there are more tests left
           Otherwise clears all tests out"""

        if not self.db_rest_api.run_has_more_tests(self.test_run['_id']):
            return self._update_run_to_done()

        update = {
            'status': 'done'
        }
        response = self.db_rest_api.update_test_queue_fields(
            self.test_config['_id'],
            update)

        if 'success' not in response or not response['success']:
            self.test_logger.error('Error updating test {} to done'.format(
                self.test_config['_id']))
            return False

        self.test_config = response['data']
        return True

    def _update_run_to_done(self):
        """Updates test run to done and removes queued items"""

        delete_query = {
            'test_run': self.test_run['_id']
        }

        response = self.db_rest_api.delete_multiple_tests(delete_query)

        if 'success' not in response or not response['success']:
            self.test_logger.error('Error clearing test queue for test run {}'.format(
                self.test_run['_id']))
            return False

        chamber_update = {
            'status': 'reserved'
            # 'status': 'done'
        }

        response = self.db_rest_api.update_chamber_fields(
            self.test_config['topology']['chamber']['_id'],
            chamber_update)

        if 'success' not in response or not response['success']:
            self.test_logger.error(
                'Error updating chamber status for test run {}'.format(
                    self.test_run['_id']))
            return False

        return True

    def _parse_results(self):
        """Parses the results and update the test result record with the data"""
        directory = self.test_result.get('directory')
        test_case = self.test_result.get('test_name')
        result_directory = os.path.join(directory, test_case)

        try:
            self.results = self.parser.get_results(
                directory,
                self.test_type,
                test_case
            )
            results_update = {
                'data': self.results['processed'],
                'errors': self.results['errors'],
                'results_parsed': True
            }
        except Exception as ex:
            exception_string = '"{}" exception. Arguments: {!r}'.format(
                type(ex).__name__,
                ex.args)
            self.test_logger.error(
                'Exception occurred when processing {} '.format(
                    self.test_type) +
                'result document: {}:'.format(self.test_result['_id']))
            self.test_logger.error(exception_string)
            results_update = {
                'errors': [exception_string],
                'results_parsed': True
            }

        try:
            response = self.db_rest_api.update_test_result(
                self.test_result['_id'],
                self.test_type,
                results_update
            )
            update_success = True
            if 'success' not in response or not response['success']:
                update_success = False

            if update_success:
                self.test_logger.info(
                    'Result document {} updated successfully'.format(
                        self.test_result['_id']))
            else:
                self.test_logger.error(
                    'Error updating result document {}'.format(
                        self.test_result['_id']))
        except Exception as ex:
            self.test_logger.error(
                'Exception occurred when updating {} '.format(self.test_type) +
                'result document: {}:'.format(self.test_result['_id']))
            self.test_logger.error(
                '"{}" exception. Arguments:{!r}'.format(
                    type(ex).__name__, ex.args))
