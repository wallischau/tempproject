import React from 'react'
import moment from 'moment'

import { handleChangeSingleSelect } from '../../app/single-select'
import ResultsSelector from './results-selector'
import ErrorBoundary from '../../app/error-boundary'
import TestRunResults from './multi-testrun'
import MetaDataSection from './metadata-section'


class IndividualResultView extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      firmware_id: '0',
      test_run_id: '0', 
      filter_by_user: false, 
      selected_test_types: [], 
    }

    this.handleChange = this.handleChangeWrap.bind(this)
    this.handleUserCheck = this.handleUserCheck.bind(this)
    this.handleTestTypeFilterCheck = this.handleTestTypeFilterCheck.bind(this)
  }

  componentWillUpdate(nextProps, nextState) {
    if (this.state.firmware_id !== nextState.firmware_id) {
      if (nextState.firmware_id !== 0) {
        this.props.getTestRuns(nextState.firmware_id) 
      } 
    }
    
    return true
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
      raw_options = this.props.test_runs
    }


    if (this.state.selected_test_types.length > 0) {
      raw_options = raw_options.filter(tr => {
        let show = false
        const types_in_run = Object.keys(tr.test_results)
        for (let index = 0; index < types_in_run.length && !show; index++) {
          if (this.state.selected_test_types.indexOf(types_in_run[index]) >= 0) {
            show = true
          }
        }

        return show
      })
    }

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
    return [{ display: '---', id:'0' }].concat(test_run_options.sort((a, b) => b.display.localeCompare(a.display)))
  } 

  handleUserCheck(e) {
    this.setState({ filter_by_user: e.target.checked })
  }

  handleTestTypeFilterCheck(e) {
    if (e.target.checked) {
      // add to array
      this.setState({ selected_test_types: [...this.state.selected_test_types, e.target.name]})
    } else {
      const new_selected = this.state.selected_test_types.slice()
      new_selected.splice(this.state.selected_test_types.indexOf(e.target.name), 1)
      this.setState({ selected_test_types: new_selected })
    }
  }

  handleChangeWrap(e) {
    const key = e.target.name || e.target.getAttribute('state_key'); 
    if (key === 'test_run_id') {
      handleChangeSingleSelect.bind(this)(e)
    } else {
      this.setState({ test_run_id: '0' }, handleChangeSingleSelect.bind(this)(e))
    }
  }

  metaMaker(test_run) {
    const toTitleCase = str => str.replace(/\w\S*/g, txt => txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase());

    const abortCount = Object.values(test_run.test_results).reduce((out, cur) => {
      cur.forEach(res => {
        if (!!res.errors) out += res.errors.length
      })
      return out
    }, 0)

    return {
      "Test Types": Object.keys(test_run.test_results).map(tt => toTitleCase(tt.split('_').join(' '))).join(', '),
      "DUT Make/Model": `${test_run.firmware.company} ${test_run.firmware.model_name}`, 
      "DUT Firmware": test_run.firmware.name, 
      "DUT Barcode ID": test_run.dut.barcode_id,
      "DUT Type": test_run.dut.type, 
      "	*PRD	": "PRD 123"		, // lookup .prd - prd
      // "	*Test Plan Version	"	:"??"	, // ??????? - prd?
      "Tests Planned": test_run.total_planned,
      // "	*Tests in Database	": "N/A"	, //????
      "Tests Aborted	": abortCount,
      // "Rebooted During Test": test_run.reboot ? 'Yes' : 'Unknown' , 
      "Test Engineer": `${test_run.user.fname} ${test_run.user.lname}`,
      "Test Start": moment(test_run.test_start).format('YY MMM DD hh:mm a')	,
      "Test End": moment(test_run.test_end).format('YY MMM DD hh:mm a')		,
      // "	*Short Name	"	:"	N/A	"	, /// ??? 
      // " *Ran thru Automation": "N/A"	, // unneeded? 
      "Data Directory": test_run.directory,
      "Notes": test_run.notes || "N/A",
    }
  } 

  render() {
    const { handleChange, handleUserCheck, handleTestTypeFilterCheck } = this
    const { test_runs_pending, firmwares_pending, firmwares } = this.props
    
    const selected_test_run = this.props.test_runs.find(tr => tr._id === this.state.test_run_id) /// this moves to INDV result compo

    return (
      <div>
        <ResultsSelector 
          test_runs={this.tidyTestRuns()}
          {...this.state} 
          {...
          { firmwares
          , test_runs_pending
          , firmwares_pending
          , handleChange
          , handleUserCheck
          , handleTestTypeFilterCheck 
          }} 
        />
        {
          this.state.test_run_id*1 !== 0 &&
          <ErrorBoundary>
            <MetaDataSection info={this.metaMaker(selected_test_run)} />
            <TestRunResults 
              {...selected_test_run} 
            />
          </ErrorBoundary>
        }
      </div>
    )
  }
}


export default IndividualResultView
