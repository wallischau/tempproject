import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { logout } from '../../services/authentication/actions'
import { Link } from 'react-router-dom'

/// userAuthStatus = BOOL is a user logged in or not?
/// authRequested = BOOL is a loging request pending?

const UserProfile = ({ authentication: { user, userAuthStatus }, logout }) => {
  if (!userAuthStatus) {
    return (
      <div className="user-profile"> 
        Not logged in 
        <Link to="/login">Login here</Link>
      </div>
    )
  }

  return (
    <div className="user-profile">
      <button onClick={() => logout()}>
        LOGOUT
      </button>
      <Link to="/user-profile/password" style={{ gridColumn: '1/3', textAlign: 'center'}}>
        Change Your Password
      </Link>
      <div className="user-info-line">
        First Name: 
      </div>
      <span> {user.fname} </span>
      <div className="user-info-line">
        Last Name: 
      </div>
      <span> {user.lname} </span>
      <div className="user-info-line">
        Username: 
      </div>
      <span> {user.userid} </span>
      <div className="user-info-line">
        Email: 
      </div>
      <span> {user.email} </span>
      <div className="user-info-line">
        Groups: 
      </div>
      <span> None </span>
      <div className="user-info-line">
        Active: 
      </div>
      <span> {user.active ? 'Yes' : 'No'} </span>
    </div>
  )
}

///// REDUX hook-up

const mapStateToProps = state => ({
  authentication: state.authentication 
})

const mapDispatchToProps = dispatch => bindActionCreators({
  logout
  // update user info action here
}, dispatch)

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(UserProfile)

