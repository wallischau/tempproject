import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'


const small_num_width = 100

const columns = [{
    Header: 'IPv',
    accessor: 'ipv',
    width: small_num_width
  }, {
    Header: 'GHz',
    accessor: 'ghz',
    width: small_num_width
  }, {
    Header: 'MHz', 
    accessor: 'mhz',
    width: small_num_width
  }, {
    Header: 'SS', 
    accessor: 'ss',
    width: small_num_width      
  }, {
    Header: 'Direction', 
    accessor: 'direction',
    width: small_num_width
  }, {
    Header: 'Frame Size',
    accessor: 'frame_size',
    width: small_num_width
  }, {
    Header: 'ILoad (Mbps)', 
    accessor: 'iload_mbps',
    width: small_num_width
  }, {
    Header: 'OLoad (Mbps)', 
    accessor: 'oload_mbps',
    width: small_num_width
  }, {
    Header: 'Forwarding Rate (Mbps)', 
    accessor: 'forwarding_rate_mbps',
    width: small_num_width
  }, {
    Header: 'Packet Loss',
    accessor: 'packet_loss', 
    style: { textAlign: 'center' },          
    Cell: ({ value }) => (
      <div 
        style={{
          backgroundColor: value*1 > 0 ? '#f2dede' : '#dff0d8'
        }}>
        {value}  
      </div>
    )
  }
]

const prd = {
  comparers: [],
  measurement_criteria: {
    'Packet Loss': { compare_func:{}, matcher: null } //// no matcher? use all the results! (packet loss too)
  }
}

const gen_prd_pass_rate = (data) => {
  const bundled_raw_results = Object.assign({}, prd.measurement_criteria)
  Object.keys(bundled_raw_results).forEach(k => bundled_raw_results[k] = [])

  // simple bundle!
  bundled_raw_results[Object.keys(bundled_raw_results)[0]] = data    
 

  const pass_rate_data = []

  Object.keys(bundled_raw_results).forEach(criteria => {
    const table_row = {
      description: 'Packet Loss', 
      criteria, 
      sla_percent: '?95%', /////// need to save/lookup this somewhere
      achieved: null,
      passed: 0,
      failed: 0,
      aborted: '?',
      total: 0 /// count or grab from length? 
    }


    bundled_raw_results[criteria].forEach(res => {
      table_row.total++
      // if (error/abort) // .error not in data atm
      //// hard coded criteria pass/fail logic
      //////////////////////////////////
      if (res.packet_loss*1 === 0) {
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
  const table_row = {
    criteria: 'Nonzero packet loss',
    passed: 0,
    total: 0
  }


  data.forEach(res => {
    ////////////
    if (res.packet_loss === 0 ) { 
      table_row.passed++
    }
    table_row.total++
    ////////////
  })


  return [table_row]
}

export const PRDSection = (props) => {
  ////////////////////////////////////////////
  //// MUST ACCOUNT FOR PRD TYPE (wave 1, wave 2) **** 
  ///////////////////////////////////////////
  const raw_data = props.data.map(r => r.data)

  let prd_pass_rate_data
  let prd_performance_criteria_data
  
  try {
    prd_pass_rate_data = gen_prd_pass_rate(raw_data)
    prd_performance_criteria_data = gen_performace_data(raw_data)
  } catch (error) {
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">

        
        


        <div className="prd-header">Charter SLA: Packet Loss</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Packet Loss Performance Criteria</div> 
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
  const raw_data = props.data.map(r => r.data)
  
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <ReactTable 
          data={raw_data}
          columns={columns}
          defaultPageSize={raw_data.length > 10 ? 10 : raw_data.length}
          showPagination={raw_data.length > 10}
          className="-striped -highlight"
        />
      </div>
    </section>
  ) 
}
