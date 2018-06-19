import argparse
import json
import os
import subprocess
import signal
import time

from tests.ixia_based_test import IxiaBasedTest

class IxVeriwaveTest(IxiaBasedTest):
    def __init__(self, test_config):
        """Inits IxVeriwaveTest with an SSH and DB REST API connection

        Args:
            test_config: dictionary with all test configuration data

        Attributes:
            output_log_file: output log file that the test writes to
        """
        super().__init__(test_config)

        self.output_log_file = None

    def _execute(self):
        """Runs a tcl file

        Builds and starts a tclsh command. Builds command based on passed in 
        arguments

        Args:
            test_config: queued test dictionary
        """

        tclsh_cmd = self._make_tcl_cmd()

        sshpass_cmd = '{} {}'.format(self.sshpass_base_cmd, tclsh_cmd)

        self.test_logger.info('sshpass command executed: {}'.format(
            sshpass_cmd))

        self.proc = subprocess.Popen(sshpass_cmd, shell=True)

        self.tcl_pid = self._get_tcl_pid()

    def _is_running(self):
        """Determines whether or not the pid is running"""
        return self.proc.poll() is None

    def _finish(self):
        self._release_ports()

    def _watch_for_cancel(self):

        # Continually watch for cancelling status
        # Kill the process when it is seen
        while True:
            # If we don't have the pid yet we cannot cancel this
            if self.tcl_pid is None:
                time.sleep(1)
                continue

            # Something went wrong retrieving the pid and we cannot cancel
            if self.tcl_pid == '':
                return

            new_test_config = self.db_rest_api.get_test_queue_doc(
                self.test_config['_id']
            )

            if ((new_test_config is not None) and 
                    (new_test_config['status'] == 'cancelling')):
                self.test_config = new_test_config
                kill_cmd = 'kill -2 {}'.format(self.tcl_pid)
                sshpass_cmd = '{} {}'.format(self.sshpass_base_cmd, kill_cmd)
                subprocess.Popen(sshpass_cmd, shell=True)
                break

            time.sleep(1)
            

def main():
    """Main function for file. Creates a IxVeriwaveTest object and attempts to 
       run a tcl file"""

    # Parse the CLI arguments.
    parser = argparse.ArgumentParser(description='Starts a IxVeriwaveTest process.')
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
        vw = IxVeriwaveTest(queued_test)
        pid = vw.execute()
    except Exception as ex:
        print(
            'Exception "{}" occurred in runnerd. Arguments:{!r}'.format(
                type(ex).__name__,
                ex.args))

if __name__ == '__main__':
    main()
