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
const User = require('../models/User.js');
const Dut = require('../models/Dut.js');
const DutFirmware = require('../models/DutFirmware.js');
const TestRun = require('../models/TestRun.js');
const TestSuite = require('../models/TestSuite.js');

// NodeJS imports
const path = require('path');

const { Client } = require('pg');

// PostgreSQL 
var client = null;

// Cache objects
var dutFirmwareIdCache = {};
var dutIdCache = {};
var prdIdCache = {};
var userIdCache = {};

// Database details
const databaseSettings = {
  "host": "96.37.189.5",
  "port": 5432,
  "database": "wifi",
  "user": "migrate",
  "password": "migrate"
};

//
// Helper function
//
// Returns an object with the requested keys and their values
//
function sliceKeys(obj, arr) {
  let ret = {};
  arr.forEach(e => ret[e] = obj[e]);
  return ret;
}

//
// Helper function
//
// Converts a SQL DutFirmware object to MongoDB DutFirmware object
//
function sqlToDutFirmware(result) {
  let ret = {};
  
  Object.assign(ret, sliceKeys(result, [
    'name',
    'model_name',
    'company'
  ]));
  
  ret['id'] = result['fid'];
  
  ret['capabilities'] = sliceKeys(result, [
    'standards',
    'capable_24',
    'max_band_24',
    'ant_tx_24',
    'ant_rx_24',
    'ss_24',
    'capable_5',
    'max_band_5',
    'ant_tx_5',
    'ant_rx_5',
    'ss_5',
    'dual_band',
    'ipv4',
    'ipv6',
    'sg',
    'lg',
    'su_mimo',
    'mu_mimo'
  ]);
  
  let capabilities = ret['capabilities'];
  capabilities['standards'] = capabilities['standards'].split(',');
  let keys = Object.keys(capabilities);
  
  keys.forEach(key => {
    if (!isNaN(capabilities[key])) {
      capabilities[key] = parseInt(capabilities[key]);
    }
  });
  
  return ret;
}


/**
 * Fetches DutFirmware objects from Postgres database
 * 
 * @return {Array} returns an array of SQL rows with DutFirmware objects
 */
async function getDutFirmwares() {
    
  let result = await client.query(
    
    'SELECT ' +
    
    'dut_firmwares.id as fid, dut_firmwares.name, ' +
    'dut_models.name as model_name, ' +
    'companies.name as company, dut_capabilities.* ' +
    
    'FROM dut_firmwares ' + 
    
    'INNER JOIN dut_models ON dut_firmwares.dut_model_id=dut_models.id ' + 
    
    'INNER JOIN dut_capabilities ON ' + 
    'dut_firmwares.id=dut_capabilities.firmware_id ' + 
    
    'INNER JOIN companies ON dut_models.company_id=companies.id'
    
  );
  
  return result.rows;
  
}

/**
 * Fetches Dut objects from Postgres database
 * 
 * @return {Array} returns an array of SQL rows with Dut objects
 */
async function getDuts() {
    
  let result = await client.query(
    
    'SELECT ' + 
    'id, mac_address, serial_number, barcode_id, firmware_id as firmware, ' + 
    'type ' + 
    
    'FROM duts'
    
  );
  
  return result.rows;
  
}

/**
 * Fetches TestRun objects from Postgres database
 * "test_type_id" field will be converted to "type" with name of the test type
 * "user_id" field will be converted to "name" with name of the user
 * 
 * @return {Array} returns an array of SQL rows with TestRun objects
 */
async function getTestRuns() {
    
  let result = await client.query(
    
    'SELECT ' +
    
    'test_runs.id as tid, test_runs.directory, test_runs.notes, ' +
    'test_runs.reboot, test_runs.is_baseline, test_runs.test_start, ' + 
    'test_runs.test_end, test_runs.total_planned, test_runs.dut_id as dut, ' + 
    'test_runs.firmware_id as firmware, test_runs.prd_id as prd, ' +
    'test_runs.manual_import, test_runs.short_name, ' + 
    
    'test_types.name as type, ' + 
    'auth_user.username as user ' + 
    
    'FROM test_runs ' + 
    
    'INNER JOIN test_types ON test_runs.type_id=test_types.id ' + 
    'INNER JOIN auth_user ON test_runs.user_id=auth_user.id'
    
  );
  
  return result.rows;
  
}


/**
 * Convert a TestRun SQL entry into a Dut TestRun entry
 * 
 * @param {Object} testRuns - Array of TestRun SQL rows
 *
 * @return Does not return a value
 */
async function processTestRuns(testRuns) {
  
  const TEST_RESULT_BASE = '/mnt/wifi_vol/Testing_Area/Test_Results';
  
  let len = testRuns.length;
  for(let i = 0; i < len; i++) {
    
    let testRun = testRuns[i];
    
    testRun['id'] = testRun['tid'];
    delete testRun['tid'];
    delete testRun['is_baseline']
    
    // Translate directory
    testRun['directory'] = path.
      join(TEST_RESULT_BASE, testRun['directory']).
      replace(/\\/gi, '/');
    
    // There's no topology in the SQL object. Insert it
    testRun['topology'] = {};
    
    // Translate into ObjectIds
    testRun['prd'] = prdIdCache[testRun['prd']];
    testRun['user'] = userIdCache[testRun['user']];
    testRun['type'] = testRun['type'].replace(/\s/gi, '_').toLowerCase();
    testRun['firmware'] = dutFirmwareIdCache[testRun['firmware']];
    testRun['dut'] = dutIdCache[testRun['dut']];
    testRun['test_results'] = null;
    testRun['legacy'] = true;
    
    // Replace in array
    testRuns[i] = testRun;
    
  }
  
  // We don't have to cache the Ids, so we can bulk insert
  // This saved approximately 50% time
  await TestRun.insertMany(testRuns);
  
}

/**
 * Convert a Dut SQL entry into a Dut MongoDB entry
 * 
 * @param {Object} duts - Array of Dut SQL rows
 *
 * @return Does not return a value
 */
async function processDuts(duts) {
  
  let dut = null;
  
  // Pop, insert, and cache Dut IDs
  while(( dut = duts.splice(0,1)[0] )) {
    
    // Translate "firmware" into an ObjectId
    dut['firmware'] = dutFirmwareIdCache[dut['firmware']] || null;
    
    let obj = await Dut.create(dut);
    dutIdCache[obj.id] = obj._id;
  }
  
}

/**
 * Convert a DutFirmware SQL entry into a DutFirmware MongoDB entry
 * 
 * @param {Object} dutFirmwares - Array of DutFirmware SQL rows
 *
 * @return Does not return a value
 */
async function processDutFirmwares(dutFirmwares) {
  
  let dutFirmware = null;
  
  // Pop, insert, and cache DutFirmware IDs
  while(( dutFirmware = dutFirmwares.splice(0,1)[0] )) {
    let normalizedDutFirmware = sqlToDutFirmware(dutFirmware);
    let obj = await DutFirmware.create(normalizedDutFirmware);
    dutFirmwareIdCache[obj.id] = obj._id;
  }
  
}

/**
 * Caches Prds/TestSuites into a global array "prdIdCache"
 *
 * @return Does not return a value
 */
async function cachePrds() {
  
  // .json files in NodeJS will automatically be parsed into JSON
  let test_suites_wave_1 = require('./data/0006-test_suites_wave_1.json');
  let test_suites_wave_2 = require('./data/0006-test_suites_wave_2.json');
  
  // Cache the IDs
  prdIdCache['1'] = (await TestSuite.create(test_suites_wave_1))._id;
  prdIdCache['2'] = (await TestSuite.create(test_suites_wave_2))._id;
  
}

/**
 * Caches Users into a global array "userIdCache"
 *
 * @return Does not return a value
 */
async function cacheUsers() {
  
  let users = await User.find({});
  let user = null;
  
  while ( (user = users.splice(0, 1)[0] ) ) {
    // Process every single user we have and cache their ID
    userIdCache[user.userid] = user._id;
  }
  
}

//
// Update starts here!!!
//
// This update script do the following:
//   1) Insert(mongo) and cache TestSuite objects from "data" folder
//   2) Cache Users for fast username to ObjectId translation
//   3) Fetch(from psql), cache, process fields, and insert(mongo) DutFirmwares
//   4) Fetch(from psql), cache, process fields, and insert(mongo) Duts
//   5) Fetch(from psql), process fields, and insert(mongo) TestRuns
//
// "id" fields will be converted into the MongoDB ObjectId datatype
//
//
//
// To rerun this migration, execute the following on the mongo shell:
// > use smart
// > db.updates.remove({"filename": "0006-firmware-dut-test_run-migration.js"})
//    
module.exports = async function(done, fail, updateStatus) {
  
  // Create the Postgres client
  client = new Client(databaseSettings);
  
  let messages = [];
  
  let startTime = (new Date()).getTime();
  let timeRef = startTime;
  
  let toSeconds = time => Math.round(time / 10) / 100;
  
  let timeDiff = () => {
    let now = (new Date()).getTime();
    let retDiff = toSeconds(now - timeRef);
    timeRef = now;
    return retDiff;
  };
  
  try {
    
    // Connect to postgres
    await client.connect();
    
    // Delete existing collections
    updateStatus('Deleting Collections...'.bold.cyan);
    let collections = [Dut, DutFirmware, TestSuite, TestRun];
    for(let i = 0; i < collections.length; i++) {
      try {
        let Model = collections[i];
        await Model.collection.drop();
      } catch(e) {
        // Collection does not exist
      }
    }
    
    // Cache PRD and Users for later lookups
    await cachePrds();
    await cacheUsers();
    
    // Process dut_firmwares
    updateStatus('Fetching DutFirwares...'.bold.cyan);
    let dutFirmwares = await getDutFirmwares();
    await processDutFirmwares(dutFirmwares);
    messages.push('DutFirmwares: ' + timeDiff() + 's');
    
    // Process duts; they need dut_firmwares, which should be cached 
    updateStatus('Fetching Duts...'.bold.cyan);
    let duts = await getDuts();
    await processDuts(duts);
    messages.push('Duts: ' + timeDiff() + 's');
    
    // Process test_runs; we have all necessary objects for lookup
    updateStatus('Fetching TestRuns...'.bold.cyan);
    let testRuns = await getTestRuns();
    await processTestRuns(testRuns);
    messages.push('TestRuns: ' + timeDiff() + 's');
    
    
  } catch(e) {
    
    // There was an error
    fail(e.toString());
    return;
    
  } finally {
    
    // At the end of the block, end the Postgres connection
    client.end();
    
  }
  
  // How long it took to run update
  let totalTime = toSeconds((new Date()).getTime() - startTime);
  
  // If we make it here, we can assume success!
  messages.push('Total Time: ' + totalTime + 's');
  done(messages);
  
};
