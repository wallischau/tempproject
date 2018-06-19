import React, { Component } from 'react'
import { LineChart } from 'react-chartkick';

import SingleSelect, { handleChangeSingleSelect } from '../../../../app/single-select'
 

const IND = 'individual'
const AVG = 'average'
const TOTAL = 'total'

const FWR = 'forwarding_rate_mbps'
const LAT = 'latency'
const JIT = 'jitter'
const PL = 'packet_loss'

const chart_options = [IND, AVG, TOTAL].map((e) => ({ display: e, id: e }))
const data_options = [FWR, LAT, JIT, PL].map((e) => ({ display: e, id: e }))


class RoASingleResult extends Component {
  constructor(props) {
    super(props)

    this.state = {
      chart_display: IND,
      data_selection: FWR
    }

    this.handleChange = handleChangeSingleSelect.bind(this)
  }

  render() {
    if(!this.props[IND]) {
      return (
        <div style={{ padding: '20px' }}>
          {this.props.test_name} -- no data
        </div>
      )
    }

    let line_data
    if (this.state.chart_display === IND) { 
      line_data = Object.keys(this.props[IND])
      .map(k => {
        const da_data = this.props[IND][k][this.state.data_selection].data.reduce((o,c,i) => ({ ...o, [i+1]:c }), {})
        return { name: k, data: da_data }
      })
    } else {
      line_data = this.props[this.state.chart_display][this.state.data_selection].reduce((o,c,i) => ({ ...o, [i+1]:c }), {})
    }

    return (
      <div className="roa-single-result" style={{ padding: '20px' }}>
        <h2>{this.props.test_name}</h2>
        <p style={{ display: 'inline-block', marginLeft: '30px' }}>Chart Display</p>
        <SingleSelect 
          style={{ marginLeft: '10px' }}
          state_key='chart_display'
          value={this.state.chart_display}
          handleChange={this.handleChange}
          options={chart_options}
        />
        <p style={{ display: 'inline-block', marginLeft: '30px' }}>Data Selection</p>
        <SingleSelect 
          style={{ marginLeft: '10px' }}        
          state_key='data_selection'
          value={this.state.data_selection}
          handleChange={this.handleChange}
          options={data_options}
        />
        <LineChart data={line_data} height={600}/>
      </div>
    )
  }
}


export default RoASingleResult
