import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'
import { udp_pf } from '../../pass-fail-functions'


const small_width = 100
const smaller_width = 75
const smallest_width = 50

const columns_UP_DOWN = [
  {
    Header: 'Configuration',
    columns: [
      {
        Header: 'IPv',
        id: 'ipv',
        accessor: d => d.ipv && d.ipv.join('/'),
        width: smallest_width
      }, {
        Header: 'GHz',
        id: 'ghz',
        accessor: d => d.ghz && d.ghz.join('/'),
        width: smallest_width
      }, {
        Header: 'MHz',
        id: 'mhz',
        accessor: d => d.mhz && d.mhz.join('/'),
        width: smallest_width
      }, {
        Header: 'Clients', 
        accessor: 'clients',
        width: smallest_width
      }, {
        Header: 'MCS',
        id: 'mcs',
        accessor: d => d.mcs && d.mcs.join('/'),
        width: smallest_width
      }, {
        Header: 'SS', 
        accessor: 'ss', 
        width: smallest_width
      }, {
        Header: 'Direction', 
        accessor: 'direction',
        width: smallest_width
      }, {
        Header: 'Retry',
        id: 'retry',
        accessor: d => d.retry ? 'Yes' : 'Unknown', 
        width: smallest_width
      }
    ], 
  }, {
    Header: '64/88 Frame',
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.64.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.64.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.64.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '128 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.128.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.128.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.128.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '256 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.256.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.256.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.256.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '512 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.512.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.512.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.512.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '1024 Frame',
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.1024.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.1024.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.1024.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '1518 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.1518.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.1518.actual_mbps',
        width: small_width
      }, {
        Header: '% Theo',
        accessor: 'frame_size_results.1518.percentage',
        width: small_width
      }
    ]
  }
]

const columns_BI = [
  {
    Header: 'Configuration',
    columns: [
      {
        Header: 'IPv',
        id: 'ipv',
        accessor: d => d.ipv && d.ipv.join('/'),
        width: smallest_width
      }, {
        Header: 'GHz', 
        id: 'ghz',
        accessor: d => d.ghz && d.ghz.join('/'),
        width: smallest_width
      }, {
        Header: 'MHz', 
        id: 'mhz',
        accessor: d => d.mhz && d.mhz.join('/'),
        width: smallest_width
      }, {
        Header: 'Clients', 
        accessor: 'clients',
        width: smallest_width
      }, {
        Header: 'MCS', 
        id: 'mcs',
        accessor: d => d.mcs && d.mcs.join('/'),
        width: smallest_width
      }, {
        Header: 'SS', 
        accessor: 'ss', 
        width: smallest_width
      }, {
        Header: 'Retry',
        id: 'retry',
        accessor: d => d.retry ? 'Yes' : 'Unknown', 
        width: smallest_width
      }
    ], 
  }, {
    Header: '64/88 Frame',
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.64.theoretical_mbps',
        width: smaller_width
      }, {
        Header: 'Actual', 
        accessor: 'frame_size_results.64.actual_mbps',
        width: smaller_width
      }, {
        Header: '% Theo', 
        accessor: 'frame_size_results.64.percentage',
        width: smaller_width        
      }, {
        Header: 'Up', 
        accessor: 'frame_size_results.64.up_mbps',
        width: smaller_width        
      }, {
        Header: 'Down', 
        accessor: 'frame_size_results.64.down_mbps',
        width: smaller_width    
      }, {
        Header: '% Diff', 
        accessor: 'frame_size_results.64.diff',
        width: smaller_width    
      }
    ]
  }, {
    Header: '128 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.128.theoretical_mbps',
        width: smaller_width
      }, {
        Header: 'Actual', 
        accessor: 'frame_size_results.128.actual_mbps',
        width: smaller_width
      }, {
        Header: '% Theo', 
        accessor: 'frame_size_results.128.percentage',
        width: smaller_width        
      }, {
        Header: 'Up', 
        accessor: 'frame_size_results.128.up_mbps',
        width: smaller_width        
      }, {
        Header: 'Down', 
        accessor: 'frame_size_results.128.down_mbps',
        width: smaller_width    
      }, {
        Header: '% Diff', 
        accessor: 'frame_size_results.128.diff',
        width: smaller_width    
      }
    ]
  }, {
    Header: '256 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.256.theoretical_mbps',
        width: smaller_width
      }, {
        Header: 'Actual', 
        accessor: 'frame_size_results.256.actual_mbps',
        width: smaller_width
      }, {
        Header: '% Theo', 
        accessor: 'frame_size_results.256.percentage',
        width: smaller_width        
      }, {
        Header: 'Up', 
        accessor: 'frame_size_results.256.up_mbps',
        width: smaller_width        
      }, {
        Header: 'Down', 
        accessor: 'frame_size_results.256.down_mbps',
        width: smaller_width    
      }, {
        Header: '% Diff', 
        accessor: 'frame_size_results.256.diff',
        width: smaller_width    
      }
    ]
  }, {
    Header: '512 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.512.theoretical_mbps',
        width: smaller_width
      }, {
        Header: 'Actual', 
        accessor: 'frame_size_results.512.actual_mbps',
        width: smaller_width
      }, {
        Header: '% Theo', 
        accessor: 'frame_size_results.512.percentage',
        width: smaller_width        
      }, {
        Header: 'Up', 
        accessor: 'frame_size_results.512.up_mbps',
        width: smaller_width        
      }, {
        Header: 'Down', 
        accessor: 'frame_size_results.512.down_mbps',
        width: smaller_width    
      }, {
        Header: '% Diff', 
        accessor: 'frame_size_results.512.diff',
        width: smaller_width    
      }
    ]
  }, {
    Header: '1024 Frame',
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.1024.theoretical_mbps',
        width: smaller_width
      }, {
        Header: 'Actual', 
        accessor: 'frame_size_results.1024.actual_mbps',
        width: smaller_width
      }, {
        Header: '% Theo', 
        accessor: 'frame_size_results.1024.percentage',
        width: smaller_width        
      }, {
        Header: 'Up', 
        accessor: 'frame_size_results.1024.up_mbps',
        width: smaller_width        
      }, {
        Header: 'Down', 
        accessor: 'frame_size_results.1024.down_mbps',
        width: smaller_width    
      }, {
        Header: '% Diff', 
        accessor: 'frame_size_results.1024.diff',
        width: smaller_width    
      }
    ]
  }, {
    Header: '1518 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.1518.theoretical_mbps',
        width: smaller_width
      }, {
        Header: 'Actual', 
        accessor: 'frame_size_results.1518.actual_mbps',
        width: smaller_width
      }, {
        Header: '% Theo', 
        accessor: 'frame_size_results.1518.percentage',
        width: smaller_width        
      }, {
        Header: 'Up', 
        accessor: 'frame_size_results.1518.up_mbps',
        width: smaller_width        
      }, {
        Header: 'Down', 
        accessor: 'frame_size_results.1518.down_mbps',
        width: smaller_width    
      }, {
        Header: '% Diff', 
        accessor: 'frame_size_results.1518.diff',
        width: smaller_width    
      }
    ]
  }
]

const columns_ETH = [
  {
    Header: 'Configuration',
    columns: [
      {
        Header: 'Eth Type',
        accessor: 'traffic_flow',
        width: smallest_width
      }, {
        Header: 'Direction', 
        accessor: 'direction',
        width: smallest_width
      }, {
        Header: 'Retry',
        id: 'retry',
        accessor: d => d.retry ? 'Yes' : 'Unknown', 
        width: smallest_width
      }
    ], 
  }, {
    Header: '64/88 Frame',
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.64.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.64.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.64.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '128 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.128.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.128.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.128.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '256 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.256.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.256.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.256.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '512 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.512.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.512.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.512.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '1024 Frame',
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.1024.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.1024.actual_mbps',
        width: small_width
      }, {
        Header: '%',
        accessor: 'frame_size_results.1024.percentage',
        width: small_width
      }
    ]
  }, {
    Header: '1518 Frame', 
    columns: [
      {
        Header: 'Theo',
        accessor: 'frame_size_results.1518.theoretical_mbps',
        width: small_width
      }, {
        Header: 'Actual',
        accessor: 'frame_size_results.1518.actual_mbps',
        width: small_width
      }, {
        Header: '% Theo',
        accessor: 'frame_size_results.1518.percentage',
        width: small_width
      }
    ]
  }
]

const prd = {
  measurement_criteria: {
    'Upstream (WiFi - Eth)': { compare_func:{}, matcher: { direction: 'US' } }, 
    'Downstream (Eth - WiFi)': { matcher: { direction: 'DS' } },
    'Bidirectional': { matcher: { direction: 'BI' } },
    // 'Ethernet (LAN-LAN)': { matcher: { interface: 'eth' } },
    //// ADD ETHERNET TOO!
    'Frequency: 2.4GHz': { matcher: { ghz: '2.4' } },
    'Frequency: 5GHz': { matcher: { ghz: '5' } },
    'Dual-Band Concurrent': { matcher: { ghz: '2.4/5' } },
    'Channel Bandwidth: 20MHz': { matcher: { mhz: '20' } },
    'Channel Bandwidth: 40MHz': { matcher: { mhz: '40' } },
    'Channel Bandwidth: 80MHz': { matcher: { mhz: '80' } },
    '802.11ac Spatial Streams: 1': { matcher: { ss: '1', interface: '802.11ac' } },
    '802.11ac Spatial Streams: 2': { matcher: { ss: '2', interface: '802.11ac' } },
    '802.11ac Spatial Streams: 3': { matcher: { ss: '3', interface: '802.11ac' } },
    '802.11ac Spatial Streams: 4': { matcher: { ss: '4', interface: '802.11ac' } },
  }
}


const gen_prd_pass_rate = (data) => {
  const bundled_raw_results = Object.assign({}, prd.measurement_criteria)
  Object.keys(bundled_raw_results).forEach(k => bundled_raw_results[k] = [])

  // Iterate thru all the result data
  for (let i = 0; i < data.length; i++) {
    const res_point = data[i]
    const res_point_keys = Object.keys(res_point)
    // For each data result point, go thru the criteria and check if the result belongs within that criteria.
    // Some res_points will end up in multiple criteria groups.
    Object.keys(bundled_raw_results).forEach(criteria => {
      // matcher object holds the key/values that all res_points must also contain to be included in the criteria group
      const matcher = prd.measurement_criteria[criteria].matcher
      const matcher_keys = Object.keys(matcher)

      // all keys defined in the prd need to match, let's count them down if they pass
      let key_matches = matcher_keys.length 
      matcher_keys.forEach(mkey => {
        const res_key_full = Array.isArray(res_point[mkey]) ? res_point[mkey].join('/') : res_point[mkey]

        /// if the matcher key is in the res_point_keys, then check the matcher value
        if (res_point_keys.indexOf(mkey) !== -1) {
          if (res_key_full === matcher[mkey]) { 
            // this key matches up! check one key match is off the list
            key_matches--
          }
        }
      })

      // if all keys matched, add the full res_point to the criteria array
      if (key_matches === 0) {
        bundled_raw_results[criteria].push(res_point)
      }

    })
  }
  

  /// calc pass/fail for each results 'bucket' // This could move up to loop above in future
  const pass_rate_data = []


  Object.keys(bundled_raw_results).forEach(criteria => {
    const table_row = {
      description: 'UDP Throughput', 
      criteria, // <<
      achieved: null,
      passed: 0,
      failed: 0,
      aborted: '?', ///
      total: 0 
    }


    bundled_raw_results[criteria].forEach(res => {
      table_row.total++
      if (udp_pf(res)) {
        table_row.passed++
      } else {
        ////////////// ABORTS = FAIL. old system had aborts and failures separate 
        table_row.failed++
      }
    })

    table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'
    pass_rate_data.push(table_row)
  })

  
  return pass_rate_data
}

const dataPreMap = (data) => {
  return data.reduce((out, cur) => {
    if (!!cur.data) {
      out.filtered_data.push(Object.assign({}, cur.data, { test_name: cur.test_name }))
    } else {
      out.error_data.push(cur)
    }
    return out
  }, { filtered_data: [], error_data: [] })
}

const gen_performace_data = (data) => {
  // go thru, pass/fail per each mcs
  /// need way to get criteria into here? and also Store criteria


  const tr_theo_max_6488 = {
    criteria: '>= 10% of Theoretical Max on frame size 64/88',
    passed: 0,
    total: 0
  }
  const tr_theo_max_128 = {
    criteria: '>= 34% of Theoretical Max on frame size 128',
    passed: 0,
    total: 0
  }
  const tr_theo_max_256 = {
    criteria: '>= 54% of Theoretical Max on frame size 256',
    passed: 0,
    total: 0
  }
  const tr_theo_max_512 = {
    criteria: '>= 75% of Theoretical Max on frame size 512',
    passed: 0,
    total: 0
  }
  const tr_theo_max_1024 = {
    criteria: '>= 80% of Theoretical Max on frame size 1024',
    passed: 0,
    total: 0
  }
  const tr_theo_max_1518 = {
    criteria: '>= 85% of Theoretical Max on frame size 1518',
    passed: 0,
    total: 0
  }
  const tr_up_down_diff = {
    criteria: '<= 10% difference between Upstream and Downstream on Bidirectional results',
    passed: 0,
    total: 0
  }
  //////////////// 
  const check_fsr = (fsr, frame_size, compare_val, table_row) => {
    if (fsr[frame_size]) {
      table_row.total++
      if(fsr[frame_size].percentage >= compare_val) {
        table_row.passed++
      }
    }
  }

  data.forEach(res => {
    const fsr = res.frame_size_results

    check_fsr(fsr, '64', 10, tr_theo_max_6488)
    check_fsr(fsr, '88', 10, tr_theo_max_6488)
    check_fsr(fsr, '128', 34, tr_theo_max_128)
    check_fsr(fsr, '256', 54, tr_theo_max_256)
    check_fsr(fsr, '512', 75, tr_theo_max_512)
    check_fsr(fsr, '1024', 80, tr_theo_max_1024)
    check_fsr(fsr, '1518', 85, tr_theo_max_1518)

    if (res.direction === 'BI') {
      const fsr_keys = Object.keys(fsr)
      for (let index = 0; index < fsr_keys.length; index++) {
        tr_up_down_diff.total++
        if(fsr[fsr_keys[index]].diff <= 10) {
          tr_up_down_diff.passed++
        }
      }
    }

  })

  return [
    tr_theo_max_6488, 
    tr_theo_max_128, 
    tr_theo_max_256, 
    tr_theo_max_512, 
    tr_theo_max_1024,
    tr_theo_max_1518,
    tr_up_down_diff
  ]
}

export const PRDSection = (props) => {

  const { filtered_data, error_data } = dataPreMap(props.data)
  const total_errors = error_data.length

  let prd_pass_rate_data
  let prd_performance_criteria_data

  try {
    // pass in error_data in too, use that to calc aborts per criteria
    prd_pass_rate_data = gen_prd_pass_rate(filtered_data)
    prd_performance_criteria_data = gen_performace_data(filtered_data)
  } catch (error) {
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">

        <div className="prd-header">Charter SLA: UDP Goodput Required Percent Pass Rate</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">UDP Goodput Performance Criteria</div> 
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

export const DataSection = (props) => {
  const raw_data = props.data.map(r => {
    return Object.assign({}, r.data, { test_name: r.test_name })
  })

  const upDown_data = []
  const bi_data = []
  const eth_data = []

  for (let i = 0; i < raw_data.length; i++) {
    //// skip results with no results data
    /// perhaps, should separate results data and test meta data (direction)
    if (!raw_data[i]['frame_size_results']) {
      continue
    }
    if (('88' in raw_data[i]['frame_size_results']) && !('64' in raw_data[i]['frame_size_results'])) {
      raw_data[i]['frame_size_results']['64'] = raw_data[i]['frame_size_results']['88']
    }

    // be nice to have the test meta data separate from the results data
    switch (raw_data[i].direction) {
      case 'BI':
        bi_data.push(raw_data[i])
        break;
      case 'DS':
      case 'US':
        upDown_data.push(raw_data[i])
        break
      // case 'eth': /////////////// NEED CONFIRM 
      //   eth_data.push(raw_data[i])
      //   break
      default:
        break;
    }

    if (raw_data[i].eth_test) {
      eth_data.push(raw_data[i]);
    }
  }
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
      {/* HAVE TO SPLIT UP DATA into up/down, bi, and eth directions buckets  */}
        <h2>Upstream/Downstream (Mbps)</h2>
        <div className="prd-header" style={{ marginTop: '0' }}>{upDown_data.length && upDown_data[0].test_name}</div>
        <ReactTable 
          data={upDown_data}
          columns={columns_UP_DOWN}
          defaultPageSize={upDown_data.length > 10 ? 10 : upDown_data.length}
          showPagination={upDown_data.length > 10}
          className="-striped -highlight"
        />
        <h2>Bidirectional (Mbps)</h2>
        <div className="prd-header" style={{ marginTop: '0' }}>{bi_data.length && bi_data[0].test_name}</div>
        <ReactTable 
          data={bi_data}
          columns={columns_BI}
          defaultPageSize={bi_data.length > 10 ? 10 : bi_data.length}
          showPagination={bi_data.length > 10}            
          className="-striped -highlight"
        />
        <h2>Ethernet (Mbps)</h2>
        <div className="prd-header" style={{ marginTop: '0' }}>{eth_data.length && eth_data[0].test_name}</div>        
        <ReactTable 
          data={eth_data}
          columns={columns_ETH}
          defaultPageSize={eth_data.length > 10 ? 10 : eth_data.length}
          showPagination={eth_data.length > 10}
          className="-striped -highlight"
        />
      </div>
    </section>
  ) 

}
