#############################################################################
#                                                                           #
# copyright 2015, octoScope, Inc.                                           #
#                                                                           #
#############################################################################
#                                                                           #
# octoScopeSocket.py                                        $Rev:: 1001     #
#                                                                           #
# pythonModule used to provide socket control                               #
#                                                                           #
# To learn more about the ASCII API please refer to the hardware manuals.   #
#                                                                           #
# Contact: Ben Lampert (ben.lampert@octoscope.com)                          #
#                                                                           #
#############################################################################


import socket
import errno
from time import sleep

timeout = 0.10 # ms timeout between tries
defaultPort = 5025 # the default port used by the quadAttenuation

#Example code for using sockets to get quadAtten attenuations
def setAttenuation(IP, atten, channel=None):
    #print "Setting attenuation at {0}:5025 and channel {1}".format(IP, channel)
    #No Channel specified
    if channel == None:
        command = "setAttenuation -db {0}".format(atten)
    if channel != None:
        command = "setAttenuation -ch {0} -db {1}".format(channel, atten)
    return sendASCII(IP,command)

def getAttenuation(IP, channel):
    command = "getAttenuation -ch {0}".format(channel)
    return sendASCII(IP,command)

def getBypass(IP,channel):
    command = "bypass get {0}".format(channel)
    return sendASCII(IP,command)
 
def setBypass(IP,channel,bypass):
    command = "bypass set {0} {1}".format(channel,bypass)
    return sendASCII(IP,command)

#set mpe2 bypass settings socket
def setmpe2bypassSettingsSocket(IP,bypassvalue):
    print("---Setting all channels of mpe2 with given bypass value---")
    for i in range(1,5):
        returnCode = setBypass(IP,i,bypassvalue)
        if "-1" in returnCode:
            raise Exception('Error setting attenuation value')
            break
    return returnCode 
        
#sendASCII(IP,ASCII, PORT=optional)
#Sends the ASCII command to the IP:PORT
#If not PORT specified, uses the default port (5025)
def sendASCII(IP,ASCII, PORT=None):
    global retryCount,timeout, defaultPort
    ASCII += " \r\n" #append a new line character
    #print ASCII
    if PORT==None:
        PORT = defaultPort
    #print "sending {0}:{1} -> {2}".format(IP,PORT,ASCII)
    #Connect to the socket
    try:
        newSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            newSocket.connect((IP,PORT))
            newSocket.send(ASCII)
        except socket.error as serr:
            if serr.errno == errno.ENOTCONN or serr.errno == errno.ECONNREFUSED:
            #    print "problem connecting, retrying {0}: {1} ".format(retryCount, serr)
                sleep(timeout)
                return sendASCII(IP, ASCII, PORT).rstrip('\n')
            else:
                raise(serr)
        response = newSocket.recv(18).rstrip('\n')
        newSocket.close()
        sleep(0.01)
        return response

    except Exception as e:
        print("error: {0}".format(str(e)))
