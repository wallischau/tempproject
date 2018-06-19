/**
 * TestChamber SocketIO events
 */
 
// The SocketIO object will be injected into the Express object
var SocketIO = require('socket.io');
var io = SocketIO();

var ModelUpdates = require('../../events/model-updates.js');

var TestQueue = require('../../models/TestQueue.js');

/**
 * WebSocket events
 * ----------------
 * Defines WebSocket events
 */

/** This begins the method chaining */
io

/**
 * Test function for 'connect' event. This will fire off 
 * whenever a socket connects
 */
.on('connect', async (socket) => {
  console.log('I am now connected!', socket.ip);
})
.on('send-test-output', async (socket, chamberId, data) => {
  let roomName = 'get-test-output-' + chamberId;

  io.to(roomName).emit('get-test-output', {
    'active': true,
    'stdout': data
  });
  // if (chamberId in chamberOutputs) {
  //   chamberOutputs[chamberId].emit('get-test-output-' + chamberId, {
  //     "active": true,
  //     "stdout": data
  //   });
  // }
})
.on('get-test-output', async (socket, chamberId, subscribe) => {
  let roomName = 'get-test-output-' + chamberId;

  if (subscribe) {
    socket.emit('get-test-output', {"active": true, "stdout": ""});
    socket.join(roomName);
  } else {
    socket.leave(roomName);
  }
});

/** This app object does not need to be exported */
module.exports = io;
