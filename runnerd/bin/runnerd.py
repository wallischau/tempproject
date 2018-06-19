#!/usr/local/bin/python3

import configparser
import datetime
import inspect
import json
import logging
import os
import random
import requests
import signal
import socketIO_client_nexus
import subprocess
import sys
import threading
import time

from db_rest_api import *
import tests

DEBUG = False

ssh_cache = None

def preexec_function():
    # Ignore the SIGINT signal by setting the handler to the standard
    # signal handler SIG_IGN.
    signal.signal(signal.SIGINT, signal.SIG_IGN)

class RunnerConfigError(Exception):
    """Exception for when the conf file is not correct"""
    pass

class RunnerD:
    """Runner Daemon class. Runs tests as specified by the test_queue 
       collection in the Mongo DB

    Attributes:
        db: database that the test_queue collection is located on.
        logger: logger for the class
    """
    def __init__(self):
        """Inits RunnerD class based on settings in ../etc/runnerd.conf file"""

        # Read configuration
        config = configparser.ConfigParser()
        current_directory = os.path.dirname(os.path.realpath(__file__))
        config_file = '{0}/../etc/runnerd.conf'.format(current_directory)
        config_file = os.path.abspath(config_file)
        config.read(config_file)

        config_keys_needed = [
            'LogDir', 'LogFile', 'RestApiUrl', 'RunInterval', 'DbEmail',
            'DbPassword'
        ]

        if 'runnerd' not in config:
            raise RunnerConfigError
        if not all(key in config['runnerd'] for key in config_keys_needed):
            raise RunnerConfigError

        self.run_interval = float(config['runnerd']['RunInterval'])

        
        self.db_rest_api = DbRestApi(config['runnerd']['RestApiUrl'],
                                     config['runnerd']['DbEmail'],
                                     config['runnerd']['DbPassword'])

        # Set up logger
        log_dir = '{0}/{1}'.format(
            current_directory,
            config['runnerd']['LogDir'])
        log_dir = os.path.abspath(log_dir)
        log_file = config['runnerd']['LogFile']
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

        self.proc_list = []
        self.exiting = False
        self.socketIO = socketIO_client_nexus.SocketIO()

        self.test_watcher_t = threading.Thread(
            target=self.watch_tests,
            daemon=True)
        self.test_watcher_t.start()

    def get_test_run(self, test_run_id):
        """Gets the test run associated with a test_run_id

        Args:
            test_run_id: ID of the test_run_id to retrieve
        """
        test_run = self.db_rest_api.get_test_run(test_run_id)

        return test_run

    def chamber_has_running_tests(self, chamber_id):
        """Returns true if a chamber has running tests

        Args:
            chamber_id: id of the chamber to check for running tests on
        """
        running_tests = self.db_rest_api.get_running_tests_for_chamber(
            chamber_id)

        tests_are_running = True if len(running_tests) > 0 else False

        return tests_are_running

    def update_chamber_to_running(self, chamber_id):
        """Updates chamber to running if possible

        Args:
            chamber_id: id of the chamber to update
        """
        response = self.db_rest_api.update_chamber_fields(
            chamber_id,
            {'status': 'running'})

        if 'success' not in response or not response['success']:
            return False
        else:
            return True

    def update_test_to_running(self, queue_id):
        """Updates a queued test status to 'running'

        Args:
            queue_id: id of the queued test to update
        """
        update = {'status': 'running'}
        response = self.db_rest_api.update_test_queue_fields(
            queue_id, update)

        if 'success' not in response:
            return False
        return response['success']

    def process_single_test(self, queued_test):
        self.logger.debug(
            'Processing pending test {}'.format(queued_test['_id']))

        # Check if we're already running a process 
        # for the same test_result.
        chamber = queued_test['topology']['chamber']
        if self.chamber_has_running_tests(chamber['_id']):
            self.logger.debug(
                ('Tests already running on chamber '
                '{}...continuing'.format(chamber['_id'])))
            return

        if not self.update_chamber_to_running(chamber['_id']):
            self.logger.debug(
                ('Could not update chamber status for chamber '
                '{}...continuing').format(chamber['_id']))
            return

        test_run = self.get_test_run(queued_test['test_run'])
        if test_run is None:
            self.logger.debug(
                ('Could not find test run '
                '{}...continuing').format(queued_test['test_run']))
            return

        test_name = queued_test.get('runner', '')
        test_class = tests.__dict__.get(test_name, None)
        if not test_class:
            self.logger.debug(
                'Cannot find "{}" test file for runnerd'.format(
                    test_file))
            return
        test_file = inspect.getfile(test_class)

        command = "/usr/bin/autPython -u {} -q '{}'".format(test_file, json.dumps(queued_test))
        proc = subprocess.Popen(command,
                                shell=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT,
                                preexec_fn=preexec_function)
        self.proc_list.append({
            'proc': proc,
            'chamber_id': queued_test['topology']['chamber']['_id']
        })

        if not self.update_test_to_running(queued_test['_id']):
            self.logger.debug('Error updating test {} to running'.format(
                queued_test['_id']))

        self.logger.debug('Ran test {} with PID {}'.format(
            queued_test['_id'],
            proc.pid))

    def watch_tests(self):
        while True:
            if len(self.proc_list) == 0 and self.exiting:
                break

            for saved_process in self.proc_list:
                proc = saved_process['proc']
                chamber_id = saved_process['chamber_id']
                if proc.poll() is not None:
                    self.proc_list.remove(saved_process)
                else:
                    bytes_pending = len(proc.stdout.peek(-1))

                    if bytes_pending != 0:
                        data = proc.stdout.read(
                            bytes_pending
                        ).decode(encoding='utf-8')

                        self.socketIO.emit(
                            'send-test-output', chamber_id, str(data)
                        )

    def run(self):
        """Main loop of the RunnerD class. 

        Continuously runs and checks for pending tests. When it finds
        pending tests it attempts to run them if no other tests are already
        running on the same chamber
        """
        # Daemon loop...
        while True:
            try:
                # self.watch_tests_old()
                # Check if we have a connection to the rest api before 
                # checking tests
                if not self.db_rest_api.is_connected():
                    self.logger.debug('No DB REST API connection')
                    time.sleep(self.run_interval)
                    continue
                # Get the queue...
                test_queue = self.db_rest_api.get_pending_tests()

                if len(test_queue) > 0:
                    self.logger.debug(
                        'Processing {} pending tests'.format(len(test_queue)))

                # Iterate through the queue...
                for queued_test in test_queue:
                    self.process_single_test(queued_test)

                time.sleep(self.run_interval)
            except requests.exceptions.ConnectionError:
                # Handle when we lose connection in the middle of processing
                # tests as well
                self.logger.debug('Lost DB REST API connection')
            except KeyboardInterrupt:
                raise KeyboardInterrupt

    def exit(self):
        self.exiting = True

def main():
    """Main function for file. Creates a RunnerD and starts it"""
    try:
        runner_d = None
        runner_d = RunnerD()
        runner_d.run()
    except RunnerConfigError:
        print('Error parsing config file in RunnerD')
    except DbRestApiLoginError:
        print('Error with DB REST API: Invalid Credentials')
    except requests.exceptions.ConnectionError:
        print('Error with DB REST API: No Connection')
    except KeyboardInterrupt:
        print('Interrupted')
    except Exception as ex:
        print(
            'Exception "{}" occurred in runnerd. Arguments:{!r}'.format(
                type(ex).__name__,
                ex.args))
    finally:
        try:
            print('Performing clean exit. Ctrl+C again to terminate')
            if runner_d:
                runner_d.exit()
                tests_remaining = len(runner_d.proc_list)
                while tests_remaining:
                    print('Waiting on {} tests'.format(tests_remaining))
                    tests_remaining = len(runner_d.proc_list)
                    time.sleep(1)
        except KeyboardInterrupt:
            print('Finished')
        except Exception as ex:
            print(
                'Exception "{}" occurred during clean exit. Arguments:{!r}'.format(
                    type(ex).__name__,
                    ex.args))

if __name__ == '__main__':
    main()
