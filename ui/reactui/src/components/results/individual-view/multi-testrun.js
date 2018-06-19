import React from 'react';

import * as PacketLoss from './test-type-results/packet-loss'
import * as RateVRange from './test-type-results/rate-v-range'
import * as UDP from './test-type-results/udp'
import * as TCP from './test-type-results/tcp'
import * as MixedClient from './test-type-results/mixed-client'
import * as MaxClient from './test-type-results/max-client'
import * as NearFar from './test-type-results/near-far'
import * as Latency from './test-type-results/latency'
import * as Unicast from './test-type-results/unicast-video'
import * as PacketCapture from './test-type-results/packet-capture'
import * as TriplePlay from './test-type-results/triple-play'
import * as RealQoE from './test-type-results/real-qoe'
import * as WMMPowerSave from './test-type-results/wmm-power-save'
import * as MulticastVideo from './test-type-results/multicast-video'
import * as ReuseOfAirtime from './test-type-results/reuse-of-airtime'

import ErrorsDisplay from './errors-section' //// Needs review -- move this up to the results page index.js
import ErrorBoundary from '../../app/error-boundary'


const test_type_lookup = {
  "tcp_goodput": TCP, 
  "latency": Latency, /// test test
  "udp_throughput": UDP,
  "mixed_client": MixedClient,
  "max_client": MaxClient,
  "near_far": NearFar,
  "triple_play": TriplePlay,
  "unicast_video": Unicast,
  "wmm_power_save": WMMPowerSave,
  "realworld_qoe": RealQoE, //// needs testing with working results 
  "rate_vs_range": RateVRange,
  "packet_capture": PacketCapture, ///// This needs a redo of the data processing
  "packet_loss": PacketLoss,
  "multicast_video": MulticastVideo,	
  "reuse_of_airtime": ReuseOfAirtime
}


class TestRunResults extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      test_types_in_run: Object.keys(props.test_results).map((tt, i, a) => ({ type: tt, show: a.length === 1 }))
    }
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.directory !== nextProps.directory) { // if it's a new test run, reset the results display
      this.setState({
        test_types_in_run: Object.keys(nextProps.test_results).map((tt, i, a) => ({ type: tt, show: a.length === 1 }))
      })
    }
  }

  toggleSection(type_obj) {
    const res_index = this.state.test_types_in_run.indexOf(type_obj)
    const new_runs = this.state.test_types_in_run.slice()
    new_runs.splice(res_index, 1, { ...type_obj, show: !type_obj.show })
    this.setState({ test_types_in_run: new_runs })
  }

  showAll() {
    const new_runs = this.state.test_types_in_run.slice().map(tt_obj => ({ ...tt_obj, show: true }))
    this.setState({ test_types_in_run: new_runs })    
  }

  render() {
    return (
      <div className="results-details"> 
        <button style={{ padding: '20px', display: this.state.test_types_in_run.length <= 1 && 'none' }} onClick={() => this.showAll()}>Expand all</button>
        {
          this.state.test_types_in_run.map(type_obj => {
            const test_type = type_obj.type
            const PRDComponent = test_type_lookup[test_type].PRDSection
            const DataComponent = test_type_lookup[test_type].DataSection

            const all_errors = this.props.test_results[test_type].reduce((out, tr) => {
              if(tr.errors && tr.errors.length > 0) {
                if(out[tr.test_name]) console.log('DUPLICATE TEST NAMES!!!!!!!!!!!!!! ') ////// 
                out[tr.test_name] = tr.errors
              }
              return out
            }, {})

            /// consider filtering/mapping here? universial formatting.... may not work as is
            const result_data = this.props.test_results[test_type]
            
            return <div key={test_type}>
              <h1
                style={{ border: '1px solid black', textAlign: 'center', padding: '10px', background: '#0066cc', color: '#f5f5f5', cursor: 'pointer' }}
                onClick={() => this.toggleSection(type_obj)}
              >
                {test_type.split('_').map(s => s.charAt(0).toUpperCase() + s.slice(1)).join(' ') + (type_obj.show ? ' -': ' +')}
              </h1>
              <div style={{ display: !type_obj.show && 'none' }}>
                {/* errors */}
                {
                  !!Object.keys(all_errors).length && 
                  <ErrorsDisplay errors={all_errors} />
                }
                <ErrorBoundary>
                  <PRDComponent  data={result_data} />
                  <DataComponent data={result_data} />
                </ ErrorBoundary> 
              </div>
            </div>
          })
        }
      </div>  

    )
  }
}


export default TestRunResults
