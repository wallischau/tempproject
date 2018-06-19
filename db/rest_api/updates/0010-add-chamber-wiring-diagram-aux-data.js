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
module.exports = async function(done) {
  
  var chamberUpdates = [
    {"name":"1.1","aux_config":{
      "chamber_lettering": [
          "E", "F", "G", "H", "M", "N", "O", "P"
      ], 
      "switch_ip": "10.3.65.33",
      "switch_port": "1",
      "card_ethernet_port": "eth3"
  }},
    {"name":"1.2","aux_config":{
      "chamber_lettering": [
          "E", "F", "G", "H", "M", "N", "O", "P"
      ], 
      "switch_ip": "10.3.65.33",
      "switch_port": "1"    
  }},
    {"name":"2.1","aux_config":{
      "chamber_lettering": [
          "A", "B", "C", "D", "E", "F", "G", "H"
      ], 
      "switch_ip": "10.3.65.33", 
      "switch_port": "1" 
  }},
    {"name":"2.3","aux_config":{
      "chamber_lettering": [
          "E", "F", "G", "H", "I", "J", "K", "na"
      ], 
      "switch_ip": "10.3.65.33",
      "switch_port": "1"     
  }},
    {"name":"4.2","aux_config":{
      "chamber_lettering": [
          "A", "B", "C", "D", "M", "N", "O", "P"        
      ], 
      "switch_ip": "10.3.65.32", 
      "switch_port": "1"     
  }},
    {"name":"5.2","aux_config":{
      "chamber_lettering": [
          "E", "F", "G", "H", "I", "J", "K", "L"
      ], 
      "switch_ip": "10.3.65.32", 
      "switch_port": "1"     
  }},
    {"name":"6.2","aux_config":{
      "chamber_lettering": [
          "A", "B", "C", "D", "M", "N", "O", "P"
      ], 
      "switch_ip": "10.3.65.32", 
      "switch_port": "1"    
  }},
    {"name":"6.3","aux_config":{
      "chamber_lettering": [
          "M", "N", "O", "P", "E", "F", "G", "H"
      ], 
      "switch_ip": "10.3.65.32", 
      "switch_port": "3"
  }},
    {"name":"8.1","aux_config":{
      "chamber_lettering": [
          "A", "B", "C", "D", "M", "N", "O", "P"        
      ], 
      "switch_ip": "10.3.65.31", 
      "switch_port": "1"     
  }},
    {"name":"8.3","aux_config":{
      "chamber_lettering": [
          "E", "F", "G", "H", "M", "N", "O", "P"
      ], 
      "switch_ip": "10.3.65.31", 
      "switch_port": "1"     
  }},
    {"name":"9.1","aux_config":{
      "chamber_lettering": [
          "M", "N", "O", "P", "E", "F", "G", "H"    
      ], 
      "switch_ip": "10.3.65.31", 
      "switch_port": "1"     
  }},
    {"name":"9.2","aux_config":{
      "chamber_lettering": [
          "M", "N", "O", "P", "E", "F", "G", "H"
      ], 
      "switch_ip": "10.3.65.31", 
      "switch_port": "3"
  }}
  ];

  var popAndExec = function() {
    var chamberUpdate = chamberUpdates.splice(0, 1)[0];
    
    if (chamberUpdate) {
      TestChamber.findOneAndUpdate(
        { name: chamberUpdate.name }, 
        { wiring_diagram_aux_config: chamberUpdate.aux_config }, 
        { upsert: true }
      ).then(function(result){
        popAndExec();
      }).catch(function(err){
        popAndExec();
      });
    } else {
      done();
    }
    
  }
  
  popAndExec();

  done()
};
