import React, { Component } from 'react';
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'

import Navbar from './layout/nav-bar'
import PageDisplay from './layout/page-display'
import { ErrorMessageDisplay } from './error-message-display'
import { setError } from '../../services/error-handling/actions'

import './style.css';


const mapStateToProps = (state) => ({
  errorMessage: state.errorMessage,
})

class App extends Component {
  render() {
    return (
      <div className="App">
        <Navbar />
        {this.props.errorMessage &&
          <ErrorMessageDisplay errorMessage={this.props.errorMessage}
                               errorClass="error-message" />
        }
        <PageDisplay />
      </div>
    );
  }
}

// export default App;

export default withRouter(connect(
  mapStateToProps, 
  { setError }
)(App));
