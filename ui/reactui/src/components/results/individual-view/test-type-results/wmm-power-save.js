import React from 'react';
import ReactTable from 'react-table'

import { performace_columns } from '../prd-columns'


const columns = [
  {
    Header: 'Client Type', 
    accessor: 'client_type'
  }, {
    Header: 'Listening Interval', 
    accessor: 'listen_interval'
  }, {
    Header: 'Forwarding Rate', 
    id: 'fr',
    accessor: d => (d.forwarding_rate_kbps*1).toLocaleString()
  }
]

/// export func for use in other(Ceritification) reports
export const gen_performace_data = (data) => {
  /// setup table data objects
  const awake_client_highest_rate = {
    criteria: 'Awake Client Achieves Highest Forwarding Rate',
    passed: 0,
    total: 0
  }
  const wmm_interval_2_gt_wmm_interval_6 = {
    criteria: 'WMM PS Client w/ Listening Interval of 2 has Forwarding Rate > WMM PS Client w/ Listening Interval of 6',
    passed: 0,
    total: 0
  }
  const wmm_interval_2_gt_leg_interval_2 = {
    criteria: 'WMM PS Client w/ Listening Interval of 2 has Forwarding Rate > Legacy PS Client w/ Listening Interval of 2',
    passed: 0,
    total: 0
  }
  const wmm_interval_6_gt_wmm_interval_10 = {
    criteria: 'WMM PS Client w/ Listening Interval of 6 has Forwarding Rate > WMM PS Client w/ Listening Interval of 10',
    passed: 0,
    total: 0
  }
  const wmm_interval_6_gt_leg_interval_6 = {
    criteria: 'WMM PS Client w/ Listening Interval of 6 has Forwarding Rate > Legacy PS Client w/ Listening Interval of 6',
    passed: 0,
    total: 0
  }
  const wmm_interval_10_gt_leg_interval_10 = {
    criteria: 'WMM PS Client w/ Listening Interval of 10 has Forwarding Rate > Legacy PS Client w/ Listening Interval of 10',
    passed: 0,
    total: 0
  }
  const leg_interval_2_gt_leg_interval_6 = {
    criteria: 'Legacy PS Client w/ Listening Interval of 2 has Forwarding Rate > Legacy PS Client w/ Listening Interval of 6',
    passed: 0,
    total: 0
  }
  const leg_interval_6_gt_leg_interval_10 = {
    criteria: 'Legacy PS Client w/ Listening Interval of 6 has Forwarding Rate > Legacy PS Client w/ Listening Interval of 10',
    passed: 0,
    total: 0
  }

  /// Process data
  for (let index = 0; index < data.length; index++) {
    const result_array = data[index]

    if (result_array.length === 0) {
      awake_client_highest_rate.total++
      continue 
    }
    // sort each client group by fw_rate
    result_array.sort((a, b) => {
      if (b.forwarding_rate_kbps === a.forwarding_rate_kbps && a.client_type === b.client_type) {
        // if these are the same rate and type, put the results in the wrong order to trigger a failure in index lookup checks
        return b.listen_interval - a.listen_interval
      }
      return b.forwarding_rate_kbps - a.forwarding_rate_kbps
    })

    const findClientIndex = (type, listen_interval) => {
      return result_array.findIndex(client => (client.client_type.toLowerCase() === type && client.listen_interval === listen_interval))
    }

    const WMM = 'wmm'
    const LEG = 'legacy'

    const WMM_2 = findClientIndex(WMM, 2)
    const WMM_6 = findClientIndex(WMM, 6)
    const WMM_10 = findClientIndex(WMM, 10)    
    const Leg_2 = findClientIndex(LEG, 2)
    const Leg_6 = findClientIndex(LEG, 6)
    const Leg_10 = findClientIndex(LEG, 10)

    // awake_client_highest_rate
    if (result_array[0].client_type === 'Awake') {
      awake_client_highest_rate.passed++
    } else  {
      awake_client_highest_rate.failed++
    }
    awake_client_highest_rate.total++
    // wmm_interval_2_gt_wmm_interval_6
    if (WMM_2 > -1 && WMM_6 > -1) {
      wmm_interval_2_gt_wmm_interval_6.total++
      if (WMM_2 < WMM_6) {
        wmm_interval_2_gt_wmm_interval_6.passed++
      }
    } 
    // wmm_interval_2_gt_leg_interval_2
    if (WMM_2 > -1 && Leg_2 > -1) {
      wmm_interval_2_gt_leg_interval_2.total++
      if (WMM_2 < Leg_2) {
        wmm_interval_2_gt_leg_interval_2.passed++
      }
    }
    // wmm_interval_6_gt_wmm_interval_10
    if (WMM_6 > -1 && WMM_10 > -1) {
      wmm_interval_6_gt_wmm_interval_10.total++
      if (WMM_6 < WMM_10) {
        wmm_interval_6_gt_wmm_interval_10.passed++
      }
    }
    // wmm_interval_6_gt_leg_interval_6
    if (WMM_6 > -1 && Leg_6 > -1) {
      wmm_interval_6_gt_leg_interval_6.total++
      if (WMM_6 < Leg_6) {
        wmm_interval_6_gt_leg_interval_6.passed++
      }
    }
    // wmm_interval_10_gt_leg_interval_10 
    if (WMM_10 > -1 && Leg_10 >-1) {
      wmm_interval_10_gt_leg_interval_10.total++
      if (WMM_10 < Leg_10) {
        wmm_interval_10_gt_leg_interval_10.passed++
      }
    }
    // leg_interval_2_gt_leg_interval_6
    if (Leg_2 > -1 && Leg_6 > -1) {
      leg_interval_2_gt_leg_interval_6.total++
      if (Leg_2 < Leg_6) {
        leg_interval_2_gt_leg_interval_6.passed++
      }
    }
    // leg_interval_6_gt_leg_interval_10
    if (Leg_6 > -1 && Leg_10 > -1) {
      leg_interval_6_gt_leg_interval_10.total++
      if (Leg_6 < Leg_10) {
        leg_interval_6_gt_leg_interval_10.passed++
      }
    }

  }

  return [
    awake_client_highest_rate,
    wmm_interval_2_gt_wmm_interval_6,
    wmm_interval_2_gt_leg_interval_2,
    wmm_interval_6_gt_wmm_interval_10,
    wmm_interval_6_gt_leg_interval_6,
    wmm_interval_10_gt_leg_interval_10,
    leg_interval_2_gt_leg_interval_6,
    leg_interval_2_gt_leg_interval_6
  ]
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

        <div className="prd-header">WMM Power Save Performance Criteria</div> 
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
  const raw_data = props.data.map(r =>  Object.assign(r.data, { test_name: r.test_name }))

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
