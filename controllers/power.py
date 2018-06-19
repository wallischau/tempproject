import json
from pysnmp.hlapi import *

from controller import Controller
from exceptions import *

############~~~~~
## helper function -- testing only 
def get_temp_config():
    with open("controllers/config_samples/power_full_config.json") as json_file:
        return json.dumps(json.load(json_file))
############~~~~~

####
# SNMP action values 
ON = 1
OFF = 2
RESTART = 3
####

def handle_outlet_code(func):
    '''
    decorator fucntion -- checks that the outlet_code is valid and then try to send the SNMP message
    '''
    def decorator(self, outlet_code):
        if (len(outlet_code ) != 4):
            raise BadPowerRequestError('outlet_code is not 4 characters') 
        try:
            rack_number = outlet_code[:2] 
            outlet_number = int(outlet_code[2:])
            outlet_ip = self.outletData[rack_number]['ip']
        except ValueError: 
            raise BadPowerRequestError('Error with outlet number')
        except KeyError:
            raise BadPowerRequestError('Error with rack number')            
        except:
            raise PowerControllerException('Error with outlet_code')
        
        if outlet_number not in self.outletData[rack_number]['outlets']:
            raise BadPowerRequestError('Outlet does not exist')

        try: 
            func(self, {'ip': outlet_ip, 'outlet_number': outlet_number})
        except:
            self.log.error('Error handing power control command: ip %s - outlet %s' % (outlet_ip, outlet_number))
            raise SNMPError('SNMP message fail')

    return decorator


class PowerController(Controller):
    '''
    an object that controls any power outlets that are in it's config
    '''
    def __init__(self, config=None):
        config = config or get_temp_config()
        try:
            self.outletData = json.loads(config)
        except:
            raise EnvironmentError('Bad config')

    def snmp_set(self, outlet, action):
        '''
        take the outlet info {outlet_num, ip} plus action and send the snmp set command
        '''
        errorIndication, errorStatus, errorIndex, varBinds = next(
            setCmd(SnmpEngine(),
                CommunityData('control'), #this is the read/write snmp string set in the device's config
                UdpTransportTarget((outlet['ip'], 161)),
                ContextData(),
                ObjectType(ObjectIdentity('1.3.6.1.4.1.1718.3.2.3.1.11.1.1.%s' % (outlet['outlet_number'])), Integer32(action)))
        )
        if errorIndication:
            raise SNMPError('No SNMP response')            
        elif errorStatus:
            raise SNMPError('SNMP Error')
        else: # Success! 
            for varBind in varBinds:
                #### todo: send confirmation/callback to whomever may care here
                print(' = '.join([x.prettyPrint() for x in varBind]))
    
    def snmp_get(self, outlet): 
        '''
        take the outlet info and retrieve the current status of the outlet
        '''
        errorIndication, errorStatus, errorIndex, varBinds = next(
            getCmd(SnmpEngine(),
                CommunityData('public'),
                UdpTransportTarget((outlet['ip'], 161)),
                ContextData(),
                ObjectType(ObjectIdentity('1.3.6.1.4.1.1718.3.2.3.1.5.1.1.%s' % (outlet['outlet_number']))))
        )

        if errorIndication:
            raise SNMPError('No SNMP response')
        elif errorStatus:
            raise SNMPError('SNMP Error')            
        else: # Success!            
            for varBind in varBinds:
                # send info/callback here 
                print(' = '.join([x.prettyPrint() for x in varBind]))

### These methods below are the API part of the controller. 
    @handle_outlet_code
    def turn_off(self, outlet):
        self.snmp_set(outlet, OFF)
        self.log.info('OFF - outlet %s turned off' % outlet['outlet_number'])
    
    @handle_outlet_code
    def turn_on(self, outlet):
        self.snmp_set(outlet, ON)
        self.log.info('ON - outlet %s turned on' % outlet['outlet_number'])        

    @handle_outlet_code
    def restart(self, outlet):
        self.snmp_set(outlet, RESTART)
        self.log.info('Restart - outlet %s restarted' % outlet['outlet_number'])        

    @handle_outlet_code    
    def get_status(self, outlet):
        self.snmp_get(outlet)

    # def in_case_of_emergency(self):
    #     for r in self.outletData:
    #         for o in r['outlets']: 
    #             self.snmp_set({'outlet_number': o, 'ip': r['ip'] }, OFF)
