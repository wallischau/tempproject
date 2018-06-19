// Import Model
var Model = require('../inc/model.js');

// Export the user schema
module.exports = Model.create('dut_firmwares', {
  
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
   
  "company": String,
  "name": String, 
  "model_name": String, 
  
  "capabilities": Object
});
