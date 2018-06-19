import logging
import os

class Controller:
    loggers = {}
    test_id = 'test'

    @property
    def log(self):
        class_name = type(self).__name__
       
        # Return existing logger, if any 
        if class_name in self.loggers:
            return self.loggers[class_name]

        # Set the log filename
        log_filename = ''
        # if self.test_id == 'test':
        #    log_filename = 'test.log'
        # else:
        log_filename = '{0}.log'.format(class_name)

        # Create the logger
        log = logging.getLogger(class_name)
        fh = logging.FileHandler(log_filename)
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - {0} - %(message)s'.format(class_name))
        fh.setFormatter(formatter)
        log.addHandler(fh)
        log.setLevel(logging.DEBUG)

        # Store the logger
        self.loggers[class_name] = log

        return log

    def clear_log(self):
        # Only allow the Test class to clear a log file.
        if __name__ == 'Test':
           if os.path.exists(self.log_filename):
                os.remove(self.log_filename)
