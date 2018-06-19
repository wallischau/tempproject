import datetime
import os
import subprocess
import threading
import time

from db_rest_api import DbRestApi
from tests.generic_test import GenericTest
import parsers

# VW Server Information
VW_IP_ADDR = '10.0.39.6'
VW_USERNAME = 'appworker'
VW_PASSWORD = '@utoUs3r'
VW_AUTO = '/automation/VCL_APIs/7.3.3/automation/bin/vw_auto.tcl'

class IxiaBasedTest(GenericTest):
    def __init__(self, test_config):
        """Inits IxVeriwaveTest with an SSH and DB REST API connection

        Args:
            test_config: dictionary with all test configuration data

        Attributes:
            sshpass_base_cmd: basic sshpass command for running commands
            vw_auto: vw_auto.tcl full file path
        """
        super().__init__(test_config)

        self.sshpass_base_cmd = 'sshpass -p {} ssh -T {}@{}'.format(
            VW_PASSWORD, VW_USERNAME, VW_IP_ADDR)

        self.vw_auto = VW_AUTO
        self.tcl_pid = None

    def _make_vars_dict(self):
        """Makes a dictionary with the tcl vars
        """
        tcl_vars = {}
        tcl_vars['chassis_ip'] = self._get_24_ip()
        tcl_vars['card_24_ip'] = self._get_24_ip_string()
        tcl_vars['card_5_ip'] = self._get_5_ip_string()
        tcl_vars['card_eth_ip'] = self._get_eth_ip_string()
        tcl_vars['card_eth_2_ip'] = tcl_vars['card_eth_ip']
        tcl_vars['vendor_name'] = self._get_dut_company()
        tcl_vars['vendor_model'] = self._get_dut_model()
        tcl_vars['vendor_firmware'] = self._get_dut_firmware_name()
        tcl_vars['num_24_antennas'] = self._get_num_ant_24()
        tcl_vars['num_5_antennas'] = self._get_num_ant_5()
        tcl_vars['test_list'] = self._get_test_case()
        tcl_vars['ssid_24'] = self._get_ssid_24()
        tcl_vars['ssid_5'] = self._get_ssid_5()
        tcl_vars['chamber_name'] = 'Chamber_{}'.format(self._get_chamber_name())

        ipv6_tcl = '/mnt/wifi_vol/SMART/test_suites/ixia/ipv6_defaults.tcl'
        tcl_vars['ipv6_defaults_tcl'] = ipv6_tcl

        return tcl_vars

    def _make_tcl_cmd(self, test_file=None, base_directory=None, named_directory=None, output_log_file=None):
        """Makes a tclsh command"""
        if test_file is None:
            test_file = self.test_config['test_file']
        if base_directory is None:
            base_directory = self.timestamp_directory
        if named_directory is None:
            named_directory = self._get_test_case()
        if output_log_file is None:
            output_log_file = '{}/output.log'.format(self.test_result_directory)

        # Build variable list.
        vars_dict = self._make_vars_dict()

        tcl_vars = ''
        for key, val in vars_dict.items():
            if key == 'test_list':
                tcl_vars = '{0} --var {1} "{2}"'.format(tcl_vars, key, val)
            else:
                tcl_vars = '{0} --var {1} {2}'.format(tcl_vars, key, val)

        tcl_vars = '{0} --var {1} {2}'.format(
            tcl_vars,
            'logs_dir',
            base_directory)

        # Build command.
        tclsh_cmd = 'tclsh {}'.format(self.vw_auto)
        tclsh_cmd += ' -f {}'.format(test_file)
        tclsh_cmd += ' -i {}'.format(named_directory)
        tclsh_cmd += ' -o {}'.format(output_log_file)
        tclsh_cmd += ' --nodut'

        if self.test_type == 'packet_capture':
            tclsh_cmd += ' --savepcaps'

        tclsh_cmd += ' {}'.format(tcl_vars.strip())
        tclsh_cmd += ''
        return tclsh_cmd

    def _get_tcl_pid(self):
        get_pid_cmd = (
            "ps aux | grep SMART | grep Chamber_{} ".format(
                self._get_chamber_name()
            ) +
            "| grep -v grep | awk '{print $2}'"
        )

        sshpass_cmd = '{} {}'.format(self.sshpass_base_cmd, get_pid_cmd)

        get_pid_proc = subprocess.run(
            sshpass_cmd,
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT)
        tcl_pid = get_pid_proc.stdout.decode()
        return tcl_pid

    def _release_ports(self):
        """Releases ixveriwave ports"""
        card_config = self._get_card_config()
        for card in card_config:
            card_info = card_config[card]
            ip = card_info['ip']
            slot = card_info['slot']
            port = card_info['port']
            success = self.db_rest_api.release_port(ip, slot, port)
            if not success:
                self.test_logger.error(
                    'Error releasing port: {}:{}:{}'.format(ip, slot, port))
