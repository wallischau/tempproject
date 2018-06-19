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
  
  var testChambers = [
    {"type":"chamber","name":"A","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.96","5_ports":"1-4","24_ports":"5-8"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"B","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.96","5_ports":"13-16","24_ports":"9-12"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"C","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.93","5_ports":"1-4","24_ports":"5-8"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"D","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.91","5_ports":"5-8","24_ports":"1-4"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"E","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.96","5_ports":"1-4","24_ports":"5-8"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"F","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.96","5_ports":"9-12","24_ports":"13-16"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"G","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.97","5_ports":"1-4","24_ports":"5-8"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"H","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.97","5_ports":"13-16","24_ports":"9-12"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"I","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.98","5_ports":"1-4","24_ports":"5-8"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"J","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.98","5_ports":"9-12","24_ports":"13-16"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"K","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.99","5_ports":"5-8","24_ports":"1-4"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"L","make":"Ixia","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"jfw","ip":"10.3.65.99","5_ports":"13-16","24_ports":"9-12"},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB1.1","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB1.2","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB2.1","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB2.2","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB3.1","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB3.2","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB3.3","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}},
    {"type":"chamber","name":"OB3.4","make":"OctoBox","model":null,"location":"1.1","reserved_by":"","attenuator":{"manufacturer":"","ip":"","5_ports":"","24_ports":""},"ixia_card_config":{"5":{"chassis_ip":"","card_serial":"","slot":"","port":""},"24":{"chassis_ip":"","card_serial":"","slot":"","port":""}},"dut":{"make":"Askey","model":"XYZ","mac":"123456"}}
  ];

  testChambers.forEach(function(chamber) {
    chamber.dut = null;
  });

  TestChamber.insertMany(testChambers).then(function(result) {
    done();
  });
  
};
