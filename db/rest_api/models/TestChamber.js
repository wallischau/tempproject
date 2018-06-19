// Import Model
const Model = require('../inc/model.js');
const User = require('./User.js');
const Dut = require('./Dut.js');
const Splitter = require('./Splitter.js')

// Export the user schema
module.exports = Model.create('test_chambers', {
  
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
  "name": String,
  "make": String,
  "model": String,
  "serial": String,
  "firmware": String,
  "rack": Number,
  "shelf": Number,
  "reserved_by": String,
  "start": Date,
  "end": Date,
  "status": String,
  "splitters": Array,
  "attenuator": {
    "make": String,
    "ip": String,
    "ports_5_GHz": String,
    "ports_24_GHz": String,
    "atten_5_GHz": Number,
    "atten_24_GHz": Number
  },
  "ixia_card_config": {
    "wifi_5_GHz": {
      "ip": String,
      "model": String,
      "serial": String,
      "slot": Number,
      "port": Number
    },
    "wifi_24_GHz": {
      "ip": String,
      "model": String,
      "serial": String,
      "slot": Number,
      "port": Number
    },
    "ethernet": {
      "ip": String,
      "model": String,
      "serial": String,
      "slot": Number,
      "port": Number,
      "vlan": {
        "lan_1": Number,
        "lan_2": Number,
        "lan_3": Number,
        "wan": Number,
        "enabled": Boolean
      }
    }
  },
  "dut": { type: Model.ObjectId, ref: 'Dut' },
  
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
   * Which can be called with: myTestChamberObject.getFullName();
   *
   *
   * Key name with '@' prefix will be assumed a Static method:
   *  > "@getAllTestChambers": function { console.log('This should get all chambers'); }
   *
   * Which can be called with: TestChamber.getAllTestChamber();
   *
   *
   * Key name with '#' prefix will be assumed a Getter method:
   *  > "#fullname": function() { return `${this.fname} ${this.lname}` ;}
   * 
   * Which can be called with: console.log(`we have ${myTestChamberObject.fullname}!`)
   * 
   * NOTE: Make sure to use function() instead of Arrow Functions. Arrow
   * Functions *WILL NOT* bind 'this' in proper context
   *
   */

  /**
   * @memberof TestChamber
   * @static
   * @property
   *
   * Attempts to reserve the chamber
   *
   * @return {Object} Returns the object of the chamber
   *
   * @throws {TestChamber.InvalidChamber} Chamber was not found
   * @throws {TestChamber.InvalidPassword} Password was not correct
   *
   */
  "@InvalidChamber": function() {/* Exception */},
  "@ChamberReserved": function() {/*Exception */},
  
  "@reserve": async function(chamberName, userid, start, end) {
    let chamber = await this.findOne({name: chamberName});

    if (!chamber) {
      throw new this.InvalidChamber();
    }

    let user = await User.findOne({userid: userid});

    if (!user) {
      throw new User.InvalidUsername();
    }

    if (chamber.reserved && chamber.reserved_by != userid) {
      throw new this.ChamberReserved();
    }
    chamber.reserved_by = userid;
    chamber.status = "reserved";
    chamber.start = start;
    chamber.end = end;
    await chamber.save();
    return chamber;
  },

  /**
   * @memberof TestChamber
   * @static
   * @property
   *
   * Attempts to release the chamber
   *
   * @return {Object} Returns the object of the chamber
   *
   * @throws {TestChamber.InvalidChamber} Chamber was not found
   * @throws {TestChamber.ChamberOpen} Chamber was not reserved
   *
   */
  "@ChamberOpen": function() {/*Exception */},
  
  "@release": async function(chamberName, userid) {
    let chamber = await this.findOne({name: chamberName});

    if (!chamber) {
      throw new this.InvalidChamber();
    }

    if (!chamber.reserved) {
      throw new this.ChamberOpen();
    }
    chamber.status = "open"
    chamber.reserved_by = null;
    chamber.start = null;
    chamber.end = null;

    await chamber.save();
    return chamber;
  },

  /**
   * @memberof TestChamber
   * @static
   * @property
   *
   * Attempts to get a test chamber matching the query
   *
   * @return {Object} Returns the object of the test chamber
   *
   * @throws {TestChamber.InvalidChamber} Chamber was not found
   *
   */
  "@get": async function(query) {
    let result = await this.find(query);
    
    return result;
  },

  /**
   * @memberof TestChamber
   * @instance
   * @property
   *
   * Retrieves the reserved status of the chamber
   *
   * @return {Boolean} Returns true if the chamber is reserved
   */
  "#reserved": function () {
    return this.reserved_by != null && this.reserved_by != "";
  }
});