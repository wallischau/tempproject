/**
 * This module is only responsible for providing an interface through the 
 * response "res" object for interfacing with SocketIO
 *
 * The interface consists of:
 *
 *   1. res.io.emit('event', 'msg') - Notify the calling user via SocketIO
 *   2. res.io.to('roomname').emit('event', 'msg') - Notifies a room
 *   3. res.io.user('carvelo').emit('event', 'msg') - Notifies a user
 *   4. res.io.broadcast.emit('event', 'msg') - Notifies everyone connected
 *   5. res.io.io - The real SocketIO object, in case it's needed
 *
 * With this, we will be able to do real-time notifications
 *
 */
module.exports = function(app, io) {
  
  return async function(req, res, next) {
    
    let ioInterface = {
      
      //
      // Fields/properties
      //
      "_rooms": null,
      "io": io,
      
      /**
       * res.io.broadcast.emit
       *
       * Broadcasts an event to all connected sockets
       *
       * @param {String} event - Event name
       * @param {...Mixed} args - Parameters for the event
       */
      "broadcast": {
        "emit": function() {
          io.emit.apply(io, arguments);
        }
      },
      
      /**
       * res.io.to
       *
       * Send event to a room name. Chainable with multiple rooms
       *
       * @param {String} roomName - The name of the room to add
       * @returns {Object} Returns "this" for chainable
       */
      "to": function(room) {
        if (!this._rooms) {
          this._rooms = [];
        }
        
        this._rooms.push(room);
        return this;
      },
      
      /**
       * res.io.user
       *
       * Same thing as res.to, but prefixes with a "user-"
       *
       * @param {String} user - The username of the person to notify
       * @returns {Object} Returns "this" for chainable
       */
      "user": function(user) {
        return this.to('user-' + user);
      },
      
      /**
       * res.io.emit
       *
       * By default, broadcasts an event to the user's originating session
       *
       * If "res.io.to" or "res.io.user" was used, it will broadcast to those 
       * destinations
       *
       * @param {String} event - Event name
       * @param {...Mixed} args - Parameters for the event
       */
      "emit": function() {
        
        let rooms = this._rooms;
        this._rooms = null;
        
        if (!rooms) {
          rooms = ['session-' + req.session.id];
        }
        
        let sio = io;
        
        rooms.forEach(room => {
          sio = sio.to(room);
        });
        
        sio.emit.apply(sio, arguments);
        
      }
      
    };
    
    // Inject the interface
    res.io = ioInterface;
    
    // Move on to the next handler
    next();
    
  };
  
};
