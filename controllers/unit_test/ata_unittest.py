import time
import unittest
from ..ata import ATA

class ATA_Test(unittest.TestCase):
  def setUp(self):
    self.chamber_5G = 'A_5G'
    self.chassis_ip = '10.3.65.100'
    self.slot_number = '6'
    self.card_port = '1' 
    self.ata_ip = '10.3.65.109'
    self.ata_port = 23
    self.band = 5000
    self.channel = 149
  
  def test_bind_port(self):
    ata = ATA(self.ata_ip, self.ata_port)
    #ata.purge()
    response = ata.bind_port(self.chamber_5G, self.chassis_ip, self.slot_number, self.card_port)
    self.assertTrue( 'cmdStatus=ok' in response )

  def test_create_client(self):
    ata = ATA(self.ata_ip, self.ata_port)
    ata.bind_port(self.chamber_5G, self.chassis_ip, self.slot_number, self.card_port)
    ata.set_channel(self.chamber_5G, self.band, self.channel)
    ata.create_client('test_client', 'TESTCLIENT')
    self.assertTrue( True )

  def test_flow(self):
    ata = ATA(self.ata_ip, self.ata_port)
    ata.bind_port(self.chamber_5G, self.chassis_ip, self.slot_number, self.card_port)
    ata.set_channel(self.chamber_5G, self.band, self.channel)
    ata.create_client('test_client_01', 'TESTCLIENT_01')
    ata.create_client('test_client_02', 'TESTCLIENT_02')
    ata.clear_capture(self.chamber_5G)
    ata.create_flow('test_flow', 'test_client_01', 'test_client_02')
    ata.stop_flow('test_flow')
    ata.save_capture(self.chamber_5G, 'mikayla_test')
    self.assertTrue( True )

  def test_get_ap_info(self):
    ata = ATA(self.ata_ip, self.ata_port)
    ata.bind_port(self.chamber_5G, self.chassis_ip, self.slot_number, self.card_port)
    ata.set_channel(self.chamber_5G, self.band, self.channel)
    ata.get_ap_info('e8:d1:1b:da:bb:74')

  def test_scan_bss(self):
    ata = ATA(self.ata_ip, self.ata_port)
    ata.bind_port(self.chamber_5G, self.chassis_ip, self.slot_number, self.card_port)
    ata.set_channel(self.chamber_5G, self.band, self.channel)
    dict_ssid = ata.scan_bss(self.chamber_5G)
    self.assertTrue( dict_ssid[0]['ssid'] != None )

if __name__ == '__main__':
    unittest.main()
