import time
import unittest
from ..power import PowerController

class Broadcomm_Test(unittest.TestCase):
    def test_init_requires_valid_config(self):
        self.assertRaises(EnvironmentError, PowerController, '{ really bad json }')

    def test_init(self):
        pc = PowerController('{"OTA2": {"ip": "10.3.65.221","outlets": [1, 2, 3, 4, 5] }}')

        self.assertTrue(isinstance(pc, PowerController))

if __name__ == '__main__':
    unittest.main()
