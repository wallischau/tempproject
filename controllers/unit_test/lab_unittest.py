import time
import unittest
from ..test import Test
#from ..lab import Lab

class Lab_Test(unittest.TestCase):

  def test_lab_init(self):
    # Define a config file.
    config = '/home/mcohen/config.json'

    # Create a Lab from a Config JSON.
    testcase = Test(None, config)
    #lab = Lab(config)

    # Is there "stuff" in it an does it work?
    chamber = testcase.lab.chambers[0]
    testcase.lab.ata.bind_port('{0}_5G'.format(chamber.name),chamber.chassis, chamber.card_5GHz, chamber.port_5GHz)

if __name__ == '__main__':
    unittest.main()
