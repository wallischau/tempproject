/**
 * Verify Libraries
 * ----------------
 * Added exception handling to catch any incorrect installation and warn the 
 * developer that he/she must run 'npm install' to obtain libraries
 */

// Get libraries from package.json
var packagejson = require('../package.json'); 
const LIBRARY_NAMES = Object.keys(packagejson.dependencies);

// Console colors
const COLOR_RED = '\x1b[31m\x1b[1m';
const COLOR_WHITE = '\x1b[37m\x1b[1m';
const COLOR_GREEN = '\x1b[32m\x1b[1m';
const COLOR_RESET = '\x1b[0m';

var failed = 0;

console.log('');

console.log('I will now check the following modules:');

LIBRARY_NAMES.some(moduleName => {
  
  process.stdout.write(
    `  - Loading module ${COLOR_WHITE}${moduleName}${COLOR_RESET}... `
  );
  
  try {
    require(moduleName);
    process.stdout.write(`${COLOR_GREEN}OK!${COLOR_RESET}\r\n`);
  } catch(e) {
    failed |= 1;
    process.stdout.write(`${COLOR_RED}FAILED${COLOR_RESET}\r\n`);
  }
});


process.stdout.write(
  `  - Checking ${COLOR_WHITE}async/await${COLOR_RESET} support... `
);
try {
  eval('async function a() {;}');
  process.stdout.write(`${COLOR_GREEN}OK!${COLOR_RESET}\r\n`);
} catch(e) {
  process.stdout.write(`${COLOR_RED}FAILED${COLOR_RESET}\r\n`);
  failed |= 2;
}


if (failed) {
  console.error('');
  
  if ((failed & 1)) {
    
    // Failed library check
    
    console.error(
      COLOR_RED,
      'You do not appear to have the proper libraries installed',
      COLOR_RESET,
    );
    
    console.error(
      COLOR_RED,
      `Run ${COLOR_WHITE}"npm install"${COLOR_RED} on the project ` +
      `directory, then try again`,
      COLOR_RESET
    );
    console.log('');
  }
  
  if ((failed & 2)) {
    
    // Failed async check
    
    console.error(
      COLOR_RED + ((failed & 1) ? ' Additionally,' : ''),
      'async/await is not supported in your version of node',
      COLOR_RESET,
    );
    
    console.error(
      COLOR_RED,
      `Please ${COLOR_WHITE}upgrade${COLOR_RED} your version of NodeJS to`,
      `at least version ${COLOR_WHITE}7.4.0`,
      COLOR_RESET,
    );
    
  }
  
  
  process.exit();
}

console.log('');