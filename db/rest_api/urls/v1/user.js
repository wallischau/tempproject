/**
 * URL namespace: /user/
 * 
 * This includes user functions such as:
 *  - /user/login
 *  - /user/logout
 *  - /user/register
 */
 

var User = require('../../models/User.js');
var TestChamber = require('../../models/TestChamber.js');
var Junk = require('../../models/Junk.js');

var RegisterForm = require('../../forms/register.js');
var LoginForm = require('../../forms/login.js');

var send_mail= require('../../inc/send-mail.js')
 
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
*/




/** This begins the method chaining */
app


/**
 * POST /user/register
 * -------------------
 * Registers a user
 *
 * Requirements:
 * 1) Must *NOT* be logged in
 * 2) Needs to validate RegisterForm
 */
.permissions('!login')
.form(RegisterForm)
.post('/register', async (req, res, next) => {
  
  let formResult = req.form[0];
  
  try {
    
    let result = await User.register(
      formResult.values.email1,
      formResult.values.password1,
      formResult.values.first_name,
      formResult.values.last_name,
      // include P-number?
    );
    
    return res.success("Successfully created user");
    
  } catch(e) {
    
    if (e instanceof User.Exists) {
      return res.error("User already exists");
    } else {
      // Unrecognized error. Pass it on
      next(e);
    }
    
  }
  
  
})


/**
 * POST /user/login
 * ----------------
 * Logs in the user
 *
 * Requirements:
 * 1) Must *NOT* be logged in
 * 2) Needs to validate LoginForm
 */
.permissions('!login')
.form(LoginForm)
.post('/login', async (req, res, next) => {
  
  let formResult = req.form[0];
  
  try {
    
    // Attempt to login the user
    let user = await User.login(
      formResult.values.email,
      formResult.values.password
    );
  
    // If we're at this point, no exception was thrown and we can log in!
    res.auth(user);
    
    // We have successfully logged in
    user.password = "hunter2" // can't seem to delete these, so just replacing for now
    user.salt = "yes please"
    res.success(user);
  
  } catch (e) {
    if (e instanceof User.InvalidUsername) {
      res.error("Username does not exist");
    } else if (e instanceof User.InvalidPassword) {
      res.error("Incorrect password");
    } else {
      // Unknown exception
      next(e);
    }
  }
  
})


/**
 * GET /user/logout
 * ----------------
 * Logs out the user
 *
 * Requirements:
 * 1) Must be logged in
 */
.permissions('login')
.get('/logout', (req, res) => {
  res.auth(null);
  res.success('Successfully logged out');
})

.get('/checkforlogin', (req, res) => {
  if (req.user) {
    res.success(req.user) /////// same password/salt included here as above.
  } else {
    res.success('You are not logged in')
  }
});



// this ends the app chaining because Kyle doesn't like it that much :D

app
.permissions('login')
.post('/changePassword', (req, res) => {
  const { user, newPassword, currentPassword } = req.body

  try {
    User.setPasswordForUser(user, newPassword)
    res.success(user)
  } catch (e) {
    res.status(400).json({ error: 'failed to change password'})
  }
})

function generatePassword() {
  var length = 8,
      charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
      retVal = "";
  for (var i = 0, n = charset.length; i < length; ++i) {
      retVal += charset.charAt(Math.floor(Math.random() * n));
  }
  return retVal;
}

app
.permissions('!login')
.post('/resetPassword', async (req, res) => {
  const { email } = req.body

  const user = await User.findOne({ 
    email: new RegExp(`^${email}$`, 'i')
  })
  if (!user) {
    res.status(404).json({ error: "User not found for email: " + email  })
  }

  const newPassword = generatePassword()

  User.setPasswordForUser(user, newPassword)

  send_mail(
    email,
    'Password for Wifi Automation',
    `Hello ${user.fname}, you new Wifi Automation password is: ${newPassword}. Please login and change your password immediately`
  )
  
  res.success({ email })
})

/** Export the app */
module.exports = app;
