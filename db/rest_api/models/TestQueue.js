// Import Model
const Model = require('../inc/model.js');
const TestRun = require('./TestRun.js');


// Export the user schema
module.exports = Model.create('test_queue', {
  
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
  "topology": Object,
  "user": String,
  "test_suite": String,
  "test_type": String,
  "test_case": String,
  "test_file": String,
  "runner": String,
  "status": String,
  "test_run": { type: Model.ObjectId, ref: 'TestRun' },
  "test_result": { type: Model.ObjectId, ref: 'TestResult' },
  
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
   * Which can be called with: myUserObject.getFullName();
   *
   *
   * Key name with '@' prefix will be assumed a Static method:
   *  > "@getAllUsers": function { console.log('This should get all users'); }
   *
   * Which can be called with: User.getAllUser();
   *
   *
   * Key name with '#' prefix will be assumed a Getter method:
   *  > "#fullname": function() { return `${this.fname} ${this.lname}` ;}
   * 
   * Which can be called with: console.log(`we have ${myUserObject.fullname}!`)
   * 
   * NOTE: Make sure to use function() instead of Arrow Functions. Arrow
   * Functions *WILL NOT* bind 'this' in proper context
   *
   */
  
});