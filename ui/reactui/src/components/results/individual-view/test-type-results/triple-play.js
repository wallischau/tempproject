import React, { Component } from 'react';
import ReactTable from 'react-table';
import { LineChart } from 'react-chartkick';

import SingleSelect, { handleChangeSingleSelect } from '../../../app/single-select'
import { pass_rate_columns, performace_columns } from '../prd-columns'


const columns = [
  {
    Header: 'Config',
    columns: [
      {
        Header: 'Frequency',
        accessor: 'data.ghz'
      }, {
        Header: 'Bandwith', 
        accessor: 'data.mhz'
      }
    ]
  }, {  
    Header: 'Data', 
    // original averaging logic
    // accessor: d => (d.data.reduce((out, cur) => (out + cur.packet_loss*1), 0)) / d.data.length
    
    columns: [
      {
        Header: 'Latency', 
        accessor: 'data.latency'
      }, {
        Header: 'Jitter',
        accessor: 'data.jitter'
      }, {
        Header: 'Packet Loss',
        accessor: 'data.packet_loss'
      }, {
        Header: 'Forwarding Rate',
        id: 'frd',
        accessor: d => (d.data.forwarding_rate_kbps*1).toLocaleString()
      }
    ]
  }, {
    Header: 'Video', 
    columns: [
      {
        Header: 'Latency', 
        accessor: 'video.latency'
      }, {
        Header: 'Jitter', 
        accessor: 'video.jitter'
      }, {
        Header: 'Packet Loss', 
        accessor: 'video.packet_loss'
      }, {
        Header: 'Forwarding Rate',
        id: 'frvideo',
        accessor: d => (d.video.forwarding_rate_kbps*1).toLocaleString()
      }
    ]
  }, {
    Header: 'Voice', 
    columns: [
      {
        Header: 'Latency', 
        accessor: 'voice.latency'
      }, {
        Header: 'Jitter', 
        accessor: 'voice.jitter'
      }, {
        Header: 'Packet Loss', 
        accessor: 'voice.packet_loss'
      }, {
        Header: 'Forwarding Rate',
        id: 'frvoice',
        accessor: d => (d.voice.forwarding_rate_kbps*1).toLocaleString()
      }
    ]
  }
]


const gen_prd_pass_rate = (data, total_errors) => {
  
  const table_row = {
    criteria: 'WMM Layer2/3 Triple Play',
    achieved: null,
    passed: 0,
    failed: 0,
    aborted: total_errors,
    total: total_errors
  }

  for (let index = 0; index < data.length; index++) {
    const result = data[index]

    for (let ghzKey in result.data) {
      let dataRes = result.data[ghzKey];
      let videoRes = result.video[ghzKey];
      let voiceRes = result.voice[ghzKey];
      
      table_row.total++

      if ((dataRes.forwarding_rate_kbps < videoRes.forwarding_rate_kbps) 
          && (videoRes.forwarding_rate_kbps < voiceRes.forwarding_rate_kbps)) {
        table_row.passed++;
      } else {
        table_row.failed++;
      }
    }
  }

  table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'

  return [table_row]
}

const gen_performace_data = (data) => {
  // go thru, pass/fail per each mcs
  /// need way to get criteria into here? and also Store criteria
  const resultData = {
    'data': {
      'latency': {
        criteria: 'Data - <= 1000ms latency',
        passed: 0,
        total: 0
      },
      'jitter': {
        criteria: 'Data - <= 500ms jitter',
        passed: 0,
        total: 0
      },
      'packet_loss': {
        criteria: 'Data - <= 50% packet loss',
        passed: 0,
        total: 0
      }
    },
    'video': {
      'latency': {
        criteria: 'Video  <= 1000ms latency',
        passed: 0,
        total: 0
      },
      'jitter': {
        criteria: 'Video  <= 500ms jitter',
        passed: 0,
        total: 0
      },
      'packet_loss': {
        criteria: 'Video  <= 10% packet loss',
        passed: 0,
        total: 0
      }
    },
    'voice': {
      'latency': {
        criteria: 'Voice  <= 50ms latency',
        passed: 0,
        total: 0
      },
      'jitter': {
        criteria: 'Voice  <= 20ms jitter',
        passed: 0,
        total: 0
      },
      'packet_loss': {
        criteria: 'Voice  <= 1% packet loss',
        passed: 0,
        total: 0
      }
    }
  }

  for (let index = 0; index < data.length; index++) {
    const result = data[index]

    /// data
    for (let typeKey in result) {
      let expectedLatency = null;
      let expectedJitter = null;
      let expectedPacketLoss = null;
      switch (typeKey) {
        case 'data':
          expectedLatency = 1000;
          expectedJitter = 500;
          expectedPacketLoss = 500;
          break
        case 'video':
          expectedLatency = 1000;
          expectedJitter = 500;
          expectedPacketLoss = 10;
          break
        case 'voice':
          expectedLatency = 50;
          expectedJitter = 20;
          expectedPacketLoss = 1;
          break
        default:
          break
      }
      
      for (let ghzKey in result[typeKey]) {
        let curRes = result[typeKey][ghzKey];
        if (curRes.latency <= expectedLatency) {
          resultData[typeKey].latency.passed++
        }
        resultData[typeKey].latency.total++
        if (curRes.jitter <= expectedJitter) {
          resultData[typeKey].jitter.passed++
        }
        resultData[typeKey].jitter.total++
        if (curRes.packet_loss <= expectedPacketLoss) {
          resultData[typeKey].packet_loss.passed++
        }
        resultData[typeKey].packet_loss.total++
      }
    }
  }


  return [
    resultData.data.latency,
    resultData.data.jitter,
    resultData.data.packet_loss,
    resultData.video.latency,
    resultData.video.jitter,
    resultData.video.packet_loss,
    resultData.voice.latency,
    resultData.voice.jitter,
    resultData.voice.packet_loss
  ]
}

const dataPreMap = (data) => {
  return data.reduce((out, cur) => {
    if (!!cur.data) {
      out.filtered_data.push(cur.data)
    } else {
      out.error_data.push(cur)
    }
    return out
  }, { filtered_data: [], error_data: [] })
}

export const PRDSection = (props) => {
  const { filtered_data, error_data } = dataPreMap(props.data)
  const total_errors = error_data.length

  let prd_pass_rate_data
  let prd_performance_criteria_data
  
  try {
    prd_pass_rate_data = gen_prd_pass_rate(filtered_data, total_errors)
    prd_performance_criteria_data = gen_performace_data(filtered_data)
  } catch (error) {
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">

        <div className="prd-header">Charter SLA: Triple Play Required Percent Pass Rate</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Triple Play Performance Criteria</div> 
        {/* a summary, ?? consistent between test_types? */}
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_performance_criteria_data} 
          columns={performace_columns}
          showPagination={false}
          defaultPageSize={prd_performance_criteria_data.length}
        />

      </div>
    </section>
  )
}


/// overtime graph not allways there
export class DataSection extends Component {
  constructor(props) {
    super(props)
    this.state = {
      selected_test_index: '0'
    }

    this.handleChange = handleChangeSingleSelect.bind(this)
  }

  componentWillReceiveProps(nextProps) {
    // reset graph on enw props
    if (nextProps.test_run_id !== this.props.test_run_id){
      this.setState({ selected_test_index: '0' })
    }
  }

  render() {
    const data = this.props.data.map(r => Object.assign({}, r.data, { test_name: r.test_name }))

    // Transform data to be an array so we can easily set up the ReactTable
    // Break out the 2.4 and 5 results into 
    let fixedData = [];
    for (let i = 0; i < data.length; i++) {
      let currentData = data[i];
      // past this point, 'data' refers to the set of results for the web traffic data testings
      if (!currentData.data) {
        // no data to use, skip
        continue
      }
      let ghzKeys = Object.keys(currentData.data);

      for (let j in ghzKeys) {
        let tempData = {
          test_name: currentData.test_name
        }
        let ghzKey = ghzKeys[j];
        tempData.voice = currentData.voice[ghzKey];
        tempData.video = currentData.video[ghzKey];
        tempData.data = currentData.data[ghzKey];
        fixedData.push(tempData);
      }
    }

    const show_overtime_graph = fixedData[0].voice.hasOwnProperty('overtime') &&
                                fixedData[0].voice.overtime.length > 0;
    const typeKeys = ['data', 'voice', 'video'];
    const all_line_data = [];

    if (show_overtime_graph) {
      for (let i = 0; i < fixedData.length; i++) {
        const result_data = fixedData[i];
        // data, voice, video,, 2.4 and 5 ghz (ghz within sub-sections)
        const line_data = [];
        for (let j = 0; j < typeKeys.length; j++) {
          let typeKey = typeKeys[j];
          line_data.push({
            test_name: result_data.test_name,
            name: `${result_data[typeKey].ghz} ${result_data[typeKey].mhz} ${result_data[typeKey].mcs} ${typeKey}`,
            data: result_data[typeKey].overtime.reduce((out, cur, i) => {
              out[i + 1] = cur;
              return out;
            }, {})
          });
        }

        all_line_data.push(line_data)
      }
    }

    return (
      <section className="results-section">
        <h2>Test Data</h2>
        <div className="results-inner-section">
          {
            show_overtime_graph && <div>
            <p>Select Test</p>
              <SingleSelect 
                state_key='selected_test_index'
                value={this.state.selected_test_index}
                handleChange={this.handleChange}
                options={all_line_data.map((d, i)=> ({ id: i, display: d[0].test_name }))}
              />
              <LineChart 
                data={all_line_data[this.state.selected_test_index]} 
                height={600}
              /> 
            </div>
          }

          <div style={{ height: '50px' }} /> 
          {/* data here needs to be flattened to display all. currently only look at the top result per type */}
          <ReactTable 
            data={fixedData}
            columns={columns}
            showPagination={false}
            defaultPageSize={fixedData.length}
            className="-striped -highlight"
          />
        </div>
      </section>
    )
  }
}
