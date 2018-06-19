from controller import Controller
import json
import os
import re
import subprocess
import sys


class AP(Controller):

    DIRECTORY = os.path.dirname(os.path.realpath(__file__))

    class InstructionNotFound(Exception):
        pass
    
    def __init__(self, chamber, make, model):
        self.instruction_list = []
        self.commands = []
        self.chamber = chamber
        self.make = make
        self.model = model
        self.command_script = '{0}/bin/cisco_telnet_dut.sh'.format(AP.DIRECTORY)
        self.power_strip = None
        self.translation = {}
        
        #self.ssh = DUTSSHSession(chamber=chamber)

    def clear_metrics_logs(self):
        cmd = 'rm /tmp/cpu.log /tmp/memory.log'
        self.send_cmd(cmd)

    def download_metrics(self):
        output = self.send_cmd("cat /tmp/cpu.log /tmp/memory.log")
       
        # Parse the log data from the CLI output
        log_data = []
        for line in output.split("\n"):
            if "@@@@" in line:
                line = line.replace("@@@@", "")
                line = line.replace("{", "")
                line = line.replace("}", "")
                log_data.append(line)
        
        # Parse the metrics from the log data
        metrics = {}
        metrics["cpu"] = {}
        metrics["memory"] = {}
        
        for line in log_data:
            toks = line.split("|")
            if "cpu" in toks[1]:
                data = toks[1].split(" ")
                # DATE:SYSTEM%
                metrics["cpu"][toks[0]] = data[2]

            elif "Mem:" in toks[1]:
                data = toks[1].split(" ")
                # DATE:USED/TOTAL
                metrics["memory"][toks[0]] = float(data[2])/float(data[1])
        
        return metrics

    def queue_cmd_statement(self, command, **kwargs):
        
        try:
            statement = self.translation[command]
        except KeyError as e:
            raise AP.InstructionNotFound('The instruction "{0}" was not found'.format(command))
       
        if kwargs != None: 
            for key, value in kwargs.items():
                statement = statement.replace('@' + key, str(value))

        self.instruction_list.append(command)
        self.commands.append(statement)
        
    def _parse_delimiter(self, lines):
        out = []
        
        read = False
        buf = ''
        for line in lines:
        
            if line == '==D=E=L=I=M=I=T=E=R==':
                # Delimiter marks the start of a new input
                if buf:
                    out.append(buf)
                    buf = ''
                    
                read = True
                continue
                
            elif line == '==E=N=D==':
                # End marks the end of command output(s)
                out.append(buf)
                break
                
            elif read == True:
                # We only want to read lines after we have come across a delimiter
               buf += line + '\r\n' 
        
        return out
        
    def exec_popen(self, statement):
        stdout = subprocess.Popen(statement, stdout=subprocess.PIPE, shell=True).communicate()[0].decode('utf-8')
        cmd = self._parse_delimiter(stdout.split('\r\n'))
        
        return cmd
        
    def send_cmd(self, command):
    
        statement = "{0} -b {1} -c '{2}'".format(self.command_script, self.chamber, command)
        cmd = self.exec_popen(statement)
        
        return cmd[0]
        
    def send_queue(self):
    
        statement = "{0} -b {1}".format(self.command_script, self.chamber)
    
        for command in self.commands:
            statement = "{0} -c \"{1}\"".format(statement, command.strip())
            
        cmds = self.exec_popen(statement)
        out = dict(zip(self.instruction_list, cmds))
        
        self.instruction_list = []
        
        return out
        
    def set_json_instructions(self, filename):
        if not os.path.isfile(filename):
            raise Exception("[AP::set_json_instructions] - JSON instruction set {0} not found!".format(filename))
        
        instruction_set_file = open(filename, 'r')
        
        self.translation = json.load(instruction_set_file)
        
        instruction_set_file.close()
        
    def set_instructions(self, filename):
        ext = os.path.splitext(filename)[1]
        
        if ext == '.json':
            self.set_json_instructions(filename)
        else:
            raise Exception("[AP::set_instructions] - Extension '{0}' not recognized!".format(ext))
        
    def start_metrics_collection(self):
        metrics = {}        
        metrics['cpu'] = "echo {@@@@\`date\`\\\\\\|cpu \`iostat -c | grep '.' | grep -v Linux | grep -v avg\`} >> /tmp/cpu.log"
        metrics['mem'] = "echo {@@@@\`date\`\\\\\\|\`free mem | grep 'Mem'\`} >> /tmp/memory.log"
        
        cronjob = ''
        for key, job in metrics.items():
            cronjob = '{0}* * * * * {1}\\n'.format(cronjob, job)
        
        self.send_cmd('echo -e "{0}" > /etc/crontabs/root'.format(cronjob))
        
        output = self.send_cmd('cat /etc/crontabs/root')
        return output

    def stop_metrics_collection(self):
        statement = "rm /etc/crontabs/root"
        self.send_cmd(statement)
