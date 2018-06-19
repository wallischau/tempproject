// Import Model
var crypto = require('crypto');
var Model = require('../inc/model.js');

// Export the user schema
let User = module.exports = Model.create({
  
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
  "userid": String,
  "password": String,
  "salt": String,
  "fname": String,
  "lname": String,
  "email": String,
  "groups": [String],
  "resetpwd": Boolean,
  "active": Boolean,
  
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
  
  /**
   * @memberof User
   * @static
   * @property
   *
   * Attempts to log in the user
   *
   * @return {Object} Returns the object of the user
   *
   * @throws {User.InvalidUsername} Username was not found
   * @throws {User.InvalidPassword} Password was not correct
   *
   */
  "@InvalidUsername": function() {/* Exception */},
  "@InvalidPassword": function() {/* Exception */},
  
  "@login": async function(email, password) {
    
    // Look up the user
    let result = await this.findOne({ 
      email: new RegExp(`^${email}$`, 'i')
    });
    
    if (!result) {
      // Could not find
      throw new this.InvalidUsername();
    }
    
    let hash = crypto.createHmac('sha512', result.salt);
    hash.update(password);
    
    if (result.password != hash.digest('hex')) {
      // Passwords do not match
      throw new this.InvalidPassword();
    }
    
    // All is good! User may now create session
    return result;
    
  },
  
  /**
   * @memberof User
   * @static
   * @property
   *
   * Attempts to register the user
   *
   * @return {Object} Returns the object of the user
   *
   * @throws {User.Exists} User exists and cannot be registered
   *
   */
  "@Exists": function() {/* Exception */},
  
  "@register": async function(email, password, fname, lname, active) {
    
    // Active by default
    if (active === undefined) {
      active = true;
    }
    
    // Craft a username
    let userid = `${fname[0]}${lname}`.toLowerCase();
    
    // Verify that the user has not registered yet
    let result = await this.find({ 
      email: new RegExp(`^${email}$`, 'i')
    });
    
    if (result.length) {
      // User already exists
      throw new this.Exists();
    }
    
    // Hash the password with a salt
    let salt = crypto.randomBytes(4).toString('hex');
    let hash = crypto.createHmac('sha512', salt);
    hash.update(password); 
    
    // Create the user
    let newUser = await this.create({
      userid,
      password: hash.digest('hex'),
      salt,
      fname,
      lname,
      email,
      active,
      groups: ['login'],
      resetpwd: false,
    });
    
    // Return the new user
    return newUser;
  },
  
  /**
   * @memberof User
   * @instance
   * @method
   *
   * Changes the password on the user
   *
   * @param {String} password - The new password. Updates user immediately
   */
  "setPassword": async function(password) {
    await User.setPasswordForUser(this, password);    
  },

  "@setPasswordForUser": async function(user, password) {
    // Hash the password with a salt
    let salt = crypto.randomBytes(4).toString('hex');
    let hash = crypto.createHmac('sha512', salt);
    hash.update(password); 
    
    // Update record
    await User.updateOne({"_id": user._id}, {
      "password": hash.digest('hex'),
      "salt": salt
    });
  },
 
  /**
   * @memberof User
   * @instance
   * @property
   *
   * Retrieves the full name of the user
   *
   * @return {String} Returns the full name of the user
   */
  "#fullname": function () {
    return `${this.fname} ${this.lname}`;
  },
  
  /**
   * @memberof User
   * @static
   * @property
   *
   * Returns a blank user
   *
   * @return {Object} Returns a Guest User object
   *
   */
  "@guest": function() {
    return {"_id": 0};
  }
  
});