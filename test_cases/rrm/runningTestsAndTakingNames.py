import json, datetime, os, time, csv, sys, glob, fnmatch
from collections import OrderedDict
import pandas as pd
from multiprocessing import Pool
from bson import json_util, ObjectId
from optparse import OptionParser
from collections import defaultdict
from pymongo import MongoClient
from subprocess import call


#Arris v6
GLOBAL_MAC_ID = "18:B8:1F:42:0E:FD"

#Askey v6
#GLOBAL_MAC_ID = "B0:EA:BC:E2:E4:20"
whichCollectionToLookIn = ['wifiCollection_20180427', 'wifiCollection_20180428']

class dumpSlice(object):
	def __init__(self):
		timestamp = ''
		interfaces = list()
		lastCpu = 0
		#Adding this here for keeping track of the Assia results for this particular object
		ixiaResults = None
	def __str__(self):
		toreturn =	"TimePeriod: {0}, Last CPU: {1}\n".format(self.timestamp, self.lastCpu)
		for eachInterface in self.interfaces:
			toreturn += "\t{0}".format(eachInterface)
		toreturn += "\t{0}".format(self.ixiaResults)
		return toreturn

	def __repr__(self):
		toreturn =	"TimePeriod: {0}, Last CPU: {1}\n".format(self.timestamp, self.lastCpu)
		for eachInterface in self.interfaces:
			toreturn += "\t{0}".format(eachInterface)
		return toreturn

class interface(object):
	def __init__(self):
		interfaceName = ''
		stations = list()
		rxBytes = 0
		rxPackets = 0
		txBytes = 0
		txPackets = 0
	def __str__(self):
		toreturn =	"Interface: {0}, rxBytes: {1}, rxPackets: {2}, txBytes: {3}, txPackets: {4}\n".format(
					self.interfaceName, self.rxBytes, self.rxPackets, self.txBytes, self.txPackets)
		for eachStation in self.stations:
			toreturn +=	 "{0}".format(eachStation)
		return toreturn

class station(object):
	def __init__(self):
		rssi = 0
		txPackets = 0
		rxPackets = 0
		txBytes = 0
		rxBytes = 0
		interface = ''
		mac = ''
	def __str__(self):
		return "\t\trssi: {0}, txPackets: {1}, rxPackets: {2}, txBytes: {3}, rxBytes: {4}, interface: {5}, mac: {6}\n".format(
				self.rssi, self.txPackets, self.rxPackets, self.txBytes, self.rxBytes, self.interface, self.mac)

class ixiaObject(object):
	def __init__(self):
		#These are the fiels gotten from the log
		clientNumber = 0
		tPut = 0
		timestamp = ''
		logPath = ''
	def __str__(self):
		return "\t\tclientNumber: {0}, Tput: {1}, timestamp: {2}".format(
					self.clientNumber, self.tPut, self.timestamp)

class APInfoObject(object):
	def __init__(self, MACADDR, deviceObj):
		MACAddress = MACADDR
		firmwareVersion = 0
		current2GChannel = 0
		current5GChannel = 0
		current2GBandwidth = 0
		current5GBandwidth = 0
		RRMSONFWVersion = 0
		serialNumber = 0
		modelName = ''
		RRMSONConfigGroups = list()
		current2GSSID = ''
		current5GSSID = ''
		WANIP = ''
		LANIP = ''
		APUpTime = ''
		APWiFiServer = ''
		APWANUL = 0
		APWANDL = 0
		APLastDNSError = 0
		APRealTimePullResponse = 0
		self.setChannelInfo(deviceObj["wifiConfiguration"]["Band2G"]["currentChannel"])
		self.setChannelInfo(deviceObj["wifiConfiguration"]["Band5G"]["currentChannel"])
		self.setDeviceInfo(deviceObj)

	def __str__(self):
		return "MACAddress :\t\t {0}\nfirmwareVersion:\t {1}\ncurrent2GChannel:\t {2}\ncurrent5GChannel:\t {3}\ncurrent2GBandwidth:\t {4}\n\
current5GBandwidth:\t {5}\n\
RRMSONFWVersion:\t {6}\n\
serialNumber:\t\t {7}\n\
RRMSONConfigGroups:\t {18}\n\
current2GSSID:\t\t {8}\n\
current5GSSID:\t\t {9}\n\
WANIP:\t\t\t {10}\n\
LANIP:\t\t\t {11}\n\
APUpTime:\t\t {12}\n\
APWiFiServer:\t\t {13}\n\
APWANULMBs:\t\t {14}\n\
APWANDLMBs:\t\t {15}\n\
APLastDNSError:\t\t {16}\n\
APRealTimePullResponse:\t {17}".format(self.MACAddress, self.firmwareVersion, self.current2GChannel, self.current5GChannel,
									self.current2GBandwidth, self.current5GBandwidth,
									self.RRMSONFWVersion, self.serialNumber, self.current2GSSID, self.current5GSSID,
									self.WANIP, self.LANIP, self.APUpTime, self.APWiFiServer, self.APWANUL, self.APWANDL,
									self.APLastDNSError, self.APRealTimePullResponse, "-".join(self.RRMSONConfigGroups))

	#TODO: Add an ssh thingy to check the radios arent disabled
	def setChannelInfo(self, channelObj):
		if channelObj["primary"] <= 14:
			#We have a 2G channel obj here
			self.current2GChannel = channelObj["primary"]
			self.current2GBandwidth = channelObj["bandwidth"]
		else:
			self.current5GChannel = channelObj["primary"]
			self.current5GBandwidth = channelObj["bandwidth"]
	def setDeviceInfo(self, deviceObj):
		#Get the FW Ver
		self.firmwareVersion = deviceObj["cpeFirmwareVersion"]
		self.modelName = deviceObj["modelName"]
		#RRMSON FW Ver
		self.RRMSONFWVersion = deviceObj["softwareVersion"]
		self.serialNumber = deviceObj["serialNumber"]
		#Get the configuration groups
		self.RRMSONConfigGroups = list()
		for group in deviceObj["configurationGroups"]:
			self.RRMSONConfigGroups.append(group)
		#Map the ssids
		self.current2GSSID = deviceObj["ssidMap"]["Band2G"]
		self.current5GSSID = deviceObj["ssidMap"]["Band5G"]
		#IP stuffs
		self.WANIP = deviceObj["wanIpAddress"]
		self.LANIP = deviceObj["lanIpAddress"]
		self.APUpTime = datetime.timedelta(seconds=abs(deviceObj["lastBootupTime"] - deviceObj["lastUploadTimestamp"]).total_seconds())
		self.APWiFiServer = deviceObj["lastServer"]
		self.APWANUL = deviceObj["monthlyBBUsageUsMbyte"]
		self.APWANDL = deviceObj["monthlyBBUsageDsMbyte"]
		if deviceObj["lastDnsErrorTime"] != None:
			self.APLastDNSError = deviceObj["lastDnsErrorTime"]
		else:
			self.APLastDNSError = "None"
		self.APRealTimePullResponse = deviceObj["lastPeRunDay"]
		self.MACAddress = GLOBAL_MAC_ID


def processSlice(timeSlice):
	#Do stuff
	#All the exceptions are just in case of bad uploads to Assia
	newSlice  = dumpSlice()
	newSlice.ixiaResults = None
	newSlice.interfaces = list()
	try:
		newSlice.timestamp = str(timeSlice["timestamp"]).split(".")[0]
		newSlice.lastCpu = timeSlice["cpuStats"]["lastCpu"]
	except:
		newSlice.timestamp = str(timeSlice["timestamp"]).split(".")[0]
		newSlice.lastCpu = 0
	for sliceInterface in timeSlice["interfaces"]:
		newInterface = interface()
		newInterface.stations = list()
		if sliceInterface["interface"] == 0:
			newInterface.interfaceName = "ath1"
		elif sliceInterface["interface"] == 32:
			newInterface.interfaceName = "ath0"
		else:
			break
		try:
			newInterface.rxBytes = int(sliceInterface["counters"]["rxBytes"])/1000000
			newInterface.rxPackets = sliceInterface["counters"]["rxPackets"]
			newInterface.txBytes = int(sliceInterface["counters"]["txBytes"])/1000000
			newInterface.txPackets = sliceInterface["counters"]["txPackets"]
		except:
			newInterface.rxBytes = 0
			newInterface.rxPackets = 0
			newInterface.txBytes = 0
			newInterface.txPackets = 0
		try:
			for intStation in sliceInterface["stations"]:
				newStation = station()
				newStation.rssi = intStation["rssi"]
				newStation.interface = newInterface.interfaceName
				newStation.txPackets = intStation["txPackets"]
				newStation.rxPackets = intStation["rxPackets"]
				newStation.mac = intStation["mac"]
				newStation.txBytes = int(intStation["txBytes"])/1000000
				newStation.rxBytes = int(intStation["rxBytes"])/1000000
				newInterface.stations.append(newStation)
		except:
			pass
		newSlice.interfaces.append(newInterface)
	print(newSlice)
	return newSlice


def comingThrough(data):
	page_sanitized = json.loads(json_util.dumps(data))
	#r = json.dumps(data,default=json_util.default)
	#data = json.loads(r, object_pairs_hook=OrderedDict)
	#Process each interface slice first
	sliceList = list()
	#Flag to see if there anything to return
	didContain = 0
	for timeSlice in data["operational"]:
		didContain = 1
		sliceList.append(processSlice(timeSlice))
	if didContain:
		return sliceList
	else:
		return None
		
def find_files(directory, pattern):
	for root, dirs, files in os.walk(directory):
		for basename in files:
			if fnmatch.fnmatch(basename, pattern):
				filename = os.path.join(root, basename)
				yield filename


def handleLog(logPath):
	fwdRateNext = 0
	newIxiaObj = ixiaObject()
	newIxiaObj.clientNumber = int(logPath.split('\\')[-1].split('_')[2])
	newIxiaObj.tPut = 0
	newIxiaObj.timestamp = ''
	newIxiaObj.logPath = logPath
	with open(logPath, 'r') as F:
		for line in F:
			if "Trial 1" in line:
				tempLine = line.split('(')[1].split(')')[1].split('.')[0]
				tempLine = tempLine[2:]
				tempLineSplitList = tempLine.split(' ')
				tempLine = tempLineSplitList[0] + ' ' + tempLineSplitList[1]
				newIxiaObj.timestamp = tempLine
			if fwdRateNext:
				tempLine = line.split(',')[5]
				newIxiaObj.tPut = float(tempLine) * 600 * newIxiaObj.clientNumber * 0.000125
				break
			if "Fwd Rate (Kbps)" in line:
				fwdRateNext = 1
	return newIxiaObj

def writeToFile(objList):
	masterList = list()
	masterList.append(["timestamp", "clientNumber", "tPutInMegaBytes", "logPath"])
	for obj in objList:
		newrow = [obj.timestamp, obj.clientNumber, obj.tPut, obj.logPath]
		masterList.append(newrow)
	with open('firstrun.csv', 'ab') as F:
		writer = csv.writer(F)
		writer.writerows(masterList)

#same same like grabDB but checks if its within time to
def grabAPMetaData(AP_TURNED_ON_PERIOD):
	parseDataList = list()
	dbIP = '10.0.39.158'
	client = MongoClient('mongodb://'+dbIP+':27017/')
	whichDB = 'charter'
	db = client[whichDB]
	collection = db['devices']
	matchFound = 0
	while not matchFound:
		startTime = datetime.datetime.utcnow()
		for deviceObj in collection.find({"lineId" : GLOBAL_MAC_ID}):
			if abs((deviceObj["lastUploadTimestamp"] - startTime).total_seconds()) <= 9000:
				return deviceObj
		print("[+] Did not find new upload snoozing.....")
		print("[+] Last upload was {0}".format(deviceObj["lastUploadTimestamp"]))
		time.sleep(60)

def whichCollection():
	baseStr = 'wifiCollection_'
	rn = str(datetime.datetime.utcnow()).split(' ')[0].split('-')
	baseStr = baseStr+''.join(x for x in rn)
	global whichCollectionToLookIn
	whichCollectionToLookIn = [baseStr]
	
	
		
def grabDB():
	parseDataList = list()
	dbIP = '10.0.39.158'
	client = MongoClient('mongodb://'+dbIP+':27017/')
	whichDB = 'charter'
	db = client[whichDB]
	for thisCollection in whichCollectionToLookIn:
		collection = db[thisCollection]
		#for post in collection.find({"lineId": someMac}):
		for post in collection.find({"lineId" : GLOBAL_MAC_ID }):
			didReturnGood = comingThrough(post)
			if didReturnGood != None:
				parseDataList = parseDataList + didReturnGood
	return parseDataList

def combineAssiaIxia(AssiaData, IxiaData):
	#Start by going through each of the objects
	newOutputList = list()
	timesList = list()
	for i in AssiaData:
		print(i)
	for assiaObj in AssiaData:
		for ixiaObj in IxiaData:
			#get both the timestamps and see what good
			#Ixia Datas is on MST so need to subtract 6 from that timestamp
			if ixiaObj.timestamp != '':
				newIxiaTime = datetime.datetime.strptime(ixiaObj.timestamp, "%Y-%m-%d %H:%M:%S")
				newAssiaTime = datetime.datetime.strptime(assiaObj.timestamp, "%Y-%m-%d %H:%M:%S")
				#With day light savings time this should be 6 hours
				newIxiaTime = newIxiaTime + datetime.timedelta(hours=7)
				#Check whether the difference between the two time stamps is more than 10 but less than 15
				AssiaIxiaTimeDiff = abs((newIxiaTime - newAssiaTime).total_seconds())
				timesList.append([AssiaIxiaTimeDiff])
				#print "Difference of {0} between the ixia and assia timestamps".format(AssiaIxiaTimeDiff)
				if AssiaIxiaTimeDiff < 900 and AssiaIxiaTimeDiff > 660:
					#This means that the time stamps match up lets add it to the 
					assiaObj.ixiaResults = ixiaObj
					print(assiaObj)
					newOutputList.append(assiaObj)
					break
	with open('check12.csv', 'ab') as F:
		writer = csv.writer(F)
		writer.writerows(timesList)
	return newOutputList

def passOrFail(ixiaTput, assiaTput, ixiaClients, assiaClients):
	if (abs((ixiaTput - assiaTput) / ixiaTput) <= .10) and ixiaClients == assiaClients:
		return ["PASS"]
	else:
		return ["FAIL"]

def tocsv(data, outputFile, APMetaDataObj):
	#Do stuff
	toWriteRow1 = ["TimePeriod", "lastCpu"]
	toWriteRow2 = ["Interface", "rxBytes", "rxPackets", "txBytes", "txPackets"]
	toWriteRow3 = ["rssi", "txPackets", "rxPackets", "txBytes", "rxBytes", "interface", "mac"]
	masterWriteList = ["PassOrFail", "IxiaOverAssiaPercentTput", "TimePeriod", "lastCpu", "AP/Interface", "AP/rxMegaBytes", "AP/rxPackets", "AP/txMegaBytes", "AP/txPackets", "STATION/rssi", "STATION/txPackets", "STATION/rxPackets", "STATION/txMegaBytes", "STATION/rxMegaBytes", "STATION/interface", "STATION/mac", "TYPE",
						"IxiaTimeStamp", "IxiaClientNumber", "IxiaClientTput", "ixiaLogPath"]
	toWriteList = list()
	toWriteList.append(masterWriteList)
	for pieSlice in data:
		print(pieSlice)
		for intt in pieSlice.interfaces:
			for station in intt.stations:
				try:
					newList = [str(pieSlice.timestamp), str(pieSlice.lastCpu),
								str(intt.interfaceName), str(intt.rxBytes), str(intt.rxPackets), str(intt.txBytes), str(intt.txPackets),
								str(station.rssi), str(station.txPackets), str(station.rxPackets), str(station.txBytes), str(station.rxBytes), str(station.interface), str(station.mac)]
					if len(intt.stations) == 5:
						newList.append('LOW')
					elif len(intt.stations) == 10:
						newList.append('Medium')
					else:
						newList.append('HIGH')
					#grab all the ixiaData
					ixiaData = pieSlice.ixiaResults
					ixiaAssiaPercentDiff = (float(ixiaData.tPut) / float(intt.txBytes)) * 100
					ixiaList = [ixiaData.timestamp, ixiaData.clientNumber, ixiaData.tPut, ixiaData.logPath]
					newList = passOrFail(float(ixiaData.tPut), float(intt.txBytes), ixiaData.clientNumber, len(intt.stations)) + [ixiaAssiaPercentDiff] + newList + ixiaList
					toWriteList.append(newList)
				except:
					pass
		toWriteList.append(['\n'])
	with open(outputFile, 'ab') as F:
		F.write(str(APMetaDataObj))
	with open(outputFile, 'ab') as F:
		writer = csv.writer(F)
		writer.writerows(toWriteList)
		


def onYourMarks():
	timeNow = datetime.datetime.utcnow()
	parseDataList = list()
	dbIP = '10.0.39.158'
	client = MongoClient('mongodb://'+dbIP+':27017/')
	whichDB = 'charter'
	db = client[whichDB]
	timeToGoOfOff = ''
	postCheck = None
	collection = db[whichCollectionToLookIn[-1]]
	for post in collection.find({"lineId" : GLOBAL_MAC_ID }):
		try:
			print("This is a timestamp: {0}".format(post["operational"][-1]["timestamp"]))
			postCheck = post
		except:
			pass
			print(["[+] Nothing found in Daily collection snoozing...."])
	timeToGoOfOff = postCheck["operational"][-1]["timestamp"]

	while 1:
		if ((datetime.datetime.utcnow() - timeToGoOfOff).total_seconds() % 900 <= 7) and ((datetime.datetime.utcnow() - timeToGoOfOff).total_seconds() % 900  >= 1):
			print("Time to go off: {0}".format(timeToGoOfOff))
			print("Time Now: {0}".format(datetime.datetime.utcnow()))
			return 1
		else:
			time.sleep(1)	

def main(startDir):
	#Path to the file to run
	#First things first check if the last upload for the device is relanavt within 5 minutes but can change
	AP_TURNED_ON_PERIOD = 10
	#Got the MetaData now time to match it up
	print("[+] Attempting to fill in Meta Data for the AP")
	APMetaDataObj = APInfoObject(GLOBAL_MAC_ID, grabAPMetaData(AP_TURNED_ON_PERIOD))
	print("[+] MetaData for AP filled in [+]")
	print(APMetaDataObj)
	#If running form the jump server add a section here for kicking off the ixia tests that later get parsed
	print("[+] Kicking off Ixia Tests [+]")
	print(APMetaDataObj.modelName)
	if "SAGEMCOM" in APMetaDataObj.modelName:
		PATH_TO_IXIA_FILE = 'Z:\\_Users\\lstankiewicz\\demoTests\\sagemcomc3\\sagemcom.py'
	if "ARRIS" in APMetaDataObj.modelName:
		PATH_TO_IXIA_FILE = 'Z:\\_Users\\lstankiewicz\\demoTests\\arris\\arris.py'
	if "ASKEY" in APMetaDataObj.modelName: 
		PATH_TO_IXIA_FILE = 'Z:\\_Users\\lstankiewicz\\demoTests\\askeyc3\\askey2ghz.py'
	combinedCallCMD = 'python27 '+PATH_TO_IXIA_FILE
	#Need to check the time diff before kicking off tests to make sure they match on timestamp
	onYourMarks()
	print("[+] Finished aligning time and kicking off now [+]")
	call(combinedCallCMD)
	print("[+] Ixia tests have finished one way or another [+]")
	#So this stuff is all after the fact Parsing per client and test etc. etc.
	#Where we congregate the Ixia stuff
	ixiaObjectList = list()
	possibleCSVNames = ["Results_WaveQoE_5_clients.csv", "Results_WaveQoE_10_clients.csv", "Results_WaveQoE_25_clients.csv"]
	for filePattern in possibleCSVNames:
		for filename in find_files(startDir, filePattern):
			print('Found ixia results thing source:', filename)
			ixiaObjectList.append(handleLog(filename))
	#We have all the logs now have to comb throuh the db
	parseDataList = grabDB()
	AllDoneObjects = combineAssiaIxia(parseDataList, ixiaObjectList)
	tocsv(AllDoneObjects, GLOBAL_MAC_ID.replace(':','_')+'.csv', APMetaDataObj)
	print("Number of test matches: {0}".format(len(AllDoneObjects)))
	for oneObj in AllDoneObjects:
		print(oneObj)
	print(APMetaDataObj)



if __name__=="__main__":
	parser = OptionParser()
	parser.add_option("-f", "--file", dest="filename",
					  help="File Directory of all the Test logs", metavar="a")
	parser.add_option("-m", "--mac", dest="macAddr",
					  help="MAC of DUT", metavar="FILE")

	(options, args) = parser.parse_args()
	print(options.filename)
	global GLOBAL_MAC_ID
	GLOBAL_MAC_ID = options.macAddr
	whichCollection()
	main(options.filename)
