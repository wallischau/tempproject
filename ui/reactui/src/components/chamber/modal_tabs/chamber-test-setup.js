import React, { Component } from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'

import TestSuitePlaylist from './playlist-tab'
import Terminal from '../../terminal'

import { cancelTests } from '../../../services/chambers/actions'
import { setTestSetupError } from '../../../services/snackbars/actions'
import { populateTestItems } from '../../../services/testqueue/actions'


class ChamberTestSetup extends Component {
  constructor(props) {
    super(props)
    this.state = {
      selectedSSID5: '',
      selectedSSID24: '',
      queuedTests: []
    }

    this.changeSSID = this.changeSSID.bind(this)
    this.playTests = this.playTests.bind(this)
    this.updateQueuedTests = this.updateQueuedTests.bind(this)
  }

  buildTestQueueDocs(queuedTestList) {
    let fullCaseName = "";
    const queueDocs = [];

    for (let i in queuedTestList) {
      let queuedTest = queuedTestList[i];

      fullCaseName = queuedTest.name;

      for (let testTypeName in queuedTest.test_suites){
        let queuedType = queuedTest.test_suites[testTypeName];

        fullCaseName = [fullCaseName, testTypeName].join("/");

        for (let caseName in queuedType.test_cases){
          let queuedCase = queuedType.test_cases[caseName];

          if (queuedCase.enabled.currently){
            fullCaseName = [fullCaseName, caseName].join("/");

            let testQueueObject = {
              user: this.props.user.userid,
              topology: {
                ssid_5: this.state.selectedSSID5,
                ssid_24: this.state.selectedSSID24,
                chamber: this.props.chamber
              },
              test_suite: queuedTest.name,
              test_type: testTypeName,
              test_case: caseName,
              test_file: queuedTest.test_suites[testTypeName].test_file,
              runner: queuedTest.test_suites[testTypeName].runner,
              status: "pending",
            }
            queueDocs.push(testQueueObject);
          }
        }
      }
    }
    return queueDocs;
  }

  getEnabledTestCount(queuedTestList) {
    let enabledCount = 0;

    for (let i in queuedTestList) {
      let queuedTest = queuedTestList[i];

      for (let testTypeName in queuedTest.test_suites) {
        let queuedType = queuedTest.test_suites[testTypeName];

        for (let caseName in queuedType.test_cases) {
          let queuedCase = queuedType.test_cases[caseName];

          if (queuedCase.enabled.currently) {
            enabledCount++;
          }
        }
      }
    }

    return enabledCount;
  }

  playTests() {
    let chamberName = this.props.chamber.name;

    if (!this.state.selectedSSID24) {
      this.props.setTestSetupError(chamberName,
                                   'Must select a 2.4 GHz SSID');
      return;
    } 
    if (!this.state.selectedSSID5) {
      this.props.setTestSetupError(chamberName,
                                   'Must select a 5 GHz SSID');
      return;
    }

    let testsToQueue = [];
    let queuedTestList = this.state.queuedTests;

    if (this.getEnabledTestCount(queuedTestList) === 0) {
      this.props.setTestSetupError(chamberName, 
                                   'No enabled tests in the queue');
      return;
    } 
      
    testsToQueue = this.buildTestQueueDocs(queuedTestList);
    this.props.populateTestItems(this.props.chamber, testsToQueue);
  }

  changeSSID(num, value){
    if (num === 24){
      this.setState({selectedSSID24: value});
    }
    else if (num === 5){
      this.setState({selectedSSID5: value});
    }
  }

  updateQueuedTests(updatedQueuedTests) {
    this.setState({ queuedTests: updatedQueuedTests })
  }

  render() {
    let jiraLink =  'https://jira.charter.com/secure/RapidBoard.jspa?' + 
                    'projectKey=WTACCESS&rapidView=2501&view=planning'
    return (
      <div>
        {
          ['running'].includes(this.props.chamber.status) ?
          <Terminal chamber={this.props.chamber._id} />
          : this.props.chamber.status === 'cancelling' ?
          <div className='tab-content'>
            <div className='cancel-loader'></div><br/>
            <h3>Automation is currently stopping...</h3>
            This process usually takes a couple of seconds<br/><br/>
            If you believe this is an error, please make a&nbsp;
            <a  target='_blank'
                rel='noopener noreferrer'
                href={jiraLink}>JIRA ticket</a>
            &nbsp;and email the automation team
          </div>
          :
          <TestSuitePlaylist 
            chamber={this.props.chamber} 
            user={this.props.user}
            selectedSSID24={this.state.selectedSSID24}
            selectedSSID5={this.state.selectedSSID5}
            changeSSID={this.changeSSID}
            queuedTests={this.state.queuedTests}
            updateQueuedTests={this.updateQueuedTests}
          />
        }
        {
          ['open', 'reserved'].includes(this.props.chamber.status) ?
          <div style={{textAlign: 'center'}}>
            <button className="btn play-btn"
                    disabled={this.props.chamber.reserved_by &&
                              this.props.user.userid !== this.props.chamber.reserved_by}
                    onClick={this.playTests}>Play Tests</button>
          </div>
          : ['running', 'cancelling'].includes(this.props.chamber.status) &&
          <div style={{textAlign: 'center'}}>
            <button className="btn cancel-btn"
                    disabled={this.props.chamber.status === 'cancelling'}
                    onClick={() => this.props.cancelTests(this.props.chamber)}>
                      Cancel Tests</button>
          </div>
        }
      </div>
    )
  }
}

// export default ChamberTestSetup
 
const mapDispatchToProps = dispatch => bindActionCreators({ 
  cancelTests,
  setTestSetupError,
  populateTestItems
}, dispatch)

export default connect(
  null,
  mapDispatchToProps
) (ChamberTestSetup)