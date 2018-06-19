import os, re, sys

from utils import OrderedDict, ConfigError

#####################
#
# Validators
#
#####################

# identity function for entries that don't need to be validated
identity = lambda s: s

def parse_bool(value):
    # parse boolean values
    if value == 'True':
        return True
    if value == 'False':
        return False

    raise ConfigError('Invalid boolean: %s' % value)

def parse_ss(value):
    # make sure string is int between 1 and 4
    if value == 'None':
        return None
    try:
        value = int(value)
    except ValueError:
        raise ConfigError("Invalid int value: %s" % value)

    if not (1 <= value <= 4):
        raise ConfigError("Invalid ss value: %s" % value)

    return value

def validate_mcs(value):
    # check against mcs regex
    if value == 'ALL':
        return value

    if value == 'None':
        return None

    if not re.match(r'^[0-9]+(-[0-9]+)?(,[0-9]+(-[0-9]+)?)*$', value):
        raise ConfigError("Invalid mcs value: %s" % value)

    return value

def validate_choices(choices, cast=None, exc_class=None):
    '''
    build a validator function that will check a comma separated list
    against a set of valid choices
    :param choices: any iterable of valid choices
    :param cast: a callable that takes one argument of type str and returns something that can
    be accurately compared to elements in choices with ==
    :param exc_class: a class of exception that, when raised by calling cast, indicates an error
    in configuration. required if cast parameter is provided
    :return: a function can be used to validate entries
    '''
    def _inner(value):
        # compare against choices
        value = value.split(',')
        if cast:
            # try to cast each entry using cast function
            try:
                value = [cast(v) for v in value]
            except exc_class:
                # improper config file
                raise ConfigError("Invalid value: %s" % value)

        # find file selections not in valid choices
        invalid_choices = [v for v in value if v not in choices]

        if len(invalid_choices):
            raise ConfigError("Invalid Selections: %s" % ','.join(invalid_choices))

        return value

    return _inner

class SettingsLoader:

    # supported tests
    test_choices = [
        'TCP',
        'UDP',
        'MX',
        'UL',
        'NF',
        'TP',
        'UV',
        'QOE',
        'RVR',
        'MV',
        'PS',
        'MC',
        'ROA',
    ]

    # valid bandwidth values
    bw_choices = [
        20,
        40,
        80,
    ]

    # valid directions
    dir_choices = [
        'US',
        'DS',
        'BI',
    ]

    # human readable names for settings
    settings_names = {
        'tests': 'Tests',
        'card_24': '2.4GHz Card',
        'card_5': '5GHz Card',
        'card_eth': 'Ethernet Card 1',
        'card_eth2': 'Ethernet Card 2',
        'card_eth3': 'Ethernet Card 3',
        'dut_company': 'DUT Vendor Name',
        'dut_model': 'DUT Model Name',
        'dut_firmware': 'DUT Firmware Version',
        'ssid_24': '2.4GHz SSID',
        'ssid_5': '5GHz SSID',
        'ss_5': '5GHz Max Spatial Streams',
        'ss_24': '2.4GHz Max Spatial Streams',
        'band_24': 'Test 2.4GHz',
        'band_5': 'Test 5GHz',
        'band_db': 'Test Dual Band',
        'bandwidths': 'Channel Bandwidths',
        'mcs_n': 'MCS range for n',
        'mcs_ac': 'MCS range for ac',
        'directions': 'Test Directions',
    }

    user_settings_names = {
        'vw_auto_dir': 'IxVeriwave API Location'
    }

    # callables to be called to process each configuration
    validators = {
        'tests': validate_choices(test_choices),
        'card_24': identity,
        'card_5': identity,
        'card_eth': identity,
        'card_eth2': identity,
        'card_eth3': identity,
        'dut_company': identity,
        'dut_model': identity,
        'dut_firmware': identity,
        'ssid_24': identity,
        'ssid_5': identity,
        'ss_5': parse_ss,
        'ss_24': parse_ss,
        'band_24': parse_bool,
        'band_5': parse_bool,
        'band_db': parse_bool,
        'bandwidths': validate_choices(bw_choices, int, ValueError),
        'mcs_n': validate_mcs,
        'mcs_ac': validate_mcs,
        'directions': validate_choices(dir_choices),

        'vw_auto_dir': identity,
    }

    def __init__(self, settings_file=None, user_settings_file=None):
        self.settings = OrderedDict()
        self.settings_file = settings_file

        self.user_settings = OrderedDict()
        self.user_settings_file = user_settings_file

    def read_configs(self, filename, names, settings):
        '''
        read config file, validate selections, store in settings
        '''
        f = None
        try:
            f = open(filename, 'r')
            for line in f:
                key, value = line.strip().split('=')

                key = key.strip()
                value = value.strip()

                # check that this is a valid config key
                if key not in names:
                    raise ConfigError("Invalid config - %s : %s" % (key, value))

                # validate value
                value = self.validators[key](value)

                settings[key] = value
        finally:
            if f is not None:
                f.close()

    def write_configs(self, filename, settings):
        '''
        save configs to file
        '''
        f = None
        try:
            f = open(filename, 'w')
            for key, value in settings.items():
                if isinstance(value, list):
                    # lists converted to comma-delimited string
                    value = ','.join(str(v) for v in value)

                f.write('%s=%s\n' % (key, value))
        finally:
            if f is not None:
                f.close()

    def load_settings(self):
        '''
        load settings from file or user input
        '''
        self._get_user_settings()
        self._get_initial_settings()

        while True:
            # make sure selected settings are ok
            self.print_settings(self.settings_names, self.settings)
            settings_ok = raw_input('\nAre these settings ok? (y/n)> ')

            if not len(settings_ok):
                continue

            if settings_ok[0].lower() == 'y':
                break

            # clear current settings and prompt user again
            self.settings = OrderedDict()
            self.get_settings_from_user()

        if not self._using_prev_settings:
            while True:
                # prompt user to save new settings for future use
                save = raw_input('\nSave settings? (y/n)> ')

                if not len(save):
                    continue

                if save[0].lower() == 'y':
                    # write configs to file
                    try:
                        self.write_configs(self.settings_file, self.settings)
                    except IOError:
                        print "Error writing to config file %s" % self.settings_file

                break

    def _get_user_settings(self):
        if os.path.isfile(self.user_settings_file):
            try:
                self.read_configs(self.user_settings_file, self.user_settings_names, self.user_settings)
            except ConfigError:
                print "Error reading in user settings. Please Re-enter settings"
            except IOError:
                print "Error opening file %s" % self.user_settings_file
            else:
                print "Loaded user settings:"
                self.print_settings(self.user_settings_names, self.user_settings)
                return

        # get user settings
        for key, value in self.user_settings_names.items():
            self.user_settings[key] = self._prompt_for_input('', 'Enter %s> ' % value)

        self.write_configs(self.user_settings_file, self.user_settings)

    def _get_initial_settings(self):
        if os.path.isfile(self.settings_file):
            # we previously saved settings
            print "Previous test settings found."
            while True:
                answer = raw_input('Load previous settings? (y/n)> ').strip()

                # make sure user enters something
                if len(answer):
                    break

            if answer[0].lower() == 'y':
                # try and load in old settings
                self._using_prev_settings = True
                try:
                    self.read_configs(self.settings_file, self.settings_names, self.settings)
                except ConfigError:
                    # something wrong with formatting of config file
                    print "Error reading in configs. Please re-enter settings"
                except IOError:
                    print "Error opening file %s" % self.settings_file
                else:
                    return

        self.get_settings_from_user()

    def get_settings_from_user(self):
        # prompt user for tests, card info, dut capability info
        self._using_prev_settings = False
        self._prompt_tests()
        self._prompt_card_info()
        self._prompt_dut_info()

    def _prompt_tests(self):
        # prompt user for list of choices
        self._prompt_choices(
            'tests',
            self.test_choices,
            "What tests would you like to run?",
            lambda s: s.upper()
        )

        if ('TP' in self.settings['tests']):
            sys.stderr.write('NOTICE: Triple Play requires 3 LAN eth connections. Verify connections. Test should also be rerun manually (see README)\n')
        if ('NF' in self.settings['tests']):
            sys.stderr.write('NOTICE: For Near/Far, attenuate antennas to about -18dB RSSI. (see README)\n')

        if ('QOE' in self.settings['tests']):
            sys.stderr.write('NOTICE: QOE should be rerun manually (see README)\n')

        if ('MV' in self.settings['tests']):
            sys.stderr.write('WARNING: Multicast Video requires use of the WAN interface and should be run on its own (see README)')

    def _prompt_card_info(self):
        # prompt for all card/port info
        self._prompt_card('24')
        self._prompt_card('5')
        self._prompt_card('eth')
        self._prompt_card('eth2')
        self._prompt_card('eth3')

    def _prompt_card(self, index):
        # prompt user for some card
        index = 'card_%s' % index

        prompt_name = self.settings_names[index]
        input_prompt = 'Enter %s formatted as IP:card:port (e.g. 172.22.65.100:1:2)\n> ' % prompt_name

        self.settings[index] = self._prompt_for_input('', input_prompt)

    def _prompt_dut_info(self):
        # get dut info
        self._prompt_dut_details('company')
        self._prompt_dut_details('model')
        self._prompt_dut_details('firmware')

        # prompt for bands to test
        self._prompt_band('24')
        self._prompt_band('5')

        # if we're doing 2.4 and 5, maybe we should also do db
        if self.settings['band_24'] and self.settings['band_5']:
            self._prompt_band('db')
        else:
            self.settings['band_db'] = False

        # ask for bandwidth info, mcs for n
        self._prompt_bandwidths()
        self._prompt_mcs('n')

        # get 2.4GHz info if we're running 2.4
        if self.settings['band_24']:
            self._prompt_ss('24')
            self._prompt_ssid('24')
        else:
            self.settings['ss_24'] = None
            self.settings['ssid_24'] = None

        # get 5GHz info if we're running 5
        if self.settings['band_5']:
            self._prompt_ss('5')
            self._prompt_ssid('5')

            # get ac info
            if 80 in self.settings['bandwidths']:
                self._prompt_mcs('ac')
            else:
                self.settings['mcs_ac'] = None
        else:
            self.settings['ss_5'] = None
            self.settings['ssid_5'] = None
            self.settings['mcs_ac'] = None

        self._prompt_directions()

    def _prompt_dut_details(self, index):
        # prompt for some dut attribute
        index = 'dut_%s' % index
        prompt_name = self.settings_names[index]

        self.settings[index] = self._prompt_for_input('', 'Enter %s> ' % prompt_name)

    def _prompt_band(self, index):
        # prompt if we should run some band
        index = 'band_%s' % index
        prompt_name = self.settings_names[index]

        response = self._prompt_for_input('', '%s?(y/n)> ' % prompt_name)

        self.settings[index] = response[0].lower() == 'y'

    def _prompt_bandwidths(self):
        # choice of bandwidths
        self._prompt_choices(
            'bandwidths',
            self.bw_choices,
            'Enter bandwidths to run',
            int
        )

    def _prompt_directions(self):
        # choice of directions
        self._prompt_choices(
            'directions',
            self.dir_choices,
            'Enter Directions to test',
        )

    def _prompt_mcs(self, index):
        # prompt for mcs range
        index = 'mcs_%s' % index

        init_prompt = "\nEnter %s" % self.settings_names[index]
        input_prompt = "Format as comma-separated list of values/ranges (eg 0,7,15-23) (default: all capable)\n> "

        def validator(val):
            if val == '':
                return 'ALL'

            try:
                val = validate_mcs(val)
            except ConfigError:
                print "Invalid format"
                raise
            else:
                return val

        self.settings[index] = self._prompt_for_input(init_prompt, input_prompt, validator, required=False)

    def _prompt_ss(self, index):
        # prompt for max ss
        index = 'ss_%s' % index
        prompt_name = self.settings_names[index]

        def validator(val):
            try:
                val = parse_ss(val)
            except ConfigError:
                print "Invalid value: %s.\nPlease enter an integer between 1 and 4" % val
                raise
            else:
                return val

        self.settings[index] = self._prompt_for_input('', 'Enter %s> ' % prompt_name, validator)

    def _prompt_ssid(self, index):
        # get ssid
        index = 'ssid_%s' % index
        prompt_name = self.settings_names[index]

        self.settings[index] = self._prompt_for_input('', 'Enter %s> ' % prompt_name)

    def _prompt_choices(self, index, choices, prompt, cast=None):
        '''
        prompt user for a selection of choices, defaulting to all selections
        :param index: the index of self.settings to save selection to
        :param choices: a list of valid selections
        :param prompt: the prompt to display to the user
        :param cast: a callable that takes in a str and returns a proper data type
        that can be compared with elements of choices with ==
        '''
        input_prompt = "Choices are:\n\t%s" % ' '.join(str(c) for c in choices)
        input_prompt += "\nEnter a space separated list (default: all)\n> "

        def validator(val):
            val = val.split(' ')

            if val == ['']:
                return choices

            new_val = []
            if cast:
                for i in val:
                    try:
                        i = cast(i)
                        new_val.append(i)
                    except ValueError:
                        print "Invalid Selection: %s" % i
                        raise ConfigError('Invalid Selection')
                val = new_val

            invalid_choices = [i for i in val if i not in choices]

            if len(invalid_choices):
                print "Invalid selections: %s" % ', '.join(str(i) for i in invalid_choices)
                raise ConfigError("Invalid selections")

            return val

        self.settings[index] = self._prompt_for_input(prompt, input_prompt, validator, required=False)

    def _prompt_for_input(self, init_prompt, input_prompt='> ', validator=lambda s: s, required=True):
        print init_prompt

        while True:
            user_input = raw_input(input_prompt).strip()
            if not user_input and required:
                continue

            try:
                user_input = validator(user_input)
            except ConfigError:
                pass
            else:
                break

        return user_input


    def print_settings(self, names, settings):
        for setting, value in settings.items():
            if isinstance(value, list):
                value = ','.join(str(v) for v in value)
            print "%30s : %s" % (names[setting], value)
