/**
 * URL namespace: /test-chamber/
 * 
 * This includes user functions such as:
 *  - GET /test-chamber
 *  - GET /test-chamber/<id>
 *  - POST /test-chamber/
 *  - PUT /test-chamber/
 *  - DELETE /test-chamber/<id>
 */
 
// Imports
const TestChamber = require('../../models/TestChamber.js');
const User = require('../../models/User.js');
const Dut = require('../../models/Dut.js');
const Model = require('../../inc/model.js');
const ModelUpdates = require('../../events/model-updates.js');
 
// Create the app. This app will be chained in the main ExpressJS app
const app = require('express')();
const io = app.io;

ModelUpdates.on('TestChamber', (chamberUpdate) => {
  io.emit('model-update-TestChamber', chamberUpdate);
})

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app

/**
 * /test-chamber/
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
 * POST /test-chamber
 * ----------
 * This allows you to create a TestChamber object. 
 *
 * Access the API by:
 *  - POST http://localhost/test-chamber
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.REST_create('/', TestChamber, true)

/**
 * GET /test-chamber[/<id>]
 * ----------------
 * This allows you to retrieve objects from the database either by query
 *  - GET http://localhost/test-chamber?name=test-chamber1234       // ARRAY
 *
 * or by id:
 *  - GET http://localhost/test-chamber/MongoDBObjectIdHere // SINGLE
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return either a single or an array of objects depending on which 
 * URL was used
 */
.REST_read('/', TestChamber, {
  allow_bulk: true,
  populations: [
    {
      path: 'dut',
      populate: {
        path: 'firmware',
        model: 'DutFirmware'
      }
    }
  ]
})

/**
 * PUT /test-chamber/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/test-chamber/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
// .permissions('login')
.REST_update('/', TestChamber, {
  upsert: false,
  notify: ModelUpdates,
  populations: [
    {
      path: 'dut',
      populate: {
        path: 'firmware',
        model: 'DutFirmware'
      }
    }
  ],
  allow_bulk: true
})

/** 
 * DELETE /test-chamber/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/test-chamber/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.permissions('login')
.REST_delete('/', TestChamber, false)

/**
 * This allows a chamber to be reserved
 *
 * Access the API by:
 *  - http://localhost/test-chamber/reserve
 *
 * This requires a login
 *
 * The body is a JSON object with the userid and chamber
 *
 * It will return the reserved object or an error message
 */
.permissions('login')
.post('/reserve', async (req, res, next) => {
  if (!req.body.chamber) {
    res.error('No chamber specified');
    return;
  }
  if (!req.body.userid) {
    res.error('No userid specified');
    return;
  }

  try {
    let result = await TestChamber.reserve(req.body.chamber, req.body.userid, req.body.start, req.body.end);
    res.success(result);
  } catch(e) {
    if (e instanceof TestChamber.InvalidChamber) {
      return res.error(`Chamber ${req.body.chamber} does not exist`);
    } else if (e instanceof User.InvalidUsername) {
      return res.error(`User ${req.body.userid} does not exist`);
    } else if (e instanceof TestChamber.ChamberReserved) {
      return res.error(`Chamber ${req.body.chamber} is already reserved`);
    } else {
      next(e);
    }
  }
})

/**
 * This allows a chamber to be released
 *
 * Access the API by:
 *  - http://localhost/test-chamber/release
 *
 * This requires a login
 *
 * The body is a JSON object with the chamber
 *
 * It will return the released object or an error message
 */
.permissions('login')
.post('/release', async (req, res, next) => {
  if (!req.body.chamber) {
    res.error('No chamber specified');
    return;
  }

  try {
    let result = await TestChamber.release(req.body.chamber);
    res.success(result);
  } catch(e) {
    if (e instanceof TestChamber.InvalidChamber) {
      return res.error(`Chamber ${req.body.chamber} does not exist`);
    } else if (e instanceof TestChamber.ChamberOpen) {
      return res.error(`Chamber ${req.body.chamber} is not reserved`);
    } else {
      next(e);
    }
  }
});

// Export the app
module.exports = app;
