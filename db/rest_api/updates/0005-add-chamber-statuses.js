/**
 * Initial instantiation
 * ---------------------
 * Hello!
 *
 * This is similar to a migration file on Django. The main difference being 
 * is that we are not dealing with schema changes, because MongoDB does not 
 * care about those(NoSQL for the win, anybody?)
 *
 * We may occasionally need to insert data into the database
 *
 * In this case, we need to port over all existing accounts from the old 
 * framework over to this new one
 *
 * The way these update files work is that the framework should read the 
 * 'updates' directory, sort the files by their update number, and determine
 * which updates must occur by checking it against what we have in the database
 *
 * In this aspect, it works the same as Django minus the dependencies
 *
 * Every update should export a function. This is the function that the 
 * framework will execute when applying an update
 *
 */
 
// Model imports
var TestChamber = require('../models/TestChamber.js');

// Update 
module.exports = function(done) {
  
  var chamberUpdates = [
    {"name":"A","status":"open"},
    {"name":"B","status":"busy"},
    {"name":"C","status":"reserved"},
    {"name":"D","status":"broken"},
    {"name":"E","status":"broken"},
    {"name":"F","status":"reserved"},
    {"name":"G","status":"busy"},
    {"name":"H","status":"open"},
    {"name":"I","status":"open"},
    {"name":"J","status":"busy"},
    {"name":"K","status":"reserved"},
    {"name":"L","status":"broken"},
    {"name":"OB1.1","status":"broken"},
    {"name":"OB1.2","status":"reserved"},
    {"name":"OB2.1","status":"busy"},
    {"name":"OB2.2","status":"open"},
    {"name":"OB3.1","status":"open"},
    {"name":"OB3.2","status":"busy"},
    {"name":"OB3.3","status":"reserved"},
    {"name":"OB3.4","status":"broken"}
  ];



  var popAndExec = function() {
    var chamberUpdate = chamberUpdates.splice(0, 1)[0];
    
    if (chamberUpdate) {
      TestChamber.findOneAndUpdate({name: chamberUpdate.name}, {
        status: chamberUpdate.status
      }).then(function(result){
        popAndExec();
      }).catch(function(err){
        // The user may exist. Keep going regardless
        popAndExec();
      });
    } else {
      done();
    }
    
  }
  
  popAndExec();
  
};
