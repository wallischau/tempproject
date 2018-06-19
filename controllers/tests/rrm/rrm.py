import argparse
import csv
import datetime
import json
import logging
import os
import pytz
import re
import subprocess
import sys
import time

from pymongo import MongoClient

from ssh import SSHClient
from tests.ixia_based_test import IxiaBasedTest

from tests.rrm.rrm_objects import APInfoObject, DumpSlice, IxiaObject, Interface, Station

class RrmTest(IxiaBasedTest):
    def __init__(self, test_config):
        """Inits IxVeriwaveTest with an SSH and DB REST API connection

        Args:
            test_config: dictionary with all test configuration data

        Attributes:
            ssh: ssh connection for interacting with vw server
        """
        super().__init__(test_config)

        self._initialize_rrm_mongo_db()
        self.cancelling = False

    def _get_current_collection(self):
        """Sets the collection we care about for the RRM MongoDB"""
        base_str = 'wifiCollection_'
        date_string = str(datetime.datetime.utcnow()).split(' ')[0].split('-')
        date_string = ''.join(date_string)
        collection_name = base_str + date_string
        return collection_name

    def _set_mac_address(self):
        # B0:EA:BC:C3:B5:EC
        self.mac_address = self._get_dut_mac_address()
        return (self.mac_address is not None)

    def _initialize_rrm_mongo_db(self):
        db_ip = '10.0.39.158'
        rrm_mongo_client = MongoClient('mongodb://{}:27017/'.format(db_ip))
        self.rrm_db = rrm_mongo_client['charter']

    def _minutes_to_seconds(self, minutes):
        return minutes * 60

    def _get_ap_meta_data(self, freshness_limit=30, timeout_limit=60):
        collection = self.rrm_db['devices']
        start_time = datetime.datetime.utcnow()
        while True:
            if self.cancelling:
                return None

            current_time = datetime.datetime.utcnow()
            device_docs = list(collection.find({'lineId': self.mac_address}))
            if (len(device_docs) == 0):
                self.test_logger.error(
                    'No devices found in RRM MongoDB devices ' + 
                    'collection with MAC Address {}'.format(self.mac_address)
                )
                return None
            elif (len(device_docs) > 1):
                self.test_logger.error(
                    'Multiple devices found in RRM MongoDB devices ' + 
                    'collection with MAC Address {}'.format(self.mac_address)
                )
                return None

            device_doc = device_docs[0]

            document_age = abs(
                (device_doc['lastUploadTimestamp'] -
                    current_time).total_seconds()
            )

            if document_age <= self._minutes_to_seconds(freshness_limit):
                return device_doc

            elapsed_time = abs(
                (current_time - start_time).total_seconds()
            )

            if elapsed_time > self._minutes_to_seconds(timeout_limit):
                self.test_logger.error(
                    'Could not find recent device document for ' + 
                    'MAC Address  {} in RRM MongoDB '.format(self.mac_address) +
                    'within fifteen minutes'
                )
                return None

            self.test_logger.info('[+] Did not find new upload snoozing.....')
            self.test_logger.info(
                '[+] Last upload was {0}'.format(
                    device_doc['lastUploadTimestamp']
                )
            )
            time.sleep(60)

    def _wait_for_latest_upload(self):
        ap_meta_data = self._get_ap_meta_data(freshness_limit=30)
        return ap_meta_data is not None

    def _sync_time(self):
        collection = self.rrm_db[self._get_current_collection()]

        # Query most recent document in the collection for our mac_address
        # while only pulling out the timstamp field of the operational 
        # array field
        most_recent_doc = list(
            collection.find(
                {'$and': [
                    {'lineId': self.mac_address},
                    {'operational': {'$exists': True}}
                ]},
                {'operational.timestamp': 1}
            ).sort([('_id', -1)]).limit(1)
        )[0]
        # Get timestamp out of the doc
        time_to_go_off = most_recent_doc['operational'][-1]['timestamp']

        first_pass = True
        while True:
            if self.cancelling:
                return
            return

            current_time = datetime.datetime.utcnow()
            time_diff = current_time - time_to_go_off
            seconds_alignment = int(time_diff.total_seconds() %
                                  self._minutes_to_seconds(15))
            if (seconds_alignment <= 7) and (seconds_alignment >= 1):
                self.test_logger.info("Time to go off: {0}".format(time_to_go_off))
                self.test_logger.info("Time Now: {0}".format(datetime.datetime.utcnow()))
                break
            else:
                if (seconds_alignment % 60) == 0 or first_pass:
                    minutes_remaining = 15 - int(seconds_alignment / 60)
                    if minutes_remaining == 15:
                        minutes_remaining = 0
                    self.test_logger.info(
                        'Waiting on time sync, {} minutes remaining'.format(
                            minutes_remaining
                        )
                    )
                    first_pass = False
                time.sleep(1)

    def _copy_sample_files(self):
        import shutil
        old_test_dir = '/mnt/wifi_vol/SMART/test_results/Ubee/RAC2V1U/1.0.0.13/rrm/20180606_125121/RRM/1'
        new_test_dir = '{}/1'.format(self.test_result_directory)
        try:
            shutil.copytree(old_test_dir, new_test_dir)
        except FileExistsError:
            pass


    def _run_tcl_files(self):
        slice_in_seconds = self._minutes_to_seconds(15)

        tcl_directory = '/mnt/wifi_vol/SMART/test_suites/rrm/tcl_files'
        tcl_file_names = [
            'RRM_L_2',
            # 'RRM_M_2',
            # 'RRM_H_2',
            # 'RRM_L_5',
            # 'RRM_M_5',
            # 'RRM_H_5'
        ]

        first_run = True
        for run_iter in range(1,2):
            for file_name in tcl_file_names:
                if self.cancelling:
                    return

                if not first_run:
                    self._sync_time()

                tcl_file = '{}/{}.tcl'.format(tcl_directory, file_name)
                self.test_logger.info('Running tcl file {}'.format(tcl_file))
                iteration_result_directory = '{}/{}'.format(
                    self.test_result_directory,
                    run_iter
                )
                tclsh_cmd = self._make_tcl_cmd(
                    test_file=tcl_file,
                    base_directory=iteration_result_directory,
                    named_directory=file_name,
                    output_log_file='{}/{}/output.log'.format(
                        iteration_result_directory,
                        file_name
                    )
                )
                sshpass_cmd = '{} {}'.format(self.sshpass_base_cmd, tclsh_cmd)
                self.test_logger.info('sshpass command executed: {}'.format(
                    sshpass_cmd))

                start = datetime.datetime.now()
                self.proc = subprocess.Popen(sshpass_cmd, shell=True)
                self.tcl_pid = self._get_tcl_pid()
                while self._is_running():
                    pass

    def _write_ap_meta_data_file(self, ap_meta_data):
        output_file = '{}/ApMetaData.json'.format(self.test_result_directory)
        with open(output_file, 'w') as file:
            json.dump(ap_meta_data, file, default=str)

    def _execute(self):
        """Runs the rrm test cases"""
        if not self._set_mac_address():
            self.test_logger.error('DUT does not have MAC Address configured')
            return

        if self.cancelling:
            return
        
        # First things first check if the last upload for the device is 
        # relanavt within 5 minutes but can change
        # Got the MetaData now time to match it up
        self.test_logger.info('[+] Attempting to fill in Meta Data for the AP')
        ap_meta_data = self._get_ap_meta_data()
        if ap_meta_data is None:
            self.test_logger.error(
                'Could not find AP Meta Data in RRM MongoDB ' + 
                'for MAC Address'.format(self.mac_address)
            )
            return

        self._write_ap_meta_data_file(ap_meta_data)

        if self.cancelling:
            return

        ap_meta_data_obj = APInfoObject(self.mac_address, ap_meta_data)
        self.test_logger.info(
            '[+] MetaData for AP filled in [+]\n\t' +
            str(ap_meta_data_obj).replace('\n', '\n\t')
        )
        # If running form the jump server add a section here for kicking off the ixia tests that later get parsed
        self.test_logger.info('[+] Kicking off Ixia Tests [+]')

        if self.cancelling:
            return

        # Need to check the time diff before kicking off tests to make sure they match on timestamp
        self._sync_time()
        self.test_logger.info('[+] Finished aligning time and kicking off now [+]')
        if self.cancelling:
            return

        # self._run_tcl_files()
        self._copy_sample_files()
        self.test_logger.info('[+] Ixia tests have finished one way or another [+]')
        if self.cancelling:
            return

        # Make sure the data is there for the parser
        self._wait_for_latest_upload()

    def _is_running(self):
        """Returns if the test is running or not."""
        if self.proc is None:
            return False
        return self.proc.poll() is None

    def _finish(self):
        self._release_ports()

    def _watch_for_cancel(self):

        # Continually watch for cancelling status
        # Kill the process when it is seen
        while True:
            new_test_config = self.db_rest_api.get_test_queue_doc(
                self.test_config['_id']
            )

            if ((new_test_config is None) or
                (new_test_config['status'] != 'cancelling')):
                continue

            self.cancelling = True
            self.test_config = new_test_config

            # If we don't have the pid yet we cannot cancel this
            if self.tcl_pid is None:
                time.sleep(1)
                continue

            # Something went wrong retrieving the pid and we cannot cancel
            if self.tcl_pid == '':
                time.sleep(1)
                continue

            kill_cmd = 'kill -2 {}'.format(self.tcl_pid)
            sshpass_cmd = '{} {}'.format(self.sshpass_base_cmd, kill_cmd)
            subprocess.Popen(sshpass_cmd, shell=True)
            self.tcl_pid = None

            time.sleep(1)

def main():
    """Main function for file. Creates a RrmTest object and attempts to 
       run the test cases"""

    # Parse the CLI arguments.
    parser = argparse.ArgumentParser(description='Starts a RrmTest process.')
    parser.add_argument('-q',
                        '--queued_test',
                        required=True,
                        help='Queued test dictionary file or string')
    args = parser.parse_args()

    # Start the process and return the pid
    try:
        # config_dict = json.loads(args.vars)
        queued_test = args.queued_test
        if os.path.isfile(queued_test):
            queued_test = json.load(open(queued_test))
        else:
            queued_test = json.loads(queued_test)
        rrm_test = RrmTest(queued_test)
        pid = rrm_test.execute()
    except Exception as ex:
        print(
            'Exception "{}" occurred in runnerd. Arguments:{!r}'.format(
                type(ex).__name__,
                ex.args))

if __name__ == '__main__':
    main()
