// Model imports
const User = require('../models/User.js');
const TestResult = require('../models/TestResult.js');
const Latency = TestResult('latency');
const MaxClient = TestResult('max_client');
const MixedClient = TestResult('mixed_client');
const MulticastVideo = TestResult('multicast_video');
const NearFar = TestResult('near_far');
const PacketCapture = TestResult('packet_capture');
const PacketLoss = TestResult('packet_loss');
const RateVsRange = TestResult('rate_vs_range');
const RealworldQoe = TestResult('realworld_qoe');
const ReuseOfAirtime = TestResult('reuse_of_airtime');
const TcpGoodput = TestResult('tcp_goodput');
const TriplePlay = TestResult('triple_play');
const UdpThroughput = TestResult('udp_throughput');
const UnicastVideo = TestResult('unicast_video');
const WmmPowerSave = TestResult('wmm_power_save');

async function addResultsParsedFlag(updateStatus) {
  updateStatus('Adding flags to Latency'.bold.cyan);
  await Latency.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Max Client'.bold.cyan);
  await MaxClient.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Mixed Client'.bold.cyan);
  await MixedClient.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Multicast Video'.bold.cyan);
  await MulticastVideo.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Near Far'.bold.cyan);
  await NearFar.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Packet Capture'.bold.cyan);
  await PacketCapture.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Packet Loss'.bold.cyan);
  await PacketLoss.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Rate Vs Range'.bold.cyan);
  await RateVsRange.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Realworld QoE'.bold.cyan);
  await RealworldQoe.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Reuse Of Airtime'.bold.cyan);
  await ReuseOfAirtime.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to TCP Goodput'.bold.cyan);
  await TcpGoodput.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Triple Play'.bold.cyan);
  await TriplePlay.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to UDP Throughput'.bold.cyan);
  await UdpThroughput.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to Unicast Video'.bold.cyan);
  await UnicastVideo.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
  updateStatus('Adding flags to WMM Power Save'.bold.cyan);
  await WmmPowerSave.updateMany({}, {"$set": {"results_parsed": true, "runner": "ixveriwave"}});
}

async function addParserUser() {
  let email = 'parser.daemon@charter.com';
  let userid = 'dparser';
  let fname = 'daemon';
  let lname = 'parser';
  await User.remove({'email': email});

  await User.register(
    email,
    userid,
    fname,
    lname,
    true);
}

module.exports = async function(done, fail, updateStatus) {
  try {
    updateStatus('Adding flags for results parsing');
    await addResultsParsedFlag(updateStatus);
    await addParserUser();
  } catch (err) {
    return fail(err.toString());
  }

  done();
};
