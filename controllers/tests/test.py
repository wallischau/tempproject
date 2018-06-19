from controller import Controller
from lab import Lab

class Test(Controller):
    name = None

    def __init__(self, test_config, lab_config):
        self.log.info('[__init__]: Initializing Test...')

        self.results = []

        ###########
        # THE LAB #
        ###########
        self.log.info('[__init__]: Creating lab...')
        if lab_config:
            self.lab = Lab(lab_config)
        else:
            raise Exception("Exception: [Test::__init__]: Lab config not found!")

    #############################
    # COMMON TEST FUNCTIONALITY #
    #############################

    def execute(self):
        raise NotImplementedError("Test::execute must be overridden!")

    def get_results(self):
        return self.results
