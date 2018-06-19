import React, { Component } from 'react';
import { Redirect } from 'react-router-dom'
//import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'


class AuthFilter extends Component {
  // checks for login status, if everything ok, whatever this component wraps will be rendered. 

  /// userAuthStatus = BOOL is a user logged in or not?
  /// firstload = BOOL false on first load and the = true after initial_load function is called
  loginRequired() {
    if (!this.props.userAuthStatus) {
      return true
    }
  }

  render() {

    if (this.props.firstload) {
      return (
        <div>loading...</div>
      )
    } else if (this.loginRequired()) {
      return <Redirect push to="/login" />
    } else {
      return this.props.children
    }

  }
}

//// REDUX

const mapStateToProps = state => ({ 
  user: state.authentication.user, 
  userAuthStatus: state.authentication.userAuthStatus, 
  firstload: state.authentication.firstload
})

// const mapDispatchToProps = dispatch => bindActionCreators({ 
// }, dispatch)

export default connect(
  mapStateToProps,
  null
)(AuthFilter)
