const http = require('http')
const path = require("path")
// Create the app. This app will be chained in the main ExpressJS app
var app = require('express')();
const chprocess = require('child_process');

app.put('/', function (req, res)  {
  var info = req.body
  let params = ""
  for (var i = info.portRangeStart; i <= info.portRangeEnd; i++){
    params += i + " " + info.attenuation + " "
  }
  const executeString = __settings.pythonExe + ' ' + path.normalize('./../../controllers/jfw_attenuator/jfw.py') + " " + info.ip + ' 3001 --set ' + params
  chprocess.exec(executeString, function(error, stdout, stderr){
    if (stderr){
      res.error(stderr)
    }
    else {
      res.success("successfully set jfw");
    }
  });
})

.get('/', function (req, res) {

  var info = req.query
  let params = ""
  for (var i = parseInt(info.begin); i <= parseInt(info.end); i++){
    params += i + " "
  }
  const executeString = __settings.pythonExe + ' ' + path.normalize('./../../controllers/jfw_attenuator/jfw.py') + " " + info.ip + ' 3001 --get ' + params
  chprocess.exec(
    executeString,
    {timeout: 5000},
    function(error, stdout, stderr) {
      if (error) {
        res.error(error);
      } else if (stderr) {
        res.error(stderr)
      } else if (stdout.includes("ERROR")) {
        res.error(stdout)
      } else {
        res.success(stdout);
      }
    }
  );
});
module.exports = app;