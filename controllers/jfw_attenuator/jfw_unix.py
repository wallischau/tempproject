import subprocess
import select

import socket

class JfwUnix:
    
  # JFW shouldn't send a buffer size anywhere near this limit
  RECV_BUFFER_SIZE = 4096
  
  def get_pending_buffer_length(self):
    
    bytes = 0
    ready = select.select([self.socket.fileno()], [], [], 5)
    
    if ready[0]:
      bytes = len(self.socket.recv(JfwUnix.RECV_BUFFER_SIZE, socket.MSG_PEEK))
    
    return bytes
    
  def get_pending_buffer(self):
    
    buf = ''
    
    bytes = self.get_pending_buffer_length()
    
    if bytes:
      buf = self.socket.recv(JfwUnix.RECV_BUFFER_SIZE).decode(encoding='utf-8')
    
    return buf
  
  def write(self, cmd):
    self.socket.send(cmd.encode())
    
  def close(self):
    if self.socket:
      self.socket.close()
      self.socket = None
    
  def __del__(self):
    self.close()
  
  def __init__(self, host, port):
  
    sock = self.socket = socket.socket()
    sock.settimeout(5)
    sock.connect((host, port))
    
    