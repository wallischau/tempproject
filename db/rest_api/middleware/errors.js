module.exports = function(app) {
  
  // This is the initialization code
  
  
  // This is the actual middleware
  return function(err, req, res, next) {
  
    const COLOR_RED = '\x1b[31m\x1b[1m';
    const COLOR_RESET = '\x1b[0m';
  
    console.log('\r\n', COLOR_RED + '' + err.toString(), err.stack, COLOR_RESET);
    console.log('\r\n ^^^ FYI, you have an error\r\n'.yellow.bold);
    
    res.error(err.toString());
    
    next();
  }
  
}
