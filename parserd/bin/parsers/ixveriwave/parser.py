from .utilities.ixia_csv_to_json import ixia_csv_to_json
from .utilities.ixia_result_parser import ixia_result_parser, ixia_error_parser

IXIA_VM = "10.0.39.6"
IXIA_USER = "appworker"
IXIA_PASS = "@utoUs3r"

ssh_cache = None

class IxVeriwaveParser:

  def __init__(self):
    pass
    
  def get_results(self, test_dir, test_type):
    '''
    Determines whether or not there was a testing error
    '''
    
    raw_results = ixia_csv_to_json(test_dir)
    processed_results = ixia_result_parser(raw_results, test_type, path=test_dir)
    errors = ixia_error_parser(raw_results)
    
    return {
      "raw": raw_results,
      "processed": processed_results,
      "errors": errors
    }
