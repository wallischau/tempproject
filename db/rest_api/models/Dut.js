// Import Model
var Model = require('../inc/model.js');
var DutFirmware = require('./DutFirmware.js');

// Export the user schema
module.exports = Model.create('duts', {
  
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
   
  // Postgres ID
  "id": Number,
  
  "firmware": { type: Model.ObjectId, ref: 'DutFirmware' },
  "mac_address": String,
  "serial_number": String,
  "barcode_id": String,
  "type": String
  
});
