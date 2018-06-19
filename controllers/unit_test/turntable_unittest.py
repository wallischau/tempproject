import unittest
from ..turntable import TurnTableController, TableState
from inspect import isclass

class TestTurnTable(unittest.TestCase):
    def test_table_init_requires_valid_config(self):
        self.assertRaises(EnvironmentError, TurnTableController, '{ "Bad": "JSON" }')

    def test_table_states(self):
        config = 'controllers/unit_test/config/turntable_A.json'

        try:
            tt = TurnTableController(config)
        except: 
            tt = {}
        self.assertTrue(isinstance(tt.current_state, TableState))
        self.assertTrue(isinstance(tt.dream_state, TableState))

if __name__ == '__main__':
    unittest.main()
