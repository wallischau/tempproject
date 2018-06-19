// Import Model
const TestSuite = require('./TestSuite.js');
const Model = require('../inc/model.js');
const Dut = require('./Dut.js');
const DutFirmware = require('./DutFirmware.js');
const User = require('./User.js');
const TestResult = require('./TestResult.js')
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

// Export the user schema
module.exports = Model.create('test_runs', {
  
  /**
   * Schema
   * ------
   * Defines keys and variable types. The following are available:
   * String, Number, Date, Buffer, Boolean, Array, Object
   *
   * Additionally, these are also available:
   * Model.Mixed, Model.ObjectId
   *
   * For more information, visit: http://mongoosejs.com/docs/schematypes.html
   */
  
  'id': Number,
  'directory': String,
  'notes': String,

  // 0 = No, 1 = Yes, 2 = Unknown
  'reboot': Number,
  
  'short_name': String,
  'test_start': Date,
  'test_end': Date,
  'tests': Number,
  'dut': {type: Model.ObjectId, ref:'Dut'},
  'firmware': {type: Model.ObjectId, ref:'DutFirmware'},
  'tests_planned': Number,
  'user': {type: Model.ObjectId, ref:'User'},
  'manual_import': Boolean,
  'topology': Object,
  'legacy': Boolean,
  'test_results':{
    'latency': [{
      type: Model.ObjectId, ref: 'latency_result'
    }],
    'max_client': [{
      type: Model.ObjectId, ref: 'max_client_result'
    }],
    'mixed_client': [{
      type: Model.ObjectId, ref: 'mixed_client_result'
    }],
    'multicast_video': [{
      type: Model.ObjectId, ref: 'multicast_video_result'
    }],
    'near_far': [{
      type: Model.ObjectId, ref: 'near_far_result'
    }],
    'packet_capture': [{
      type: Model.ObjectId, ref: 'packet_capture_result'
    }],
    'packet_loss': [{
      type: Model.ObjectId, ref: 'packet_loss_result'
    }],
    'rate_vs_range': [{
      type: Model.ObjectId, ref: 'rate_vs_range_result'
    }],
    'realworld_qoe': [{
      type: Model.ObjectId, ref: 'realworld_qoe_result'
    }],
    'reuse_of_airtime': [{
      type: Model.ObjectId, ref: 'reuse_of_airtime_result'
    }],
    'tcp_goodput': [{
      type: Model.ObjectId, ref: 'tcp_goodput_result'
    }],
    'triple_play': [{
      type: Model.ObjectId, ref: 'triple_play_result'
    }],
    'udp_throughput': [{
      type: Model.ObjectId, ref: 'udp_throughput_result'
    }],
    'unicast_video': [{
      type: Model.ObjectId, ref: 'unicast_video_result'
    }],
    'wmm_power_save': [{
      type: Model.ObjectId, ref: 'wmm_power_save_result'
    }]
  }
});
