var fs = require('fs');
var path = require('path');

var Permission = {
  
  "login": (req, res, next) => {
    
    if (req.user._id) {
      // We are logged in
      next(true);
    } else {
      // We are not logged in
      next(false);
    }
    
  }
  
};

module.exports = function(permissions, req, res, next) {
  
  // "permissions" is an array of args fed into the decorator
  // Ex: if you used .permissions('login', 'admin')
  // You will get permissions = ['login', 'admin']
  
  // TODO: This should be inclusive(OR)
  
  let i = 0;
  
  // We must use a function because of async code
  let popPermission = (modifier, result) => {
    
    // When modifier is 1, that means there's a '!' present(Ex: '!login')
    if (!(result ^ modifier)) {
      res.status(403).json({success: false, errors: "Permission denied"});
      return;
    }
    
    let perm = permissions[i++];
    
    if (!perm) {
      next();
      return;
    }
    
    if (perm[0] == '!') {
      modifier = 1;
      perm = perm.substr(1);
    } else {
      modifier = 0;
    }    
    
    Permission[perm](req, res, popPermission.bind(null, modifier));
  }
  
  popPermission(0, true);
  
}
