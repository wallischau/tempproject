_test_classes = {}

def get_test_class(name):
    # get a test class by registered name
    return _test_classes.get(name, None)

from . import ata
from . import db_rest_api
from . import cmw500
from . import controller
from . import dut
from . import jfw
from . import exceptions
from . import jfw
from . import meta
from . import mobile
from . import octoscope
from . import parsers
from . import power
from . import quadattenuator
from . import radiusclient
from . import ssh
from . import tests
from . import utils

__all__ = [
    'ata',
    'db_rest_api',
    'cmw500',
    'controller',
    'dut',
    'exceptions',
    'jfw',
    'get_test_class',
    'meta',
    'mobile',
    'octoscope',
    'parsers',
    'power',
    'quadattenuator',
    'radiusclient',
    'ssh',
    'tests',
    'utils',
]
