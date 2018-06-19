# AP_METRICS #

## Summary ##
This is the server that will be used to push **test results** and **testing device metrics** into MongoDB. This server also provides an interface for the **ui** front-end app. This includes:
* Logging in / Sessions
* Viewing test chamber status
* Viewing test results
* Scheduling automation tests

## Directory Structure ##
As a developer, you should only concern yourself with these directories:

|- **forms**: Defines form schema for form validation
|- **models**: Defines Mongoose models/schema for MongoDB objects
|- **urls**: URL route handlers(you'll be working with this the most)

## Directory: forms ##

The **forms** directory is used to define forms and form validation.

If you have ever used Angular 4, form validation is roughly based on that mechanism

The need for having form validators arises from all the logic and checks to deem a form valid

Here is a simple form:

```javascript
// Imports
var { Form, Validators } = require('../inc/form.js');

module.exports = Form.create({
    
  // Username may only have letters, 2-16 characters long
  username: [
    Validators.required, 
    Validators.trim, /* Removes leading and trailing whitespaces */
    Validators.pattern(/^[A-Za-z]{2,16}$/i)
  ],
  
  // Password must be between 6-16 characters in length
  password: [
    Validators.required, 
    Validators.pattern(/^.{6,16}$/i)
  ],
  
});
```

The alternative would be to use a series of if-else statements and manual function calls to sanitize the form

The use of form validators makes it clear and concise on what fields are necessary and the patterns required for each field. Additionally, they can be reused in any part of the code

#### Validating the form ####
Validating the form is possible one of two ways:

##### 1. Manual Validation #####
```javascript
var LoginForm = require('../forms/login.js');

var app = require('express')();

app

.post('/my-form', function(req, res){

  // Feed it form data. This can be a JSON object that looks like:
  // { "username": "notv@lidname1234", "password": "thisisvalid" }
  
  // For this example, we'll use the POST body
  var formResults = LoginForm.validate(req.body);
  
  if (formResults.errors) {
  
    // Has errors
    // Errors is a dictionary with the name of the field as the key
    
    // Example:
    // { "username": ['Field is not in correct format'] }
    
    // This is a shortcut to send back an error
    res.error(formResults.errors);
    
  } else {
  
    // No errors! You can access the sanitized data with:
    // formResults.values.username
    // formResults.values.password
    res.success('Validation successful!');
  }
  
});

```

##### 2. Route shortcut #####
This method will ensure your route handler **DOES NOT** get called if form validation failed:
```javascript
var LoginForm = require('../forms/login.js');

var app = require('express')();

app

.form(LoginForm) // req.body is passed into LoginForm.validate()
.post('/my-form', function(req, res){
  res.send('Looks like your form passed validation!');
});

```
On validation fail, it will return the error back to the client

#### Defining custom validators ####

Custom validators may be defined. Here is an example validator:
```javascript
/** filename: lowercase.js */
module.exports = function(formObj, field, value) {
  
  //
  // formObj.set(field, value) - Sets the value of another field
  // formObj.get(field)        - Gets the value of another field
  //
  
  // We're just testing a simple regular expression
  var regex = /^[a-z]+$/;
  
  // If we have an error, return a string with the error
  if (!regex.test(value)) return "Field is not lowercase";
  
  // If there are no errors, return null, or don't return anything!
  return null;
}
```

And it can be used the following way:

```javascript
var { Form, Validators } = require('../inc/form.js');
var checkAllLowercase = require('../inc/validators/lowercase.js');

module.exports = Form.create({
  "lowercase_field": [
    Validators.required,
    checkAllLowercase
  ]
})
```

## Directory: models ##

This directory carries Mongoose models to use for interfacing with MongoDB

Here is a simple schema for an Animal object

```javascript
/** filename: Animal.js **/

// Imports
var Model = require('../inc/model.js');

// Animal schema
module.exports = Model.create({
  
  /**
   * Schema
   * ------
   * Defines keys and variable types. The following are available:
   * String, Number, Date, Buffer, Boolean, Array, Object
   *
   * Additionally, these are also available:
   * Model.Mixed, Model.ObjectId
   *
   * For more information, 
   * visit: http://mongoosejs.com/docs/schematypes.html
   */
  "name": String,
  "type": String,
  "type": String,
  "age": Number
  
});
```

The name of the file is, by default, the name of the collections in MongoDB. 
Model name will be 'User', and the name of the collection will be 'users'

**Model name may not be changed. It will always be determined by name of file**

If you wish to change the name of the collection, append the name of the collection as the first parameter:

```javascript
/** filename: Animal.js **/

// Imports
var Model = require('../inc/model.js');

// Animal schema
module.exports = Model.create('myanimals', {
  
  /**
   * Schema
   * ------
   * Defines keys and variable types. The following are available:
   * String, Number, Date, Buffer, Boolean, Array, Object
   *
   * Additionally, these are also available:
   * Model.Mixed, Model.ObjectId
   *
   * For more information, 
   * visit: http://mongoosejs.com/docs/schematypes.html
   */
  "first_name": String,
  "last_name": String,
  "type": String,
  "age": Number
  
});
```

#### Query methods ####
To reiterate, we use Mongoose.

To see the entire Mongoose API, see [this link](http://mongoosejs.com/docs/api.html)

Cheat sheet:
```javascript
// Query for a list of objects
Animal.find({type: "dog"});

// Query for a single object
Animal.findOne({"first_name": "Spot"});

// Update a set of objects matching query
Animal.update({"type": "dog"}, {"$set": {"type": "cat"}});

// Update a single object matching query
Animal.findOneAndUpdate({"first_name": "Spot"}, {"$set": {"age": 10}})

// Remove a set of objects matching the query
Animal.remove({"type": "dog"});

// Remove one object matching the query
Animal.findOneAndRemove({"first_name": "Spot"});
```

#### Synchronous code ####
**WARNING**: Mongoose is asynchronous; it is callback driven. **DO NOT TREAT MONGOOSE CALLS AS SYNC/SERIAL WITHOUT USING ASYNC/AWAIT**

Mongoose methods return a JavaScript `Promise`, which is essentially a callback object for asynchronous operations

This will **NOT** work:
```javascript

function containerFunction() {
  let results = Animal.find();
  // "results" will have a Promise
  // This is not what we want!
}
```

Fortunately, modern JavaScript implementations have the `async` and `await` operations which allows us to treat asynchronous code as synchronous

This will work:
```javascript

// Notice the "async". We must tell the JavaScript engine
// that this is an asynchronous function so that it may be 
// put in its own execution container
async function containerFunction() {

  // Notice the "await" here
  let results = await Animal.find();
 
  // This block of code will pause until the operation is complete
  
  console.log('There are ' results.length + ' animals!');
 
}
```


#### Model methods ####

As of now, there are only **three** different types of methods. Those are:
* Instance methods (Ex: myAnimal.isOld())
* Static methods (Ex: Animals.getDogs())
* Getter methods (Ex: myAnimal.fullname)

The type of method is defined by its prefix. See below:

```javascript
/** filename: Animal.js **/

// Imports
var Model = require('../inc/model.js');

// Animal schema
module.exports = Model.create('myanimals', {
  
  /**
   * Schema
   * ------
   * Defines keys and variable types. The following are available:
   * String, Number, Date, Buffer, Boolean, Array, Object
   *
   * Additionally, these are also available:
   * Model.Mixed, Model.ObjectId
   *
   * For more information, 
   * visit: http://mongoosejs.com/docs/schematypes.html
   */
  "first_name": String,
  "last_name": String,
  "type": String,
  "age": Number
  
  /**
   * Methods
   * -------
   * Defines methods to be used for this model. Remember: 
   * 1) No prefix is an instance method
   * 2) @ prefix is a static method
   * 3) # prefix is a getter method
   */
   
  // Instance method
  "isOld": function() {
    return this.age > 10;
  }
  
  // Static method
  "@getDogs": async function() {
    // Even though it's not instantiated, we use "this" 
    // to refer to the current model
    return await this.find({"type": "dogs"});
  }
  
  // Getter method
  "#fullname": function() {
    return this.first_name + ' ' + this.last_name;
  }
  
});
```

## Directory: urls ##

This directory holds route handlers for the app. All HTTP requests will happen here. 

The name of the file will be the URL namespace. 

For example, if we have a file named `/urls/user.js`, the URL will be /user/route-inside-user-js

You may place folders within the `urls` directory to create more namespaces.

For example, if we have a file named `/urls/v1/user.js`, the URL will be /user/v1/route-inside-user-js 

#### Basic URL route handler ####
We use **ExpressJS** as our framework to define routes

What is required from the route handler is that its ExpressJS object be exported via `module.exports` after defining routes. This is so it can be connected to the main app

For example:

```javascript
/** filename: user.js */

/**
 * URL namespace: /user/
 *
 *  URLs: 
 *   - GET /user/hello-world
 */
 
// Imports
var express = require('express');
 
// Create the app. This app will be chained in the main ExpressJS app
var app = express();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

/** This begins the method chaining */
app

/**
 * GET /user/hello-world
 * ---------------------
 * Just a simple URL route
 */
.get('/hello-world', function(req, res) {
  res.send('Hello World!');
});

/** IMPORTANT: Export the app */
module.exports = app;
```

#### Route shortcuts ####
For convenience, there are various shortcuts you may use. They are informally called "decorators" because they resemble Django function decorators


##### form #####
We went over this one earlier

This allows a form to be validated **BEFORE** executing the route handler

Example:
```javascript
.form(LoginForm)
.post('/login', function(req, res) {
  res.send('LoginForm validation passed!');
});
```

If form validation failed, it will send an HTTP 400 Bad Request status with a JSON object containing the fields that threw an error


##### permissions #####
This ensures that a certain permission or attribute is present before completing the request

You may use `!` to negate the permission

Example:
```javascript
.permissions('login')
.get('/secret-area', function(req, res) {
  // Requires a login
  res.send('Welcome to the super secret club!');
})

.permissions('!login')
.get('/non-members', function(req, res) {
  // Requires a GUEST session
  res.send('You are a guest. Otherwise, you would not see this!');
});

.get('/public-area', function(req, res) {
  // Anyone can access this endpoint
  res.send('Anyone can access this... Nothing special...');
})
```

If the desired permission is not available on the client, it will send an HTTP 403 Forbidden status with a JSON object error "Permission denied"

##### REST #####
REST APIs typically have the ability to create, read, update, and delete entries from the database 

REST APIs achieve this by making use of HTTP verbs, such as POST, CREATE, PUT and DELETE

To simplify the creation of REST APIs, there are essentially 4 shortcuts that can achieve this

```javascript
.permissions('login')
.REST_create('/', Junk)

.REST_read('/', Junk)

.permissions('login')
.REST_update('/', Junk)

.permissions('login')
.REST_delete('/', Junk)
```

You can remember the operations by remembering **C.R.U.D.**
You can also remember them by understanding the function of each HTTP verb

This is also equivalent:

```javascript
.permissions('login')
.REST_post('/', Junk)

.REST_get('/', Junk)

.permissions('login')
.REST_put('/', Junk)

.permissions('login')
.REST_delete('/', Junk)
```
