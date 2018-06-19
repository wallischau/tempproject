import { actions } from './actions'

const initialState = {
  test_runs: [], 
  test_runs_request_pending: false
}

export default (state = initialState, action) => {
  switch (action.type) {
    case actions.ADD_TEST_RUN_DATA: 
      return Object.assign({}, state, action.data, { test_runs_request_pending: false }) 

    case actions.REQUESTING_TEST_RUNS: 
      return Object.assign({}, state, { test_runs_request_pending: true })

    default:
      return state
  }
}
