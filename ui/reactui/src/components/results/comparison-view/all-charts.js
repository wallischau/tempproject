import React from 'react'

import TCPCompare from './test-type-results/tcp'
import UDPCompare from './test-type-results/udp'
import MaxClientCompare from './test-type-results/max-client'
import RvRCompare from './test-type-results/rate-v-range'

import './view-styles.css'

const lookup = {
  'tcp_goodput': TCPCompare,
  'udp_throughput': UDPCompare,
  'max_client': MaxClientCompare,
  'rate_vs_range': RvRCompare
}

const AllCharts = (props) => {
  const Compo = lookup[props.test_type]

  if (!!props.runs.length) {
    return <div>
        <Compo {...props} />
        <div style={{ height: '200px' }} />
      </div>
  } else {
    return null
  }
}


export default AllCharts
