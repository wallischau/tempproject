import React, { Component } from 'react'
import { connect } from 'react-redux'
import { submitLogin, resetPassword } from '../../services/authentication/actions'
import { Redirect } from 'react-router-dom'

import './style.css';

/// userAuthStatus = BOOL is a user logged in or not?
/// authRequested = BOOL is a loging request pending?

class Login extends Component {
  constructor(props){
    super(props)
    this.state = {
      email: '',
      password: '', 
      showWarning: false, 
      redirect: false
    }
  }

  render() {
    if (this.props.authentication.userAuthStatus) {
      return <Redirect push to="/" />
    }
    return (
    <div id="login-container"
      onKeyUp={e => e.keyCode === 13 && this.handleSubmit()}
    >
      <h1>Charter WiFi Automation Login</h1>

      {Object.entries(this.props.authentication.loginError).map((err) => <h3 key={err[0]}>Problem: {err[0]} - {err[1]}</h3>)}

      <p>Email</p>
      <input
        placeholder="Email" 
        value={this.state.email} 
        onChange={e => this.handleChange(e, 'email')}
      />

      {this.state.showWarning && <p>Enter both an email and a password</p>}
      
      <p>Password</p>
      <input 
        placeholder="Password"
        type="password"
        value={this.state.password}
        onChange={e => this.handleChange(e, 'password')}
      />


      <button type="submit" onClick={() => this.handleSubmit()}>LOGIN</button>

      <p
      style={
      { textDecoration: 'underline'
      , cursor: 'pointer'
      , width: 'fit-content'
      }} 
      onClick={() => this.resetPassword()}>Reset password</p> 
      
    </div>
    )
  }

  handleChange(e, type) {
    this.setState({[type]: e.target.value})
  }

  resetPassword() {
    if (this.state.email.length < 3) {
      window.alert('Enter your email to reset')
    } else {
      if (window.confirm(`Reset Password for ${this.state.email}?`)) {
        this.props.resetPassword(this.state.email)
        .then(res => {
          if (res.ok) {
            window.alert('Reset password emailed')
          } else {
            res.json().then(({ error }) => {
              window.alert(error)
            })
          }
        })
        .catch(err => {
          window.alert('Failed to reset Password, go yell at a dev')
        })
      }
    }
  }

  handleSubmit() {
    // redo with auth
    const { email, password } = this.state
    if (email && password && !this.props.authentication.authRequested) {

      this.setState({showWarning: false}) 
      this.props.submitLogin({ email: email, password })
    } else {
      this.setState({showWarning: true})
    }
  }
}

///// REDUX hook-up

const mapStateToProps = state => ({
  authentication: state.authentication 
})


export default connect(
  mapStateToProps,
  { submitLogin, resetPassword }
)(Login)
