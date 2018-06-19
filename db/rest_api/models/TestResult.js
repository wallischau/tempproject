// Import Model
const mongoose = require('mongoose');

// This creates the proper model and collection for the necessary test type
var testTypeModels = {};
function TestResult(testType) {
  
  testType = testType + '_result';
  
  let model = testTypeModels[testType];
  
  if (model) {
    // It exists. Just return it
    return model;
  }
  
  // If we're at this point, it does not exist. Create schema and model
  let schema = mongoose.Schema({
    'test_name': String,
    'test_run': {
      'type': mongoose.Schema.Types.ObjectId,
      'ref': 'TestRun',
      'index': true
    },
    'prd': {type: mongoose.Schema.Types.ObjectId, ref: 'TestSuite'},
    'directory': String,
    'test_start': Date,
    'test_end': Date,
    'results_parsed': Boolean,
    'runner': String
  }, {strict: false});
  
  model = mongoose.model(testType, schema, testType + 's');
  
  testTypeModels[testType] = model;
  
  return model;
}

//
// Export the user schema
//
// Examples: 
// TestResult('udp_throughput').find() /* Finds all UDP test results */
// TestResult('tcp_goodput').find() /* Finds all TCP test results */
// TestResult('rate_vs_range').find() /* Finds all RVR test results */
//
// ... And so forth
//
// The test type names *should* correlate with the 'type' field in TestRun
//
module.exports = TestResult;
