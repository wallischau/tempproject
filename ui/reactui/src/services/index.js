import { combineReducers } from 'redux'
import { routerReducer } from 'react-router-redux'

import chambers from './chambers/reducer'
import configurations from './configurations/reducer'
import authentication from './authentication/reducer'
import playlist from './playlist/reducer'
import errorMessage from './error-handling/reducer'
import test_runs from './test-runs/reducer'
import firmwares from './firmwares/reducer'


export default combineReducers({
  router: routerReducer,
  chambers, 
  authentication,
  configurations, 
  errorMessage,  
  test_runs, 
  firmwares,
  playlist
})

