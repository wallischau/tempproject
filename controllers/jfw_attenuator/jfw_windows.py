import os
import sys
import select
import random

# Add the 'controllers' folder so the rest of our code can access ssh control
# current_dir = os.path.dirname(os.path.realpath(__file__))
# sys.path.append(os.path.join(current_dir, '..'))

import ssh as ssh_helper

class JfwWindows:
  
  # Telnet escape character
  TELNET_ESCAPE_CHARACTER = 'q'
    
  def get_pending_buffer_length(self):
    ready = select.select([self.ssh.stdout.channel], [], [], 1)
    bytes = len(self.ssh.stdout.channel.in_buffer)
    
    return bytes
  
  def get_pending_buffer(self):
    
    buf = ''
    
    bytes = self.get_pending_buffer_length()
    
    if bytes:
      buf = self.ssh.stdout.read(bytes).decode(encoding='utf-8')
    
    return buf
  
  def write(self, cmd):
    self.ssh.stdin.write(cmd)
    
  def _kill_telnet_process(self):
    ssh = ssh_helper.SSHClient(
      ssh_helper.SSHClient.JUMP_SERVER_HOST,
      ssh_helper.SSHClient.JUMP_SERVER_USER,
      ssh_helper.SSHClient.JUMP_SERVER_PASS
    )
    
    cmd = 'ps -ef | grep q{} | awk \'{}print "kill " $2{}\' | sh'.format(
      self.telnet_id,
      '{',
      '}',
    )
    
    ssh.stdin.write(cmd + '\n')
    
    buf = ssh.read_bytes()
    
  def close(self):
    
    # Send the escape sequence
    self.write(JfwWindows.TELNET_ESCAPE_CHARACTER)
    self.write('quit\n')
    
    # Check for incoming data
    buf = self.get_pending_buffer()
    
    if 'telnet> Connection closed.\r' in buf:
      # Connection may now be safely closed
      pass
    else:
      # This usually happens when connection failed
      self._kill_telnet_process()
      
    self.ssh.close()
  
  def __init__(self, host, port):
  
    self.telnet_id = random.randint(1, 9999)
  
    cmd = 'telnet -e {}{} {} {}'.format(
      JfwWindows.TELNET_ESCAPE_CHARACTER, 
      self.telnet_id,
      host, 
      port
    )
      
    # Use a jump server on Windows(dev)
    ssh = ssh_helper.SSHClient(
      ssh_helper.SSHClient.JUMP_SERVER_HOST,
      ssh_helper.SSHClient.JUMP_SERVER_USER,
      ssh_helper.SSHClient.JUMP_SERVER_PASS
    )
    
    self.ssh = ssh
    
    self.write(cmd + '\n')
    
