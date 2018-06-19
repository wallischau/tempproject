import io from 'socket.io-client';

//
// Export this into the global namespace so that it can be access by all 
// components if needed
//
// If this is a bad idea, then we can remove it
//
let socket = io();
window.socket = socket;

socket.on('connect', function(data){
  
  //
  // We are now connected!
  //
  // This event will fire on reconnect
  //
  
}).on('reconnect', function(data){
  
  //
  // A reconnect has happened. Socket was disconnected and is now reconnected
  //
  
}).on('disconnect', function(data){
  
  //
  // Websocket disconnected. This can mean:
  //
  //   1. The server was disconnected. This is most likely if you're in dev
  //   2. Connectivity on the machine is down and cannot reach the server
  //
  // Regardless, SocketIO has retry logic. This will re-emit 'connect' and 
  // a 'reconnect' event
  //
  
}).on('remove-me', function(data){
  
  //
  // This is just a test
  // 
  // Use http://localhost:3000/v1/test/junk/notify and watch the console.log
  // notifications!
  //
  
  console.log('remove-me', data);
  
});
