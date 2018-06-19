#!/bin/python3

import sys
import re
import sys
import datetime
import time
import os
import argparse
import json
import platform
import configparser
import logging

try:
    import paramiko
except Exception as e:
  
    regex = r"'([A-Za-z]+)'"

    result = re.search(regex, str(e))
    library = result.group(1)

    sys.stderr.write(
        'ERROR: Library "{}" was not found\r\n\r\n'.format(library) +
        'Please run "pip install {}"\r\n'.format(library)
    )

    exit()

# Add the 'controllers' folder so the rest of our code can access ssh control
controllers = os.path.abspath('../../controllers')
sys.path.append(controllers)

import reapers

from db_rest_api import *

# Constants
CONFIG_FILE = 'config.json'
DIRECTORY_DEFAULT = '.'
NAS_DRIVE_ADDRESS = '96.37.189.6'  
RESULTS_BASE = '/mnt/wifi_vol/SMART/test_results'

DIRECTORY_OVERRIDE = {
    'prod': '/etc/smart/reaperd'
}

class ReaperConfigError(Exception):
    """Exception for when the conf file is not correct"""
    pass

class ReaperD:
    """Reaper Daemon class. Runs tests as specified by the test_queue 
       collection in the Mongo DB

    Attributes:
        db_rest_api: database that the test_queue collection is located on.
        logger: logger for the class
    """
    def __init__(self):
        """Inits ReaperD class based on settings in ../etc/reaperd.conf file"""

        # Read configuration
        config = configparser.ConfigParser()
        current_directory = os.path.dirname(os.path.realpath(__file__))
        config_file = '{0}/../etc/reaperd.conf'.format(current_directory)
        config_file = os.path.abspath(config_file)
        config.read(config_file)

        config_keys_needed = [
            'LogDir', 'LogFile', 'RestApiUrl', 'RunInterval', 'DbEmail',
            'DbPassword'
        ]

        if 'reaperd' not in config:
            raise ReaperConfigError
        if not all(key in config['reaperd'] for key in config_keys_needed):
            raise ReaperConfigError

        self.run_interval = int(config['reaperd']['RunInterval'])

        
        self.db_rest_api = DbRestApi(config['reaperd']['RestApiUrl'],
                                     config['reaperd']['DbEmail'],
                                     config['reaperd']['DbPassword'])

        # Set up logger
        log_dir = '{0}/{1}'.format(
            current_directory,
            config['reaperd']['LogDir'])
        log_dir = os.path.abspath(log_dir)
        log_file = config['reaperd']['LogFile']
        full_log_file = '{0}/{1}'.format(log_dir, log_file)
        full_log_file = os.path.abspath(full_log_file)

        if not os.path.exists(log_dir):
            os.makedirs(log_dir)
        class_name = type(self).__name__
        self.logger = logging.getLogger(__name__)
        fh = logging.FileHandler(full_log_file)
        formatter_string = ('%(asctime)s - %(levelname)s'
                            ' - {0}'
                            ' - %(message)s').format(class_name)
        formatter = logging.Formatter(formatter_string)
        fh.setFormatter(formatter)
        self.logger.addHandler(fh)
        self.logger.setLevel(logging.DEBUG)
  
    def set_test_status(self, test, status, msg=''):
      
      
        id = test['_id']

        if status == 'done':
            self.db_rest_api.delete_test(id)
        else:
            update = {'status': status}
            if msg:
                update['msg'] = msg
            self.db_rest_api.update_test_queue_fields(id, update)

    def process_test(self, test):
        '''
        Processes a single test; determines whether or not we should clean up
        '''
        reaper_name = test.get('runner', '')
        pid = test.get('pid', 0)

        test_param = test.get('test_case', '').split('/')
        test_type = test.get('test_type', '').lower().replace(' ', '_')
        test_case = test.get('test_case', '')

        test_run_id = test.get('test_run', '')
        test_run = self.db_rest_api.get_test_run(test_run_id)
        directory = test.get('directory', '')
        timestamp_dir = test.get('timestamp', '')
        test_dir = os.path.join(directory, timestamp_dir, test_case)

        suite_name = test.get('test_suite', '')
        prd = self.db_rest_api.get_test_suite(suite_name)
        if prd is None:
            self.logger.debug(
                'Could not find associated test_suite for prd {}'.format(
                    suite_name))
            return
        
        prd = prd['_id']

        reaper_class = reapers.__dict__.get(reaper_name, None)

        if not reaper_class:
            msg = 'Cannot find "{}" reaper class for reaperd'.format(reaper_name)
            self.set_test_status(test, 'error', msg)
            return

        reaper_obj = reaper_class()

        if reaper_obj.is_pid_running(pid):
            # PID is still active. We do not have to do anything
            return

        result_doc = {
            'test_name': test['test_case'],
            'test_run': test_run['_id'],
            'data': {},
            'errors': [],
            'legacy': False,
            'directory': test['directory'] + '/' + test['timestamp'],
            'prd': prd,
            'test_start': test['test_start'],
            'test_end': str(datetime.datetime.now()),
            'results_parsed': False,
            'runner': test['runner']
        }

        result = self.db_rest_api.insert_test_result(test_type, result_doc)

        if result is None:
            msg = 'Could not create result document'
            self.set_test_status(test, 'error', msg)
            return

        test_run_update = {
            'test_results': test_run['test_results'] or {}
        }

        if test_type not in test_run_update['test_results']:
            test_run_update['test_results'][test_type] = []

        test_run_update['test_results'][test_type].append(result['_id'])
        chamber_update = None

        # Set test end time if this is the last one
        if not self.db_rest_api.run_has_more_tests(test['test_run']):
            test_run_update['test_end'] = str(datetime.datetime.now())
            chamber_update = {'status': 'reserved'}

        result = self.db_rest_api.update_test_run_fields(
            test_run['_id'],
            test_run_update)

        if 'success' not in result or not result['success']:
            msg = 'Could not update test run'
            self.set_test_status(test, 'error', msg)
            return

        if chamber_update:
            result = self.db_rest_api.update_chamber_fields(
                test['topology']['chamber']['_id'],
                chamber_update)
            if 'success' not in result or not result['success']:
                msg = 'Could not update chamber status'
                self.set_test_status(test, 'error', msg)
                return

        self.set_test_status(test, 'done')
        # self.db_rest_api.update_test_queue_fields(test['_id'], {'status': 'done'})
      
    def check_db(self):
        '''
        Checks database for any running tests and then will perform a pid check
        '''
        tests = self.db_rest_api.get_running_tests()

        for test in tests:
            pid = test.get('pid', 0)
            status = test.get('status', '')

            self.logger.debug(' >> processing pid {}...'.format(pid, status))
            self.process_test(test)
      
      
    def reap(self):
        '''
        Starts the reaper loop
        '''
        self.logger.debug(
            '\r\n'
            'Reaperd successfully initialized (interval: {}s)'.format(
                self.run_interval) +
            '\r\n'
        )

        while True:
            try:
                if not self.db_rest_api.is_connected():
                    self.logger.debug('No DB connection. Continuing...')
                    time.sleep(self.run_interval)
                    continue
                self.check_db()
                time.sleep(self.run_interval)
            except requests.exceptions.ConnectionError:
                self.logger.debug('Lost DB REST API connection. Continuing...')
                time.sleep(self.run_interval)

    def welcome_msg(self):
        '''
        Prints out a welcome message
        '''
        self.logger.debug('Welcome to reaperd!')
        self.logger.debug('The time is: {}\r\n'.format(datetime.datetime.now()))
      
    
if __name__ == '__main__':
    '''
    Only execute this script if it is being run directly
    '''
    try:
        reaper_d = ReaperD()
        reaper_d.reap()
    except ReaperConfigError:
        print('Error parsing config file in ReaperD')
    except DbRestApiLoginError:
        print('Error with DB REST API: Invalid Credentials')
    except requests.exceptions.ConnectionError:
        print('Error with DB REST API: No Connection')
    except KeyboardInterrupt:
        print('Reaperd will now shutdown...')
