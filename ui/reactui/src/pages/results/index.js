import React, { Component } from 'react'
import { connect } from 'react-redux'

import { getTestRuns } from '../../services/test-runs/actions'
import { getFirmware } from '../../services/firmwares/actions'

import IndividualResultView from '../../components/results/individual-view'
import ComparsionResultsView from '../../components/results/comparison-view/index'
import AuthFilter from '../../components/app/auth-filter'
import SwapModeButton from '../../components/results/swap-mode-button'

import './style.css'


const mapStateToProps = state => ({
  firmwares: state.firmwares.firmwares,
  test_runs: state.test_runs.test_runs,
  test_runs_pending: state.test_runs.test_runs_request_pending,
  firmwares_pending: state.firmwares.firmwares_request_pending, 
  user_id: state.authentication.user._id
})

const INDV = 'individual view'
const COMP = 'comparison view'

class ResultsPage extends Component {
  constructor(props) {
    super(props)
    this.state={
      mode: INDV 
    }
    
    if (this.props.firmwares.length === 0) {
      this.props.getFirmware()
    }
  }

  /// consider pulling back out the tidy test runs to here? BUT the user and test_type filters would need to be here too.... hmmmm 

  tidyFirmwares() {
    return [{ display:"---", id:'0' }].concat(
      this.props.firmwares
      .map(firm => ({ display:`${firm.company} ${firm.model_name} ${firm.name}`.trim(), id:firm._id }))
      .sort((a, b) => a.display.localeCompare(b.display)))
  }

  toggleMode() {
    this.setState({ mode: this.state.mode === INDV ? COMP : INDV })
  }

  render() {
    // const { handleChange, handleUserCheck, handleTestTypeFilterCheck} = this
    const { test_runs_pending, firmwares_pending, getTestRuns, user_id } = this.props


    return ( 
      <AuthFilter>
        <div className="results">
          <h1 className="results-title">Test Results</h1>
          <SwapModeButton toggleMode={() => this.toggleMode()} mode={this.state.mode}/>      
          {/* MAKE THESE TO BE ROUTES! /single, /comparative */}
          {/* single view */}
          {
            this.state.mode === INDV &&
            <IndividualResultView 
              {...{ test_runs_pending, firmwares_pending, getTestRuns, user_id }} 
              test_runs={this.props.test_runs} //
              firmwares={this.tidyFirmwares()}
            />
          }

          {/* compare view */}
          {
            this.state.mode === COMP &&
            <ComparsionResultsView 
              {...{ test_runs_pending, firmwares_pending, getTestRuns, user_id }}
              test_runs={this.props.test_runs} // 
              firmwares={this.tidyFirmwares()}
            />
          }

        </div>
      </AuthFilter>
    )
  }
}


export default connect(
  mapStateToProps, 
  { getFirmware, getTestRuns }
)(ResultsPage)
