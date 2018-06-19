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
const TestSuite = require('../models/TestSuite.js');

async function caseIsInWave(caseName, wave) {
  let caseFound = false;
  let testSuites = wave.test_suites;
  let testTypes = Object.keys(testSuites);
  for (let i = 0; i < testTypes.length; i++) {
    let testType = testTypes[i];

    let testCases = Object.keys(testSuites[testType].test_cases);

    for (let j = 0; j < testCases.length; j++) {
      let testCase = testCases[j];

      if (testCase == caseName) {
        caseFound = true;
        break;
      }
    }
    if (caseFound) {
      break;
    }
  }
  return caseFound;
}

/**
 * Adds any missing test cases that should be enabled
 *
 */
async function addMissingCases(suite_name, testInfo) {
  let wave = await TestSuite.findOne({name: suite_name});

  let testSuites = wave.test_suites;
  let testTypes = Object.keys(testSuites);

  for (testCase in testInfo) {
    let caseFound = await caseIsInWave(testCase, wave);
    if (!caseFound) {
      let casePrefix = testCase.split('_', 1)[0];
      let testType = null;

      switch (casePrefix) {
        case 'MC':
          testType = 'Mixed Client';
          break;
        case 'UDP':
          testType = 'UDP Throughput';
          break;
        case 'TCP':
          testType = 'TCP Goodput';
          break;
        case 'QoE':
          testType = 'Realworld QoE'
          break;
        default:
          console.log('Unsupported prefix: ' + casePrefix);
          console.log('testCase: ' + testCase);
          break;
      }

      if (testType) {
        wave.test_suites[testType].test_cases[testCase] = {
          enabled: false
        }
      } else {
        console.log('testType not set for testCase: ' + testCase);
      }
    }
  }

  let result = await TestSuite.findByIdAndUpdate(wave._id, wave);
}

/**
 * Updates test suite enabled flags
 */
async function updateTestEnabled(suite_name, testInfo) {
  let wave = await TestSuite.findOne({name: suite_name});

  let testSuites = wave.test_suites;
  let testTypes = Object.keys(testSuites);

  for (let i = 0; i < testTypes.length; i++) {
    let testType = testTypes[i];
    
    let testCases = Object.keys(testSuites[testType].test_cases);

    for (let j = 0; j < testCases.length; j++) {
      let testCase = testCases[j];

      if (testCase in testInfo) {
        wave.test_suites[testType].test_cases[testCase] = testInfo[testCase];
      } else {
        wave.test_suites[testType].test_cases[testCase] = {
          'enabled': {
            'retail': false,
            'spectrum': false,
            'res_com': false,
            'currently': false
          },
          'flow_name': 'N/A',
        }
      }
    }
  }

  let result = await TestSuite.findByIdAndUpdate(wave._id, wave);
}

/**
 * Updates test suite naming to test_suites from test_cases
 */
async function updateTestSuiteNamingConvention() {
  await TestSuite.updateMany({}, {
    $rename: {
      'test_cases': 'test_suites'
    }
  });
}

//
// Update starts here!!!
//
// This update script do the following:
//   1) TBD
//
module.exports = async function(done, fail, updateStatus) {

  try {
    // .json files in NodeJS will automatically be parsed into JSON
    const testInfoWave1 = require('./data/0012-test_info_wave_1.json')
    const testInfoWave2 = require('./data/0012-test_info_wave_2.json')

    updateStatus('Updating test suite naming'.bold.cyan);
    await updateTestSuiteNamingConvention();

    updateStatus('Adding missing cases for wave 1'.bold.cyan);
    await addMissingCases('802.11ac Wave 1',
                          testInfoWave1);

    updateStatus('Adding missing cases for wave 2'.bold.cyan);
    await addMissingCases('802.11ac Wave 2',
                          testInfoWave2);

    updateStatus('Updating test enabling for wave 1'.bold.cyan);
    await updateTestEnabled('802.11ac Wave 1',
                            testInfoWave1);

    updateStatus('Updating test enabling for wave 2'.bold.cyan);
    await updateTestEnabled('802.11ac Wave 2',
                            testInfoWave2);
  } catch(e) {
    // There was an error
    fail(e.toString());
    return;
    
  }

  done();
};
