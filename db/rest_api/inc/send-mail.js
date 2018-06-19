// Imports
var querystring = require('querystring');
var http = require('http');

// This is the function for sending email
module.exports = function(email, subject, body) {
  
  return new Promise((resolve, reject) => {
    
    // This is the POST data
    var post_data = querystring.stringify({email, subject, body});

    // An object of options to indicate where to post to
    var post_options = {
      host: '96.37.189.6',
      port: '80',
      path: '/api/sendmail/',
      method: 'POST',
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded',
        "Content-Length": Buffer.byteLength(post_data),
        "X-Email-Key": 'D0FF4DF9C3823208F6AF8906100A843D7CC5C4CD'
      }
    };

    // Set up the request
    var post_req = http.request(post_options, function(res) {
      
      var buf = '';
      
      res.on('data', function (chunk) {
        buf += chunk;
      });
      
      res.on('end', function() {
        buf = JSON.parse(buf);
        if (buf.success) {
          resolve();
        } else {
          reject(buf.msg);
        }
      });
      
    });

    // post the data
    post_req.write(post_data);
    post_req.end();
    
  
  });
  
};