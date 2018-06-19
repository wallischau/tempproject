/**
 * Updates
 * -------
 * This file will iterate through the '/smart/ui/server/updates' directory
 * and determine which updates must be applied
 *
 */
var mongoose = require('mongoose');
var path = require('path');
var fs = require('fs');
 
const UPDATE_DIR = './updates/';

var Update = mongoose.model('Update', {
  filename: String,
  timestamp: Date
});

/**
 * Check for script updates
 *
 * @return {Promise} returns a Promise
 */
function checkForUpdates() {
    
  return new Promise(function(resolve, reject) {
    
    // This is the raw directory list 
    var filelist = fs.readdirSync(UPDATE_DIR);
    
    // We only want JavaScript files
    var filelistParsed = filelist.filter(file => (path.extname(file) == '.js'));

    // Sort them by their number 
    filelistParsed.sort((a,b) => {

      a = a.substring(0, a.indexOf('-'));
      b = b.substring(0, b.indexOf('-'));
      
      // parseInt('0001-initial') will return 1
      a = parseInt(a);
      b = parseInt(b);
      
      return a - b;
    });
    
    Update.find({filename: {$in: filelistParsed} }, (err, results) => {
      
      // We just want an array with filenames
      filelist = results.map(result => result.filename);
      
      // Filter out our original list
      var updatesPending = filelistParsed.filter( 
        file => !filelist.includes(file)
      );
      
      // Pass on the updates that are still pending
      resolve(updatesPending);
    });
    
    
  });
}

/**
 *
 */ 
function applyUpdate(update, onUpdate) {
  return new Promise((resolve, reject) => {
    
    var runUpdate = require('.' + UPDATE_DIR + update);
    
    var onDone = function(messages) {
      
      messages = messages || [];
      
      Update.create({
        filename: update,
        timestamp: new Date()
      }).then(function(){
        resolve(messages);
      });
    };
    
    var onFail = function(err) {
      reject(err);
    }
    
    runUpdate(onDone, onFail, onUpdate);
    
  });
}
 
module.exports = {
  check: checkForUpdates,
  apply: applyUpdate
};