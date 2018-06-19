import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'


const columns = [
  {
    Header: 'Configuration', 
    columns: [
      {
        Header: 'Frequency', 
        accessor: 'near.ghz'
      }, {
        Header: 'Bandwidth', 
        accessor: 'near.mhz' /// ????????
      }
    ]
  }, {
    Header: 'Near', 
    columns: [
      {
        Header: 'Latency (ms)', 
        accessor: 'near.latency'
      }, {
        Header: 'Jitter (ms)', 
        accessor: 'near.jitter'
      }, {
        Header: 'Packet Loss (ms)', 
        accessor: 'near.packet_loss'
      }, {
        Header: 'Forwarding Rate (kbps)',
        accessor: 'near.forwarding_rate_kbps'
      }
    ]
  }, {
    Header: 'Medium', 
    columns: [
      {
        Header: 'Latency (ms)', 
        accessor: 'medium.latency'
      }, {
        Header: 'Jitter (ms)', 
        accessor: 'medium.jitter'
      }, {
        Header: 'Packet Loss (ms)', 
        accessor: 'medium.packet_loss'
      }, {
        Header: 'Forwarding Rate (kbps)',
        accessor: 'medium.forwarding_rate_kbps'
      }
    ]
  }, {
    Header: 'Far', 
    columns: [
      {
        Header: 'Latency (ms)', 
        accessor: 'far.latency'
      }, {
        Header: 'Jitter (ms)', 
        accessor: 'far.jitter'
      }, {
        Header: 'Packet Loss (ms)', 
        accessor: 'far.packet_loss'
      }, {
        Header: 'Forwarding Rate (kbps)',
        accessor: 'far.forwarding_rate_kbps'
      }
    ]
  }
]

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

export const gen_prd_pass_rate = (data, total_errors) => {
  const table_row = {
    criteria: 'Near Far', 
    achieved: null,
    passed: 0,
    failed: 0,
    aborted: total_errors,
    total: total_errors
  }
  /// is this the only criteria needed? seems that way in PRD but extra data in results brings question
  for (let index = 0; index < data.length; index++) {
    const result = data[index]
    table_row.total++
    
    if (!result) {
      table_row.failed++
      continue
    }

    if (result.far.forwarding_rate_kbps < result.medium.forwarding_rate_kbps && result.medium.forwarding_rate_kbps < result.far.forwarding_rate_kbps) {
      table_row.passed++
    } else {
      table_row.failed++
    }

  }

  table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'
  return [table_row]  
}

export const gen_performace_data = (data, total_errors) => {
  const near_pl = {
    criteria: 'Near - packet loss <= 10%',
    passed: 0,
    total: 0
  }
  const med_pl = {
    criteria: 'Medium - packet loss <= 10%',
    passed: 0,
    total: 0
  }
  const far_pl = {
    criteria: 'Far - packet loss <= 10%',
    passed: 0,
    total: 0
  }
  const near_jitter = {
    criteria: 'Near - jitter <= 50ms',
    passed: 0,
    total: 0
  }
  const med_jitter = {
    criteria: 'Medium - jitter <= 50ms',
    passed: 0,
    total: 0
  }
  const far_jitter = {
    criteria: 'Far - jitter <= 50ms',
    passed: 0,
    total: 0
  }
  const near_latency = {
    criteria: 'Near - latency <= 1000ms',
    passed: 0,
    total: 0
  }
  const med_latency = {
    criteria: 'Medium - latency <= 0ms',
    passed: 0,
    total: 0
  }
  const far_latency = {
    criteria: 'Far - latency <= 0ms',
    passed: 0,
    total: 0
  }
  const fwd_rates = {
    criteria: 'Forwarding Rates: far < medium < near',
    passed: 0,
    total: 0
  }

  //// process the data
  for (let index = 0; index < data.length; index++) {
    const result = data[index]
    
    near_pl.total++
    near_jitter.total++
    near_latency.total++    
    med_pl.total++    
    med_jitter.total++
    med_latency.total++
    far_pl.total++
    far_jitter.total++
    far_latency.total++
    fwd_rates.total++

    if (!result) {
      continue
    }
    

    if (result.near.packet_loss <= 10) {
      near_pl.passed++
    }
    if (result.near.jitter <= 50) {
      near_jitter.passed++
    }
    if (result.near.latency <= 1000) {
      near_latency.passed++
    }
    if (result.medium.packet_loss <= 10) {
      med_pl.passed++
    }
    if (result.medium.jitter <= 50) {
      med_jitter.passed++
    }
    if (result.medium.latency <= 0) {
      med_latency.passed++
    }
    if (result.far.packet_loss <= 10) {
      far_pl.passed++
    }
    if (result.far.jitter <= 50) {
      far_jitter.passed++
    }
    if (result.far.latency <= 0) {
      far_latency.passed++
    }

    // check near - mid - far.  
    if (result.far.forwarding_rate_kbps < result.medium.forwarding_rate_kbps && result.medium.forwarding_rate_kbps < result.far.forwarding_rate_kbps) {
      fwd_rates.passed++
    }
  }

  return [
    near_pl,
    med_pl,
    far_pl,
    near_jitter,
    med_jitter,
    far_jitter,
    near_latency,
    med_latency,
    far_latency,
    fwd_rates,
  ]
}

export const PRDSection = (props) => {
  ////////////////////////////////////////////
  //// MUST ACCOUNT FOR PRD TYPE (wave 1, wave 2) **** 
  ///////////////////////////////////////////
  
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

        <div className="prd-header">Charter SLA: Max Client</div>          
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />
        
        <div className="prd-header">Max Client Performance Criteria</div> 
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

  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <div className="prd-header">{filtered_data[0].test_name}</div>
        <ReactTable 
          data={filtered_data}
          columns={columns}
          showPagination={false}
          defaultPageSize={filtered_data.length}
          className="-striped -highlight"
        />
      </div>
    </section>
  ) 
}
