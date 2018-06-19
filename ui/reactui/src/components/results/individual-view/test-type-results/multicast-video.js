import React from 'react';
import ReactTable from 'react-table'

import { performace_columns } from '../prd-columns'


const columns = [
  {
    Header: 'Client Name', 
    accessor: 'client_name'
  }, {
    Header: 'Stream Name', 
    accessor: 'stream_name'
  }, {
    Header: 'Stream IP',
    accessor: 'stream_ip'
  }, {
    Header: 'Delay Factor', 
    accessor: 'delay_factor'
  }, {
    Header: 'Media Loss Rate', 
    accessor: 'media_loss_rate'
  }
]

//// NO prd SLA section for this test

const gen_performace_data = (data) => {
  const table_row_mediaLoss = {
    criteria: 'Media Loss Rate <= 1 pkts/min',
    passed: 0,
    total: 0
  }

  const table_row_delayFactor = {
    criteria: 'Delay Factor <= 50ms',
    passed: 0,
    total: 0
  }

  /////
  const flattened_data = [].concat.apply([], data)
  ////
  flattened_data.forEach(res => {
    if (res.media_loss_rate <= 1) { 
      table_row_mediaLoss.passed++
    }
    table_row_mediaLoss.total++

    if (res.delay_factor <= 50) {
      table_row_delayFactor.passed++      
    }
    table_row_delayFactor.total++
  })

  return [table_row_mediaLoss, table_row_delayFactor]
}


export const PRDSection = (props) => {
  ////////////////////////////////////////////
  //// MUST ACCOUNT FOR PRD TYPE (wave 1, wave 2) ****
  ///////////////////////////////////////////
  const raw_data = props.data.map(r => r.data)

  let prd_performance_criteria_data
  
  try {
    prd_performance_criteria_data = gen_performace_data(raw_data)
  } catch (error) {
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">
        <div className="prd-header">Multicast Video Performance Criteria</div> 
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
  const raw_data = props.data.map(r => Object.assign(r.data, { test_name: r.test_name }))

  const many_tables = raw_data.map((subTable, i) => {
    return <div key={i} style={{ marginBottom: '80px' }}>
      <div className="prd-header">{subTable.test_name}</div> 
      <ReactTable
        data={subTable}
        columns={columns}
        defaultPageSize={subTable.length}
        showPagination={false}
        className="-striped -highlight"
      />
    </div>
  })
  
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        { many_tables }
      </div>
    </section>
  ) 
}
