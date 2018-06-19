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
const TestRun = require('../models/TestRun.js');
const TestResult = require('../models/TestResult.js');

// NodeJS imports
const path = require('path');
const util = require('util');
const exec = util.promisify(require('child_process').exec);

const { Client } = require('pg');

// These are for bulk updates. This is the amount of TestRuns to import results
// for. On average, TestRuns have ~200 TestResults
const TEST_RUN_BLOCK_SIZE = 100;

// For translating test types
const BITS_TO_MBPS = 1000 * 1000;
const KBPS_TO_MBPS = 1000;

// Aborted text for aborted test results
const ABORT_TEXT = 'ABORTED';

function normalizeAndSplit(value, convertFunction) {
  if (typeof(value) === 'undefined' || value === 'None') {
    return null;
  }
  value = value.split('/');
  for(let i = 0; i < value.length; i++) {
    value[i] = convertFunction(value[i]);
  }
  
  return value;
}

/**
 * Fetches client configuration(MHz, GHz, MCS, SS, etc) from a test result
 *
 * @param {Object} test_configuration - Test configuration from TestResult object
 * 
 * @return {Object} Returns an object containing client configuration
 */
function createFromTestConfiguration(test_configuration) {
  
  function IPConvert(value) {
    if (typeof(value) === 'string' && value.substr(0, 3) == 'IPv') {
      return parseInt(value.substr(3));
    } else {
      return value;
    }
  }
  
  return {
    "ipv": normalizeAndSplit(test_configuration.ipv, IPConvert),
    "ghz": normalizeAndSplit(test_configuration.band, parseFloat),
    "mhz": normalizeAndSplit(test_configuration.bandwidth, parseInt),
    "mcs": normalizeAndSplit(test_configuration.mcs, parseInt),
    "interface": normalizeAndSplit(test_configuration.interface, str => str),
    "ss": (typeof(test_configuration.ss) === 'undefined' ? null : 
            test_configuration.ss == 'None' ? null : parseInt(test_configuration.ss)),
    "gi": (typeof(test_configuration.gi) === 'undefined' ? null :
            test_configuration.gi.replace(/'/g, '')),
    "retry": false,
    "direction": test_configuration.direction
  };
}

// This translate table is used to convert TestResult objects from SQL format
// to MongoDB
function round2(num) {
  // if (typeof(num) === 'number') {
  //   num = Math.round(num * 100) / 100;
  // }
  return num;
}

const TRANSLATE_TABLE = {
  
  "rate_vs_range": function(test, testResults) {
    
    let ret = createFromTestConfiguration(test.configuration);
    let configuration = test.configuration;
    let metadata = test.metadata;

    // Add additional configuration/metadata in
    ret['ampdu'] = (typeof(metadata.ampdu) === 'undefined' ?
                    null : parseInt(metadata.ampdu));
    ret['card'] = null;

    let channel = normalizeAndSplit(configuration.band, parseFloat);
    channel = channel.map(x => x == 2.4 ? 6 : x == 5 ? 149 : null);
    ret['channel'] = channel;

    ret['clients'] = (typeof(configuration.clients) === 'undefined' ?
                      null : parseInt(configuration.clients));;
    ret['data_rate_mbps'] = null;
    ret['listen_interval'] = null;
    ret['ssid'] = null;

    ret['dB_throughput'] = {};
    
    let results = testResults;
   
    for(let i = 0; i < results.length; i++) {
      let result = results[i];
      let key = parseInt(result.metadata.path_loss);
      if (typeof(result.data.forwarding_rate_bits) === 'undefined') {
        ret['dB_throughput'][key] = ABORT_TEXT;
      } else {
        ret['dB_throughput'][key] = round2(result.data.forwarding_rate_bits / BITS_TO_MBPS);
      }
    }
    
    return ret;
  },
  
  "max_client": function(test, testResults) {

    let configuration = test.configuration;
    let ret = createFromTestConfiguration(configuration);

    let results = testResults;

    // Add additional configuration/metadata in
    ret['data_rate_mbps'] = [];
    ret['traffic_flow'] = null;

    // Allign data with how we will parse it going forward
    ret['ss'] = ret['ss'] ? [ret['ss']] : [];
    
    if (typeof(results[0].data.clients) === 'undefined') {
      ret['traffic_type'] = ABORT_TEXT;
      ret['clients'] = ABORT_TEXT;
      ret['load'] = ABORT_TEXT;
    } else {
      ret['traffic_type'] = "UDP";
      ret['clients'] = results[0].data.clients;
      ret['load'] = results[0].data.iload;
    }
    
    return ret;
  },
  
  "udp_throughput": function(test, testResults) {
    
    let ret = createFromTestConfiguration(test.configuration);
    ret['clients'] = parseInt(test.configuration.clients);

    // Add additional configuration/metadata in
    ret['data_rate_mbps'] = [];
    ret['traffic_type'] = null;
    ret['traffic_flow'] = null;

    ret['frame_size_results'] = {};
    
    let results = testResults;
   
    for(let i = 0; i < results.length; i++) {
      
      let result = results[i];
      let data = result.data;
      let theoretical = data['theo_thruput_bits'];
      let actual = data['act_thruput_bits'];
      
      let frameObj = null;
      
      if (typeof(theoretical) === 'undefined') {
        
        frameObj = {
          "theoretical_mbps": ABORT_TEXT,
          "actual_mbps": ABORT_TEXT,
          "percentage": ABORT_TEXT
        };
        
      } else {
        
        // We have test data. The test was not aborted
        
        frameObj = {
          "theoretical_mbps": round2(theoretical / BITS_TO_MBPS),
          "actual_mbps": round2(actual / BITS_TO_MBPS),
          "percentage": round2(100 * (actual / theoretical))
        };
        
        if (ret['direction'] == 'BI') {
          let up_mbps = data['bi_up_bits'];
          let down_mbps = data['bi_down_bits'];
          let diff = 100 * Math.abs(up_mbps - down_mbps) / (actual / 2);
          
          frameObj['down_mbps'] = round2(down_mbps / BITS_TO_MBPS);
          frameObj['up_mbps'] = round2(up_mbps / BITS_TO_MBPS);
          frameObj['diff'] = round2(diff);
        }
        
      }
      
      ret['frame_size_results'][result.metadata.frame_size] = frameObj;
    }
      
    if (test.configuration.band == 'Eth') {
      // This is how reaperd's test parser will output traffic flow
      ret['traffic_flow'] = test.configuration.eth_type.replace('_', '=>');
      ret['eth_test'] = true;
    }
    
    return ret;
    
  },
  
  "tcp_goodput": function(test, testResults) {
    
    let ret = createFromTestConfiguration(test.configuration);
    
    ret['clients'] = parseInt(test.configuration.clients);

    // Add additional configuration/metadata in
    ret['data_rate_mbps'] = [];
    ret['traffic_type'] = null;
    ret['traffic_flow'] = null;

    ret['mss_results'] = {};
    
    
    let results = testResults;
   
    for(let i = 0; i < results.length; i++) {
      let result = results[i];
      let theoretical = result.data['theo_goodput_kbits'];
      let actual = result.data['act_goodput_kbits'];
      
      let frameObj = null;
      
      if (typeof(theoretical) === 'undefined') {
        frameObj = {
          "theoretical_mbps": ABORT_TEXT,
          "actual_mbps": ABORT_TEXT,
          "percentage": ABORT_TEXT
        };
      } else {
        frameObj = {
          "theoretical_mbps": round2(theoretical / KBPS_TO_MBPS),
          "actual_mbps": round2(actual / KBPS_TO_MBPS),
          "percentage": round2(100 * (actual / theoretical))
        };
      }
      
      ret['mss_results'][result.metadata.mss] = frameObj;
    }
    
    return ret;
    
  },
  
  "near_far": function(test, testResults) {
    
    let targetKeys = ['far', 'medium', 'near'];
    let ret = createFromTestConfiguration(test.configuration);
    ret['clients'] = parseInt(test.configuration.clients);
    ret['ampdu'] = normalizeAndSplit(test.configuration.ampdu, parseInt);
    let results = testResults;
    for(let i = 0; i < results.length; i++) {
      let result = results[i];
      let metadata = result.metadata;
      let configuration = result.configuration;

      let fwdRate = typeof(result.data.fwd_rate_kbps) === 'undefined' ? null : result.data.fwd_rate_kbps;
      let channel = normalizeAndSplit(configuration.band, parseFloat);
      channel = channel.map(x => x == 2.4 ? 6 : x == 5 ? 149 : null);
      channel = channel.length > 1 ? channel.join('/') : channel[0];

      let distanceObj = null;
      
      if (fwdRate == null) {
        distanceObj = {
          "jitter": ABORT_TEXT,
          "latency": ABORT_TEXT,
          "packet_loss": ABORT_TEXT,
          "forwarding_rate_kbps": ABORT_TEXT
        };
      } else {
        
        distanceObj = {
          "jitter": round2(result.data.jitter),
          "latency": round2(result.data.avg_lat),
          "packet_loss": round2(result.data.packet_loss),
          "forwarding_rate_kbps": round2(fwdRate)
        };
      }

      // Set up index for pulling data into distanceObj
      let index = null;
      if (metadata.client_type == 'far') {
        index = 0;
      } else if (metadata.client_type == 'medium') {
        index = 1;
      } else if (metadata.client_type == 'near') {
        index = 2;
      }

      // Pull data into distanceObj
      let keyArray = Object.keys(ret);
      for (let k in keyArray) {
        let key = keyArray[k];

        // Ignore unecessary keys
        let keysToSkip = targetKeys.slice();
        keysToSkip.push('direction');

        if (keysToSkip.includes(key)) {
          continue;
        }

        if (ret[key] && (ret[key].constructor === Array)) {
          if (ret[key].length === 3) {
            distanceObj[key] = ret[key][index];
          } else if (ret[key].length === 1) {
            distanceObj[key] = ret[key][0];
          } else {
            throw 'Found weird length';
          }
        } else {
          distanceObj[key] = ret[key];
        }
      }

      // Add additional information/keys for consisitency
      distanceObj['card'] = null;
      distanceObj['channel'] = channel;
      distanceObj['client_name'] = null;
      distanceObj['data_rate_mbps'] = null;
      distanceObj['listen_interval'] = null;
      distanceObj['ssid'] = null;


      // Place distanceObj onto returning object
      ret[metadata.client_type] = distanceObj;
    }

    // Clean up object, removing anything unnecessary
    let keyArray = Object.keys(ret);
    for (let k in keyArray) {
      let key = keyArray[k];
      if (!targetKeys.includes(key)) {
        delete ret[key];
      }
    }
    
    return ret;
    
  },
  
  "triple_play": function(test, testResults) {
    
    let targetKeys = ['voice', 'video', 'data'];
    let ret = createFromTestConfiguration(test.configuration);
    ret['clients'] = parseInt(test.configuration.clients);
    ret['ampdu'] = normalizeAndSplit(test.configuration.ampdu, parseInt);
    
    let channel = normalizeAndSplit(test.configuration.band, parseFloat);
    channel = channel.map(x => x == 2.4 ? 6 : x == 5 ? 149 : null);
    ret['channel'] = channel;

    
    let results = testResults;
    for(let i = 0; i < results.length; i++) {
      let result = results[i];
      let metadata = result.metadata;
      let configuration = result.configuration;

      let fwdRate = typeof(result.data.fwd_rate_kbps) === 'undefined' ? null : result.data.fwd_rate_kbps;

      let distanceObj = null;
      let overtime = [];
      
      if (fwdRate == null) {
        distanceObj = {
          "jitter": ABORT_TEXT,
          "latency": ABORT_TEXT,
          "packet_loss": ABORT_TEXT,
          "forwarding_rate_kbps": ABORT_TEXT
        };
      } else {
        
        if (result.data.time) {
          for(let i = 1; i <= 60; i++) {
            let point = result.data.time[i + '.0'];
            overtime.push(point ? round2(point.fwd_rate_kbps) : 0);
          }
        }
        
        distanceObj = {
          "jitter": round2(result.data.jitter),
          "latency": round2(result.data.avg_lat),
          "packet_loss": round2(result.data.packet_loss),
          "forwarding_rate_kbps": round2(fwdRate)
        };
      }
      
      if (!ret[metadata.client_type]) {
        ret[metadata.client_type] = {}
      }

      // Set up indices for pulling data into distanceObj
      let dbIndex = Object.keys(ret[metadata.client_type]).length;
      let ghzKey = (metadata.band || ret['ghz'][dbIndex]).toString()
                   .replace('.', '');

      let clientIndex = null;
      if (metadata.client_type == 'voice') {
        clientIndex = 0;
      } else if (metadata.client_type == 'video') {
        clientIndex = 1;
      } else if (metadata.client_type == 'data') {
        clientIndex = 2;
      }

      // Pull data into distanceObj
      let keyArray = Object.keys(ret);
      for (let k in keyArray) {
        let key = keyArray[k];

        // Ignore unecessary keys
        let keysToSkip = targetKeys.slice();
        keysToSkip.push('direction');
        if (keysToSkip.includes(key)) {
          continue;
        }

        if (ret[key] && (ret[key].constructor === Array)) {
          let index = null;
          if (ret[key].length === 3) {
            index = clientIndex;
          } else if (ret[key].length === 2) {
            index = dbIndex;
          } else if (ret[key].length === 1) {
            index = 0;
          } else {
            throw 'Found weird length';
          }
          distanceObj[key] = ret[key][index];
        } else {
          distanceObj[key] = ret[key];
        }
      }

      // Add additional information/keys for consisitency
      distanceObj['card'] = null;
      distanceObj['client_name'] = null;
      distanceObj['data_rate_mbps'] = null;
      distanceObj['listen_interval'] = null;
      distanceObj['overtime'] = overtime;
      distanceObj['ssid'] = null;

      // Place distanceObj onto returning object
      ret[metadata.client_type][ghzKey] = distanceObj;
    }

    // Clean up object, removing anything unnecessary
    let keyArray = Object.keys(ret);
    for (let k in keyArray) {
      let key = keyArray[k];
      if (!targetKeys.includes(key)) {
        delete ret[key];
      }
    }
    
    return ret;
  },
  
  "latency": function(test, testResults) {
    
    let configuration = test.configuration;
    let ret = createFromTestConfiguration(configuration);
    ret['frame_size_results'] = {};
    
    let results = testResults;

    // Add additional configuration/metadata in
    ret['clients'] = (typeof(configuration.clients) === 'undefined' ?
                      null : parseInt(configuration.clients));
    ret['data_rate_mbps'] = [];
    ret['traffic_flow'] = null;
    ret['traffic_type'] = null;

    // Align data with how we will parse it going forward
    ret['ss'] = ret['ss'] ? [ret['ss']] : [];
   
    for(let i = 0; i < results.length; i++) {
      let result = results[i];
      
      let latencyObj = null;
      
      if (typeof(result.data.avg_jit) === 'undefined') {
        latencyObj = {
          "jitter": ABORT_TEXT,
          "latency": ABORT_TEXT
        }
      } else {
        latencyObj = {
          "jitter": round2(result.data.avg_jit),
          "latency": round2(result.data.avg_lat)
        }
      }
      
      ret['frame_size_results'][result.metadata.frame_size] = latencyObj;
    }
    
    return ret;
    
  },
  
  "unicast_video": function(test, testResults) {
    
    let ret = createFromTestConfiguration(test.configuration);
    
    let results = testResults;
    let configuration = test.configuration;
    
    let data = results[0].data;
    
    if (typeof(data.clients) === 'undefined') {
      ret['sessions'] = ABORT_TEXT;
      ret['max_mlr'] = ABORT_TEXT;
      ret['max_delay_factor'] = ABORT_TEXT;
    } else {
      ret['sessions'] = data.clients;
      ret['max_mlr'] = round2(data.mlr);
      ret['max_delay_factor'] = round2(data.delay_factor);
    }

    // No need for arrays here
    let arrayKeys = ['ipv', 'ghz', 'mhz', 'mcs', 'interface']
    for (let i = 0; i < arrayKeys.length; i++) {
      let key = arrayKeys[i];
      if (ret[key]) {
        if (ret[key].length != 1) {
          throw ('Found ' + key +
                 ' array with unexpected length for unicast_video');
        } else {
          ret[key] = ret[key][0];
        }
      }
    }

    // Add additional configuration/metadata in
    let channel = normalizeAndSplit(configuration.band, parseFloat);
    channel = channel.map(x => x == 2.4 ? 6 : x == 5 ? 149 : null);
    channel = channel.length > 1 ? channel.join('/') : channel[0];

    ret['channel'] = channel;
    ret['listen_interval'] = null;
    ret['data_rate_mbps'] = null;
    ret['clients'] = (typeof(configuration.clients) === 'undefined' ?
                      null : parseInt(configuration.clients));
    ret['ssid'] = null;
    ret['card'] = null;
    ret['ampdu'] = null;
    delete ret['direction'];
    
    return ret;
    
  },
  
  "wmm_power_save": function(test, testResults) {
    
    let ret = [];
    
    let results = testResults;
    let configurationData = createFromTestConfiguration(test.configuration);

    let configurationKeys = [
      'ampdu', 'card', 'channel', 'client_name', 'clients', 'data_rate_mbps',
      'ghz', 'gi', 'interface', 'ipv', 'jitter', 'latency', 'mcs', 'mhz',
      'packet_loss', 'ss', 'ssid'
    ]

    let channel = normalizeAndSplit(test.configuration.band, parseFloat);
    channel = channel.map(x => x == 2.4 ? 6 : x == 5 ? 149 : null);
    channel = channel.length > 1 ? channel.join('/') : channel[0];
    configurationData['channel'] = channel;
    configurationData['clients'] = (
      typeof(test.configuration.clients) === 'undefined' ?
      null : parseInt(test.configuration.clients));
    
    let WMM_CLIENT_TYPE = {
      'awake': 'Awake',
      'leg': 'Legacy',
      'wmm': 'WMM'
    };

    // Add additional configuration/metadata in
    // Remove undesired keys
    let actualKeys = Object.keys(configurationData);
    for (let i = 0; i < actualKeys.length; i++) {
      let key = actualKeys[i];
      if (!configurationKeys.includes(key)) {
        delete configurationData[key];
      }
    }

    // Add missing keys and correct arrays
    for (let i = 0; i < configurationKeys.length; i++) {
      let key = configurationKeys[i];

      if (!actualKeys.includes(key)) {
        configurationData[key] = null;
      }

      if (configurationData[key] && 
          (configurationData[key].constructor === Array)) {
        if (configurationData[key].length == 1) {
          configurationData[key] = configurationData[key][0];
        } else {
          throw 'Unexpected ' + key + ' array length found in wmm_power_save';
        }
      }
    }
    
    for (let i = 0; i < results.length; i++) {
      
      let data = results[i].data;
      let metadata = results[i].metadata;
      let clientType = WMM_CLIENT_TYPE[metadata.client_type];
      let currentResult = {};
      
      if (typeof(data.fwd_rate_kbps) === 'undefined') {
        currentResult = {
          'retry': ABORT_TEXT,
          'listen_interval': ABORT_TEXT,
          'client_type': ABORT_TEXT,
          'forwarding_rate_kbps': ABORT_TEXT
        }
      } else {
        currentResult = {
          'retry': false,
          'listen_interval': parseInt(metadata.listening_interval),
          'client_type': clientType,
          'forwarding_rate_kbps': round2(data.fwd_rate_kbps)
        }
      }
      currentResult = Object.assign(currentResult, configurationData);
      ret.push(currentResult);
    }
    
    return ret;
    
  },
  
  "multicast_video": function(test, testResults) {

    let ret = [];
    
    let results = testResults;
    
    for(let i = 0; i < results.length; i++) {
      
      let data = results[i].data;
      let metadata = results[i].metadata;
      
      if (typeof(data.mlr) === 'undefined') {
        ret.push({
          "client_name": ABORT_TEXT,
          "stream_name": ABORT_TEXT,
          "stream_ip": ABORT_TEXT,
          "retry": ABORT_TEXT,
          "delay_factor": ABORT_TEXT,
          "media_loss_rate": ABORT_TEXT
        });
      } else {
        ret.push({
          "client_name": metadata.client_name,
          "stream_name": metadata.stream_name,
          "stream_ip": metadata.stream_ip,
          "retry": false,
          "delay_factor": round2(data.delay_factor),
          "media_loss_rate": round2(data.mlr)
        });
      }
    }
    
    // This is to maintain the original order of the data as it is displayed
    ret.sort((a,b) => {
      if (a.client_name < b.client_name) {
        return -1;
      } else if (a.client_name > b.client_name) {
        return 1;
      } else {
        if (a.stream_ip > b.stream_ip) {
          return 1;
        } else {
          return -1;
        }
      }
    });
    
    return ret;
    
  },
  
  "mixed_client": function(test, testResults) {
    
    let ret = [];
    
    let results = testResults;
    
    for(let i = 0; i < results.length; i++) {
      let result = results[i];
      let metadata = result.metadata;
      let configuration = result.configuration;
      let ampdu = (typeof(metadata.ampdu) === 'undefined' ?
                    null : parseInt(metadata.ampdu));
      let mcs = (typeof(metadata.mcs) === 'undefined' ?
                  null : parseInt(metadata.mcs));
      let ss = (typeof(metadata.ss) === 'undefined' ?
                null : parseInt(metadata.ss));
      let rate = (typeof(metadata.data_phy_rate) === 'undefined' ?
                  null : parseInt(metadata.data_phy_rate));
      let clients = (typeof(configuration.clients) === 'undefined' ?
                     null : parseInt(configuration.clients));
      // Get IPV value. Will be in format IPv4/IPv4/IP...
      // Must split this on / and make sure all values are the same
      let ipv = (typeof(configuration.ipv) === 'undefined' ?
                 null : configuration.ipv);
      ipv = ipv.split('/');
      let compare = ipv[0];
      for (let count = 1; count < ipv.length; count++) {
        if (ipv[count] != compare) {
          throw "IPV values not all the same for mixed client!";
        }
      }
      ipv = parseInt(ipv[0].substr(3));

      let channel = normalizeAndSplit(configuration.band, parseFloat);
      channel = channel.map(x => x == 2.4 ? 6 : x == 5 ? 149 : null);
      channel = channel.length > 1 ? channel.join('/') : channel[0];

      let newResult = {
        "ampdu": ampdu,
        "card": null,
        "channel": channel,
        "client_name": null,
        "clients": clients,
        "data_rate_mbps": rate,
        "ghz": parseFloat(metadata.band),
        "gi": (typeof(configuration.gi) === 'undefined' ? null :
                configuration.gi.replace(/'/g, '')),
        "interface": metadata.interface,
        "ipv": ipv,
        "jitter": null,
        "latency": null,
        "listen_interval": null,
        "mcs": mcs,
        "mhz": parseInt(metadata.bandwidth),
        "packet_loss": null,
        "ss": ss,
        "ssid": null,
      }
      
      if (typeof(result.data.fwd_rate_kbps) === 'undefined') {
        newResult["forwarding_rate_kbps"] = ABORT_TEXT;
        newResult["retry"] = ABORT_TEXT;
      } else {
        newResult["forwarding_rate_kbps"] = round2(result.data.fwd_rate_kbps);
        newResult["retry"] = false;
      }
      ret.push(newResult);
    }
    
    return ret;
    
  },
  
  "realworld_qoe": function(test, testResults) {
    
    let ret = [];
    
    let results = testResults;
    
    for(let i = 0; i < results.length; i++) {
      
      let result = results[i];
      let metadata = result.metadata;
      let data = result.data;
      
      let normalizeMe = val => ( isNaN(val) ? '-' : parseFloat(val) );
      
      let latency = normalizeMe(data.latency_ms);
      let jitter = normalizeMe(data.jitter_ms);
      let packet_loss = normalizeMe(data.pkt_loss);
      let kbps = normalizeMe(data.fwd_rate);
      
      let mos = (typeof(data.mos_score) === 'undefined') ? null : parseFloat(data.mos_score);
      
      let df = null;
      let mlr = null;
      
      if (typeof(data.mdi_score) != 'undefined') {
        let extract = /([0-9.]+) msecs :([0-9.]+) pkts\/min/;
        let results = data.mdi_score.match(extract);
        if (results) {
          df = parseFloat(results[1]);
          mlr = parseFloat(results[2]);
        }
      }
      
      
      if (typeof(data.pkt_loss) === 'undefined') {
        ret.push({
          "clients": parseInt(metadata.num_clients),
          "client_type": metadata.client_type,
          "latency": ABORT_TEXT,
          "packet_loss": ABORT_TEXT,
          "jitter": ABORT_TEXT,
          "forwarding_rate_kbps": ABORT_TEXT,
          "mos": ABORT_TEXT,
          "mdi": ABORT_TEXT
        });
      } else {
        ret.push({
          "clients": parseInt(metadata.num_clients),
          "client_type": metadata.client_type,
          "latency": round2(latency),
          "packet_loss": round2(packet_loss),
          "jitter": round2(jitter),
          "forwarding_rate_kbps": round2(kbps),
          "mos": round2(mos),
          "mdi": {
            "media_loss_rate": round2(mlr),
            "delay_factor": round2(df)
          }
        });
      }
    
    }
    
    return ret;
    
  },
  
  "packet_loss": function(test, testResults) {
    
    let ret = createFromTestConfiguration(test.configuration);
    
    let results = testResults;
    
    let data = results[0].data;
    let metadata = results[0].metadata;
    
    let packet_loss = parseFloat(data.frame_loss);
    let oload = data.oload;
    let iload = data.iload;
    
    ret['frame_size'] = parseInt(metadata.frame_size);
    ret['packet_loss'] = round2(packet_loss);

    ret['clients'] = (typeof(test.configuration.clients) === 'undefined' ?
                      null : parseInt(test.configuration.clients));
    ret['data_rate_mbps'] = [];
    ret['traffic_flow'] = null;
    ret['traffic_type'] = null;
    
    if (typeof(packet_loss) === 'undefined') {
      ret['forwarding_rate_mbps'] = ABORT_TEXT;
      ret['iload_mbps'] = ABORT_TEXT;
      ret['oload_mbps'] = ABORT_TEXT;
    } else {
      if (data.fwd_rate_bits) {
        
        let forwarding_rate = data.fwd_rate_bits / BITS_TO_MBPS;
        
        // Inbound load. This is relative to the IXIA traffic generator
        // This is calculated with percentage difference on OLOAD and ILOAD
        let iload_percentage_diff = (iload - oload) / iload;
        
        // Outbound load. This is relative to the IXIA traffic generator
        // This is calculated with the forwarding rate. OLOAD key is packets/sec
        oload = forwarding_rate * ((100 + packet_loss) / 100);
        
        iload = oload * (1.0 + iload_percentage_diff);
        
        ret['forwarding_rate_mbps'] = round2(forwarding_rate);
        ret['iload_mbps'] = round2(iload);
        ret['oload_mbps'] = round2(oload);
      
      } else {
        // There's no forwarding rate on results. We cannot create a calculation
        ret['forwarding_rate_mbps'] = null;
        ret['iload_mbps'] = null;
        ret['oload_mbps'] = null;
      }
    }
    
    return ret;
    
  },
  
  "packet_capture": function(test, testResults) {
    
    let ret = {};
    
    let results = testResults;
    
    for(let i = 0; i < results.length; i++) {
      
      let result = results[i];
      let channel = result.metadata.channel;
      
      if (Object.keys(result.data).length) {
        ret[channel] = result.data;
      } else {
        ret[channel] = {
          "ixveriwave": {
            "dbm_anta": ABORT_TEXT,
            "dbm_antb": ABORT_TEXT,
            "dbm_antc": ABORT_TEXT,
            "dbm_antd": ABORT_TEXT
          }
        };
      }
      
    }
    
    return ret;
    
  },
  
  "reuse_of_airtime": function(test, testResults) {
    
    // This one is a fun one...
    
    if (test.status == 'error') {
      return null;
    }
    
    let ret = {};
    
    let totalResults = {};
    let averageResults = {};
    let individualResults = {};
    
    let results = testResults;
    
    let numberOfClients = results.length;
    
    let TIME_AVERAGE_KEYS = ['avg_1_30', 'avg_31_60'];
      
    let ROA_KEY_MAP = {
      "lat": "latency",
      "jitter": "jitter",
      "packet_loss": "packet_loss",
      "fwd_rate_kbps": "forwarding_rate_mbps"
    }
  
    for(let i = 0; i < results.length; i++) {
      
      let result = results[i];
      let times = result.data.time;
      let clientName = result.metadata.client_name;
      
      if (typeof(times) === 'undefined') {
        continue;
      }
      
      let templateObj = {
        "avg_1_30": 0.0, 
        "avg_31_60": 0.0, 
        "data": null
      };
        
      let clientObj = {
        "jitter": {...templateObj},
        "latency": {...templateObj},
        "forwarding_rate_mbps": {...templateObj},
        "packet_loss": {...templateObj}
      };
      
      for(let j = 1; j <= 60; j++) {
        let key = j + '.0';
        let time = null;
        
        if (typeof(times[key]) === 'undefined') {
          // For some reason, it skips times... See test_results.id = 441083
          // It should start at time 50.0
          time = {
            "lat": 0.0, 
            "jitter": 0.0, 
            "packet_loss": 0.0, 
            "fwd_rate_kbps": 0.0
          };
        } else {
          time = times[key];
        }
        
        
        Object.entries(ROA_KEY_MAP).forEach(([src, dest]) => {
          
          let value = round2(time[src]);
          
          if (dest == 'forwarding_rate_mbps') {
            value /= KBPS_TO_MBPS;
          }
          
          let avgKey = TIME_AVERAGE_KEYS[Math.floor((j-1) / 30)];
          
          if (!totalResults[dest]) {
            totalResults[dest] = (new Array(60)).fill(0);
            averageResults[dest] = (new Array(60)).fill(0);
          }
          
          totalResults[dest][j - 1] = round2(
            totalResults[dest][j - 1] + value
          );
          
          averageResults[dest][j - 1] = round2(
            averageResults[dest][j - 1] + (value / numberOfClients)
          );
          
          clientObj[dest][avgKey] = round2(
            clientObj[dest][avgKey] + (value / 30)
          );

          if (clientObj[dest].data == null) {
            clientObj[dest].data = [];
          }
          clientObj[dest].data.push(round2(value));
          
        });
        
      }
      
      individualResults[clientName] = clientObj;
      
    }
    
    ret['individual'] = individualResults;
    ret['average'] = averageResults;
    ret['total'] = totalResults;
    
    return ret;
    
  }
  
};

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
 * Fetches Test Result objects for a list of Test Run IDs
 *
 * @param {Object} testRunIds - Array of TestRun IDs
 * 
 * @return {Object} Returns an object containing TestID and test results
 */
async function getTestResultsForTestRuns(testRunIds) {
  
  let result = await client.query(
    
    'SELECT ' + 
    
    'tests.test_run_id, tests.id as test_id, ' + 
    'tests.configuration, tests.short_name, tests.status, ' +
    'tests.errors, tests.aborted, test_results.metadata, test_results.data ' + 
    
    'FROM tests ' +
    
    'LEFT JOIN test_results ON test_results.test_id=tests.id ' + 
    
    'WHERE tests.test_run_id IN (' + testRunIds.toString() + ') ' +
    
    'ORDER BY tests.test_run_id, tests.id, test_results.id ASC'
    
  );
  
  return result.rows;
  
}

/**
 * Convert SQL test results into MongoDB test results
 *
 * @param {Object} test - Test joined with TestResult SQL object
 * @param {String} testType - Test type
 * 
 * @return {Object} Returns the newly parsed test result
 */
function parseTest(test, testType) {
  
  if (!test[0].data) {
    return null;
  }
  
  let testTypeConverter = TRANSLATE_TABLE[testType];
  
  if (!testTypeConverter) {
    console.log(testType);
    console.log(test);
    process.exit();
    return null;
  }
  
  let result = testTypeConverter(test[0], test);
  return result;
}

/**
 * Fetches the next series of TestResults
 *
 * @param {Object} testRun - TestRun object
 * @param {String} testResults - An Array of TestResults
 * 
 * @return {Array} Returns null on error. Otherwise, Array of test results
 */
function getNextTestBlock(testRun, testResults) {
  
  if (!testResults.length) {
    return null;
  }
  
  let ret = [];
  let testRunId = testRun.id;
  let currentTestId = testResults[0].test_id;
  
  while(
    testResults.length && 
    testResults[0].test_id == currentTestId && 
    testResults[0].test_run_id == testRunId
  ) {
    ret.push(testResults.shift());    
  }
  
  return (ret.length) ? ret : null;
}

//
// Update starts here!!!
//
// To rerun this migration, execute the following on the mongo shell:
// > use smart
// > db.updates.remove({"filename": "0007-test-result-migration.js"})
//    
module.exports = async function(done, fail, updateStatus) {
  
  // Create the Postgres client
  client = new Client(databaseSettings);
  
  let testRun = {id: 0};
  let test = [];
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
    updateStatus('Connecting to Postgres...'.bold.cyan);
    await client.connect();
    
    // Delete existing test results(incase we rerun this migration)
    updateStatus('Deleting previous test results...'.bold.cyan);
    let testTypes = Object.keys(TRANSLATE_TABLE);
    for(let i = 0; i < testTypes.length; i++) {
      let testType = testTypes[i];
      let TestResultModel = TestResult(testType);
      try {
        await TestResultModel.remove({legacy: true});
      } catch(e) {
        // Will throw an exception if collection does not exist
      }
    }
    
    // Process test_results
    updateStatus('Fetching TestRuns...'.bold.cyan);
    
    let testRuns = await TestRun.find({legacy: true}).sort({"id": 1});
    
    let testingErrors = 0;
    let testRunsUpdated = 0;
    let testRunsTotal = testRuns.length;
    let testResultsTotal = 0;
    
    updateStatus('Fetching TestResults...'.bold.cyan);
    
    while(testRuns.length) {
      
      // For bulk operations
      let testTypeResultInsert = {};
      
      // These are the TestRuns to update
      let testRunsToUpdate = testRuns.splice(0, TEST_RUN_BLOCK_SIZE);
      
      // These are ALL the TestResults for the TestRuns
      let testResults = await getTestResultsForTestRuns(testRunsToUpdate.map(x => x.id));
      
      while(testRunsToUpdate.length) {
        
        // Pop the next TestRun to update...
        testRun = testRunsToUpdate.shift();

        if (!testRun.legacy) {
          continue;
        }
        
        // This is where we'll store the results to update
        // let testType = testRun.type;
        let testType = testRun.get('type');
        
        // Update status...
        updateStatus(
          `TestRun ${++testRunsUpdated}/${testRunsTotal} `.bold.cyan +
          `| ${testingErrors} errors`.bold.cyan
        );
        
        // Fetch the testResults for this current testRun
        while( ( test = getNextTestBlock(testRun, testResults)) ) {
        
          // Parse test result
          let testResultErrors = null;
          let testResultParsed = parseTest(test, testType);
          
          // Increment for stats
          testResultsTotal += test.length;
            
          // All test objects have the same configuration
          if (test[0].errors.length) {
            
            // There were errors. This doesn't necessarily mean that there 
            // are no test results
            
            testResultErrors = test[0].errors;
          } else if (test[0].status == 'in_progress') {
            
            // This test is still marked as running. It crashed
            testResultErrors = ['ABORT: Test crashed'];
            
          } else if (test[0].aborted || test[0].data == null) {
            
            // The test aborted, but without an error
            testResultErrors = ['ABORT: No error captured'];
            
          }
          
          if (testResultErrors) {
            testingErrors++;
          }
          
          // Push results
          if (!testTypeResultInsert[testType]) {
            testTypeResultInsert[testType] = [];
          }
          
          testTypeResultInsert[testType].push({
            "test_run": testRun._id,
            "test_name": test[0].short_name,
            "errors": testResultErrors,
            "data": testResultParsed,
            "legacy": true,
            "legacy_data": test
          });
          
        }
        
      }
      
      // Insert the entries in bulk
      for(let key in testTypeResultInsert) {
        let entries = testTypeResultInsert[key];
        let TestResultModel = TestResult(key);
        
        //
        // collection.insert vs insertMany
        //
        // collection.insert will directly use the MongoDB driver. However,
        // the trade-off is validation will not occur, which will speed up our
        // queries
        //
        await TestResultModel.collection.insert(entries);
        
        // Explicitly clear out the variables
        entries.length = 0;
      }
      
    }
    
    messages.push('TestRun Entries: ' + testRunsTotal);
    messages.push('TestResult Entries: ' + testResultsTotal);
    messages.push('TestResult Errors: ' + (testingErrors.toString()).bold.red);
    
  } catch(e) {
    
    // There was an error
    fail(
      '\nTestRun.ID = ' + testRun.id + '\n' + 
      'Test.ID = ' + (test.length ? test[0].test_id : -1 )+ '\n' + 
      e.toString() + '\n\n' + 
      
      e.stack
    );
    return;
    
  } finally {
    
    // At the end of the block, end the Postgres connection
    client.end();
    
  }
  
  // How long it took to run update
  let totalTime = toSeconds((new Date()).getTime() - startTime);
  
  // If we make it here, we can assume success!
  messages.push('Total Time: ' + (totalTime + 's').bold.green);
  done(messages);
  
};
