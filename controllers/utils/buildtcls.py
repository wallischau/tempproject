#!/usr/bin/env python3
import sys
from checktcl import read_tcl
from writetcl import write_tcl

def main():
    if len(sys.argv) != 4:
        sys.stderr.write('usage: %s filename prefix outprefix\n' % sys.argv[0])
        sys.exit(1)

    filename = sys.argv[1]
    prefix = sys.argv[2]
    outprefix = sys.argv[3]

    with open(filename, 'r') as f:
        testcases = read_tcl(f, prefix)

    for i, test in enumerate(testcases):
        filename = '%s_%03d.tcl' % (outprefix, i)

        with open(filename, 'w') as f:
            write_tcl(f, test)

if __name__ == '__main__':
    main()
