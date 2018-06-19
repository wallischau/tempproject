/**
 * URL namespace: /ap-metrics/
 * 
 * This includes user functions such as:
 *  - GET /ap-metrics
 *  - GET /ap-metrics/<id>
 *  - POST /ap-metrics/
 *  - PUT /ap-metrics/
 *  - DELETE /ap-metrics/<id>
 */
 
// Imports
var APMetrics = require('../../models/APMetrics.js');
 
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app

/**
 * /ap-metrics/
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
 * POST /ap-metrics
 * ----------
 * This allows you to create a APMetrics object. 
 *
 * Access the API by:
 *  - POST http://localhost/ap-metrics
 *
 * This does not require a login
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.REST_create('/', APMetrics, true /* Allow bulk insert */)

/**
 * GET /ap-metrics[/<id>]
 * ----------------
 * This allows you to retrieve objects from the database either by query
 *  - GET http://localhost/ap-metrics?name=ap-metrics1234       // ARRAY
 *
 * or by id:
 *  - GET http://localhost/ap-metrics/MongoDBObjectIdHere // SINGLE
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return either a single or an array of objects depending on which 
 * URL was used
 */
.REST_read('/', APMetrics, {allow_bulk: true} /* Allow bulk find */)

/**
 * PUT /ap-metrics/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/ap-metrics/MongoDBObjectIdHere
 *
 * This does not require a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
.REST_update('/', APMetrics, {upsert: true} /* Allow upsert, insert entry if non-existent */)

/** 
 * DELETE /ap-metrics/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/ap-metrics/MongoDBObjectIdHere
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.REST_delete('/', APMetrics, false);

// Export the app
module.exports = app;
