class ControllerException(Exception):
    '''
    base exception class for any exceptions encountered in
    controller functionality
    '''
    pass

class MobileDeviceNotFound(ControllerException):
    '''
    raised during initialization of a MobileClient
    if a client with the specified serial number is not found
    '''
    pass

class NetworkError(ControllerException):
    '''
    raised if an HTTP or WebSocket request fails in a
    controller class
    '''
    pass

### Power Controller

class PowerControllerException(ControllerException):
    '''
    base exception class for any exceptions encountered in the PowerController
    '''
    pass 

class SNMPError(PowerControllerException):
    '''
    raised if a SNMP request fails during a request
    '''
    pass

class BadPowerRequestError(PowerControllerException):
    '''
    raised if there was a problem with the requested power control action
    '''
    pass

### Turn Table 

class TurnTableUnusable(ControllerException):
    '''
    raised if Table is not able to be controlled. This should mean the test will abort
    '''
    pass

class TurnTableInvalidRequest(ControllerException):
    '''
    raised if request to table fails
    '''
    pass

