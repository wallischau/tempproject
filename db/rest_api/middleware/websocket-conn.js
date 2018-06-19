// Imports
var User = require('../models/User.js');

/**
 * This module is only responsible for injecting socket.ip and socket.user 
 * into the socket object 
 *
 * It will also insert the socket into 2 different rooms: One by session, and 
 * the other one by username. This is so notifications can be possible in the 
 * near/far future(that's a test type!)
 *
 */
module.exports = function(app, io) {
  
  return async function(socket, next) {
    
    //
    // At this point, 'express-session' middleware should have ran
    //
    
    // Get SocketIO
    let session = socket.request.session;
    let sessionId = session.id;
    
    // Include session as "socket.session"
    socket.session = session;
    
    // Get IP
    let ip = socket.request.connection.remoteAddress;
    
    // Get UserID, if any
    socket.user = User.guest();
    if (session.uid) {
      
      // And... Inject
      let user = await User.findOne({"_id": session.uid});
      
      if (user) {
        // ... And inject into "socket" for easy access during handlers
        socket.user = user;
        
        // Join the "room" for this user so we can propagate events same user
        socket.join('user-' + user.userid);
      }
      
    }
    
    // Inject
    socket.ip = ip;
    
    // Join the "room" for this session to propagate events to same 
    // TODO: Generate a random guest name upon creating session
    socket.join('session-' + sessionId);
    
    // Move on to the next handler
    next();
    
  };
  
};
