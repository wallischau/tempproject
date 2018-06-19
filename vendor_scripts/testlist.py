import utils

class BaseTestBuilder(object):
    # what config items should be included in a test name, template string
    _naming_ordering = (
        ('band', '%s'),
        ('bandwidth', '%s'),
        ('ss', 'S%s'),
        ('mcs', 'M%s'),
        ('clients', 'C%s'),
        ('direction', '%s'),
    )

    # config items to ignore in naming
    naming_ignore = ()

    # extra to apply to naming
    naming_extra = ()

    # config items to override in every test
    override_values = {}

    # a list of illegal test configurations
    illegal_settings = [
        {
            'ss': 3,
            'mcs': 6
        }
    ]

    # allowed mcs/ss values. can be a list or a callable that takes a single
    # "self" argument and returns a list of values
    allowed_mcs_n = utils.MCS_N_VALUES
    allowed_mcs_ac = utils.MCS_AC_VALUES
    allowed_ss_24 = [i for i in range(1, 5)]
    allowed_ss_5 = [i for i in range(1, 5)]
    mcs_db_max_only = False

    # what to prefix each test name with
    prefix = 'TST'

    def __init__(self, bandwidths, directions, **kwargs):
        # save bandwidth and direction selections
        self.bandwidths = bandwidths
        self.directions = directions

        # store each band, ss, mcs info
        self.bands = {}
        self.ss = {}
        self.mcs = {}

        # keep mcs separately because we need to split n between 2.4 and 5 later
        mcs = {}

        for key, value in kwargs.items():
            # pull stuff out of kwargs
            if key.startswith('band_'):
                self.bands[key] = value
            elif key.startswith('ss_'):
                self.ss[key] = value
            elif key.startswith('mcs_'):
                mcs[key] = value

        # calculate max capable mcs from ss
        self.max_mcs_24 = utils.max_mcs(self.ss['ss_24'] or 0)
        self.max_mcs_5 = utils.max_mcs(self.ss['ss_5'] or 0)

        # determine mcs values
        for key, value in mcs.items():
            # pick out whether we are looking at n or ac
            std = key.split('_')[1]

            if value == 'ALL':
                # all capable mcs for this standard
                base_list = getattr(utils, 'MCS_%s_VALUES' % std.upper())

                if std == 'n':
                    # all mcs less than max capable for 2.4 and 5
                    self.mcs['mcs_n_24'] = [
                        i for i in base_list if i <= self.max_mcs_24
                    ]
                    self.mcs['mcs_n_5'] = [
                        i for i in base_list if i <= self.max_mcs_5
                    ]
                else:
                    # everything (ac mcs repeats per spatial stream)
                    self.mcs[key] = [i for i in base_list]
            else:
                if std == 'n':
                    # parse string, assign to 2.4 and 5
                    self.mcs['mcs_n_5'] = self.mcs['mcs_n_24'] = utils.get_mcs_list(value)
                else:
                    # parse string
                    self.mcs[key] = utils.get_mcs_list(value)

    def _name_test(self, config):
        '''
        name a single test
        :param config: dict with test config
        '''
        arr = [self.prefix]

        for attr, template in self._naming_ordering:
            # loop through naming rules

            # ignore this setting in naming
            if attr in self.naming_ignore:
                continue

            # if that value isn't present in config, that's ok
            value = config.get(attr, None)
            if value is not None:
                # for lists, use all items
                if isinstance(value, list):
                    next_str = '_'.join(template % v for v in value)
                else:
                    next_str = template % value

                arr.append(next_str)

        for attr, template, _ in self.naming_extra:
            value = config.get(attr, None)
            if value is not None:
                # for lists, use all items
                if isinstance(value, list):
                    next_str = '_'.join(template % v for v in value)
                else:
                    next_str = template % value

                arr.append(next_str)

        return '_'.join(arr)

    def _get_valid_mcs_list(self, std, band, config_mcs_list, db=False):
        '''
        get a list of valid mcs values among what was chosen
        :param std: 802.11 standard
        :param band: str: '24' or '5'
        :param config_mcs_list: list of values chosen by user
        :param db: bool: whether this list is for dual band or single band
        :return: a list of valid values
        '''
        if db:
            if self.mcs_db_max_only:
                if std == 'n':
                    allowed_mcs_list = [getattr(self, 'max_mcs_%s' % band)]
                else:
                    allowed_mcs_list = [9]
            else:
                # dual band only runs at major mcs levels by default
                allowed_mcs_list = getattr(utils, 'MCS_%s_MAJOR' % std.upper())
        else:
            # single band, check what mcs is allowed
            allowed_mcs_list = getattr(self, 'allowed_mcs_%s' % std)

            # callable, dynamically generate list
            if callable(allowed_mcs_list):
                allowed_mcs_list = allowed_mcs_list(band)

        return [i for i in config_mcs_list if i in  allowed_mcs_list]

    def _get_valid_ss_list(self, band):
        # get allowed ss values for a specific band
        allowed_ss_list = getattr(self, 'allowed_ss_%s' % band)

        if callable(allowed_ss_list):
            allowed_ss_list = allowed_ss_list()

        return allowed_ss_list

    def _legal_config(self, config):
        '''
        check wether a configuration is legal
        :param config: dict - the configuration in question
        :return: bool - True if the config is allowed
        '''
        # check against all elements in illegal_settings
        for illegal in self.illegal_settings:
            for key, value in illegal.items():
                # if any one item does not match, or is missing, move on to the next
                config_val = config.get(key, None)
                if config_val is None or config_val != value:
                    break
            else:
                # everything in the illegal config matched this config. this 
                # config is illegal
                return False

        # we didn't match any illegal config. we're good
        return True

    def _enumerate_extra(self, config):
        if self.naming_extra:
            for attr, template, values in self.naming_extra:
                for val in values:
                    new_config = config.copy()
                    new_config[attr] = val
                    yield new_config

        else:
            yield config

    def _add_all_legal_config(self, test_set, configs):
        '''
        add all names for configs that are legal to a set of test names
        :param test_set: a set that test names should be added to
        :param configs: a list of dict configs, some may be illegal
        '''
        for outer_config in configs:
            for config in self._enumerate_extra(outer_config):
                # update with override_values
                config.update(self.override_values)

                # only add legal configs
                if self._legal_config(config):
                    test_set.add(self._name_test(config))

    def generate_list(self):
        # generate a list of tests based on the configurations passed in __init__
        test_set = set()

        if self.bands.get('band_24'):
            if 20 in self.bandwidths:
                # 2.4GHz 20MHz
                configs = (
                    {
                        'band': '24',
                        'bandwidth': 20,
                        'mcs': mcs,
                        'direction': direction,
                    }
                        for mcs in self._get_valid_mcs_list('n', '24', self.mcs['mcs_n_24'])
                        for direction in self.directions
                )

                self._add_all_legal_config(test_set, configs)

        if self.bands.get('band_5'):
            if 40 in self.bandwidths:
                # 5GHz 40MHz
                configs = (
                    {
                        'band': 5,
                        'bandwidth': 40,
                        'mcs': mcs,
                        'direction': direction,
                    }
                        for mcs in self._get_valid_mcs_list('n', '5', self.mcs['mcs_n_5'])
                        for direction in self.directions
                )
                self._add_all_legal_config(test_set, configs)

            if 80 in self.bandwidths:
                # 5GHz 80MHz
                configs = (
                    {
                        'band': 5,
                        'bandwidth': 80,
                        'mcs': mcs,
                        'ss': ss,
                        'direction': direction,
                    }
                        for mcs in self._get_valid_mcs_list('ac', '5', self.mcs['mcs_ac'])
                        for ss in self._get_valid_ss_list(5)
                        for direction in self.directions
                )
                self._add_all_legal_config(test_set, configs)

        if self.bands.get('band_db'):
            # dual band
            if 20 in self.bandwidths and 40 in self.bandwidths:
                # n/n
                configs = (
                    {
                        'band': 'DB',
                        'mcs': [mcs_24, mcs_5],
                        'direction': direction,
                    }
                        for mcs_24 in self._get_valid_mcs_list('n', '24', ([], [self.max_mcs_24])[self.max_mcs_24 in self.mcs['mcs_n_24']], db=True)
                        for mcs_5 in self._get_valid_mcs_list('n', '5', self.mcs['mcs_n_5'], db=True)
                        for direction in self.directions
                )
                self._add_all_legal_config(test_set, configs)
                
            if 20 in self.bandwidths and 80 in self.bandwidths:
                # n/ac
                configs = (
                    {
                        'band': 'DB',
                        'mcs': [mcs_24, mcs_5],
                        'ss': ss,
                        'direction': direction,
                    }
                        for mcs_24 in self._get_valid_mcs_list('n', '24', ([], [self.max_mcs_24])[self.max_mcs_24 in self.mcs['mcs_n_24']], db=True)
                        for mcs_5 in self._get_valid_mcs_list('ac', '5', self.mcs['mcs_ac'], db=True)
                        for ss in self._get_valid_ss_list(5)
                        for direction in self.directions
                )
                self._add_all_legal_config(test_set, configs)

        # convert set to list, sort
        test_list = list(test_set)
        test_list.sort()

        return test_list

    @classmethod
    def generate_list_from_testtype(cls, type_name, *args, **kwargs):
        '''
        entry point for users of this class. determine which subclass to use
        :param type_name: the name of the test type whose test list we are generating
        all other positional and keyword arguments are forwarded to the subclass __init__
        :return: a list of test names - the return of generate_list()
        '''
        classes = {
            'UDP': UdpBuilder,
            'TCP': TcpBuilder,
            'NF': NearfarBuilder,
            'MX': MaxClientBuilder,
            'TP': TriplePlayBuilder,
            'UL': LatencyBuilder,
            'UV': UnicastVidBuilder,
            'QOE': QoeBuilder,
            'RVR': RvrBuilder,
            'MV': MulticastVidBuilder,
            'PS': PowerSaveBuilder,
            'MC': MixedClientBuilder,
            'ROA': ReuseAirtimeBuilder,
        }

        return classes[type_name](*args, **kwargs).generate_list()

class MaxMcsTestBuilder(BaseTestBuilder):
    '''
    abstract class defining common test list restrictions
    of allowing only max mcs/ss values 
    '''

    # only max mcs/ss
    allowed_mcs_n = lambda self, band: [ utils.max_mcs(self.ss['ss_%s' % band] or 0) ]
    allowed_mcs_ac = utils.MCS_AC_MAJOR

    allowed_ss_5 = lambda self: [ self.ss['ss_5'] ]

class SimpleTestBuilder(MaxMcsTestBuilder):
    '''
    abstract class defining naming convention for simple test cases
    that don't have directionality and don't allow dual band
    '''

    # direction not in name/not part of test
    naming_ignore = ('direction',)

    # no dual band
    illegal_settings = [i.copy() for i in MaxMcsTestBuilder.illegal_settings]
    illegal_settings.append({'band': 'DB'})

class UdpBuilder(BaseTestBuilder):
    override_values = {
        'clients': 25
    }

    prefix = 'UDP'

    illegal_settings = [i.copy() for i in BaseTestBuilder.illegal_settings]
    for mcs in range(7):
        # don't test downstream at mcs 0-6 for 80MHz
        illegal_settings.append({
            'direction': 'DS',
            'bandwidth': 80,
            'mcs': mcs
        })

class TcpBuilder(UdpBuilder):
    prefix = 'TCP'

    # no bidirectional tcp
    illegal_settings = [i.copy() for i in UdpBuilder.illegal_settings]
    illegal_settings.append({'direction': 'BI'})

class NearfarBuilder(SimpleTestBuilder):
    prefix = 'NF'

class TriplePlayBuilder(MaxMcsTestBuilder):
    prefix = 'TriplePlay'

    naming_ignore = ('direction',)
	
    mcs_db_max_only = True

class MaxClientBuilder(SimpleTestBuilder):
    prefix = 'MX'

class UnicastVidBuilder(SimpleTestBuilder):
    prefix = 'UV'

class MulticastVidBuilder(MaxMcsTestBuilder):
    prefix = 'MV'
    allowed_mcs_ac = [7]

    naming_ignore = ('direction',)

    illegal_settings = [i.copy() for i in MaxMcsTestBuilder.illegal_settings]
    illegal_settings.append({'band': 'DB'})

class RvrBuilder(SimpleTestBuilder):
    prefix = 'RVR'

class LatencyBuilder(MaxMcsTestBuilder):
    illegal_settings = [i.copy() for i in MaxMcsTestBuilder.illegal_settings]
    illegal_settings.append({'band': 'DB'})

    naming_ignore = ()
    override_values = {
        'clients': 1,
    }

    prefix = 'LAT'

class QoeBuilder(SimpleTestBuilder):
    naming_ignore = ('ss', 'mcs', 'clients', 'direction')

    prefix = 'QoE'

class PowerSaveBuilder(SimpleTestBuilder):
    naming_ignore = ('clients', 'direction')
    naming_extra = (
        ('ps_type', '%s', ('WMM', 'LEG', 'MIXED')),
    )
    prefix = 'PS'

class MixedClientBuilder(BaseTestBuilder):
    prefix = 'MC'
    naming_ignore = ('clients', 'direction', 'mcs', 'ss',)

    naming_extra = (
        ('mc_clients', 'C%s', (3, 6, 7, 14)),
    )

    illegal_settings = [
        {
            'band': 'DB',
        },
        {
            'band': 5,
            'bandwidth': 40
        },

        {
            'band': 5,
            'bandwidth': 80,
            'mc_clients': 3,
        },
        {
            'band': 5,
            'bandwidth': 80,
            'mc_clients': 6,
        },

        {
            'band': '24',
            'bandwidth': 20,
            'mc_clients': 7,
        },
        {
            'band': '24',
            'bandwidth': 20,
            'mc_clients': 14,
        },
    ]

class ReuseAirtimeBuilder(BaseTestBuilder):
    prefix = 'ROA'

    naming_ignore = ('clients', 'direction', 'mcs', 'ss')
    naming_extra = (
        (
            'drop', 
            'DROP_%s',
            (
                '11g_24_20',
                '11n_24_20_M15',
                '11n_24_20_M23',
                '11a_5_20',
                '11n_5_40_M23',
                '11ac_5_80_S3',
            )
        ),
    )

    illegal_settings = [
        {
            'band': 'DB',
        },
        {
            'band': 5,
            'bandwidth': 40
        },
        {
            'band': 5,
            'bandwidth': 80,
            'drop': '11g_24_20',
        },
        {
            'band': 5,
            'bandwidth': 80,
            'drop': '11n_24_20_M15',
        },
        {
            'band': 5,
            'bandwidth': 80,
            'drop': '11n_24_20_M23',
        },

        {
            'band': '24',
            'bandwidth': 20,
            'drop': '11a_5_20',
        },
        {
            'band': '24',
            'bandwidth': 20,
            'drop': '11n_5_40_M23',
        },
        {
            'band': '24',
            'bandwidth': 20,
            'drop': '11ac_5_80_S3',
        },
    ]