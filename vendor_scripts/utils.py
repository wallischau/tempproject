# significant lists of mcs
MCS_N_VALUES = [i for i in range(32)]
MCS_N_MAJOR = [7, 15, 23, 31]
MCS_AC_VALUES = [i for i in range(10)]
MCS_AC_MAJOR = [9]

# determine max mcs from max spatial stream (802.11n)
max_mcs = lambda ss: 8*ss - 1

def get_mcs_list(string):
    '''
    parse a string listing values and ranges of values
    :param string: the string to be parsed
    :return: a list of values
    '''
    if not string:
        return []

    mcs_set = set()

    for item in string.split(','):
        mcs_range = item.split('-')

        if len(mcs_range) == 1:
            mcs_set.add(int(item))

        else:
            low, high = mcs_range

            for val in range(int(low), int(high)+1):
                mcs_set.add(val)

    mcs_list = list(mcs_set)
    mcs_list.sort()

    return mcs_list

class ConfigError(Exception):
    '''
    custom exception for configuration errors
    '''
    pass

class OrderedDict(dict):
    '''
    implementation of collections.OrderedDict from later versions of python
    '''
    def __init__(self, iterable=None):
        super(OrderedDict, self).__init__()
        self._key_list = []
        if iterable:
            for key, value in iterable:
                self[key] = value
        

    def __setitem__(self, key, value):
        if key not in self._key_list:
            self._key_list.append(key)
        super(OrderedDict, self).__setitem__(key, value)

    def __delitem__(self, key):
        self._key_list.remove(key)
        super(OrderedDict, self).__delitem__(key)

    def items(self):
        for key in self._key_list:
            yield (key, self[key])
