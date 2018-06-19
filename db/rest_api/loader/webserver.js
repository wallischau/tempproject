/**
 * Ladies and Gentlement,
 *
 * This file is responsible for creating the webserver. Now, this seems like
 * a very obvious task. There are some steps that need to be taken before the
 * webserver can be created:
 *
 *   0. Webserver configurations are located in the appropriate ".conf" file
 *      in "../env/*.conf.json"
 *
 *   1. Create the ExpressJS "app" object and load "official" middleware. For
 *      those unfamiliar with ExpressJS, the "app" object holds all the routes 
 *      and rules to serve HTTP requests. In other words, it's the webserver
 *
 *   2. Create the SocketIO "io" object and load "official" middleware. For 
 *      those unfamiliar with ExpressJS, the "io" object is a NodeJS
 *      EventEmitter object containing WebSocket events 
 * 
 *   3. start(): Load the session store middleware using MongoDB. Session store
 *      helps us implement sessions and logins
 *
 *   4. loadMiddleware(): Load any custom middleware(../middleware/*.js) with 
 *      order defined in "load-order.json"
 *
 *      a) Middleware with 2 arguments(socket, next) is a SocketIO middleware
 *      b) Middleware with 3 arguments(req,res,next) is a regular middleware
 *      c) Middleware with 4 arguments(err,req,res,next) is an error middleware
 *
 *         i] Error middleware will actually get loaded after "loadUrls" is
 *            called
 *
 *   5. loadUrls(): Load URL routes from "../urls", preserving namespace/folder 
 *      structure
 *
 *   6. loadSocketIOEvents(): Loads SocketIO events. This step is necessary for
 *      loading the events into the connected sockets
 *
 *   7. Instantiate the webserver
 *
 *      a) ALWAYS instantiates an HTTP instance
 *      b) If SSL certificate is supplied via "http.ssl.certificate" and 
 *         "http.ssl.private_key", an HTTPS instance is created
 * 
 *         i] If "http.ssl.force" option is set to "true", the HTTP instance 
 *            will be replaced by a redirect. Otherwise, the app will be served
 *            both on HTTP and HTTPS
 *
 */

// Imports
var express = require('express');
var bodyParser = require('body-parser');
var expressSession = require('express-session');
var MongoStore = require('connect-mongo')(expressSession);
var fs = require('fs');
var mongoose = require('mongoose');
var path = require('path');
var http = require('http');
var https = require('https');

// SocketIO!
var SocketIO = require('socket.io');

// Constants
const MIDDLEWARE_DIR   = './middleware';
const URL_DIR   = './urls';

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Error Handling                                                             //
// --------------                                                             //
// Asynchronous code can throw errors that go unhandled. This will display    //
// an error on the screen to notify the developer that the exception *should* //
// be handled within code                                                     //
//                                                                            //
// In future releases of NodeJS, this will cause the node instance to close.  //
// To prevent that, we'll add this error handler in here                      //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
process.on('unhandledRejection', function(err, p) {
  
  console.log(
    '\r\nHere is the error:'.yellow.bold, 
    err.toString().bold.red,
    
    ('\n,' + err.stack.toString()).replace(/\,/gi, '\n =>'.bold.cyan + ' ').replace(/(\s[A-Za-z0-9\s_<>\[\].]+\s)(\(.+\))/gi, '$1'.bold.red + '$2'.red)
  );
  console.log(
    '\r\n ^^^ AN UNHANDLED EXCEPTION HAS OCCURED ^^^\r\n'.yellow.bold
  );
  
});

////////////////////////////////////////////////////////////////////////////////
//                             THE OTHER STUFF                                //
////////////////////////////////////////////////////////////////////////////////

// Create the ExpressJS app
var app = express();

// Create the SocketIO app
var io = SocketIO();
app.__proto__.io = io;

// This middleware parses POST body
app.use(bodyParser.json({limit: '50mb'}));

// if we need CORS, then we've been hacked. Let's disable it for all requests. 
// app.use(function(req, res, next) {
//   res.header("Access-Control-Allow-Origin", "*");
//   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//   next();
// });

// This middleware parses sessions
// We have split this out so that we can use this same middleware for SocketIO
let expressSessionMiddleware = expressSession({
  
  // Secret used for signing cookies
  secret: 'supersecret',
  
  // *do not* force sessions to be saved when no modifications were made
  resave: false,
  
  // *do not* create a cookie for empty sessions
  saveUninitialized: false,
  
  // Use mongoose for our session store
  store: new MongoStore({ 
    mongooseConnection: mongoose.connection
  })
  
});

// This initializes and injects websockets into ExpressJS
let socketIoSessionMiddleware = function(socket, next) {
  expressSessionMiddleware(socket.request, socket.request.res, next);
}

// Apply middleware to their respective interfaces
app.use(expressSessionMiddleware);
io.use(socketIoSessionMiddleware);
  
// Error handling middleware
let errorHandlers = [];

/**
 * Converts a time postfix "s/m/h/d" into its correct time representation in 
 * milliseconds
 *
 * @param {String} str - Time postfix 
 * @return {Number} returns the represented time in milliseconds
 */ 
function parseTimeFormat(str) {
  
  const TIME_PREFIX = {
    "s": 1000,
    "m": (60) * 1000,
    "h": (60 * 60) * 1000,
    "d": (60 * 60 * 24) * 1000
  }
  
  var prefix = str[str.length - 1];
  
  return parseInt(str) * TIME_PREFIX[prefix];
  
}

////////////////////////////////////////////////////////////////////////////////
//                        CODE EXECUTION WILL BEGIN HERE                      //
////////////////////////////////////////////////////////////////////////////////

/**
 * Starts the process of creating the webserver
 *
 * @param {Object} conf - HTTP configuration from the "../env/*.conf.json" file
 *
 * @return {Promise} returns a promise object for method chaining
 *
 */
function start(conf) {
  
  // This middleware parses sessions
  app.use(expressSession({
    
    // Secret used for signing cookies
    secret: 'supersecret',
    
    // *do not* force sessions to be saved when no modifications were made
    resave: false,
    
    // *do not* create a cookie for empty sessions
    saveUninitialized: false,
    
    // Set the cookie expiration date(should be defined in env settings)
    cookie: { "maxAge": parseTimeFormat(conf.session.expires) },
    
    // Use mongoose for our session store
    store: new MongoStore({ mongooseConnection: mongoose.connection })
    
  }));
  
  // Refactored this section... It should be easier to track the flow of this 
  // file
  return new Promise((resolve, reject) => {
    
    // Middleware may not be included in the "load-order.json" file. Warn the 
    // developer that it must be added
    let warnings = loadMiddleware(MIDDLEWARE_DIR);
    
    // Then load the URLs...
    loadUrls(URL_DIR);
    
    // Then load SocketIO events...
    loadSocketIOEvents(app._io);
    
    // serve the site static files for UI
    app.use(express.static(path.join(__dirname,  '..', 'build')));
    
    // if not an api path, send the index.html 
    app.get('*', (req, res, next) => {
      let filepath = path.join(__dirname, '..', 'build', 'index.html');
      if (fs.existsSync(filepath)) {
        res.sendFile(filepath);
      } else {
        next();
      }
    })
    
    //
    // During loadMiddleware(), there may have been some error handlers. Error
    // handlers must be one of the last middleware added to be properly 
    // executed. This is because everything in ExpressJS is actually a 
    // middleware
    //
    //      flow : [request parsers] -> [route handlers] -> [error handlers]
    // arguments :         3                   2-3                 4
    //
    // The chain is one-way so there would be no way for us to forward the 
    // request to an error handler
    //
    loadErrorHandlers();
    
    // Finally, launch the server!
    launchServer(conf).then(() => {
      resolve(warnings);
    }).catch(e => {
      reject(e);
    });
    
  });
}

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Middleware                                                                 //
// ----------                                                                 //
// Middleware are functions that execute before the request is passed to the  //
// primary request handler                                                    //
//                                                                            //
// Example of middleware include HTTP access logs and session handler         //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/**
 * Loads middleware into ExpressJS app. Error middleware will be stored in 
 * "errorHandlers" global variable
 *
 * @param {String} middlewareDir - The directory containing middleware
 * 
 * @return {Array} Returns an array of warnings to be displayed in bootstrap.js
 */
function loadMiddleware(middlewareDir) {
  
  var loadOrder = require(`.${middlewareDir}/load-order.json`);
  var filesMissing = fs.readdirSync(middlewareDir);
  var warnings = [];
  
  // Filter out files that have not been added to load-order.json
  filesMissing = filesMissing.filter( 
    file => (
      // Filter out non-javascript files
      path.extname(file) == '.js' && 
      
      // Filter out javascripts that are in the /middleware directory
      !loadOrder.includes(path.basename(file, '.js')) 
    )
  );
  
  // Create a warning for each file not included in load-order.json
  filesMissing.forEach(
    file => warnings.push(
      `Middleware "${file}" is not in /middleware/load-order.json`
    )
  );
  
  // Load middleware
  loadOrder.forEach(
    file => {
      file = path.basename(file, '.js') + '.js';
      if (fs.existsSync(`${middlewareDir}/${file}`)) {
        
        var middleware = require(`.${middlewareDir}/${file}`);
        var callback = middleware(app, io);
        
        if (callback) {
          
          // Check how many parameters the function has
          if (callback.length == 4) {
            // This is an error handler. We must apply this at the end
            errorHandlers.push(callback);
          } else if (callback.length == 3) {
            // This in an ExpressJS middleware handler
            app.use(callback);
          } else if (callback.length == 2) {
            // This is a SocketIO middleware handler
            io.use(callback);
          }
        }
        
      } else {
        warnings.push(
          `Middleware "${file}" in /middleware/load-order.json does not exist`
        );
      }
    }
  );
  
  return warnings;
  
}

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// URL Namespaces                                                             //
// --------------                                                             //
// ReactUI will be communicating with this backend; all the backend should do //
// is parse requests(GET/POST), interface with MongoDB, and return JSON back  //
// to the client                                                              //
//                                                                            //
// To simplify the process of adding in URLs, we'll keep source files inside  //
// the '/smart/db/rest_api/urls' folder. The name of the source  file will be //
// the name of the namespace                                                  //
//                                                                            //
// For example, if the file is named 'user.js', the URL namespace will be     //
// '/user/'                                                                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/**
 * Loads URL routes into the Express app
 *
 * @param {String} dir - Directory to use for scanning and loading URLs
 */
function loadUrls(dir) {
  
  let files = fs.readdirSync(dir);

  // Process directory files
  files.forEach(file => {
    
    let fullPath = path.resolve(__dirname, "..", dir, file);
    let relPath = '.' + path.join('/', dir, file);
    
    if (fs.lstatSync(fullPath).isDirectory()) {
      // Continue
      loadUrls(relPath);
      return;
    }
    
    // File without the extension
    let fileNoExt = file.slice(0, -3);
    
    // File extension
    let ext = file.substr(-3);
    
    if (ext == '.js') {
      
      // This is a javascript file. Let's import it!
      let importedFile = null;
      try {
        importedFile = require(fullPath);
      } catch (e) {
        
        // Insert notice into the stack. For some reason, errors thrown in a 
        // file before fully loaded do not have a filename...
        e.stack.splice(0, 0, 'Error while loading file (' + fullPath + ')');
        
        // ...And re-raise the exception so our handlers can catch it 
        throw e;
        
      }
      
      // Callback to process import
      if (importedFile && typeof(importedFile) === 'function') {
        
        // This is an ExpressJS object
        let namespace = dir.substr(URL_DIR.length).replace(/\\/gi, '/');
        app.use(`${namespace}/${fileNoExt}/`, importedFile);
        
      } else if (importedFile.sockets && importedFile.sockets._events) {
        
        // This is a SocketIO object
        let events = importedFile.sockets._events;
        
        // Iterate through the events and add them to the main SocketIO app
        if (!app._io) {
          app._io = {};
        }
        
        for(event in events) {
          if (!app._io[event]) {
            app._io[event] = [];
          }
          
          app._io[event].push(events[event]);
        }
        
        // Replace the importedFile SocketIO interface with the main 
        // one. This is to provide API compatibility from examples so
        // that the developer can do "io.emit"
        Object.assign(importedFile, io);
        
      }
      
    }
    
  });
 }

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Socket IO events                                                           //
// -----------------                                                          //
// SocketIO events against a client socket. At the higher level, nd should do //
// is parse requests(GET/POST), interface with MongoDB, and return JSON back  //
// to the client                                                              //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/**
 * Load SocketIO events from include files
 *
 * @param {Object} events - An object containing events and callbacks
 */
function loadSocketIOEvents(events) {
  io.on('connection', function(socket){
    
    // Apply the event handlers
    for(event in events) {
      
      let eventHandlers = events[event];
      
      for(let i = 0; i < eventHandlers.length; i++) {
        // "this" will be the socket
        socket.on(event, eventHandlers[i].bind(null, socket));
      }
      
    }
    
    // Emit the 'connect' event
    socket.emit('connect');
    
  });
}
 
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Error Handlers                                                             //
// --------------                                                             //
// The error handlers are essentially middleware that execute at the end.     //
//                                                                            //
// These handle the errors that route handlers throw                          //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/**
 * Loads error handlers into Express app
 */
function loadErrorHandlers() {
  errorHandlers.forEach(handler => app.use(handler));
}
 
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Launch Server                                                              //
// -------------                                                              //
// All the necessary files should be loaded. It's time to launch the Express  //
// server!                                                                    //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/**
 * Attempts to launch an HTTP, and if configured, an HTTPS server
 * 
 * @param {Object} conf - Configuration object from a "../env/*.conf.json" file
 */
function launchServer(conf) {
  
  return new Promise((resolve, reject) => {
    
    // Inline function. This will create the HTTP instance
    let createHttp = function(expressApp) {
      
      let httpServer = http.createServer(expressApp);
      
      httpServer.listen(conf.port, function(err) {
        
        if (err) {
          reject(err);
        } 
        
        resolve();
        
        io.attach(httpServer);
        
      }).on('error', err => {
        reject(err.toString());
      });
      
    };
    
    
    
    // ... Now onto the code!
    
    
    // This is where this function begins executing
    if (conf.ssl) {
      
      //
      //
      // HTTPS support enabled!
      //
      //
      
      // We'll be in this section if we defined an SSL certificate in ".conf"
      // file
      
      let ssl = conf.ssl;
      let cert = ssl.certificate;
      let key = ssl.private_key;
      
      // Check that the certificates exist. Otherwise, throw errors
      if (!fs.existsSync(cert)) {
        return reject(`Certificate not found: "${cert}"`);
      } else if (!fs.existsSync(key)) {
        return reject(`Private key not found: "${key}"`);
      }
      
      // Certificate and private key both exist. Load them up
      cert = fs.readFileSync(cert);
      key = fs.readFileSync(key);
      
      // We can feed an ExpressJS object to NodeJS' "https" library since 
      // the object signature is compatiable with both "http" and "https"
      let httpsServer = https.createServer({key, cert}, app);
      
      httpsServer.listen(ssl.port, err => {
        
        if (err) {
          return reject(err);
        }
        
        if (ssl.force) {
        
          // SSL will be forced. Any HTTP requests should be forwarded to the 
          // HTTPS instance
        
          let redirect = express();
          redirect.all('*', (req, res) => {
            res.set('Location', 'https://' + req.headers['host'] + req.url);
            res.status(301).end();
          });
          
          createHttp(redirect);
        
        } else {
          
          // SSL will not be forced. App can be accessed through regular HTTP
          createHttp(app);
          
        }
        
        // Attach SocketIO to HTTP instance
        io.attach(httpsServer);
        
      }).on('error', err => {
        reject(err.toString());
      });
      
    } else {
      
      //
      //
      // No HTTPS support specified. Serve the app through regular HTTP
      //
      //
      
      
      // Create the app through HTTP
      createHttp(app);
      
      
    } 
    
  });
}

////////////////////////////////////////////////////////////////////////////////
//              EXPORT "start". THIS IS WHAT BOOSTRAP.JS WILL CALL            //
////////////////////////////////////////////////////////////////////////////////
module.exports = {
  start
};
