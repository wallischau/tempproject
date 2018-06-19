#############################################################################
#                                                                           #
# copyright 2015, octoScope, Inc.                                           #
#                                                                           #
#############################################################################
#                                                                           #
# octoScopeSerial.py                                        $Rev:: 1001     #
# 								                                            #
# pythonModule used to provide serial control				                #
#	REQUIRES: pyserial		                                                #
#                                                                           #
# To learn more about the ASCII API please refer to the hardware manuals.   #
#                                                                           #
# Contact: Ben Lampert (ben.lampert@octoscope.com)                          #
#                                                                           #
#############################################################################

#requires pyserial be installed:
#sudo easy_install pyserial
#https://pypi.python.org/pypi/pyserial
import serial #Requires this package to be installed!
import time

#Note, this delay may have to be tuned depending on the OS overhead to access the com port
#For now, it is reduced to 0.01, but a value of 0.5 can be used if there are concerns about performance
timeout = 0.01 #default delay when writing

#Example code for using sockets to get quadAtten attenuations
def setAttenuation(port, atten, channel=None):
        #print "Setting attenuation at {0}:5025 and channel {1}".format(IP, channel)
        #No Channel specified
        if channel == None:
                command = "setAttenuation -db {0}".format(atten)
        if channel != None:
                command = "setAttenuation -ch {0} -db {1}".format(channel, atten)
        print("command:{0}".format(command))
        return sendASCII(port,command)

def getAttenuation(port, channel):
        command = "getAttenuation -ch {0}".format(channel)
        #print "command:{0}".format(command)
        return sendASCII(port,command)

#setting bypass ettings for MPE2
def getBypass(port,channel):
    command = "bypass get {0}".format(channel)
    return sendASCII(port,command)
 
def setBypass(port,channel,bypass):
    command = "bypass set {0} {1}".format(channel,bypass)
    return sendASCII(port,command)       

#set mpe2 bypass settings serial
def setmpe2bypassSettingsSerial(Port,bypassvalue):
    print("---Setting all channels of mpe2 with given bypass value---")
    for i in range(1,5):
        returnCode = setBypass(Port,i,bypassvalue)
        if "-1" in returnCode:
            raise Exception('Error setting attenuation value')
            break
    return returnCode


#sendASCII
#writes an ASCII command to the serial port and returns the response
def sendASCII(port, command):
    global timeout
    try:
        serialPort = serial.Serial(port, 9600, timeout=1)
        #pad the command with a return character
        #command = " {0} \r\n ".format(command)
        command = " {0} ".format(command)

        print(command)

        #write out the ASCII command
        #need to encode as UNICODE to help format the string
        #For example, a proper USB command looks like
        # serialPort.write("setEnable 1 \n".encode())
        serialPort.write(command.encode())
        out = ""
        time.sleep(timeout)
        while serialPort.inWaiting() > 0:
            out += serialPort.read(1)
        #need to strip out the input from the com port buffer
        out = out.replace(out[:len(command)+1], '')
        out = out.strip('\n')
        #print "Received: {0}".format(out)
        serialPort.close()
        #print "Exited the serial port"
        #return code
        return out
    except Exception, err:
        print(err)
