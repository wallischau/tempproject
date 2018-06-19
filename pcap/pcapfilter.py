#!/usr/bin/python3

import argparse
import subprocess

class PCAP:
    '''
    an object to filter data out of a pcap
    '''
    def __init__(self, captureFilename):
        self.captureFilename = captureFilename
        self.tshark_exe = 'tshark'

    def filter(self, inputFilename, ssid, fieldFilter='fields.dat', outputFormat='json', outputFilename=None, isVerbose=False):
        '''
        filter the capture file tied to this instance
        :param inputFileName: a file containing fields to extract from the pacp
        :param fieldFilter: (optional) additional fields to extract (list or comma separated str)
        :param outputFormat: the output format to pass to tshark -T option (pdml|ps|psml|json|ek|text|fields)
        :param outputFileName: (optional) a file to save tshark output to
        :param isVerbose: boolean, enable debug logging
        :return: str - stdout from the tshark command
        '''
        try:

            extractOption = ''
            if fieldFilter:
                # convert string to list, if necessary
                if isinstance(fieldFilter, str):
                    fieldFilter = fieldFilter.split(',')

                # add all fields
                for field in fieldFilter:
                    extractOption += '-e {0} '.format(field)            

            if inputFilename:
                # add all fields specified in text file
                with open(inputFilename, 'r') as inputFile:
                    for line in inputFile:
                        extractOption += '-e {0} '.format(line.strip())

            cmd = '{0} -r {1} -T {2} -Y wlan_mgt.ssid=={3} {4}'.format(self.tshark_exe, self.captureFilename, outputFormat, ssid, extractOption)
            stdout, stderr = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True).communicate()

            if isVerbose:
                print('tshark cmd: {0}'.format(cmd))
                print(stdout.decode())
         
            if outputFilename:
                with open(outputFilename, 'w') as dumpFile:
                    dumpFile.write(cmd)
                    dumpFile.write(stdout.decode())

            return stdout.decode()

        except Exception as ex:
            print('EXCEPTION [pcap::filter]: {0}'.format(ex))
            return ''

'''
The main entry point to this CLI utility.
'''
def main():
    # Parse the CLI arguments.
    parser = argparse.ArgumentParser(description='PCAP filtering utility.')
    parser.add_argument('-f', '--fields', required = False, help = 'Fields to filter')
    parser.add_argument('-format', '--output_format', required = False, help = 'Output format (pdml|ps|psml|json|ek|text|fields)')
    parser.add_argument('-i', '--input', required = True, help = 'The pcap file to filter')
    parser.add_argument('-o', '--out', required = False, help = 'Output filename')
    parser.add_argument('-s', '--ssid', required = True, help = 'SSID to filter')
    parser.add_argument('-v', '--verbose', required = False, help = 'Enable verbosity of filtering utility')
    args = parser.parse_args()

    # Perform the filter.
    pcap = PCAP(args.input)
    pcap.filter(args.input, args.ssid, args.fields, args.output_format, None, args.verbose)

if __name__ == '__main__':
    main()
