import React, { Component } from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { submitRegistration, logout } from '../../services/authentication/actions'
import { Redirect } from 'react-router-dom'

import './style.css';


class RegisterUser extends Component {
  constructor(props){
    super(props)
    this.state = {
      email: '',
      password: '', 
      firstName: '',
      lastName: '',
      showWarning: false, 
      redirect: false
    }
  }

  componentWillReceiveProps(nextProps) {
    // if the register is done (authRequested == false), redirect to home page
    if (this.props.authentication.authRequested === true && nextProps.authentication.authRequested === false) {
      this.setState({redirect: true})
    }
  }

  render() {
    if (this.state.redirect) {
      return <Redirect push to="/login" />
    }

    if (this.props.authentication.userAuthStatus) {
      return (
        <div>
          <p>{`You're currently logged in as ${this.props.authentication.user.fname} ${this.props.authentication.user.lname}, please log out to register a new user`}</p>
          <button onClick={this.props.logout}>LOG OUT</button>
        </div>
      )
    }

    return (
    <div id="login-container" onKeyUp={e => e.keyCode === 13 && this.handleSubmit()}>

      <h1>New User Registration</h1>

      {Object.entries(this.props.authentication.loginError).map((err) => <h3 key={err[0]}>Problem: {err[0]} - {err[1]}</h3>)}
      {this.state.showWarning && <p>Enter ALL fields please</p>}

      <p>First Name</p>
      <input
        placeholder="First Name" 
        value={this.state.firstName} 
        onChange={e => this.handleChange(e, 'firstName')}
      />
      <p>Last Name</p>
      <input
        placeholder="Last Name" 
        value={this.state.lastName} 
        onChange={e => this.handleChange(e, 'lastName')}
      />

      <p>Password</p>
      <input 
        placeholder="Password"
        value={this.state.password}
        onChange={e => this.handleChange(e, 'password')}        
      />

      <p>e-mail</p>
      <input
        placeholder="e-mail" 
        value={this.state.email} 
        onChange={e => this.handleChange(e, 'email')}
      />
      {/* <p> ADD Charter Number? </p> */}

      <button type="submit" onClick={() => this.handleSubmit()}>Submit</button>
      
    </div>
    )
  }

  handleChange(e, type) {
    this.setState({[type]: e.target.value})
  }

  handleSubmit() {
    const { firstName, lastName, email, password } = this.state
    if (firstName && lastName && email && password) {
      this.setState({showWarning: false}) 
      this.props.submitRegistration({ first_name: firstName, last_name: lastName, email1:email, email2:email, password1:password, password2:password }) // => .action(user)
    } else {
      this.setState({showWarning: true})
    }
  }
}

///// REDUX hook-up

const mapStateToProps = state => ({
  authentication: state.authentication 
})

const mapDispatchToProps = dispatch => bindActionCreators({
  submitRegistration, 
  logout
}, dispatch)

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(RegisterUser)

