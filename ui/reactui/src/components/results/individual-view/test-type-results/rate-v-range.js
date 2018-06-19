import React from 'react';
import ReactTable from 'react-table'
import { LineChart } from 'react-chartkick';

import { pass_rate_columns, performace_columns } from '../prd-columns'


const small_num_width = 100


const gen_prd_pass_rate = (data, total_errors) => {

  const table_row = {
    criteria: 'Minimum of 50Mbps @ 75dB Path Loss',
    achieved: null,
    passed: 0,
    failed: 0,
    aborted: total_errors,
    total: total_errors
  }

  for (let index = 0; index < data.length; index++) {
    const result = data[index]
    table_row.total++
    
    if (result.dB_throughput['-75'] >= 50) {
      table_row.passed++
    } else {
      table_row.failed++
    }
  }

  table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'

  return [table_row]
}

const gen_performace_data = (data) => {
  // go thru, pass/fail per each mcs
  /// need way to get criteria into here? and also Store criteria
  const table_row = {
    criteria: 'Minimum of 50Mbps @ 75dB Path Loss',
    passed: 0,
    total: 0
  }

  for (let index = 0; index < data.length; index++) {
    const result = data[index]
    table_row.total++
    
    if (result.dB_throughput['-75'] >= 50) {
      table_row.passed++
    } else {
      table_row.failed++
    }
  }

  return [table_row]
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
  ////////////////////////////////////////////
  //// MUST ACCOUNT FOR PRD TYPE (wave 1, wave 2) **** 
  ///////////////////////////////////////////

  const { filtered_data, error_data } = dataPreMap(props.data)
  const total_errors = error_data.length

  let prd_pass_rate_data
  let prd_performance_criteria_data
  
  try {
    prd_pass_rate_data = gen_prd_pass_rate(filtered_data, total_errors)
    prd_performance_criteria_data = gen_performace_data(filtered_data)
  } catch (error) {
    return <div>Error with pass/fail generation</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">
        {/* need to get this header from prd object */}
        <div className="prd-header">Charter SLA: Rate Vs Range Required Percent Pass Rate</div>
        <ReactTable 
          style={{ width: 'max-content' }}
          data={prd_pass_rate_data}  ///
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length} ///
        />
        {/* Do we need this section for RvR? doesn't look like it*/}
        <div className="prd-header">Rate Vs Range Performance Criteria</div>
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
  const raw_data = props.data.map(r => r.data).filter(r => !Array.isArray(r)).filter(r => !!r)

  if (!raw_data.length) {
    return <section className="results-section">
      <h2>No data availible for this test</h2>
    </section>
  }

  const columns = [{
    Header: 'Configuration',
    columns: [
      {
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
        Header: 'MCS', 
        accessor: 'mcs', 
        width: small_num_width                
      }, {
        Header: 'Retry', 
        id: 'retry',
        accessor: d => d.retry ? 'Yes' : 'Unknown',
        width: small_num_width
      }]
    }, {
      Header: 'Throughput',
      columns: Object.keys(raw_data[0].dB_throughput).map(k => ({ Header: k, id: k, accessor: d => d.dB_throughput ? d.dB_throughput[k] : 'none', width: small_num_width }))
    }
  ]

  const chart = <LineChart 
    ytitle='Mbps'
    xtitle='Attenuation'
    id="charter" 
    data={raw_data.map(d => ({ name: `${d.ghz} ${d.mhz} ${d.mcs}`, data: d.dB_throughput }))} 
    height="500px"
    download={true}
    legend={true}
  />
  
  return (
    <section className="results-section">
      <h2>Test Data</h2>
        <div className="results-inner-section">
          {chart}
          <ReactTable 
            defaultPageSize={raw_data.length <= 10 && raw_data.length}
            showPagination={raw_data.length >= 10}
            data={raw_data}
            columns={columns}
          />
        </div>
    </section>
  ) 
}
