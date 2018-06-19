/**
 * URL namespace: /junk/
 * 
 * This includes user functions such as:
 *  - GET /junk
 *  - GET /junk/<id>
 *  - POST /junk/
 *  - PUT /junk/
 *  - DELETE /junk/<id>
 */
 
// Imports
var Junk = require('../../../models/Junk.js');

var RegisterForm = require('../../../forms/register.js');
var LoginForm = require('../../../forms/login.js');
 
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

/** This begins the method chaining */
app


/**
 * /junk/
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
 * GET /junk/notify
 * ----------------
 * This sends a notification to the current user session via SocketIO 
 *
 */
.permissions('login')
.get('/notify', function(req, res) {
  
  //
  // This should be removed later on to prevent flooding in case anyone 
  // finds out about this. This is just here to give you an example of 
  // how to use these SocketIO notifications
  //
  
  // This will notify the originating user. This is based on session ID 
  // so if the user has multiple tabs open, all of them will get notified
  res.io.emit('remove-me', 'I have notified all your sessions');
  
  // This will notify ALL the users currently available
  res.io.broadcast.emit('remove-me', 'THIS IS A BROADCAST');
  
  // This will notify a certain user
  res.io.user('carvelo').emit('remove-me', 'Hi, Carlos...');
  
  // This will notify a certain room
  res.io.to('room1').emit('remove-me', 'Hi, room1 people!');
  
  // Access the real SocketIO object. The above is a "res" wrapper for it
  let io = res.io.io;
  
  
  res.send('I should have notified the user :)');
  
})
 
/**
 * POST /junk
 * ----------
 * This allows you to create a Junk object. 
 *
 * Access the API by:
 *  - POST http://localhost/v1/test/junk
 *
 * This requires the user to be logged in. See "user.js"
 *
 * The body is a JSON object to insert into the database
 *
 * This returns the newly inserted JSON object(with _id)
 */
.permissions('login')
.REST_create('/', Junk, false /* Allow bulk insert */)

/**
 * GET /junk[/<id>]
 * ----------------
 * This allows you to retrieve objects from the database either by query
 *  - GET http://localhost/v1/test/junk?name=junk1234       // ARRAY
 *
 * or by id:
 *  - GET http://localhost/v1/test/junk/MongoDBObjectIdHere // SINGLE
 *
 * This does not require a login
 *
 * No body is required
 *
 * It will return either a single or an array of objects depending on which 
 * URL was used
 */
.permissions('!login')
.REST_read('/', Junk, {allow_bulk: true} /* Allow bulk fetch */)

/**
 * PUT /junk/<id>
 * ---------------
 * This allows you to update an entry in the database by ObjectId. It will NOT
 * create a new database entry if the ID does not exist(no upsert)
 *
 * Access the API by:
 *  - PUT http://localhost/v1/test/junk/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * The body is a JSON object to with the fields to update
 *
 * It will return the updated object
 *
 */
.permissions('login')
.REST_update('/', Junk, {upsert: false} /* Allow upsert, insert entry if non-existent */)

/** 
 * DELETE /junk/<id>
 * -----------------
 * This allows an entry to be deleted
 *
 * Access the API by:
 *  - DELETE http://localhost/v1/test/junk/MongoDBObjectIdHere
 *
 * This requires a login
 *
 * No body is required
 *
 * It will return the deleted object
 *
 */
.permissions('login')
.REST_delete('/', Junk, false)

/** Export the app */
module.exports = app;

