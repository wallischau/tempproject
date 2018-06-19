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
const Dut = require('../models/Dut.js');
const DutFirmware = require('../models/DutFirmware.js');

const { Client } = require('pg');

// PostgreSQL 
var client = null;

// Database details
const databaseSettings = {
  "host": "96.37.189.5",
  "port": 5432,
  "database": "wifi",
  "user": "migrate",
  "password": "migrate"
};

/**
 * Fetches Dut objects from Postgres database
 * 
 * @return Dut object
 */
async function getChamberDuts() {
  let result = await client.query(
    
    'SELECT ' +
    
    'duts.id, ' +
    'chambers.name ' +

    'FROM chambers ' + 

    'INNER JOIN duts ON duts.id=chambers.dut_id'

  );

  return result.rows;
}

async function getChambers() {

  let result = await client.query(
    'SELECT * FROM chambers'
  );

  return result.rows;
}

async function getChamberChassis(chamber) {
  let result = await client.query(
    'SELECT tools.*, companies.name as company_name FROM tools ' +
    'INNER JOIN companies ON companies.id=tools.company_id ' +
    'WHERE tools.id=' + chamber.tool_id
  )

  return result.rows;
}

async function getChamberJfw(chamber) {
  let result = await client.query(
    'SELECT tools.*, companies.name as company_name FROM tools ' +
    'INNER JOIN companies ON companies.id=tools.company_id ' +
    'WHERE tools.id=' + chamber.jfw_id
  )

  return result.rows
}

async function getChamberCard(chamber, purpose) {
  let result = await client.query(
    "SELECT * FROM card_ports " +
    "INNER JOIN cards ON cards.id=card_ports.card_id " +
    "INNER JOIN card_models ON card_models.id=cards.model_id " +
    "WHERE card_ports.chamber_id=" + chamber.id + " " +
    "AND card_ports.purpose='" + purpose + "'"
  );
  return result.rows;
}

/** Clears Chambers collection in the mongoDB
 *
 * @return true if the collection was successfully emptied
 */
async function clearChambersCollection() {
  await TestChamber.remove({});
}

/** Makes base chamber documents in the mongoDB
 *
 * @return true if the operation was successfull
 */
async function makeBaseChambers() {
  let baseChamber = {
    "type": "test",
    "name": "",
    "make": "",
    "model": "",
    "serial": "",
    "firmware": "",
    "rack": "",
    "shelf": "",
    "reserved_by": "",
    "attenuator": {
      "make": "",
      "ip": "",
      "ports_5_GHz": "",
      "ports_24_GHz": ""
    },
    "ixia_card_config": {
      "wifi_5_GHz": {
        "ip": "",
        "model": "",
        "serial": "",
        "slot": "",
        "port": ""
      },
      "wifi_24_GHz": {
        "ip": "",
        "model": "",
        "serial": "",
        "slot": "",
        "port": ""
      },
      "ethernet": {
        "ip": "",
        "model": "",
        "serial": "",
        "slot": "",
        "port": ""
      }
    },
    "dut": null
  }

  let chambers = await getChambers();
  let success = true;
  let sortedChamberNames = [];

  for (i = 0; i < chambers.length; i++) {
    sortedChamberNames.push(chambers[i].name);
  }

  sortedChamberNames = sortedChamberNames.sort();

  for (i = 0; i < sortedChamberNames.length; i++) {
    baseChamber.name = sortedChamberNames[i];
    let result = await TestChamber.create(baseChamber);

    if (result == null) {
      success = false;
      break;
    }
  }
  return success;
}

/**
 * Sets Test Chamber DUTs in the mongoDB to what is in 
 * postgreSQL
 *
 * @return true if test chambers updated successfully
 */
async function setChamberDuts() {
  let chamberDuts = await getChamberDuts();

  success = true;

  for (i = 0; i < chamberDuts.length; i++) {
    let dut = await Dut.find({'id': chamberDuts[i].id});

    if (dut == null) {
      success = false;
      continue;
    }

    if (dut.length != 1) {
      success = false;
      continue;
    }
    dut = dut[0];

    let result = await TestChamber.findOneAndUpdate(
      { name: chamberDuts[i].name },
      { $set: { dut: dut }}
    );

    if (result == null) {
      success = false;
    }
  }

  return success;
}

/**
 * Sets Test Chamber card configs and attenuator in the mongoDB 
 * to what is in postgreSQL
 *
 * @return true if test chambers updated successfully
 */
async function updateChambersConfig() {
  let success = true;
  let chambers = await getChambers();

  for (i = 0; i < chambers.length; i++) {
    chamber = chambers[i];

    let chamberChassis = await getChamberChassis(chamber);

    if (chamberChassis.length != 1) {
      chamberChassis = [{
        company_name: '',
        model: '',
        serial_number: '',
        firmware: '',
        ip: ''
      }]
    }

    chamberChassis = chamberChassis[0];

    chamberUpdate = {
      $set: {
        make: chamberChassis.company_name == 'IXIA' ? 'Ixia' : 'OctoBox',
        model: chamberChassis.model,
        serial: chamberChassis.serial_number,
        firmware: chamberChassis.firmware,
        rack: chamber.rack,
        shelf: chamber.shelf
      },
      $unset: {
        location: '',
        ixia_card_config: ''
      }
    }

    let chamberJfw = await getChamberJfw(chamber);

    if (chamberJfw.length != 1) {
      chamberJfw = [{
        ip: '',
        company_name: ''
      }]
    }

    chamberJfw = chamberJfw[0];

    chamberUpdate.$set.attenuator = {
      ports_24_GHz: chamber.jfw_24_ports,
      ports_5_GHz: chamber.jfw_5_ports,
      ip: chamberJfw.ip,
      make: chamberJfw.company_name
    };

    let default_card = {
      port: '',
      slot: '',
      serial: '',
      model: '',
      ip: chamberChassis.ip
    }

    chamberUpdate.$set.card_config = {
      wifi_24_GHz: Object.assign({}, default_card),
      wifi_5_GHz: Object.assign({}, default_card),
      ethernet: Object.assign({}, default_card)
    }

    let card = await getChamberCard(chamber, 'r_24');

    if (card.length == 1) {
      card = card[0];

      chamberUpdate.$set.card_config.wifi_24_GHz = {
        port: card.port,
        slot: card.slot_num,
        serial: '',
        model: card.name,
        ip: chamberChassis.ip
      }
    }

    card = await getChamberCard(chamber, 'r_5');
    if (card.length == 1) {
      card = card[0];

      chamberUpdate.$set.card_config.wifi_5_GHz = {
        port: card.port,
        slot: card.slot_num,
        serial: '',
        model: card.name,
        ip: chamberChassis.ip
      }
    }

    card = await getChamberCard(chamber, 'eth');
    if (card.length == 1) {
      card = card[0];

      chamberUpdate.$set.card_config.ethernet = {
        port: card.port,
        slot: card.slot_num,
        serial: '',
        model: card.name,
        ip: chamberChassis.ip
      }
    }

    let result = await TestChamber.findOneAndUpdate(
      {name: chamber.name},
      chamberUpdate
    );

    if (result == null) {
      success = false;
    }
  }

  return success;
}

//
// Update starts here!!!
//
// This update script do the following:
//   1) Find associated DUT for a chamber
//   2) Update chamber to reference that dut rather than duplicate the information
//
module.exports = async function(done, fail, updateStatus) {

  // Create the Postgres client
  client = new Client(databaseSettings);

  try {
    // Connect to postgres
    await client.connect();

    updateStatus('Clearing chamber collection...'.bold.cyan);
    success = await clearChambersCollection();

    if (success == false) {
      fail('Error clearing chambers collection in 0007-update_chamber_duts.js');
      return;
    }

    updateStatus('Making base chambers...'.bold.cyan);
    success = await makeBaseChambers();

    if (success == false) {
      fail('Error making base chambers in 0007-update_chamber_duts.js');
      return;
    }

    updateStatus('Setting chamber DUTs...'.bold.cyan);
    success = await setChamberDuts();

    if (success == false) {
      fail('Error setting chamber duts in 0007-update_chamber_duts.js');
      return;
    }

    updateStatus('Updating chamber configurations...'.bold.cyan);
    success = await updateChambersConfig();

    if (success == false) {
      fail('Error updating chamber configs in 0007-update_chamber_duts.js');
      return;
    }
  } catch(e) {
    
    // There was an error
    fail(e.toString());
    return;
    
  } finally {
    
    // At the end of the block, end the Postgres connection
    client.end();
    
  }

  done();
  
};
