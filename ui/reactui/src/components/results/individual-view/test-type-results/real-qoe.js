import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'

const VOIP = 'VOIP'
const VIDEO = 'RTPVideo'

const columns = [
  {
    Header: 'Clients', 
    accessor: 'clients'
  }, {
    Header: 'Client Type', 
    accessor: 'client_type'
  }, {
    Header: 'Latency', 
    accessor: 'latency'
  }, {
    Header: 'Packet Loss', 
    accessor: 'packet_loss'
  }, {
    Header: 'Jitter', 
    accessor: 'jitter'
  }, {
    Header: 'Forwarding Rate', 
    accessor: 'forwarding_rate_kbps'
  }, {
    Header: 'MOS',
    accessor: 'mos'
  }, {
    Header: 'MDI delay factor', 
    accessor: 'mdi.delay_factor'
  }, {
    Header: 'MDI media loss rate', 
    accessor: 'mdi.media_loss_rate'
  }
]

const dataPreMap = (data) => {
  return data.reduce((out, cur) => {
    if (!!cur.data && cur.data.length > 0) {
      // .data is an array
      out.filtered_data.push(cur.data.map(d => Object.assign(d, { test_name: cur.test_name })))
      /// could this be universial? check the .data type? 
      // out.filtered_data.push(Object.assign({}, cur.data, { test_name: cur.test_name }))
    } else {
      out.error_data.push(cur)
    }
    return out
  }, { filtered_data: [], error_data: [] })
}

const gen_prd_pass_rate = (data, total_errors) => {

  const table_row = {
    criteria: 'Realworld QOE',
    achieved: null,
    passed: 0,
    failed: 0,
    aborted: total_errors,
    total: total_errors
  }

  for (let index = 0; index < data.length; index++) {
    const all_results = data[index]
    table_row.total++

    let passed = true
    all_results.forEach(result => {
      /// checking if any particular critieria failed. using the opposite logic of the other prd section
      if (result.clients === 16) {
        if (result.client_type === VOIP) {
          if (result.mos < 4) {
            passed = false
          } 
        }
        if (result.client_type === VIDEO) {
          if (result.mdi.delay_factor > 50) {
            passed = false
          } 
          if (result.mdi.media_loss_rate > 1) {
            passed = false          
          }   
        }
      }
    })
    passed && table_row.passed++
  }


  table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'

  return [table_row]
}

const gen_performace_data = (data, total_errors) => {
  // go thru, pass/fail per each mcs
  /// need way to get criteria into here? and also Store criteria
  const mos_score = {
    criteria: '(VOIP) Mos Score >=4',
    passed: 0,
    total: 0
  }
  const delay_factor = {
    criteria: '(RTPVideo) Delay Factor (DF) <= 50ms',
    passed: 0,
    total: 0
  }
  const media_loss_rate = {
    criteria: '(RTPVideo) Media Loss Rate <= 1 pkts/min',
    passed: 0,
    total: 0
  }

  for (let index = 0; index < data.length; index++) {
    const all_results = data[index]
    for (let index = 0; index < all_results.length; index++) {
      const result = all_results[index];
      if (result.clients === 16) {
        if (result.client_type === VOIP) {
          if (result.mos >= 4) {
            mos_score.passed++
          } 
          mos_score.total++
        }
        if (result.client_type === VIDEO) {
          if (result.mdi.delay_factor <= 50) {
            delay_factor.passed++
          } 
          delay_factor.total++
          if (result.mdi.media_loss_rate <= 1) {
            media_loss_rate.passed++
          } 
          media_loss_rate.total++
        }
      }
    }
  }


  return [
    mos_score,
    delay_factor,
    media_loss_rate
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
        <div className="prd-header">Charter SLA: Realworld QoE Required Percent Pass Rate</div>          
        <ReactTable 
          style={{ width: 'max-content' }}        
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Realworld QoE Performance Criteria</div> 
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

  const many_tables = props.data.map((result, i) => {
    return <div key={result._id} style={{ marginBottom: '80px' }}>
      <div className="prd-header">{result.test_name}</div> 
      <ReactTable
        data={result.data}
        columns={columns}
        defaultPageSize={result.data.length}
        className="-striped -highlight"
      />
    </div>
  })

  const mos_data_points = []
  const mdi_delay_data_points = []
  const mdi_media_data_points = []
  for (let index = 0; index < raw_data.length; index++) {
    raw_data[index].forEach(result => {
      result.mos && mos_data_points.push(result.mos*1)
      result.mdi.delay_factor && mdi_delay_data_points.push(result.mdi.delay_factor)
      result.mdi.media_loss_rate && mdi_media_data_points.push(result.mdi.media_loss_rate)
    })
  }

  const mos_score = (mos_data_points.reduce((o, c) => o+c, 0)) / mos_data_points.length
  const delay_factor = (mdi_delay_data_points.reduce((o, c) => o+c, 0)) / mdi_delay_data_points.length
  const media_loss_rate = (mdi_media_data_points.reduce((o, c) => o+c, 0)) / mdi_media_data_points.length
  
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <div className="results-inner-section">
        
          <h2>QoE Summary</h2>

          <div>MOS Score: {mos_score}</div>
          <div>Delay Factor: {delay_factor} </div>
          <div>Media Loss Rate: {media_loss_rate} </div>          
        </div>

        <h2>QoE Averages</h2>
        { 
          many_tables
        }

      </div>
    </section>
  ) 
}
