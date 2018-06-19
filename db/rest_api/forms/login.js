// Imports
var { Form, Validators } = require('../inc/form.js');

/**
 * Login Form
 * ----------
 * username - Letters only, 2-16 characters in length
 * password - 2-16 characters in length
 */
module.exports = Form.create({
    
  // Username may only have letters, 2-16 characters long
  email: [
    Validators.required, 
    Validators.trim, 
    Validators.pattern(/[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\.[A-Za-z]{2,8}/i)
  ],
  
  // Password must be between 6-16 characters in length
  password: [
    Validators.required, 
    Validators.pattern(/^.{6,16}$/i)
  ],
  
});
