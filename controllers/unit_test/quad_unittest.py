import unittest
from ..quadattenuator import QuadAttenuator

class QuadAttenuator_Test(unittest.TestCase):
    quad = QuadAttenuator('10.3.65.153') 
        
    def test_get_info(self):
        fields = self.quad.get_info()
        self.assertTrue('QA' in fields['dev_name'])

    def test_get_atten(self):
        self.assertTrue(self.quad.get_atten(1) > 0)

    def test_get_atten_db_max(self):
        self.assertTrue(self.quad.get_atten_db_max() > 0)

    def test_get_atten_rf_count(self):
        self.assertTrue(self.quad.get_atten_rf_count() > 0)

    def test_get_dev_name(self):
        print(self.quad.get_dev_name())
        self.assertTrue(self.quad.get_dev_name() != '')

    def test_get_dev_serial(self):
        self.assertTrue('QA' in self.quad.get_dev_serial())

    def test_get_dev_type(self):
        self.assertTrue(self.quad.get_dev_type() != '')

    def test_get_ether_mac(self):
        self.assertTrue(':' in self.quad.get_ether_mac())

    def test_get_ip_static_address(self):
        self.assertTrue('.' in self.quad.get_ip_static_address())

    def test_get_ip_static_gateway(self):
        self.assertTrue('.' in self.quad.get_ip_static_gateway())

    def test_get_ip_static_subnet(self):
        self.assertTrue('.' in self.quad.get_ip_static_subnet())

    def test_get_version_firmware(self):
        self.assertTrue('.' in self.quad.get_version_firmware())

    def test_set_atten(self):
        self.quad.set_atten(1, 1.5)
        fields = self.quad.get_info()
        self.assertTrue(fields['atten1'] == '1.5')

        self.quad.set_atten(1, 2.0)
        fields = self.quad.get_info()
        self.assertTrue(fields['atten1'] == '2.0')

if __name__ == '__main__':
    unittest.main()
