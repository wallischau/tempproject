import React from 'react';
import ReactTable from 'react-table'

import { pass_rate_columns, performace_columns } from '../prd-columns'


const smaller_width = 75

//// Need confirmation of data mapping to column 
const columns = [
  {
    Header: 'Interface', 
    accessor: 'interface', 
    width: 150
  }, {
    Header: 'Frequency', 
    accessor: 'ghz', 
    width: smaller_width
  }, {
    Header: 'Bandwidth', 
    accessor: 'mhz',
    width: smaller_width    
  }, {
    Header: 'MCS/Data Rate', 
    accessor: 'data_rate_mbps', 
    width: smaller_width    
  }, {
    Header: 'SS', 
    accessor: 'ampdu', 
    width: smaller_width
  }, {
    Header: 'Forwarding Rate',
    accessor: 'forwarding_rate_kbps',
    headerStyle: { textAlign: 'left' }
  }
]

const groupA = [
  {
    interface: '802.11ag', 
    ghz: 2.4, // why is this a number? 
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 2.4,
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 2.4,
    mhz: 20,
    mcs: 23
  }
]
const groupB = [
  {
    interface: '802.11ag', 
    ghz: 2.4, 
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11ag', 
    ghz: 2.4, 
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 2.4,
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 2.4,
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 2.4,
    mhz: 20,
    mcs: 23
  }, {
    interface: '802.11n', 
    ghz: 2.4,
    mhz: 20,
    mcs: 23
  }
]
const groupC = [
  {
    interface: '802.11ag', 
    ghz: 5, 
    mhz: 20, 
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 20,
    mcs: 23
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 40,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 40,
    mcs: 23
  }, {
    interface: '802.11ac', 
    ghz: 5,
    mhz: 80,
    mcs: 7, 
  }, {
    interface: '802.11ac', //// no mimo in data results 
    ghz: 5,
    mhz: 80,
    mcs: 7, 
  }
]
const groupD = [
  {
    interface: '802.11ag', 
    ghz: 5, 
    mhz: 20, 
    mcs: 15
  }, {
    interface: '802.11ag', 
    ghz: 5, 
    mhz: 20, 
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 20,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 20,
    mcs: 23
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 20,
    mcs: 23
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 40,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 40,
    mcs: 15
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 40,
    mcs: 23
  }, {
    interface: '802.11n', 
    ghz: 5,
    mhz: 40,
    mcs: 23
  }, {
    interface: '802.11ac', 
    ghz: 5,
    mhz: 80,
    mcs: 7, 
  }, {
    interface: '802.11ac', 
    ghz: 5,
    mhz: 80,
    mcs: 7, 
  }, {
    interface: '802.11ac', //// no mimo in data ? spacial streams? 
    ghz: 5,
    mhz: 80,
    mcs: 7, 
  }, {
    interface: '802.11ac', 
    ghz: 5,
    mhz: 80,
    mcs: 7, 
  }
]

const dataPreMap = (data) => {
  return data.reduce((out, cur) => {
    if (!!cur.data) {
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

export const gen_prd_pass_rate = (data, total_errors) => {
  /// for each group, order by fwd rate (break out fucntion)

  const table_row = {
    criteria: 'Mixed Client',
    achieved: null,
    passed: 0,
    failed: 0,
    aborted: total_errors,
    total: total_errors
  }
  const groupA_results = data.find(d => d.length === groupA.length)
  const groupB_results = data.find(d => d.length === groupB.length)
  const groupC_results = data.find(d => d.length === groupC.length)
  const groupD_results = data.find(d => d.length === groupD.length)
  //////////////////////
  // check if the results exists before processing here!
  //////////////////////////
  const allgroups = [
    { rank: groupA, results: groupA_results }, 
    { rank: groupB, results: groupB_results }, 
    { rank: groupC, results: groupC_results }, 
    { rank: groupD, results: groupD_results }
  ]
  
  for (let index = 0; index < allgroups.length; index++) {
    const grouper = allgroups[index]
    const rank = grouper.rank
    const result = grouper.results

    if (result) {
      table_row.total++
      
      result.sort((a, b) => a.forwarding_rate_kbps - b.forwarding_rate_kbps)
      // check group order to the prd_ranking
      let passed = 0
      for (let index = 0; index < rank.length; index++) {
        if (
          rank[index].interface ===  result[index].interface && 
          rank[index].ghz === result[index].ghz &&
          rank[index].mhz === result[index].mhz &&
          rank[index].mcs === result[index].mcs
        ) {
          passed++
        }
      }

      if (passed === rank.length) {
        table_row.passed++
      } else {
        table_row.failed++
      }
    }
  }


  table_row.achieved = Math.round(table_row.passed/table_row.total*100) + '%'
  return [table_row]

}

export const gen_performace_data = (data, total_errors) => {
  /// for each group, order by fwd rate   
  /// then for each group, how many clients are in the correct order? 
  /// 

  const table_row = {
    criteria: 'Ranking of forwarding rates of Client Groups',
    passed: 0,
    total: total_errors
  }

  const groupA_results = data.find(d => d.length === groupA.length)
  const groupB_results = data.find(d => d.length === groupB.length)
  const groupC_results = data.find(d => d.length === groupC.length)
  const groupD_results = data.find(d => d.length === groupD.length)
  //////////////////////
  // check if the results exists before processing here!
  //////////////////////////
  const allgroups = [
    { rank: groupA, results: groupA_results }, 
    { rank: groupB, results: groupB_results }, 
    { rank: groupC, results: groupC_results }, 
    { rank: groupD, results: groupD_results }
  ]
  
  for (let index = 0; index < allgroups.length; index++) {
    const grouper = allgroups[index]
    const rank = grouper.rank
    const result = grouper.results

    if (result) {
      result.sort((a, b) => a.forwarding_rate_kbps - b.forwarding_rate_kbps)
      for (let index = 0; index < rank.length; index++) {
        table_row.total++
        if (
          rank[index].interface ===  result[index].interface && 
          rank[index].ghz === result[index].ghz &&
          rank[index].mhz === result[index].mhz &&
          rank[index].mcs === result[index].mcs
        ) {
          table_row.passed++
        }
      }
    }
  }

  return [table_row]
}


export const PRDSection = (props) => {
  ////////////////////////////////////////////
  //// MUST ACCOUNT FOR PRD TYPE (wave 1, wave 2) **** 
  //// @#$%@#$%@#$ Big changes in historial data, needs to be noted!! 
  ///////////////////////////////////////////

  const { filtered_data, error_data } = dataPreMap(props.data)
  const total_errors = error_data.length

  let prd_pass_rate_data
  let prd_performance_criteria_data
  
  try {
    prd_pass_rate_data = gen_prd_pass_rate(filtered_data, total_errors)
    prd_performance_criteria_data = gen_performace_data(filtered_data, total_errors)
  } catch (error) {
    console.log(error)
    return <div>Error with results data</div>
  }

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">
        <div className="prd-header">Charter SLA: Mixed Client Required Percent Pass Rate</div>          
        {/* pass/fail calculated and displayed here */}
        <ReactTable
          style={{ width: 'max-content' }}          
          data={prd_pass_rate_data} 
          columns={pass_rate_columns}
          showPagination={false}
          defaultPageSize={prd_pass_rate_data.length}
        />

        <div className="prd-header">Mixed Client Performance Criteria</div> 
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
  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
      {
        props.data.map(result => {
          return (
            <div key={result._id}>
              <div className="prd-header">{result.test_name}</div>
              <ReactTable 
                data={result.data}
                columns={columns}
                defaultPageSize={result.data.length}
                showPagination={false}
                className="-striped -highlight"
              />
            </div>
          )
        })
      }
      </div>
    </section>
  ) 
}
