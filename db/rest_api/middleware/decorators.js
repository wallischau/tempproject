/**
 * 
 */
 
const fs = require('fs');
const path = require('path');
const SHORTCUT_DIR = path.resolve(__dirname, 'decorators'); 
const LOAD_EXTENSION = '.js';

/**
 * Apply route change
 *
 * @param {Express} app - The ExpressJS app to modify
 * @param {String} method - HTTP method
 *
 * @return Does not return a value
 */
function applyShortcut(app, method) {

  let originalFn = app[method];
  
  app[method] = function() {
    
    if (this._shortcut.fn.length) {
      
      // This is where we apply the shortcut function
      let fnList = this._shortcut.fn;
      let originalHandler = arguments[1];
      
      // We are replacing the original callback
      arguments[1] = function() {
        
        // We're now inside the URL handler
        
        let argList = Array.from(arguments);
        let lastFn = Function.apply.bind(originalHandler, this, arguments);
        
        let callList = [];
        
        // next() for asynchronous callback
        let i = 0;
        let nextFn = function() {
          var exec = callList[i++];
          exec();
        };
        
        // Add all the "decorators" to callList
        fnList.forEach(({fn, args}) => {
          var newArgList = [args].concat(argList);
          newArgList[newArgList.length - 1] = nextFn;
          var newFn = Function.apply.bind(fn, this, newArgList);
          callList.push(newFn);
        });
        
        // This is the route handler
        callList.push(lastFn);
        
        // Start executing decorators
        nextFn();
        
      }

      // Reset shortcut list; we already specified a handler for a URL
      this._shortcut.fn = [];
    }
    
    // Apply the original HTTP method function(use/all/get/post/etc)
    return originalFn.apply(this, arguments);
  }
  
}

/**
 * Modifies route method
 *
 * @param {Express} app - ExpressJS app
 */
function routerModifier(app) {
  
  const HTTP_METHODS = [
    'get',
    'put',
    'patch',
    'post',
    'delete'
  ];
  
  HTTP_METHODS.forEach(method => applyShortcut(app, method));
  
}

/**
 * Installs a shortcut to ExpressJS' __proto__(vTable)
 *
 * @param {Express} app - ExpressJS app
 * @param {String} name - Name of the function
 * @param {Function} callback - Function to associate
 *
 * @return Does not return a value
 */
function installShortcut(app, name, callback) {
  
  let expressMethodTable = app.__proto__;
  
  expressMethodTable[name] = function() {
    
    var funcDesc = {
      fn: callback,
      args: Array.from(arguments)
    };
    
    if (typeof(this._shortcut) === 'undefined') {
      this._shortcut = {fn: [funcDesc]}
      routerModifier(this);
    } else {
      this._shortcut.fn.push(funcDesc);
    }
    
    return this;
    
  };
  
}
 
module.exports = function(app) {
  
  let dir = fs.readdirSync(SHORTCUT_DIR);
  
  dir.forEach(file => {
    
    // Only process files with extension ".js"
    if (path.extname(file) == LOAD_EXTENSION) {
      
      let fileNoExt = path.basename(file, LOAD_EXTENSION);
      let shortcutModule = require(path.resolve(SHORTCUT_DIR, file));
      
      installShortcut(app, fileNoExt, shortcutModule);
      
    }
  });
  
}
