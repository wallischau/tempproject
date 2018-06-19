/**
 * URL namespace: /test-suite/
 * 
 * This includes user functions such as:
 *  - GET /test-suite
 *  - GET /test-suite/<id>
 *  - POST /test-suite/
 *  - PUT /test-suite/
 *  - DELETE /test-suite/<id>
 */
 
// Imports
let TestSuite = require('../../models/TestSuite.js');
let Dut = require('../../models/Dut.js');
let DutFirmware = require('../../models/DutFirmware.js');
 
// Create the app. This app will be chained in the main ExpressJS app
let app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app

/**
 * /test-suite/
 * ------
 * REST API. This gives you the ability to [C]reate, [R]ead, [U]pdate and 
 * [D]elete (CRUD... Did I do that on purpose?) objects from the database
 *
 * If you have trouble remembering the methods, just think CRUD. REST_create,
 * REST_read, REST_update, REST_delete
 * 
 * You can also remember that these requests are POST, PUT, GET, DELETE. The
 * synonyms are REST_post, REST_put, REST_get, REST_delete
 * 
 */
 
/**
 * POST /test-suite
 * ----------
 * This allows you to create a TestSuite object. 
 *
 * Access the API by:
 *  - POST http://localhost/test-suite
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.REST_create('/', TestSuite, true /* Allow bulk insert */)

/**
 * GET /test-suite/enabled-tests
 * ----------------
 * This will retreive all the test suites with their enabled flags set
 * based on the optional query parameter of dut. If no dut is specified
 * all enabled flags will be set to false.
 *
 * Valid queries
 *  - GET http://localhost/v1/test-suite
 *  - GET http://localhost/v1/test-suite?dut=MongoDBObjectIdHere
 * This allows you to retrieve objects from the database either by query
 *
 * This does not require a login
 *
 * No body is required
 */
.get('/', async (req, res, next) => {
  try {
    let filteredQuery = {};
    let queryKeys = Object.keys(req.query);
    for (let i in queryKeys) {
      let key = queryKeys[i];
      if ('dut' != key) {
        filteredQuery[key] = req.query[key];
      }
    }

    let suites = await TestSuite.find(filteredQuery);
    if (!req.query.dut) {
      return res.success(suites);
    }

    let dut = await Dut.findOne({_id: req.query.dut});

    if (!dut || !dut.firmware) {
      return res.success(suites);
    }

    let firmware = await DutFirmware.findOne({_id: dut.firmware});

    if (!firmware.capabilities) {
      return res.success(suites);
    }

    let fwCapabilities = firmware.capabilities;

    for (let i = 0; i < suites.length; i++) {
      let wave = suites[i];
      let testSuites = wave.test_suites;
      let testTypes = Object.keys(testSuites);

      for (let j = 0; j < testTypes.length; j++) {
        let testType = testTypes[j];
        let testSuite = testSuites[testType];

        let testCases = Object.keys(testSuite.test_cases);

        for (let k = 0; k < testCases.length; k++) {
          let test_case_name = testCases[k];
          let test_case = testSuite.test_cases[test_case_name];

          suites[i].
            test_suites[testType].
            test_cases[test_case_name].
            enabled.currently = test_case.enabled[dut.type];

          if (test_case.flow_settings) {
            let shouldEnable = true;
            for (setting in test_case.flow_settings) {
              if (!shouldEnable) {
                break;
              }

              let settingValue = test_case.
                                   flow_settings[setting].
                                   value;
              let settingComparator = test_case.
                                        flow_settings[setting].
                                        comparator;

              if (setting in fwCapabilities) {
                switch (settingComparator) {
                  case '==':
                    if (settingValue != fwCapabilities[setting]) {
                      shouldEnable = false;
                    }
                    break;
                  case '>=':
                    if (fwCapabilities[setting] < settingValue) {
                      shouldEnable = false;
                    }
                    break;
                  default:
                    break;
                }
              } else {
                shouldEnable = false;
              }
            }


            suites[i].
              test_suites[testType].
              test_cases[test_case_name].
              enabled.currently = shouldEnable;
          }
        }
      }
    }
    res.success(suites);
  } catch(e) {
    res.error(e.toString());
  }
})

/**
 * PUT /test-suite/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/test-suite/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
.permissions('login')
.REST_update('/', TestSuite, {upsert: true} /* Allow upsert, insert entry if non-existent */)

/** 
 * DELETE /test-suite/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/test-suite/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.permissions('login')
.REST_delete('/', TestSuite, false);

// Export the app
module.exports = app;
