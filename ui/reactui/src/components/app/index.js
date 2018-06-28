import React, { Component } from 'react';
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'

import Navbar from './layout/nav-bar'
import PageDisplay from './layout/page-display'
// import { ErrorMessageDisplay } from './error-message-display'
import { setError } from '../../services/error-handling/actions'
import SnackbarMessage from './snackbar-error-message-display' 

import './style.css';
import { setTestSetupError } from '../../services/snackbars/actions'
import { bindActionCreators } from 'redux'


const mapStateToProps = (state) => ({
  errorMessage: state.errorMessage,
  snackbarMessages: state.snackbars.snackbarMessages,
  snackbarChamberName: state.snackbars.snackbarChamberName
})

class App extends Component {
//   testErr = () => {
//     this.props.setTestSetupError("1.1", "testing");
  // }

  render() {
    console.log('this.props.snackbarMessage.length: ', this.props.snackbarMessages.length);
    console.log('this.props.snackbarMessage: ', this.props.snackbarMessages);
    console.log("chamber name: ", this.props.snackbarChamberName);

    let fullMessage;
    let errorPresent = false;
    if (this.props.snackbarMessages.length > 0) {
      errorPresent = true;
      // fullMessage = this.props.snackbarMessages.map((v) => "chamber " + this.props.snackbarChamberName + " " + v );
      // console.log("fullMessage", fullMessage );
    }
    return (
      <div className="App">
        <Navbar />
        {/* {this.props.errorMessage && */}
          {/* <ErrorMessageDisplay errorMessage={this.props.errorMessage} */}
                               {/* errorClass="error-message" /> */}
       {/* } */}
        {/* <button onClick={this.testErr}>testErr</button> */}
        {errorPresent &&
       <SnackbarMessage errorClass="test-setup-error" />          
        }
        <PageDisplay />
      </div>
    );
  }
}

const mapDispatchToProps = dispatch => bindActionCreators({ 
  setTestSetupError,
  setError  
}, dispatch)

// export default App;

export default withRouter(connect(
  mapStateToProps, 
  mapDispatchToProps
)(App));
