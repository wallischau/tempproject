import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'


const columns = [
  {
    Header: 'Interface', 
    accessor: 'interface'
  }, {
    Header: 'Frequency', 
    accessor: 'ghz'
  }, {
    Header: 'Bandwidth', 
    accessor: 'mhz'
  }, {
    Header: 'MCS', 
    accessor: 'mcs'
  }, {
    Header: 'SS', 
    accessor: 'ss'
  }, {
    Header: 'Sessions Achieved', 
    accessor: 'sessions'
  }, {
    Header: 'Max Delay Factor', 
    accessor: 'max_delay_factor'
  }, {
    Header: 'Max MLR', 
    accessor: 'max_mlr'
  }
]

const prd = {
  measurement_criteria: {
    'Unicast Video': { compare_func:{}, matcher: null } //// no matcher? use all the results! (packet loss too)
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


    bundled_raw_results[criteria].forEach(res => {
      table_row.total++
      // if (error/abort) // .error not in data atm
      //// hard coded criteria pass/fail logic
      //////////////////////////////////
      if (res.sessions >= 9 && res.max_delay_factor <= 50 && res.max_mlr <= 1) {
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

const gen_performace_data = (data) => {
  // go thru, pass/fail per each mcs
  /// need way to get criteria into here? and also Store criteria
  const table_row_atLeast9 = {
    criteria: 'At least 9 unicast sessions',
    passed: 0,
    total: 0
  }

  const table_row_delayFactor = {
    criteria: 'Delay Factor (DF) <= 50ms',
    passed: 0,
    total: 0
  }

  const table_row_mediaLoss = {
    criteria: 'Media Loss Rate (MLR) <= 1 pkts/min',
    passed: 0,
    total: 0
  }

  data.forEach(res => {
    ////////////
    if (res.sessions >= 9 ) { 
      table_row_atLeast9.passed++
    }
    table_row_atLeast9.total++ // a bit ...verbose but oh well

    if(res.max_delay_factor <= 50) {
      table_row_delayFactor.passed++
    }
    table_row_delayFactor.total++

    if( res.max_mlr <= 1) {
      table_row_mediaLoss.passed++
    }
    table_row_mediaLoss.total++
    
    ////////////
  })


  return [table_row_atLeast9, table_row_delayFactor, table_row_mediaLoss]
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

        <div className="prd-header">Charter SLA: Unicast Video Required Percent Pass Rate</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Unicast Video Performance Criteria</div> 
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
  const total_errors = error_data.length
  
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <h2>Unicast Video</h2>
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
