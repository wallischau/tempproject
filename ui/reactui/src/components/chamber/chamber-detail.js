import React, { Component } from 'react';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'

import ChamberTabs from './chamber-tabs'
import { populateTestItems } from '../../services/testqueue/actions'
import { ErrorMessageDisplay, SuccessMessageDisplay } from '../app/error-message-display'
import { reserveChamber, unReserveChamber, fetchChambers, fetchDuts, saveDut } from '../../services/chambers/actions'
import SnackbarMessage from '../app/snackbar-error-message-display' 
// import { setTestSetupError } from '../../services/snackbars/actions'



class ChamberDetail extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentTab: 'config',
      errorMessage: '',
      successMessage: '',
      startDate: null,
      endDate: null
    };

    this.back = this.back.bind(this);
    this.stopBack = this.stopBack.bind(this);
    this.setTab = this.setTab.bind(this);
    this.tabIsActive = this.tabIsActive.bind(this);
    this.changeDut = this.changeDut.bind(this);
  }

  componentDidMount() {
    //// oh holy knight this needs fixin
    document.body.style.overflow = 'hidden'; 
    if (!this.props.chamber) {
      this.props.fetchChambers();
    }

    if (this.props.duts.length === 0) {
      this.props.fetchDuts();
    }
  }

  componentWillUnmount() {
    //// oh holy knight this needs fixin
    document.body.style.overflow = 'auto';
  }

  back(e) {
    e.stopPropagation();
    this.props.history.goBack();
  }

  stopBack(e) {
    e.stopPropagation();
  }

  setTab(tab) {
    if (tab !== this.state.currentTab) {
      this.setState({ currentTab: tab });
      
      if (tab !== 'wiring'){
        try {
          window.jpi.reset(); //// never do this anywhere (except for right here)... or else!
        } catch(e) {}
      }
    }
  }

  tabIsActive(tab) {
    return this.state.currentTab === tab ? 'active' : '';
  }

  /// get this out here maybe?
  changeDut(value){
    this.setState({chosenDut: value._id})
  }

  updateQueuedTests(updatedQueuedTests) {
    this.setState({queuedTests: updatedQueuedTests});
  }

  render() {
    // console.log('state:',  this.state);
    // console.log('props:', this.props);
    if (!this.props.chamber) {
      return (
        <div
          onClick={this.back}
          className='modal-container'
        >
          <div 
            onClick={this.stopBack}
            className='modal'
          >
            <div className="modal-header">
              <h3>
                {'Chamber Details (Loading...)'}
              </h3>
            </div>
          </div>
        </div>
      )
    }

    let chamberName = this.props.chamber.name;
    let errorMessage = null;
    let successMessage = null;
    if (chamberName in this.props.testSetupMessages) {
      errorMessage = this.props.testSetupMessages[chamberName].error ?
                        this.props.testSetupMessages[chamberName].error :
                        null;
      successMessage = this.props.testSetupMessages[chamberName].success ?
                          this.props.testSetupMessages[chamberName].success :
                          null;
    }

    console.log('snackbarMsg: ', this.props.snackbarMessage);
//    if (errorMessage) {
//      this.props.showErrMessage(chamberName, errorMessage);
//    }

    return (
      <div
        onClick={this.back}
        className='modal-container'
      >
        <div 
          onClick={this.stopBack}
          className='modal'
        >
          <div className="modal-header">
            <h3>
              {'Chamber Details (Chamber ' + 
               chamberName + ')'}
            </h3>
          </div>
          {/* {this.props.snackbarMessage &&
            <SnackbarMessage errorMessage={this.props.snackbarMessage}
                                 errorClass="test-setup-error" />          
          } */}
         {successMessage && 
            <SuccessMessageDisplay successMessage={successMessage}
                                   successClass="test-setup-success" />
          }
          <div className="tab">
            <button className={this.tabIsActive('config')}
                    onClick={() => this.setTab('config')}>
              Configuration
            </button>

            <button className={this.tabIsActive('wiring')}
                    onClick={() => this.setTab('wiring')}>
              Wiring
            </button>

            <button className={this.tabIsActive('dut')}
                    onClick={() => this.setTab('dut')}>
              DUT
            </button>

            <button className={this.tabIsActive('reserve')}
                    onClick={() => this.setTab('reserve')}>
              Reserve
            </button>

            <button className={this.tabIsActive('setup')}
                    onClick={() => this.setTab('setup')}>
              Test Setup
            </button>
          </div>
          <ChamberTabs tab={this.state.currentTab}
                       chamber={this.props.chamber}
                       duts={this.props.duts}
                       setTab={this.setTab}
                       user={this.props.user}
                       />
          <div className="modal-footer">
            <button className="btn" onClick={this.back}>Close</button>
          </div>
        </div>
        </div>
      )
    }
  }

const mapStateToProps = (state, currentProps) => ({
  testSetupMessages: state.chambers.testSetupMessages,
  chamber: state.chambers.chambers.find(
    c => c.name === currentProps.match.params.name),
  duts: state.chambers.duts,
  user: state.authentication.user,
  snackbarMessage: state.snackbars.snackbarMessage
})

const mapDispatchToProps = dispatch => bindActionCreators({ 
  populateTestItems,
  saveDut,
  reserveChamber,
  unReserveChamber,
  // setTestSetupError,
  fetchChambers,
  fetchDuts,
  
}, dispatch)

export default connect(
  mapStateToProps,
  mapDispatchToProps
) (ChamberDetail)

