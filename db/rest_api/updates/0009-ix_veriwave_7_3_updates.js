/**
 * Initial instantiation
 * ---------------------
 * Hello!
 *
 * This is similar to a migration file on Django. The main difference being 
 * is that we are not dealing with schema changes, because MongoDB does not 
 * care about those(NoSQL for the win, anybody?)
 *
 * We may occasionally need to insert data into the database
 *
 * In this case, we need to port over all existing accounts from the old 
 * framework over to this new one
 *
 * The way these update files work is that the framework should read the 
 * 'updates' directory, sort the files by their update number, and determine
 * which updates must occur by checking it against what we have in the database
 *
 * In this aspect, it works the same as Django minus the dependencies
 *
 * Every update should export a function. This is the function that the 
 * framework will execute when applying an update
 *
 */
 
// Model imports
const Model = require('../inc/model.js');
const TestChamber = require('../models/TestChamber.js');
const TestSuite = require('../models/TestSuite.js');
const Dut = require('../models/Dut.js');
const DutFirmware = require('../models/DutFirmware.js');

/**
 * Updates test suite file locations to new locations for 7.3
 */
async function updateTestFilePaths() {
  suite_1 = await TestSuite.find({name: '802.11ac Wave 1'});
  suite_1_id = suite_1._id;

  let wave_1_directory = 
    '/mnt/wifi_vol/SMART/test_suites/ixia/7.3.X/Wave1_PRD1_TCL/';

  let wave_2_directory = 
    '/mnt/wifi_vol/SMART/test_suites/ixia/7.3.X/Wave2_PRD2_TCL/';

  await TestSuite.update({name: '802.11ac Wave 1'}, {
    $set: {
      'test_suites.Latency.test_file': 
        wave_1_directory + 'Latency/UL.tcl',
      'test_suites.Max Client.test_file': 
        wave_1_directory + 'Max_Client/MX.tcl',
      'test_suites.Mixed Client.test_file': 
        wave_1_directory + 'Mixed_Clients/MC.tcl',
      'test_suites.Near Far.test_file': 
        wave_1_directory + 'Near_Far/NF.tcl',
      'test_suites.Packet Capture.test_file': 
        wave_1_directory + 'Packet_Capture/PCAP.tcl',
      'test_suites.Packet Loss.test_file': 
        wave_1_directory + 'Packet_Loss/PLOSS.tcl',
      'test_suites.Rate Vs Range.test_file': 
        wave_1_directory + 'RVR/RVR.tcl',
      'test_suites.Realworld QoE.test_file': 
        wave_1_directory + 'RealworldQOE/QOE.tcl',
      'test_suites.Reuse of Airtime.test_file': 
        wave_1_directory + 'ROA/ROA.tcl',
      'test_suites.TCP Goodput.test_file': 
        wave_1_directory + 'TCP/TCP.tcl',
      'test_suites.Triple Play.test_file': 
        wave_1_directory + 'Triple_Play/TP.tcl',
      'test_suites.UDP Throughput.test_file': 
        wave_1_directory + 'UDP/UDP.tcl',
      'test_suites.Unicast Video.test_file': 
        wave_1_directory + 'Unicast_Video/UV.tcl',
      'test_suites.WMM Power Save.test_file': 
        wave_1_directory + 'WMM_Power/PS.tcl'
    }
  });

  await TestSuite.update({name: '802.11ac Wave 2'}, {
    $set: {
      'test_suites.Latency.test_file': 
        wave_2_directory + 'Latency/UL.tcl',
      'test_suites.Max Client.test_file': 
        wave_2_directory + 'Max_Client/MX.tcl',
      'test_suites.Mixed Client.test_file': 
        wave_2_directory + 'Mixed_Clients/MC.tcl',
      'test_suites.Multicast Video.test_file': 
        wave_2_directory + 'Multicast_Video/MV.tcl',
      'test_suites.Near Far.test_file': 
        wave_2_directory + 'Near_Far/NF.tcl',
      'test_suites.Packet Capture.test_file': 
        wave_2_directory + 'Packet_Capture/PCAP.tcl',
      'test_suites.Packet Loss.test_file': 
        wave_2_directory + 'Packet_Loss/PLOSS.tcl',
      'test_suites.Rate Vs Range.test_file': 
        wave_2_directory + 'RVR/RVR.tcl',
      'test_suites.Realworld QoE.test_file': 
        wave_2_directory + 'RealworldQOE/QOE.tcl',
      'test_suites.Reuse of Airtime.test_file': 
        wave_2_directory + 'ROA/ROA.tcl',
      'test_suites.TCP Goodput.test_file': 
        wave_2_directory + 'TCP/TCP.tcl',
      'test_suites.Triple Play.test_file': 
        wave_2_directory + 'Triple_Play/TP.tcl',
      'test_suites.UDP Throughput.test_file': 
        wave_2_directory + 'UDP/UDP.tcl',
      'test_suites.Unicast Video.test_file': 
        wave_2_directory + 'Unicast_Video/UV.tcl',
      'test_suites.WMM Power Save.test_file': 
        wave_2_directory + 'WMM_Power/PS.tcl'
    }
  });
}

/**
 * Updates Chamber A (1.1) to current configuration
 */
async function updateChamber_A() {
  let result = await TestChamber.update(
    {name: "1.1"},
    {$set: {
      "name": "1.1",
      "firmware": "7.3.2",
      "rack": 1,
      "shelf": 1,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 6,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.100",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 6,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.100",

      "card_config.ethernet.port": 4,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.100",

      "attenuator.ports_24_GHz": "5-8",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.96",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber A (1.1) updated successfully...';
  } else {
    return 'Chamber A (1.1) NOT updated successfully...';
  }
}

/**
 * Updates Chamber B (2.1) to current configuration
 */
async function updateChamber_B() {

  let result = await TestChamber.update(
    {name: "2.1"},
    {$set: {
      "name": "2.1",
      "firmware": "7.3.2",
      "rack": 2,
      "shelf": 1,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 4,
      "card_config.wifi_24_GHz.model": "WBW46024",
      "card_config.wifi_24_GHz.ip": "10.3.65.100",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 4,
      "card_config.wifi_5_GHz.model": "WBW46024",
      "card_config.wifi_5_GHz.ip": "10.3.65.100",

      "card_config.ethernet.port": 2,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.100",

      "attenuator.ports_24_GHz": "13-16",
      "attenuator.ports_5_GHz": "9-12",
      "attenuator.ip": "10.3.65.96",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber B (2.1) updated successfully...';
  } else {
    return 'Chamber B (2.1) NOT updated successfully...';
  }
}

/**
 * Updates Chamber C (2.3) to current configuration
 */
async function updateChamber_C() {

  let result = await TestChamber.update(
    {name: "2.3"},
    {$set: {
      "name": "2.3",
      "firmware": "7.3.2",
      "rack": 2,
      "shelf": 3,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 1,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.100",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 1,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.100",

      "card_config.ethernet.port": 1,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.100",

      "attenuator.ports_24_GHz": "5-8",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.93",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber C (2.3) updated successfully...';
  } else {
    return 'Chamber C (2.3) NOT updated successfully...';
  }
}

/**
 * Updates Chamber D (1.2) to current configuration
 */
async function updateChamber_D() {

  let result = await TestChamber.update(
    {name: "1.2"},
    {$set: {
      "name": "1.2",
      "firmware": "7.3.2",
      "rack": 1,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 3,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.100",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 3,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.100",

      "card_config.ethernet.port": 3,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.100",

      "attenuator.ports_24_GHz": "5-8",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.91",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber D (1.2) updated successfully...';
  } else {
    return 'Chamber D (1.2) NOT updated successfully...';
  }
}

/**
 * Updates Chamber E (8.1) to current configuration
 */
async function updateChamber_E() {

  let result = await TestChamber.update(
    {name: "8.1"},
    {$set: {
      "name": "8.1",
      "firmware": "6.9.1",
      "rack": 8,
      "shelf": 1,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 1,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.102",

      "card_config.wifi_5_GHz.port": 2,
      "card_config.wifi_5_GHz.slot": 6,
      "card_config.wifi_5_GHz.model": "WBW46024",
      "card_config.wifi_5_GHz.ip": "10.3.65.102",

      "card_config.ethernet.port": 1,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.102",

      "attenuator.ports_24_GHz": "9-12",
      "attenuator.ports_5_GHz": "13-16",
      "attenuator.ip": "10.3.65.90",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber E (8.1) updated successfully...';
  } else {
    return 'Chamber E (8.1) NOT updated successfully...';
  }
}

/**
 * Updates Chamber F (8.3) to current configuration
 */
async function updateChamber_F() {
  
  let result = await TestChamber.update(
    {name: "8.3"},
    {$set: {
      "name": "8.3",
      "firmware": "6.9.1",
      "rack": 8,
      "shelf": 3,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 4,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.102",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 4,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.102",

      "card_config.ethernet.port": 2,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.102",

      "attenuator.ports_24_GHz": "13-16",
      "attenuator.ports_5_GHz": "9-12",
      "attenuator.ip": "10.3.65.41",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber F (8.3) updated successfully...';
  } else {
    return 'Chamber F (8.3) NOT updated successfully...';
  }
}

/**
 * Updates Chamber G (9.1) to current configuration
 */
async function updateChamber_G() {

  let result = await TestChamber.update(
    {name: "9.1"},
    {$set: {
      "name": "9.1",
      "firmware": "6.9.1",
      "rack": 9,
      "shelf": 1,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 1,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.102",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 6,
      "card_config.wifi_5_GHz.model": "WBW46024",
      "card_config.wifi_5_GHz.ip": "10.3.65.102",

      "card_config.ethernet.port": 3,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.102",

      "attenuator.ports_24_GHz": "1-4",
      "attenuator.ports_5_GHz": "5-8",
      "attenuator.ip": "10.3.65.90",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber G (9.1) updated successfully...';
  } else {
    return 'Chamber G (9.1) NOT updated successfully...';
  }
}

/**
 * Updates Chamber H (9.2) to current configuration
 */
async function updateChamber_H() {
  
  let result = await TestChamber.update(
    {name: "9.2"},
    {$set: {
      "name": "9.2",
      "firmware": "6.9.1",
      "rack": 9,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 3,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.102",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 3,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.102",

      "card_config.ethernet.port": 4,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.102",

      "attenuator.ports_24_GHz": "5-8",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.41",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber H (9.2) updated successfully...';
  } else {
    return 'Chamber H (9.2) NOT updated successfully...';
  }
}

/**
 * Updates Chamber I (4.2) to current configuration
 */
async function updateChamber_I() {
  
  let result = await TestChamber.update(
    {name: "4.2"},
    {$set: {
      "name": "4.2",
      "firmware": "6.9.1",
      "rack": 4,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 7,
      "card_config.wifi_24_GHz.model": "WBW2000",
      "card_config.wifi_24_GHz.ip": "10.3.65.101",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 5,
      "card_config.wifi_5_GHz.model": "WBW3601",
      "card_config.wifi_5_GHz.ip": "10.3.65.101",

      "card_config.ethernet.port": 1,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.101",

      "attenuator.ports_24_GHz": "5-8",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.46",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber I (4.2) updated successfully...';
  } else {
    return 'Chamber I (4.2) NOT updated successfully...';
  }
}

/**
 * Updates Chamber J (5.2) to current configuration
 */
async function updateChamber_J() {
  
  let result = await TestChamber.update(
    {name: "5.2"},
    {$set: {
      "name": "5.2",
      "firmware": "6.9.1",
      "rack": 5,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 6,
      "card_config.wifi_24_GHz.model": "WBW2600",
      "card_config.wifi_24_GHz.ip": "10.3.65.101",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 4,
      "card_config.wifi_5_GHz.model": "WBW3601",
      "card_config.wifi_5_GHz.ip": "10.3.65.101",

      "card_config.ethernet.port": 2,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.101",

      "attenuator.ports_24_GHz": "13-16",
      "attenuator.ports_5_GHz": "9-12",
      "attenuator.ip": "10.3.65.46",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber J (5.2) updated successfully...';
  } else {
    return 'Chamber J (5.2) NOT updated successfully...';
  }
}

/**
 * Updates Chamber K (6.2) to current configuration
 */
async function updateChamber_K() {
  
  let result = await TestChamber.update(
    {name: "6.2"},
    {$set: {
      "name": "6.2",
      "firmware": "7.3.2",
      "rack": 6,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 2,
      "card_config.wifi_24_GHz.model": "WBW3601",
      "card_config.wifi_24_GHz.ip": "10.3.65.101",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 1,
      "card_config.wifi_5_GHz.model": "WBW46014",
      "card_config.wifi_5_GHz.ip": "10.3.65.101",

      "card_config.ethernet.port": 3,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.101",

      "attenuator.ports_24_GHz": "5-8",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.99",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber K (6.2) updated successfully...';
  } else {
    return 'Chamber K (6.2) NOT updated successfully...';
  }
}

/**
 * Updates Chamber L (6.3) to current configuration
 */
async function updateChamber_L() {
  
  let result = await TestChamber.update(
    {name: "6.3"},
    {$set: {
      "name": "6.3",
      "firmware": "6.9.1",
      "rack": 6,
      "shelf": 3,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 3,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.101",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 3,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.101",

      "card_config.ethernet.port": 4,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.101",

      "attenuator.ports_24_GHz": "13-16",
      "attenuator.ports_5_GHz": "9-12",
      "attenuator.ip": "10.3.65.99",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber L (6.3) updated successfully...';
  } else {
    return 'Chamber L (6.3) NOT updated successfully...';
  }
}

/**
 * Updates Chamber 2.2 to current configuration
 */
async function updateChamber_2_2() {
  
  let result = await TestChamber.update(
    {name: "2.2"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 2,
      "shelf": 2,
  }});

  if (result.n && result.ok) {
    return 'Chamber 2.2 updated successfully...';
  } else {
    return 'Chamber 2.2 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 3.1 to current configuration
 */
async function updateChamber_3_1() {
  
  let result = await TestChamber.update(
    {name: "3.1"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 3,
      "shelf": 1,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 1,
      "card_config.wifi_24_GHz.model": "AXM",
      "card_config.wifi_24_GHz.ip": "10.3.65.107",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 3,
      "card_config.wifi_5_GHz.model": "AXM",
      "card_config.wifi_5_GHz.ip": "10.3.65.107",

      "card_config.ethernet.port": 2,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.107",

      "attenuator.ports_24_GHz": "9-12",
      "attenuator.ports_5_GHz": "13-16",
      "attenuator.ip": "10.3.65.43",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber 3.1 updated successfully...';
  } else {
    return 'Chamber 3.1 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 3.2 to current configuration
 */
async function updateChamber_3_2() {
  
  let result = await TestChamber.update(
    {name: "3.2"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 3,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 4,
      "card_config.wifi_24_GHz.model": "WBX5",
      "card_config.wifi_24_GHz.ip": "10.3.65.107",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 2,
      "card_config.wifi_5_GHz.model": "AXM",
      "card_config.wifi_5_GHz.ip": "10.3.65.107",

      "card_config.ethernet.port": 1,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.107",

      "attenuator.ports_24_GHz": "13-16",
      "attenuator.ports_5_GHz": "9-12",
      "attenuator.ip": "10.3.65.44",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber 3.2 updated successfully...';
  } else {
    return 'Chamber 3.2 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 4.1 to current configuration
 */
async function updateChamber_4_1() {
  
  let result = await TestChamber.update(
    {name: "4.1"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 4,
      "shelf": 1,
  }});

  if (result.n && result.ok) {
    return 'Chamber 4.1 updated successfully...';
  } else {
    return 'Chamber 4.1 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 4.3 to current configuration
 */
async function updateChamber_4_3() {
  
  let result = await TestChamber.update(
    {name: "4.3"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 4,
      "shelf": 3,
  }});

  if (result.n && result.ok) {
    return 'Chamber 4.3 updated successfully...';
  } else {
    return 'Chamber 4.3 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 5.1 to current configuration
 */
async function updateChamber_5_1() {
  
  let result = await TestChamber.update(
    {name: "5.1"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 5,
      "shelf": 1,
  }});

  if (result.n && result.ok) {
    return 'Chamber 5.1 updated successfully...';
  } else {
    return 'Chamber 5.1 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 6.1 to current configuration
 */
async function updateChamber_6_1() {
  
  let result = await TestChamber.update(
    {name: "6.1"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 6,
      "shelf": 1,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 5,
      "card_config.wifi_24_GHz.model": "WBX5",
      "card_config.wifi_24_GHz.ip": "10.3.65.108",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 7,
      "card_config.wifi_5_GHz.model": "RFX5",
      "card_config.wifi_5_GHz.ip": "10.3.65.108",

      "card_config.ethernet.port": 3,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.108",

      "attenuator.ports_24_GHz": "9-12",
      "attenuator.ports_5_GHz": "13-16",
      "attenuator.ip": "10.3.65.47",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber 6.1 updated successfully...';
  } else {
    return 'Chamber 6.1 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 7.1 to current configuration
 */
async function updateChamber_7_1() {
  
  let result = await TestChamber.update(
    {name: "7.1"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 7,
      "shelf": 1,
  }});

  if (result.n && result.ok) {
    return 'Chamber 7.1 updated successfully...';
  } else {
    return 'Chamber 7.1 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 7.2 to current configuration
 */
async function updateChamber_7_2() {
  
  let result = await TestChamber.update(
    {name: "7.2"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 7,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 2,
      "card_config.wifi_24_GHz.slot": 2,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.108",

      "card_config.wifi_5_GHz.port": 2,
      "card_config.wifi_5_GHz.slot": 1,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.108",

      "card_config.ethernet.port": 2,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.108",

      "attenuator.ports_24_GHz": "13-16",
      "attenuator.ports_5_GHz": "5-8",
      "attenuator.ip": "10.3.65.98",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber 7.2 updated successfully...';
  } else {
    return 'Chamber 7.2 NOT updated successfully...';
  }
}

/**
 * Updates Chamber 8.2 to current configuration
 */
async function updateChamber_8_2() {
  
  let result = await TestChamber.update(
    {name: "8.2"},
    {$set: {
      "firmware": "7.3.2",
      "rack": 8,
      "shelf": 2,

      "card_config.wifi_24_GHz.port": 1,
      "card_config.wifi_24_GHz.slot": 1,
      "card_config.wifi_24_GHz.model": "WBW3602",
      "card_config.wifi_24_GHz.ip": "10.3.65.108",

      "card_config.wifi_5_GHz.port": 1,
      "card_config.wifi_5_GHz.slot": 2,
      "card_config.wifi_5_GHz.model": "WBW3602",
      "card_config.wifi_5_GHz.ip": "10.3.65.108",

      "card_config.ethernet.port": 1,
      "card_config.ethernet.slot": 8,
      "card_config.ethernet.model": "WBE1604",
      "card_config.ethernet.ip": "10.3.65.108",

      "attenuator.ports_24_GHz": "9-12",
      "attenuator.ports_5_GHz": "1-4",
      "attenuator.ip": "10.3.65.98",
      "attenuator.make": "JFW"
  }});

  if (result.n && result.ok) {
    return 'Chamber 8.2 updated successfully...';
  } else {
    return 'Chamber 8.2 NOT updated successfully...';
  }
}

/**
 * Updates all test chambers to current/correct configuration
 */
async function updateChamberConfigs() {
  let results = [];
  results.push(await updateChamber_A());
  results.push(await updateChamber_B());
  results.push(await updateChamber_C());
  results.push(await updateChamber_D());

  results.push(await updateChamber_I());
  results.push(await updateChamber_J());
  results.push(await updateChamber_K());
  results.push(await updateChamber_L());

  results.push(await updateChamber_E());
  results.push(await updateChamber_F());
  results.push(await updateChamber_G());
  results.push(await updateChamber_H());

  results.push(await updateChamber_2_2());
  results.push(await updateChamber_3_1());
  results.push(await updateChamber_3_2());
  results.push(await updateChamber_4_1());
  results.push(await updateChamber_4_3());
  results.push(await updateChamber_5_1());
  results.push(await updateChamber_6_1());
  results.push(await updateChamber_7_1());
  results.push(await updateChamber_7_2());
  results.push(await updateChamber_8_2());

  results = results.filter(result => result.includes('NOT'));

  return results;
}

/**
 * Updates test suite naming to always use "test_cases"
 */
async function updateTestSuiteNamingConvention() {
  await TestSuite.updateMany({}, {
    $rename: {
      "test_suites": "test_cases"
    }
  });
}

//
// Update starts here!!!
//
// This update script do the following:
//   1) Update test file paths for 7.3.X
//   2) Update chamber configurations per current configuration
//   3) Update test suite naming convention
//
module.exports = async function(done, fail, updateStatus) {
  let results = [];

  try {
    updateStatus('Updating test file paths...'.bold.cyan);
    await updateTestFilePaths();

    updateStatus('Updating chamber configurations...'.bold.cyan);
    results = await updateChamberConfigs();

    updateStatus('Updating test suite naming...'.bold.cyan);
    await updateTestSuiteNamingConvention();
  } catch(e) {
    
    // There was an error
    fail(e.toString());
    return;
    
  }

  if (results.length) {
    fail(results);
    return;
  }

  done();
};
