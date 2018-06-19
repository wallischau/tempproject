import json, requests, os
from time import sleep, time
from random import uniform
from copy import deepcopy

from .controller import Controller
from .exceptions import *

####
# config_sample = '{"ip": "10.3.65.158"}'
####

# These are the fields to be checked per action type
# These are baked into the Octoscope table API, will never change
comparison_fields = {
    'pos':      ['action', 'enable', 'pos_target', 'pos'], 
    'sweep':    ['action', 'enable', 'pos_sweep_from', 'pos_sweep_to', 'vel_target'], 
    'vel':      ['action', 'enable', 'vel_target', 'vel'], 
    'stop':     ['action', 'enable', 'vel'], 
    'home':     ['action', 'enable', 'pos'], 
    'reset':    ['action', 'enable']
}


#API updates patching

remove_from_post = ['pos', 'vel', 'version_firmware', 'dev_type', 'dev_serial', 'ether_mac', 'status', 'ip_static_address', 'ip_static_gateway', 'ip_static_subnet']


### Options:
RETRY_LIMIT = 8
MATCH_RANGE = 6 # min of 6 strongly recommened 
HTTP_DELAY = .1 # lower that .1 starts to increase connection errors
###

def rate_controlled(func):
    # limits how quickly a post/get request can be sent. The device is touchy
    def decorator(self, *args, **kwargs):
        while self.prev_request_time + HTTP_DELAY > time():
            sleep(.05)
        self.prev_request_time = time()
        return func(self, *args, **kwargs)
    return decorator


class TableState(dict):
    '''
    Adds a custom function for == operator
    '''
    def __init__(self, name='unnamed'):
        self.name = name
    def __str__(self):
        return self.name

    def __eq__(self, other):
        matchers = comparison_fields[self['action']]
        for m in matchers:
            if m in ['vel','pos', 'vel_target']:
                if float(self[m]) <= float(other[m]) - MATCH_RANGE or float(self[m]) >= float(other[m]) + MATCH_RANGE:
                    # print('matching:', m, self, self[m], other, other[m], other['status']) # handy for monitoring
                    return False
            elif str(self[m]) != str(other[m]):
                # print('matching:', m, self, self[m], other, other[m], other['status'])
                return False
        return True


class TurnTableController(Controller):
    '''
    Controls an Octobox turntable within a chamber.
    '''
    def __init__(self, config):
        # Support either JSON file or JSON string input
        json_obj = None
        if os.path.isfile(config):
            with open(config) as json_file:
                json_obj = json.load(json_file)
        else:
            json_obj = json.loads(config)

        try:
            self.ip = json_obj["ip"]
            self.url = 'http://%s/api/turntable' % self.ip
        except:
            raise EnvironmentError('Bad TurnTable config')
        
        self.prev_request_time = time()
        self.get_retry = 0
        self.set_retry = 0
        self.post_retry = 0
        self.current_state = TableState('cur')
        self.dream_state = TableState('req')

        # fill up the state objects
        self.get_state()
        self.dream_state.update(deepcopy(self.current_state))

        # saftey reset
        self.reset()

    @rate_controlled
    def get_state(self):
        try:
            r = requests.get(self.url, timeout=1).json()
        except:
            sleep(uniform(.5, 1))
            self.get_retry +=1
            if self.get_retry < RETRY_LIMIT:
                return self.get_state()
            else: 
                self.log.critical('TurnTable GET retry-limit reached - Unable to comunicate with turntable - exception raised')
                raise TurnTableUnusable('GET retry-limit reached')
        self.current_state.update(r)
        self.get_retry = 0
        return r

    @rate_controlled    
    def _post(self, state):
        post_state = state.copy()
        for k in remove_from_post:
            post_state.pop(k, None) 
        try:
            r = requests.post(self.url, json=post_state, timeout=1).json()
        except:
            self.post_retry += 1
            if self.post_retry < RETRY_LIMIT:
                sleep(uniform(.5, 1))
                self._post(state)
                return
            else: 
                self.log.critical('TurnTable POST retry-limit reached - requested action: %s - Unable to comunicate with turntable - exception raised' % state['action'])                
                raise TurnTableUnusable('POST retry-limit reached')

        if r['form_result'] == 'ok':
            self.post_retry = 0
            self.current_state.update(r)
        elif r['form_result'] == 'fail':
            self.set_retry += 1
            retry_state = self.dream_state.copy()
            if self.set_retry < RETRY_LIMIT:
                if self.current_state['status'] == '0000':
                    self.home()
                else:
                    self.stop()

                sleep(uniform(.5, 1))
                self._set_state(state)
                return
            else: 
                self.log.critical('TurnTable Failure -- POST Retry limit reached --- Error: %s' % r['form_error'])
                raise TurnTableUnusable('POST Retry limit reached --- Error: %s' % r['form_error'])
        else:
            self.log.critical('TurnTable Failure -- Unhandled form result %s' % r['form_result'])
            raise TurnTableUnusable('Unhandled form result %s' % r['form_result'])
        
        self.set_retry = 0

    def _state_match_check(self):
        self.get_state()
        if self.dream_state == self.current_state: 
            return True
        else:
            return False
    
    def _wait_for_match(self):
        timeout = 200 # not in seconds
        while not self._state_match_check() and timeout > 0:
            timeout -= 1
            sleep(.2)
        
        if not timeout: 
            self.log.critical('TurnTable Failure -- Timeout reached waiting for matching state')
            raise TurnTableUnusable('Timeout reached waiting for matching state')

    def _set_state(self, state_delta):
        state_delta.update({'enable': '1', 'pos_limit': '0'}) # every post needs these set
        self.dream_state.update(state_delta)
        if not self._state_match_check():
            self._post(state_delta)
            self._wait_for_match()
        print('COMPLETED ACTION', state_delta['action'])
        return

    def home(self): 
        self.log.info('Moving turntable %s to HOME' % self.ip)     
        self._set_state({'action': 'home', 'pos': '0', 'vel_target': '10000'})

    def stop(self):
        self.log.info('Stoping turntable %s' % self.ip)      
        self._set_state({'action': 'stop', 'vel': 0})

    def position(self, target_pos):
        while target_pos >= 360:
            target_pos -= 360
        self.log.info('Moving turntable %s to %s degrees' % (self.ip, str(target_pos)))
        target_pos = str(target_pos)
        state_delta = {'action': 'pos', 'pos_target': target_pos, 'pos': target_pos, 'vel_target': '10000'}
        self._set_state(state_delta)
        
    def spin(self, rpm=10):
        vel_target = rpm * 1000.0
        if abs(vel_target) > 10000.0:
            raise TurnTableInvalidRequest('RPM must be between -10 and 10')
        self.log.info('Spining turtable %s at %s rpm' % (self.ip, str(rpm)))
        self._set_state({'action': 'vel', 'vel_target': vel_target, 'vel': vel_target})
    
    def sweep(self, pos_sweep_from, pos_sweep_to, rpm=10):
        vel_target = rpm * 1000.0
        if abs(vel_target) > 10000.0:
            raise TurnTableInvalidRequest('RPM must be between -10 and 10')
        self.log.info('Sweeping turntable %s between %s and %s at %s rpm' % (self.ip, str(pos_sweep_from), str(pos_sweep_to), str(rpm)))
        self._set_state({'action': 'sweep', 'pos_sweep_from': str(pos_sweep_from), 'pos_sweep_to': str(pos_sweep_to), 'vel_target': str(vel_target)})

    def reset(self):
        self.log.info('Reseting turntable %s' % self.ip)
        self._set_state({'action': 'reset'})
