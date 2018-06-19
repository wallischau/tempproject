// Imports
var { Form, Validators } = require('../inc/form.js');

/**
 * Register Form
 * -------------
 * This defines a Form for a register form. The register form will be required
 * to have the following fields:
 *   first_name - Letters only, 2-16 characters in length
 *   last_name  - Letters only, 2-16 characters in length
 *   email1     - <NAME>@<DOMAIN>.<EXT> format.
 *   email2     - Must match email1(case insensitive)
 *   password1  - Any characters, 6-16 in length
 *   password2  - Must match password2(case sensitive)
 */
module.exports = Form.create({
    
  // First and last names may only have letters, 2-16 characters long
  first_name: [
    Validators.required, 
    Validators.trim, 
    Validators.pattern(/[A-Za-z]{2,16}/i)
  ],
  
  last_name: [
    Validators.required, 
    Validators.trim, 
    Validators.pattern(/[A-Za-z]{2,16}/i)
  ],
  
  // Email format. email2 must be equal to email1
  email1: [
    Validators.required, 
    Validators.trim, 
    Validators.pattern(/[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\.[A-Za-z]{2,8}/i)
  ],
  
  email2: [
    Validators.required, 
    Validators.trim, 
    
    // Case insensitive
    Validators.equal('email1', true)
  ],
  
  // Password must be between 6-16 characters in length. password1 must match
  // password2
  password1: [
    Validators.required, 
    Validators.pattern(/^.{6,16}$/i) 
  ],
  
  password2: [
    Validators.required,
    
    // Case sensitive
    Validators.equal('password1')
  ]
  
});
