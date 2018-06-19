import sys
import json
import re

class TclSafeString:
    '''
    wrapper for a string that indicates it should not be escaped
    when passed into tcl_convert(), it will simply be cast to a string
    which will return the original string unaltered
    '''
    def __init__(self, s):
        self.s = s

    def __str__(self):
        return self.s

def tcl_escape(val):
    chars = (
        '\\',
        ' ',
        '{',
        '}',
        '[',
        ']',
        '$',
    )
    for char in chars:
        val = val.replace(char, '\\%s' % char)

    return val

def tcl_convert(val):
    if isinstance(val, list):
        return '{%s}' % ' '.join(tcl_convert(v) for v in val)
    if isinstance(val, str):
        return tcl_escape(val)

    return str(val)

def write_keylset(out, name, obj):
    for key, value in obj.items():
        if key == 'name':
            continue

        out.write('keylset %s %s %s\n' % (name, key, tcl_convert(value)))

    out.write('\n')

def write_box_comment(out, lines):
    '''
    write a box comment, will look like below:

    ##################################
    #
    # it will look something like this
    # see? it's a box
    #
    ##################################
    '''

    # allow function to be called with a single string
    if isinstance(lines, str):
        write_box_comment(out, lines.split('\n'))
        return

    # determine the max length of all strings
    # add two for the '# ' at the beginning of 
    # each line
    max_len = len(max(lines, key=len)) + 2

    # we'll use length at least 32
    max_len = max(max_len, 32)

    # top border
    out.write('#' * max_len)
    out.write('\n')
    out.write('#\n')

    # write all of our lines
    for line in lines:
        out.write('# %s\n' % line)

    # bottom border
    out.write('#\n')
    out.write('#' * max_len)
    out.write('\n\n')

def write_tcl(out, test):
    write_box_comment(out, [
        'This file was automatically generated',
        'DO NOT EDIT',
    ])

    write_box_comment(out, 'global configs')
    write_keylset(out, 'global_config', test['global_config'])

    write_box_comment(out, 'other globals')
    for key, value in test['global_vars'].items():
        out.write('# %s\n' % key)
        write_keylset(out, key, value)

    write_box_comment(out, 'test config')
    write_keylset(out, test['test']['name'], test['test'])

def main():
    if len(sys.argv) != 2:
        sys.stderr.write('usage: %s filename\n' % sys.argv[0])
        sys.exit(1)

    with open(sys.argv[1], 'r') as f:
        test = json.loads(f.read())[0]

    write_tcl(sys.stdout, test)

    # write_box_comment('client group definitions')
    # for client in test['clients']:
    #     name = client['name']
    #     sys.stdout.write('# %s\n' % name)
    #     write_keylset(name, client)

    # write_box_comment('dut definitions')
    # for dut in test['duts']:
    #     name = dut['name']
    #     sys.stdout.write('# %s\n' % name)
    #     write_keylset(name, dut)

if __name__ == '__main__':
    main()

__all__ = [
    'write_tcl',
]