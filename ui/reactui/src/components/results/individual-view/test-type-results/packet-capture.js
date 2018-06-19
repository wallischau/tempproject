import React from 'react';
import ReactTable from 'react-table'

// import { pass_rate_columns, performace_columns } from '../prd-columns'


const columns = [
  {
    Header: 'Frequency',
    id: 'frequency',
    accessor: d => d.channel === '6' ? '2.4' : '5'
  }, {
    Header: 'Channel', 
    accessor: 'channel'
  }, {
    Header: 'RSSI Antenna A', 
    accessor: 'ixveriwave.dbm_anta'
  }, {
    Header: 'RSSI Antenna B', 
    accessor: 'ixveriwave.dbm_antb'
  }, {
    Header: 'RSSI Antenna C', 
    accessor: 'ixveriwave.dbm_antc'
  }, {
    Header: 'RSSI Antenna D', 
    accessor: 'ixveriwave.dbm_antd'
  }
]


export const PRDSection = (props) => {
  /// this prd section is unique, it is checking and displaying data from 

  return (
    <section className="results-section ">
      <h2>PRD</h2>
      <div className="results-inner-section">
        Detailed information will be added later
      </div>
      
    </section>
  )

  // return (
  //   <section className="results-section ">
  //     <h2>PRD</h2>
  //     <div className="results-inner-section">

  //       <div className="prd-header">Packet Capture Abilities</div>          
  //       {/* pass/fail calculated and displayed here */}
  //       <ReactTable 
  //         style={{ width: 'max-content' }}
  //         data={prd_pass_rate_data} 
  //         columns={pass_rate_columns}
  //         showPagination={false}
  //         defaultPageSize={prd_pass_rate_data.length}
  //       />

  //     </div>
  //   </section>
  // )
}

export const DataSection = (props) => {
  const raw_data = props.data.map(r => r.data)

  const antenna_data = Object.keys(raw_data[0]).map(channel => {
    return { channel, ...raw_data[0][channel]}
  })

  return (
    <section className="results-section">
      <h2>Test Data</h2>
      <div className="results-inner-section">
        <h2>PCAP RSSI by antenna</h2>
        <ReactTable 
          getTdProps={() => ({ style: { textAlign: 'center' } })}
          data={antenna_data}
          columns={columns}
          showPagination={false}
          defaultPageSize={antenna_data.length}
          className="-striped -highlight"
        />
      </div>
    </section>  
  ) 
}
