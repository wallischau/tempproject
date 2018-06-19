// Import Model
var Model = require('../inc/model.js');
var TestChamber = require('./TestChamber.js');

// Export the ethernet port schema
module.exports = Model.create('ethernet_ports', {
  
  /**
   * Schema
   * ------
   * Defines keys and variable types. The following are available:
   * String, Number, Date, Buffer, Boolean, Array, Object
   *
   * Additionally, these are also available:
   * Model.Mixed, Model.ObjectId
   *
   * For more information, visit: http://mongoosejs.com/docs/schematypes.html
   */
  "type": String,
  "chassis_ip": String,
  "slot": String,
  "port": String,
  "reserved_by_chamber": String,
  "vlan_switch_ip": String,
  "vlan_interface": String,
  
  /**
   * Methods
   * -------
   * Keys with functions will be considered methods. There are 3 different
   * types of methods available:
   *  - Instance/Object Method (NO PREFIX)
   *  - Class/Static Method ('@' PREFIX)
   *  - Getter Method ('#' PREFIX)
   *
   * Key name WITHOUT a prefix will be assumed an Instance method:
   *  > "getFullName": function() { return `${this.fname} ${this.lname}`; }
   *
   * Which can be called with: myEthernetPortObject.getFullName();
   *
   *
   * Key name with '@' prefix will be assumed a Static method:
   *  > "@getAllEthernetPorts": function { console.log('This should get all ports'); }
   *
   * Which can be called with: EthernetPort.getAllEthernetPorts();
   *
   *
   * Key name with '#' prefix will be assumed a Getter method:
   *  > "#fullname": function() { return `${this.fname} ${this.lname}` ;}
   * 
   * Which can be called with: console.log(`we have ${myEthernetPortObject.fullname}!`)
   * 
   * NOTE: Make sure to use function() instead of Arrow Functions. Arrow
   * Functions *WILL NOT* bind 'this' in proper context
   *
   */
  
  /**
   * @memberof EthernetPort
   * @static
   * @property
   *
   * Attempts to reserve a specified amount of ethernet ports
   *
   * @return {Object} Returns the object of the ethernet ports
   *
   * @throws {TestChamber.InvalidChamber} Chamber was not found
   * @throws {EthernetPort.InsufficientPorts} Not enough ports available
   *
   */
  "@InsufficientPorts": function() {/* Exception */},
  
  "@reserve": async function(chamberName, quantity) {
    let chamber = await TestChamber.findOne({name: chamberName});

    if (!chamber) {
      throw new TestChamber.InvalidChamber();
    }

    let ethernetPorts = await this.find({reserved_by_chamber: ""});

    if (ethernetPorts.length < quantity) {
      throw new this.InsufficientPorts();
    }

    let reservedPorts = [];
    let reservedQty = 0;

    for (i in ethernetPorts) {
      port = ethernetPorts[i];
      port.reserved_by_chamber = chamberName;
      port.save();

      reservedPorts.push(port);

      reservedQty++;
      if (reservedQty == quantity) {
        break;
      }
    }

    return reservedPorts;
  },

  /**
   * @memberof EthernetPort
   * @static
   * @property
   *
   * Attempts to release the ports reserved by a chamber
   *
   * @return {Object} Returns the object of released ports
   *
   * @throws {TestChamber.InvalidChamber} Chamber was not found
   * @throws {EthernetPort.NoPortsReserved} Chamber was not reserved
   *
   */
  "@NoPortsReserved": function() {/*Exception */},
  
  "@release": async function(chamberName) {
    let chamber = await TestChamber.findOne({name: chamberName});

    if (!chamber) {
      throw new TestChamber.InvalidChamber();
    }

    let ethernetPorts = await this.find({reserved_by_chamber: chamberName});

    if (ethernetPorts.length == 0) {
      throw new this.NoPortsReserved();
    }

    let releasedPorts = [];

    for (i in ethernetPorts) {
      port = ethernetPorts[i];
      port.reserved_by_chamber = "";
      port.save();

      releasedPorts.push(port);
    }

    return releasedPorts;
  }
});