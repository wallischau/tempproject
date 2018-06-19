import os, subprocess, datetime
from shutil import copyfile
from loadsettings import SettingsLoader

from testlist import BaseTestBuilder
from tclbuilder import TclWriter

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

CONFIG_DIR = os.path.join(BASE_DIR, 'config')
TEST_SETTINGS_FILE = os.path.join(CONFIG_DIR, 'test_settings.conf')
USER_SETTINGS_FILE = os.path.join(CONFIG_DIR, 'user_settings.conf')

RESULT_DIR = os.path.join(BASE_DIR, 'results')

TCL_IN_DIR = os.path.join(BASE_DIR, 'base_templates')
TCL_OUT_DIR = os.path.join(BASE_DIR, 'logs')
LOG_DIR = TCL_OUT_DIR

TIMESTAMP_STR = ''

def execute_tcl(vw_auto_file, tcl_file, log_file):
    cmd = 'tclsh "%s" -f "%s" -i "%s" --nodut -o "%s"' % (vw_auto_file, tcl_file, TIMESTAMP_STR, log_file)

    # print cmd
    subprocess.call(cmd, shell=True)

def main():
    global TIMESTAMP_STR
    print "Charter Vendor Automation Script\n"

    # make sure config, tcl, and log directories exist
    for directory in (CONFIG_DIR, TCL_OUT_DIR, LOG_DIR):
        if not os.path.isdir(directory):
            os.mkdir(directory)

    # get settings from user input, or previously saved settings
    loaded_settings = SettingsLoader(settings_file=TEST_SETTINGS_FILE, user_settings_file=USER_SETTINGS_FILE)
    loaded_settings.load_settings()

    # determine vw_auto_file location
    vw_auto_dir = loaded_settings.user_settings['vw_auto_dir']
    vw_auto_file = os.path.join(vw_auto_dir, 'automation', 'bin', 'vw_auto.tcl')

    # prompt user whether to continue to build tcl
    print "Ready to build tcl files. This will remove any previous tcl files or test logs."
    while True:
        cont = raw_input('Continue? (y/n)> ').strip()
        if len(cont):
            break
    if cont[0].lower() != 'y':
        print "Cancelling testing"
        return

    # clear out old tcl and log files
    for f in os.listdir(TCL_OUT_DIR):
        try:
            os.remove(os.path.join(TCL_OUT_DIR, f))
        except:
            print "Warning: Unable to remove %s" % os.remove(os.path.join(TCL_OUT_DIR, f))

    # build the tcl files
    writer = TclWriter(result_dir=RESULT_DIR, **loaded_settings.settings)
    testlists = {}
    for test in loaded_settings.settings['tests']:
        testlists[test] = testlist = BaseTestBuilder.generate_list_from_testtype(test, **loaded_settings.settings)
        
        
        for testname in testlist:
            tcl_name = '%s.tcl' % test
            in_file = os.path.join(TCL_IN_DIR, test, tcl_name)
            tcl_name = '%s.tcl' % testname
            out_file = os.path.join(TCL_OUT_DIR, tcl_name)

            try:
                writer.build_tcl(in_file=in_file, out_file=out_file, type_name=test, testlist=[testname])
            except:
                print "Error writing %s" % out_file

    # Copy ipv6_defaults script over
    ipv6_file_name = "ipv6_defaults.tcl"
    ipv6_defaults_src = os.path.join(TCL_IN_DIR, ipv6_file_name)
    ipv6_defaults_dst = os.path.join(TCL_OUT_DIR, ipv6_file_name)
    copyfile(ipv6_defaults_src, ipv6_defaults_dst)

    # give the user a chance to edit the tcls
    print "Tcls have been built. If you wish to edit them at this time, they can be found at:"
    print "\t%s" % TCL_OUT_DIR
    while True:
        cont = raw_input('Begin Execution? (y/n)> ').strip()
        if len(cont):
            break
    if cont[0].lower() != 'y':
        print "Cancelling testing"
        return

    # execute tcls
    # set timestamp string at this point, so runs can be saved in proper directories
    TIMESTAMP_STR = datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
    for test in loaded_settings.settings['tests']:
        for testname in testlists[test]:

            tcl_file = os.path.join(TCL_OUT_DIR, '%s.tcl' % testname)
            log_file = os.path.join(LOG_DIR, '%s.log' % testname)

            print "Executing %s. View logs at:\n\t%s" % (testname, log_file)
            execute_tcl(vw_auto_file, tcl_file, log_file)
            print "Finished executing %s" % testname

    print "Finished executing all tests!"

if __name__ == '__main__':
    try:
        main()
    except (KeyboardInterrupt, EOFError):
        print "\nExiting"
