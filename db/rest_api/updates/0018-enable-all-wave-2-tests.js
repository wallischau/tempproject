// Model imports

const TestSuite = require('../models/TestSuite.js');

async function enableNearFar() {
  let near_far_updates = require('./data/0018-near_far.json');

  await TestSuite.update(
    {name: "802.11ac Wave 2"},
    {
      "$set": {
        "test_suites.Near Far": near_far_updates
      }
    }
  );
}

async function enableTriplePlay() {
  let triple_play_updates = require('./data/0018-triple_play.json');

  await TestSuite.update(
    {name: "802.11ac Wave 2"},
    {
      "$set": {
        "test_suites.Triple Play": triple_play_updates
      }
    }
  );
}

module.exports = async function(done, fail, updateStatus) {
  try {
    await enableNearFar();
    await enableTriplePlay();
  } catch (err) {
    return fail(err.toString());
  }

  done();
};
