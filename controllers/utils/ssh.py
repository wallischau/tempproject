import subprocess, logging, select, time, uuid

logger = logging.getLogger(__name__)

class SSHCommand:
    '''
    really just a wrapper for stdout that decodes a byte string into a normal str without the trailing newline
    '''
    def __init__(self, proc):
        self.pending_buf = ''
        self.proc = proc

    def __iter__(self):
        # iterate through lines in stdout
        for line in self.proc.stdout:
            out =  line.decode().strip()
            logger.debug(out)
            yield out

    def finished(self):
        '''
        determine if this process has terminated
        :return: bool
        '''
        self.proc.poll()
        return self.proc.returncode is not None
        
    def get_bytes(self, timeout=0):
        '''
        Returns the amount of bytes pending to be read from STDOUT
        :param timeout: the maximum amount of time to wait on select() 
        :return: the amount of pending bytes
        '''
    
        #
        # Returns a 3-length tuple containing a list of file descriptors
        # that are ready to READ, WRITE or have ERRORS
        #
        # ready = ([<STDOUT FILE NO>], [], [])
        #
        # select() is a blocking call with a timeout. As soon as there
        # is a file descriptor that is ready for an operation, select() will 
        # IMMEDIATELY return. Otherwise, it will wait until :timeout: 
        # has elapsed before returning
        #
        # select() is a POSIX(Portable Operating System Interface) function
        # that works on ANY modern operating system
        #
        # Its only limitation is that Microsoft Windows does not operate
        # on file numbers; it operates on HANDLE objects, thus, this call
        # will not work on Windows unless you are spefically using sockets
        #
        ready = select.select([self.proc.stdout.fileno()], [], [], timeout)
        
        if ready[0]:
            #
            # There's no way "pythonic" way determine the amount of data in
            # the pipe
            #
            # There is os.lseek(), but it cannot be used on Linux as
            # the user is not permitted to seek on a pipe
            #
            # However, we can use peek(-1) so that it returns the data that is
            # currently available in the buffer. NOTE: calling peek(-1) when
            # there is no data will BLOCK
            #
            # Additionally, read(-1) will not work because read() will wait
            # until there is an EOF before returning
            #
            # Thus, we have to use this little trick to get an idea of how
            # many bytes we have in the buffer
            #
            pending_bytes = len(self.proc.stdout.peek(-1))
            self.pending_buf += self.proc.stdout.read(pending_bytes).decode()
        
        #
        # Return the amount of pending bytes in STDOUT
        #
        return len(self.pending_buf)
        
    def get_buffer(self, timeout=0):
        '''
        Returns the buffer, as a string, from STDOUT
        :param timeout: the maximum amount of time to wait on select() 
        :return: STDOUT data as a string
        '''
        
        #
        # Obtain the amount of bytes in the STDOUT buffer. This call will
        # also fetch all the pending bytes
        #
        bytes = self.get_bytes(timeout=timeout)
        
        #
        # If there are no bytes, return an empty string
        #
        if bytes == 0:
            return ''
            
        #
        # Return the buffer and clear it out
        #
        response = self.pending_buf
        self.pending_buf = ''        
        
        #
        # Return the buffer
        #
        return response
        
    def readline(self):
        '''
        read a line from stdout, decode, strip trailing newline
        :return: the line
        '''
        out = self.proc.stdout.readline().decode().strip()
        logger.debug(out)
        return out

    def close(self):
        '''
        close the underlying file descriptor for stdout
        '''
        self.proc.stdout.close()

    def write(self, msg):
        '''
        send a message to process stdin
        :param msg: string to send - any newlines necessary should be included here
        '''
        self.proc.stdin.write(msg.encode())
        self.proc.stdin.flush()

class SSHSession:
    '''
    an ssh "session". no session is actually created, a new session is just created for each command
    executed. the old implementation of this class used paramiko, so a sesison was actually maintained
    '''
    def __init__(self, host, username, password, port=22):
        self.host = host
        self.username = username
        self.password = self.bash_escape(password)
        self.port = port

    def bash_escape(self, string):
        '''
        escape special characters so bash can interpret them properly
        :param string: the string to be escaped
        :return: the escaped string
        '''
        special_chars = ('\\', '!', '$', '"', '\'', ' ')
        for char in special_chars:
            string = string.replace(char, '\\' + char)
        return string

    def exec(self, cmd):
        '''
        execute a command via ssh
        :param cmd: the command to be executed - str
        :return: an SSHCommand instance with the stdout and stderr from the executed command
        '''
        logger.debug('executing %s' % cmd)
        ssh_cmd = 'sshpass -p {password} ssh -T {username}@{host} -p {port} {cmd}'.format(cmd=cmd, **self.__dict__)
        proc = subprocess.Popen(ssh_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        return SSHCommand(proc)

    def close(self):
        '''this method only exists because it was in the old implementation'''
        pass

class LocalVMSSHSession(SSHSession):
    def __init__(self):
        params = {
            'username': 'appworker',
            'password': '@utoUs3r',
            'port': 22,
            'host': '10.0.39.6',
        }
        super(LocalVMSSHSession, self).__init__(**params)

class DUTSSHSession(SSHSession):
    '''
    This is a class to access the DUT CLI to modify its configuration
    '''
    
    DUT_USERNAME = 'technician'
    DUT_PASSWORD = 'R3MOT3ACC36220'
    DUT_TIMEOUT = 5
    
    STARTUP_PROMPT = 'WTA_TERMINAL_SERVER>'
    TELNET_USERNAME_PROMPT = '... Open\r\n'
    TELNET_PASSWORD_PROMPT = 'Password: '
    TELNET_SHELL_PROMPT = '# '
    TELNET_LOGOUT_PROMPT = ' login: '
    
    MAX_RETRIES = 5
    
    #
    # This is currently not used.
    #
    # Perhaps something to implement in the future. We are only allowed a 
    # single Telnet session, so a DUTSSHSession() may start throwing 
    # connection refused errors
    #
    # NOTE: If your application throws an exception while there's a 
    # DUTSSHSession active, the session will not close and creating
    # subsequent sessions will fail. To fix this, restart your application. It
    # does not seem like the __del__ destructor gets called in this case
    #
    # TODO: Implement this if current implementation gives trouble in the 
    # future
    #
    _ssh_cache = {}
    
    class InvalidPrompt(Exception):
        pass
    
    class CmdTimeout(Exception):
        pass
    
    class MaxConnectionRetries(Exception):
        pass
    
    class ConnectionRefused(Exception):
        pass
    
    class IncorrectLogin(Exception):
        pass
    
    def expect(self, *args, **kwargs):
        '''
        This function will receive buffers from STDOUT until the ending portion
        makes a match with :prompt:
        '''
        
        #
        # Create a reference to our SSHSession object
        #
        ssh = self.ssh
    
        #
        # Prepare our variables
        #
        expected_prompts = args
        
        response = ''
        buf = ''
        got_prompt = ''
        success = False
        
        #
        # Make sure we obtain the proper prompt. Since Telnet is slow, our
        # channel receives the information in small chunks. We'll aggregate
        # all the chunks and check the ending of the string for out match
        #
        while True:
        
            #
            # Wait for buffer to come in through the STDOUT pipe
            #
            buf = ssh.get_buffer(timeout=DUTSSHSession.DUT_TIMEOUT)
            
            if buf == '':
                #
                # There was no response within 'DUT_TIMEOUT' seconds. We'll return
                # because we'll assume there is nothing else we can do
                #
                break
            
            #
            # Append the buffer to our overall response so that we may check
            # for a pattern
            #
            response += buf
            
            #
            # Check for pattern
            #
            for expected_prompt in expected_prompts:
                got_prompt = response[-len(expected_prompt):]
                if got_prompt == expected_prompt:
                    success = True
                    break
                    
            if success:
                break
    
        #
        # Throw exceptions if necessary
        #
        
        if response == '':
            #
            # There was no response within 'DUT_TIMEOUT' seconds. We'll assume
            # that this is an error and raise an exception
            #
            raise DUTSSHSession.CmdTimeout('SSH session did not respond within {} seconds'.format(DUTSSHSession.DUT_TIMEOUT))
            
        elif not success:
            #
            # We did not receive the proper prompt. We'll assume that this is
            # an error and throw an exception
            #
            logger.debug('== INCORRECT RESPONSE ==')
            logger.debug(response)
            logger.debug('========================')
            raise DUTSSHSession.InvalidPrompt('Got "{}" but was expecting "{}"'.format(got_prompt, expected_prompts))
    
    
        return response, buf, got_prompt, success
    
    def _start(self, chamber='A', counter=0):
    
        if counter > DUTSSHSession.MAX_RETRIES:
            raise DUTSSHSession.MaxConnectionRetries('{} unsuccessful connections were attempted (is telnet session is hanging on a command?)'.format(counter))
    
        ssh = super(DUTSSHSession, self).exec("-o KexAlgorithms=diffie-hellman-group14-sha1")
        
        self.chamber = chamber
        self.ssh = ssh
        
        #
        #
        # Step 1, ensure that the prompt is correct
        #
        #
        response, buf, got_prompt, success = self.expect(DUTSSHSession.STARTUP_PROMPT)
         
        #
        #
        # Step 2, telnet into the Chamber
        #
        #
        
        ssh.write('telnet Chamber{}\n'.format(chamber))
        response, buf, got_prompt, success = self.expect(DUTSSHSession.TELNET_USERNAME_PROMPT, DUTSSHSession.STARTUP_PROMPT)
        
        #
        # This error usually occurs when the connection is refused. We will
        # get the cisco SSH prompt 
        #
        if got_prompt == DUTSSHSession.STARTUP_PROMPT:
            raise DUTSSHSession.ConnectionRefused('Connection refused on telnet session (Does a connection already exist?)')
            
            
        #
        #
        # Step 3, enter credentials
        #
        #
        
        #
        # Enter the username then wait for the password prompt
        #
        ssh.write('{}\n'.format(DUTSSHSession.DUT_USERNAME))
        response, buf, got_prompt, success = self.expect(DUTSSHSession.TELNET_SHELL_PROMPT, DUTSSHSession.TELNET_PASSWORD_PROMPT, '\r\n')
        
        #
        # Most of the times we're asked for a password. Sometimes, telnet
        # will log in automatically
        #
        if got_prompt == DUTSSHSession.TELNET_SHELL_PROMPT:
            return
            
            
        #
        # Enter the password then wait for the telnet prompt
        #
        # There is a "bug" where the prompt will return "<PASSWORD>\r\n". 
        #
        # It also seems to happen with PuTTY so it's not necessarily a bug
        # with this code
        #
        ssh.write('{}\n'.format(DUTSSHSession.DUT_PASSWORD))
        pwdprompt = DUTSSHSession.DUT_PASSWORD + '\r\n'
        response, buf, got_prompt, success = self.expect(DUTSSHSession.TELNET_SHELL_PROMPT, DUTSSHSession.TELNET_LOGOUT_PROMPT, pwdprompt)
        
        #
        # In case we have an incorrect login
        #
        if got_prompt == DUTSSHSession.TELNET_LOGOUT_PROMPT:
            raise DUTSSHSession.IncorrectLogin('Incorrect login. Please change Telnet password or contact an administrator')
        
        #
        # If this happens, the Telnet session most likely has stalled, and we
        # must restart our entire connection from the beginning
        #
        # No further commands can be accepted(verified)
        #
        if got_prompt == pwdprompt:
            #
            # We usually get this error when there is a command already running on the Telnet
            # session that didn't close. For example, "top"
            #
            logger.warning(' *** DUTSSHSession() WARNING: Correct prompt was not returned. Reconnecting...')
            self._start(chamber=chamber, counter=counter + 1)
        
        #
        #
        # At this point, we are good to go! We have successfully established
        # an SSH session to the DUT telnet
        #
        #
        
    def __init__(self, chamber='A'):
        
        
        params = {
            'username': 'admin',
            'password': 'Charter12!',
            'port': 22,
            'host': '10.3.65.11'
        }
        
        super(DUTSSHSession, self).__init__(**params)
        
        self.ssh = None
        
        try:
            self._start(chamber=chamber)
            
        except Exception as e:
            if self.ssh:
                self.kill()
            
            raise e
            
    def exec(self, cmd):
        '''
        Executes a command and returns the SSHSession object
        :param cmd: the command to run in ssh session
        :return: the SSHSession object to perform read/write operations
        '''
        
        self.ssh.write(cmd)
        return self.ssh
        
    def kill(self):
        
        try:
            #
            # This may throw a dead process exception
            #
            self.ssh.proc.kill()
        except:
            pass
            
        self.ssh = None
    
    def wait_for(self, cmd):
        '''
        Executes a command and waits for the prompt before returning
        
        WARNING: executing a command that requires input will stall this 
        function. PROTIP: Don't do it... Use exec() instead. If you executed
        this function on a command that requires input, you'll have to 
        manually log in to the telnet session and exit the application
        
        :param cmd: the command to run in ssh session
        :return: the output of the cmd command
        '''
        
        #
        # Nothing
        #
        if not cmd:
            return ''
        
        if cmd[-1] != '\n' or cmd[-1] != '\r':
            #
            # Append a newline because the command will not execute until a return
            # is input
            #
            cmd += '\n'
        
        #
        # Inject a delimiter. TTYs have a dimension and when the input is 
        # greater than its horizontal dimension, it will output a newline
        #
        # Example, you could do DUTSSHSession().wait_for('echo my super long string here that will get a newline after certain characters')
        #
        # STDOUT will contain(yes, STDOUT includes the input command):
        # "echo my super long string here that will g\r\net a newline after certain characters\r\nmy super long string here that will get \r\na newline after certain characters"
        #
        # So we cannot skip the first characters, unless we know the width 
        # of the tty, but... workarounds...
        #
        delimiter1 = 'AB'
        delimiter2 = 'CD'
        delimiter = '{}\r\n{}\r\n'.format(delimiter1, delimiter2)
        cmd = 'echo {}; echo {};{}'.format(delimiter1, delimiter2, cmd)
        
        #
        # Input/Execute the command
        #
        self.ssh.write(cmd)
        response, buf, got_prompt, success = self.expect(DUTSSHSession.TELNET_SHELL_PROMPT)
        
        #
        # STDIN and the prompt are also part of the response. Slice these out
        # before returning
        #
        return response[(response.index(delimiter) + len(delimiter)):response.rindex('\r\n')]
        
    def __del__(self):
    
        #
        # Just in case the session is still open. 'logout' does not work
        #
        # Also, when an exception is thrown, it seems that the session still
        # persists
        #
        # TODO: Add a dictionary keeping track of chamber sessions
        #
        try:
            self.ssh.write('exit\n')
            response, buf, got_prompt, success = self.expect(DUTSSHSession.TELNET_LOGOUT_PROMPT)
            
        except:
            pass
        
        self.kill()
        