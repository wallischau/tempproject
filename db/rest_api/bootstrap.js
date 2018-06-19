/**
 * Bootstrap
 * ---------
 * The meat and potatoes of the server code. This is the file responsible
 * for setting up the entire server environment. It will do one of 3 things:
 *
 *   1. Connect to the MongoDB instance
 *   2. Apply any necessary update scripts
 *   3. Start the webserver
 *
 * Even though this is the main file, you should use still use "npm start" 
 * or "node start" because they instantiate Nodemon, which restarts the server
 * every time there is a code change
 */
var db = require('./loader/db.js');
var webserver = require('./loader/webserver.js');
var updates = require('./loader/updates.js');
var colors = require('colors');

// Checks to make sure we don't call update more than twice. This helps prevent
// errors when working on an update, because the Nodemon will reload the 
// server when it detects any file changes
const canUpdate = -1 != process.argv.findIndex(e => {
  
  // Either --migrate-123 (Running under Nodemon to prevent repeated updates)
  // Or --migrate (Running directly)
  var regex = /--migrate-?([0-9]*)/i;
  
  var result = e.match(regex);
  if (result) {
    const UPDATE_TIME_THRESHOLD = 5 * 1000;
    
    const then = result[1];
    
    if (then.length) {
      // We chave a time. The script is executing under nodemon
      const now = (new Date()).getTime();
      
      if ((now - then) < UPDATE_TIME_THRESHOLD) {
        return true;
      }
    } else {
      // We did not have the time. Script is executing directly
      return true;
    }
  }
  return false;
});

// Get environment
const conf = process.argv.includes('--prod') ? 'prod' : process.argv.includes('--test') ? 'test' : 'dev';
var settings = require(`./env/${conf}.conf.json`);
global.__settings = settings

const COLOR_RED = '\x1b[31m\x1b[1m';
const COLOR_RESET = '\x1b[0m';

/**
 * First step of the bootstrap process.
 * Connects to a MongoDB instance. Errors when it cannot
 *
 * If successful, moves on to startUpdates()
 *
 * @return Does not return a value
 */
function startDatabase() {
  
  process.stdout.write(
    'Connecting to ' + 
    `mongodb://${settings.mongo.host}:${settings.mongo.port}/`.white.bold + 
    `${settings.mongo.database}: `.white.bold
  );
  
  db.start(settings.mongo).then(function(){
  
    // Successfully connected to the database
  
    process.stdout.write('OK!\r\n'.green.bold);    
    startUpdates();
  
  }).catch(function(err){
    
    // Failed to connect. Display error
    
    process.stdout.write('FAILED\r\n'.red.bold);
    console.log(
      '\r\nHere is the error:'.yellow.bold, 
      COLOR_RED, err, COLOR_RESET
    );
    
  });
  
}

/**
 * Checks for updates. If the "--migrate" flag is used, then it will apply
 * the necessary updates, if any. Errors when an update cannot be applied
 *
 * Otherwise, continues to startWebserver()
 *
 * @returns Does not return a value
 */
function startUpdates() {
  
  updates.check().then(function(updateList) {
  
    if (updateList.length) {
      
      // We have updates. Should we execute update? (--migrate flag)
      if (canUpdate) {
        
        // Yes we can!
        // There are updates, and we have permission to apply them
        
        console.log('\r\nI am now applying updates:'.white.bold);
        
        // Asynchronous code can be difficult to manage...
        var performNextUpdate = function() {
          
          // Essentially a left pop
          var update = updateList.splice(0,1)[0];
          
          if (update) {
            
            // There are updates remaining. Apply the update
            
            // Updates the text during an update. Useful for large data 
            // migrations
            var largestLine = 0;
            var lineText = `  - ${update}: `.yellow.bold;
            var onUpdate = function(message) {
              
              message = lineText + message;
              
              
              // Replace the control/color characters
              let len = message.replace(/\x1b\[[0-9]+m/gi, '').length;
              
              let spaces = Math.max(largestLine - len, 0);
              
              process.stdout.write('\r' + message + ' '.repeat(spaces) + '');
              
              largestLine = Math.max(largestLine, len);
              
            }
            
            // The initial line
            onUpdate('');
            
            updates.apply(update, onUpdate).then(function(messages){
              
              // Successfully applied the update
              onUpdate('OK!'.green.bold);
              console.log('');
              
              messages.forEach(msg => {
                console.log('    -', msg.white.bold);
              });
              
              performNextUpdate();
              
            }).catch(function(err){
              
              // There was an error within the update file
              onUpdate('FAILED!'.red.bold);
              console.log('');
              
              console.log(
                '\r\nHere is the error:'.yellow.bold, 
                COLOR_RED, err, COLOR_RESET
              );
              
            });
            
          } else {
            
            // There are no more updates. Proceed to start webserver
            
            console.log('');
            startWebserver();
          }
        }
        
        // Start applying updates
        performNextUpdate();
        
      } else {
        
        // There are updates, but we cannot apply THEM
        // Warn the developer that some updates need to run
        
        console.log(
          '\r\nWARNING: '.yellow.bold +
          'The following updates still need to be applied:'
        );
        
        updateList.forEach(
          update => console.log(`  - ${update}`.white.bold)
        );
        
        console.log(
          '\r\nRun '.yellow.bold + '"npm run migrate" '.white.bold + 
          'or'.yellow.bold + ' "node start --migrate" '.white.bold + 
          'to apply the necessary updates\r\n'.yellow.bold
        );
        
        startWebserver();
        
      }
    } else {
      
      // There are no updates to apply
      
      startWebserver();
    }
    
  });
  
}

/**
 * Starts the webserver. Errors when it cannot
 *
 * @return Does not return a value
 */
function startWebserver() {
  
  process.stdout.write(
    'Starting webserver at port ' + 
    settings.http.port.toString().white.bold + ': '
  );
  
  webserver.start(settings.http).then(function(warnings){
    
    // Webserver has started
    
    if (warnings.length) {
      
      // There are warnings. Display them
      
      process.stdout.write('WARNING\r\n\r\n'.yellow.bold);
      warnings.forEach( 
        warning => console.log(warning.yellow.bold)
      );
      
    } else {
      
      // No warnings. We are all good!
      
      process.stdout.write('OK!\r\n'.green.bold);
    }
    
  }).catch(function(err){
    
    // There was an error
    if (!err.stack) {
      err = {"stack": err.toString()};
      err.toString = () => new String(err['stack']);
    }
    
    process.stdout.write('FAILED!\r\n'.red.bold);
    console.log(
      '\r\nHere is the error:'.yellow.bold, 
      err.toString().bold.red,
      
      ('\n,' + err.stack.toString()).replace(/\,/gi, '\n =>'.bold.cyan + ' ').replace(/(\s[A-Za-z0-9\s_<>\[\].]+\s)(\(.+\))/gi, '$1'.bold.red + '$2'.red)
    );
    
  });
}

// Let's start the server!
startDatabase();