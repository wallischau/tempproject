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

/**
 * Links the test results to the test runs in the test runs collection
 * and adds some additional fields to the test results collection
 * such as directory and prd
 */
async function linkResultsInRuns(updateStatus) {
  let testRuns = await TestRun.find({legacy: true});
  let failures = [];

  for (let i in testRuns) {
    let percentage = parseInt((((parseInt(i) + 1)/testRuns.length)) * 100);
    updateStatus(
      `Linking test results to runs `.bold.cyan +
      `${percentage}%`.bold.cyan
    );

    let testRun = testRuns[i];
    let testType = testRun.get('type');
    let prd = testRun.get('prd');

    let testResults = await TestResult(testType).find({
      test_run: testRun._id
    });

    testResults = testResults.map(r => r._id);

    testRun.test_results[testType] = testResults;

    let result = await TestRun.update(
      {
        _id: testRun._id
      },
      {
        $set: {test_results: testRun.test_results}
      }
    );
    if (!(result.n && result.ok)) {
      failures.push('Error linking result to test run ' + testRun._id);
    }

    if (testResults.length !== 0) {
      result = await TestResult(testType).updateMany(
        {
          test_run: testRun._id},
        {
          $set: {
            directory: testRun.directory,
            test_start: null,
            test_end: null,
            prd: prd
          },
        }
      );

      if (!(result.n && result.ok)) {
        failures.push(
          'Error setting directory for test result in test run ' + testRun._id
        );
      }
    }
  }
  return failures;
}

async function removeOldTestRunFields(updateStatus) {
  let testRuns = await TestRun.find({legacy: true});

  let result = await TestRun.updateMany(
    {},
    {
      $unset: {
        type: '',
        prd: '',
        'is_baseline': ''
      }
    }
  );

  if (!(result.n && result.ok)) {
    return false;
  }

  return true;
}

//
// Update starts here!!!
//
// This update script do the following:
//   1) Links the *_results to the test_runs
//   2) Removes old/unnecessary fields from test runs
//
module.exports = async function(done, fail, updateStatus) {
  try {
    updateStatus('Linking test results to runs'.bold.cyan);
    let failures = await linkResultsInRuns(updateStatus);

    if (failures.length !== 0) {
      return fail(failures);
    }

    let success = await removeOldTestRunFields(updateStatus);
    if (!success) {
      return fail('Error removing fields from test runs');
    }
    
  } catch(e) {
    // There was an error
    return fail(e.toString());
  }

  done();
};
