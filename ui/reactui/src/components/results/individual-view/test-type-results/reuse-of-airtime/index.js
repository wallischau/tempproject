import React from 'react';
import ReactTable from 'react-table';

import RoASingleResult from './single-result'
import { performace_columns } from '../../prd-columns'


/// overtime graph not allways there


const gen_performace_data = (data, total_errors) => {
  const baseline_nonzero = {
    criteria: 'Baseline throughput is nonzero for all clients',
    passed: 0,
    total: 0
  }
  const client_increases_post_mid = {
    criteria: 'Achieve greater than baseline throughput for each client remaining after halfway mark',
    passed: 0,
    total: 0
  }
  
  for (let index = 0; index < data.length; index++) {
    const client_results = data[index].individual
    const test_name = data[index].test_name
    const dropped_client = test_name.split('DROP_')[1]

    for (const client in client_results) {
      const fwd_rate = client_results[client].forwarding_rate_mbps
      if (fwd_rate.avg_1_30 > 0) {
        baseline_nonzero.passed++
      }
      baseline_nonzero.total++

      // check non-dropped clients
      if (!client.match(RegExp(`${dropped_client}.*`))) {
        if (fwd_rate.avg_31_60 > 0) {
          client_increases_post_mid.passed++
        }
        client_increases_post_mid.total++
      }
    }
  }

  return [
    baseline_nonzero,
    client_increases_post_mid
  ]
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
  // const raw_data = props.data.map(r => Object.assign({}, r.data, { test_name: r.test_name }))
  const { filtered_data, error_data } = dataPreMap(props.data)
  // const total_errors = error_data.length

  let prd_performance_criteria_data
  
  try {
    prd_performance_criteria_data = gen_performace_data(filtered_data)
  } catch (error) {
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">

        <div className="prd-header">Triple Play Performance Criteria</div> 
        {/* a summary, ?? consistent between test_types? */}
        <ReactTable 
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
  const raw_data = props.data.map(r => Object.assign({}, r.data, { test_name: r.test_name }))

  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        {
          raw_data.map((d, i) => <RoASingleResult key={d.test_name} {...d} />) 
        }
      </div>
    </section>  
  ) 
}
