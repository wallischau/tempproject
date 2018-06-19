import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'


const columns_LATENCY = [
  {
    Header: 'Configuration', 
    columns: [
      {
        Header: 'IPv', 
        accessor: 'ipv'
      }, {
        Header: 'GHz', 
        accessor: 'ghz'
      }, {
        Header: 'MHz', 
        accessor: 'mhz'
      }, {
        Header: 'MCS', 
        accessor: 'mcs'
      }, {
        Header: 'SS', 
        accessor: 'ss'
      }, {
        Header: 'Direction', 
        accessor: 'direction'
      }
    ]
  }, {
    Header: 'Results', 
    columns: [
      {
        Header: '64/88', 
        accessor: 'frame_size_results.64.latency'
      }, {
        Header: '128', 
        accessor: 'frame_size_results.128.latency'
      }, {
        Header: '256', 
        accessor: 'frame_size_results.256.latency'
      }, {
        Header: '512', 
        accessor: 'frame_size_results.512.latency'
      }, {
        Header: '1024', 
        accessor: 'frame_size_results.1024.latency'
      }, {
        Header: '1518', 
        accessor: 'frame_size_results.1518.latency'
      }
    ]
  }
]

const columns_JITTER = [
  {
    Header: 'Configuration', 
    columns: [
      {
        Header: 'IPv', 
        accessor: 'ipv'
      }, {
        Header: 'GHz', 
        accessor: 'ghz'
      }, {
        Header: 'MHz', 
        accessor: 'mhz'
      }, {
        Header: 'MCS', 
        accessor: 'mcs'
      }, {
        Header: 'SS', 
        accessor: 'ss'
      }, {
        Header: 'Direction', 
        accessor: 'direction'
      }
    ]
  }, {
    Header: 'Results', 
    columns: [
      {
        Header: '64/88', 
        accessor: 'frame_size_results.64.jitter'
      }, {
        Header: '128', 
        accessor: 'frame_size_results.128.jitter'
      }, {
        Header: '256', 
        accessor: 'frame_size_results.256.jitter'
      }, {
        Header: '512', 
        accessor: 'frame_size_results.512.jitter'
      }, {
        Header: '1024', 
        accessor: 'frame_size_results.1024.jitter'
      }, {
        Header: '1518', 
        accessor: 'frame_size_results.1518.jitter'
      }
    ]
  }
]

const prd = {
  comparers: [],
  use_matchers: false, ///////////////////// not in tcp logic
  measurement_criteria: {
    'Latency/Jitter': { compare_func:{}, matcher: null } //// no matcher? use all the results! (packet loss too)
  }
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

const gen_prd_pass_rate = (data, total_errors) => {

  const bundled_raw_results = Object.assign({}, prd.measurement_criteria)

  Object.keys(bundled_raw_results).forEach(k => bundled_raw_results[k] = [])

  bundled_raw_results[Object.keys(bundled_raw_results)[0]] = data    
  

  ///////////////////////////////////////////////
  // re bundle results by prd criteria
  ////////////////////
  // Iterate thru all the result data
  
  //////////////////////////////////////////////////
  /// calc pass/fail for each results 'bucket' // This could move up to loop above in future
  const pass_rate_data = []

  Object.keys(bundled_raw_results).forEach(criteria => {
    const table_row = {
      criteria, 
      achieved: null,
      passed: 0,
      failed: 0,
      aborted: total_errors,
      total: total_errors
    }

    bundled_raw_results[criteria].forEach(res_point => {
      table_row.total++

      //////////////////////////////////
      const pf = {
        jitter_total: 0,
        latency_total: 0,
        count: 0,
        get jitter_avg() {return this.jitter_total/this.count},
        get latency_avg() {return this.latency_total/this.count}
      }

      Object.values(res_point.frame_size_results).forEach(fsr => {
        pf.jitter_total += fsr.jitter
        pf.latency_total += fsr.latency
        pf.count++
      })

      if (pf.jitter_avg <= 50 && pf.latency_avg <= 50) {
        table_row.passed++
      } else {
        table_row.failed++
      }
      //////////////////////////////////
    })

    table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'
    pass_rate_data.push(table_row)
  })

  
  return pass_rate_data
}

const gen_performace_data = (data, total_errors) => {

  const table_row_delay = {
    criteria: '<= 50 ms One-Way Delay (Average for full test)',
    passed: 0,
    total: total_errors
  }

  const table_row_jitter = {
    criteria: '<= 50 ms Jitter (Average for full test)',
    passed: 0,
    total: total_errors
  }

  for (let index = 0; index < data.length; index++) {
    const fsr = data[index].frame_size_results

    for (let res in fsr) {

      table_row_jitter.total++
      table_row_delay.total++
      if (typeof(fsr[res]) === 'string') {
        continue 
      }
      if (fsr[res].jitter <= 50) {
        table_row_jitter.passed++
      }
  
      if (fsr[res].latency <= 50) {
        table_row_delay.passed++
      }
    }
  }

  return [table_row_delay, table_row_jitter]
}

export const PRDSection = (props) => {

  const { filtered_data, error_data } = dataPreMap(props.data)
  const total_errors = error_data.length  

  let prd_pass_rate_data
  let prd_performance_criteria_data
  
  try {
    prd_pass_rate_data = gen_prd_pass_rate(filtered_data, total_errors)
    prd_performance_criteria_data = gen_performace_data(filtered_data, total_errors)
  } catch (error) {
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">

        <div className="prd-header">Charter SLA: Latency Required Percent Pass Rate</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Latency Performance Criteria</div> 
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
  const { filtered_data, error_data } = dataPreMap(props.data)

  // Set up the accessors for the ReactTables below
  // To generalize accessors we need the '64' key to always be present
  // Copy '88' key contents to the '64' key if it is present
  for (let i = 0; i < filtered_data.length; i++) {
    if (('88' in filtered_data[i]['frame_size_results']) && !('64' in filtered_data[i]['frame_size_results'])) {
      filtered_data[i]['frame_size_results']['64'] = filtered_data[i]['frame_size_results']['88']
    }
  }
  
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <h2>Latency</h2>
        <ReactTable 
          data={filtered_data}
          columns={columns_LATENCY}
          showPagination={false}
          defaultPageSize={filtered_data.length}
          className="-striped -highlight"
        />
        <h2 style={{ marginTop: '20px' }}>Jitter</h2>
        <ReactTable 
          data={filtered_data}
          columns={columns_JITTER}
          showPagination={false}
          defaultPageSize={filtered_data.length}
          className="-striped -highlight"
        />
      </div>
    </section>
  ) 

}
