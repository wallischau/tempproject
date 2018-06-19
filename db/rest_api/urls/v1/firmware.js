// Imports
var Firmwares = require('../../models/DutFirmware.js');
 
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();


app.REST_read('/', Firmwares, {allow_bulk: true} /* Allow bulk find */)

// app.REST_create('/', Firmwares, true /* Allow bulk insert */)

// app.REST_update('/', Firmwares, true /* Allow upsert, insert entry if non-existent */)

// app.REST_delete('/', Firmwares);

// Export the app
module.exports = app;