import React from 'react'
import { connect } from 'react-redux'

import { changePassword } from '../../services/authentication/actions'

const MIN_PASSWORD_LENGTH = 6

const styles = {
  input: {
    marginTop: '20px',
    width: '200',
    display: 'block',
    padding: '6px',
  }
}

class ChangePassword extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      newPasswordA: '',
      newPasswordB: '',
      readyToSubmit: false,
      buttonText: 'Fill out form'
    }
  }

  handleChange(e, type) {
    this.setState({[type]: e.target.value}, () => {
      const bothPassMatch = this.state.newPasswordA === this.state.newPasswordB
      if (this.state.newPasswordA.length >= MIN_PASSWORD_LENGTH) {
        if (bothPassMatch) {
          this.setState({ readyToSubmit: true, buttonText: 'Submit Password Change' })
        } else {
          this.setState({ readyToSubmit: false, buttonText: 'New Passwords Must Match' })        
        }
      } else {
        this.setState({ readyToSubmit: false, buttonText: 'Password minimum length is ' + MIN_PASSWORD_LENGTH })
      }
    })
  }

  handleSubmit() {
    if (!this.state.readyToSubmit) return
    this.props.changePassword(this.props.user, this.state.newPasswordA)
    .then(success => {
      if(success) {
        this.props.history.push('/')
      } else {
        console.log('didn\'t work')
      }
    })

  }

  render() {
    return (
      <div style={{
        width: '400px',
        margin: '0 auto',
        padding: '20px',
        borderLeft: 'solid #0066cc 2px',
        borderBottom: 'solid #0066cc 1px'
      }}
        autoComplete="new-password"
      >
        <h1 style={{}}>Change Password</h1>
        <h4>{this.props.user.email}</h4>
        <input
          name="newA"
          autoComplete="new-password"        
          style={styles.input}  
          placeholder="New Password"
          value={this.state.password}
          type="password"
          onChange={e => this.handleChange(e, 'newPasswordA')}        
        />
        <input 
          name="newB"
          autoComplete="new-password"           
          style={styles.input}
          placeholder="Re-Enter New Password"
          value={this.state.password}
          type="password"
          onChange={e => this.handleChange(e, 'newPasswordB')}        
        />
        <button 
          style ={{
            marginTop: '30px',
            width: '200px',
            padding: '10px',
            boxSizing: 'border-box',
            border: 'none',
            color: this.state.readyToSubmit && 'white',
            backgroundColor: this.state.readyToSubmit && 'green' 
          }}
          onClick={() => this.handleSubmit()}>
          {this.state.buttonText}
        </button>
      </div>
    )
  }
}

const mapStateToProps = state => ({
  user: state.authentication.user
})


export default connect(
  mapStateToProps, 
  { changePassword }
)(ChangePassword)
