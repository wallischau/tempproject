import React from 'react'

import CompareSelector from './compare-selector'
import ErrorBoundary from '../../app/error-boundary'
import { handleChangeSingleSelect } from '../../app/single-select'
import AllCharts from './all-charts'

const test_type_lookup = [
  { display: 'TCP', id: "tcp_goodput"},
  { display: 'UDP', id: "udp_throughput"},
  { display: 'Max Client', id: "max_client"},
  { display: 'Rate vs Range', id: "rate_vs_range"},
  // "latency",
  // "mixed_client",
  // "near_far",
  // "triple_play",
  // "unicast_video",
  // "wmm_power_save",
  // "realworld_qoe",
  // "packet_capture",
  // "packet_loss",
  // "multicast_video",
  // "reuse_of_airtime"
].sort() // -_- 

class ComparativeResultView extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      firmware_id: '0',        

      selected_test_type_id: test_type_lookup[0].id,

      chart_series_type_id: 0,

      runs_selected_to_compare: [],
      filter_by_user: false, 
    }
    
    this.addRunToSelected = this.addRunToSelected.bind(this)
    this.removeRunFromSelected = this.removeRunFromSelected.bind(this)
    this.handleChange = this.handleChangeWrap.bind(this)
    this.handleUserCheck = this.handleUserCheck.bind(this)
    this.handleChartSeriesChange = handleChangeSingleSelect.bind(this)
  }

  componentWillUpdate(nextProps, nextState) {
    if (this.state.firmware_id !== nextState.firmware_id) {
      if (nextState.firmware_id*1 !== 0) {
        this.props.getTestRuns(nextState.firmware_id) 
      }
    }

    return true
  }

  addRunToSelected(test_run_id) {
    const test_run = this.props.test_runs.find(tr => tr._id === test_run_id)
    !this.state.runs_selected_to_compare.includes(test_run) && this.setState({ runs_selected_to_compare: [...this.state.runs_selected_to_compare, test_run] })
  }

  removeRunFromSelected(test_run_id) {
    const filtered_runs = this.state.runs_selected_to_compare.filter(tr => tr._id !== test_run_id)
    this.setState({ runs_selected_to_compare: filtered_runs })
  }

  tidyTestRuns() {
    if (this.props.test_runs.length === 0) {
      return []
    }

    let raw_options = []
    if(this.state.filter_by_user) {
      raw_options = this.props.test_runs.filter(tr => { 
        if (tr.user) {
          return tr.user._id === this.props.user_id
        }
        return false
      })
    } else {
      this.props.test_runs.length && (raw_options = this.props.test_runs)
    }

    raw_options = raw_options.filter(run => {
      return Object.keys(run.test_results).includes(this.state.selected_test_type_id)
    })

    // make the display pretty for the select
    const test_run_options = raw_options.map(tr => {
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

      const display = `${datetime} - ${name} - ${test_types}`
      return {
        display, 
        id: tr._id
      }
    })

    if (test_run_options.length === 0) {
      return []
    }
    return test_run_options.sort((a, b) => b.display.localeCompare(a.display))
  } 

  handleUserCheck(e) {
    this.setState({ filter_by_user: e.target.checked })
  }

  handleChangeWrap(e) {
    const key = e.target.name || e.target.getAttribute('state_key'); 
    if (key !== 'selected_test_type_id') {
      handleChangeSingleSelect.bind(this)(e)
    } else {
      this.setState({ runs_selected_to_compare: [] }, handleChangeSingleSelect.bind(this)(e))
    }
  }


  render() {
    const { handleChange, handleUserCheck, addRunToSelected, removeRunFromSelected } = this
    const { test_runs_pending, firmwares_pending, firmwares } = this.props

    return (
      <ErrorBoundary>
        {/* selector */}
        <CompareSelector 
          test_run_options={this.tidyTestRuns()}
          {...this.state} 
          {...
          { firmwares
          , test_runs_pending
          , firmwares_pending
          , handleChange
          , handleUserCheck 
          , addRunToSelected
          , removeRunFromSelected
          , test_type_lookup
          }} 
        />
        {/* per test type splitter */}
        <AllCharts 
          runs={this.state.runs_selected_to_compare} 
          test_type={this.state.selected_test_type_id}
          chart_series_type_id={this.state.chart_series_type_id}
        />

      </ErrorBoundary>
    )
  }
}


export default ComparativeResultView 
