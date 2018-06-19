import os
import re
import subprocess
import sys
import telnetlib
from controller import Controller

class ATA(Controller):

  def __init__(self, host, port=23):
    self.host = host
    self.port = port
    self.PROMPT = "ready>".encode()
    self.connect(self.host, self.port)
    self.clients = []

  def __del__(self):
    self.log.debug('[__del__]: Cleaning up...')
    #self.purge() 
    # Cleanup clients. 
    '''
    for client in self.clients:
      self.destroy_client(client)
    '''

  def associate_client(self, client_name):
    try:
      self.log.debug()
      response = self.send_cmd('automation', 'associateClient', 'clientName={client_name}'.format(client_name=client_name), None)
      return response
    except Exception as ex:
      self.log.error('Exception [associate_client]: {0}'.format(ex))
      sys.exit(1)

  def bind_port(self, port_name, chassis_ip, slot_number, port_number, options=None):
    try:
      self.log.debug("[bind_port]: Binding to {0} Slot {1} Port {2}".format(chassis_ip, slot_number, port_number))
      self.port_name = port_name

      response = None
      try_again = True
      while(try_again):
        response = self.send_cmd('automation', 'bindPort', 'portName={port_name},chassis={chassis_ip},slotNumber={slot_number},portNumber={port_number}'.format(port_name=port_name, chassis_ip=chassis_ip, slot_number=slot_number, port_number=port_number), options)
        if 'cmdStatus=fail_already_created' in response:
          self.log.warning('Port {0} already created; releasing and retrying...'.format(port_name))
          self.release_port(port_name)
          try_again = True
        else:
          try_again = False

      self.log.info("[bind_port]: Bound to Chassis {0} Slot {1} Port {2}".format(chassis_ip, slot_number, port_number))

      return response

    except Exception as ex:
      self.log.error('Exception [bind_port]: {0}'.format(ex))
      sys.exit(1)

  def clear_capture(self, port_name):
    try:
      self.log.debug('[clear_capture]: Clearing capture for Port {0}'.format(port_name))
      response = self.send_cmd('automation', 'clearCapture', 'portName={port_name}'.format(port_name=port_name), None)
      return response
    except Exception as ex:
      self.log.error('Exception [clear_capture]: {0}'.format(ex))
      sys.exit(1)

  def connect(self, host, port=23, username='admin'):
    try:
      self.log.debug("[connect]: Initiating connection to ATA at {0}:{1}...".format(host, port))

      self.tn = telnetlib.Telnet(host, port)

      response = self.tn.expect(["proceed: ".encode()])
      #self.log.debug("[connect]: {0}".format(response))

      self.tn.write("\r\n".encode())
      response = self.tn.expect(["username: ".encode()])
      #self.log.debug("[connect]: {0}".format(response))
      
      self.tn.write("{0}\r\n".format(username).encode())
      response = self.tn.expect([self.PROMPT])
      #self.log.debug("[connect]: {0}".format(response))

      self.log.info("[connect]: Connected to ATA")

    except Exception as ex:
      self.log.error('Exception [connect]: {0}'.format(ex))
      sys.exit(1)

  def create_client(self, client_name, ssid, options='type=802.11ac,security=off'):
    try:
      self.log.debug('[create_client]: Creating client {0}:{1}'.format(client_name, ssid))
      response = self.send_cmd('automation', 'createClient', 'name={client_name},ssid={ssid}'.format(client_name=client_name, ssid=ssid), options)
      self.clients.append(client_name)
      return response
    except Exception as ex:
      self.log.error('Exception [create_client]: {0}'.format(ex))
      sys.exit(1)

  def create_flow(self, flow_name, source, dest):
    try:
      self.log.debug('[create_flow]: Creating traffic flow...')
      response = self.send_cmd('automation', 'createFlow', 'flowName={0},source={1},destination={2}'.format(flow_name, source, dest), None)
      return response
    except Exception as ex:
      self.log.error('Exception [create_flow]: {0}'.format(ex))
      sys.exit(1)

  def destroy_client(self, client_name):
    try:
      self.log.debug('[destroy_client]: Destroying client {0}'.format(client_name))
      response = self.send_cmd('automation', 'destroyClient', 'name={client_name}'.format(client_name=client_name))
      return response
    except Exception as ex:
      self.log.error('Exception [destroy_client]: {0}'.format(ex))
      sys.exit(1)
    
  def disconnect(self):
    self.sock.close()

  def get_ap_info(self, bssid):
    try:
      self.log.info('[get_ap_info]: \n')
      response = self.send_cmd('automation', 'getAPInfo', 'BSSID={bssid}'.format(bssid=bssid), None)
      self.log.info(response)
      return response
    except Exception as ex:
      self.log.error('Exception [purge]: {0}'.format(ex))
      sys.exit(1)

  def purge(self, resource_type='all'):
    try:
      response = ''
      if resource_type == 'all':
        response = self.send_cmd('automation', 'purge', 'resourceType={resource_type}'.format(resource_type='ports'), None)
        response = self.send_cmd('automation', 'purge', 'resourceType={resource_type}'.format(resource_type='clients'), None)
        response = self.send_cmd('automation', 'purge', 'resourceType={resource_type}'.format(resource_type='flows'), None)
        response = self.send_cmd('automation', 'purge', 'resourceType={resource_type}'.format(resource_type='TMs'), None)
      else:
        response = self.send_cmd('automation', 'purge', 'resourceType={resource_type}'.format(resource_type=resource_type), None)
      
      return response

    except Exception as ex:
      self.log.error('Exception [purge]: {0}'.format(ex))
      sys.exit(1)

  def release_port(self, port_name):
    try:
      self.log.debug("[release_port]: Releasing Port {0}".format(port_name))
      response = self.send_cmd('automation', 'releasePort', 'portName={port_name}'.format(port_name=port_name), None)
      return response
    except Exception as ex:
      self.log.error('Exception [release_port]: {0}'.format(ex))
      sys.exit(1)

  def save_capture(self, port_name, filepath):
    try:
      self.log.debug('[save_capture]: Saving capture of Port {0} as {1}'.format(port_name, filepath))

      # Generate the file.
      filename = os.path.basename(filepath)
      response = self.send_cmd('automation', 'saveCapture', 'portName={port_name}'.format(port_name=port_name), 'file={filename}'.format(filename=filename))

      # Get the file.
      self.log.debug('[save_capture]: Retrieving saved capture file {0}...'.format(filepath))
      cmd = 'wget http://{0}/{1} -O {2}'.format(self.host, filename, filepath)
      self.log.debug('[save_capture]::cmd: {0}'.format(cmd))
      (stdout, stderr) = subprocess.Popen(cmd, stdin=subprocess.PIPE, shell=True).communicate()
      
      self.log.debug('[save_capture]::stdout: {0}'.format(stdout))

      if stderr:
        self.log.error('[save_capture]::stderr: {0}'.format(stderr))
        sys.exit(1)

      return response
    except Exception as ex:
      self.log.error('Exception [save_capture]: {0}'.format(ex))
      sys.exit(1)

  def scan_bss(self, port_name):
    try:
      response = self.send_cmd('automation', 'scanBSS', 'portName={port_name}'.format(port_name=port_name), 'duration=5')

      ap = []
      ap_idx = 0
      for line in response.split('\n'):
        if 'AP index' in line:
          bssid = re.search(r'BSSID: (?P<bssid>([a-z]|[0-9]|[:])*)', line).group('bssid')
          ssid = re.search(r' SSID: (?P<ssid>([a-z]|[A-Z]|[0-9]|[-])*)', line).group('ssid')
          rssi = re.search(r'RSSI: (?P<rssi>([-]|[\d])*)', line).group('rssi')
          ap.append({'bssid': bssid, 'ssid': ssid, 'rssi': rssi})
          ap_idx += 1

      return ap
    except Exception as ex:
      self.log.error('Exception [scan_bss]: {0}'.format(ex))
      sys.exit(1)

  def send_cmd(self, command_id, command, params, options):
    try:
      cli = '{command} '.format(command=command)
      for param in params.split(','):
        toks = param.split("=")
        key = toks[0]
        value = toks[1]
        cli = '{cli}{value} '.format(cli=cli, value=value) 

      if options:
        for option in str(options).split(','):
          toks = option.split("=")
          key = toks[0]
          value = toks[1]
          cli = '{cli}{key}={value} '.format(cli=cli, key=key, value=value) 

      self.log.debug('[send_cmd]::cli: {0}'.format(cli))

      self.tn.write("{0}\r\n".format(cli).encode())
      response = self.tn.expect([self.PROMPT])[2].decode()

      if 'cmdStatus=fail_nonexistent_object' in response or 'cmdStatus=Error' in response in response:
        self.log.error('[send_cmd]::response: \n{0}'.format(response))
        sys.exit(1)
      else:
        self.log.debug('[send_cmd]::response: \n{0}'.format(response))

      return response

    except Exception as ex:
      self.log.error('Exception [ATA::send_cmd]: {0}'.format(ex))
      sys.exit(1)

  def set_channel(self, port_name, band, channel):
    try:
      self.log.debug('[set_channel]: Setting channel to Band:{0} Channel:{1}'.format(band, channel))
      response = self.send_cmd('automation', 'setChannel', 'portName={port_name},band={band},channel={channel}'.format(port_name=port_name, band=band, channel=channel), None)
      return response
    except Exception as ex:
      self.log.error('Exception [ATA::set_channel]: {0}'.format(ex))
      sys.exit(1)

  def start_flow(self, flow_name):
    try:
      self.log.debug('[start_flow]: Starting flow {0}'.format(flow_name))
      response = self.send_cmd('automation', 'startFlow', 'flowName={flow_name}'.format(flow_name=flow_name), None)
      return response
    except Exception as ex:
      self.log.error('Exception [ATA::start_flow]: {0}'.format(ex))
      sys.exit(1)

  def stop_flow(self, flow_name):
    try:
      self.log.debug('[stop_flow]: Stopping flow {0}'.format(flow_name))
      response = self.send_cmd('automation', 'stopFlow', 'flowName={flow_name}'.format(flow_name=flow_name), None)
      return response
    except Exception as ex:
      self.log.error('Exception [ATA::stop_flow]: {0}'.format(ex))
      sys.exit(1)
