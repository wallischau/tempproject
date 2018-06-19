##############################################################################
#                                HOW TO USE                                  #
##############################################################################
# 
# This can be used as a *class* or via *cli*
#
#                           [:: API COMMANDS ::]
# 
# STEP 1: INSTANTIATE JFW OBJECT
# ------------------------------
# try:
#   client = Jfw("10.3.65.90", 3001)
# except IOError:
#   print('Could not connect')
#
# STEP 2: PERFORM OPERATIONS
# --------------------------
# >>> client.get_all_attenuations()
# {1: 39, 2: 41, 3: 39, 4: 40, 5: 39, 6: 36, 7: 36, 8: 36, 9: 39, 10: 39, 
# 11: 39, 12: 39, 13: 38, 14: 38, 15: 38, 16: 38}
# 
# >>> client.get_attenuation(1,2,3,4)
# {1: 39, 2: 41, 3: 39, 4: 40}
# 
# >>> client.set_attenuation({1: 30, 2: 40})
#
# STEP 3: CLOSE JFW
# -----------------
# client.close()
#
#                           [:: CLI COMMANDS ::]
#
# Get all port attenuations
# -------------------------
# python jfw.py 10.3.65.90 3001
#
# OUTPUT:
# GET|SUCCESS|1:39
# GET|SUCCESS|2:41
# GET|SUCCESS|3:39
# GET|SUCCESS|4:40
# GET|SUCCESS|5:39
# GET|SUCCESS|6:36
# GET|SUCCESS|7:36
# GET|SUCCESS|8:36
# GET|SUCCESS|9:39
# GET|SUCCESS|10:39
# GET|SUCCESS|11:39
# GET|SUCCESS|12:39
# GET|SUCCESS|13:38
# GET|SUCCESS|14:38
# GET|SUCCESS|15:38
# GET|SUCCESS|16:38
#
# 
# Get attenuation for ports 1, 3, and 5
# -------------------------------------
# python jfw.py 10.3.65.90 3001 --get 1 3 5
#
# OUTPUT:
# GET|SUCCESS|1:39
# GET|SUCCESS|3:39
# GET|SUCCESS|5:39
# 
# Get attenuation for ports 1, 2 and non-existent 99
# --------------------------------------------------
# python jfw.py 10.3.65.90 3001 --get 1 2 99
#
# OUTPUT:
# GET|SUCCESS|1:39
# GET|SUCCESS|2:41
# GET|ERROR|99:does not exist
# 
# 
# Set attenuation to 39dB for ports 1, 6, and 8
# ----------------------------------------------
# python jfw.py 10.3.65.90 3001 --set 1 39 3 39 5 39
#
# OUTPUT:
# SET|SUCCESS|successfully modified port(s)
# 
# 
# Set attenuation to 22dB for ports 1, 3 and non-existent 99
# ----------------------------------------------------------
# python jfw.py 10.3.65.90 3001 --set 1 22 3 22 99 22
#
# OUTPUT:
# SET|ERROR|Atten 99 does not exist
#
# 
# Get attenuation for ports 2 and 4 then set attenuation for port 2 to 41dB
# -------------------------------------------------------------------------
# NOTE: Get operation ALWAYS happens first, then Set operation
# python jfw.py 10.3.65.90 3001 --get 2 4 --set 2 41
#
# OUTPUT:
# GET|SUCCESS|2:40
# GET|SUCCESS|4:40
# SET|SUCCESS|successfully modified port(s)
#
# 
# Unable to connect
# -----------------
# python jfw.py 10.3.64.90 3001
#
# OUTPUT:
# CONNECT|ERROR|could not connect to 10.3.64.90:3001
#
##############################################################################

import os
import sys
import argparse
import platform
import select
import re
import json
import time

from jfw_windows import JfwWindows
from jfw_unix import JfwUnix

class Jfw:
  '''
  Controller class for JFW
  '''
    
  class SyntaxError(Exception):
    pass
    
  class PortException(Exception):
    pass
    
  def _read_jfw_output(self):
    '''
    Reads JFW formatted data from stdout
    
    :return: returns telnet output as a string
    '''
    buf = ''
  
    while buf[-2:] != '\n\n':
      
      buf += self.jfw.get_pending_buffer()
      
      if buf[-2] == '\x00':
        break
      
    return buf
    
    
  def _write(self, cmd):
    '''
    Sends a command to the JFW controller
    
    :param cmd: the command string to send to the controller
    '''
    self.jfw.write(cmd)
    
  def _wait(self):
    '''
    Waits for a buffer to be available from stdout. The difference between 
    this and _read_jfw_output is that this will wait for any data versus 
    waiting for JFW formatted data
    
    :return: returns buffer as as string
    '''
    return self.jfw.get_pending_buffer()
    
  def __init__(self, host, port):
    '''
    Constructor. Initializes the telnet connection. It will use a jump server
    on Microsoft Windows
    
    :param host: The IP of the JFW
    :param port: The TCP port for the JFW
    '''
    
    # In case of an error, so self.close() doesn't complain
    self.jfw = None
    
    if platform.system() == 'Windows':
      # This uses an SSH session through a jump server
      self.jfw = JfwWindows(host, port)
    
    else:
      # This uses a direct TCP connection to JFW
      self.jfw = JfwUnix(host, port)
      
    try:
      # This attemps to read the welcome message
      # NOTE: The welcome message has the JFW model(Ex: 50PA-220-16)
      output = self._read_jfw_output()
      
    except IndexError:
      # Assume there was an error connecting
      raise IOError
    
  def _parse_attenuation_output(self, buf):
    '''
    Parses Jfw RA(read attenuation) output and formats it into a dictionary
    
    :param buf: A text buffer
    :return: Returns a dictionary containing {port: attenuation} entries
    '''
    buf = filter(bool, buf.split('\n'))
    
    ret = {}
    for notice in buf:
      
      # For successes
      regex_success = r'Atten #(?P<port>[0-9]+) = (?P<value>[0-9]+)dB'
      result_success = re.search(regex_success, notice)
      
      # For errors
      regex_error = r'Atten (?P<port>[0-9]+) does not exist'
      result_error = re.search(regex_error, notice)
      
      if result_success:
        ret[int(result_success.group('port'))] = int(
          result_success.group('value')
        )
        
      elif result_error:
        ret[int(result_error.group('port'))] = 'does not exist'
        
    
    return ret
    
  def get_all_attenuations(self):
    '''
    Fetches attenuation for all ports
    
    :return: Returns a dictionary with ports and attenuation
    '''
    
    # Read All Attenuation
    cmd = 'RAA'
    
    self._write(cmd + '\r\n')
    
    
    buf = self._read_jfw_output()
    
    return self._parse_attenuation_output(buf)
    
    
  def get_attenuation(self, *ports):
    '''
    Fetches attenuation for the specified ports
    
    :param ports: A list of ports to read the attenuation
    :return: Returns a dictionary with ports and attenuation
    '''
    
    # Read Attenuation
    cmd = 'RA ' + ' '.join([str(i) for i in ports])
    
    self._write(cmd + '\n')
    
    buf = self._read_jfw_output()
      
    return self._parse_attenuation_output(buf)
    
  def set_attenuation(self, port_values):
    '''
    Sets attenuation for a list of ports
    
    :param port_values: a {port: attenuation} dictionary
    :return: Returns a string containing the result of the operation
    '''
    all_ports = []
    
    for port, value in port_values.items():
      all_ports.append(port)
      all_ports.append(value)
    
    
    # Set Multiple Attenuation
    cmd = 'SMA ' + ' '.join([str(i) for i in all_ports])
    
    self._write(cmd + '\n')
    
    buf = self._read_jfw_output()
    
    if 'Syntax Error' in buf:
      # Throws a syntax error. It could be a bad port
      raise Jfw.SyntaxError("Syntax Error. Check that all ports exist")
      
    elif 'does not exist' in buf:
      # Return the error message
      raise Jfw.PortException(buf.strip())
    
  def close(self):
    
    if self.jfw:
      self.jfw.close()
      self.jfw = None
    
  def __del__(self):
    self.close()
    
def print_format(mydict):
  
  for port, attn in mydict.items():
    label = ['SUCCESS', 'ERROR'][int(isinstance(attn, str))]
    print('GET|{}|{}:{}'.format(label, port, attn))
  
    
def main(args):
  '''
  CLI main
  
  :param args: Arguments passed in from the CLI
  '''
  
  # Create the Jfw client
  output = {
    "set": None,
    "get": None
  }
  
  try:
    client = Jfw(args.host, args.port)
  except IOError:
    print('CONNECT|ERROR|could not connect to {}:{}'.format(
      args.host,
      args.port
    ))
    return
  
  if not args.set and not args.get:
    # If no "--get" or "--set" is used, fetch all the ports.
    result = client.get_all_attenuations()
    print_format(result)
    
  if args.get:
    # "--get" attenuation
    
    try: 
      result = client.get_attenuation(*args.get)
      print_format(result)
    except Exception as e:
      print('GET|ERROR|{}'.format(str(e)))
    
    
  if args.set:
    # "--set" attenuation
    
    if (len(args.set) & 1):
      # Arguments must be even(Ex: <port1> <attn1> <port2> <attn2>)
      print('SET|ERROR|set operation must have event amount of arguments')
      
    else:
      # We may set the ports
      
      # Split into 2 lists(one for ports, one for attenuation values)
      set1 = args.set[0::2]
      set2 = args.set[1::2]
      
      # Zip the two lists. We'll end up with a list of tupled pairs
      zipped_set = zip(set1, set2)
      
      # List of tupled pairs can be used to construct a dictionary
      dict_set = dict(zipped_set)
      
      # ...And set the attenuation
      try:
        client.set_attenuation(dict_set)
        print('SET|SUCCESS|successfully modified port(s)')
      except Exception as e:
        print('SET|ERROR|{}'.format(str(e)))
      
  # We *MUST* close off the connection
  client.close()
  

if __name__ == '__main__':
  
  # This section only runs if we're executing the script directly/CLI
  
  parser = argparse.ArgumentParser(
    description='Jfw attenuator controller'
  )
  
  parser.add_argument(
    'host', 
    type=str,
    help='Name of the host to establish connection to'
  )

  parser.add_argument(
    'port', 
    type=int,
    help='Specifies the JFW TCP port'
  )
  
  parser.add_argument(
    '--get', 
    help='Get the attenuation for a list of ports', 
    type=int, 
    nargs='+'
  )
  
  parser.add_argument(
    '--set', 
    help='Set the attenuation for a list of ports. Use <portno> <attn>', 
    type=int, 
    nargs='+'
  )
  
  args = parser.parse_args()
  
  main(args)
  