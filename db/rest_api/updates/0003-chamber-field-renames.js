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

  var chamberRenames = [
    {
      'attenuator.5_ports': 'attenuator.ports_5_GHz',
      'attenuator.24_ports': 'attenuator.ports_24_GHz',
      'ixia_card_config.24': 'ixia_card_config.wifi_24_GHz',
      'ixia_card_config.5': 'ixia_card_config.wifi_5_GHz',
    },
    {
      'attenuator.24_GHz_ports': 'attenuator.ports_24_GHz',
      'attenuator.5_GHz_ports': 'attenuator.ports_5_GHz',
      'ixia_card_config.24_GHz': 'ixia_card_config.wifi_24_GHz',
      'ixia_card_config.5_GHz': 'ixia_card_config.wifi_5_GHz',
    },
    {
      'ixia_card_config.24GHz': 'ixia_card_config.wifi_24_GHz'
    }
  ]

  var popAndExec = function() {
    var chamberRename = chamberRenames.splice(0, 1)[0];
    if (chamberRename) {
      TestChamber.updateMany({}, {
        $rename: chamberRename
      }).then(function(result) {
        popAndExec();
      }).catch(function(err) {
        popAndExec();
      });
    } else {
      done();
    }
  }
  
  popAndExec();
};
