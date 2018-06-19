import React, { Component } from 'react';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'

import AuthFilter from '../../components/app/auth-filter'
import ChamberStatusGrid from '../../components/chamber/chamber-status-grid'

import { fetchChambers, fetchDuts, updateChamber } from '../../services/chambers/actions'

import './style.css'

class ChamberStatus extends Component {
  constructor(props) {
    
    super(props);

    window.socket.on('model-update-TestChamber',
                     this.updateChamber.bind(this));

  }

  /**
   * When our compontent is finished loading, we'll attempt to fetch 
   * a list of chambers 
   * NOTE: this method is only called one time when the component is initially rendered
   */
  componentDidMount() {
    this.props.fetchChambers();
    this.props.fetchDuts();
  }

  updateChamber(chamberUpdate) {
    this.props.updateChamber(chamberUpdate);
  }

  getChamberDetails(id) {
    return this.props.chambers.find((x) => x._id === id)
  }
  
  render() {
    let makeFilter = undefined
    if (this.props.match.params) {
      makeFilter = this.props.match.params.make
    }
    return (
      <AuthFilter>
        <ChamberStatusGrid chambers={this.props.chambers}
                           duts={this.props.duts}
                           makeFilter={makeFilter}
                           match={this.props.match}
                           user={this.props.user} />
      </AuthFilter>
    );
  }
}

// { [key]: <store location> }
// Locate the store and assign it to Component.props[key]
//
// Notice the this.props.chambers, which should have the chamber once our 
// action has been completed
//
// state = /smart/ui/reactui/src/services/index.js, which has the chambers
// field.
const mapStateToProps = state => ({ 
  user: state.authentication.user,
  chambers: state.chambers.chambers,
  duts: state.chambers.duts
})

// Bind actions for dispatch. These will be stored in the
// Component.props
// 
// This is how actions get injected into the component; 
// notice this.props.fetchChambers()
const mapDispatchToProps = dispatch => bindActionCreators({ 
  fetchChambers,
  fetchDuts,
  updateChamber
}, dispatch)

// Wrap state and dispatch functions against the ChamberStatus component. This 
// needs to be done so Redux can communicate with the component and vice versa
export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(ChamberStatus))
