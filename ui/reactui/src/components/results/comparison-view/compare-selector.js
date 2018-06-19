import React from 'react'

import SingleSelect from '../../app/single-select'
import SelectChartSeries from './select-chart-series'


class CompareSelector extends React.Component {
  constructor(props) {
    super(props)
    
    this.state = { 
      show_options: false
    }
  }

  toggleOptions() {
    this.setState({ show_options: !this.state.show_options })
  }

  render() {
    const {
      firmwares, 
      firmware_id,
      firmwares_pending, 
      test_run_options, 
      test_runs_pending, 
      handleChange, 
      handleUserCheck, 
      filter_by_user,
    } = this.props

    return (
      <div className="results-selector well"
        style={{
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
          <p className="select-header">Select Test Type:</p>        
          {
            <div style={{ height: '50px' }}>
              <SingleSelect
                value={this.props.selected_test_type_id} 
                state_key={'selected_test_type_id'} 
                options={this.props.test_type_lookup} 
                handleChange={handleChange} 
              />
            </div>
          }

          <p className="select-header">Select Firmware:</p>
          {
            <div style={{ height: '50px' }}>
              {
                firmwares_pending ?
                <div>loading</div>
                :
                <SingleSelect
                  value={firmware_id.toString()} 
                  state_key={'firmware_id'} 
                  options={firmwares} 
                  handleChange={handleChange} 
                />
              }
            </div>
          }

          <div style={{ margin: '10px 0' }}>
            {/* user checkbox */}
            <label style={{ border:'1px solid black', background: filter_by_user && '#ccffcc', padding: '5px' }}>
              Only Show My Test Runs
              <input
                type="checkbox" 
                checked={this.props.filter_by_user}
                onChange={handleUserCheck}
                style={{ width: 'initial', display: 'none' }}
              />
            </label>
          </div>
        </div>


        <div className="select-test-run"
          style={{
            gridColumn: '2'
          }}
        >
          <p className="select-header">Select Test Run:</p>
          {
            <div 
              style={{
                border: '1px solid black',
                background: 'white',
                overflowY: 'scroll',
                height: '200px',
                padding: '10px'
              }}
            >
              {
                test_runs_pending ? 
                  'loading...'
                :
                test_run_options.length ?
                  test_run_options.map(tr => {
                    return (
                      <p key={tr.id} 
                        style={{
                          cursor: 'pointer',
                          textDecoration: 'underline'
                        }}
                        onClick={() => this.props.addRunToSelected(tr.id)}>
                        {tr.display}
                      </p>
                    )
                  })
                :
                'No test runs found (check options)'
              }
            </div>
          }
        </div>

        <SelectChartSeries 
          runs={this.props.runs_selected_to_compare} 
          chart_series_type_id={this.props.chart_series_type_id}
          removeRunFromSelected={this.props.removeRunFromSelected}
          handleChange={handleChange}
        />

      </div>
    )
  }
} 


export default CompareSelector
