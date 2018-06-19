var Splitter = require('../models/Splitter.js');

// Update 
//
/*"barcode_id": String,
"attenuation_1": Number,
"attenuation_2": Number*/
module.exports = function(done) {
  
  var splitters = [
    {barcode_id: "abc123", attenuation_1: 17, attenuation_2: 10},
    {barcode_id: "def456", attenuation_1: 34, attenuation_2: 5}
  ];  

  Splitter.insertMany(splitters).then(function(result) {
    done();
  });
  
};