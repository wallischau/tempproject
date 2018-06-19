import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'
import { max_client_pf } from '../../pass-fail-functions'


const columns = [
  {
    Header: 'Traffic', 
    accessor: 'traffic_type'
  }, {
    Header: '802.11', 
    accessor: 'interface'
  }, {
    Header: 'Frequency', 
    accessor: 'ghz'
  }, {
    Header: 'Bandwidth', 
    accessor: 'mhz'
  }, {
    Header: 'IPv', 
    accessor: 'ipv'
  }, {
    Header: 'MCS', 
    accessor: 'mcs'
  }, {
    Header: 'SS', 
    accessor: 'ss'
  }, {
    Header: 'GI', 
    accessor: 'gi'
  }, {
    Header: 'Direction', 
    accessor: 'direction'
  }, {
    Header: 'Per Client Load', 
    accessor: 'load'
  }, {
    Header: 'Clients',
    accessor: 'clients'
  }
]

const prd = {
  measurement_criteria: {
    'Max Client': {} 
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
      description: 'Max Cient', 
      criteria, 
      achieved: null,
      passed: 0,
      failed: 0,
      aborted: total_errors,
      total: total_errors
    }


    bundled_raw_results[criteria].forEach(data_point => {
      table_row.total++
      if (max_client_pf(data_point)) {
        table_row.passed++
      } else {
        table_row.failed++
      }
    })

    table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'
    pass_rate_data.push(table_row)
  })

  
  return pass_rate_data
}

const gen_performace_data = (data, total_errors) => {

  const table_row = {
    criteria: '>= 50 clients',
    passed: 0,
    total: total_errors
  }

  data.forEach(data_point => {
    if (max_client_pf(data_point) ) { 
      table_row.passed++
    }
    table_row.total++
  })

  return [table_row]
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

        <div className="prd-header">Charter SLA: Max Client</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable
          style={{ width: 'max-content' }}          
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Max Client Performance Criteria</div> 
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

  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <ReactTable 
          data={filtered_data}
          columns={columns}
          showPagination={false}
          defaultPageSize={filtered_data.length}
          className="-striped -highlight"
        />
      </div>
      {/* <div className="results-inner-section">
        <h2>tests not shown</h2>
        { 
          error_data.map(r => <p>{r.test_name}</p>)
        }
      </div> */}
    </section>
  ) 
}
