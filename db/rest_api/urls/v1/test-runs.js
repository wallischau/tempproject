// let ObjectId = require('mongoose').Types.ObjectId; 
/// POST with firmware_id and test_type string
/// Return all test_run that match 

const TestRun = require('../../models/TestRun.js');
const TestQueue = require('../../models/TestQueue.js');
const Model = require('../../inc/model.js');

const app = require('express')();

app.get('/', async (req, res, next) => {
  try {
    let testRuns = null;
    if (Object.keys(req.query).length === 0) {
      testRuns = await TestRun.find({});
    } else {
      testRuns = await TestRun.find(req.query).
        populate('user').
        populate('dut').
        populate('firmware').
        populate('test_results.latency').
        populate('test_results.max_client').
        populate('test_results.mixed_client').
        populate('test_results.multicast_video').
        populate('test_results.near_far').
        populate('test_results.packet_capture').
        populate('test_results.packet_loss').
        populate('test_results.rate_vs_range').
        populate('test_results.realworld_qoe').
        populate('test_results.reuse_of_airtime').
        populate('test_results.tcp_goodput').
        populate('test_results.triple_play').
        populate('test_results.udp_throughput').
        populate('test_results.unicast_video').
        populate('test_results.wmm_power_save');
    }

    /// filter out empty result keys
    for (let index = 0; index < testRuns.length; index++) {
      const run = testRuns[index]
      if (run._doc.test_results === null) {
        run._doc.test_results = []
        continue
      }
      for (const result in run._doc.test_results) {
        if (run.test_results.hasOwnProperty(result)) {
          const res_array = run.test_results[result]
          if (res_array.length === 0) {
            delete run._doc.test_results[result]
          }
        }
      }
    }

    res.success(testRuns);
  } catch (err) {
    res.error(err);
  }
});

app.get('/:_id', async (req, res, next) => {
  try {
    let testRun = null;
    testRun = await TestRun.findOne(req.params).
      populate('user').
      populate('dut').
      populate('firmware').
      populate('test_results.latency').
      populate('test_results.max_client').
      populate('test_results.mixed_client').
      populate('test_results.multicast_video').
      populate('test_results.near_far').
      populate('test_results.packet_capture').
      populate('test_results.packet_loss').
      populate('test_results.rate_vs_range').
      populate('test_results.realworld_qoe').
      populate('test_results.reuse_of_airtime').
      populate('test_results.tcp_goodput').
      populate('test_results.triple_play').
      populate('test_results.udp_throughput').
      populate('test_results.unicast_video').
      populate('test_results.wmm_power_save');

    /// filter out empty result keys
    if (testRun._doc.test_results === null) {
      testRun._doc.test_results = []
    } else {
      for (const result in testRun._doc.test_results) {
        if (testRun.test_results.hasOwnProperty(result)) {
          const res_array = testRun.test_results[result]
          if (res_array.length === 0) {
            delete testRun._doc.test_results[result]
          }
        }
      }
    }

    res.success(testRun);
  } catch (err) {
    res.error(err.toString());
  }
});

app
.permissions('login')
.post('/', async(req, res, next) => {
  if (!req.body.chamber) {
    return res.error('Necessary information "chamber" not included in body');
  }
  if (!req.body.tests || req.body.tests.length === 0) {
    return res.error(
      'Necessary information "tests" not included in body'
    );
  }

  let maxRunId = 0;
  let runCreated = false;
  let testRun = null;

  try {
    maxRunId = await TestRun.findOne({}).sort('-id');
    maxRunId = maxRunId.id + 1;

    testRun = {
      'test_results': null,
      'directory': null,
      'notes': null,
      'reboot': null,
      'test_start': null,
      'test_end': null,
      'total_planned': req.body.tests.length,
      'dut': req.body.chamber.dut._id,
      'firmware': req.body.chamber.dut.firmware._id,
      'topology': {
        'chamber': req.body.chamber
      },
      'manual_import': false,
      'short_name': null,
      'user': req.user._id,
      'id': maxRunId,
      'legacy': false
    }

    testRun = await TestRun.create(testRun);
    runCreated = true;

    for (let i in req.body.tests) {
      req.body.tests[i].test_run = testRun._id;
    }

    await TestQueue.create(req.body.tests);
    
    res.success('Test run created and tests added to queue successfully ');
    //?
    // res.success({ message: 'Test run created and tests added to queue successfully', test_run_id: testRun._id });
    
  } catch (err) {
    let errors = [];
    errors.push(err.toString());
    try {
      if (runCreated) {
        await TestRun.remove({_id: testRun._id});
      }
    } catch (err) {
      errors.push(err.toString());
    } finally {
      res.error(JSON.stringify(errors));
    }
  }
});

/**
 * PUT /test-runs/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/test-runs/MongoDBObjectIdHere
 *
 * This does not require a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
app
.REST_update('/', TestRun, {upsert: false} /* Allow upsert, insert entry if non-existent */)


module.exports = app;
