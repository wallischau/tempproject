// Check to make sure that necessary libraries can be used
var checkLibs = require('./loader/checklibs.js');
var nodemon = require('nodemon');
var colors = require('colors');

/**
 * Environment
 * -----------
 * Determine what kind of environment we're under. The two possible options
 * are 'prod' or 'dev'
 *
 * Import settings for the development environment
 */
const conf = process.argv.includes('--prod') ? 'prod' : process.argv.includes('--test') ? 'test' : 'dev';
console.log('Using ' + conf.white.bold + ' environment settings');
var settings = require(`./env/${conf}.conf.json`);

// If we are in 'dev' mode, we will want to run bootstrap.js with nodemon
if (settings.reload) {

  var migrateIndex = process.argv.indexOf('--migrate');
  
  if (migrateIndex >= 0) {
    process.argv[migrateIndex] = '--migrate-' + (new Date()).getTime();
  }

  nodemon({
    
    // Script to run
    script: 'bootstrap.js',
    
    // Arguments
    args: process.argv.slice(2),
    
    // Extensions to monitor for change
    ext: 'js json'
    
  });

  nodemon.on('start', function () {
    var date = (new Date()).toString();
    var msg = `Nodemon :: ${date}`;
    console.log('');
    console.log(msg);
    console.log('-'.repeat(msg.length));
  }).on('quit', function () {
    // console.log('App has quit');
    process.exit();
  }).on('restart', function (files) {
    // console.log('App restarted due to: ', files);
  });
  
  // Nodemon opens STDIN for some reason
  process.stdin.destroy();
  
} else {
  // Directly call the file
  console.log('');
  require('./bootstrap.js');
}
