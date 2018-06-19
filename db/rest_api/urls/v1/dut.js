/**
 * URL namespace: /dut/
 * 
 * This includes user functions such as:
 *  - GET /dut
 *  - GET /dut/<id>
 *  - POST /dut/
 *  - PUT /dut/
 *  - DELETE /dut/<id>
 */
 
// Imports
var Dut = require('../../models/Dut.js');
 
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app

/**
 * /dut/
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
 * POST /dut
 * ----------
 * This allows you to create a Dut object. 
 *
 * Access the API by:
 *  - POST http://localhost/dut
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.REST_create('/', Dut, true /* Allow bulk insert */)

/**
 * GET /dut[/<id>]
 * ----------------
 * This allows you to retrieve objects from the database either by query
 *  - GET http://localhost/dut?name=dut1234       // ARRAY
 *
 * or by id:
 *  - GET http://localhost/dut/MongoDBObjectIdHere // SINGLE
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return either a single or an array of objects depending on which 
 * URL was used
 */
.REST_read('/', Dut, {allow_bulk: true, populations: [{path: 'firmware'}]})

/**
 * PUT /dut/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/dut/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
.permissions('login')
.REST_update('/', Dut, {upsert: true} /* Allow upsert, insert entry if non-existent */)

/** 
 * DELETE /dut/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/dut/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.permissions('login')
.REST_delete('/', Dut, false);

// Export the app
module.exports = app;
