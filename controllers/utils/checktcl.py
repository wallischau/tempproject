#!/usr/bin/env python3
import sys
import os
import re
import json

GLOBAL_DICT = {}

def copy(val):
    if isinstance(val, dict):
        return {
            key: copy(v) for key, v in val.items()
        }

    if isinstance(val, list):
        return [copy(i) for i in val]

    return val

def process_val(val):
    if not isinstance(val, str):
        return val

    val = val.replace('\\ ', ' ').strip()
    # array
    match = re.match(r'^\{(.*)\}$', val)
    if match:
        return [
            process_val(v) for v in 
            re.split(r'\s+', match.group(1))
        ]

    # deep copy
    match = re.match(r'^\$\{(.*)\}$', val)
    if match:
        other_val = GLOBAL_DICT.get(match.group(1), None)

        if other_val is not None:
            return copy(other_val)

    # shallow copy
    match = re.match(r'^\$(.*)$', val)
    if match:
        other_val = GLOBAL_DICT.get(match.group(1), None)

        if other_val is not None:
            return process_val(other_val)

    # integer
    if re.match(r'^[0-9]+$', val):
        return int(val)

    return val

def do_set(s):
    # try:
    key, val = re.split(r'\s+', s, 1)
    GLOBAL_DICT[key] = process_val(val)
    # except:
        # pass



def do_keylset(s):
    name, key, val = re.split(r'\s+', s, 2)

    GLOBAL_DICT.setdefault(name, {})

    GLOBAL_DICT[name][key] = process_val(val)

def add_global_vars(test, val):
    if isinstance(val, list):
        for v in val:
            add_global_vars(test, v)
        return

    if isinstance(val, str):
        if val in test['global_vars']:
            return
        global_val = GLOBAL_DICT.get(val, None)
        if global_val:
            test['global_vars'][val] = global_val

            if isinstance(global_val, dict):
                for _key, _val in global_val.items():
                    add_global_vars(test, _val)

def read_tcl(f, prefix):
    GLOBAL_DICT.clear()
    for line in f:
        line = line.strip('\n')
        line = re.sub(r'#.*$', '', line)

        if not line:
            continue

        op, rest = line.split(' ', 1)

        if op == 'set':
            do_set(rest)

        elif op == 'keylset':
            do_keylset(rest)

    testcases = []
    client_mix_regex = r'ClientMix\.(?P<client_name>[A-Za-z0-9_]+)\..+'

    for key, val in GLOBAL_DICT.items():
        if key.startswith(prefix):
            test = {
                'test': val,
                # 'duts': [],
                # 'clients': [],
                'global_config': GLOBAL_DICT['global_config'],
                'global_vars': {},
            }

            for _key, _val in val.items():
                add_global_vars(test, _val)

                # check for ClientMix.___.whatever
                # because clients may not be found in Source/Dest
                match = re.match(client_mix_regex, _key)
                if match:
                    add_global_vars(test, match.group('client_name'))

            for _val in test['global_config']['Source']:
                add_global_vars(test, _val)
            for _val in test['global_config']['Destination']:
                add_global_vars(test, _val)

            test['test']['name'] = key


            testcases.append(test)

    return testcases

def main():
    if len(sys.argv) != 3:
        sys.stderr.write('usage: %s filename prefix\n' % sys.argv[0])
        sys.exit(1)

    filename = sys.argv[1]
    prefix = sys.argv[2]

    with open(filename, 'r') as f:
        testcases = read_tcl(f, prefix)

    # for test in testcases:
    sys.stdout.write(json.dumps(testcases, indent=2))
    sys.stdout.write('\n')
        # input('')

if __name__ == '__main__':
    main()

__all__ = [
    'read_tcl',
]