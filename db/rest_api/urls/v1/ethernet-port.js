/**
 * URL namespace: /ethernet-port/
 * 
 * This includes user functions such as:
 *  - GET /ethernet-port
 *  - GET /ethernet-port/<id>
 *  - POST /ethernet-port/
 *  - PUT /ethernet-port/
 *  - DELETE /ethernet-port/<id>
 */
 
// Imports
var EthernetPort = require('../../models/EthernetPort.js');
var TestChamber = require('../../models/TestChamber.js');
 
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app

/**
 * /ethernet-port/
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
 * POST /ethernet-port
 * ----------
 * This allows you to create a EthernetPort object. 
 *
 * Access the API by:
 *  - POST http://localhost/ethernet-port
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.REST_create('/', EthernetPort, true /* Allow bulk insert */)

/**
 * GET /ethernet-port[/<id>]
 * ----------------
 * This allows you to retrieve objects from the database either by query
 *  - GET http://localhost/ethernet-port?name=ethernet-port1234       // ARRAY
 *
 * or by id:
 *  - GET http://localhost/ethernet-port/MongoDBObjectIdHere // SINGLE
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return either a single or an array of objects depending on which 
 * URL was used
 */
.REST_read('/', EthernetPort, {allow_bulk: true} /* Allow bulk find */)

/**
 * PUT /ethernet-port/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/ethernet-port/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
.permissions('login')
.REST_update('/', EthernetPort, {upsert: true} /* Allow upsert, insert entry if non-existent */)

/** 
 * DELETE /ethernet-port/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/ethernet-port/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.permissions('login')
.REST_delete('/', EthernetPort, false)

/**
 * This allows ethernet ports to be reserved
 *
 * Access the API by:
 *  - http://localhost/ethernet-port/reserve
 *
 * This does not require a login
 *
 * The body is a JSON object with the chamber id and number of ports
 *
 * It will return the reserved objects or an error message
 */
.post('/reserve', async (req, res, next) => {
  if (!req.body.chamber) {
    res.error('No chamber specified');
    return;
  }
  if (!req.body.qty) {
    res.error('No quantity specified');
    return;
  }

  try {
    let result = await EthernetPort.reserve(req.body.chamber, req.body.qty);
    res.success(result);
  } catch(e) {
    if (e instanceof TestChamber.InvalidChamber) {
      return res.error(`Chamber ${req.body.chamber} does not exist`);
    } else if (e instanceof EthernetPort.InsufficientPorts) {
      return res.error(`Not enough ports available`);
    } else {
      next(e);
    }
  }
})

/**
 * This allows ethernet ports to be released
 *
 * Access the API by:
 *  - http://localhost/ethernet-port/release
 *
 * This requires a login
 *
 * The body is a JSON object with the chamber currently holding the ports
 *
 * It will return the released objects or an error message
 */
.permissions('login')
.post('/release', async (req, res, next) => {
  if (!req.body.chamber) {
    res.error('No chamber specified');
    return;
  }

  try {
    let result = await EthernetPort.release(req.body.chamber);
    res.success(result);
  } catch(e) {
    if (e instanceof TestChamber.InvalidChamber) {
      return res.error(`Chamber ${req.body.chamber} does not exist`);
    } else if (e instanceof EthernetPort.NoPortsReserved) {
      return res.error(`Chamber ${req.body.chamber} has no ports reserved`);
    } else {
      next(e);
    }
  }
});

// Export the app
module.exports = app;
