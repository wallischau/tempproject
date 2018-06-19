from ssh import SSHClient

IXIA_VM = "10.0.39.6"
IXIA_USER = "appworker"
IXIA_PASS = "@utoUs3r"

ssh_cache = None

class IxVeriwaveRunner:

  def __init__(self):
    
    global ssh_cache
    
    if not ssh_cache:
      ssh_cache = SSHClient(IXIA_VM, IXIA_USER, IXIA_PASS) 
    
    self.ssh = ssh_cache
      
    
  def is_pid_running(self, pid):
    '''
    Determines whether or not the pid is running
    '''
    result = self.ssh.wait_for('ps -e | grep {}'.format(pid))
    return bool(result)
