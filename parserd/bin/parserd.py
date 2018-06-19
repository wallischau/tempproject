#!/usr/local/bin/python3

import configparser
import logging
import os
import sys
import time

import parsers


controllers = os.path.abspath('../../controllers')
sys.path.append(controllers)

from db_rest_api import *

class ParserConfigError(Exception):
    """Exception for when the conf file is not correct"""
    pass

class ParserD:
    """Parser Daemon class. Parses test results from the various *_results
       collections in the Mongo DB

    Attributes:
        db: database that the test_queue collection is located on.
        logger: logger for the class
    """
    def __init__(self):
        """Inits ParserD class based on settings in ../etc/parserd.conf file"""

        # Read configuration
        config = configparser.ConfigParser()
        current_directory = os.path.dirname(os.path.realpath(__file__))
        config_file = '{0}/../etc/parserd.conf'.format(current_directory)
        config_file = os.path.abspath(config_file)
        config.read(config_file)

        config_keys_needed = ['LogDir', 'LogFile', 'RestApiUrl', 'RunInterval',
            'DbEmail', 'DbPassword']

        if 'parserd' not in config:
            raise ParserConfigError
        if not all(key in config['parserd'] for key in config_keys_needed):
            raise ParserConfigError

        self.run_interval = int(config['parserd']['RunInterval'])

        
        self.db_rest_api = DbRestApi(config['parserd']['RestApiUrl'],
                                     config['parserd']['DbEmail'],
                                     config['parserd']['DbPassword'])

        # Set up logger
        log_dir = '{0}/{1}'.format(
            current_directory,
            config['parserd']['LogDir'])
        log_dir = os.path.abspath(log_dir)
        log_file = config['parserd']['LogFile']
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

    def parse_results_for_type(self, test_type):
        tests_to_parse = self.db_rest_api.get_pre_parsed_results(test_type)
        if (len(tests_to_parse) > 0):
            self.logger.debug(
                'Processing {} {} tests'.format(
                    len(tests_to_parse), test_type))

        for result_doc in tests_to_parse:
            self.logger.debug(
                'Processing {} test: {}'.format(
                    test_type,
                    result_doc['_id']))
            parser_name = result_doc.get('runner', '')
            parser_class = parsers.__dict__.get(parser_name, None)

            if not parser_class:
                self.logger.debug(
                    'Could not find {} parser class for parserd'.format(
                        parser_name))
                continue

            parser_obj = parser_class()

            directory = result_doc.get('directory', '')
            test_case = result_doc.get('test_name')
            test_dir = os.path.join(directory, test_case)
            try:
                test_results = parser_obj.get_results(test_dir, test_type)
                results_update = {
                    'data': test_results['processed'],
                    'errors': test_results['errors'],
                    'results_parsed': True
                }
            except Exception as ex:
                exception_string = '"{}" exception. Arguments: {!r}'.format(
                    type(ex).__name__,
                    ex.args)
                self.logger.debug(
                    'Exception occurred when processing {} '.format(test_type) +
                    'result document: {}:'.format(result_doc['_id']))
                self.logger.debug(exception_string)
                results_update = {
                    'errors': [exception_string],
                    'results_parsed': True
                }

            try:
                update_success = self.db_rest_api.update_test_result(
                    result_doc['_id'],
                    test_type,
                    results_update
                )

                if update_success:
                    self.logger.debug(
                        'Result document {} updated successfully'.format(
                            result_doc['_id']))
                else:
                    self.logger.debug(
                        'Error updating result document {}'.format(
                            result_doc['_id']))
            except Exception as ex:
                self.logger.debug(
                    'Exception occurred when updating {} '.format(test_type) +
                    'result document: {}:'.format(result_doc['_id']))
                self.logger.debug(
                    '"{}" exception. Arguments:{!r}'.format(
                        type(ex).__name__, ex.args))

    def parse_results(self):
        test_types = [
            'latency', 'max_client', 'mixed_client', 'multicast_video',
            'near_far', 'packet_capture', 'packet_loss', 'rate_vs_range',
            'realworld_qoe', 'reuse_of_airtime', 'tcp_goodput', 'triple_play',
            'udp_throughput', 'unicast_video', 'wmm_power_save']

        while True:
            try:
                for test_type in test_types:
                    self.parse_results_for_type(test_type)
                time.sleep(self.run_interval)
            except requests.exceptions.ConnectionError:
                # Handle when we lose connection in the middle of processing
                # tests as well
                self.logger.debug('Lost DB REST API connection')
            except KeyboardInterrupt:
                raise KeyboardInterrupt



def main():
    """Main function for file. Creates a ParserD and starts it"""
    try:
        parser_d = ParserD()
        parser_d.parse_results()
    except ParserConfigError:
        print('Error parsing config file in ParserD')
    except DbRestApiLoginError:
        print('Error with DB REST API: Invalid Credentials')
    except requests.exceptions.ConnectionError:
        print('Error with DB REST API: No Connection')
    except KeyboardInterrupt:
        print('Interrupted')

if __name__ == '__main__':
    main()
