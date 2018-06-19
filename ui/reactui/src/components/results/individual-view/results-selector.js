import React, { Component } from "react";

import SingleSelect from '../../app/single-select'

// import ViewPinTests from '../../components/results/pin-test-runs-viewer'


// I didn't make this .well css class, double check 

const test_type_lookup = [
  "tcp_goodput",
  "latency",
  "udp_throughput",
  "mixed_client",
  "max_client",
  "near_far",
  "triple_play",
  "unicast_video",
  "wmm_power_save",
  "realworld_qoe",
  "rate_vs_range",
  "packet_capture",
  "packet_loss",
  "multicast_video",
  "reuse_of_airtime"
].sort() // -_- 

class ResultsSelector extends Component {
  constructor(props) {
    super(props)
    this.state={ 
      show_options: false,
    } 
  }

  toggleOptions() {
    this.setState({ show_options: !this.state.show_options })
  }


  render() {
    const {
      firmwares, 
      firmware_id,
      firmwares_pending, 
      test_runs, 
      test_runs_pending, 
      test_run_id, 
      handleChange, 
      handleUserCheck, 
      handleTestTypeFilterCheck,
      filter_by_user,
      selected_test_types
    } = this.props

    return (
      <div className="results-selector well"> 
        <p className="select-header">Select Firmware:</p>
        {
          <div style={{ height: '50px' }}>
            {
              firmwares_pending ?
              <div>loading</div>
              :
              <SingleSelect
                value={firmware_id.toString()} 
                state_key={'firmware_id'} 
                options={firmwares} 
                handleChange={handleChange} 
              />
            }
          </div>
        }

        {
          (firmware_id !== 0) &&
          // list all test runs for that firm/type
          <div className="select-test-run" style={{ height: '70px' }}>
            <p className="select-header">Select Test Run:</p>
            {
              test_runs_pending ? 
              <div>loading...</div>
              :
              test_runs.length ?
                <SingleSelect 
                  value={test_run_id.toString()} 
                  state_key={"test_run_id"} 
                  handleChange={handleChange} 
                  options={test_runs} />
                :
                <div> No test runs found (check options) </div>
            }
          </div>
        }

        <button className='btn' style={{ marginTop: '7px' }}
          onClick={() => this.toggleOptions()}>
          {this.state.show_options ? 'Hide Options' : 'Show Options'}
        </button>

        {/* move these options to separate component? */}
        {
          this.state.show_options &&
          <div style={{ paddingTop:'30px' }}>
            {/* user checkbox */}
            <label style={{ border:'1px solid black', background: filter_by_user && '#ccffcc', padding: '5px' }}>
              Only Show My Test Runs
              <input
                type="checkbox" 
                checked={filter_by_user}
                onChange={handleUserCheck}
                style={{ width: 'initial', display: 'none' }}
              />
            </label>

            {/* test type check boxes */}
            <div style={{ marginTop: '10px'}}>
              <p style={{ textDecoration: 'underline', marginBottom:'10px' }}>
                Only show these test types:
              </p>
              {
                test_type_lookup.map(tt => {
                  const test_selected = selected_test_types.indexOf(tt) >= 0
                  return (
                    <label key={tt} style={{ display: 'block', background: test_selected && '#ccffcc', padding: '5px' }}>
                      {tt.split('_').map(s => s.charAt(0).toUpperCase() + s.slice(1)).join(' ')}
                      <input
                        type="checkbox"
                        name={tt}
                        checked={test_selected}
                        onChange={handleTestTypeFilterCheck}
                        style={{ display: 'none' }}              
                      />
                    </label>
                  )
                })
              }
            </div>
          </div>
        }
      </div>
    )
  }
}


export default ResultsSelector
