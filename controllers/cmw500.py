from .controller import Controller

class Cmw500(Controller):
    def  __init__(self, ip_address):
        self.ip_address = ip_address
        self.frequency = 0
        self.power_level = 0

        self.connect(self.ip_address)

    def connect(self, ip_address, timeout=20000, mode='ARB'):
        try:
            self.connection = resourceManager.open_resource('TCPIP::{0}::inst0::INSTR'.format(ip_address))
            self.ip_address = ip_address

            #Set timeout property high for potential delayed powerLevel cycles
            self.connection.timeout = timeout

            #Required query before initiating Skippy queries
            self.connection.query("*IDN?")

            #Reset
            self.connection.write("*RST")

            #BB - ARB
            self.connection.write("SOURce:GPRF:GEN:BBMode {0}".format(mode))

            self.log.info('Connected to Cmw500 at {0}'.format(self.ip_address))

        except Exception as ex:
            self.log.error('Exception [Cmw500::connect]: {0}'.format(ex))

    def get_frequency(self): 
        try:
            return self.frequency
        except Exception as ex:
            self.log.error('Exception [Cmw500::get_frequency]: {0}'.format(ex))

    def get_power_level(self):
        try:
            return self.power_level
        except Exception as ex:
            self.log.error('Exception [Cmw500::get_power_level]: {0}'.format(ex))

    def play_traffic(self, traffic_file, loop=False):
        try:
            #ARB File WLAN - MCS 8
            self.connection.write("SOURce:GPRF:GEN:ARB:FILE '{0}'".format(traffic_file))

            if loop:
                #Repetitive generation
                self.connection.write("SOURce:GPRF:GEN:ARB:REPetition CONtinuous")

            #Keep on
            self.connection.write("SOURce:GPRF:GEN:STATe on")

            self.log.info('TRAFFIC: {0}'.format(traffic_file))

        except Exception as ex:
            self.log.error('Exception [Cmw500::play_traffic]: {0}'.format(ex))

    def set_frequency(self, frequency):
        try:
            #Send Freq to CMW
            self.connection.write("SOURce:GPRF:GEN:RFSettings:Frequency {0}MHz".format( str(frequency) ))
            self.frequency = frequency

            self.log.info('FREQUENCY: {0}'.format(frequency))

        except Exception as ex:
            self.log.error('Exception [Cmw500::set_frequency]: {0}'.format(ex))
   
    def set_power_level(self, power_level): 
        try:
            #Send PowerLevel to CMW
            self.connection.write("SOURce:GPRF:GEN:RFSettings:Level {0}dBm".format( str(power_level) ))
            self.powerLevel = power_level

            self.log.info('POWERLEVEL: {0}'.format(frequency))
        except Exception as ex:
            self.log.error('Exception [Cmw500::set_power_level]: {0}'.format(ex))
