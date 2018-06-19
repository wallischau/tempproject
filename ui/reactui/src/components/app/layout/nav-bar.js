import React, { Component } from 'react';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { NavLink, Link } from 'react-router-dom'

import { initialPageLoad  } from '../../../services/authentication/actions'

class Navbar extends Component {
  constructor(props) {
    super(props)

    this.props.initialPageLoad() /// feeling weirder to have this here, maybe move up to app? 
  }

  render() {
    const { authentication: { userAuthStatus, user } }  = this.props
    return (
      <div className="layout-navbar">
        <NavLink to="/">
          <img src="/images/charter-logo.png" alt="Charter Logo" />
        </NavLink>
        
        <div className="layout-navbar-links">
          <NavLink to="/">Home</NavLink>

          { userAuthStatus && [
            <Link to="/chamber-status/Ixia" key="a">Ixia Chambers</Link>,
            <Link to="/chamber-status/OctoBox" key="b">OctoBox Chambers</Link>,
            <Link to="/configuration" key="d">Resource Configuration</Link>,
            <Link to="/results" key="e">View Results</Link>,
            <Link to="/reports" key="f">Reports</Link>                            
          ]}

          {
            userAuthStatus ?
            <Link to="/user-profile">{user.fname}</Link>
            :
            <Link to="/login">Login</Link> 
          }
        </div>
      </div>
    );
  }
}

///// REDUX hook-up

const mapStateToProps = state => ({
  authentication: state.authentication 
})

const mapDispatchToProps = dispatch => bindActionCreators({
  initialPageLoad
}, dispatch)

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Navbar)
