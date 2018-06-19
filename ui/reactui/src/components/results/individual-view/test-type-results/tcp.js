import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'
import { tcp_pf } from '../../pass-fail-functions'


const columns = [{
    Header: 'Configuration',
    columns: [
      {
        Header: 'Test Name',
        accessor: 'test_name'
      },
      {
        Header: '802.11', 
        id: 'confint',
        accessor: d => d.interface && d.interface.join('/'),
        width: 100
      }, {
        Header: 'GHz',
        id: 'confghz',
        accessor: d => d.ghz && d.ghz.join('/'),
        width: 100
      }, {
        Header: 'MHz', 
        id: 'confmhz',
        accessor: d => d.mhz && d.mhz.join('/'),
        width: 100
      }, {
        Header: 'Clients', 
        accessor: 'clients',
        width: 50          
      }, {
        Header: 'MCS',
        id: 'confmcs',
        accessor: d => d.mcs && d.mcs.join('/'),
        width: 100         
      }, {
        Header: 'SS', 
        accessor: 'ss',
        width: 50          
      }, {
        Header: 'Direction', 
        accessor: 'direction',
        width: 50          
      }
    ], 
  }, {
    Header: 'MSS 536',
    columns: [
      {
        Header: 'Theoretical',
        id: 'theo536',
        ///currently there's a bug with the results data with the wrong key name (_kbps)
        accessor: d => d.mss_results && d.mss_results['536'] ? d.mss_results['536'].theoretical_mbps : null, 
        maxWidth: 150
      }, {
        Header: 'Actual', 
        id: 'actual536',
        accessor: d => d.mss_results && d.mss_results['536'] ? d.mss_results['536'].actual_mbps : null,
        maxWidth: 150
      }, {
        Header: '%',
        id: 'percentage536',
        accessor: d  => d.mss_results && d.mss_results['536'] ? d.mss_results['536'].percentage : null,
        maxWidth: 150
      }
    ]
  }, {
    Header: 'MSS 1460',
    columns: [
      {
        Header: 'Theoretical',
        id: 'theo1460',
        accessor: d => d.mss_results && d.mss_results['1460'] ? d.mss_results['1460'].theoretical_mbps : null,
        maxWidth: 150,          
      }, {
        Header: 'Actual', 
        id: 'actual1460',
        accessor: d => d.mss_results && d.mss_results['1460'] ? d.mss_results['1460'].actual_mbps : null,
        maxWidth: 150,
      }, {
        Header: '%',
        id: 'percentage1460t',
        accessor: d  => d.mss_results && d.mss_results['1460'] ? d.mss_results['1460'].percentage : null,
        maxWidth: 150,
      }
    ]
  }, 
]

const prd = {
  comparers: [
    {
      filter_criteria: { mss: '536'},
      description: '>= 65% of Theoretical MAX',
      operator: 'gte',
      operator_val: 65,
      res_point_key: '.mss_results[536].theoretical_mbps' /// meh ?
    }
  ],
  measurement_criteria: {
    'Upstream (WiFi - Eth)': { compare_func:{}, matcher: { direction: 'US' } }, 
    'Downstream (Eth - WiFi)': { matcher: { direction: 'DS' } },
    //// ADD ETHERNET TOO! need ethernet port reservation working
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
      description: 'TCP GoodPut', 
      criteria, 
      achieved: null,
      passed: 0,
      failed: 0,
      aborted: '?',
      total: 0 /// count or grab from length? 
    }


    bundled_raw_results[criteria].forEach(res_point => {
      
      //mss are treated as individual test cases
      const { pf_536, pf_1460 } = tcp_pf(res_point)
      table_row.total++
      if (pf_536) {
        table_row.passed++
      } else {
        table_row.failed++
      }

      table_row.total++   
      if (pf_1460) {
        table_row.passed++
      } else {
        table_row.failed++
      }

      // old logic, bundles up both mss for result... keep this just in case reasons
      // if ((res_point.mss_results['536'] && res_point.mss_results['536'].percentage) >= 65 
      // && (res_point.mss_results['1460'] && res_point.mss_results['1460'].percentage) >= 75) {
      //   table_row.passed++
      // } else {
      //   table_row.failed++
      // }
    })

    table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'
    pass_rate_data.push(table_row)
  })

  return pass_rate_data
}

const gen_performace_data = (data) => {
  // go thru, pass/fail per each mcs
  const table_row_536 = {
    criteria: '>= 65% of Theoretical Max Goodput for MSS 536',
    passed: 0,
    total: 0
  }
  const table_row_1460 = {
    criteria: '>= 75% of Theoretical Max Goodput for MSS 1460',
    passed: 0,
    total: 0
  } 

  data.forEach(data_point => {
    const { pf_536, pf_1460 } = tcp_pf(data_point)    
    if (data_point.mss_results['536']) {
      if (pf_536) { 
        table_row_536.passed++
      }
      table_row_536.total++
    }

    if (data_point.mss_results['1460']) {
      if (pf_1460) {
        table_row_1460.passed++
      }
      table_row_1460.total++
    }
  })

  return [table_row_536, table_row_1460]
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

export const PRDSection = (props) => {

  const { filtered_data, error_data } = dataPreMap(props.data)

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

        <div className="prd-header">Charter SLA: TCP Goodput Required Percent Pass Rate</div>
        <ReactTable 
          style={{ width: 'max-content' }}          
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
          className="-striped"          
        />

        <div className="prd-header">TCP Goodput Performance Criteria</div> 
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
  let expected_test_data_count = 0, actual_test_data_count = 0
  const raw_data = props.data
  .map(res => {
    if (!!res.data) {
      actual_test_data_count++
    }
    expected_test_data_count++
    // const newRes = Object.assign({}, res) 
    const newRes = Object.assign({}, res.data, { test_name: res.test_name })
    try {
      var mss536 = newRes.mss_results['536']
      var mss1460 = newRes.mss_results['1460']
    } catch(e) {
      return res
    }
    if (!!mss536) {
      Object.keys(mss536).forEach(k => {
        if (typeof(mss536[k]) === 'number') {
          mss536[k] = Math.round(mss536[k] * 100) / 100
        }
      })
    }
    if (!!mss1460) {
      Object.keys(mss536).forEach(k => {
        if (typeof(mss1460[k]) === 'number') {
          mss1460[k] = Math.round(mss1460[k] * 100) / 100
        }
      })
    }
    
    return newRes
  })

  return (
    <section className="results-section">
      <h2>Test Data</h2>
      {/* <p>expected: {expected_test_data_count}</p>
      <p>actual data: {actual_test_data_count} </p> */}
      <div className="results-inner-section">
        <ReactTable 
          getTdProps={() => ({ style: { textAlign: 'center' } })}
          data={raw_data}
          columns={columns}
          defaultPageSize={10}
          className="-striped -highlight"
        />
      </div>
    </section>
  )
}
