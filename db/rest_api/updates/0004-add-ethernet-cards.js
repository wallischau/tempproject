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
  TestChamber.updateMany({'ixia_card_config.ethernet': null}, {
    'ixia_card_config.ethernet': {
      card_port: '',
      card_slot: '',
      card_serial: '',
      card_model: '',
      chassis_ip: ''
    }
  }).then(function(result) {
    done();
  }).catch(function(err) {
    done();
  });
  
};
