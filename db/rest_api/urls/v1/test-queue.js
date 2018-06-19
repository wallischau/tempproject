/**
 * URL namespace: /test-queue/
 * 
 * This includes user functions such as:
 *  - GET /test-queue
 *  - GET /test-queue/<id>
 *  - POST /test-queue/
 *  - PUT /test-queue/
 *  - DELETE /test-queue/<id>
 */
 
// Imports
const TestQueue = require('../../models/TestQueue.js');
const ModelUpdates = require('../../events/model-updates.js');
const ObjectId = require('mongoose').Types.ObjectId;
 
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
 * This allows you to create a TestQueue object. 
 *
 * Access the API by:
 *  - POST http://localhost/test-queue
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.REST_create('/', TestQueue, true /* Allow bulk insert */)

/**
 * GET /test-queue[/<id>]
 * ----------------
 * This allows you to retrieve objects from the database either by query
 *  - GET http://localhost/test-queue?name=test-queue1234       // ARRAY
 *
 * or by id:
 *  - GET http://localhost/test-queue/MongoDBObjectIdHere // SINGLE
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return either a single or an array of objects depending on which 
 * URL was used
 */
.REST_read('/', TestQueue, {allow_bulk: true} /* Allow bulk find */)

/**
 * PUT /test-queue/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will 
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/test-queue/MongoDBObjectIdHere
 *
 * This does not require a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
.permissions('login')
.REST_update('/', TestQueue, {upsert: false, allow_bulk: true})

/** 
 * DELETE /test-queue/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/test-queue/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.permissions('login')
.REST_delete('/', TestQueue, true);

// app
// // .permissions('login')
// .delete('/chamber/:chamber_id', async (req, res) => {
//   const { chamber_id } = req.params
//   try {
//     await TestQueue.find({ 'topology.chamber._id': chamber_id }).remove((err) => {
//       if(!err) {
//         res.success('All queued tests removed')
//       } 
//     })
//   } catch (e) {
//     res.error('problem')
//   }
// });

// app
// // .permissions('login')
// .delete('/case/:test_case_id', async (req, res) => {
//   const { test_run_id } = req.params
//   // try {
//   //   await TestQueue.find({ test_run_id: ObjectId(test_run_id) }).remove((err) => {
//   //     if(!err) {
//   //       res.success('Queued tests removed')
//   //     } 
//   //   })
//   // } catch (e) {
//   //   res.error('problem')
//   // }
// })

// Export the app
module.exports = app;
