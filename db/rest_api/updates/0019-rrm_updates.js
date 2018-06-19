// Model imports
const TestSuite = require('../models/TestSuite.js');
const Dut = require('../models/Dut.js');

async function addRrm() {
  let rrmDoc = {
    name: 'RRM',
    test_suites: {
      RRM: {
        runner: 'rrm',
        test_file: 'N/A',
        test_cases: {
          RRM: {
            enabled: {
              retail: true,
              spectrum: true,
              res_com: true,
              currently: false
            },
            flow_name: 'Flow A'
          }
        }
      }
    }
  }

  let currentRrmDoc = await TestSuite.findOne({name: rrmDoc.name});
  if (!currentRrmDoc) {
    await TestSuite.create(rrmDoc);
  }
}

async function fixMacAddresses() {
  await Dut.updateMany({mac_address: ''}, {$set: {mac_address: null}});

  let duts = await Dut.find({mac_address: {$ne: null}});

  for (let i in duts) {
    let dut = duts[i];
    
    let fixedMacAddress = null;
    if (dut.mac_address.includes(':')) {
      fixedMacAddress = dut.mac_address.toUpperCase();
    } else {
      fixedMacAddress = dut.mac_address.match(/.{1,2}/g)
        .join(':').toUpperCase();
    }

    if (fixedMacAddress != dut.mac_address) {
      dut.mac_address = fixedMacAddress;
      dut.save();
    }
  }
}

async function updateDutForDebug() {
  let mac_address = 'B0:EA:BC:C3:B5:EC'
  // let mac_address = 'B0:EA:BC:C3:B5:ED'
  await Dut.updateOne(
    {
      barcode_id: '1670'
    },
    {
      $set: {
        mac_address: mac_address
      }
    }
  );
}

module.exports = async function(done, fail, updateStatus) {
  try {
    // await addRrm();
    await fixMacAddresses();
    // await updateDutForDebug();
  } catch (err) {
    return fail(err.toString());
  }

  done();
};
