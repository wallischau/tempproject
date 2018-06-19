// Model imports

const TestSuite = require('../models/TestSuite.js');

module.exports = async function(done, fail, updateStatus) {
  try {
    await TestSuite.update(
      {name: "802.11ac Wave 2"},
      {
        "$set": {
          "test_suites.Realworld QoE": {
            "runner": "ixveriwave",
            "test_file": "/mnt/wifi_vol/SMART/test_suites/ixia/7.3.X/Wave2_PRD2_TCL/RealworldQOE/QOE.tcl",
            "test_cases": {
              "QoE_24_20": {
                "enabled": {
                  "retail": true,
                  "spectrum": true,
                  "res_com": true,
                  "currently": false
                },
                "flow_name": "Flow A"
              },
              "QoE_5_40": {
                "enabled": {
                  "retail": true,
                  "spectrum": true,
                  "res_com": true,
                  "currently": false
                },
                "flow_name": "Flow B"
              },
              "QoE_5_80": {
                "enabled": {
                  "retail": true,
                  "spectrum": true,
                  "res_com": true,
                  "currently": false
                },
                "flow_name": "Flow C"
              }
            }
          }
        }
      }
    );
  } catch (err) {
    return fail(err.toString());
  }

  done();
};
