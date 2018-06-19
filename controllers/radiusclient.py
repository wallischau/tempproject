from .controller import Controller
import subprocess

class RadiusClient(Controller):
    def __init__(self):
        self.log.info('Radius Client client created.')

    def auth_to_portal(self, portal_url, username, password):
        try:
            cmd = 'curl --data "j_username={0}&j_password={1}" http://{2}/ --cookie-jar /tmp/cookies.txt'.format(username,password,portal_url) 
            stdout = subprocess.Popen(cmd, subprocess.PIPE, shell=True).communicate()[0]
            
        except Exception as ex:
            self.log.error('Exception [RadiusClient::auth_to_portal]: {0}'.format(ex))

    def connect_to_ap(self, config_filename, dest_ip, dest_port, policy='auth', password='secret'):
        try:
            cmd = 'radclient -x -f {0} {1}:{2} {3} {4}'.format(config_filename, dest_ip, dest_port, policy, password) 
            stdout,stderr = subprocess.POpen(cmd, subprocess.PIPE, shell=True).communicate()

            if 'Received' not in stdout:
                return False

            return True
            
        except Exception as ex:
            self.log.error('Exception [RadiusClient::connect_to_ap]: {0}'.format(ex))
