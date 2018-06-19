import React from 'react';
import { render } from 'react-dom';
import { Provider } from 'react-redux'
import { ConnectedRouter } from 'react-router-redux'
import store, { history } from './store'
import App from './components/app';
import registerServiceWorker from './registerServiceWorker';
import './websocket';

import 'react-table/react-table.css';
import './style.css';


const root = document.getElementById('root');
window.Chart = require('chart.js');

render(
  <Provider store={ store }>
    <ConnectedRouter history={ history }>
      <App />
    </ConnectedRouter>
  </Provider>,
  root
);
registerServiceWorker();
