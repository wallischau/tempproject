
const Model = require('../inc/model.js');
const TestChamber = require('../models/TestChamber.js');
const EthernetPort = require('../models/EthernetPort.js');

async function updateChamber_1_1() {

  let result = await TestChamber.update(
    {name: "1.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 111,
        "vlan_2": 112,
        "vlan_3": 113,
        "wan": 110
      }
  }});
  
  if (result.nModified) {
    return 'Chamber 1.1 updated successfully...';
  } else {
    return 'Chamber 1.1 NOT updated successfully...';
  }
}

async function updateChamber_1_2() {

  let result = await TestChamber.update(
    {name: "1.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 121,
        "vlan_2": 122,
        "vlan_3": 123,
        "wan": 120
      }
  }});

  if (result.nModified) {
    return 'Chamber 1.2 updated successfully...';
  } else {
    return 'Chamber 1.2 NOT updated successfully...';
  }
}

async function updateChamber_2_1() {

  let result = await TestChamber.update(
    {name: "2.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 211,
        "vlan_2": 212,
        "vlan_3": 213,
        "wan": 210
      }
  }});

  if (result.nModified) {
    return 'Chamber 2.1 updated successfully...';
  } else {
    return 'Chamber 2.1 NOT updated successfully...';
  }
}

async function updateChamber_2_2() {

  let result = await TestChamber.update(
    {name: "2.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 221,
        "vlan_2": 222,
        "vlan_3": 223,
        "wan": 220
      }
  }});

  if (result.nModified) {
    return 'Chamber 2.2 updated successfully...';
  } else {
    return 'Chamber 2.2 NOT updated successfully...';
  }
}
async function updateChamber_2_3() {

  let result = await TestChamber.update(
    {name: "2.3"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 231,
        "vlan_2": 232,
        "vlan_3": 233,
        "wan": 230            
      }
  }});

  if (result.nModified) {
    return 'Chamber 2.3 updated successfully...';
  } else {
    return 'Chamber 2.3 NOT updated successfully...';
  }
}
async function updateChamber_3_1() {

  let result = await TestChamber.update(
    {name: "3.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 311,
        "vlan_2": 312,
        "vlan_3": 313,
        "wan": 310            
      }
  }});

  if (result.nModified) {
    return 'Chamber 3.1 updated successfully...';
  } else {
    return 'Chamber 3.1 NOT updated successfully...';
  }
}
async function updateChamber_3_2() {

  let result = await TestChamber.update(
    {name: "3.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 321,
        "vlan_2": 322,
        "vlan_3": 323,
        "wan": 320            
      }
  }});

  if (result.nModified) {
    return 'Chamber 3.2 updated successfully...';
  } else {
    return 'Chamber 3.2 NOT updated successfully...';
  }
}
async function updateChamber_4_1() {

  let result = await TestChamber.update(
    {name: "4.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 411,
        "vlan_2": 412,
        "vlan_3": 413,
        "wan": 410            
      }
  }});

  if (result.nModified) {
    return 'Chamber 4.1 updated successfully...';
  } else {
    return 'Chamber 4.1 NOT updated successfully...';
  }
}
async function updateChamber_4_2() {

  let result = await TestChamber.update(
    {name: "4.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 421,
        "vlan_2": 422,
        "vlan_3": 423,
        "wan": 420            
      }
  }});

  if (result.nModified) {
    return 'Chamber 4.2 updated successfully...';
  } else {
    return 'Chamber 4.2 NOT updated successfully...';
  }
}
async function updateChamber_4_3() {

  let result = await TestChamber.update(
    {name: "4.3"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 431,
        "vlan_2": 432,
        "vlan_3": 433,
        "wan": 430            
      }
  }});

  if (result.nModified) {
    return 'Chamber 4.3 updated successfully...';
  } else {
    return 'Chamber 4.3 NOT updated successfully...';
  }
}
async function updateChamber_5_1() {

  let result = await TestChamber.update(
    {name: "5.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 511,
        "vlan_2": 512,
        "vlan_3": 513,
        "wan": 510            
      }
  }});

  if (result.nModified) {
    return 'Chamber 5.1 updated successfully...';
  } else {
    return 'Chamber 5.1 NOT updated successfully...';
  }
}
async function updateChamber_5_2() {

  let result = await TestChamber.update(
    {name: "5.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 521,
        "vlan_2": 522,
        "vlan_3": 523,
        "wan": 520            
      }
  }});

  if (result.nModified) {
    return 'Chamber 5.2 updated successfully...';
  } else {
    return 'Chamber 5.2 NOT updated successfully...';
  }
}
async function updateChamber_6_1() {

  let result = await TestChamber.update(
    {name: "6.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 611,
        "vlan_2": 612,
        "vlan_3": 613,
        "wan": 610            
      }
  }});

  if (result.nModified) {
    return 'Chamber 6.1 updated successfully...';
  } else {
    return 'Chamber 6.1 NOT updated successfully...';
  }
}
async function updateChamber_6_2() {

  let result = await TestChamber.update(
    {name: "6.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 621,
        "vlan_2": 622,
        "vlan_3": 623,
        "wan": 620            
      }
  }});

  if (result.nModified) {
    return 'Chamber 6.2 updated successfully...';
  } else {
    return 'Chamber 6.2 NOT updated successfully...';
  }
}
async function updateChamber_6_3() {

  let result = await TestChamber.update(
    {name: "6.3"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 631,
        "vlan_2": 632,
        "vlan_3": 633,
        "wan": 630            
      }
  }});

  if (result.nModified) {
    return 'Chamber 6.3 updated successfully...';
  } else {
    return 'Chamber 6.3 NOT updated successfully...';
  }
}
async function updateChamber_7_1() {

  let result = await TestChamber.update(
    {name: "7.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 711,
        "vlan_2": 712,
        "vlan_3": 713,
        "wan": 710            
      }
  }});

  if (result.nModified) {
    return 'Chamber 7.1 updated successfully...';
  } else {
    return 'Chamber 7.1 NOT updated successfully...';
  }
}
async function updateChamber_7_2() {

  let result = await TestChamber.update(
    {name: "7.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 721,
        "vlan_2": 722,
        "vlan_3": 723,
        "wan": 720          
      }
  }});

  if (result.nModified) {
    return 'Chamber 7.2 updated successfully...';
  } else {
    return 'Chamber 7.2 NOT updated successfully...';
  }
}
async function updateChamber_8_1() {

  let result = await TestChamber.update(
    {name: "8.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 811,
        "vlan_2": 812,
        "vlan_3": 813,
        "wan": 810            
      }
  }});

  if (result.nModified) {
    return 'Chamber 8.1 updated successfully...';
  } else {
    return 'Chamber 8.1 NOT updated successfully...';
  }
}
async function updateChamber_8_2() {

  let result = await TestChamber.update(
    {name: "8.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 821,
        "vlan_2": 822,
        "vlan_3": 823,
        "wan": 820            
      }
  }});

  if (result.nModified) {
    return 'Chamber 8.2 updated successfully...';
  } else {
    return 'Chamber 8.2 NOT updated successfully...';
  }
}
async function updateChamber_8_3() {

  let result = await TestChamber.update(
    {name: "8.3"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 831,
        "vlan_2": 832,
        "vlan_3": 833,
        "wan": 830            
      }
  }});

  if (result.nModified) {
    return 'Chamber 8.3 updated successfully...';
  } else {
    return 'Chamber 8.3 NOT updated successfully...';
  }
}


async function updateChamber_9_1() {

  let result = await TestChamber.update(
    {name: "9.1"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 911,
        "vlan_2": 912,
        "vlan_3": 913,
        "wan": 910            
      }
  }});

  if (result.nModified) {
    return 'Chamber 9.1 updated successfully...';
  } else {
    return 'Chamber 9.1 NOT updated successfully...';
  }
}


async function updateChamber_9_2() {

  let result = await TestChamber.update(
    {name: "9.2"},
    {$set: {
      "card_config.ethernet.vlan": {
        "vlan_1": 921,
        "vlan_2": 922,
        "vlan_3": 923,
        "wan": 920            
      }
  }});

  if (result.nModified) {
    return 'Chamber 9.2 updated successfully...';
  } else {
    return 'Chamber 9.2 NOT updated successfully...';
  }
}

async function removeEthernetPorts() {
  await EthernetPort.remove({});
}

async function updateChamberConfigs() {
  let results = [];

  results.push(await updateChamber_1_1());
  results.push(await updateChamber_1_2());
  results.push(await updateChamber_2_1());
  results.push(await updateChamber_2_2());
  results.push(await updateChamber_2_3());
  results.push(await updateChamber_3_1());
  results.push(await updateChamber_3_2());
  results.push(await updateChamber_4_1());
  results.push(await updateChamber_4_2());
  results.push(await updateChamber_4_3());
  results.push(await updateChamber_5_1());
  results.push(await updateChamber_5_2());
  results.push(await updateChamber_6_1());
  results.push(await updateChamber_6_2());
  results.push(await updateChamber_6_3());
  results.push(await updateChamber_7_1());
  results.push(await updateChamber_7_2());
  results.push(await updateChamber_8_1());
  results.push(await updateChamber_8_2());
  results.push(await updateChamber_8_3());
  results.push(await updateChamber_9_1());
  results.push(await updateChamber_9_2());

  results = results.filter(result => result.includes('NOT'));

  return results;
}

//
// Update starts here!!!
//
// This update script do the following:
//   1) Update test file paths for 7.3.X
//   2) Update chamber configurations per current configuration
//   3) Update test suite naming convention
//
module.exports = async function(done, fail) {
  let results = [];
  try {
    results = await updateChamberConfigs();
    await removeEthernetPorts();

    let ethernetPorts = [
      {chassis_ip: "10.3.65.100", slot: 8, port: 1, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/25", reserved_by_chamber: "2.3"},
      {chassis_ip: "10.3.65.100", slot: 8, port: 2, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/26", reserved_by_chamber: "2.1"},
      {chassis_ip: "10.3.65.100", slot: 8, port: 3, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/27", reserved_by_chamber: "1.2"},
      {chassis_ip: "10.3.65.100", slot: 8, port: 4, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/28", reserved_by_chamber: "1.1"},
      {chassis_ip: "10.3.65.100", slot: 9, port: 1, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/29", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.100", slot: 9, port: 2, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/30", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.100", slot: 9, port: 3, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/31", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.100", slot: 9, port: 4, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/32", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 8, port: 1, vlan_switch_ip: "10.3.65.30", vlan_interface: "1/37", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 8, port: 2, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/38", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 8, port: 3, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/39", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 8, port: 4, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/40", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 9, port: 1, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/41", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 9, port: 2, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/42", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 9, port: 3, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/43", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.101", slot: 9, port: 4, vlan_switch_ip: "10.3.65.33", vlan_interface: "1/44", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 8, port: 1, vlan_switch_ip: "10.3.65.36", vlan_interface: "", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 8, port: 2, vlan_switch_ip: "10.3.65.36", vlan_interface: "", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 8, port: 3, vlan_switch_ip: "10.3.65.36", vlan_interface: "1/34", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 8, port: 4, vlan_switch_ip: "10.3.65.36", vlan_interface: "1/36", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 9, port: 1, vlan_switch_ip: "10.3.65.36", vlan_interface: "1/25", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 9, port: 2, vlan_switch_ip: "10.3.65.36", vlan_interface: "1/26", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 9, port: 3, vlan_switch_ip: "10.3.65.36", vlan_interface: "1/27", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.102", slot: 9, port: 4, vlan_switch_ip: "10.3.65.36", vlan_interface: "1/28", reserved_by_chamber: ""},
      {chassis_ip: "10.3.65.107", slot: 8, port: 1, vlan_switch_ip: "10.3.65.31", vlan_interface: "1/21", reserved_by_chamber: "3.2"},
      {chassis_ip: "10.3.65.107", slot: 8, port: 2, vlan_switch_ip: "10.3.65.31", vlan_interface: "1/22", reserved_by_chamber: "3.1"},
      {chassis_ip: "10.3.65.107", slot: 8, port: 3, vlan_switch_ip: "10.3.65.31", vlan_interface: "1/23", reserved_by_chamber: "5.4"},
      {chassis_ip: "10.3.65.107", slot: 8, port: 4, vlan_switch_ip: "10.3.65.31", vlan_interface: "1/24", reserved_by_chamber: "2.3"},
      {chassis_ip: "10.3.65.108", slot: 8, port: 1, vlan_switch_ip: "10.3.65.35", vlan_interface: "1/0/17", reserved_by_chamber: "8.2"},
      {chassis_ip: "10.3.65.108", slot: 8, port: 2, vlan_switch_ip: "10.3.65.35", vlan_interface: "1/0/18", reserved_by_chamber: "7.2"},
      {chassis_ip: "10.3.65.108", slot: 8, port: 3, vlan_switch_ip: "10.3.65.35", vlan_interface: "1/0/19", reserved_by_chamber: "6.1"},
      {chassis_ip: "10.3.65.108", slot: 8, port: 4, vlan_switch_ip: "10.3.65.35", vlan_interface: "1/0/20", reserved_by_chamber: ""}
    ];

    await EthernetPort.insertMany(ethernetPorts);

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
