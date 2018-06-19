/**
 * URL namespace: /test-results/
 * 
 * This includes user functions such as:
 *  - POST /test-results/
 */
 
// Imports
const TestResult = require('../../models/TestResult.js');
 
// Create the app. This app will be chained in the main ExpressJS app
const app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app

/**
 * POST /test-queue
 * ----------
 * This allows you to create a TestResult object. 
 *
 * Access the API by:
 *  - POST http://localhost/test-results
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.post('/', async (req, res, next) => {
  try {
    if (!req.body.testType) {
      return res.error('testType needed for creating test results');
    }
    if (!req.body.resultDoc) {
      return res.error('resultDoc needed for creating test results');
    }

    let ResultCollection = TestResult(req.body.testType);

    let result = await ResultCollection.create(req.body.resultDoc);

    if (result) {
      res.success(result);
    } else {
      res.error('Error creating results document for ' + req.body.testType)
    }
  } catch (err) {
    res.error(err.toString());
  }
});

app
.permissions('login')
.put('/:_id', async (req, res, next) => {
  try {
    if (!req.body.testType) {
      return res.error('testType needed for creating test result');
    }
    if (!req.body.update) {
      return res.error('update needed for updating test result');
    }

    let ResultCollection = TestResult(req.body.testType);

    let result = await ResultCollection.findOneAndUpdate(
      req.params,
      req.body.update,
      {new: true, upsert: false}
    );

    if (result) {
      res.success(result);
    } else {
      res.error("Upsert is disallowed");
    }
  } catch (err) {
    res.error(err.toString());
  }
});

app
.get('/', async (req, res, next) => {
  try {
    if (!req.query.testType) {
      return res.error('testType needed for reading test result');
    }
    let testType = req.query.testType;
    delete req.query.testType;

    let ResultCollection = TestResult(testType);

    let result = await ResultCollection.find(req.query);
    
    res.success(result);
  } catch (err) {
    res.error(err.toString());
  }
})

// Export the app
module.exports = app;
