import time
import unittest
from ..dut.ap import AP

class Broadcomm_Test(unittest.TestCase):
    def setUp(self):
        self.ap = AP("A", "sagemcom", "rac2v1s")
        self.ap.set_instructions('controllers/dut/instruction_sets/sagemcom_rac2v1s.json')

    def test_cmd_queue(self):
        self.ap.queue_cmd_statement("GET_CHANNEL_INFO")
        dict_output = self.ap.send_queue()

        print(dict_output)
        
        self.assertTrue( "GET_CHANNEL_INFO" in dict_output )
        self.assertTrue( "Channel" in dict_output['GET_CHANNEL_INFO'] )

if __name__ == '__main__':
    unittest.main()
