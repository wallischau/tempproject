from .utilities.ixia_csv_to_json import ixia_csv_to_json
from .utilities.ixia_result_parser import ixia_result_parser, ixia_error_parser

class IxVeriwaveParser:

    def __init__(self):
        pass
        
    def get_results(self, test_dir, test_type, case_name):
        '''
        Determines whether or not there was a testing error
        '''
        results_dir = '{}/{}'.format(test_dir, case_name)
        
        raw_results = None
        try:
            raw_results = ixia_csv_to_json(results_dir)
        except:
            raw_results = {
                'csv': {},
                'wml': {
                    'empty_results': {}
                }
            }
        processed_results = ixia_result_parser(raw_results, test_type, path=results_dir)
        errors = ixia_error_parser(raw_results)
        
        return {
            "raw": raw_results,
            "processed": processed_results,
            "errors": errors
        }
