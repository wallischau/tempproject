import React from 'react'

import SingleSelect from '../../app/single-select'
import { chart_series_types } from './standards'


class SelectChartSeries extends React.Component { 
  
  fromTestRunToDisplayString(tr) {
    const test_types = Object.keys(tr.test_results)
      .map(tt => {
        return tt.split('_').map(s => s.charAt(0).toUpperCase() + s.slice(1)).join(' ')
      })
      .join('/')

    let datetime = '00'
    if (tr.test_start) {
      const trSplit = tr.test_start.split('T')
      const timeSplit = trSplit[1].split(':')
      const date = trSplit[0]
      const time = [timeSplit[0], timeSplit[1]].join(':')
      datetime = `${date} ${time}`
    }
    
    const name = tr.user ? tr.user.lname : 'someone'

    const display = `${datetime} - ${name} - ${test_types} (${tr.firmware.company} ${tr.firmware.model_name})`
    
    return display
  }

  render() { 
    const chart_series_info = this.props.runs.reduce((out, current, i) => {
      switch (this.props.chart_series_type_id*1) {
        case 0: {
          const previously_added = out[current.firmware.model_name] || []
          return Object.assign(out, { [current.firmware.model_name]: [...previously_added, current] })
        }
        case 1: {
          const previously_added = out[current.firmware.name] || []
          return Object.assign(out, { [current.firmware.name]: [...previously_added, current] })
        }
      
        default:
          return Object.assign(out, {[this.fromTestRunToDisplayString(current)]: [current]})
      }

       
    }, {})

    return (
      <div 
        style={{
          gridColumn: '1/3',
          gridRow: '2',
          borderTop: '2px black solid',
          display: 'grid',
          gridTemplateColumns: '1fr 2fr',
          gridGap: '10px'
        }} 
      >
        <div
          style={{
            gridColumn: '1'            
          }}
        >
          <p>Select Chart Series Type:</p>
          <SingleSelect 
            style={{ width: '200px' }}
            value={this.props.chart_series_type_id+''} 
            state_key={'chart_series_type_id'} 
            options={chart_series_types} 
            handleChange={this.props.handleChange} 
          />
        </div>

        <div
          style={{
            gridColumn: '2'
          }}
        >
          <p>Runs Currently Selected (click run to remove):</p>
          <div
            style={{
              border: '1px solid black',
              background: 'white',
              padding: '10px'
            }}
          >
          {
            Object.keys(chart_series_info).map(set => {
              return (
                <div key={set}>
                  {this.props.chart_series_type_id*1 !== 2 && <p style={{ borderBottom: '1px solid black' }}>{set}</p>}
                  {chart_series_info[set].map(tr => {
                    return (
                      <p key={tr._id}
                        style={{
                          cursor: 'pointer',
                        }}
                        onClick={() => this.props.removeRunFromSelected(tr._id)}
                      >
                        — {<span style={{ textDecoration: 'underline' }}>{this.fromTestRunToDisplayString(tr)}</span>}
                      </p>
                    )
                  })}
                </div>
              )
            })
          }
          </div>
        </div>
      </div>
    )
  }
}


export default SelectChartSeries
