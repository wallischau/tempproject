import React, { Component } from 'react';
import { Route } from 'react-router-dom'

import ChamberStatus from '../../../pages/chamber-status'
import ChamberDetail from '../../chamber/chamber-detail'
import Login from '../../../pages/user-login'
import Results from '../../../pages/results'
import ResourceConfiguration from '../../../pages/resource-configuration'
import RegisterUser from '../../../pages/user-register'
import userProfile from '../user-profile'
import changePassword from '../change-password'
import Reports from '../../../pages/reports'


class PageDisplay extends Component {
  render() {
    return (
      <div className="PageDisplay">
        <Route path="/chamber-status/:make" component={ ChamberStatus } />
        <Route path="/chamber-status/:make/:name" component={ ChamberDetail } />
        <Route exact path="/login" component={ Login } />
        <Route exact path="/results" component={ Results } />
        <Route exact path="/configuration" component={ ResourceConfiguration } />
        <Route exact path="/register" component={ RegisterUser } />
        <Route exact path="/user-profile/password" component={ changePassword } />  
        <Route exact path="/user-profile" component={ userProfile } />
        <Route exact path="/reports" component={ Reports } />
      </div>
    );
  }
}

export default PageDisplay;
