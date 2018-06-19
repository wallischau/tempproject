// Imports
var User = require('../models/User.js');

/**
 * This module is only responsible for:
 *   - installing "res.auth" to log the user in
 *   - installing the "req.user" property to access current user
 */
module.exports = function(app) {
  
  // This is the initialization code
  
  
  // This is the actual middleware
  return async function(req, res, next) {
    
    // Installs the "res.auth" function
    res.auth = async function(user) {
      
      // We're probably logging out
      if (!user) {
        req.session.uid = undefined;
        return true;
      }
      
      // Verify that it has proper format
      if (!user._id) {
        return false;
      }
      
      // Verify that the user exists
      // TODO: This is actually a bug. It's not waiting. But when we use 
      // the "await" keyword, the logins stop working. I don't get it...
      let result = User.findOne({_id: user._id});
      
      if (!result) {
        return false;
      }
      
      // Successful. Continue
      req.session.uid = user._id;
      return true;
    }
    
    let user_id = req.session ? req.session.uid : 0;
    req.user = User.guest();
    
    // Find the user and insert into req object
    if (user_id) {
      let user = await User.findOne({_id: user_id});
      if (user) {
        req.user = user;
      } else {
        // The user does not exist. Delete the key
        req.session.uid = undefined;
      }
    }
    
    next();
  }
  
}
