const express = require('express');
const exec = require('child_process');
const app = express();

app.listen(80);

app.get('/scan-ssids', function (req, res)  {
  if (!req.query.ixversion) {
    req.query.ixversion = '7.3.3';
  }
  var params = req.query.ixversion + ' ' +
               req.query.ip + ' ' +
               req.query.slot + ' ' +
               req.query.port + ' ' +
               req.query.frequency + ' ' +
               req.query.channel;
  const executeString = './python/ssid_scan.py ' + params;
  console.log('executeString');
  console.log(executeString);
  exec.exec(executeString, function(error, stdout, stderr) {
    var ret = [];
    stdout.split('\n').forEach(function (line) {
        var linePiece = line.split(' ');
        if (linePiece.length == 3) {
          ret.push(linePiece);
        }
    });
    console.log(ret);
    if (ret.length != 0) {
      res.send(ret);
    } else {
      res.send([]);
    }
  });
});

app.get('/release-ports', function (req, res) {
  if (!req.query.ixversion) {
    req.query.ixversion = '7.3.3';
  }
  var params = req.query.ixversion + ' ' +
               req.query.ip + ' ' +
               req.query.slot + ' ' +
               req.query.port;

  const executeString = './python/release_ports.py ' + params;
  console.log('executeString');
  console.log(executeString);
  exec.exec(executeString, function(err, stdout, stderr) {
    var ret = null;
    console.log('stdout');
    console.log(stdout);
    ret = stdout;
    res.send(ret);
  });
});
