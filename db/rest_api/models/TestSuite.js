// Import Model
var Model = require('../inc/model.js');

// Export the user schema
module.exports = Model.create('test_suites', {
  
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
  "name": String,
  "version": Number,
  "test_suites": {},
  
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
   * Which can be called with: myTestSuiteObject.getFullName();
   *
   *
   * Key name with '@' prefix will be assumed a Static method:
   *  > "@getAllTestSuites": function { console.log('This should get all suites'); }
   *
   * Which can be called with: TestSuite.getAllTestSuite();
   *
   *
   * Key name with '#' prefix will be assumed a Getter method:
   *  > "#fullname": function() { return `${this.fname} ${this.lname}` ;}
   * 
   * Which can be called with: console.log(`we have ${myTestSuiteObject.fullname}!`)
   * 
   * NOTE: Make sure to use function() instead of Arrow Functions. Arrow
   * Functions *WILL NOT* bind 'this' in proper context
   *
   */
});
