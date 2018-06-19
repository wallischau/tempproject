/**
 * Initialize Database
 * -------------------
 * Initialize a connection to MongoDB
 */
var mongoose = require('mongoose');


/**
 * Initializes a MongoDB connection
 *
 * @param {Object} conf - Parameters for connection
 * @return {Promise} returns a Promise
 */
function start(conf) { 
  return new Promise((resolve, reject) => {
    
    mongoose.connect(
      
      `mongodb://${conf.host}/${conf.database}`,
      
      (err) => {
        
        if (err) {
          reject(err);
        } else {
          resolve();
        }
        
      }
      
    );
    
    mongoose.Promise = global.Promise;
    
  });
}

module.exports = {
  start
};