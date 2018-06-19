##############################################################################
#                             !!! IMPORTANT !!!                              #
##############################################################################
#                                                                            #
# This script requires "sshpass" on the target VM to work. Unfortunately for #
# python, it seems that subprocess with "sshpass" is the best way to SSH     #
# into a remote machine                                                      #
#                                                                            #
# Sysadmins, make sure "sshpass" is installed!                               #
#                                                                            #
# That's all, folks!                                                         #
#                                                                            #
##############################################################################

try:
  import paramiko
except:
  print('ERROR: paramiko does not appear to be installed')
  print('Make sure you\'re running the correct version of python')
  print('Psst... "python" might be running Python 2.7. Try "python3"')
  print('To install paramiko, use "pip install paramiko"')
  exit()
  
import select
import platform
import os
import re
import argparse
import sys

class SSHClient:

  JUMP_SERVER_HOST = "96.37.189.5"
  JUMP_SERVER_USER = "root"
  JUMP_SERVER_PASS = "Ch@rt3RW1fi"
  
  def bytes_pending(self, timeout=0):
  
    stdout = self.stdout
    stdout_fd = stdout.channel
    
    ready = select.select([stdout_fd], [], [], timeout)
    
    if not ready[0]:
      return 0
      
    bytes = len(stdout_fd.in_buffer)
    
    if not bytes:
      # Pipe was ready, but no data. This *may* signal a close/disconnect
      raise IOError('No data')
    
    return bytes
    
  def read_bytes(self, bytes=-1, timeout=1):
    if bytes == -1:
      bytes = self.bytes_pending(timeout=timeout)
  
    return self.stdout.read(bytes).decode(encoding='utf-8')
  
  def send(self, cmd):
    self.stdin.write(cmd)
    
  def write(self, cmd):
    self.stdin.write(cmd)
  
  def wait_for(self, cmd, timeout=1, throw=False):
    
    buf = ''
    self.send('echo @@@\n{}\necho @EOF@\n'.format(cmd))
    
    while True:
    
      try:
        buf += self.read_bytes(timeout=timeout)
      except IOError:
        if throw:
          raise IOError
          
        self._start()
        break
        
      if buf[-7:] == '\n@EOF@\n':
        break
        
    return buf[4:-7]
  
  def filesize(self, *args):
    # Join all the provided paths
    subdir = os.path.join(*args).replace('\\', '/')
    
    # Execute the command remotely
    result = self.wait_for(
      "stat \"{}\" | grep Size | awk '{}print $2{}'".format(subdir, '{', '}')
    )
    
    return int(result.strip())
  
  def readdir(self, *args):
    '''
    Retrieves the contents of the directory
    '''
    
    # Join all the provided paths
    subdir = os.path.join(*args).replace('\\', '/')
    
    # Execute the command remotely
    result = self.wait_for('dir "{}"'.format(subdir))
    
    # Split 'dir' results, and sanitize them for whitespaces
    subdirs = [subdir.strip() for subdir in re.split(r'\s', result)]
    
    # Remove empty entries
    subdirs = filter(bool, subdirs)
    
    return subdirs

  def getcwd(self):
    return self.wait_for('pwd')
    
  def _start(self):

    if self.use_jump_server:
        command = 'sshpass -p {} ssh -T {}@{} -p 22 sh 2>&1'.format(
          self.password.replace('$', '\\$'), 
          self.username, 
          self.host
        )
    else:
      command = 'sh 2>&1'
      
    self.stdin, self.stdout, self.stderr = self.ssh.exec_command(command)
  
  def __init__(self, host, username, password, use_jump_server=False):
  
    if platform.system() == 'Windows' and host != SSHClient.JUMP_SERVER_HOST:
      # We want a jump server... This is running outside the lab
      use_jump_server = True
  
    self.host = host
    self.username = username
    self.password = password
    self.use_jump_server = use_jump_server
  
    ssh = paramiko.SSHClient()
    self.ssh = ssh
    
    ssh.load_system_host_keys()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    if use_jump_server:
      
      # We are using a jump server here
      ssh.connect(
        SSHClient.JUMP_SERVER_HOST, 
        username=SSHClient.JUMP_SERVER_USER, 
        password=SSHClient.JUMP_SERVER_PASS
      )
      
    else:
    
      # No jump server
      ssh.connect(host, username=username, password=password)
      
    # Start the bash shell
    self._start()
    
    # Verify connection
    self.wait_for('pwd', throw=True)
    
  def close(self):
    self.ssh.close()
    
    
def start_ssh(host, username, password):
  
  try:
    client = SSHClient(host, username, password)
  except (IOError, paramiko.ssh_exception.AuthenticationException):
    print(
      'Connection was not established. Perhaps incorrect credentials' 
      ', SSH fingerprint has not been added, or only one connection is allowed'
    )
    return
    
  while True:
    cmd = input('> ')
    # result = client.wait_for(cmd)
    # print(result)
    # continue
    
    client.send(cmd + '\necho @EOF@\n')
    
    loop = True
    while loop:
      try:
        bytes = client.bytes_pending(timeout=0.1)
        buf = client.read_bytes(bytes)
        if '@EOF@' in buf:
          buf = buf.replace('@EOF@\n', '')
          loop = False
          
        sys.stdout.write(buf)
          
      except IOError:
        # Restart the bash shell
        client._start()
        break
    
def main(args):

  host = args.host
  pwd = args.password
  
  regex = r'(?P<user>[A-Za-z0-9_]+)@(?P<host>[A-Za-z0-9_.]+)'
  results = re.match(regex, host)
  
  if not results:
    print('Invalid hostname')
    return
  
  user, host = results.group('user'), results.group('host')
  
  if not pwd:
    pwd = input('Enter password for {}: '.format(user))
  
  start_ssh(host, user, pwd)

if __name__ == '__main__':
  
  parser = argparse.ArgumentParser(
    description='Establish an SSH connection using a jump server if neccessary'
  )
  
  parser.add_argument(
    'host', metavar='user@host', type=str,
    help='Name of user and host to establish a connection'
  )
  
  parser.add_argument(
    '--password', type=str, default='', help='Use a password'
  )
  
  args = parser.parse_args()
  
  if args:
    main(args)
  
  