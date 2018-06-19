const http = require('http')
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();

/**
 * URL patterns
 * ------------
 * Define the URL and HTTP methods here
 */

app.get('/', function(req, res) {
	//req.query has ip, slot, channel, etc
	let query = req.query;
	let url = 'http://10.0.39.6/scan-ssids?ip=' + query['ip'] +
            '&slot=' + query['slot'] +
            '&port=' + query['port'] +
            '&channel=' + query['channel'] +
            '&frequency=' + query['frequency'] +
            '&ixversion=7.3.3';
            
  if (process.platform == 'win32') {
    url = url.replace('10.0.39.6', '96.37.190.131:8406');
  }

  let timeoutWrapper = function(request) {
    return function() {
      request.abort();
    }
  }
  let responded = false;
  let sendResponse = function(message, isError) {
    if (!responded) {
      if (isError) {
        res.error(message);
      } else {
        res.success(message);
      }
      responded = true;
    }
  }

  let scanRequest = http.get(url, function(response) {
    let scanData = [];

    response.on('data', function(data) {
      scanData += data;
      clearTimeout(timeout);
      timeout = setTimeout(fn, 5000);
    }).on('end', function() {
      scanData = JSON.parse(scanData);
      clearTimeout(timeout);
      sendResponse(scanData, false);
    }).on('error', function(err) {
      clearTimeout(timeout);
      sendResponse(err, true);
    })
    
	}).on('error', function(err) {
    sendResponse(err, true);
  });

  let fn = timeoutWrapper(scanRequest);

  let timeout = setTimeout(fn, 5000);
});

// Export the app
module.exports = app;