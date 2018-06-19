// Import Model
var Model = require('../inc/model.js');

// Export the user schema
module.exports = Model.create('splitters', {
  
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
  "barcode_id": String,
  "attenuation_1": Number,
  "attenuation_2": Number
  
});
